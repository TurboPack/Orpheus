{$J+} {Writable constants}

unit ExDbTbU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcDbTbl, OvcBase, OvcEF, OvcPB, OvcPF, OvcDbPF, StdCtrls, DB, DBTables,
  OvcTCmmn, OvcTCell, OvcTCStr, OvcTCEdt, Buttons, Grids, DBGrids, OvcTable,
  OvcEditU, OvcEdit, ExtCtrls, DBCtrls, OvcTCBEF, OvcTCPic, OvcTGPns,
  OvcTCHdr, OvcTCBmp, OvcTCGly, OvcTCBox, OvcTCCBx, OvcTCIco, OvcTCNum,
  OvcTCSim, OvcSF, OvcDate;

type
  TForm1 = class(TForm)
    OvcController1: TOvcController;
    TB: TOvcDbTable;
    Table1: TTable;
    DataSource1: TDataSource;
    Table2: TTable;
    OvcTCColHead1: TOvcTCColHead;
    OvcTCString1: TOvcTCString;
    OvcTCPictureField1: TOvcTCPictureField;
    OvcTCCheckBox1: TOvcTCCheckBox;
    OvcTCComboBox1: TOvcTCComboBox;
    OvcTCSimpleField1: TOvcTCSimpleField;
    OvcTCNumericField1: TOvcTCNumericField;
    OvcTCBitMap1: TOvcTCBitMap;
    OvcTCGlyph1: TOvcTCGlyph;
    cbAllowMove: TCheckBox;
    cbAllowSize: TCheckBox;
    cbAlwaysEditing: TCheckBox;
    cbCellsPaintText: TCheckBox;
    cbEnterToTab: TCheckBox;
    cbHighlightRow: TCheckBox;
    cbIntegralHeight: TCheckBox;
    cbPageScroll: TCheckBox;
    cbShowHeader: TCheckBox;
    cbShowIndicators: TCheckBox;
    cbShowPictures: TCheckBox;
    cbStretchPictures: TCheckBox;
    cbTableActive: TCheckBox;
    cbTable1: TCheckBox;
    cbTable2: TCheckBox;
    cbUseHeaderCell: TCheckBox;
    cbUseLetters: TCheckBox;
    cbUseStrings: TCheckBox;
    cbVisible: TCheckBox;
    cbWantTabs: TCheckBox;
    cbWrapAtEnds: TCheckBox;
    sfLockedColumns: TOvcSimpleField;
    sfLeftColumn: TOvcSimpleField;
    sfActiveRow: TOvcSimpleField;
    sfActiveColumn: TOvcSimpleField;
    sfHeaderHeight: TOvcSimpleField;
    sfRowHeight: TOvcSimpleField;
    btnClose: TBitBtn;
    btnUpdate: TBitBtn;
    GroupBox1: TGroupBox;
    lblClicks: TLabel;
    procedure TBLockedCellClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure TBUnusedAreaClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure TBActiveCellChanged(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure TBIndicatorClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbAllowMoveClick(Sender: TObject);
    procedure cbAllowSizeClick(Sender: TObject);
    procedure cbAlwaysEditingClick(Sender: TObject);
    procedure cbCellsPaintTextClick(Sender: TObject);
    procedure cbEnterToTabClick(Sender: TObject);
    procedure cbHighlightRowClick(Sender: TObject);
    procedure cbIntegralHeightClick(Sender: TObject);
    procedure cbPageScrollClick(Sender: TObject);
    procedure cbShowHeaderClick(Sender: TObject);
    procedure cbShowIndicatorsClick(Sender: TObject);
    procedure cbShowPicturesClick(Sender: TObject);
    procedure cbStretchPicturesClick(Sender: TObject);
    procedure cbTableActiveClick(Sender: TObject);
    procedure cbTable1Click(Sender: TObject);
    procedure cbTable2Click(Sender: TObject);
    procedure cbUseHeaderCellClick(Sender: TObject);
    procedure cbUseLettersClick(Sender: TObject);
    procedure cbUseStringsClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure cbWantTabsClick(Sender: TObject);
    procedure cbWrapAtEndsClick(Sender: TObject);
    procedure sfActiveColumnExit(Sender: TObject);
    procedure sfActiveRowExit(Sender: TObject);
    procedure sfLeftColumnExit(Sender: TObject);
    procedure sfLockedColumnsExit(Sender: TObject);
    procedure sfHeaderHeightExit(Sender: TObject);
    procedure sfRowHeightExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnUpdateClick(Sender: TObject);
    procedure TBLeftColumnChanged(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateStatus;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.TBLockedCellClick(Sender: TObject; RowNum: Longint;
  ColNum: Integer);
begin
  lblClicks.Caption := Format('Locked cell click : %d,%d', [RowNum, ColNum]);
end;

procedure TForm1.TBUnusedAreaClick(Sender: TObject; RowNum: Longint;
  ColNum: Integer);
begin
  lblClicks.Caption := Format('Unused area click : %d,%d', [RowNum, ColNum]);
end;

procedure TForm1.TBIndicatorClick(Sender: TObject; RowNum: Longint;
  ColNum: Integer);
begin
  lblClicks.Caption := Format('Indicator click : %d,%d', [RowNum, ColNum]);
end;

procedure TForm1.TBActiveCellChanged(Sender: TObject; RowNum: Longint;
  ColNum: Integer);
begin
  UpdateStatus;
end;

procedure TForm1.UpdateStatus;
begin
  cbAllowMove.Checked := (dtoAllowColumnMove in TB.Options);
  cbAllowSize.Checked := (dtoAllowColumnSize in TB.Options);
  cbAlwaysEditing.Checked := (dtoAlwaysEditing in TB.Options);
  cbCellsPaintText.Checked := (dtoCellsPaintText in TB.Options);
  cbHighlightRow.Checked := (dtoHighlightActiveRow in TB.Options);
  cbIntegralHeight.Checked := (dtoIntegralHeight in TB.Options);
  cbShowHeader.Checked := (hoShowHeader in TB.HeaderOptions);
  cbShowIndicators.Checked := (dtoShowIndicators in TB.Options);
  cbShowPictures.Checked := (dtoShowPictures in TB.Options);
  cbStretchPictures.Checked := (dtoStretch in TB.Options);
  if (TB.DataSource <> nil) and (TB.DataSource.DataSet <> nil) then
    cbTableActive.Checked := TB.DataSource.DataSet.Active
  else
    cbTableActive.Checked := False;
  cbUseHeaderCell.Checked := (hoUseHeaderCell in TB.HeaderOptions);
  cbUseLetters.Checked := (hoUseLetters in TB.HeaderOptions);
  cbUseStrings.Checked := (hoUseStrings in TB.HeaderOptions);
  cbVisible.Checked := TB.Visible;
  cbWantTabs.Checked := (dtoWantTabs in TB.Options);
  cbWrapAtEnds.Checked := (dtoWrapAtEnds in TB.Options);
  cbTable1.Checked := (TB.DataSource.DataSet = Table1);
  cbTable2.Checked := (TB.DataSource.DataSet = Table2);
  sfActiveColumn.AsInteger := TB.ActiveColumn;
  sfActiveRow.AsInteger := TB.ActiveRow;
  sfHeaderHeight.AsInteger := TB.HeaderHeight;
  sfLeftColumn.AsInteger := TB.LeftColumn;
  sfLockedColumns.AsInteger := TB.LockedColumns;
  sfRowHeight.AsInteger := TB.RowHeight;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
(*
  if Key = #13 then begin
    Key := #0;
    btnUpdate.SetFocus;
    btnUpdate.Click;
  end;
*)
end;

procedure TForm1.cbAllowMoveClick(Sender: TObject);
begin
  if cbAllowMove.Checked then
    TB.Options := TB.Options + [dtoAllowColumnMove]
  else
    TB.Options := TB.Options - [dtoAllowColumnMove];
  UpdateStatus;
end;

procedure TForm1.cbAllowSizeClick(Sender: TObject);
begin
  if cbAllowSize.Checked then
    TB.Options := TB.Options + [dtoAllowColumnSize]
  else
    TB.Options := TB.Options - [dtoAllowColumnSize];
  UpdateStatus;
end;

procedure TForm1.cbAlwaysEditingClick(Sender: TObject);
begin
  if cbAlwaysEditing.Checked then
    TB.Options := TB.Options + [dtoAlwaysEditing]
  else
    TB.Options := TB.Options - [dtoAlwaysEditing];
  UpdateStatus;
end;

procedure TForm1.cbCellsPaintTextClick(Sender: TObject);
begin
  if cbCellsPaintText.Checked then
    TB.Options := TB.Options + [dtoCellsPaintText]
  else
    TB.Options := TB.Options - [dtoCellsPaintText];
  UpdateStatus;
end;

procedure TForm1.cbEnterToTabClick(Sender: TObject);
begin
  if cbEnterToTab.Checked then
    TB.Options := TB.Options + [dtoEnterToTab]
  else
    TB.Options := TB.Options - [dtoEnterToTab];
  UpdateStatus;
end;

procedure TForm1.cbHighlightRowClick(Sender: TObject);
begin
  if cbHighlightRow.Checked then
    TB.Options := TB.Options + [dtoHighlightActiveRow]
  else
    TB.Options := TB.Options - [dtoHighlightActiveRow];
  UpdateStatus;
end;

procedure TForm1.cbIntegralHeightClick(Sender: TObject);
begin
  if cbIntegralHeight.Checked then
    TB.Options := TB.Options + [dtoIntegralHeight]
  else
    TB.Options := TB.Options - [dtoIntegralHeight];
  UpdateStatus;
end;

procedure TForm1.cbPageScrollClick(Sender: TObject);
begin
  if cbPageScroll.Checked then
    TB.Options := TB.Options + [dtoPageScroll]
  else
    TB.Options := TB.Options - [dtoPageScroll];
  UpdateStatus;
end;

procedure TForm1.cbShowHeaderClick(Sender: TObject);
begin
  if cbShowHeader.Checked then
    TB.HeaderOptions := TB.HeaderOptions + [hoShowHeader]
  else
    TB.HeaderOptions := TB.HeaderOptions - [hoShowHeader];
  UpdateStatus;
end;

procedure TForm1.cbShowIndicatorsClick(Sender: TObject);
begin
  if cbShowIndicators.Checked then
    TB.Options := TB.Options + [dtoShowIndicators]
  else
    TB.Options := TB.Options - [dtoShowIndicators];
  UpdateStatus;
end;

procedure TForm1.cbShowPicturesClick(Sender: TObject);
begin
  if cbShowPictures.Checked then
    TB.Options := TB.Options + [dtoShowPictures]
  else
    TB.Options := TB.Options - [dtoShowPictures];
  UpdateStatus;
end;

procedure TForm1.cbStretchPicturesClick(Sender: TObject);
begin
  if cbStretchPictures.Checked then
    TB.Options := TB.Options + [dtoStretch]
  else
    TB.Options := TB.Options - [dtoStretch];
  UpdateStatus;
end;

procedure TForm1.cbTableActiveClick(Sender: TObject);
begin
  if (TB.DataSource <> nil) and (TB.DataSource.DataSet <> nil) then
    TB.DataSource.DataSet.Active := cbTableActive.Checked;
  UpdateStatus;
end;

procedure TForm1.cbTable1Click(Sender: TObject);
begin
  if (TB.DataSource <> nil) and (cbTable1.Checked) then begin
    cbTable2.Checked := False;
    TB.RowHeight := 20;
    TB.DataSource.DataSet := Table1;
    TB.Columns[1].DefaultCell := OvcTCString1;
    TB.Columns[12].DefaultCell := OvcTCPictureField1;
  end;
  UpdateStatus;
end;

procedure TForm1.cbTable2Click(Sender: TObject);
begin
  if (TB.DataSource <> nil) and (cbTable2.Checked) then begin
    cbTable1.Checked := False;
    TB.RowHeight := 100;
    TB.DataSource.DataSet := Table2;
    TB.Columns[0].DefaultCell := OvcTCString1;
    TB.Columns[4].DefaultCell := OvcTCBitmap1;
    TB.Columns[4].Width := 120;
  end;
  UpdateStatus;
end;

procedure TForm1.cbUseHeaderCellClick(Sender: TObject);
begin
  if cbUseHeaderCell.Checked then
    TB.HeaderOptions := TB.HeaderOptions + [hoUseHeaderCell]
  else
    TB.HeaderOptions := TB.HeaderOptions - [hoUseHeaderCell];
  UpdateStatus;
end;

procedure TForm1.cbUseLettersClick(Sender: TObject);
begin
  if cbUseLetters .Checked then
    TB.HeaderOptions := TB.HeaderOptions + [hoUseLetters]
  else
    TB.HeaderOptions := TB.HeaderOptions - [hoUseLetters];
  cbUseLetters.Checked := hoUseLetters in TB.HeaderOptions;
  cbUseStrings.Checked := hoUseStrings in TB.HeaderOptions;
end;

procedure TForm1.cbUseStringsClick(Sender: TObject);
begin
  if cbUseStrings .Checked then
    TB.HeaderOptions := TB.HeaderOptions + [hoUseStrings]
  else
    TB.HeaderOptions := TB.HeaderOptions - [hoUseStrings];
  cbUseStrings.Checked := hoUseStrings in TB.HeaderOptions;
  cbUseLetters.Checked := hoUseLetters in TB.HeaderOptions;
end;

procedure TForm1.cbVisibleClick(Sender: TObject);
begin
  TB.Visible := cbVisible.Checked;
  UpdateStatus;
end;

procedure TForm1.cbWantTabsClick(Sender: TObject);
begin
  if cbWantTabs.Checked then
    TB.Options := TB.Options + [dtoWantTabs]
  else
    TB.Options := TB.Options - [dtoWantTabs];
  UpdateStatus;
end;

procedure TForm1.cbWrapAtEndsClick(Sender: TObject);
begin
  if cbWrapAtEnds.Checked then
    TB.Options := TB.Options + [dtoWrapAtEnds]
  else
    TB.Options := TB.Options - [dtoWrapAtEnds];
  UpdateStatus;
end;

procedure TForm1.sfActiveColumnExit(Sender: TObject);
begin
  TB.ActiveColumn := sfActiveColumn.AsInteger;
  sfActiveColumn.AsInteger := TB.ActiveColumn;
end;

procedure TForm1.sfActiveRowExit(Sender: TObject);
begin
  TB.ActiveRow := sfActiveRow.AsInteger;
  sfActiveRow.AsInteger := TB.ActiveRow;
end;

procedure TForm1.sfHeaderHeightExit(Sender: TObject);
begin
  TB.HeaderHeight := sfHeaderHeight.AsInteger;
  sfHeaderHeight.AsInteger := TB.HeaderHeight;
end;

procedure TForm1.sfLeftColumnExit(Sender: TObject);
begin
  TB.LeftColumn := sfLeftColumn.AsInteger;
  sfLeftColumn.AsInteger := TB.LeftColumn;
end;

procedure TForm1.sfLockedColumnsExit(Sender: TObject);
begin
  TB.LockedColumns := sfLockedColumns.AsInteger;
  sfLockedColumns.AsInteger := TB.LockedColumns;
end;

procedure TForm1.sfRowHeightExit(Sender: TObject);
begin
  TB.RowHeight := sfRowHeight.AsInteger;
  sfRowHeight.AsInteger := TB.RowHeight;
end;

procedure TForm1.btnUpdateClick(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TForm1.TBLeftColumnChanged(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
