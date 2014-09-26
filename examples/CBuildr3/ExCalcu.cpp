//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExCalcu.h"
//---------------------------------------------------------------------------
#pragma link "OvcCalc"
#pragma link "OvcBase"
#pragma link "OvcEdClc"
#pragma link "OvcEdPop"
#pragma link "OvcEditF"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbSeparateClick(TObject *Sender)
{
  TOvcCalculatorOptions co = Calculator->Options;
  if (cbSeparate->Checked)
    co << coShowSeparatePercent;
  else
    co >> coShowSeparatePercent;
  Calculator->Options = co;
  Calculator->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowTapeClick(TObject *Sender)
{
  TOvcCalculatorOptions co = Calculator->Options;
  if (cbShowTape->Checked)
    co << coShowTape;
  else
    co >> coShowTape;
  Calculator->Options = co;
  Calculator->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbFixedEntryClick(TObject *Sender)
{
  DecimalRadioGroupClick(Sender);
  Calculator->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CalculatorButtonPressed(TObject *Sender,
	TOvcCalculatorButton Button)
{
  if (Button == cbEqual)
    ResultLbl->Caption = Calculator->DisplayStr;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DecimalRadioGroupClick(TObject *Sender)
{
  int Decimals;
  switch (DecimalRadioGroup->ItemIndex)  {
    case 0 : {Decimals = 0; break;}
    case 1 : {Decimals = 1; break;}
    case 2 : {Decimals = 2; break;}
    case 3 : {Decimals = 3; break;}
    default : throw ("Illegal Radio Button Click");
  }
  if (cbFixedEntry->Checked)
    Calculator->Decimals = -Decimals;
  else
    Calculator->Decimals = Decimals;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::PrintSpeedButtonClick(TObject *Sender)
{
  Printer()->Canvas->Font->Name = "Courier New";
  Printer()->Canvas->Font->Size = 10;
  Printer()->BeginDoc();
  for (int i=0; i<Calculator->Tape->Count; i++)
    Printer()->Canvas->TextOut(20, (i+1)*20, Calculator->Tape->Strings[i]);
  Printer()->EndDoc();
  Calculator->SetFocus();
}
//--------------------------------------------------------------------------- 
