// This example shows how to use OnOwnerDraw to change the colors of individual
// cells in the TOvcDbTable. This is a *very* simplified example. Note that the
// colors of the cell when editing is set using the properties set within in the
// object inspector (or programmatically)

//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDbTodU.h"
//---------------------------------------------------------------------------
#pragma link "OvcDbTbl"
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
void __fastcall TForm1::OvcTCSimpleField1OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  if (Table1->Fields[3]->AsInteger < 1000000)  {
    TableCanvas->Brush->Color = clRed;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clWhite;
  }
  else {
    TableCanvas->Brush->Color = clWhite;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clBlack;
  }
  TableCanvas->FillRect(CellRect);

  //char* buff = new char[100];
  //buff = (char*)Data;
  SmallString<24> S;
  S = *(reinterpret_cast<SmallString<24>*>(Data));
  TableCanvas->TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCSimpleField2OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  if (Table1->Fields[3]->AsInteger < 1000000) {
    TableCanvas->Brush->Color = clRed;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clWhite;
  }
  else {
    TableCanvas->Brush->Color = clWhite;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clBlack;
  }
  TableCanvas->FillRect(CellRect);

  SmallString<24> S;
  S = *(reinterpret_cast<SmallString<24>*>(Data));
  TableCanvas->TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCSimpleField3OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  if (Table1->Fields[3]->AsInteger < 1000000) {
    TableCanvas->Brush->Color = clRed;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clWhite;
  }
  else {
    TableCanvas->Brush->Color = clWhite;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clBlack;
  }
  TableCanvas->FillRect(CellRect);

  SmallString<24> S;
  S = *(reinterpret_cast<SmallString<24>*>(Data));
  TableCanvas->TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCSimpleField4OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  int I;

  if (Table1->Fields[3]->AsInteger < 1000000) {
    TableCanvas->Brush->Color = clRed;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clWhite;
  }
  else {
    TableCanvas->Brush->Color = clWhite;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clBlack;
  }
  TableCanvas->FillRect(CellRect);

  SmallString<14> S;
  S = String((double)*reinterpret_cast<long double*>(Data));
  I = TableCanvas->TextWidth(S);
  I = (CellRect.Right - CellRect.Left) - I - 3;
  TableCanvas->TextOut(CellRect.Left + I, CellRect.Top+1, S);

  DoneIt = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTCSimpleField5OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt)
{
  int I;

  if (Table1->Fields[3]->AsInteger < 1000000) {
    TableCanvas->Brush->Color = clRed;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clWhite;
  }
  else {
    TableCanvas->Brush->Color = clWhite;
    TableCanvas->Brush->Style = bsSolid;
    TableCanvas->Font->Color = clBlack;
  }
  TableCanvas->FillRect(CellRect);

  SmallString<14> S;
  S = String((double)*reinterpret_cast<long double*>(Data));
  I = TableCanvas->TextWidth(S);
  I = (CellRect.Right - CellRect.Left) - I - 3;
  TableCanvas->TextOut(CellRect.Left + I, CellRect.Top+1, S);

  DoneIt = true;
}
//---------------------------------------------------------------------------
