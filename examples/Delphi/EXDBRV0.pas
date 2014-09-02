unit ExDbRv0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcRVIdx, OvcRptVw, OvcDbRpV, Db, DBTables, StdCtrls, ExtCtrls,
  Buttons, OvcCmbx, OvcRvCbx, OvcSplit, Menus, OvcDlg, OvcRvPDg, OvcFiler,
  OvcStore;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    OvcSplitter1: TOvcSplitter;
    OvcDbReportView1: TOvcDbReportView;
    Panel1: TPanel;
    OvcViewComboBox1: TOvcViewComboBox;
    Panel2: TPanel;
    OvcViewComboBox2: TOvcViewComboBox;
    OvcDbReportView2: TOvcDbReportView;
    Table2: TTable;
    DataSource2: TDataSource;
    Table2OrderNo: TFloatField;
    Table2SaleDate: TDateTimeField;
    Table2ShipDate: TDateTimeField;
    Table2EmpNo: TIntegerField;
    Table2ShipToContact: TStringField;
    Table2ShipToAddr1: TStringField;
    Table2ShipToAddr2: TStringField;
    Table2ShipToCity: TStringField;
    Table2ShipToState: TStringField;
    Table2ShipToZip: TStringField;
    Table2ShipToCountry: TStringField;
    Table2ShipToPhone: TStringField;
    Table2ShipVIA: TStringField;
    Table2PO: TStringField;
    Table2Terms: TStringField;
    Table2PaymentMethod: TStringField;
    Table2ItemsTotal: TCurrencyField;
    Table2TaxRate: TFloatField;
    Table2Freight: TCurrencyField;
    Table2AmountPaid: TCurrencyField;
    Table1CustNo: TFloatField;
    Table1Company: TStringField;
    Table1Addr1: TStringField;
    Table1Addr2: TStringField;
    Table1City: TStringField;
    Table1State: TStringField;
    Table1Zip: TStringField;
    Table1Country: TStringField;
    Table1Phone: TStringField;
    Table1FAX: TStringField;
    Table1TaxRate: TFloatField;
    Table1Contact: TStringField;
    Table1LastInvoiceDate: TDateTimeField;
    Table2CustNo: TFloatField;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    OvcRvPrintDialog1: TOvcRvPrintDialog;
    Print1: TMenuItem;
    PrintOptions1: TMenuItem;
    OvcRvPrintDialog2: TOvcRvPrintDialog;
    N1: TMenuItem;
    PrintOrdersforCurrentCustomer1: TMenuItem;
    PrintOptionsforOrdersView1: TMenuItem;
    N2: TMenuItem;
    PrintMasterDetailView1: TMenuItem;
    N3: TMenuItem;
    View1: TMenuItem;
    Customers1: TMenuItem;
    Orders1: TMenuItem;
    CreateNewViewLayout1: TMenuItem;
    EditCurrentViewLayout1: TMenuItem;
    DuplicateThenEditCurrentLayout1: TMenuItem;
    DeleteCurrentLayout1: TMenuItem;
    CreateNewViewLayout2: TMenuItem;
    EditCurrentViewLayout2: TMenuItem;
    DuplicateThenEditCurrentLayout2: TMenuItem;
    Delete1: TMenuItem;
    N4: TMenuItem;
    EditCalculatedFields1: TMenuItem;
    N5: TMenuItem;
    EditCalculatedFields2: TMenuItem;
    OvcIniFileStore1: TOvcIniFileStore;
    procedure FormShow(Sender: TObject);
    procedure OvcDbReportView1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintOptions1Click(Sender: TObject);
    procedure OvcDbReportView1GetPrintHeaderFooter(Sender: TObject;
      IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
      RightString: String; var LeftAttr, CenterAttr,
      RightAttr: TFontStyles);
    procedure PrintOrdersforCurrentCustomer1Click(Sender: TObject);
    procedure PrintOptionsforOrdersView1Click(Sender: TObject);
    procedure OvcDbReportView2GetPrintHeaderFooter(Sender: TObject;
      IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
      RightString: String; var LeftAttr, CenterAttr,
      RightAttr: TFontStyles);
    procedure PrintMasterDetailView1Click(Sender: TObject);
    procedure OvcDbReportView1DetailPrint(Sender: TObject);
    procedure CreateNewViewLayout1Click(Sender: TObject);
    procedure EditCurrentViewLayout1Click(Sender: TObject);
    procedure DuplicateThenEditCurrentLayout1Click(Sender: TObject);
    procedure DeleteCurrentLayout1Click(Sender: TObject);
    procedure CreateNewViewLayout2Click(Sender: TObject);
    procedure EditCurrentViewLayout2Click(Sender: TObject);
    procedure DuplicateThenEditCurrentLayout2Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure EditCalculatedFields1Click(Sender: TObject);
    procedure EditCalculatedFields2Click(Sender: TObject);
//    procedure OvcDbReportView1DetailPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  ExRvDir1; {Print options dialog}

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
begin
  Table2.SetRange([1001],[1000]);
end;

procedure TForm1.OvcDbReportView1Click(Sender: TObject);
begin
  if OvcDbReportView1.CurrentItem <> nil then
    Table2.SetRange([Table1CustNo.Value], [Table1CustNo.Value])
  else
    Table2.SetRange([1001],[1000]); {empty range}
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  OvcRvPrintDialog1.Execute;
end;

procedure TForm1.PrintOptions1Click(Sender: TObject);
begin
  with TOvcRvPOptions.Create(Application) do
    try
      LoadValues(OvcDbReportView1);
      if ShowModal = mrOK then
        SaveValues(OvcDbReportView1);
    finally
      Free;
    end;
end;

procedure TForm1.OvcDbReportView1GetPrintHeaderFooter(Sender: TObject;
  IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
  RightString: String; var LeftAttr, CenterAttr, RightAttr: TFontStyles);
begin
  if IsHeader then
    if (Line = 0) then
      if OvcDbReportView1.PrintDetailView <> nil then
        CenterString := 'Customers with Orders'
      else
        CenterString := 'Customers'
    else
  else
    if Line = 1 then
      CenterString := format('Page %d of %d',[
        OvcDbReportView1.PageNumber, OvcDbReportView1.PageCount]);
end;

procedure TForm1.PrintOrdersforCurrentCustomer1Click(Sender: TObject);
begin
  OvcRvPrintDialog2.Execute;
end;

procedure TForm1.PrintOptionsforOrdersView1Click(Sender: TObject);
begin
  with TOvcRvPOptions.Create(Application) do
    try
      LoadValues(OvcDbReportView2);
      if ShowModal = mrOK then
        SaveValues(OvcDbReportView2);
    finally
      Free;
    end;
end;

procedure TForm1.OvcDbReportView2GetPrintHeaderFooter(Sender: TObject;
  IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
  RightString: String; var LeftAttr, CenterAttr, RightAttr: TFontStyles);
begin
  if IsHeader and (Line = 0) then
    CenterString := 'Orders for customer ' + Table1CustNo.DisplayText;
end;

procedure TForm1.PrintMasterDetailView1Click(Sender: TObject);
var
  SaveSelection: Pointer;
begin
  SaveSelection := OvcDbReportView1.CurrentItem;
  OvcDbReportView1.PrintDetailView := OvcDbReportView2;
  try
    OvcRvPrintDialog1.Execute;
  finally
    OvcDbReportView1.PrintDetailView := nil;
    {force unconditional refresh after print}
    OvcDbReportView1.CurrentItem := SaveSelection;
    OvcDbReportView1Click(nil);
  end;
end;

procedure TForm1.OvcDbReportView1DetailPrint(Sender: TObject);
begin
  Table2.SetRange([Table1CustNo.Value], [Table1CustNo.Value]);
end;

procedure TForm1.CreateNewViewLayout1Click(Sender: TObject);
begin
  OvcDbReportView1.EditNewView('New View');
end;

procedure TForm1.EditCurrentViewLayout1Click(Sender: TObject);
begin
  OvcDbReportView1.EditCurrentView;
end;

procedure TForm1.DuplicateThenEditCurrentLayout1Click(Sender: TObject);
begin
  OvcDbReportView1.EditCopyOfCurrentView;
end;

procedure TForm1.DeleteCurrentLayout1Click(Sender: TObject);
begin
  if OvcDbReportView1.CurrentView = nil then
    raise Exception.Create('No view is currently active');
  if MessageDlg('Delete current view. Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
    OvcDbReportView1.CurrentView.Free;
end;

procedure TForm1.CreateNewViewLayout2Click(Sender: TObject);
begin
  OvcDbReportView2.EditNewView('New View');
end;

procedure TForm1.EditCurrentViewLayout2Click(Sender: TObject);
begin
  OvcDbReportView2.EditCurrentView;
end;

procedure TForm1.DuplicateThenEditCurrentLayout2Click(Sender: TObject);
begin
  OvcDbReportView2.EditCopyOfCurrentView;
end;

procedure TForm1.Delete1Click(Sender: TObject);
begin
  if OvcDbReportView2.CurrentView = nil then
    raise Exception.Create('No view is currently active');
  if MessageDlg('Delete current view. Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
    OvcDbReportView2.CurrentView.Free;
end;

procedure TForm1.EditCalculatedFields1Click(Sender: TObject);
begin
  OvcDbReportView1.EditCalculatedFields;
end;

procedure TForm1.EditCalculatedFields2Click(Sender: TObject);
begin
  OvcDbReportView2.EditCalculatedFields;
end;

end.
