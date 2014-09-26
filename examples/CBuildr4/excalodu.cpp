//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExCalodu.h"
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
void __fastcall TForm1::CalendarDrawItem(TObject *Sender, TDateTime ADate,
	const TRect &Rect)
{
  String S;
  char Buf[255];
  TRect R = Rect;
  TCanvas* C = Calendar->Canvas;

  C->Brush->Style = bsClear;
  C->Pen->Color = clBtnFace;
  C->Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  Word Year, Month, Day;
  DecodeDate(ADate, Year, Month, Day);
  bool F = (ADate == Calendar->Date);
  if (Month == Calendar->Month)
    DrawButtonFace(C, R, 1, bsNew, True, F, F);
  else {
    C->Brush->Style = bsSolid;
    C->Pen->Color = Calendar->Colors->InactiveDays;
    C->Brush->Color = Calendar->Colors->InactiveDays;
    C->Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  }
  S = Day;
  C->Font->Color = clBlack;
  StrPCopy(Buf, S);
  InflateRect((RECT*)&R, -2, -2);
  DrawText(C->Handle, Buf, S.Length(), (RECT*)&R, DT_TOP | DT_SINGLELINE);

  switch (Day) {
    case 3  : {S = "Birthday"; break;}
    case 13 : {S = "Wedding"; break;}
    case 26 : {S = "Vacation"; break;}
  default   : S = "";
  }
  if (S > "")  {
    StrPCopy(Buf, S);
    DrawText(C->Handle, Buf, S.Length(), (RECT*)&R, DT_CENTER | DT_BOTTOM | DT_SINGLELINE);
  }

}
//--------------------------------------------------------------------------- 
