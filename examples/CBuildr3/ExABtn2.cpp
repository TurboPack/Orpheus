//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExABtn2.h"
//---------------------------------------------------------------------------
#pragma link "OvcCal"
#pragma link "OvcBase"
#pragma link "OvcSC"
#pragma resource "*.dfm"
TfrmCal *frmCal;
//---------------------------------------------------------------------------
__fastcall TfrmCal::TfrmCal(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmCal::CalendarDblClick(TObject *Sender)
{
  ModalResult = mrOk;
}
//---------------------------------------------------------------------------
void __fastcall TfrmCal::Spinner1Click(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap)
{
  switch (State) {
    case ssLeftBtn  : Calendar->IncMonth(-Delta); break;
    case ssRightBtn : Calendar->IncMonth(+Delta); break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCal::Spinner2Click(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap)
{
  switch (State) {
    case ssLeftBtn  : Calendar->IncYear(-Delta); break;
    case ssRightBtn : Calendar->IncYear(+Delta); break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCal::FormKeyDown(TObject *Sender, WORD &Key,
  TShiftState Shift)
{
  switch (Key) {
    case VK_F1   :
    case VK_RETURN :
    case VK_ESCAPE :
    case VK_NONE :
    case VK_SHIFT :
    case VK_CONTROL :
    case VK_ALT :
    case VK_CAPITAL :
    case VK_NUMLOCK :
    case VK_SCROLL :
    case VK_UP :
    case VK_DOWN :
    case VK_LEFT :
    case VK_RIGHT :
    case VK_HOME :
    case VK_END :
    case VK_PRIOR :
    case VK_NEXT :
    case VK_SPACE :
    case VK_TAB : break;
    default : ModalResult = mrCancel;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCal::FormCreate(TObject *Sender)
{
  BitBtn1->Caption = "";
  BitBtn2->Caption = "";  
}
//---------------------------------------------------------------------------
