//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExOdtU.h"
//---------------------------------------------------------------------------
#pragma link "OvcNbk"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TfrmOwnerDrawTabs *frmOwnerDrawTabs;
//---------------------------------------------------------------------------
__fastcall TfrmOwnerDrawTabs::TfrmOwnerDrawTabs(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmOwnerDrawTabs::FormCreate(TObject *Sender)
{
  char A, B;

  // create and load the tab glyph
  Glyph = new Graphics::TBitmap;
  Glyph->Handle = LoadBitmap(HInstance, "CHECK");

  // create dummy name list
  Data = new TStringList;
  for (A='A';A<'Z'+1;A++)
    for (B='A';B<'Z'+1;B++)
      Data->Add(String(A) + String(B) + String(B));

  // force intial page refresh
  NotebookPageChanged(Notebook, 0);
}
//---------------------------------------------------------------------------
void __fastcall TfrmOwnerDrawTabs::FormDestroy(TObject *Sender)
{
  delete Glyph;
  delete Data;
}
//---------------------------------------------------------------------------
void __fastcall TfrmOwnerDrawTabs::OvcNotebook1DrTa(TObject *Sender, int Index,
  const AnsiString Title, TRect &R, bool Enabled, bool Active)
{
  TCanvas* C;

  C = dynamic_cast<TOvcNotebook*>(Sender)->Canvas;

  // use the forms font
  C->Font = Font;

  // draw the glyph for the active tab
  if (Active) {
    C->BrushCopy(Bounds(R.Left+1, R.Top+1, Glyph->Width, Glyph->Height), Glyph,
            Bounds(0, 0, Glyph->Width, Glyph->Height), clOlive);
  }

  // draw the tab text
  DrawText(C->Handle, Title.c_str(), Title.Length(),
    (RECT*)&R, DT_CENTER | DT_VCENTER | DT_SINGLELINE);
}
//---------------------------------------------------------------------------
void __fastcall TfrmOwnerDrawTabs::NotebookDrawTab(TObject *Sender, int Index,
  const AnsiString Title, TRect &R, bool Enabled, bool Active)
{
  TCanvas* C;

  C = dynamic_cast<TOvcNotebook*>(Sender)->Canvas;

  // use the forms font
  C->Font = Font;

  // draw the glyph for the active tab
  if (Active) {
    C->BrushCopy(Bounds(R.Left+1, R.Top+1, Glyph->Width, Glyph->Height), Glyph,
            Bounds(0, 0, Glyph->Width, Glyph->Height), clOlive);
  }

  // draw the tab text
  DrawText(C->Handle, Title.c_str(), Title.Length(),
    (RECT*)&R, DT_CENTER | DT_VCENTER | DT_SINGLELINE);
}
//---------------------------------------------------------------------------
void __fastcall TfrmOwnerDrawTabs::NotebookPageChanged(TObject *Sender,
  int Index)
{
  int i, Idx;
  TOvcNotebook* NB;
  TOvcTabPage* NBP;

  // disable listbox painting
  SendMessage(LB->Handle, WM_SETREDRAW, 0, 0);

  LB->Clear();

  NB = dynamic_cast<TOvcNotebook*>(Sender);
  Idx = Index;

  // if this was a main tab change, find the notebook on this page
  if (NB->Name == Notebook->Name) {
    // get the notebook page object
    NBP = NB->Pages[Index];
    // find the child notebook component on this page
    for (i=0;i<NBP->ControlCount;i++) {
      TOvcNotebook* n =
        dynamic_cast<TOvcNotebook*>(NBP->Controls[i]);
      if (n) {
        NB = dynamic_cast<TOvcNotebook*>(NBP->Controls[0]);
        break;
      }
    }
    Idx = NB->PageIndex;
  }

  for (i=0;i<Data->Count;i++) {
    String s1 = Data->Strings[i][1];
    String s2 = NB->Pages[Idx]->Caption[1];
    if (s1 == s2)
      LB->Items->Add(Data->Strings[i]);
  }
  // enable listbox painting
  SendMessage(LB->Handle, WM_SETREDRAW, 1, 0);
}
//---------------------------------------------------------------------------
