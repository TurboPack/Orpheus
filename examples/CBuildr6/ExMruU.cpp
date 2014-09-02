//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExMruU.h"
//---------------------------------------------------------------------------
#pragma link "OvcState"
#pragma link "OvcBase"
#pragma link "OvcStore"
#pragma link "OvcFiler"
#pragma link "OvcMRU"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Open1Click(TObject *Sender)
{
  // Show the file open dialog.
  if (OpenDialog1->Execute())  {
    // Load the file into the Memo.
    Memo1->Lines->LoadFromFile(OpenDialog1->FileName);
    // Add all files to the main MRU list.
    FileMenuList->Add(OpenDialog1->FileName);
    // If a C++Builder BPR file was opened, add it to the top
    // of the split MRU list.
    if (UpperCase(ExtractFileExt(OpenDialog1->FileName)) == ".BPR" ||
        UpperCase(ExtractFileExt(OpenDialog1->FileName)) == ".MAK")  {
      BCBList->AddSplit(OpenDialog1->FileName, apTop);
      Reopen1->Enabled = true;
    }
    // If a C++Builder CPP file was opened, add it to the bottom
    // of the split MRU list.
    if (UpperCase(ExtractFileExt(OpenDialog1->FileName)) == ".CPP")  {
      BCBList->AddSplit(OpenDialog1->FileName, apBottom);
      Reopen1->Enabled = true;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ClearHistoryList1Click(TObject *Sender)
{
  BCBList->Clear();
  FileMenuList->Clear();
  Reopen1->Enabled = false;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Exit1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::MenuMRUClick(TObject *Sender,
      const AnsiString ItemText, TOvcMRUClickAction &Action)
{
  // A MRU menu item was clicked. Open the file in the Memo.
  Memo1->Lines->LoadFromFile(ItemText);
}
//---------------------------------------------------------------------------

