{*********************************************************}
{*                  OVCDBADG.PAS 4.06                    *}
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

{$IFDEF VERSION6}
  {$WARN UNIT_PLATFORM OFF}
  { FileCtrl is a platform-dependent unit in Delphi 6 and I don't know what }
  { to replace it with yet. -PHB}
{$ENDIF}

unit ovcdbadg;
  {-Alias selection dialog}

interface

uses
  Windows, Classes, Controls, ExtCtrls, Forms, SysUtils,
  DBTables, OvcConst, OvcData, OvcExcpt, OvcDlg,
  FileCtrl, Dialogs, StdCtrls;


type
  TOvcfrmAliasDlg = class(TForm)
    btnHelp: TButton;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edTableName: TEdit;
    cbAliasList: TComboBox;
    FileListBox1: TFileListBox;
    OpenDialog1: TOpenDialog;
    btnBrowse: TButton;
    procedure edTableNameChange(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure cbAliasListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
  public
    FTableName : string;
    FAliasName : string;
  end;

type
  TOvcDbAliasDialog = class(TOvcBaseDialog)
  protected {private}
    {property variables}
    FAliasName : string;
    FTableName : string;

    {property variables}
    function GetPath : string;
    function GetTableName : string;

  public
    constructor Create(AOwner : TComponent);
      override;
    function Execute : Boolean;
      override;

  published
    {properties}
    property Caption;
    property Font;
    property Icon;
    property Options;
    property Placement;

    property AliasName : string
      read FAliasName write FAliasName;
    property Path : string
      read GetPath;
    property TableName : string
      read GetTableName;

    {events}
    property OnHelpClick;
  end;

function ExpandAlias(const Alias : string) : string;


implementation

{$R *.DFM}

function ExpandAlias(const Alias : string) : string;
var
  I         : Integer;
  AliasList : TStringList;
  ParamList : TStringList;
begin
  Result := '';
  if Alias > '' then begin
    {get a list of session aliases}
    AliasList := TStringList.Create;
    try
      Session.GetAliasNames(AliasList);
      for I := 0 to AliasList.Count-1 do
        if CompareText(Alias, AliasList[I]) = 0 then begin
          ParamList := TStringList.Create;
          try
            Session.GetAliasParams(AliasList[I], ParamList);
            Result := Trim(ParamList[0]);
            if Pos('PATH=', AnsiUpperCase(Result)) > 0 then
              Delete(Result, 1, 5) {remove PATH=}
            else
              Result := '';
            Break;
          finally
            ParamList.Free;
          end;
        end;
    finally
      AliasList.Free;
    end;
  end;
end;


{*** TOvcDbAliasDialog ***}

constructor TOvcDbAliasDialog.Create(AOwner : TComponent);
begin
{$IFDEF VERSION5}
  if not ((AOwner is TCustomForm) or (AOwner is TCustomFrame)) then
{$ELSE}
  if not (AOwner is TForm) then
{$ENDIF}
    raise EOvcException.Create(GetOrphStr(SCOwnerMustBeForm));

  inherited Create(AOwner);

  FPlacement.Height := 285;
  FPlacement.Width := 255;
end;

function TOvcDbAliasDialog.Execute : Boolean;
var
  F : TOvcfrmAliasDlg;
begin
  F := TOvcfrmAliasDlg.Create(Application);
  try
    DoFormPlacement(F);

    F.btnHelp.Visible := doShowHelp in Options;
    F.btnHelp.OnClick := FOnHelpClick;
    F.FAliasName := FAliasName;

    {show the memo form}
    Result := F.ShowModal = mrOK;
    if Result then begin
      FAliasName := F.FAliasName;
      FTableName := F.FTableName;
    end;

  finally
    F.Free;
  end;
end;

function TOvcDbAliasDialog.GetPath : string;
begin
  if FAliasName > '' then
    Result := ExpandAlias(FAliasName)
  else if FTableName > '' then
    Result := ExtractFilePath(FTableName)
  else
    Result := '';
end;

function TOvcDbAliasDialog.GetTableName : string;
begin
  Result := ExtractFileName(FTableName);
end;


{*** TOvcfrmAliasDlg ***}

procedure TOvcfrmAliasDlg.btnBrowseClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    FTableName := OpenDialog1.FileName;
    edTableName.Text := ExtractFileName(FTableName);
    FAliasName := '';
  end;
end;

procedure TOvcfrmAliasDlg.cbAliasListChange(Sender: TObject);
var
  I     : Integer;
  AList : TStringList;
  S     : string;
begin
  I := cbAliasList.ItemIndex;
  if I > -1 then begin
    AList := TStringList.Create;
    try
      FAliasName := cbAliasList.Items[I];
      Session.GetAliasParams(FAliasName, AList);
      S := Trim(AList[0]);
      if Pos('PATH=', AnsiUpperCase(S)) > 0 then begin
        Delete(S, 1, 5); {remove PATH=}
        try
          {force update of file names by altering dir}
          if FileListBox1.Directory = S then
            FileListBox1.Directory := '\';
          FileListBox1.Directory := S;
        except
          {ignore errors}
        end;
      end else begin
        FileListBox1.Directory := '';
        FileListBox1.Clear;
      end;
    finally
      AList.Free;
    end;
    edTableName.Text := '';
    FileListBox1.ItemIndex := -1;
  end;
end;

procedure TOvcfrmAliasDlg.edTableNameChange(Sender: TObject);
begin
  btnOK.Enabled := FileExists(FTableName);
end;

procedure TOvcfrmAliasDlg.FileListBox1Change(Sender: TObject);
begin
  FTableName := FileListBox1.FileName;
  edTableName.Text := ExtractFileName(FTableName);
end;

procedure TOvcfrmAliasDlg.FileListBox1DblClick(Sender: TObject);
begin
  if btnOk.Enabled then
    ModalResult := mrOk;
end;

procedure TOvcfrmAliasDlg.FormCreate(Sender: TObject);
begin
  {get a list of session aliases}
  Session.GetAliasNames(cbAliasList.Items);
end;

procedure TOvcfrmAliasDlg.FormShow(Sender: TObject);
var
  I : Integer;
begin
  I := cbAliasList.Items.IndexOf(FAliasName);
  if I > -1 then begin
    cbAliasList.ItemIndex := I;
    cbAliasListChange(nil);
  end;
end;

end.
