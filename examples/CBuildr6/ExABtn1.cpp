//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExABtn1.h"
#include "ExABtn2.h"
//---------------------------------------------------------------------------
#pragma link "OvcABtn"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcEF"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ABtnClick(TObject *Sender)
{
  TPoint P;

  P = ClientToScreen(Point(ABtn->Left+ABtn->Width , ABtn->Top + ABtn->Height));
  frmCal->Left = P.x - frmCal->Width;
  frmCal->Top = P.y;
  frmCal->Calendar->CalendarDate = PF->AsStDate;
  if (frmCal->ShowModal() == mrOk)
    PF->AsStDate = frmCal->Calendar->CalendarDate;

}
//---------------------------------------------------------------------------
