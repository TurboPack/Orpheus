//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "FilView3.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
TFindDlg *FindDlg;
//---------------------------------------------------------------------------
__fastcall TFindDlg::TFindDlg(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFindDlg::BitBtn1Click(TObject *Sender)
{
  ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TFindDlg::BitBtn2Click(TObject *Sender)
{
  ModalResult = mrCancel;    
}
//---------------------------------------------------------------------------

