//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExCalu.h"
//---------------------------------------------------------------------------
#pragma link "OvcCal"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcCalendar1GetDateEnabled(TObject *Sender,
	TDateTime ADate, bool &Enabled)
{
  Enabled = (DayOfWeek(ADate) != 3);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcCalendar1GetHighlight(TObject *Sender,
	TDateTime ADate, TColor &Color)
{
  if (DayOfWeek(ADate) == 3)  {
    Color = clGreen;
  	}
}
//--------------------------------------------------------------------------- 
