//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExEfU.h"
//---------------------------------------------------------------------------
#pragma link "OvcSC"
#pragma link "OvcBase"
#pragma link "OvcNF"
#pragma link "OvcPB"
#pragma link "OvcEF"
#pragma link "OvcPF"
#pragma link "OvcSF"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SF1Change(TObject *Sender)
{
  Label2->Caption = SF1->AsString;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::PF1Change(TObject *Sender)
{
  Label4->Caption = PF1->AsString;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::PF2Change(TObject *Sender)
{
  Label6->Caption = PF2->AsString;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::NF1Change(TObject *Sender)
{
  Label9->Caption = NF1->AsString;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcController1Error(TObject *Sender, WORD ErrorCode,
  const AnsiString ErrorMsg)
{
  TMsgDlgButtons s;
  MessageDlg(ErrorMsg, mtError, s << mbOK, 0);
}
//---------------------------------------------------------------------------
void TForm1::SetPictureMasks()
{
  // set picture mask to correspond to the new win->ini settings
  PF1->PictureMask = OvcIntlSup->InternationalDate(true);
  Label3->Caption = PF1->PictureMask;
  PF2->PictureMask = OvcIntlSup->InternationalTime(true);
  Label10->Caption = PF2->PictureMask;
  NF1->PictureMask = OvcIntlSup->InternationalCurrency('#', 7, true, true, true);
  Label5->Caption = NF1->PictureMask;

  // adjust max length to match new picture mask length
  PF1->MaxLength = (char)PF1->PictureMask.Length();
  PF2->MaxLength = (char)PF2->PictureMask.Length();
}

void TForm1::ShowCountry()
{
  TIniFile* ini = new TIniFile("WIN->INI");
  try {
    Label8->Caption = "Country: " +
      ini->ReadString("Intl", "sCountry", "Unknown");
    delete ini;
  }
  catch (...) {
    delete ini;
  }
}

void __fastcall TForm1::WinIniChange(TObject* Sender)
{
  TOvcDate D;
  TOvcTime T;
  double R;

  // save current values
  D = PF1->AsOvcDate;
  T = PF2->AsOvcTime;
  R = NF1->AsFloat;

  OvcIntlSup->ResetInternationalInfo();
  SetPictureMasks();

  // restore values
  PF1->AsOvcDate = D;
  PF2->AsOvcTime = T;
  NF1->AsFloat = R;

  ShowCountry();

  PF1Change(Sender);
  PF2Change(Sender);
  NF1Change(Sender);
}
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  OvcIntlSup->AutoUpdate = true;
  OvcIntlSup->OnWinIniChange = WinIniChange;;

  SF1->AsString = "Orpheus";
  SetPictureMasks();
  // assign intial values
  PF1->AsOvcDate = CurrentDate();
  PF2->AsOvcTime = CurrentTime();
  NF1->AsFloat = 13.13;

  Label2->Caption = SF1->AsString;
  Label4->Caption = PF1->AsString;
  Label6->Caption = PF2->AsString;
  Label9->Caption = NF1->AsString;

  // show the current country from WIN->INI
  ShowCountry();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

