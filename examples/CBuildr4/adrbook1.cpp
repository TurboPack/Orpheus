//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <fstream.h>
#pragma hdrstop

#pragma warn -ucp-

#include "Adrbook1.h"
#include "CalUnit.h"
#include "Adrbook2.h"
//---------------------------------------------------------------------------
#pragma link "OvcNbk"
#pragma link "OvcBase"
#pragma link "OvcVlb"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcSC"
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcXfer"
#pragma link "OvcVLB"
#pragma resource "*.dfm"
TAddrForm *AddrForm;
//---------------------------------------------------------------------------
__fastcall TAddrForm::TAddrForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void TAddrForm::AddRecord()
{
  TRec* PTRRec;
  int ItemNum;
  String ListStr;

  PTRRec = new TRec(TR);
  if (String(TR.Company) == "")
    ListStr = String(TR.LastName) + String(", ") + String(TR.FirstName);
  else
    ListStr = String(TR.LastName) + String(", ")
      + String(TR.FirstName) + " (" + String(TR.Company) + ")";
  ItemNum = DataList->AddObject(ListStr, (TObject*)PTRRec);
  OvcVirtualListbox1->NumItems = DataList->Count;
  OvcVirtualListbox1->ItemIndex = ItemNum;
  RecState = rsDefault;
}

void __fastcall TAddrForm::AddrException(TObject* Sender, Exception* E)
{
  // Handle case where user reaches end of memo
  EEditorError* e = dynamic_cast<EEditorError*>(E);
  if (e)
    if (e->ErrorCode == oeTooManyBytes) return;
  Application->ShowException(E);
}

void TAddrForm::ClearData()
{
  for (int i=0;i<DataList->Count;i++) {
    TRec* rec = reinterpret_cast<TRec*>(DataList->Objects[i]);
    delete rec;
  }
}

void TAddrForm::InitAddrFormTransfer(TRec& DataRec)
{
  strcpy(DataRec.LastName, "");
  strcpy(DataRec.FirstName, "");
  strcpy(DataRec.Company, "");
  strcpy(DataRec.Street, "");
  strcpy(DataRec.City, "");
  strcpy(DataRec.State, "");
  strcpy(DataRec.Zip, "");
  strcpy(DataRec.HomePhone, "");
  strcpy(DataRec.WorkPhone, "");
  DataRec.Birthday      = CurrentDate();
  DataRec.Anniversary   = CurrentDate();
  strcpy(DataRec.Memo, "");
}

int TAddrForm::FindState(const String& P)
{
  for (int i=1;i<MaxStates+1;i++) {
    if (P == String(StateAbbrevs[i])) {
      return i;
    }
  }
  return -1;
}

void TAddrForm::ReadFile(TFileName AddrFile)
{
  ifstream DataFile(AddrFile.c_str());
  if (!DataFile) return;

  // avoid painting while file is loaded
  LockWindowUpdate(Handle);
  while (!DataFile.read((unsigned char *)&TR, sizeof(TR)).eof()) {
    AddRecord();
  }
  LockWindowUpdate(0);

  DataFile.close();
  OvcVirtualListbox1->Repaint();
  OvcVirtualListbox1->ItemIndex = 0;
}

void TAddrForm::SaveToFile(TFileName AddrFile)
{
  ofstream DataFile(AddrFile.c_str());
  TRec Temp;

  for (int i=0;i<DataList->Count;i++) {
    TransferFromDataList(i, Temp);
	  DataFile.write((unsigned char*)&Temp, sizeof(TR));
  }
  DataFile.close();
}

void __fastcall TAddrForm::StatusHint(TObject* Sender)
{
  Panel1->Caption = Application->Hint;
}

void TAddrForm::TransferFromDataList(int Index, TRec& Rec)
{
  memset(&Rec, 0, sizeof(Rec));
  Rec = *reinterpret_cast<TRec*>(DataList->Objects[Index]);
}

void TAddrForm::TransferFromForm()
{
  char buff[255];
  int BufSize;
  TComponent* array[] = {
    LastNameField,
    FirstNameField,
    CompanyField,
    StreetField,
    CityField,
    StateField,
    ZipField,
    HomePhoneField,
    WorkPhoneField,
    BirthdayField,
    AnniversaryField };
  OvcTransfer1->TransferFromFormZ(array, 10, &TR);
  BufSize = OvcEditor1->GetText(buff, sizeof(buff));
  // Strip off final CR/LF that the editor adds
  if (buff[BufSize-3] == 0x0D) buff[BufSize-3] = 0;
  strcpy(TR.Memo, buff);
}

void TAddrForm::TransferToForm()
{
  TComponent* array[] = {
    LastNameField,
    FirstNameField,
    CompanyField,
    StreetField,
    CityField,
    StateField,
    ZipField,
    HomePhoneField,
    WorkPhoneField,
    BirthdayField,
    AnniversaryField };
  OvcTransfer1->TransferToFormZ(array, 10, &TR);
  // This rather ugly syntax creates an AnsiString object from
  // a SmallString (TR.Memo) and converts it to a char* with
  // the c_str() operator. This is necessary because the
  // SmallString template does not have a c_str() operator.
  OvcEditor1->SetText(String(TR.Memo).c_str());
}

void TAddrForm::UpdateFileName(TFileName FName)
{
  CurFile = FName;
  AddrForm->Caption =
    "Address Book Demo - " + ExtractFileName(FName);
}

void TAddrForm::UpdateMemoLabel()
{
  Label2->Caption = "Memo for: "
    + FirstNameField->Text + " " + LastNameField->Text;
}

void TAddrForm::UpdateRecord()
{
  int i = OvcVirtualListbox1->ItemIndex;
  TRec* rec = reinterpret_cast<TRec*>(DataList->Objects[i]);
  delete rec;
  DataList->Delete(i);
  AddRecord();
  RecState = rsDefault;
}

void TAddrForm::WMGetMinMaxInfo(TWMGetMinMaxInfo& Msg)
{
  TForm::DefaultHandler(&Msg);
  Msg.MinMaxInfo->ptMinTrackSize.x = 435;
  Msg.MinMaxInfo->ptMinTrackSize.y = 380;
}

void __fastcall TAddrForm::OvcSpinner1Click(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap)
{
  int i;
  String CurState = "";

  // Get the current value of the field
  TOvcSimpleField* sf =
    dynamic_cast<TOvcSimpleField*>(OvcSpinner1->FocusedControl);
  CurState = sf->AsString;
  if (CurState == "")
    if (State == ssUpBtn)
      i = 1;
    else i = MaxStates;
  else
    // Look for the state
    i = FindState(CurState);
  if (i != -1) {
    if (State == ssUpBtn)
      if (i == 1)
        i = MaxStates;
      else
        i--;
    else
      if (i == MaxStates)
        i = 1;
      else
        i++;
    sf->AsString = StateAbbrevs[i];
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::StateFieldUserCommand(TObject *Sender, WORD Command)
{
  String CurState;
  int i;

  // Get the current value of the field
  CurState = dynamic_cast<TOvcSimpleField*>(OvcSpinner1->FocusedControl)->AsString;
  if (CurState == "")
    if (Command == ccUser0)
      i = 1;
    else i = MaxStates;
  else
    // Look for the state
    i = FindState(CurState);
  if (i != -1) {
    if (Command == ccUser0)
      if (i == 1)
        i = MaxStates;
      else
        i--;
    else
      if (i == MaxStates)
        i = 1;
      else
        i++;
    dynamic_cast<TOvcSimpleField*>(OvcSpinner1->FocusedControl)->AsString = StateAbbrevs[i];
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::StateFieldUserValidation(TObject *Sender,
  WORD &ErrorCode)
{
  String CurState;

  if (ErrorCode != 0) return;
  CurState = StateField->Text;
  if (CurState != "")
    if (FindState(CurState) == -1)
      ErrorCode = (Word)StateError;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::StateFieldError(TObject *Sender, WORD ErrorCode,
  AnsiString ErrorMsg)
{
  if (ErrorCode == StateError)
    ShowMessage("Not a valid state abbreviation");
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::PictureFieldExit(TObject *Sender)
{
  TOvcPictureField* pf = dynamic_cast<TOvcPictureField*>(Sender);
  pf->Uninitialized = false;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::PhoneFieldUserValidation(TObject *Sender,
  WORD &ErrorCode)
{
  if (ErrorCode != 0) return;
  TOvcPictureField* pf = dynamic_cast<TOvcPictureField*>(Sender);
  ErrorCode = ValidateSubfields(pf, "(ppp) uuu-uuuu");
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::ZipFieldUserValidation(TObject *Sender,
  WORD &ErrorCode)
{
  TOvcPictureField* pf = dynamic_cast<TOvcPictureField*>(Sender);
  ErrorCode = ValidateSubfields(pf, "uuuuu-pppp");
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Exit1Click(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Open1Click(TObject *Sender)
{
  if (OpenDialog1->Execute()) {
    DataList->Clear();
    OvcVirtualListbox1->NumItems = DataList->Count;
    ReadFile(OpenDialog1->FileName);
    UpdateFileName(OpenDialog1->FileName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Save1Click(TObject *Sender)
{
  if (CurFile == "NONAME")
    SaveAs1Click(Sender);
  else
    SaveToFile(CurFile);
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Insert1Click(TObject *Sender)
{
  if (RecState == rsNew) {
    TransferFromForm();
    AddRecord();
    OvcVirtualListbox1->Repaint();
    LastNameField->SetFocus();
  }
  InitAddrFormTransfer(TR);
  TransferToForm();
  RecState = rsNew;
  OvcNotebook1->PageIndex = 1;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Delete1Click(TObject *Sender)
{
  if (OvcVirtualListbox1->ItemIndex == -1) return;
  OvcNotebook1->PageIndex = 0;
  DataList->Delete(OvcVirtualListbox1->ItemIndex);
  OvcVirtualListbox1->NumItems -= 1;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::Modify1Click(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems <= 0) return;
  TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
  TransferToForm();
  RecState = rsEdit;
  OvcNotebook1->PageIndex = 1;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::SaveAs1Click(TObject *Sender)
{
  if (SaveDialog1->Execute()) {
    SaveToFile(SaveDialog1->FileName);
    UpdateFileName(SaveDialog1->FileName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::OvcNotebook1PageChanged(TObject *Sender, int Index)
{
  if (Index == 1)
    LastNameField->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::About1Click(TObject *Sender)
{
  AdrAbout->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::New1Click(TObject *Sender)
{
  DataList->Clear();
  UpdateFileName("NONAME");
  OvcVirtualListbox1->NumItems = DataList->Count;
  OvcVirtualListbox1->Repaint();
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::LastButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems > 0) {
    OvcVirtualListbox1->ItemIndex = OvcVirtualListbox1->NumItems - 1;
    TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
    TransferToForm();
    UpdateMemoLabel();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::FirstButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems > 0) {
    OvcVirtualListbox1->ItemIndex = 0;
    TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
    TransferToForm();
    UpdateMemoLabel();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::NextButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems > 0) {
    OvcVirtualListbox1->ItemIndex = OvcVirtualListbox1->ItemIndex + 1;
    TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
    TransferToForm();
    UpdateMemoLabel();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::PrevButtonClick(TObject *Sender)
{
  if ((OvcVirtualListbox1->NumItems > 0) &&
        (OvcVirtualListbox1->ItemIndex != 0)) {
    OvcVirtualListbox1->ItemIndex = OvcVirtualListbox1->ItemIndex - 1;
    TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
    TransferToForm();
    UpdateMemoLabel();
  }
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::DisplayCalendar(TObject *Sender,
  WORD Command)
{
  TOvcPictureField* PF;
  TOvcDate D;

  CalForm = new TCalForm(Application);
  try {
    PF = dynamic_cast<TOvcPictureField*>(Sender);
    D = PF->AsOvcDate;
    if (D == BadDate)
      D = CurrentDate();
    CalForm->Calendar->CalendarDate = StDateToDateTime(D);
    CalForm->ShowModal();
    if (CalForm->ModalResult == mrOk) {
      PF->AsDateTime = CalForm->Calendar->CalendarDate;
      PF->Uninitialized = false;
    }
  }
  catch (...) {
    delete CalForm;
  }
  delete CalForm;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::PopupCalendar(TObject *Sender)
{
  TOvcPictureField* PF;
  TOvcDate D;

  CalForm = new TCalForm(Application);
  try {
    PF = dynamic_cast<TOvcPictureField*>(Sender);
    D = PF->AsOvcDate;
    if (D == BadDate)
      D = CurrentDate();
    CalForm->Calendar->CalendarDate = StDateToDateTime(D);
    CalForm->ShowModal();
    if (CalForm->ModalResult == mrOk) {
      PF->AsDateTime = CalForm->Calendar->CalendarDate;
      PF->Uninitialized = false;
    }
  }
  catch (...) {
    delete CalForm;
  }
  delete CalForm;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::OvcVirtualListbox1GetItem(TObject *Sender,
  int Index, AnsiString &ItemString)
{
  if ((Index >= 0) && (Index < DataList->Count))
    ItemString = DataList->Strings[Index];
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::FormDestroy(TObject *Sender)
{
  ClearData();
  delete DataList;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::FormCreate(TObject *Sender)
{
  BH = Height;
  BW = Width;
  RecState = rsDefault;
  // Add international date support
  BirthdayField->PictureMask = BirthdayField->IntlSupport->InternationalDate(true);
  AnniversaryField->PictureMask = AnniversaryField->IntlSupport->InternationalDate(true);
  // Initialize our data list
  DataList = new TStringList;
  DataList->Sorted = true;
  DataList->Duplicates = dupError;
  OvcVirtualListbox1->NumItems = 0;
  InitAddrFormTransfer(TR);
  OvcEditor1->WrapColumn = OvcEditor1->VisibleColumns;
  Application->OnHint = StatusHint;
  Application->OnException = AddrException;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::FormResize(TObject *Sender)
{
  int AH, AW;
  TRect R;

  AH = Height;
  AW = Width;
  // Iterate through all components on form
  for (int i=0;i<ComponentCount;i++) {
  // Size only if component is a TControl descendant
    if (dynamic_cast<TControl*>(Components[i]))
      // Skip sizing certain components
      if (!(dynamic_cast<TOvcNotebook*>(Components[i]) ||
          dynamic_cast<TPanel*>(Components[i]) ||
          dynamic_cast<TSpeedButton*>(Components[i]))) {
        // Resize component
        R = dynamic_cast<TControl*>(Components[i])->BoundsRect;
        R.Left = MulDiv(R.Left, AW, BW);
        R.Top = MulDiv(R.Top, AH, BH);
        R.Right = MulDiv(R.Right, AW, BW);
        R.Bottom = MulDiv(R.Bottom, AH, BH);
      }
    TControl(Components[i]).BoundsRect = R;
  }
  // Update Height/Width for next time
  BH = Height;
  BW = Width;
}
//---------------------------------------------------------------------------
void __fastcall TAddrForm::OvcNotebook1PageChange(TObject *Sender, int Index,
  bool &AllowChange)
{
  AllowChange = true;
  if (Index == 0) {
    if ((LastNameField->AsString == "") && (FirstNameField->AsString == "")
      && (CompanyField->AsString == "")) {
        AllowChange = (::MessageBox(Handle,
        "At least one of the first three fields "
        "on the Client Info page must be filled in."
        "This record will NOT be saved if you choose OK.",
        "Warning!", MB_OKCANCEL) == mrOk);
        if (AllowChange) RecState = rsDefault;
    }
    else {
      TransferFromForm();
      switch (RecState) {
        case rsEdit : UpdateRecord(); break;
        case rsNew  : AddRecord();
      }
      OvcVirtualListbox1->Repaint();
    }
  }
  if (OvcNotebook1->PageIndex == 0) {
    if ((OvcVirtualListbox1->NumItems > 0) && (RecState != rsNew)) {
      TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
      TransferToForm();
      RecState = rsEdit;
    }
    else {
      InitAddrFormTransfer(TR);
      TransferToForm();
      RecState = rsNew;
    }
  }
  if (Index == 2)
    UpdateMemoLabel();
}
//---------------------------------------------------------------------------
 
