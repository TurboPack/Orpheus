//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>

#include "ExTblOdU.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCHdr"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
  S = "Test";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TBLGetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = &S;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCString1OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  bool F;
  TRect R;
  TCanvas* C;
  char Buf[255];

  DoneIt = True;
  R = CellRect;
  C = TableCanvas;

  // paint background
  C->Brush->Style = bsClear;
  C->Pen->Color = clBtnFace;
  C->Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  // draw button
  F = (RowNum == TBL->ActiveRow) && (ColNum == TBL->ActiveCol);
  DrawButtonFace(C, R, 1, bsNew, true, F, F);

  // draw data
  if ((RowNum % 2) == 1)
    C->Font->Color = clRed;
  else
    C->Font->Color = clBlack;
  sprintf(Buf, "%d:%d", RowNum, ColNum);
  DrawText(C->Handle, Buf, StrLen(Buf),
    (RECT*)&R, DT_CENTER | DT_VCENTER | DT_SINGLELINE);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

