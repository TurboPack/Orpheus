//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>
#include <stdlib.h>

#include "ExTbl6U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCEdt"
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
  randomize();
  for (int i=0;i<9;i++)
    sprintf(MyArray[i], "%c", 65 + random(26));
  HiIdx = 9;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if (RowNum > 0 && RowNum <= HiIdx)
    if (ColNum == 1)
      Data = MyArray[RowNum];
}
//---------------------------------------------------------------------------
void TForm1::DeleteMyArray(TRowNum Row)
{
  if (Row < HiIdx)
    for (int i = Row;i<9;i++)
      strcpy(MyArray[i], MyArray[i+1]);
  strcpy(MyArray[HiIdx], "");
  HiIdx--;
}
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  TRowNum AR;
  if (HiIdx == 1) {
    ShowMessage("Cannot delete all records");
    return;
  }
  AR = OvcTable1->ActiveRow;
  OvcTable1->AllowRedraw = false;
  DeleteMyArray(OvcTable1->ActiveRow);
  OvcTable1->Rows->Delete(OvcTable1->ActiveRow);
  OvcTable1->AllowRedraw = true;

  if (AR <= HiIdx)
    OvcTable1->ActiveRow = AR;
  else
    OvcTable1->ActiveRow = HiIdx;
}
//---------------------------------------------------------------------------
