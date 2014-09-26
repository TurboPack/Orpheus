//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDbTbU.h"
//---------------------------------------------------------------------------
#pragma link "OvcDbTbl"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCPic"
#pragma link "OvcTCBEF"
#pragma link "OvcTCBox"
#pragma link "OvcTCGly"
#pragma link "OvcTCBmp"
#pragma link "OvcTCCBx"
#pragma link "OvcTCSim"
#pragma link "OvcTCNum"
#pragma link "OvcTCHdr"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBLockedCellClick(TObject *Sender, int RowNum,
  int ColNum)
{
  lblClicks->Caption = "Locked cell click : " +
    String((int)RowNum) + ", " + String((int)ColNum);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBUnusedAreaClick(TObject *Sender, int RowNum,
  int ColNum)
{
  lblClicks->Caption = "Unused area click : " +
    String((int)RowNum) + ", " + String((int)ColNum);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBIndicatorClick(TObject *Sender, int RowNum,
  int ColNum)
{
  lblClicks->Caption = "Indicator click : " +
    String((int)RowNum) + ", " + String((int)ColNum);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBActiveCellChanged(TObject *Sender, int RowNum,
  int ColNum)
{
  UpdateStatus();
}
//---------------------------------------------------------------------------
void TForm1::UpdateStatus()
{
  cbAllowMove->Checked = TB->Options.Contains(dtoAllowColumnMove);
  cbAllowSize->Checked = TB->Options.Contains(dtoAllowColumnSize);
  cbAlwaysEditing->Checked = TB->Options.Contains(dtoAlwaysEditing);
  cbCellsPaintText->Checked = TB->Options.Contains(dtoCellsPaintText);
  cbHighlightRow->Checked = TB->Options.Contains(dtoHighlightActiveRow);
  cbIntegralHeight->Checked = TB->Options.Contains(dtoIntegralHeight);
  cbShowHeader->Checked = TB->HeaderOptions.Contains(hoShowHeader);
  cbShowIndicators->Checked = TB->Options.Contains(dtoShowIndicators);
  cbShowPictures->Checked = TB->Options.Contains(dtoShowPictures);
  cbStretchPictures->Checked = TB->Options.Contains(dtoStretch);
  if (TB->DataSource && TB->DataSource->DataSet)
    cbTableActive->Checked = TB->DataSource->DataSet->Active;
  else
    cbTableActive->Checked = false;
  cbUseHeaderCell->Checked = TB->HeaderOptions.Contains(hoUseHeaderCell);
  cbUseLetters->Checked = TB->HeaderOptions.Contains(hoUseLetters);
  cbUseStrings->Checked = TB->HeaderOptions.Contains(hoUseStrings);
  cbVisible->Checked = TB->Visible;
  cbWantTabs->Checked = TB->Options.Contains(dtoWantTabs);
  cbWrapAtEnds->Checked = TB->Options.Contains(dtoWrapAtEnds);
  cbTable1->Checked = (TB->DataSource->DataSet == Table1);
  cbTable2->Checked = (TB->DataSource->DataSet == Table2);
  sfActiveColumn->AsInteger = TB->ActiveColumn;
  sfActiveRow->AsInteger = TB->ActiveRow;
  sfHeaderHeight->AsInteger = TB->HeaderHeight;
  sfLeftColumn->AsInteger = TB->LeftColumn;
  sfLockedColumns->AsInteger = TB->LockedColumns;
  sfRowHeight->AsInteger = TB->RowHeight;
  TB->Repaint();
}

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormKeyPress(TObject *Sender, char &Key)
{
/*
  if (Key == 13) {
    Key = 0);
    btnUpdate->SetFocus();
    btnUpdate->Click();
  }
*/
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbAllowMoveClick(TObject *Sender)
{
  if (cbAllowMove->Checked)
    TB->Options << dtoAllowColumnMove;
  else
    TB->Options >> dtoAllowColumnMove;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbAllowSizeClick(TObject *Sender)
{
  if (cbAllowSize->Checked)
    TB->Options << dtoAllowColumnSize;
  else
    TB->Options >> dtoAllowColumnSize;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbAlwaysEditingClick(TObject *Sender)
{
  if (cbAlwaysEditing->Checked)
    TB->Options << dtoAlwaysEditing;
  else
    TB->Options >> dtoAlwaysEditing;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbCellsPaintTextClick(TObject *Sender)
{
  if (cbCellsPaintText->Checked)
    TB->Options << dtoCellsPaintText;
  else
    TB->Options >> dtoCellsPaintText;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbEnterToTabClick(TObject *Sender)
{
  if (cbEnterToTab->Checked)
    TB->Options << dtoEnterToTab;
  else
    TB->Options >> dtoEnterToTab;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbHighlightRowClick(TObject *Sender)
{
  if (cbHighlightRow->Checked)
    TB->Options << dtoHighlightActiveRow;
  else
    TB->Options >> dtoHighlightActiveRow;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbIntegralHeightClick(TObject *Sender)
{
  if (cbIntegralHeight->Checked)
    TB->Options << dtoIntegralHeight;
  else
    TB->Options >> dtoIntegralHeight;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbPageScrollClick(TObject *Sender)
{
  if (cbPageScroll->Checked)
    TB->Options << dtoPageScroll;
  else
    TB->Options >> dtoPageScroll;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowHeaderClick(TObject *Sender)
{
  if (cbShowHeader->Checked)
    TB->HeaderOptions << hoShowHeader;
  else
    TB->HeaderOptions >> hoShowHeader;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowIndicatorsClick(TObject *Sender)
{
  if (cbShowIndicators->Checked)
    TB->Options << dtoShowIndicators;
  else
    TB->Options >> dtoShowIndicators;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowPicturesClick(TObject *Sender)
{
  if (cbShowPictures->Checked)
    TB->Options << dtoShowPictures;
  else
    TB->Options >> dtoShowPictures;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbStretchPicturesClick(TObject *Sender)
{
  if (cbStretchPictures->Checked)
    TB->Options << dtoStretch;
  else
    TB->Options >> dtoStretch;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbTableActiveClick(TObject *Sender)
{
  if (TB->DataSource && TB->DataSource->DataSet)
    TB->DataSource->DataSet->Active = cbTableActive->Checked;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbTable1Click(TObject *Sender)
{
  if (TB->DataSource && cbTable1->Checked) {
    cbTable2->Checked = false;
    TB->RowHeight = 20;
    TB->DataSource->DataSet = Table1;
    TB->Columns->DefaultCell[1] = OvcTCString1;
    TB->Columns->DefaultCell[12] = OvcTCPictureField1;
  }
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbTable2Click(TObject *Sender)
{
  if (TB->DataSource && cbTable2->Checked) {
    cbTable1->Checked = false;
    TB->RowHeight = 100;
    TB->DataSource->DataSet = Table2;
    TB->Columns->DefaultCell[0] = OvcTCString1;
    TB->Columns->DefaultCell[4] = OvcTCBitMap1;
    TB->Columns->Width[4] = 120;
  }
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbUseHeaderCellClick(TObject *Sender)
{
  if (cbUseHeaderCell->Checked)
    TB->HeaderOptions << hoUseHeaderCell;
  else
    TB->HeaderOptions >> hoUseHeaderCell;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbUseLettersClick(TObject *Sender)
{
  if (cbUseLetters ->Checked)
    TB->HeaderOptions << hoUseLetters;
  else
    TB->HeaderOptions >> hoUseLetters;
  cbUseLetters->Checked = TB->HeaderOptions.Contains(hoUseLetters);
  cbUseStrings->Checked = TB->HeaderOptions.Contains(hoUseStrings);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbUseStringsClick(TObject *Sender)
{
  if (cbUseStrings->Checked)
    TB->HeaderOptions << hoUseStrings;
  else
    TB->HeaderOptions >> hoUseStrings;
  cbUseStrings->Checked = TB->HeaderOptions.Contains(hoUseStrings);
  cbUseLetters->Checked = TB->HeaderOptions.Contains(hoUseLetters);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbVisibleClick(TObject *Sender)
{
  TB->Visible = cbVisible->Checked;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbWantTabsClick(TObject *Sender)
{
  if (cbWantTabs->Checked)
    TB->Options << dtoWantTabs;
  else
    TB->Options >> dtoWantTabs;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbWrapAtEndsClick(TObject *Sender)
{
  if (cbWrapAtEnds->Checked)
    TB->Options << dtoWrapAtEnds;
  else
    TB->Options >> dtoWrapAtEnds;
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfActiveColumnExit(TObject *Sender)
{
  TB->ActiveColumn = sfActiveColumn->AsInteger;
  sfActiveColumn->AsInteger = TB->ActiveColumn;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfActiveRowExit(TObject *Sender)
{
  TB->ActiveRow = sfActiveRow->AsInteger;
  sfActiveRow->AsInteger = TB->ActiveRow;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfHeaderHeightExit(TObject *Sender)
{
  TB->HeaderHeight = sfHeaderHeight->AsInteger;
  sfHeaderHeight->AsInteger = TB->HeaderHeight;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfLeftColumnExit(TObject *Sender)
{
  TB->LeftColumn = sfLeftColumn->AsInteger;
  sfLeftColumn->AsInteger = TB->LeftColumn;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfLockedColumnsExit(TObject *Sender)
{
  TB->LockedColumns = sfLockedColumns->AsInteger;
  sfLockedColumns->AsInteger = TB->LockedColumns;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::sfRowHeightExit(TObject *Sender)
{
  TB->RowHeight = sfRowHeight->AsInteger;
  sfRowHeight->AsInteger = TB->RowHeight;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnUpdateClick(TObject *Sender)
{
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBLeftColumnChanged(TObject *Sender)
{
  UpdateStatus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCloseClick(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

