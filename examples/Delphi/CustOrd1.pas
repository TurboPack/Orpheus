{$J+} {Writable constants}

unit CustOrd1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, DBTables, DB, OvcBase, OvcTCmmn, OvcTable, OvcTCStr, OvcTCEdt,

  OvcCache, {This is a bonus class contained in the Orpheus\bonus
  directory, it should be manually added to the project}

  OvcData, OvcEF, OvcSF, OvcTCSim, OvcTCBEF,
  OvcPB, OvcPF, OvcTCPic, StdCtrls, Buttons, CustOrd2, CustOrd3,
  ExtCtrls, OvcTCHdr, OvcTCell, OvcDate;

const
  {number of records to cache}
  MaxCacheItems = 20;

type
  {definition of one record for the customer table}
  PCustomerData = ^TCustomerData;
  TCustomerData = record
    CustNo      : Double; {*index}
    Company     : string[30];
    Addr1       : string[30];
    Addr2       : string[30];
    City        : string[15];
    State       : string[20];
    Zip         : string[10];
    Country     : string[20];
    Phone       : string[15];
    FAX         : string[15];
    TaxRate     : Double;
    Contact     : string[20];
    InvoiceDate : TOvcDate;
  end;

type
  TfrmCustomers = class(TForm)
    OvcController1: TOvcController;
    tblCustomer: TOvcTable;
    dbCustomer: TTable;
    dbCustomerCustNo: TFloatField;
    dbCustomerCompany: TStringField;
    dbCustomerAddr1: TStringField;
    dbCustomerAddr2: TStringField;
    dbCustomerCity: TStringField;
    dbCustomerState: TStringField;
    dbCustomerZip: TStringField;
    dbCustomerCountry: TStringField;
    dbCustomerPhone: TStringField;
    dbCustomerFAX: TStringField;
    dbCustomerTaxRate: TFloatField;
    dbCustomerContact: TStringField;
    dbCustomerLastInvoiceDate: TDateTimeField;
    sfCustNo1: TOvcTCSimpleField;
    sfCompany: TOvcTCSimpleField;
    sfAddr1: TOvcTCSimpleField;
    sfAddr2: TOvcTCSimpleField;
    sfCity: TOvcTCSimpleField;
    sfState: TOvcTCSimpleField;
    pfZip: TOvcTCPictureField;
    sfCountry: TOvcTCSimpleField;
    pfPhone: TOvcTCPictureField;
    pfFax: TOvcTCPictureField;
    pfTaxRate1: TOvcTCPictureField;
    sfContact: TOvcTCSimpleField;
    pfLastInvoiceDate: TOvcTCPictureField;
    Panel1: TPanel;
    RowLabel: TOvcTCRowHead;
    btnOrders: TBitBtn;
    btnClose: TBitBtn;
    dbCustomerHeaderCell: TOvcTCColHead;
    btnAbout: TBitBtn;
    procedure tblCustomerGetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure tblCustomerBeginEdit(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var AllowIt: Boolean);
    procedure tblCustomerDoneEdit(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure btnCloseClick(Sender: TObject);
    procedure tblCustomerActiveCellChanged(Sender: TObject;
      RowNum: Longint; ColNum: Integer);
    procedure tblCustomerTopLeftCellChanging(Sender: TObject;
      var RowNum: Longint; var ColNum: Integer);
    procedure tblCustomerLockedCellClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure btnAboutClick(Sender: TObject);

  private
    CellData      : string;
    CustomerCache : TOvcCache;

  public
    procedure GetCustomerRecord(RowNum : LongInt; var P : Pointer; var Size : Word);
    procedure PositionDatabase(RowNum : LongInt);
    procedure RefreshRecord(RecNum : LongInt);
  end;

var
  frmCustomers: TfrmCustomers;

implementation

{$R *.DFM}

procedure TfrmCustomers.PositionDatabase(RowNum : LongInt);
const
  LastRecordRequest : LongInt = -1;
begin
  {position db cursor to requested record}
  if LastRecordRequest = -1 then begin
    dbCustomer.First;
    dbCustomer.MoveBy(RowNum-1);
  end else if RowNum = 1 then
    dbCustomer.First
  else if RowNum = dbCustomer.RecordCount then
    dbCustomer.Last
  else
    dbCustomer.MoveBy(RowNum-LastRecordRequest);
  LastRecordRequest := RowNum;
end;

procedure TfrmCustomers.GetCustomerRecord(RowNum : LongInt; var P : Pointer; var Size : Word);
begin
  {position db cursor to requested record}
  PositionDatabase(RowNum);
  {return size of data}
  Size := SizeOf(TCustomerData);
  {allocate buffer for data}
  GetMem(P, Size);
  {read the db record}
  with PCustomerData(P)^ do begin
    CustNo      := dbCustomerCustNo.AsFloat;
    Company     := ShortString(dbCustomerCompany.AsString);
    Addr1       := ShortString(dbCustomerAddr1.AsString);
    Addr2       := ShortString(dbCustomerAddr2.AsString);
    City        := ShortString(dbCustomerCity.AsString);
    State       := ShortString(dbCustomerState.AsString);
    Zip         := ShortString(dbCustomerZip.AsString);
    Country     := ShortString(dbCustomerCountry.AsString);
    Phone       := ShortString(dbCustomerPhone.AsString);
    FAX         := ShortString(dbCustomerFAX.AsString);
    TaxRate     := dbCustomerTaxRate.AsFloat;
    Contact     := ShortString(dbCustomerContact.AsString);
    InvoiceDate := DateTimeToStDate(dbCustomerLastInvoiceDate.AsDateTime);
  end;
end;

procedure TfrmCustomers.tblCustomerGetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
var
  P : PCustomerData;
begin
  CellData := '?';
  Data := @CellData;
  if RowNum = 0 then begin
    case ColNum of
      0 : CellData := '';
      1 : CellData := dbCustomerCustNo.DisplayLabel;
      2 : CellData := dbCustomerCompany.DisplayLabel;
      3 : CellData := dbCustomerAddr1.DisplayLabel;
      4 : CellData := dbCustomerAddr2.DisplayLabel;
      5 : CellData := dbCustomerCity.DisplayLabel;
      6 : CellData := dbCustomerState.DisplayLabel;
      7 : CellData := dbCustomerZip.DisplayLabel;
      8 : CellData := dbCustomerCountry.DisplayLabel;
      9 : CellData := dbCustomerPhone.DisplayLabel;
     10 : CellData := dbCustomerFAX.DisplayLabel;
     11 : CellData := dbCustomerTaxRate.DisplayLabel;
     12 : CellData := dbCustomerContact.DisplayLabel;
     13 : CellData := dbCustomerLastInvoiceDate.DisplayLabel;
    end;
  end else begin
    P  := CustomerCache.Items[RowNum];
    if Assigned(P) then begin
      case ColNum of
        0 : {};
        1 : Data := @P^.CustNo;
        2 : Data := @P^.Company;
        3 : Data := @P^.Addr1;
        4 : Data := @P^.Addr2;
        5 : Data := @P^.City;
        6 : Data := @P^.State;
        7 : Data := @P^.Zip;
        8 : Data := @P^.Country;
        9 : Data := @P^.Phone;
       10 : Data := @P^.FAX;
       11 : Data := @P^.TaxRate;
       12 : Data := @P^.Contact;
       13 : Data := @P^.InvoiceDate;
      end
    end;
  end;
end;

procedure TfrmCustomers.FormCreate(Sender: TObject);
begin
  CustomerCache := TOvcCache.Create(Self);
  CustomerCache.MaxCacheItems := MaxCacheItems;
  CustomerCache.OnGetItem := GetCustomerRecord;

  dbCustomer.Active := True;
  if dbCustomer.Active then
    tblCustomer.RowLimit := dbCustomer.RecordCount + 1
  else
    tblCustomer.RowLimit := 1;
end;

procedure TfrmCustomers.FormDestroy(Sender: TObject);
begin
  dbCustomer.Active := False;
  CustomerCache.Free;
  CustomerCache := nil;
end;

procedure TfrmCustomers.btnOrdersClick(Sender: TObject);
var
  CustNo : Double;
begin
  {if editing, stop and post changes}
  if tblCustomer.InEditingState then
    if not tblCustomer.StopEditingState(True) then
      Exit;

  frmOrders := TFrmOrders.Create(Self);
  try
    Screen.Cursor := crHourGlass;
    try
      CustNo := PCustomerData(CustomerCache.Items[tblCustomer.ActiveRow])^.CustNo;
      frmOrders.UpdateOrderTable(CustNo);
    finally
      Screen.Cursor := crDefault;
    end;
    frmOrders.Panel2.Caption :=
      Format('Orders for customer# %.0f (Read-Only)', [CustNo]);
    frmOrders.ShowModal;
  finally
    frmOrders.Free;
  end;
end;

procedure TfrmCustomers.RefreshRecord(RecNum : LongInt);
begin
  if Assigned(CustomerCache) then begin                                {!!.13}
    CustomerCache.Update(RecNum);
    tblCustomer.AllowRedraw := False;
    tblCustomer.InvalidateRow(RecNum);
    tblCustomer.AllowRedraw := True;
  end;                                                                 {!!.13}
end;

procedure TfrmCustomers.tblCustomerBeginEdit(Sender: TObject;
  RowNum: Longint; ColNum: Integer; var AllowIt: Boolean);
begin
  {refresh current record}
  RefreshRecord(RowNum);

  {can this record be edited (Col 1 is the customer number)}
  AllowIt := (ColNum > 1) and dbCustomer.CanModify;
  if AllowIt then begin
    try
      dbCustomer.Edit;
    except
      AllowIt := False;
      raise
    end;
    {lock record so that it stays in the cache until we are done editing}
    CustomerCache.LockCacheItem(RowNum);
  end;
end;

procedure TfrmCustomers.tblCustomerDoneEdit(Sender: TObject;
  RowNum: Longint; ColNum: Integer);
var
  P : PCustomerData;
begin
  try
    {update database record}
    P  := PCustomerData(CustomerCache.Items[RowNum]);
    if Assigned(P) then begin
      case ColNum of
        0 : {row label column};
        1 : {no editing of customer number allowed};
        2 : dbCustomerCompany.AsString := string(P^.Company);
        3 : dbCustomerAddr1.AsString   := string(P^.Addr1);
        4 : dbCustomerAddr2.AsString   := string(P^.Addr2);
        5 : dbCustomerCity.AsString    := string(P^.City);
        6 : dbCustomerState.AsString   := string(P^.State);
        7 : dbCustomerZip.AsString     := string(P^.Zip);
        8 : dbCustomerCountry.AsString := string(P^.Country);
        9 : dbCustomerPhone.AsString   := string(P^.Phone);
       10 : dbCustomerFAX.AsString     := string(P^.FAX);
       11 : dbCustomerTaxRate.AsFloat  := P^.TaxRate;
       12 : dbCustomerContact.AsString := string(P^.Contact);
       13 : dbCustomerLastInvoiceDate.AsDateTime :=
              StDateToDateTime(P^.InvoiceDate);
      end;
      {post changes and stop editing}
      dbCustomer.Post;
    end;
  finally
    {unlock record}
    CustomerCache.UnlockCacheItem;
  end;
end;

procedure TfrmCustomers.btnCloseClick(Sender: TObject);
begin
  {if editing, stop and post changes}
  if tblCustomer.InEditingState then
    if not tblCustomer.StopEditingState(True) then
      Exit;
  Close;
end;

procedure TfrmCustomers.tblCustomerActiveCellChanged(Sender: TObject;
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

procedure TfrmCustomers.tblCustomerTopLeftCellChanging(Sender: TObject;
  var RowNum: Longint; var ColNum: Integer);
var
  R : LongInt;
  C : Integer;
begin
  R := tblCustomer.TopRow;
  C := tblCustomer.LeftCol;
  if RowNum = R then Exit;

  try
    {if editing, stop and post changes}
    if tblCustomer.InEditingState then
      if not tblCustomer.StopEditingState(True) then begin
        RowNum := R;
        ColNum := C;
      end;
  except
    RowNum := R;
    ColNum := C;
    raise;
  end;
end;

procedure TfrmCustomers.tblCustomerLockedCellClick(Sender: TObject;
  RowNum: Longint; ColNum: Integer);
begin
  if RowNum = 0 then
    tblCustomer.ActiveCol := ColNum;
  if ColNum = 0 then
    tblCustomer.ActiveRow := RowNum;
end;

procedure TfrmCustomers.btnAboutClick(Sender: TObject);
begin
  frmAbout := TfrmAbout.Create(Self);
  try
    frmAbout.ShowModal;
  finally
    frmAbout.Free;
  end;
end;

end.
