//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "excbglyu.h"
//---------------------------------------------------------------------------
#pragma link "OvcCkLb"
#pragma link "OvcLB"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;

Graphics::TBitmap* Bitmaps[5];

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  for (int i=0; i<ImageList1->Count; i++) {
    OvcCheckList1->GlyphIndex[i] = i;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormClose(TObject *Sender, TCloseAction &Action)
{
  for (int i=0; i<5; i++)
    delete(Bitmaps[i]);
}
//--------------------------------------------------------------------------- 
