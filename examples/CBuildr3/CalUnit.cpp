//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "CalUnit.h"
//---------------------------------------------------------------------------
#pragma link "OvcCal"
#pragma link "OvcBase"
#pragma link "OvcSC"
#pragma resource "*.dfm"
TCalForm *CalForm;
//---------------------------------------------------------------------------
__fastcall TCalForm::TCalForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCalForm::YearSpinnerClick(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap)
{
  if (State == ssUpBtn)
    Calendar->CalendarDate = IncDateTrunc(Calendar->CalendarDate, 0, 1);
  else
    Calendar->CalendarDate = IncDateTrunc(Calendar->CalendarDate, 0, -1);
}
//---------------------------------------------------------------------------
void __fastcall TCalForm::MonthSpinnerClick(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap)
{
  if (State == ssRightBtn)
    Calendar->CalendarDate = IncDateTrunc(Calendar->CalendarDate, 1, 0);
  else
    Calendar->CalendarDate = IncDateTrunc(Calendar->CalendarDate, -1, 0);
}
//---------------------------------------------------------------------------
void __fastcall TCalForm::CalendarDrawItem(TObject *Sender, TDateTime ADate, const TRect &Rect)
{
  bool F;
  TRect R = Rect;
  TCanvas& C = *(dynamic_cast<TOvcCalendar*>(Sender)->Canvas);
  String S;

  // paint background
  C.Brush->Style = bsClear;
  C.Pen->Color = clBtnFace;
  C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  // shrink cell rect to show a border around the button
  InflateRect((RECT*)&R, -1, -1);
  Word Year, Month, Day;
  DecodeDate(ADate, Year, Month, Day);
  F = (Day == Calendar->Day);
  if (Month == Calendar->Month)
    DrawButtonFace(&C, R, 1, bsNew, true, F, F);
  else {
    C.Brush->Style = bsSolid;
    C.Pen->Color = Calendar->Colors->InactiveDays;
    C.Brush->Color = Calendar->Colors->InactiveDays;
    C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  }
  S = String(Day);
  C.Font->Color = clBlack;
  DrawText(C.Handle, S.c_str(), S.Length(), (RECT*)&R, DT_CENTER | DT_VCENTER | DT_SINGLELINE);
}
//---------------------------------------------------------------------------
void __fastcall TCalForm::FormCreate(TObject *Sender)
{
  Calendar->CalendarDate = (double)TDateTime::CurrentDate();
}
//---------------------------------------------------------------------------
void __fastcall TCalForm::btnOkClick(TObject *Sender)
{
  ModalResult = mrOk;
}
//---------------------------------------------------------------------------

void __fastcall TCalForm::btnCancelClick(TObject *Sender)
{
  ModalResult = mrCancel;
}
//---------------------------------------------------------------------------

