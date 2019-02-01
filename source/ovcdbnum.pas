{*********************************************************}
{*                   OVCDBNUM.PAS 4.06                  *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Orpheus                                    *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C)1995-2002    *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{.W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

unit ovcdbnum;
  {-Data aware number edit field w/ popup calculator}

interface

uses
  Windows, Classes, Controls, Db, DbConsts, DbCtrls, Forms, Graphics,
  Messages, OvcEdClc, OvcEdPop, OvcEditF;

type
  TOvcCustomDbNumberEdit = class(TOvcCustomNumberEdit)
  

  protected {private}
    FAlignment  : TAlignment;
    FAutoUpdate : Boolean;
    FCanvas     : TControlCanvas;
    FDataLink   : TFieldDataLink;
    FFocused    : Boolean;

    {property methods}
    function GetDataField : string;
    function GetDataSource : TDataSource;
    function GetField : TField;
    function GetReadOnly : Boolean;
    procedure SetDataField(const Value : string);
    procedure SetDataSource(Value : TDataSource);
    procedure SetFocused(Value : Boolean);
    procedure SetReadOnly(Value : Boolean);

    {internal methods}
    procedure DataChange(Sender : TObject);
    procedure EditingChange(Sender : TObject);
    function GetTextMargins : TPoint;
    procedure UpdateData(Sender : TObject);

    {message methods}
    procedure WMCut(var Message : TMessage);
      message WM_CUT;
    procedure WMPaste(var Message : TMessage);
      message WM_PASTE;
    procedure WMPaint(var Message : TWMPaint);
      message WM_PAINT;
    procedure CMEnter(var Message : TCMEnter);
      message CM_ENTER;
    procedure CMExit(var Message : TCMExit);
      message CM_EXIT;
    procedure CMGetDataLink(var Message : TMessage);
      message CM_GETDATALINK;

  protected
    procedure Change;
      override;
    function GetButtonEnabled : Boolean;
      override;
    procedure KeyDown(var Key : Word; Shift : TShiftState);
      override;
    procedure KeyPress(var Key : Char);
      override;
    procedure Notification(AComponent : TComponent; Operation : TOperation);
      override;


    {protected properties}
    property AutoUpdate : Boolean
      read FAutoUpdate
      write FAutoUpdate;

    property DataField : string
      read GetDataField
      write SetDataField;

    property DataSource : TDataSource
      read GetDataSource
      write SetDataSource;

  

    property ReadOnly : Boolean {hides ancestor's ReadOnly property}
      read GetReadOnly
      write SetReadOnly;

  public
    constructor Create(AOwner : TComponent);
      override;
    destructor Destroy;
      override;
    function ExecuteAction(Action: TBasicAction): Boolean;
      override;
    function UpdateAction(Action: TBasicAction): Boolean;
      override;

    procedure PopupClose(Sender : TObject);
      override;
    procedure PopupOpen;
      override;


    {public properties}
    property Field : TField
      read GetField;
  end;

  TOvcDbNumberEdit = class(TOvcCustomDbNumberEdit)
  published
    {properties}
    property Anchors;
    property Constraints;
    property DragKind;
    property About;
    property AllowIncDec;
    property AutoSelect;
    property AutoSize;
    property AutoUpdate;
    property BorderStyle;
    property ButtonGlyph;
    property Color;
    property Ctl3D;
    property Cursor;
    property DataField;
    property DataSource;
    property DragCursor;
    property DragMode;
    property Enabled;
    property LabelInfo;
    property Font;
    property HideSelection;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupAnchor;
    property PopupColors;
    property PopupFont;
    property PopupHeight;
    property PopupMenu;
    property PopupWidth;
    property ReadOnly;
    property ShowButton;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;

    {events}
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnPopupClose;
    property OnPopupOpen;
    property OnStartDrag;
  end;


implementation

uses
  SysUtils;

const
  NumFieldTypes : set of  TFieldType =
    [ftSmallInt, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD];


{*** TOvcCustomDbNumberEdit ***}

procedure TOvcCustomDbNumberEdit.Change;
begin
  FDataLink.Modified;

  inherited Change;
end;

procedure TOvcCustomDbNumberEdit.CMEnter(var Message : TCMEnter);
begin
  SetFocused(True);

  inherited;
end;

procedure TOvcCustomDbNumberEdit.CMExit(var Message : TCMExit);
begin
  if PopupActive then
    Exit;

  if AutoUpdate then begin
    try
      if Modified then
        FDataLink.UpdateRecord;
    except
      SelectAll;
      SetFocus;
      raise;
    end;
  end;
  SetFocused(False);
  DoExit;
end;

procedure TOvcCustomDbNumberEdit.CMGetDataLink(var Message : TMessage);
begin
  Message.Result := lResult(FDataLink);
end;

constructor TOvcCustomDbNumberEdit.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  inherited ReadOnly := True;
  ControlStyle := ControlStyle + [csReplicatable];
  FAutoUpdate := True;
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
end;

procedure TOvcCustomDbNumberEdit.DataChange(Sender : TObject);
var
  P : Integer;
  S : string;
begin
  if FDataLink.Field <> nil then begin
    if FAlignment <> FDataLink.Field.Alignment then begin
      FAlignment := FDataLink.Field.Alignment;
      Text := '';
    end;
    if FDataLink.Field.DataType in NumFieldTypes then begin
      if FFocused and FDataLink.CanModify then
        Text := FDataLink.Field.Text
      else
        Text := FDataLink.Field.DisplayText;
    end else begin
      S := FDataLink.Field.ClassName;
      S[1] := '(';
      P := Pos('Field', S);
      if P > 0 then begin
        S[P] := ')';
        setlength(s,p);
        //S[0] := Char(P);
      end else
        S := Concat(S, ')');
      Text := S;
    end;
  end else begin
    FAlignment := taLeftJustify;
    if csDesigning in ComponentState then
      Text := Name
    else
      Text := '';
  end;
end;

destructor TOvcCustomDbNumberEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;

  FCanvas.Free;
  FCanvas := nil;

  inherited Destroy;
end;

procedure TOvcCustomDbNumberEdit.EditingChange(Sender : TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
  FButton.Enabled := GetButtonEnabled;
end;

function TOvcCustomDbNumberEdit.GetButtonEnabled : Boolean;
begin
  Result := (FDataLink <> nil) and (FDataLink.DataSource <> nil) and
    (FDataLink.Editing or FDataLink.DataSource.AutoEdit) or
    (csDesigning in ComponentState);
end;

function TOvcCustomDbNumberEdit.GetDataField : string;
begin
  Result := FDataLink.FieldName;
end;

function TOvcCustomDbNumberEdit.GetDataSource : TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TOvcCustomDbNumberEdit.GetField : TField;
begin
  Result := FDataLink.Field;
end;

function TOvcCustomDbNumberEdit.GetReadOnly : Boolean;
begin
  Result := FDataLink.ReadOnly;
  if FDataLink.Field <> nil then
    if not (FDataLink.Field.DataType in NumFieldTypes) then
      Result := True;
end;

function TOvcCustomDbNumberEdit.GetTextMargins : TPoint;
var
  DC         : HDC;
  SaveFont   : HFont;
  I          : Integer;
  SysMetrics : TTextMetric;
  Metrics    : TTextMetric;
begin
  if NewStyleControls then begin
    if BorderStyle = bsNone then
      I := 0
    else if Ctl3D then
      I := 1
    else
      I := 2;
    Result.X := SendMessage(Handle, EM_GETMARGINS, 0, 0) and $0000FFFF + I;
    Result.Y := I;
  end else begin
    if BorderStyle = bsNone then
      I := 0
    else begin
      DC := GetDC(0);
      GetTextMetrics(DC, SysMetrics);
      SaveFont := SelectObject(DC, Font.Handle);
      GetTextMetrics(DC, Metrics);
      SelectObject(DC, SaveFont);
      ReleaseDC(0, DC);
      I := SysMetrics.tmHeight;
      if I > Metrics.tmHeight then
        I := Metrics.tmHeight;
      I := I div 4;
    end;
    Result.X := I;
    Result.Y := I;
  end;
end;

procedure TOvcCustomDbNumberEdit.KeyDown(var Key : Word; Shift : TShiftState);
begin
  inherited KeyDown(Key, Shift);

  {start edit mdoe if cutting or pasting}
  if (Key = VK_DELETE) or ((Key = VK_INSERT) and (ssShift in Shift)) then
    FDataLink.Edit;
end;

procedure TOvcCustomDbNumberEdit.KeyPress(var Key : Char);
begin
  if AllowIncDec and CharInSet(Key, ['+', '-']) then
    FDataLink.Edit;

  inherited KeyPress(Key);

  if CharInSet(Key, [#32..#255]) and (FDataLink.Field <> nil) and
     not FDataLink.Field.IsValidChar(Key) then begin
    MessageBeep(0);
    Key := #0;
  end;

  case Key of
    ^H, ^V, ^X, #32..#255 :
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
        Key := #0;
      end;
  end;
end;

procedure TOvcCustomDbNumberEdit.Notification(AComponent : TComponent; Operation : TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) then begin
    if (FDataLink <> nil) and (AComponent = DataSource) then
      DataSource := nil
  end;
end;

procedure TOvcCustomDbNumberEdit.PopupClose(Sender : TObject);
begin
  inherited PopupClose(Sender);

  {allow control to see focus change that was blocked when popup became active}
  if not Focused then
    Perform(CM_EXIT, 0, 0);
end;

procedure TOvcCustomDbNumberEdit.PopupOpen;
begin
  inherited PopupOpen;

  {enter edit mode}
  FDataLink.Edit;
end;

procedure TOvcCustomDbNumberEdit.SetDataField(const Value : string);
begin
  try
    FDataLink.FieldName := Value;
  except
    FDataLink.FieldName := '';
    raise;
  end;
end;

procedure TOvcCustomDbNumberEdit.SetDataSource(Value : TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then
    Value.FreeNotification(Self);
end;

procedure TOvcCustomDbNumberEdit.SetFocused(Value : Boolean);
begin
  if FFocused <> Value then begin
    FFocused := Value;
    if (FAlignment <> taLeftJustify) then
      Invalidate;
    FDataLink.Reset;
  end;
end;

procedure TOvcCustomDbNumberEdit.SetReadOnly(Value : Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

procedure TOvcCustomDbNumberEdit.UpdateData(Sender : TObject);
begin
  FDataLink.Field.Text := Text;
end;

procedure TOvcCustomDbNumberEdit.WMCut(var Message : TMessage);
begin
  FDataLink.Edit;

  inherited;
end;

procedure TOvcCustomDbNumberEdit.WMPaint(var Message : TWMPaint);
var
  Left    : Integer;
  Margins : TPoint;
  R       : TRect;
  DC      : HDC;
  PS      : TPaintStruct;
  S       : string;
begin
  if ((FAlignment = taLeftJustify) or FFocused) and not (csPaintCopy in ControlState) then begin
    inherited;
    Exit;
  end;

  {draw right and center justify manually unless the edit has the focus}
  if FCanvas = nil then begin
    FCanvas := TControlCanvas.Create;
    FCanvas.Control := Self;
  end;
  DC := Message.DC;
  if DC = 0 then
    DC := BeginPaint(Handle, PS);
  FCanvas.Handle := DC;
  try
    FCanvas.Font := Font;
    with FCanvas do begin
      R := ClientRect;
      if not (NewStyleControls and Ctl3D) and (BorderStyle = bsSingle) then begin
        Brush.Color := clWindowFrame;
        FrameRect(R);
        InflateRect(R, -1, -1);
      end;
      Brush.Color := Color;
      if (csPaintCopy in ControlState) and (FDataLink.Field <> nil) then begin
        S := FDataLink.Field.DisplayText;
      end else
        S := Text;
      if PasswordChar <> #0 then FillChar(S[1], Length(S), PasswordChar);
      Margins := GetTextMargins;
      case FAlignment of
        taLeftJustify  : Left := Margins.X;
        taRightJustify : Left := ClientWidth - TextWidth(S) - Margins.X - 2 - GetButtonWidth;
      else
        Left := (ClientWidth - TextWidth(S)) div 2;
      end;
      TextRect(R, Left, Margins.Y, S);
    end;
  finally
    FCanvas.Handle := 0;
    if Message.DC = 0 then
      EndPaint(Handle, PS);
  end;
end;

procedure TOvcCustomDbNumberEdit.WMPaste(var Message : TMessage);
begin
  FDataLink.Edit;

  inherited;
end;

function TOvcCustomDbNumberEdit.ExecuteAction(Action : TBasicAction) : Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TOvcCustomDbNumberEdit.UpdateAction(Action : TBasicAction) : Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;

end.
