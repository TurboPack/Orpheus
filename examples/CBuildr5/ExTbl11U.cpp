//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExTbl11U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCHdr"
#pragma link "OvcTCPic"
#pragma link "OvcTCBEF"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
  TestDatabase[0].Name = "Bucknall, Julian";
  TestDatabase[0].Age = 39;
  TestDatabase[1].Name = "Hughes, Terry";
  TestDatabase[1].Age = 37;
  TestDatabase[2].Name = "Inman, Lee";
  TestDatabase[2].Age = 44;
  TestDatabase[3].Name = "Reisdorph, Kent";
  TestDatabase[3].Age = 36;
  TestDatabase[4].Name = "Leier, John";
  TestDatabase[4].Age = 33;
  TestDatabase[5].Name = "Frerking, Gary";
  TestDatabase[5].Age = 33;
  TestDatabase[6].Name = "Rose, Larry";
  TestDatabase[6].Age = 36;
  TestDatabase[7].Name = "";
  TestDatabase[7].Age = 0;
  TestDatabase[8].Name = "";
  TestDatabase[8].Age = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = NULL;
  if (1 <= RowNum && RowNum <= 9) {
    switch (ColNum) {
      case 1 : Data = &TestDatabase[RowNum - 1].Name; break;
      case 2 : Data = &TestDatabase[RowNum - 1].Age; break;
    }
  }
  else {
    switch (ColNum) {
      case 0 : ColHeading = "TP"; break;
      case 1 : ColHeading = "Name"; break;
      case 2 : ColHeading = "Age"; break;
    }
    Data = &ColHeading;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellAttributes(TObject *Sender, int RowNum,
  int ColNum, TOvcCellAttributes &CellAttr)
{
  if ((RowNum == 0) && (ColNum == 2))
    CellAttr.caAdjust = otaCenterRight;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

