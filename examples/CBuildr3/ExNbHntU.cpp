//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExNbHntU.h"
//---------------------------------------------------------------------------
#pragma link "OvcNbk"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::NB1MouseOverTab(TObject *Sender, int Index)
{
  CurIndex = Index;

  // If over a tab, set global flag to true
  OverTab = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Application->OnShowHint = DoShowHint;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DoShowHint(String& HintStr, bool& CanShow, THintInfo& HintInfo)
{
  TRect R;
  TPoint P;
  int VOffSet;

  if (HintInfo.HintControl == NB1) {
    R = NB1->GetTabRect(CurIndex);
    HintInfo.CursorRect = R;
    P.x = R.Left;
    P.y = R.Top;

    P = ClientToScreen(P);

    HintInfo.HintPos.x = P.x + 20;
    VOffSet = (R.Bottom - R.Top) * (3/2);
    HintInfo.HintPos.y = P.y + VOffSet;

    HintStr = NB1->Pages[CurIndex]->Hint;
  }
  // Show hint only if over a tab
  CanShow = OverTab;

  // Force global flag false so hint is not shown unless over a tab
  OverTab = false;
}
