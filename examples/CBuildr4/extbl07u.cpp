// Example program that shows how to display a message that depends on the
// current setting of the glyph AND keeps the glyph from cycling to the next
// item. There is a momentary flash of the glyph to the next item; this is
// unavoidable without a substantial rewrite of the glyph component.
// A "New Settings" button reassigns random values to the glyphs to show how
// to reset the values shown by the table
//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdlib.h>

#include "ExTbl07U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
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
  for (int i=0;i<9;i++)
    MyArray[i].GIdx = i % 2;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if (RowNum > 0 && RowNum < 9) {
    switch (ColNum) {
      case 1 : Data = &MyArray[RowNum].GIdx;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OnMyMessage1(TMessage& Msg)
{
  ShowMessage("The Sun is shining");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OnMyMessage2(TMessage& Msg)
{
  ShowMessage("Call home");
}

void __fastcall TForm1::OvcTCGlyph1Click(TObject *Sender)
{
  int TV;
  OvcTable1->AllowRedraw = false;
  try {
    TV = MyArray[OvcTable1->ActiveRow].GIdx;
    if (TV == 0) {
      PostMessage(Handle, MyMessage1, 0, 0);
      dynamic_cast<TOvcTCGlyphEdit*>(Sender)->Value = TV;
    }
    else {
      PostMessage(Handle, MyMessage2, 0, 0);
      dynamic_cast<TOvcTCGlyphEdit*>(Sender)->Value = TV;
    }
    OvcTable1->InvalidateRow(OvcTable1->ActiveRow);
  }
  catch (...) {
    OvcTable1->AllowRedraw = true;
  }
  OvcTable1->AllowRedraw = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  OvcTable1->AllowRedraw = false;
  try {
    for (int i=0;i<9;i++)
      MyArray[i].GIdx = random(2);
    OvcTable1->InvalidateTable();
  }
  catch (...) {
    OvcTable1->AllowRedraw = true;
  }
  OvcTable1->AllowRedraw = true;
}
//---------------------------------------------------------------------------
