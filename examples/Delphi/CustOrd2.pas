{$J+} {Writable constants}

unit CustOrd2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, OvcTCmmn, OvcTable, OvcPb, OvcPf, OvcTCPic, OvcBase, OvcEf, OvcSf,
  OvcTCSim, OvcTCBEF, OvcTCStr, OvcTCEdt, DBTables, DB, OvcData,
  OvcCache, {this is a bonus component. It should be in \orpheus\bonus}
  {and must be dearchived and installed prior to compiling this example}
  ExtCtrls, StdCtrls, Buttons, OvcTCHdr, OvcTCell, OvcDate;

const
  {number of records to cache}
  MaxCacheItems = 20;

type
  {definition of one record for order table}
  POrderData = ^TOrderData;
  TOrderData = record
    OrderNo       : Double; {*index}
    SaleDate      : TOvcDate;
    ShipDate      : TOvcDate;
    EmpNo         : LongInt;
    ShipToContact : string[20];
    ShipToAddr1   : string[30];
    ShipToAddr2   : string[30];
    ShipToCity    : string[15];
    ShipToState   : string[20];
    ShipToZip     : string[10];
    ShipToCountry : string[20];
    ShipToPhone   : string[15];
    ShipVIA       : string[7];
    PO            : string[15];
    Terms         : string[6];
    PaymentMethod : string[7];
    ItemsTotal    : Double;
    TaxRate       : Double;
    Freight       : Double;
    AmountPaid    : Double;
  end;

type
  TfrmOrders = class(TForm)
    dbOrderQuery: TQuery;
    dbOrderQueryOrderNo: TFloatField;
    dbOrderQuerySaleDate: TDateTimeField;
    dbOrderQueryShipDate: TDateTimeField;
    dbOrderQueryEmpNo: TIntegerField;
    dbOrderQueryShipToContact: TStringField;
    dbOrderQueryShipToAddr1: TStringField;
    dbOrderQueryShipToAddr2: TStringField;
    dbOrderQueryShipToCity: TStringField;
    dbOrderQueryShipToState: TStringField;
    dbOrderQueryShipToZip: TStringField;
    dbOrderQueryShipToCountry: TStringField;
    dbOrderQueryShipToPhone: TStringField;
    dbOrderQueryShipVIA: TStringField;
    dbOrderQueryPO: TStringField;
    dbOrderQueryTerms: TStringField;
    dbOrderQueryPaymentMethod: TStringField;
    dbOrderQueryItemsTotal: TCurrencyField;
    dbOrderQueryTaxRate: TFloatField;
    dbOrderQueryFreight: TCurrencyField;
    dbOrderQueryAmountPaid: TCurrencyField;
    sfOrderNo: TOvcTCSimpleField;
    pfSaleDate: TOvcTCPictureField;
    pfShipDate: TOvcTCPictureField;
    sfEmpNo: TOvcTCSimpleField;
    sfShipToContact: TOvcTCSimpleField;
    sfShipToAddr1: TOvcTCSimpleField;
    sfShipToAddr2: TOvcTCSimpleField;
    sfShipToCity: TOvcTCSimpleField;
    sfShipToState: TOvcTCSimpleField;
    pfShipToZip: TOvcTCPictureField;
    sfShipToCountry: TOvcTCSimpleField;
    pfShipToPhone: TOvcTCPictureField;
    sfShipToVia: TOvcTCSimpleField;
    sfPO: TOvcTCSimpleField;
    sfTerms: TOvcTCSimpleField;
    sfPaymentMethod: TOvcTCSimpleField;
    pfItemsTotal: TOvcTCPictureField;
    pfTaxRate2: TOvcTCPictureField;
    pfFreight: TOvcTCPictureField;
    pfAmountPaid: TOvcTCPictureField;
    tblOrder: TOvcTable;
    Panel2: TPanel;
    OvcController1: TOvcController;
    BitBtn1: TBitBtn;
    RowLable: TOvcTCRowHead;
    dbOrderHeaderCell: TOvcTCColHead;
    procedure tblOrderGetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tblOrderBeginEdit(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var AllowIt: Boolean);
    procedure tblOrderActiveCellChanged(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure tblOrderLockedCellClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure BitBtn1Click(Sender: TObject);

  private
    CellData   : string;
    OrderCache : TOvcCache;

  public
    procedure GetOrderRecord(RowNum : LongInt; var P : Pointer; var Size : Word);
    procedure PositionDatabase(RowNum : LongInt);
    procedure RefreshRecord(RecNum : LongInt);
    procedure UpdateOrderTable(CustNo : Double);
  end;

var
  frmOrders: TfrmOrders;

implementation

{$R *.DFM}

procedure TfrmOrders.PositionDatabase(RowNum : LongInt);
const
  LastRecordRequest : LongInt = -1;
begin
  {position db cursor to requested record}
  if LastRecordRequest = -1 then begin
    dbOrderQuery.First;
    dbOrderQuery.MoveBy(RowNum-1);
  end else if RowNum = 1 then
    dbOrderQuery.First
  else if RowNum = dbOrderQuery.RecordCount then
    dbOrderQuery.Last
  else
    dbOrderQuery.MoveBy(RowNum-LastRecordRequest);
  LastRecordRequest := RowNum;
end;

procedure TfrmOrders.GetOrderRecord(RowNum : LongInt; var P : Pointer; var Size : Word);
begin
  {position db cursor to requested record}
  PositionDatabase(RowNum);
  {return size of data}
  Size := SizeOf(TOrderData);
  {allocate buffer for data}
  GetMem(P, Size);
  {read the db record}
  with POrderData(P)^ do begin
    OrderNo       := dbOrderQueryOrderNo.AsFloat;
    SaleDate      := DateTimeToStDate(dbOrderQuerySaleDate.AsDateTime);
    ShipDate      := DateTimeToStDate(dbOrderQueryShipDate.AsDateTime);
    EmpNo         := dbOrderQueryEmpNo.AsInteger;
    ShipToContact := ShortString(dbOrderQueryShipToContact.AsString);
    ShipToAddr1   := ShortString(dbOrderQueryShipToAddr1.AsString);
    ShipToAddr2   := ShortString(dbOrderQueryShipToAddr2.AsString);
    ShipToCity    := ShortString(dbOrderQueryShipToCity.AsString);
    ShipToState   := ShortString(dbOrderQueryShipToState.AsString);
    ShipToZip     := ShortString(dbOrderQueryShipToZip.AsString);
    ShipToCountry := ShortString(dbOrderQueryShipToCountry.AsString);
    ShipToPhone   := ShortString(dbOrderQueryShipToPhone.AsString);
    ShipVIA       := ShortString(dbOrderQueryShipVIA.AsString);
    PO            := ShortString(dbOrderQueryPO.AsString);
    Terms         := ShortString(dbOrderQueryTerms.AsString);
    PaymentMethod := ShortString(dbOrderQueryPaymentMethod.AsString);
    ItemsTotal    := dbOrderQueryItemsTotal.AsFloat;
    TaxRate       := dbOrderQueryTaxRate.AsFloat;
    Freight       := dbOrderQueryFreight.AsFloat;
    AmountPaid    := dbOrderQueryAmountPaid.AsFloat;
  end;
end;

procedure TfrmOrders.tblOrderGetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
var
  P : POrderData;
begin
  CellData := '?';
  Data := @CellData;
  if RowNum = 0 then begin
    case ColNum of
      0 : CellData := '';
      1 : CellData := dbOrderQueryOrderNo.DisplayLabel;
      2 : CellData := dbOrderQuerySaleDate.DisplayLabel;
      3 : CellData := dbOrderQueryShipDate.DisplayLabel;
      4 : CellData := dbOrderQueryEmpNo.DisplayLabel;
      5 : CellData := dbOrderQueryShipToContact.DisplayLabel;
      6 : CellData := dbOrderQueryShipToAddr1.DisplayLabel;
      7 : CellData := dbOrderQueryShipToAddr2.DisplayLabel;
      8 : CellData := dbOrderQueryShipToCity.DisplayLabel;
      9 : CellData := dbOrderQueryShipToState.DisplayLabel;
     10 : CellData := dbOrderQueryShipToZip.DisplayLabel;
     11 : CellData := dbOrderQueryShipToCountry.DisplayLabel;
     12 : CellData := dbOrderQueryShipToPhone.DisplayLabel;
     13 : CellData := dbOrderQueryShipVIA.DisplayLabel;
     14 : CellData := dbOrderQueryPO.DisplayLabel;
     15 : CellData := dbOrderQueryTerms.DisplayLabel;
     16 : CellData := dbOrderQueryPaymentMethod.DisplayLabel;
     17 : CellData := dbOrderQueryItemsTotal.DisplayLabel;
     18 : CellData := dbOrderQueryTaxRate.DisplayLabel;
     19 : CellData := dbOrderQueryFreight.DisplayLabel;
     20 : CellData := dbOrderQueryAmountPaid.DisplayLabel;
    end;
  end else begin
    P  := OrderCache.Items[RowNum];
    if Assigned(P) then begin
      case ColNum of
        0 : {};
        1 : Data := @P^.OrderNo;
        2 : Data := @P^.SaleDate;
        3 : Data := @P^.ShipDate;
        4 : Data := @P^.EmpNo;
        5 : Data := @P^.ShipToContact;
        6 : Data := @P^.ShipToAddr1;
        7 : Data := @P^.ShipToAddr2;
        8 : Data := @P^.ShipToCity;
        9 : Data := @P^.ShipToState;
       10 : Data := @P^.ShipToZip;
       11 : Data := @P^.ShipToCountry;
       12 : Data := @P^.ShipToPhone;
       13 : Data := @P^.ShipVIA;
       14 : Data := @P^.PO;
       15 : Data := @P^.Terms;
       16 : Data := @P^.PaymentMethod;
       17 : Data := @P^.ItemsTotal;
       18 : Data := @P^.TaxRate;
       19 : Data := @P^.Freight;
       20 : Data := @P^.AmountPaid;
      end
    end;
  end;
end;

procedure TfrmOrders.FormCreate(Sender: TObject);
begin
  OrderCache := TOvcCache.Create(Self);
  OrderCache.MaxCacheItems := MaxCacheItems;
  OrderCache.OnGetItem := GetOrderRecord;
end;

procedure TfrmOrders.FormDestroy(Sender: TObject);
begin
  dbOrderQuery.Close;
  OrderCache.Free;
end;

procedure TfrmOrders.RefreshRecord(RecNum : LongInt);
begin
  if Assigned(OrderCache) then begin                                   {!!.13}
    OrderCache.Update(RecNum);
    tblOrder.AllowRedraw := False;
    tblOrder.InvalidateRow(RecNum);
    tblOrder.AllowRedraw := True;
  end;                                                                 {!!.13}
end;

procedure TfrmOrders.UpdateOrderTable(CustNo : Double);
begin
  dbOrderQuery.Close;
  dbOrderQuery.Params[0].AsFloat := CustNo;
  try
    dbOrderQuery.RequestLive := False;
    dbOrderQuery.Open;
  except
    on EDatabaseError do begin
      tblOrder.RowLimit := 1;
      raise;
    end;
  end;
  OrderCache.Refresh;
  tblOrder.RowLimit := dbOrderQuery.RecordCount + 1;
  tblOrder.Refresh;
end;

procedure TfrmOrders.tblOrderBeginEdit(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var AllowIt: Boolean);
begin
  {don't allow modifications to the order query}
  AllowIt := False;
end;

procedure TfrmOrders.tblOrderActiveCellChanged(Sender: TObject;
  RowNum: Longint; ColNum: Integer);
const
  LastRow : LongInt = -1;
begin
  {refresh row}
  if LastRow <> RowNum then begin
    LastRow := RowNum;
    RefreshRecord(RowNum);
  end;
end;

procedure TfrmOrders.tblOrderLockedCellClick(Sender: TObject;
  RowNum: Longint; ColNum: Integer);
begin
  if RowNum = 0 then
    tblOrder.ActiveCol := ColNum;
  if ColNum = 0 then
    tblOrder.ActiveRow := RowNum;
end;

procedure TfrmOrders.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
