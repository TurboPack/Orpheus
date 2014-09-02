//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDbCbu.h"
//---------------------------------------------------------------------------
#pragma link "OvcDbTbl"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCCBx"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Table2->First();
  while (!Table2->Eof) {
    OvcTCComboBox1->Items->Add(Table2->Fields[0]->AsString);
    Table2->Next();
  }
}
//---------------------------------------------------------------------------
