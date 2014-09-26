//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <stdlib.h>
#pragma hdrstop

#include "ExMeteru.h"
//---------------------------------------------------------------------------
#pragma link "OvcMeter"
#pragma link "OvcBase"
#pragma link "OvcPeakM"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall ChangeMeter(TOvcMeter* M)
{
  M->Percent = M->Percent + M->Tag;
  if (M->Percent == 0)
    M->Tag = 1;
  if (M->Percent == 100)
    M->Tag = -1;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
  Randomize();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Timer1Timer(TObject *Sender)
{
  OvcMeter1->Percent = OvcMeter1->Percent + 1;
  if (OvcMeter1->Percent >= 100)
    OvcMeter1->Percent = 0;

  if (OvcMeter1->Percent % 10 == 0)  {
    OvcPeakMeter1->Value = OvcPeakMeter1->Value + 2;
    OvcPeakMeter2->Value = OvcPeakMeter2->Value + 3;
  }

  int r = random(2);
  if (r == 0)  {
    r = random(10) + 1;
    if (OvcPeakMeter3->Value + r < 1000)
      OvcPeakMeter3->Value = OvcPeakMeter3->Value + r;
  }
  else {
    r = random(10) + 1;
    if (OvcPeakMeter3->Value - r >= 0)
      OvcPeakMeter3->Value = OvcPeakMeter3->Value - r;
  }

  r = random(2);
  if (r == 0)  {
    r = random(10) + 1;
    if (OvcPeakMeter4->Value + r < 1000)
      OvcPeakMeter4->Value = OvcPeakMeter4->Value + r;
  }
  else {
    r = random(10) + 1;
    if (OvcPeakMeter4->Value - r >= 0)
      OvcPeakMeter4->Value = OvcPeakMeter4->Value - r;
  }

  OvcMeter2->Percent = OvcMeter2->Percent - 1;
  if (OvcMeter2->Percent <= 0)
    OvcMeter2->Percent = 100;
  if (OvcMeter2->Percent % 20 == 0)  {
    OvcPeakMeter1->Value = OvcPeakMeter1->Value - 3;
    OvcPeakMeter2->Value = OvcPeakMeter2->Value - 5;
  }
  ChangeMeter(OvcMeter3);
  ChangeMeter(OvcMeter4);
  ChangeMeter(OvcMeter5);
  ChangeMeter(OvcMeter6);
  ChangeMeter(OvcMeter7);
  ChangeMeter(OvcMeter8);
  ChangeMeter(OvcMeter9);
  ChangeMeter(OvcMeter10);
  ChangeMeter(OvcMeter11);
  ChangeMeter(OvcMeter12);
}
//---------------------------------------------------------------------------
