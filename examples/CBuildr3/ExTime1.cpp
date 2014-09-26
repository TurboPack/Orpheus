//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <stdlib.h>
#pragma hdrstop

#include "ExTime1.h"
//---------------------------------------------------------------------------
#pragma link "OvcBase"
#pragma link "OvcEdTim"
#pragma link "OvcEditF"
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
  Top = div(Screen->Height - Height, 3).quot;
  Left = div(Screen->Width - Width, 2).quot;
  rgTimeMode->ItemIndex = OvcTimeEdit1->TimeMode;
  rgTimeMode->ItemIndex = OvcTimeEdit1->DurationDisplay;
  cbShowUnits->Checked = OvcTimeEdit1->ShowUnits;
  cbShowSeconds->Checked = OvcTimeEdit1->ShowSeconds;
  edUnitsLength->Text = OvcTimeEdit1->UnitsLength;
  edNowString->Text = OvcTimeEdit1->NowString;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::rgDurationDisplayClick(TObject *Sender)
{
  OvcTimeEdit1->DurationDisplay = (TOvcDurationDisplay)(rgDurationDisplay->ItemIndex);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::rgTimeModeClick(TObject *Sender)
{
  OvcTimeEdit1->TimeMode = TOvcTimeMode(rgTimeMode->ItemIndex);
  rgDurationDisplay->Enabled = (OvcTimeEdit1->TimeMode == tmDuration);
  rgPrimaryField->Enabled = (OvcTimeEdit1->TimeMode == tmDuration);
  cbShowSeconds->Enabled = (OvcTimeEdit1->TimeMode == tmClock);
  cbShowUnits->Enabled = (OvcTimeEdit1->TimeMode == tmDuration);
  edUnitsLength->Enabled = (OvcTimeEdit1->TimeMode == tmDuration);
  cbShowSeconds->Enabled = (OvcTimeEdit1->TimeMode == tmClock);
  cbShowUnits->Enabled = (OvcTimeEdit1->TimeMode == tmDuration);
  cbDefaultToPM->Enabled = (OvcTimeEdit1->TimeMode == tmClock);
  if (OvcTimeEdit1->TimeMode == tmClock)
    OvcTimeEdit1Label1->Caption = "Time edit";
  else
    OvcTimeEdit1Label1->Caption = "Duration edit";

}
//---------------------------------------------------------------------------
void __fastcall TForm1::rgPrimaryFieldClick(TObject *Sender)
{
  OvcTimeEdit1->PrimaryField = (TOvcTimeField)(rgPrimaryField->ItemIndex);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowSecondsClick(TObject *Sender)
{
  OvcTimeEdit1->ShowSeconds = cbShowSeconds->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbShowUnitsClick(TObject *Sender)
{
  OvcTimeEdit1->ShowUnits = cbShowUnits->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::edUnitsLengthExit(TObject *Sender)
{
  OvcTimeEdit1->UnitsLength = edUnitsLength->Text.ToIntDef(1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::edNowStringExit(TObject *Sender)
{
  if (edUnitsLength->Text > "")
    OvcTimeEdit1->NowString = edNowString->Text;
  else
    OvcTimeEdit1->NowString = ":";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::cbDefaultToPMClick(TObject *Sender)
{
  OvcTimeEdit1->DefaultToPM = cbDefaultToPM->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
