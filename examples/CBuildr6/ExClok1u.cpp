//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExClok1u.h"
//---------------------------------------------------------------------------
#pragma link "OvcBase"
#pragma link "OvcClock"
#pragma link "ovcbase"
#pragma link "ovcclock"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  int Bias;
  try {
    Bias = Edit1->Text.ToInt();
  }
  catch (...) {
    return;
  }
  OrClock1->TimeOffset = OrClock1->TimeOffset - Bias;
  OrClock2->TimeOffset = OrClock2->TimeOffset - Bias;
  OrClock3->TimeOffset = OrClock3->TimeOffset - Bias;
  OrClock4->TimeOffset = OrClock4->TimeOffset - Bias;
  OrClock5->TimeOffset = OrClock5->TimeOffset - Bias;
  OrClock6->TimeOffset = OrClock6->TimeOffset - Bias;
  OrClock7->TimeOffset = OrClock7->TimeOffset - Bias;
  OrClock8->TimeOffset = OrClock8->TimeOffset - Bias;
  Button1->Enabled = False;
}
//--------------------------------------------------------------------------- 
