// Example program of how to dynamically create a splitter
// and place two dynamically created panels in each section

//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDSpltU.h"
//---------------------------------------------------------------------------
#pragma resource "*.dfm"
#pragma link "OvcBase"
#pragma link "OvcSplit"
#pragma link "ExtCtrls"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormActivate(TObject *Sender)
{
  Controller1 = new TOvcController(this);
  Split1 = new TOvcSplitter(this);
  Panel1 = new TPanel(Form1);
  Panel1->Parent = Split1->Section[0];
  Panel1->Align = alClient;
  Panel1->Caption = "Left Panel";
  Panel2 = new TPanel(this);
  Panel2->Parent = Split1->Section[1];
  Panel2->Align = alClient;
  Panel2->Caption = "Right Panel";
  Split1->Parent = Form1;
  Split1->Align = alClient;
  Split1->Height = Form1->ClientHeight;
  Split1->Width  = Form1->ClientWidth;
  Split1->Position  = Form1->ClientWidth / 2;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormResize(TObject *Sender)
{
   Split1->Position  = Form1->ClientWidth / 2;
}
//---------------------------------------------------------------------------
