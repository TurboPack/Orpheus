//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExEdPrnU.h"
//---------------------------------------------------------------------------
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcBase"
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
  long I;
  String S;
  int X, Y, YD;

  // assign editor font to printer
  Printer()->Canvas->Font = ED->FixedFont->Font;

  // get vertical line delta
  YD = Printer()->Canvas->TextHeight("Wg");

  // access printer handle to force selection of the font
  // into the printer DC-> Delphi doesn't do this automatically
  if (Printer()->Handle > 0) ;

  Screen->Cursor = crHourGlass;
  try {
    Y = 50;
    X = 50;
    Printer()->BeginDoc();
    for (I=1;I<ED->LineCount+1;I++) {
      S = ED->Lines[I];
      Printer()->Canvas->TextOut(X, Y, S);
      Y += YD;
      if (Y > Printer()->PageHeight - 50) {
        Y = 50;
        Printer()->NewPage();
      }
    }
    Printer()->EndDoc();
    Screen->Cursor = crDefault;
  }
  catch (...) {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

