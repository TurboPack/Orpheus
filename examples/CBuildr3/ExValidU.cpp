//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExValidU.h"
//---------------------------------------------------------------------------
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcBase"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcNF"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  if (Form1->DefaultController->ValidateEntryFields() == 0)
    Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
