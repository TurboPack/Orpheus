//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExPizzaU.h"
//---------------------------------------------------------------------------
#pragma link "OvcVlb"
#pragma link "OvcBase"
#pragma link "OvcVLB"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::VLBGetItem(TObject *Sender, int Index,
  AnsiString &ItemString)
{
  if (Index >= 0 && Index < MaxNumItems)
    ItemString = Items[Index];
  else
    ItemString = "*** Error ***";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::VLBGetItemStatus(TObject *Sender, int Index,
  bool &Protect)
{
  if (Index == 5 || Index == 11)
    Protect = true;
  else
    Protect = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnAddClick(TObject *Sender)
{
  if (VLB->NumItems < MaxNumItems)
    VLB->NumItems += 1; // increase list items
  btnAdd->Enabled = VLB->NumItems < MaxNumItems;
  btnRemove->Enabled = VLB->NumItems > 0;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnRemoveClick(TObject *Sender)
{
  if (VLB->NumItems > 0)
    VLB->NumItems -= 1; // decrease list items
  btnRemove->Enabled = VLB->NumItems > 0;
  btnAdd->Enabled = VLB->NumItems < MaxNumItems;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::VLBUserCommand(TObject *Sender, WORD Command)
{
  switch (Command) {
    case ccUser0 : btnRemoveClick(Sender); break;
    case ccUser1 : btnAddClick(Sender);    break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::VLBCharToItem(TObject *Sender, char Ch, int &Index)
{
  int I;
  bool Found;

  if (VLB->NumItems < 2) return;
  I = Index;
  do {
    I++;
    if (I >= VLB->NumItems) I = 0;
    Found = String(Ch) == Items[I][0];
  } while (!Found || (I != Index));
  if (Found) Index = I;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

