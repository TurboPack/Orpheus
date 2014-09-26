//---------------------------------------------------------------------------
#ifndef CustOrd1H
#define CustOrd1H
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

struct TCustomerData {
  double CustNo; // *index
  SmallString<30> Company;
  SmallString<30> Addr1;
  SmallString<30> Addr2;
  SmallString<15> City;
  SmallString<20> State;
  SmallString<10> Zip;
  SmallString<20> Country;
  SmallString<15> Phone;
  SmallString<15> FAX;
  double TaxRate;
  SmallString<20> Contact;
  TOvcDate InvoiceDate;
};

//---------------------------------------------------------------------------
class TfrmCustomers : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel1;
  TOvcTable *tblCustomer;
  TBitBtn *btnOrders;
  TBitBtn *btnClose;
  TBitBtn *btnAbout;
  TTable *dbCustomer;
  TFloatField *dbCustomerCustNo;
  TStringField *dbCustomerCompany;
  TStringField *dbCustomerAddr1;
  TStringField *dbCustomerAddr2;
  TStringField *dbCustomerCity;
  TStringField *dbCustomerState;
  TStringField *dbCustomerZip;
  TStringField *dbCustomerCountry;
  TStringField *dbCustomerPhone;
  TStringField *dbCustomerFAX;
  TFloatField *dbCustomerTaxRate;
  TStringField *dbCustomerContact;
  TDateTimeField *dbCustomerLastInvoiceDate;
  TOvcController *OvcController1;
  TOvcTCSimpleField *sfCustNo1;
  TOvcTCSimpleField *sfCompany;
  TOvcTCSimpleField *sfAddr1;
  TOvcTCSimpleField *sfAddr2;
  TOvcTCSimpleField *sfCity;
  TOvcTCSimpleField *sfState;
  TOvcTCPictureField *pfZip;
  TOvcTCSimpleField *sfCountry;
  TOvcTCPictureField *pfPhone;
  TOvcTCPictureField *pfFax;
  TOvcTCPictureField *pfTaxRate1;
  TOvcTCSimpleField *sfContact;
  TOvcTCPictureField *pfLastInvoiceDate;
  TOvcTCRowHead *RowLabel;
  TOvcTCColHead *dbCustomerHeaderCell;
  void __fastcall tblCustomerGetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall btnOrdersClick(TObject *Sender);
  void __fastcall tblCustomerBeginEdit(TObject *Sender, int RowNum, int ColNum,
  bool &AllowIt);
  void __fastcall tblCustomerDoneEdit(TObject *Sender, int RowNum, int ColNum);
  void __fastcall btnCloseClick(TObject *Sender);
  void __fastcall tblCustomerActiveCellChanged(TObject *Sender, int RowNum,
  int ColNum);
  void __fastcall tblCustomerTopLeftCellChanging(TObject *Sender, int &RowNum,
  int &ColNum);
  void __fastcall tblCustomerLockedCellClick(TObject *Sender, int RowNum,
  int ColNum);
  void __fastcall btnAboutClick(TObject *Sender);
private:	// User declarations
  SmallString<255> CellData;
  TOvcCache* CustomerCache;
public:		// User declarations
  __fastcall TfrmCustomers(TComponent* Owner);
  void __fastcall GetCustomerRecord(int RowNum, void* &P, Word& Size);
  void PositionDatabase(long RowNum);
  void RefreshRecord(long RecNum);
};
//---------------------------------------------------------------------------
extern TfrmCustomers *frmCustomers;
//---------------------------------------------------------------------------
#endif
