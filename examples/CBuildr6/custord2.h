//---------------------------------------------------------------------------
#ifndef CustOrd2H
#define CustOrd2H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include <vcl\DBTables.hpp>
#include <vcl\DB.hpp>
#include "OvcTCSim.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCHdr.hpp"
#include "OvcCache.hpp"
#include <Db.hpp>

struct TOrderData {
  double OrderNo; // *index
  TOvcDate SaleDate;
  TOvcDate ShipDate;
  int EmpNo;
  SmallString<20> ShipToContact;
  SmallString<30> ShipToAddr1;
  SmallString<30> ShipToAddr2;
  SmallString<15> ShipToCity;
  SmallString<20> ShipToState;
  SmallString<10> ShipToZip;
  SmallString<20> ShipToCountry;
  SmallString<15> ShipToPhone;
  SmallString<7> ShipVIA;
  SmallString<15> PO;
  SmallString<6> Terms;
  SmallString<7> PaymentMethod;
  double ItemsTotal;
  double TaxRate;
  double Freight;
  double AmountPaid;
};

//---------------------------------------------------------------------------
class TfrmOrders : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel2;
  TOvcTable *tblOrder;
  TBitBtn *BitBtn1;
  TQuery *dbOrderQuery;
  TFloatField *dbOrderQueryOrderNo;
  TDateTimeField *dbOrderQuerySaleDate;
  TDateTimeField *dbOrderQueryShipDate;
  TIntegerField *dbOrderQueryEmpNo;
  TStringField *dbOrderQueryShipToContact;
  TStringField *dbOrderQueryShipToAddr1;
  TStringField *dbOrderQueryShipToAddr2;
  TStringField *dbOrderQueryShipToCity;
  TStringField *dbOrderQueryShipToState;
  TStringField *dbOrderQueryShipToZip;
  TStringField *dbOrderQueryShipToCountry;
  TStringField *dbOrderQueryShipToPhone;
  TStringField *dbOrderQueryShipVIA;
  TStringField *dbOrderQueryPO;
  TStringField *dbOrderQueryTerms;
  TStringField *dbOrderQueryPaymentMethod;
  TCurrencyField *dbOrderQueryItemsTotal;
  TFloatField *dbOrderQueryTaxRate;
  TCurrencyField *dbOrderQueryFreight;
  TCurrencyField *dbOrderQueryAmountPaid;
  TOvcTCSimpleField *sfOrderNo;
  TOvcTCPictureField *pfSaleDate;
  TOvcTCPictureField *pfShipDate;
  TOvcTCSimpleField *sfEmpNo;
  TOvcTCSimpleField *sfShipToContact;
  TOvcTCSimpleField *sfShipToAddr1;
  TOvcTCSimpleField *sfShipToAddr2;
  TOvcTCSimpleField *sfShipToCity;
  TOvcTCSimpleField *sfShipToState;
  TOvcTCPictureField *pfShipToZip;
  TOvcTCSimpleField *sfShipToCountry;
  TOvcTCPictureField *pfShipToPhone;
  TOvcTCSimpleField *sfShipToVia;
  TOvcTCSimpleField *sfPO;
  TOvcTCSimpleField *sfTerms;
  TOvcTCSimpleField *sfPaymentMethod;
  TOvcTCPictureField *pfItemsTotal;
  TOvcTCPictureField *pfTaxRate2;
  TOvcTCPictureField *pfFreight;
  TOvcTCPictureField *pfAmountPaid;
  TOvcController *OvcController1;
  TOvcTCRowHead *RowLable;
  TOvcTCColHead *dbOrderHeaderCell;
  void __fastcall tblOrderGetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall tblOrderBeginEdit(TObject *Sender, int RowNum, int ColNum,
  bool &AllowIt);
  void __fastcall tblOrderActiveCellChanged(TObject *Sender, int RowNum,
  int ColNum);
  void __fastcall tblOrderLockedCellClick(TObject *Sender, int RowNum,
  int ColNum);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
  SmallString<255> CellData;
  TOvcCache* OrderCache;
  void __fastcall GetOrderRecord(int RowNum, void* &P, Word& Size);
public:		// User declarations
  __fastcall TfrmOrders(TComponent* Owner);
  void PositionDatabase(int RowNum);
  void RefreshRecord(int RecNum);
  void UpdateOrderTable(double CustNo);
};
//---------------------------------------------------------------------------
extern TfrmOrders *frmOrders;
//---------------------------------------------------------------------------
#endif
