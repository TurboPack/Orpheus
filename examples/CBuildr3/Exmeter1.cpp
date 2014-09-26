//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "Exmeter1.h"
//---------------------------------------------------------------------------
#pragma link "OvcMeter"
#pragma link "OvcBase"
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
  OvcMeter1->Percent = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
  //increase meter 1's display value
  OvcMeter1->Percent++;
  if (OvcMeter1->Percent >= 100)
    OvcMeter1->Percent = 0;

  //decrease meter 2's display value
  OvcMeter2->Percent--;
  if (OvcMeter2->Percent == 0)
    OvcMeter2->Percent = 100;

}
//---------------------------------------------------------------------------
