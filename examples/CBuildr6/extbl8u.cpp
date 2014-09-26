//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExTbl8U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCSim"
#pragma link "OvcTCBEF"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  TotalRecs = Query1->RecordCount;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  int FN;

  Data = 0;
  if (RowNum > 0 && RowNum < TotalRecs) {
    Query1->First();
    Query1->MoveBy(RowNum - 1);
    FN = ColNum - 1;
    switch(ColNum) {
      case 1 :
      case 2 :
      case 3 : {
         GS = Query1->Fields[FN]->AsString;
         Data = &GS;
         break;
      }
      case 4 :
      case 5 : {
         GI = Query1->Fields[FN]->AsInteger;
         Data = &GI;
      }
    }
  }
}
//---------------------------------------------------------------------------
