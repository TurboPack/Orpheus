//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExSlideu.h"
//---------------------------------------------------------------------------
#pragma link "OvcBase"
#pragma link "OvcSlide"
#pragma link "OvcDbSld"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcSlider1Change(TObject *Sender)
{
  OvcSlider2->Position = OvcSlider1->Position;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcSlider2Change(TObject *Sender)
{
  OvcSlider1->Position = OvcSlider2->Position;
}
//---------------------------------------------------------------------------
