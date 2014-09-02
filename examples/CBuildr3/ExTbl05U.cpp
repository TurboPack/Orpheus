// Example program that shows how to access current setting of a TOvcTCCheckBox
// in a TOvcTable and modify other check boxes according to the setting of the first

// Note that due to the random settings of the data when the project first starts
// that the first time you click on the first check box in any given row may or
// may not change the settings of the other two - this is to be expected. A "real"
// program would have to provide proper synchronization on start upE
//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdlib.h>

#include "ExTbl05U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCBox"
#pragma link "OvcTCGly"
#pragma link "OvcTCBmp"
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
  for (int i=0;i<9;i++) {
    MyData[i].TF1 = random(2) == 1;
    MyData[i].TF2 = random(2) == 1;
    MyData[i].TF3 = random(2) == 1;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if (RowNum > 0 && RowNum < 10) {
    switch(ColNum) {
       case 1 : Data = &MyData[RowNum].TF1; break;
       case 2 : Data = &MyData[RowNum].TF2; break;
       case 3 : Data = &MyData[RowNum].TF3; break;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TblCB1Click(TObject *Sender)
{
  TCheckBoxState V;
  V = (TCheckBoxState)dynamic_cast<TOvcTCGlyphEdit*>(Sender)->Value;
  OvcTable1->AllowRedraw = false;
  MyData[OvcTable1->ActiveRow].TF2 = !(V == cbChecked);
  MyData[OvcTable1->ActiveRow].TF3 = !(V == cbChecked);
  OvcTable1->InvalidateRow(OvcTable1->ActiveRow);
  OvcTable1->AllowRedraw = true;
}
//--------------------------------------------------------------------------- 
