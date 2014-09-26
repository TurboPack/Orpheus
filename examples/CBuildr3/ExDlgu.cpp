//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDlgu.h"
//---------------------------------------------------------------------------
#pragma link "OvcCalDg"
#pragma link "OvcDlg"
#pragma link "OvcBase"
#pragma link "OvcDbMDg"
#pragma link "OvcClcDg"
#pragma link "OvcClkDg"
#pragma link "OvcMoDg"
#pragma link "OvcDbADg"
#pragma link "OvcSplDg"
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
  SelectedDate = Now();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  OvcCalendarDialog1->Calendar->Date = Now();
  if (OvcCalendarDialog1->Execute()) {
    SelectedDate = OvcCalendarDialog1->Calendar->Date;
    Button1->Caption = OvcCalendarDialog1->Calendar->Date;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
  OvcClockDialog1->Clock->DrawMarks = False;
  OvcClockDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button6Click(TObject *Sender)
{
  OvcDbAliasDialog1->AliasName = "BCDEMOS";
  if (OvcDbAliasDialog1->Execute())
    Button6->Caption = OvcDbAliasDialog1->TableName;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button7Click(TObject *Sender)
{
  if (!OvcSplashDialog1->Visible)
    OvcSplashDialog1->Show();
  else
    OvcSplashDialog1->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcSplashDialog1Click(TObject *Sender)
{
  OvcSplashDialog1->Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
  if( OvcCalculatorDialog1->Execute())
    Button2->Caption = String((double)OvcCalculatorDialog1->Calculator->DisplayValue);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button5Click(TObject *Sender)
{
  OvcMemoDialog1->Lines->Assign(Memo1->Lines);
  if (OvcMemoDialog1->Execute())
    Memo1->Lines->Assign(OvcMemoDialog1->Lines);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button4Click(TObject *Sender)
{
  if (OvcDbMemoDialog1->Execute()) {
//    {memo field in database has been updated}
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDbMemoDialog1HelpClick(TObject *Sender)
{
  ShowMessage("Help button was clicked");
}
//---------------------------------------------------------------------------
