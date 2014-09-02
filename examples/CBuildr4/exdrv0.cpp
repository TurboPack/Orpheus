//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ExDrv0.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OvcBase"
#pragma link "OvcCmbx"
#pragma link "OvcDlg"
#pragma link "OvcDRpVw"
#pragma link "OvcRptVw"
#pragma link "OvcRvCbx"
#pragma link "OvcRVIdx"
#pragma link "OvcRvPDg"
#pragma link "ovcbase"
#pragma link "ovccmbx"
#pragma link "ovcdlg"
#pragma link "ovcdrpvw"
#pragma link "ovcrptvw"
#pragma link "ovcrvcbx"
#pragma link "ovcrvidx"
#pragma link "ovcrvpdg"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  OvcRvPrintDialog1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::OvcDataReportView1Filter(TObject *Sender,
      TOvcDataRvItem *Data, int FilterIndex, bool &Include)
{
  if (FilterIndex == 0)
    Include = Data->AsBoolean[4];
}
//---------------------------------------------------------------------------
 
