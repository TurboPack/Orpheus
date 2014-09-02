//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>

#include "CustOrd1.h"
#include "CustOrd3.h"
#include "CustOrd2.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCSim"
#pragma link "OvcTCBEF"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCPic"
#pragma link "OvcTCHdr"
#pragma link "Ovccache"
#pragma resource "*.dfm"

TfrmCustomers *frmCustomers;

int MaxCacheItems = 20;

//---------------------------------------------------------------------------
__fastcall TfrmCustomers::TfrmCustomers(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::GetCustomerRecord(int RowNum, void* &P, Word& Size)
{
  // position db cursor to requested record
  PositionDatabase(RowNum);
  // return size of data
  Size = sizeof(TCustomerData);
  // allocate buffer for data
  P = new TCustomerData;
  // Create a TCustomerData reference to the void*. I used a reference
  // here but I could have used a pointer instead. Using a reference
  // allows us to use the dot operator rather than the -> operator.
  // To see the difference look at the corresponding method in the
  // CUSTORD2.CPP file. There I used a pointer rather than a reference.
  TCustomerData& data = *reinterpret_cast<TCustomerData*>(P);
  // read the db record
  data.CustNo  = dbCustomerCustNo->AsFloat;
  data.Company = dbCustomerCompany->AsString;
  data.Addr1 =dbCustomerAddr1->AsString;
  data.Addr2 =dbCustomerAddr2->AsString;
  data.City =dbCustomerCity->AsString;
  data.State =dbCustomerState->AsString;
  data.Zip =dbCustomerZip->AsString;
  data.Country =dbCustomerCountry->AsString;
  data.Phone =dbCustomerPhone->AsString;
  data.FAX =dbCustomerFAX->AsString;
  data.TaxRate = dbCustomerTaxRate->AsFloat;
  data.Contact =dbCustomerContact->AsString;
  data.InvoiceDate = DateTimeToStDate(dbCustomerLastInvoiceDate->AsDateTime);
}

void TfrmCustomers::PositionDatabase(long RowNum)
{
  static long LastRecordRequest = -1;
  // position db cursor to requested record
  if (LastRecordRequest == -1) {
    dbCustomer->First();
    dbCustomer->MoveBy(RowNum - 1);
  }
  else if (RowNum == 1)
    dbCustomer->First();
  else if (RowNum == dbCustomer->RecordCount)
    dbCustomer->Last();
  else
    dbCustomer->MoveBy(RowNum - LastRecordRequest);
  LastRecordRequest = RowNum;
}

void TfrmCustomers::RefreshRecord(long RecNum)
{
  CustomerCache->Update(RecNum);
  tblCustomer->AllowRedraw = false;
  tblCustomer->InvalidateRow(RecNum);
  tblCustomer->AllowRedraw = true;
}


void __fastcall TfrmCustomers::tblCustomerGetCellData(TObject *Sender,
  int RowNum, int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  TCustomerData* P = 0;
  CellData = "?";
  Data = &CellData;
  if (RowNum == 0) {
    switch (ColNum) {
      case 0 : CellData = ""; break;
      case 1 : CellData = dbCustomerCustNo->DisplayLabel; break;
      case 2 : CellData = dbCustomerCompany->DisplayLabel; break;
      case 3 : CellData = dbCustomerAddr1->DisplayLabel; break;
      case 4 : CellData = dbCustomerAddr2->DisplayLabel; break;
      case 5 : CellData = dbCustomerCity->DisplayLabel; break;
      case 6 : CellData = dbCustomerState->DisplayLabel; break;
      case 7 : CellData = dbCustomerZip->DisplayLabel; break;
      case 8 : CellData = dbCustomerCountry->DisplayLabel; break;
      case 9 : CellData = dbCustomerPhone->DisplayLabel; break;
      case 10 : CellData = dbCustomerFAX->DisplayLabel; break;
      case 11 : CellData = dbCustomerTaxRate->DisplayLabel; break;
      case 12 : CellData = dbCustomerContact->DisplayLabel; break;
      case 13 : CellData = dbCustomerLastInvoiceDate->DisplayLabel;
    }
  }
  else {
    P = reinterpret_cast<TCustomerData*>(CustomerCache->Items[RowNum]);
    if (P) {
      switch (ColNum) {
        case 0 :
        case 1 : Data = &P->CustNo; break;
        case 2 : Data = &P->Company; break;
        case 3 : Data = &P->Addr1; break;
        case 4 : Data = &P->Addr2; break;
        case 5 : Data = &P->City; break;
        case 6 : Data = &P->State; break;
        case 7 : Data = &P->Zip; break;
        case 8 : Data = &P->Country; break;
        case 9 : Data = &P->Phone; break;
        case 10 : Data = &P->FAX; break;
        case 11 : Data = &P->TaxRate; break;
        case 12 : Data = &P->Contact; break;
        case 13 : Data = &P->InvoiceDate;
      }
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::FormCreate(TObject *Sender)
{
  CustomerCache = new TOvcCache(this);
  CustomerCache->MaxCacheItems = MaxCacheItems;
  CustomerCache->OnGetItem = &GetCustomerRecord;

  dbCustomer->Active = true;
  if (dbCustomer->Active)
    tblCustomer->RowLimit = dbCustomer->RecordCount + 1;
  else
    tblCustomer->RowLimit = 1;
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::FormDestroy(TObject *Sender)
{
  dbCustomer->Active = false;
  delete CustomerCache;
  CustomerCache = 0;
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::btnOrdersClick(TObject *Sender)
{
  double CustNo;
  // if editing, stop and post changes
  if (tblCustomer->InEditingState())
    if (!tblCustomer->StopEditingState(true))
      return;

  frmOrders = new TfrmOrders(this);
  Screen->Cursor = crHourGlass;
  try {
    CustNo = reinterpret_cast<TCustomerData*>
      ((CustomerCache->Items[tblCustomer->ActiveRow]))->CustNo;
    frmOrders->UpdateOrderTable(CustNo);
    char buff[40];
    sprintf(buff, "Orders for customer# %.0f (Read-Only)", CustNo);
    frmOrders->Panel2->Caption = buff;
    frmOrders->ShowModal();
  }
  catch (...) {
    Screen->Cursor = crDefault;
    delete frmOrders;
    throw;
  }
  Screen->Cursor = crDefault;
  delete frmOrders;
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::tblCustomerBeginEdit(TObject *Sender,
  int RowNum, int ColNum, bool &AllowIt)
{
  // refresh current record
  RefreshRecord(RowNum);

  // can this record be edited (Col 1 is the customer number)
  AllowIt = ((ColNum > 1) && dbCustomer->CanModify);
  if (AllowIt) {
    try {
      dbCustomer->Edit();
    }
    catch (...) {
      AllowIt = false;
      throw;
    }
    // lock record so that it stays in the cache until we are done editing
    CustomerCache->LockCacheItem(RowNum);
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::tblCustomerDoneEdit(TObject *Sender, int RowNum,
  int ColNum)
{
  TCustomerData* P = 0;
  try {
    // update database record
    P  = reinterpret_cast<TCustomerData*>(CustomerCache->Items[RowNum]);
    if (P) {
      switch (ColNum) {
        case 0 : // row label column
        case 1 : // no editing of customer number allowed
        case 2 : dbCustomerCompany->AsString = P->Company; break;
        case 3 : dbCustomerAddr1->AsString = P->Addr1; break;
        case 4 : dbCustomerAddr2->AsString = P->Addr2; break;
        case 5 : dbCustomerCity->AsString = P->City; break;
        case 6 : dbCustomerState->AsString = P->State; break;
        case 7 : dbCustomerZip->AsString = P->Zip; break;
        case 8 : dbCustomerCountry->AsString = P->Country; break;
        case 9 : dbCustomerPhone->AsString = P->Phone; break;
        case 10 : dbCustomerFAX->AsString = P->FAX; break;
        case 11 : dbCustomerTaxRate->AsFloat = P->TaxRate; break;
        case 12 : dbCustomerContact->AsString = P->Contact; break;
        case 13 : dbCustomerLastInvoiceDate->AsDateTime =
              StDateToDateTime(P->InvoiceDate);
      }
      // post changes and stop editing
      dbCustomer->Post();
    }
  }
  catch (...) {
    CustomerCache->UnlockCacheItem();
    throw;
  }
  // unlock record
  CustomerCache->UnlockCacheItem();
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::btnCloseClick(TObject *Sender)
{
  // if editing, stop and post changes
  if (tblCustomer->InEditingState())
    if (!tblCustomer->StopEditingState(true))
      return;
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::tblCustomerActiveCellChanged(TObject *Sender,
  int RowNum, int ColNum)
{
  static int LastRow = -1;
  // refresh row
  if (LastRow != RowNum) {
    LastRow = RowNum;
    RefreshRecord(RowNum);
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::tblCustomerTopLeftCellChanging(TObject *Sender,
  int &RowNum, int &ColNum)
{
  int R, C;
  R = tblCustomer->TopRow;
  C = tblCustomer->LeftCol;
  if (RowNum == R) return;

  try {
    // if editing, stop and post changes
    if (tblCustomer->InEditingState())
      if (!tblCustomer->StopEditingState(true)) {
        RowNum = R;
        ColNum = C;
      }
  }
  catch (...) {
    RowNum = R;
    ColNum = C;
    throw;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::tblCustomerLockedCellClick(TObject *Sender,
  int RowNum, int ColNum)
{
  if (RowNum == 0)
    tblCustomer->ActiveCol = ColNum;
  if (ColNum == 0)
    tblCustomer->ActiveRow = RowNum;
}
//---------------------------------------------------------------------------
void __fastcall TfrmCustomers::btnAboutClick(TObject *Sender)
{
  frmAbout = new TfrmAbout(this);
  frmAbout->ShowModal();
  delete frmAbout;
}
//---------------------------------------------------------------------------
