//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdlib.h>

#include "ExTbl04U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCGly"
#pragma link "OvcTCBmp"
#pragma link "OvcTCell"
#pragma link "OvcTCCBx"
#pragma link "OvcTCStr"
#pragma link "OvcTCEdt"
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
  for (int i=0;i<9;i++) {
    MyArray[i].CIdx = (i - 1) % 3;
    if (MyArray[i].CIdx == 0)
      MyArray[i].GIdx = 1;
    else
      MyArray[i].GIdx = 0;
    strcpy(MyArray[i].CStr, String((char)(random(26) + 'A')).c_str());
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if (RowNum > 0 && RowNum < 10) {
    switch (ColNum) {
      case 1 : Data = &MyArray[RowNum].GIdx; break;
      case 2 : Data = &MyArray[RowNum].CIdx; break;
      case 3 : Data = MyArray[RowNum].CStr;  break;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCComboBox1Change(TObject *Sender)
{
  int I;
  TCustomComboBox* CB;
  CB = dynamic_cast<TCustomComboBox*>(Sender);
  I = CB->ItemIndex;
  if (I == 0)
    MyArray[OvcTable1->ActiveRow].GIdx = 1;
  else
    MyArray[OvcTable1->ActiveRow].GIdx = 0;
  strcpy(MyArray[OvcTable1->ActiveRow].CStr, CB->Items->Strings[I].c_str());

  OvcTable1->AllowRedraw = false;
  OvcTable1->InvalidateCell(OvcTable1->ActiveRow, 1);
  OvcTable1->InvalidateCell(OvcTable1->ActiveRow, 3);
  OvcTable1->AllowRedraw = true;
}
//---------------------------------------------------------------------------
