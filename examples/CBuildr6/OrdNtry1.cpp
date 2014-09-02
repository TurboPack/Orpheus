//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>

#include "OrdNtry1.h"
#include "OrdNtry2.h"
//---------------------------------------------------------------------------
#pragma link "OvcNbk"
#pragma link "OvcBase"
#pragma link "OvcVlb"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcSC"
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcXfer"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCNum"
#pragma link "OvcTCBEF"
#pragma link "OvcTCSim"
#pragma link "OvcTCHdr"
#pragma link "OvcVLB"
#pragma resource "*.dfm"
TOrdEntryForm *OrdEntryForm;
//---------------------------------------------------------------------------
__fastcall TOrdEntryForm::TOrdEntryForm(TComponent* Owner)
  : TForm(Owner), DataListIsModified(false)
{
}

__fastcall TOrdEntryForm::~TOrdEntryForm()
{
  delete DataList;
}
//---------------------------------------------------------------------------

int TOrdEntryForm::FindState(const String& P)
{
  for (int i=1;i<MaxStates+1;i++) {
    if (P == String(StateAbbrevs[i])) {
      return i;
    }
  }
  return -1;
}

void TOrdEntryForm::AddRecord()
{
  TRec* PtrRec = new TRec(TR);
  int ItemNum;
  String DateStr;
  String ListStr;
  char buff[80];

  if (TR.Date == BadDate)
    TR.Date = Ovcdate::CurrentDate();
  DateStr = FormatDateTime("mm/dd/yy", StDateToDateTime(TR.Date));
  if (String(TR.Company) == "") {
    sprintf(buff, "%s  %s  %s",
      DateStr.c_str(), String(TR.FirstName).c_str(), String(TR.LastName).c_str());
    ListStr = buff;
  }
  else if (String(TR.FirstName) == "" && String(TR.LastName) == "") {
    sprintf(buff, "%s  %s", DateStr.c_str(), String(TR.Company).c_str());
    ListStr = buff;
  }
  else {
    sprintf(buff, "%s  %s  (%s %s)",
      DateStr.c_str(), String(TR.Company).c_str(),
      String(TR.FirstName).c_str(), String(TR.LastName).c_str());
    ListStr = buff;
  }
  ItemNum = DataList->AddObject(ListStr, reinterpret_cast<TObject*>(PtrRec));
  OvcVirtualListbox1->NumItems = DataList->Count;
  OvcVirtualListbox1->ItemIndex = ItemNum;
  RecState = rsDefault;
}

void __fastcall TOrdEntryForm::OrdException(TObject* Sender, Exception* E)
{
  // Handle case where user reaches end of memo
  EEditorError* e = dynamic_cast<EEditorError*>(E);
  if (e)
    if (e->ErrorCode == oeTooManyBytes) return;
  Application->ShowException(e);
}

void TOrdEntryForm::ClearData()
{
  for (int i=0;i<DataList->Count;i++) {
    TRec* rec = reinterpret_cast<TRec*>(DataList->Objects[i]);
    if (rec) delete rec;
  }
}

void TOrdEntryForm::InitOrderFormTransfer(TRec& DataRec)
{
  DataRec.LastName      = "";
  DataRec.FirstName     = "";
  DataRec.Company       = "";
  DataRec.Street        = "";
  DataRec.City          = "";
  DataRec.State         = "";
  DataRec.Zip           = "";
  DataRec.Date          = BadDate;
  memset(DataRec.Orders, 0, sizeof(DataRec.Orders));
}

bool TOrdEntryForm::InvalidRecord()
{
  return (LastNameField->AsString == "") && (FirstNameField->AsString == "")
    && (CompanyField->AsString == "");
}

void TOrdEntryForm::MoveToRecord(int Index, TRec& Rec)
{
  TransferFromDataList(Index, Rec);
  TransferToForm();
  if (OvcNotebook1->PageIndex == 1)
    RecState = rsEdit;
  UpdateTable();
}

bool TOrdEntryForm::OrderWasModified()
{
  TRec* DataRec;
  TRec Temp;
  TransferFromForm();
  if (RecState == rsNew) {
    InitOrderFormTransfer(Temp);
    DataRec = &Temp;
  }
  else
    DataRec = reinterpret_cast<TRec*>(
      DataList->Objects[OvcVirtualListbox1->ItemIndex]);
  return CompStruct(&TR, DataRec, sizeof(TR)) != 0;
}

void TOrdEntryForm::ReadFile(TFileName OrderFile)
{
  ifstream DataFile(OrderFile.c_str());
  if (!DataFile) return;

  // avoid painting while file is loaded
  LockWindowUpdate(Handle);
  while (!DataFile.read((char *)&TR, sizeof(TR)).eof()) {
    AddRecord();
  }
  LockWindowUpdate(0);
  DataFile.close();
  OvcVirtualListbox1->Repaint();
  OvcVirtualListbox1->ItemIndex = 0;
}

void TOrdEntryForm::ResetForm()
{
  if (ResetTable()) {
    TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
    TransferToForm();
    UpdateTable();
    RecState = rsEdit;
  }
}

bool TOrdEntryForm::ResetTable()
{
  if (OvcTable1->InEditingState())
    return OvcTable1->StopEditingState(true);
  else
    return true;
}

void TOrdEntryForm::SaveToFile(TFileName OrderFile)
{
  ofstream DataFile;
  DataFile.open(OrderFile.c_str());
  TRec Temp;

  for (int i=0;i<DataList->Count;i++) {
    TransferFromDataList(i, Temp);
	  DataFile.write((char*)&Temp, sizeof(TR));
  }
  DataFile.close();
}

void __fastcall TOrdEntryForm::StatusHint(TObject* Sender)
{
  StatusBar1->SimpleText = Application->Hint;
}

void __fastcall TOrdEntryForm::TableHint(String& HintStr, bool& CanShow, THintInfo& HintInfo)
{
  TRowNum HintRow;
  TColNum HintCol;
  long CellRight, CellBottom;
  TPoint Temp;
  TOvcTblRegion TblRegion;

  if (HintInfo.HintControl == OvcTable1) {
    // Which cell are we in?
    TblRegion = OvcTable1->CalcRowColFromXY(
      HintInfo.CursorPos.x, HintInfo.CursorPos.y, HintRow, HintCol);
    // Handle if mouse is over a non-cell area
    if (TblRegion == otrOutside || TblRegion == otrInUnused) {
      HintInfo.CursorRect = Rect(
        HintInfo.CursorPos.x - 1, HintInfo.CursorPos.y - 1,
        HintInfo.CursorPos.x + 1, HintInfo.CursorPos.y + 1);
      HintStr = "Non-cell area";
    }
    else {
      // Calculate the right side of the cell
      CellRight = (OvcTable1->ColOffset[HintCol] +
        OvcTable1->Columns->Width[HintCol]);
        // Handle if next cell is out of view
      if (CellRight > OvcTable1->ClientWidth)
        CellRight = OvcTable1->ClientWidth;
        // Do the same for the bottom of the cell
      CellBottom = (OvcTable1->RowOffset[HintRow] +
        OvcTable1->Rows->Height[HintRow]);
      if (CellBottom > OvcTable1->ClientHeight)
        CellBottom = OvcTable1->ClientHeight;
        // Set CursorRect to the cell"s rect
      HintInfo.CursorRect = Rect(OvcTable1->ColOffset[HintCol],
        OvcTable1->RowOffset[HintRow], CellRight, CellBottom);
        // Set HintStr appropriately
      char buff[40];
      sprintf(buff, "Column: %d Row: %d", HintCol, HintRow);
      HintStr = buff;
    }
    // Set the position of the hint
    Temp = OvcTable1->ClientToScreen(HintInfo.CursorPos);
    HintInfo.HintPos.x = Temp.x - 10;
    HintInfo.HintPos.y = Temp.y + 20;
  }
}

void TOrdEntryForm::TransferFromDataList(long Index, TRec& Rec)
{
  memset(&Rec, 0, sizeof(Rec));
  TRec* DataRec = reinterpret_cast<TRec*>(DataList->Objects[Index]);
  Rec.LastName    = DataRec->LastName;
  Rec.FirstName   = DataRec->FirstName;
  Rec.Company     = DataRec->Company;
  Rec.Street      = DataRec->Street;
  Rec.City        = DataRec->City;
  Rec.State       = DataRec->State;
  Rec.Zip         = DataRec->Zip;
  Rec.Date        = DataRec->Date;
  for (int i=0;i<NumOrders;i++) {
    Rec.Orders[i].Qty   = DataRec->Orders[i].Qty;
    Rec.Orders[i].Desc  = DataRec->Orders[i].Desc;
    Rec.Orders[i].Cost  = DataRec->Orders[i].Cost;
    Rec.Orders[i].Total = DataRec->Orders[i].Total;
  }
}

void TOrdEntryForm::TransferFromForm()
{
  TComponent* array[] = {
    LastNameField,
    FirstNameField,
    CompanyField,
    StreetField,
    CityField,
    StateField,
    ZipField
  };
  OvcTransfer1->TransferFromForm(array, 6, &TR);
}

void TOrdEntryForm::TransferToForm()
{
  TComponent* array[] = {
    LastNameField,
    FirstNameField,
    CompanyField,
    StreetField,
    CityField,
    StateField,
    ZipField
  };
  OvcTransfer1->TransferToForm(array, 6, &TR);
}

void TOrdEntryForm::UpdateFileName(TFileName FName)
{
  CurFile = FName;
  char buff[MAX_PATH];
  sprintf(buff, "Order Entry Demo - %s", ExtractFileName(FName).c_str());
  OrdEntryForm->Caption = buff;
}

void TOrdEntryForm::UpdateIfModified()
{
  if (OrderWasModified()) {
    switch (RecState) {
      case rsEdit : UpdateRecord(); break;
      case rsNew  : AddRecord(); break;
    }
    OvcVirtualListbox1->Repaint();
    DataListIsModified = true;
  }
}

void TOrdEntryForm::UpdateRecord()
{
  DataList->Delete(OvcVirtualListbox1->ItemIndex);
  AddRecord();
  RecState = rsDefault;
}

void TOrdEntryForm::UpdateTable()
{
  OvcTable1->AllowRedraw = false;
  OvcTable1->InvalidateTable();
  OvcTable1->AllowRedraw = true;
  OvcTable1->ActiveRow = 1;
  OvcTable1->ActiveCol = 1;
  OvcTable1->TopRow = 1;
}

bool TOrdEntryForm::WillNotSave()
{
  return MessageDlg("At least one of the first three fields on the "
    "Client Info page must be filled in. This record will NOT be saved "
    "if you choose OK.",
    mtInformation, TMsgDlgButtons() << mbOK << mbCancel, 0) == mrOk;
}

void __fastcall TOrdEntryForm::WMGetMinMaxInfo(TWMGetMinMaxInfo& Message)
{
  TMinMaxInfo* MinMax;
  DefaultHandler(&Message);
  MinMax = Message.MinMaxInfo;
  MinMax->ptMinTrackSize.x = 435;
  MinMax->ptMinTrackSize.y = 380;
}

void __fastcall TOrdEntryForm::Exit1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::FormCreate(TObject *Sender)
{
  BH = Height;
  BW = Width;
  RecState = rsDefault;
  // Initialize our data list
  DataList = new TStringList;
  DataList->Sorted = true;
  DataList->Duplicates = dupAccept;
  OvcVirtualListbox1->NumItems = 0;
  InitOrderFormTransfer(TR);
  Application->OnHint = &StatusHint;
  Application->OnShowHint = &TableHint;
  Application->OnException = &OrdException;
  if (OvcNotebook1->PageIndex == 0) {
    InsertHotkey1->Enabled = true;
    DeleteHotkey1->Enabled = true;
  }
  CurFile = "NONAME";
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::FormDestroy(TObject *Sender)
{
  ClearData();
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::FormResize(TObject *Sender)
{
  TRect R;
  int AH = Height;
  int AW = Width;
  // Iterate through all components on form
  for (int i=0;i<ComponentCount;i++) {
    // Size only if component is a TControl descendant
    if (dynamic_cast<TControl*>(Components[i]))
      // Skip sizing certain components
      if (!dynamic_cast<TOvcNotebook*>(Components[i]) ||
             dynamic_cast<TPanel*>(Components[i]) ||
             dynamic_cast<TSpeedButton*>(Components[i])) {
        // Resize component
      TControl* ctl = dynamic_cast<TControl*>(Components[i]);
      if (ctl) {
        R = ctl->BoundsRect;
        R.Left = MulDiv(R.Left, AW, BW);
        R.Top = MulDiv(R.Top, AH, BH);
        R.Right = MulDiv(R.Right, AW, BW);
        R.Bottom = MulDiv(R.Bottom, AH, BH);
        ctl->BoundsRect = R;
      }
    }
  }
  // Update Height/Width for next time
  BH = Height;
  BW = Width;
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::Insert1Click(TObject *Sender)
{
  if (RecState != rsDefault)
    UpdateIfModified();
  InitOrderFormTransfer(TR);
  UpdateTable();
  TransferToForm();
  RecState = rsNew;
  OvcNotebook1->PageIndex = 1;
  LastNameField->SetFocus();
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::Open1Click(TObject *Sender)
{
  if (OpenDialog1->Execute()) {
    DataList->Clear();
    OvcVirtualListbox1->NumItems = DataList->Count;
    ReadFile(OpenDialog1->FileName);
    UpdateFileName(OpenDialog1->FileName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcNotebook1PageChange(TObject *Sender,
  int Index, bool &AllowChange)
{
  AllowChange = true;
  if (Index == 0) {
    if (InvalidRecord()) {
      AllowChange = WillNotSave() && ResetTable();
      if (AllowChange) {
        InsertHotkey1->Enabled = true;
        DeleteHotkey1->Enabled = true;
        RecState = rsDefault;
      }
    }
    else {
      AllowChange = ResetTable();
      if (AllowChange) {
        InsertHotkey1->Enabled = true;
        DeleteHotkey1->Enabled = true;
        UpdateIfModified();
      }
    }
  }
  if (OvcNotebook1->PageIndex == 0) {
    InsertHotkey1->Enabled = false;
    DeleteHotkey1->Enabled = false;
    if (OvcVirtualListbox1->NumItems > 0 && RecState != rsNew) {
      TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
      TransferToForm();
      RecState = rsEdit;
    }
    else {
      InitOrderFormTransfer(TR);
      TransferToForm();
      RecState = rsNew;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TOrdEntryForm::OvcSpinner1Click(TObject *Sender,
TOvcSpinState State, double Delta, bool Wrap)
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
    TOvcSimpleField* sf =
      dynamic_cast<TOvcSimpleField*>(OvcSpinner1->FocusedControl);
    if (sf)
      sf->AsString = StateAbbrevs[i];
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcVirtualListbox1GetItem(TObject *Sender,
  int Index, AnsiString &ItemString)
{
  if (Index >= 0 && Index < DataList->Count) 
    ItemString = DataList->Strings[Index];
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::PictureFieldExit(TObject *Sender)
{
  TOvcPictureField* pf = dynamic_cast<TOvcPictureField*>(Sender);
  if (pf) pf->Uninitialized = false;
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::PopupCalendar(TObject *Sender)
{
  TCalForm* CalForm = new TCalForm(Application);
  try {
    CalForm->Calendar->CalendarDate = (double)TDateTime::CurrentDate();
    CalForm->ShowModal();
  }
  catch (...) {
    delete CalForm;
  }
  delete CalForm;
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::Save1Click(TObject *Sender)
{
  if (CurFile == "NONAME")
    SaveAs1Click(Sender);
  else
    SaveToFile(CurFile);
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::StateFieldError(TObject *Sender, WORD ErrorCode,
  AnsiString ErrorMsg)
{
  if (ErrorCode == StateError)
    ShowMessage("Not a valid state abbreviation");
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::StateFieldUserCommand(TObject *Sender,
  WORD Command)
{
  String CurState;
  int i;

  // Get the current value of the field
  TOvcSimpleField* sf =
    dynamic_cast<TOvcSimpleField*>(OvcSpinner1->FocusedControl);
  if (sf) {
    CurState = sf->AsString;
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
     sf->AsString = StateAbbrevs[i];
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::StateFieldUserValidation(TObject *Sender,
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
void __fastcall TOrdEntryForm::ZipFieldUserValidation(TObject *Sender,
  WORD &ErrorCode)
{
  TOvcPictureField* pf = dynamic_cast<TOvcPictureField*>(Sender);
  ErrorCode = ValidateSubfields(pf, "uuuuu-pppp");
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::Delete1Click(TObject *Sender)
{
  if (RecState == rsNew) {
    ResetForm();
    return;
  }
  if (OvcVirtualListbox1->ItemIndex == -1) return;
  OvcNotebook1->PageIndex = 0;
  DataList->Delete(OvcVirtualListbox1->ItemIndex);
  OvcVirtualListbox1->NumItems--;
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::Modify1Click(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems <= 0) return;
  TransferFromDataList(OvcVirtualListbox1->ItemIndex, TR);
  TransferToForm();
  RecState = rsEdit;
  OvcNotebook1->PageIndex = 1;
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::SaveAs1Click(TObject *Sender)
{
  if (SaveDialog1->Execute()) {
    SaveToFile(SaveDialog1->FileName);
    UpdateFileName(SaveDialog1->FileName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcNotebook1PageChanged(TObject *Sender,
  int Index)
{
  if (Index == 1) {
    UpdateTable();
    LastNameField->SetFocus();
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::About1Click(TObject *Sender)
{
  OrdAbout->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::New1Click(TObject *Sender)
{
  DataList->Clear();
  UpdateFileName("NONAME");
  OvcVirtualListbox1->NumItems = DataList->Count;
  OvcVirtualListbox1->Repaint();
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcTable1GetCellData(TObject *Sender,
  int RowNum, int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  CellData = "";
  Data = &CellData;
  if (RowNum == 0) {
    CellData = "";
    switch (ColNum) {
      case 1 : CellData = "Qty"; break;
      case 2 : CellData = "Description"; break;
      case 3 : CellData = "Price"; break;
      case 4 : CellData = "Total"; break;
    }
  }
  else {
    switch (ColNum) {
      case 1 : Data = &TR.Orders[RowNum - 1].Qty; break;
      case 2 : Data = &TR.Orders[RowNum - 1].Desc; break;
      case 3 : Data = &TR.Orders[RowNum - 1].Cost; break;
      case 4 : {
        CalcValue = TR.Orders[RowNum - 1].Qty * TR.Orders[RowNum - 1].Cost;
        Data = &CalcValue;
      }
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcTable1GetCellAttributes(TObject *Sender,
  int RowNum, int ColNum, TOvcCellAttributes &CellAttr)
{
  if (ColNum == 4)
    if (RowNum != 0) {
      CellAttr.caFontColor = clBlue;
      CellAttr.caAccess = otxReadOnly;
    }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcTable1ActiveCellMoving(TObject *Sender,
  WORD Command, int &RowNum, int &ColNum)
{
  if (ColNum == 4)
    if (RowNum == OvcTable1->RowLimit - 1) {
      OvcTable1->AllowRedraw = false;
      OvcTable1->InvalidateCell(RowNum, 4);
      OvcTable1->AllowRedraw = true;
      ColNum = 3;
    }
    else {
      ColNum = 1;
      RowNum++;
    }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcTable1LeavingColumn(TObject *Sender,
  int ColNum)
{
  if (ColNum == 1 || ColNum == 3)
    OvcTable1->InvalidateCell(OvcTable1->ActiveRow, 4);
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::OvcTable1LeavingRow(TObject *Sender, int RowNum)
{
  if (OvcTable1->ActiveCol == 1 || OvcTable1->ActiveCol == 3)
    OvcTable1->InvalidateCell(RowNum, 4);
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::FirstButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems > 0) {
    if (ResetTable()) {
      UpdateIfModified();
      OvcVirtualListbox1->ItemIndex = 0;
      MoveToRecord(OvcVirtualListbox1->ItemIndex, TR);
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::PrevButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->ItemIndex <= 0) return;
  if (OvcVirtualListbox1->NumItems > 0) {
    if (ResetTable()) {
      UpdateIfModified();
      OvcVirtualListbox1->ItemIndex--;
      MoveToRecord(OvcVirtualListbox1->ItemIndex, TR);
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::NextButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->ItemIndex >= OvcVirtualListbox1->NumItems - 1)
    return;
  if (OvcVirtualListbox1->NumItems > 0) {
    if (ResetTable()) {
      UpdateIfModified();
      OvcVirtualListbox1->ItemIndex++;
      MoveToRecord(OvcVirtualListbox1->ItemIndex, TR);
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TOrdEntryForm::LastButtonClick(TObject *Sender)
{
  if (OvcVirtualListbox1->NumItems > 0) {
    if (ResetTable()) {
      UpdateIfModified();
      OvcVirtualListbox1->ItemIndex--;
      MoveToRecord(OvcVirtualListbox1->ItemIndex, TR);
    }
  }
}
//---------------------------------------------------------------------------
