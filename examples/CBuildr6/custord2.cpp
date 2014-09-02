//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "CustOrd2.h"
#include "CustOrd1.h"
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
#pragma resource "*.dfm"
TfrmOrders *frmOrders;

extern int MaxCacheItems;

//---------------------------------------------------------------------------
__fastcall TfrmOrders::TfrmOrders(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::GetOrderRecord(int RowNum, void* &P, Word& Size)
{
  // position db cursor to requested record
  PositionDatabase(RowNum);
  // return size of data
  Size = sizeof(TOrderData);
  // allocate buffer for data
  P = new TOrderData;
  // Cast the void pointer to a TOrderData pointer. I used a pointer
  // here but I could have used a reference instead. Using a pointer
  // we have to use the -> operator rather than the dot operator.
  // To see the difference look at the corresponding method in the
  // CUSTORD1.CPP file. There I used a refernce rather than a pointer.
  TOrderData* data = reinterpret_cast<TOrderData*>(P);
  // read the db record
  data->OrderNo       = dbOrderQueryOrderNo->AsFloat;
  data->SaleDate      = DateTimeToStDate(dbOrderQuerySaleDate->AsDateTime);
  data->ShipDate      = DateTimeToStDate(dbOrderQueryShipDate->AsDateTime);
  data->EmpNo         = dbOrderQueryEmpNo->AsInteger;
  data->ShipToContact = dbOrderQueryShipToContact->AsString;
  data->ShipToAddr1   = dbOrderQueryShipToAddr1->AsString;
  data->ShipToAddr2   = dbOrderQueryShipToAddr2->AsString;
  data->ShipToCity    = dbOrderQueryShipToCity->AsString;
  data->ShipToState   = dbOrderQueryShipToState->AsString;
  data->ShipToZip     = dbOrderQueryShipToZip->AsString;
  data->ShipToCountry = dbOrderQueryShipToCountry->AsString;
  data->ShipToPhone   = dbOrderQueryShipToPhone->AsString;
  data->ShipVIA       = dbOrderQueryShipVIA->AsString;
  data->PO            = dbOrderQueryPO->AsString;
  data->Terms         = dbOrderQueryTerms->AsString;
  data->PaymentMethod = dbOrderQueryPaymentMethod->AsString;
  data->ItemsTotal    = dbOrderQueryItemsTotal->AsFloat;
  data->TaxRate       = dbOrderQueryTaxRate->AsFloat;
  data->Freight       = dbOrderQueryFreight->AsFloat;
  data->AmountPaid    = dbOrderQueryAmountPaid->AsFloat;
}

void TfrmOrders::PositionDatabase(int RowNum)
{
  static int LastRecordRequest = -1;
  // position db cursor to requested record
  if (LastRecordRequest == -1) {
    dbOrderQuery->First();
    dbOrderQuery->MoveBy(RowNum - 1);
  }
  else if (RowNum == 1)
    dbOrderQuery->First();
  else if (RowNum == dbOrderQuery->RecordCount)
    dbOrderQuery->Last();
  else
    dbOrderQuery->MoveBy(RowNum - LastRecordRequest);
  LastRecordRequest = RowNum;
}

void TfrmOrders::RefreshRecord(int RecNum)
{
  OrderCache->Update(RecNum);
  tblOrder->AllowRedraw = false;
  tblOrder->InvalidateRow(RecNum);
  tblOrder->AllowRedraw = true;
}

void TfrmOrders::UpdateOrderTable(double CustNo)
{
  dbOrderQuery->Close();
  dbOrderQuery->Params->Items[0]->AsFloat = CustNo;
  try {
    dbOrderQuery->RequestLive = false;
    dbOrderQuery->Open();
  }
  catch (EDatabaseError&) {
    tblOrder->RowLimit = 1;
    throw;
  }
  OrderCache->Refresh();
  tblOrder->RowLimit = dbOrderQuery->RecordCount + 1;
  tblOrder->Refresh();
}

void __fastcall TfrmOrders::tblOrderGetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  TOrderData* P = 0;
  CellData = "?";
  Data = &CellData;
  if (RowNum == 0) {
    switch (ColNum) {
      case 0 : CellData = ""; break;
      case 1 : CellData = dbOrderQueryOrderNo->DisplayLabel; break;
      case 2 : CellData = dbOrderQuerySaleDate->DisplayLabel; break;
      case 3 : CellData = dbOrderQueryShipDate->DisplayLabel; break;
      case 4 : CellData = dbOrderQueryEmpNo->DisplayLabel; break;
      case 5 : CellData = dbOrderQueryShipToContact->DisplayLabel; break;
      case 6 : CellData = dbOrderQueryShipToAddr1->DisplayLabel; break;
      case 7 : CellData = dbOrderQueryShipToAddr2->DisplayLabel; break;
      case 8 : CellData = dbOrderQueryShipToCity->DisplayLabel; break;
      case 9 : CellData = dbOrderQueryShipToState->DisplayLabel; break;
      case 10 : CellData = dbOrderQueryShipToZip->DisplayLabel; break;
      case 11 : CellData = dbOrderQueryShipToCountry->DisplayLabel; break;
      case 12 : CellData = dbOrderQueryShipToPhone->DisplayLabel; break;
      case 13 : CellData = dbOrderQueryShipVIA->DisplayLabel; break;
      case 14 : CellData = dbOrderQueryPO->DisplayLabel; break;
      case 15 : CellData = dbOrderQueryTerms->DisplayLabel; break;
      case 16 : CellData = dbOrderQueryPaymentMethod->DisplayLabel; break;
      case 17 : CellData = dbOrderQueryItemsTotal->DisplayLabel; break;
      case 18 : CellData = dbOrderQueryTaxRate->DisplayLabel; break;
      case 19 : CellData = dbOrderQueryFreight->DisplayLabel; break;
      case 20 : CellData = dbOrderQueryAmountPaid->DisplayLabel; break;
    }
  }
  else {
    P = reinterpret_cast<TOrderData*>(OrderCache->Items[RowNum]);
    if (P) {
      switch (ColNum) {
        case 0 :
        case 1 : Data = &P->OrderNo; break;
        case 2 : Data = &P->SaleDate; break;
        case 3 : Data = &P->ShipDate; break;
        case 4 : Data = &P->EmpNo; break;
        case 5 : Data = &P->ShipToContact; break;
        case 6 : Data = &P->ShipToAddr1; break;
        case 7 : Data = &P->ShipToAddr2; break;
        case 8 : Data = &P->ShipToCity; break;
        case 9 : Data = &P->ShipToState; break;
        case 10 : Data = &P->ShipToZip;  break;
        case 11 : Data = &P->ShipToCountry; break;
        case 12 : Data = &P->ShipToPhone; break;
        case 13 : Data = &P->ShipVIA; break;
        case 14 : Data = &P->PO; break;
        case 15 : Data = &P->Terms; break;
        case 16 : Data = &P->PaymentMethod; break;
        case 17 : Data = &P->ItemsTotal; break;
        case 18 : Data = &P->TaxRate; break;
        case 19 : Data = &P->Freight; break;
        case 20 : Data = &P->AmountPaid;
      }
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::FormCreate(TObject *Sender)
{
  OrderCache = new TOvcCache(this);
  OrderCache->MaxCacheItems = MaxCacheItems;
  OrderCache->OnGetItem = &GetOrderRecord;
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::FormDestroy(TObject *Sender)
{
  dbOrderQuery->Close();
  delete OrderCache;
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::tblOrderBeginEdit(TObject *Sender, int RowNum,
  int ColNum, bool &AllowIt)
{
  // don't allow modifications to the order query
  AllowIt = false;
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::tblOrderActiveCellChanged(TObject *Sender,
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
void __fastcall TfrmOrders::tblOrderLockedCellClick(TObject *Sender,
  int RowNum, int ColNum)
{
  if (RowNum == 0)
    tblOrder->ActiveCol = ColNum;
  if (ColNum == 0)
    tblOrder->ActiveRow = RowNum;
}
//---------------------------------------------------------------------------
void __fastcall TfrmOrders::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

