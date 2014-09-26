//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExNbkU.h"
//---------------------------------------------------------------------------
#pragma link "OvcSC"
#pragma link "OvcBase"
#pragma link "OvcNbk"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcNF"
#pragma link "OvcCal"
#pragma link "OvcTimer"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnTabPosClick(TObject *Sender)
{
  if (NB1->TabOrientation == toRight)
    NB1->TabOrientation = toTop;
  else
    NB1->TabOrientation = toRight;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnShadowTextClick(TObject *Sender)
{
  NB1->ShadowedText = !NB1->ShadowedText;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnChangeTabClick(TObject *Sender)
{
  NB1->PageIndex = OvcSimpleField1->AsInteger;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnFontColorClick(TObject *Sender)
{
  ColorDialog1->Color = NB1->Font->Color;
  ColorDialog1->Execute();
  NB1->Font->Color = ColorDialog1->Color;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnFontSelClick(TObject *Sender)
{
  FontDialog1->Font = NB1->Font;
  FontDialog1->Execute();
  NB1->Font = FontDialog1->Font;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCalDateClick(TObject *Sender)
{
  // second page (index 1) contains the calendar
  NB1->PageIndex = 1;
  // change the calendar date
  OvcCalendar1->CalendarDate = OvcPictureField1->AsOvcDate;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcCalendar1Change(TObject *Sender, TDateTime Date)
{
  String S = (int)OvcCalendar1->Year;
  Panel1->Caption = OvcCalendar1->DateString("www, dd nnn yyyy");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnTabDisableClick(TObject *Sender)
{
  NB1->Pages[3]->Enabled = !NB1->Pages[3]->Enabled;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  char Buf[255];

  OvcSimpleField1->AsInteger = Form1->NB1->PageIndex;
  OvcCalendar1->CalendarDate = CurrentDate();
  // set picture mask to correspond with the control panel settings
  OvcPictureField1->PictureMask =
    OvcCalendar1->IntlSupport->InternationalDatePChar(Buf, true);
  OvcPictureField1->AsOvcDate = CurrentDate();
  OvcSimpleField2->AsString = "Simple Field Editor";
  OvcPictureField2->AsString = "Picture Field Editor";
  OvcNumericField1->AsFloat = 32768.90;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnAutoClick(TObject *Sender)
{
  static bool Started = false;

  Started = !Started;
  if (Started) {
    T1 = TP->Add(NULL, 1000);
    T2 = TP->Add(NULL, 7000);
    T3 = TP->Add(NULL, 5000);
    btnAuto->Caption = "Stop Auto Demo";
  }
  else {
    TP->RemoveAll();
    btnAuto->Caption = "Start Auto Demo";
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::NB1PageChange(TObject *Sender, int Index,
  bool &AllowChange)
{
  OvcSimpleField1->AsInteger = Index;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCloseClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::TPAllTriggers(TObject *Sender, int Handle,
      DWORD Interval, int ElapsedTime)
{
  static int C = 0;

  if (Handle == T1) {
    C++;
    if (C > NB1->PageCollection->Count-1)
      C = 0;
    if (NB1->IsValid(C))
      NB1->PageIndex = C;
  }

  if (Handle == T2) {
    btnTabPosClick(Sender);
  }

  if (Handle == T3) {
    btnTabDisableClick(Sender);
  }
}
//---------------------------------------------------------------------------

