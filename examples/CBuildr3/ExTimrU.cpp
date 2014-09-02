//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>
#include <stdlib.h>

#include "ExTimrU.h"
//---------------------------------------------------------------------------
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcBase"
#pragma link "OvcTimer"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnAddTriggerClick(TObject *Sender)
{
  TT->Add(0, (Word)F1->AsInteger);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  F1->AsInteger = 2000;
  F2->AsInteger = 2000;
  F3->AsInteger = 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TTTrigger(TObject *Sender, int Handle,
  Cardinal Interval, int ElapsedTime)
{
  double S = ElapsedTime / 1000;
  char buff[80];
  sprintf(buff,
    "%3d: Interval: %5d  Elapsed: %0.2f Sec", Handle, Interval, S);
  LB->Items->Add(buff);
  if (LB->Items->Count > 200)
    LB->Items->Delete(0);
  LB->ItemIndex = LB->Items->Count-1;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnAddLotsClick(TObject *Sender)
{
  for (int i=1;i<51;i++)
    TT->Add(0, (Word)(random(10000) + 500));
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnAddOnetimeClick(TObject *Sender)
{
  TT->AddOneTime(0, (Word)F2->AsInteger);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnRemoveAllTriggersClick(TObject *Sender)
{
  TT->RemoveAll();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnClearClick(TObject *Sender)
{
  LB->Clear();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnRemoveTriggClick(TObject *Sender)
{
  TT->Remove(F3->AsInteger);
  F3->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

