//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExVlbU.h"
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
void __fastcall TForm1::OvcVirtualListbox1GetItem(TObject *Sender, int Index,
  AnsiString &ItemString)
{
  // cheat and just return the index number as the item string
  ItemString = "Item # " + String((int)Index);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcVirtualListbox1GetItemColor(TObject *Sender,
  int Index, TColor &FG, TColor &BG)
{
  if (Index != OvcVirtualListbox1->ItemIndex) {
    if (Index % 13 == 0)
      FG = clRed;
    else if (Index % 7 == 0)
      FG = clGreen;
    else if (Index % 2 == 1)
      FG = clBlue;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcVirtualListbox1Click(TObject *Sender)
{
  int i = OvcVirtualListbox1->ItemIndex;
  if (i > -1)
    Label2->Caption = "Selected item: " + String((int)i);
  else
    Label2->Caption = "(none)";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcVirtualListbox1IsSelected(TObject *Sender,
  int Index, bool &Selected)
{
  if (Index <= 500)
    Selected = Select[Index];
  else
    Selected = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcVirtualListbox1Select(TObject *Sender, int Index,
  bool Selected)
{
  if (Index == -1)
    for (int i=0;i<500;i++)
      Select[i] = Selected;
  else if (Index <= 500)
    Select[Index] = Selected;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcVirtualListbox1TopIndexChanged(TObject *Sender,
  int NewTopIndex)
{
  Label3->Caption = "Top index: " + String((int)NewTopIndex);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

