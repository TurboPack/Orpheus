//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExDbEfu.h"
//---------------------------------------------------------------------------
#pragma link "OvcDbDLb"
#pragma link "OvcRLbl"
#pragma link "OvcDbSF"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcBase"
#pragma link "OvcDbPF"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcDbNF"
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
  Close();    
}
//---------------------------------------------------------------------------

