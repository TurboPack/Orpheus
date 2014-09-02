{*********************************************************}
{*                O32IGridEditor.PAS 4.00                *}
{*     Copyright (c) 1995-2001 TurboPower Software Co    *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$I OVC.INC}

{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$X+} {Extended Syntax}

unit ExIGrid1U;
  { Component editor and property editors for the Inspector Grid }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, o32flxbn, O32IGrid, ovcbase, ovcvlb, ovcoutln, ExtCtrls,
  ComCtrls, ovcftcbx, ovccmbx, ovcclrcb, ovcef, ovcsf, ovccal, CheckLst, ovcsc,
  ImgList;


type
  TIGridForm = class(TForm)
    Button1: TButton;
    StringPanel: TPanel;
    O32FlexButton1: TO32FlexButton;
    IntegerPanel: TPanel;
    FloatPanel: TPanel;
    ColorPanel: TPanel;
    FontPanel: TPanel;
    ListPanel: TPanel;
    SetPanel: TPanel;
    LogicalPanel: TPanel;
    DatePanel: TPanel;
    CurrencyPanel: TPanel;
    ParentPanel: TPanel;
    CaptionEdit: TEdit;
    Label1: TLabel;
    ParentDisplayTextEdit: TEdit;
    Label2: TLabel;
    ParentVisible: TCheckBox;
    PVCLabel: TLabel;
    PHCLabel: TLabel;
    PCCLabel: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    ParentChildCount: TLabel;
    ParentVisibleChildren: TLabel;
    ParentHiddenChildren: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    StringVisible: TCheckBox;
    StringDisplayText: TEdit;
    Label5: TLabel;
    Bevel3: TBevel;
    Label4: TLabel;
    SetVisible: TCheckBox;
    SetListbox: TCheckListBox;
    Bevel4: TBevel;
    Label6: TLabel;
    LogicalVisible: TCheckBox;
    LogicalValue: TComboBox;
    Label8: TLabel;
    Bevel5: TBevel;
    Label9: TLabel;
    DateVisible: TCheckBox;
    Bevel6: TBevel;
    Label10: TLabel;
    CurrencyVisible: TCheckBox;
    Label11: TLabel;
    CurrencyEdit: TEdit;
    Bevel7: TBevel;
    Label12: TLabel;
    IntegerVisible: TCheckBox;
    Label13: TLabel;
    IntegerValue: TOvcSimpleField;
    Bevel8: TBevel;
    Label14: TLabel;
    FloatVisible: TCheckBox;
    Label15: TLabel;
    FloatValue: TOvcSimpleField;
    Bevel9: TBevel;
    Label16: TLabel;
    ColorVisible: TCheckBox;
    ColorCombo: TOvcColorComboBox;
    Label17: TLabel;
    Bevel10: TBevel;
    Label18: TLabel;
    FontVisible: TCheckBox;
    Label19: TLabel;
    FontCombo: TOvcFontComboBox;
    Bevel11: TBevel;
    Label20: TLabel;
    ListVisible: TCheckBox;
    Label21: TLabel;
    SetDisplayText: TLabel;
    ListItems: TComboBox;
    TreeView1: TTreeView;
    Image1: TImage;
    Label22: TLabel;
    OvcSpinner1: TOvcSpinner;
    DateCalendar: TMonthCalendar;
    Label23: TLabel;
    O32InspectorGrid1: TO32InspectorGrid;
    ImageList1: TImageList;
    Panel1: TPanel;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    SetItem: TEdit;
    procedure O32FlexButton1Click(Sender: TObject; Item: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SetChange(Sender: TObject);
    procedure ListItemsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure OvcSpinner1Click(Sender: TObject; State: TOvcSpinState;
      Delta: Double; Wrap: Boolean);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure O32InspectorGrid1ItemSelect(Sender: TObject; Item: Word);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SetItemKeyPress(Sender: TObject; var Key: Char);
    procedure SetListboxClickCheck(Sender: TObject);
    procedure SetListboxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListItemsChange(Sender: TObject);
  private { Private declarations }
    OutlineLoading: Boolean;
    ItemLoading: Boolean;
    Changed: Boolean;
    CurrentItem : TO32InspectorItem;
    procedure LoadOutline;
    procedure LoadChildrenOf(var Index: Integer; Node: TTreeNode);
    procedure LoadItem;
    procedure LoadImage;
    procedure UpdateItem;
    function GetChildCount: Integer;
  public { Public declarations }
  end;

var
  IGridForm: TIGridForm;

implementation
{$R *.DFM}

uses
  OvcUtils;

procedure TIGridForm.FormCreate(Sender: TObject);
begin
  CurrentItem := nil;
end;
{=====}

procedure TIGridForm.FormShow(Sender: TObject);
begin
  if O32InspectorGrid1.ItemCollection.VisibleItems.count > 0 then
    CurrentItem := O32InspectorGrid1.Items[O32InspectorGrid1.ActiveItem]
  else
    CurrentItem := nil;
  O32FlexButton1.ActiveItem := 3;
  LoadOutline;
  LoadItem;
  TreeView1.SetFocus;
end;
{=====}

procedure TIGridForm.O32FlexButton1Click(Sender: TObject; Item: Integer);
var
  Parent: TO32InspectorItem;
  NewItem: TO32InspectorItem;
  ParentNode: TTreeNode;
begin
  NewItem := nil;
  if (CurrentItem <> nil)
  and (CurrentItem.ItemType in [itSet, itParent]) then
    Parent := CurrentItem
  else
    Parent := nil;

  if (Parent <> nil)
  and (Parent.ItemType = itSet)
  and (Item <> Ord(itLogical)) then begin
    raise Exception.Create('Sets can only have Boolean children!');
    exit;
  end;

  case Item of
    Ord(itParent)   : begin
      if (Parent <> nil) and (Parent.ItemType = itSet) then begin
        raise Exception.Create('Cannot add a parent item as a child of a set!');
        exit;
      end else
       NewItem := O32InspectorGrid1.Add(itParent, Parent);
    end;

    Ord(itSet)      : NewItem := O32InspectorGrid1.Add(itSet, Parent);
    Ord(itList)     : NewItem := O32InspectorGrid1.Add(itList, Parent);
    Ord(itString)   : NewItem := O32InspectorGrid1.Add(itString, Parent);
    Ord(itInteger)  : NewItem := O32InspectorGrid1.Add(itInteger, Parent);
    Ord(itFloat)    : NewItem := O32InspectorGrid1.Add(itFloat, Parent);
    Ord(itCurrency) : NewItem := O32InspectorGrid1.Add(itCurrency, Parent);
    Ord(itDate)     : NewItem := O32InspectorGrid1.Add(itDate, Parent);
    Ord(itColor)    : NewItem := O32InspectorGrid1.Add(itColor, Parent);
    Ord(itLogical)  : NewItem := O32InspectorGrid1.Add(itLogical, Parent);
    Ord(itFont)     : NewItem := O32InspectorGrid1.Add(itFont, Parent);
  end;

  if Parent <> nil then begin
    ParentNode := TreeView1.Items.Item[NewItem.ParentIndex];
    TreeView1.Items.AddChild(ParentNode, NewItem.Caption);
  end else begin
    TreeView1.Items.Add(nil, NewItem.Caption);
  end;

  TreeView1.SetFocus;
end;
{=====}

procedure TIGridForm.LoadOutline;
var
  I: Integer;
  CurrentNode: TTreeNode;
  ItemText: string;
begin
  OutlineLoading := true;
  CurrentNode := nil;

  if TreeView1.Items.Count > 0 then
    CurrentNode := TreeView1.Items.Item[CurrentItem.Index];

  TreeView1.Items.Clear;
  I := 0;
  While I < O32InspectorGrid1.ItemCollection.Count do begin
    ItemText := O32InspectorGrid1.Items[I].Caption;
    if ItemText = '' then
      ItemText := O32InspectorGrid1.Items[I].Name;
    LoadChildrenOf(I, Treeview1.Items.Add(nil, ItemText));
    I := TreeView1.Items.Count;
  end;

  if CurrentNode <> nil then
    TreeView1.Selected := CurrentNode;
  OutlineLoading := false;
end;
{=====}

procedure TIGridForm.LoadChildrenOf(var Index: Integer; Node: TTreeNode);
var
  I: Integer;
  ItemText: string;
  NewNode: TTreeNode;
begin
  if O32InspectorGrid1.Items[Index].ItemType in [itSet, itParent] then begin
    I := Index + 1;
    while I < O32InspectorGrid1.ItemCollection.Count do begin
      if O32InspectorGrid1.Items[I].ParentIndex = Index then begin
        ItemText := O32InspectorGrid1.Items[I].Caption;

        if ItemText = '' then
          ItemText := O32InspectorGrid1.Items[I].Name;
        NewNode := Treeview1.Items.AddChild(Node, ItemText);
        if O32InspectorGrid1.Items[I].ItemType in [itSet, itParent] then
          LoadChildrenOf(I, NewNode);
      end;
      Inc(I);
    end;
    Index := TreeView1.Items.Count -1;
  end;
end;
{=====}

procedure TIGridForm.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TIGridForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if OutlineLoading then Exit;

  if CurrentItem <> O32InspectorGrid1.Items[Node.AbsoluteIndex] then begin
    { Update the changed data in the item we're leaving }
    if CurrentItem <> nil then UpdateItem;
    { change to the newly selected item }
    CurrentItem := O32InspectorGrid1.Items[Node.AbsoluteIndex];
    { load its editor fields. }
    LoadItem;
  end;
end;
{=====}

procedure TIGridForm.LoadItem;
var
  Num, I: Integer;
  TmpItem: TO32InspectorItem;
begin
  ItemLoading := true;

  if CurrentItem = nil then exit;

  { Hide all of the panels }
  StringPanel.Visible := false;
  ParentPanel.Visible := false;
  IntegerPanel.Visible := false;
  FloatPanel.Visible := false;
  ColorPanel.Visible := false;
  FontPanel.Visible := false;
  ListPanel.Visible := false;
  SetPanel.Visible := false;
  LogicalPanel.Visible := false;
  DatePanel.Visible := false;
  CurrencyPanel.Visible := false;

  CaptionEdit.Text := CurrentItem.Caption;
  LoadImage;

  { Show the right panel and load it }
  case CurrentItem.ItemType of
    itParent    : begin
      ParentPanel.Visible := true;
      Num := GetChildCount;
      ParentChildCount.Caption := IntToStr(Num);
      ParentVisibleChildren.Caption := IntToStr(CurrentItem.ChildCount);
      ParentHiddenChildren.Caption := IntToStr(Num-CurrentItem.ChildCount);
      ParentDisplayTextEdit.Text := CurrentItem.DisplayText;
      ParentVisible.Checked := CurrentItem.Visible;
    end;

    itSet       : begin
      SetPanel.Visible:= true;
      SetListBox.Clear;
      SetVisible.Checked := CurrentItem.Visible;
      for I := 0 to O32InspectorGrid1.ItemCollection.Count - 1 do begin
        TmpItem := TO32InspectorItem(O32InspectorGrid1.ItemCollection.Items[I]);
        if TmpItem.Parent = CurrentItem then begin
          Num := SetListBox.Items.Add(TmpItem.Caption);
          SetListBox.Checked[Num] := TmpItem.AsBoolean;
        end;
      end;
      SetDisplayText.Caption := CurrentItem.AsString;
    end;

    itList      : begin
      ListPanel.Visible:= true;
      ListVisible.Checked := CurrentItem.Visible;
      ListItems.Items := CurrentItem.ItemsList;
      ListItems.ItemIndex := ListItems.Items.IndexOf(CurrentItem.AsString);
    end;

    itString    : begin
      StringPanel.Visible:= true;
      StringVisible.Checked := CurrentItem.Visible;
      StringDisplayText.Text := CurrentItem.AsString;
    end;

    itInteger   : begin
      IntegerPanel.Visible:= true;
      IntegerVisible.Checked := CurrentItem.Visible;
      IntegerValue.AsInteger := CurrentItem.AsInteger;
    end;

    itFloat     : begin
      FloatPanel.Visible:= true;
      FloatVisible.Checked := CurrentItem.Visible;
      FloatValue.AsFloat := CurrentItem.AsFloat;
    end;

    itCurrency  : begin
      CurrencyPanel.Visible:= true;
      CurrencyVisible.Checked := CurrentItem.Visible;
      CurrencyEdit.Text := CurrentItem.AsString;
    end;

    itDate      : begin
      DatePanel.Visible:= true;
      DateVisible.Checked := CurrentItem.Visible;
      DateCalendar.Date := CurrentItem.AsDate;
    end;

    itColor     : begin
    ColorPanel.Visible:= true;
    ColorVisible.Checked := CurrentItem.Visible;
    ColorCombo.SelectedColor := CurrentItem.AsColor;
    end;

    itLogical   : begin
      LogicalPanel.Visible:= true;
      LogicalVisible.Checked := CurrentItem.Visible;
      if CurrentItem.AsBoolean then
        LogicalValue.ItemIndex := LogicalValue.Items.IndexOf('True')
      else
        LogicalValue.ItemIndex := LogicalValue.Items.IndexOf('False');
    end;

    itFont      : begin
      FontPanel.Visible:= true;
      FontVisible.Checked := CurrentItem.Visible;
      FontCombo.FontName := CurrentItem.AsString;
    end;
  end;
  ItemLoading := false;
end;
{=====}

function TIGridForm.GetChildCount: Integer;
var
  I : Integer;
begin
  Result := 0;
  for I := 0 to O32InspectorGrid1.ItemCollection.Count - 1 do
    if TO32InspectorItem(O32InspectorGrid1.ItemCollection.Items[I]).Parent = CurrentItem
    then Inc(Result);
end;
{=====}

procedure TIGridForm.UpdateItem;
var
  I: Integer;
  NewItem: TO32InspectorItem;
begin
  CaptionEdit.ReadOnly := false;
  CaptionEdit.TabStop := true;

  if Changed then begin
    case CurrentItem.ItemType of
      itParent    : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := ParentVisible.Checked;
        CurrentItem.DisplayText := ParentDisplayTextEdit.Text;
      end;

      itSet       : begin
        CaptionEdit.ReadOnly := true;
        CaptionEdit.TabStop := false;
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := SetVisible.Checked;
        CurrentItem.DeleteChildren;
        for I := 0 to pred(SetListBox.Items.Count) do begin
          NewItem := O32InspectorGrid1.Add(itLogical, CurrentItem);
          NewItem.Caption := SetListBox.Items.Strings[I];
          NewItem.AsBoolean := SetListBox.Checked[I];
        end;
      end;

      itList      : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := ListVisible.Checked;
        CurrentItem.ItemsList.Assign(ListItems.Items);
        CurrentItem.AsString := ListItems.Text;
      end;

      itString    : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := StringVisible.Checked;
        CurrentItem.AsString := StringDisplayText.Text;
      end;

      itInteger   : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := IntegerVisible.Checked;
        CurrentItem.AsInteger := IntegerValue.AsInteger;
      end;

      itFloat     : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := FloatVisible.Checked;
        CurrentItem.AsFloat := FloatValue.AsFloat;
      end;

      itCurrency  : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := CurrencyVisible.Checked;
        CurrentItem.AsString := CurrencyEdit.Text;
      end;

      itDate      : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := DateVisible.Checked;
        CurrentItem.AsDate := DateCalendar.Date;
      end;

      itColor     : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := ColorVisible.Checked;
        CurrentItem.AsColor := ColorCombo.SelectedColor;
      end;

      itLogical   : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := LogicalVisible.Checked;
        CurrentItem.AsBoolean := LogicalValue.Text = 'True';
      end;

      itFont      : begin
        CurrentItem.Caption := CaptionEdit.Text;
        TreeView1.Items.Item[CurrentItem.Index].Text := CurrentItem.Caption;
        CurrentItem.Visible := FontVisible.Checked;
        CurrentItem.AsFont.Name := FontCombo.FontName;
      end;
    end;
    O32InspectorGrid1.Invalidate;
    Changed := false;
  end;
end;
{=====}

procedure TIGridForm.SetChange(Sender: TObject);
begin
  if not ItemLoading then
    Changed := true;
end;
{=====}

procedure TIGridForm.ListItemsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    if (ListItems.Text <> '')
    and (ListItems.Items.IndexOf(ListItems.Text) = -1) then begin
      ListItems.Items.Add(ListItems.Text);
      ListItems.SelectAll;
      Changed := true;
    end;
  end

  else if Key = VK_DELETE then begin
    ListItems.Items.Delete(ListItems.ItemIndex);
    ListItems.ItemIndex := -1;
    ListItems.Text := '';
    Changed := true;
  end;

  UpdateItem;
end;
{=====}

procedure TIGridForm.TreeView1KeyPress(Sender: TObject; var Key: Char);
begin
{$IFDEF UNICODE}
  if CharInSet(Key, ['A'..'Z', 'a'..'z', '0'..'1']) then begin
{$ELSE}
  if Key in ['A'..'Z', 'a'..'z', '0'..'1'] then begin
{$ENDIF}
    CaptionEdit.SetFocus;
    CaptionEdit.Text := Key;
    Key := #0;
    CaptionEdit.SelStart := Length(CaptionEdit.Text);
  end;
end;
{=====}

procedure TIGridForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and Changed then begin
    Key := #0;
    UpdateItem;
    LoadItem;
  end;
end;
{=====}

procedure TIGridForm.OvcSpinner1Click(Sender: TObject;
  State: TOvcSpinState; Delta: Double; Wrap: Boolean);
var
  Top: Integer;
begin
  if (O32InspectorGrid1.Images <> nil)
  and (CurrentItem <> nil) then begin
    Top := O32InspectorGrid1.Images.Count - 1;
    if (State = ssUpBtn) then begin
      if (CurrentItem.ImageIndex = Top) then
        CurrentItem.ImageIndex := 0
      else
        CurrentItem.ImageIndex := CurrentItem.ImageIndex + Trunc(Delta);
    end

    else if (State = ssDownBtn) then begin
      if (CurrentItem.ImageIndex <= 0) then
        CurrentItem.ImageIndex := Top
      else
        CurrentItem.ImageIndex := CurrentItem.ImageIndex - Trunc(Delta);
    end;
    Changed := true;
    UpdateItem;
    LoadImage;
  end;
end;
{=====}

procedure TIGridForm.SpeedButton1Click(Sender: TObject);
begin
  CurrentItem.ImageIndex := -1;
  LoadImage;
end;
{=====}

procedure TIGridForm.LoadImage;
var
  BMP: TBitmap;
  TransColor: TColor;
  r, c: Integer;
begin
  if CurrentItem.ImageIndex > -1 then begin
    Bmp := TBitmap.Create;
    try
      O32InspectorGrid1.Images.GetBitmap(CurrentItem.ImageIndex, Bmp);
      { fix transparent color }
      TransColor := Bmp.Canvas.Pixels[0, Bmp.Height - 1];

      for r := 0 to Bmp.Height - 1 do
        for c := 0 to Bmp.Width - 1 do
          if Bmp.Canvas.Pixels[c, r] = TransColor then
            Bmp.Canvas.Pixels[c, r] := Self.Color;
      Image1.Picture.Bitmap.Assign(BMP);
      Label22.Caption := 'Image ' + IntToStr(CurrentItem.ImageIndex) + ' of '
        + IntToStr(O32InspectorGrid1.Images.Count - 1);
    finally
      Bmp.Free;
    end;
  end else begin
    Image1.Picture := nil;
    Label22.Caption := 'Image';
  end;
end;
{=====}

procedure TIGridForm.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
    { Delete the InspectorGrid Item. }
    O32InspectorGrid1.Delete(CurrentItem.Index);
    { Delete the TreeView Item. }
    TreeView1.Items.Delete(TreeView1.Selected);
  end;
end;

procedure TIGridForm.O32InspectorGrid1ItemSelect(Sender: TObject;
  Item: Word);
begin
  TreeView1.Selected := TreeView1.Items.Item[O32InspectorGrid1.ActiveItem];
  LoadItem;
end;

procedure TIGridForm.SetItemKeyPress(Sender: TObject; var Key: Char);
var
  NewItem: Integer;
begin
  if (Key = #13) then begin
    Key := #0;
    if (SetListBox.Items.IndexOf(SetItem.Text) = -1) then begin
      NewItem := SetListBox.Items.Add(SetItem.Text);
      SetlistBox.Checked[NewItem] := true;
      Changed := true;
      TreeView1.Items.AddChild(TreeView1.Selected,
        SetListBox.Items.Strings[NewItem]);
      UpdateItem;
      LoadItem;
      SetItem.SetFocus;
    end;
  end;
end;

procedure TIGridForm.SetListboxClickCheck(Sender: TObject);
var
  Num, I: Integer;
  Tmp: String;
begin
  Num := SetListBox.ItemIndex;
  Tmp := '[';
  for I := 0 to pred(SetListBox.Items.Count) do begin
    if SetListBox.Checked[I] then
      Tmp := Tmp + SetListBox.Items.Strings[I] + ', ';
  end;
  StripCharFromEnd(' ', Tmp);
  StripCharFromEnd(',', Tmp);
  StripCharFromEnd(' ', Tmp);
  SetDisplayText.Caption := Tmp + ']';

  SetListBox.SetFocus;
  if Num > Pred(SetListBox.Items.Count) then
    SetListBox.ItemIndex := Pred(SetListBox.Items.Count)
  else
    SetListBox.ItemIndex := Num;

  Changed := true;
  UpdateItem;
end;

procedure TIGridForm.SetListboxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
  Num: Integer;
begin
  Num := SetListBox.ItemIndex;
  if Key = VK_DELETE then begin
    { Find and delete corresponding node }
    for I := 0 to TreeView1.Items.Count do begin
      if (TreeView1.Items.Item[I].Parent = TreeView1.Selected)
      and (TreeView1.Items.Item[I].Text
        = SetListBox.Items.Strings[SetListBox.ItemIndex]) then
      begin
        TreeView1.Items.Delete(TreeView1.Items.Item[I]);
        Break;
      end;
    end;
    SetListBox.Items.Delete(SetListBox.ItemIndex);
    Changed := true;
    UpdateItem;
    LoadItem;
    SetListBox.SetFocus;
    if Num > Pred(SetListBox.Items.Count) then
      SetListBox.ItemIndex := Pred(SetListBox.Items.Count)
    else
      SetListBox.ItemIndex := Num;
  end;
end;

procedure TIGridForm.ListItemsChange(Sender: TObject);
begin
  SetChange(Sender);
  if Changed then begin
    UpdateItem;
  end;
end;

end.


