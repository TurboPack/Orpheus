{$J+} {Writable constants}

{$I OVC.INC}
unit ExOutl3U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFDEF Version4} ImgList, {$ENDIF}
  StdCtrls, Db, DBTables, OvcBase, OvcVLB, OvcOutln, Menus;

type
  TForm1 = class(TForm)
    OvcOutline1: TOvcOutline;
    OvcController1: TOvcController;
    CustTable: TTable;
    CustTableCustNo: TFloatField;
    CustTableCompany: TStringField;
    CustTableAddr1: TStringField;
    CustTableAddr2: TStringField;
    CustTableCity: TStringField;
    CustTableState: TStringField;
    CustTableZip: TStringField;
    CustTableCountry: TStringField;
    CustTablePhone: TStringField;
    CustTableFAX: TStringField;
    CustTableTaxRate: TFloatField;
    CustTableContact: TStringField;
    CustTableLastInvoiceDate: TDateTimeField;
    OrdTable: TTable;
    OrdTableOrderNo: TFloatField;
    OrdTableCustNo: TFloatField;
    OrdTableSaleDate: TDateTimeField;
    OrdTableShipDate: TDateTimeField;
    OrdTableEmpNo: TIntegerField;
    OrdTableShipToContact: TStringField;
    OrdTableShipToAddr1: TStringField;
    OrdTableShipToAddr2: TStringField;
    OrdTableShipToCity: TStringField;
    OrdTableShipToState: TStringField;
    OrdTableShipToZip: TStringField;
    OrdTableShipToCountry: TStringField;
    OrdTableShipToPhone: TStringField;
    OrdTableShipVIA: TStringField;
    OrdTablePO: TStringField;
    OrdTableTerms: TStringField;
    OrdTablePaymentMethod: TStringField;
    OrdTableItemsTotal: TCurrencyField;
    OrdTableTaxRate: TFloatField;
    OrdTableFreight: TCurrencyField;
    OrdTableAmountPaid: TCurrencyField;
    ItemTable: TTable;
    ItemTableItemNo: TFloatField;
    ItemTablePartNo: TFloatField;
    ItemTableQty: TIntegerField;
    ItemTableDiscount: TFloatField;
    ItemTableOrderNo: TFloatField;
    PopupMenu1: TPopupMenu;
    mnExpandAll: TMenuItem;
    mnCollapseAll: TMenuItem;
    procedure OvcOutline1NodeDestroy(Sender: TOvcCustomOutline;
      Node: TOvcOutlineNode);
    procedure OvcOutline1DynamicLoad(Sender: TOvcCustomOutline;
      Node: TOvcOutlineNode);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OvcOutline1DrawText(Sender: TOvcCustomOutline;
      Canvas: TCanvas; Item: TOvcOutlineNode; const Text: String;
      Rect: TRect; var DefaultDrawing: Boolean);
    procedure mnExpandAllClick(Sender: TObject);
    procedure mnCollapseAllClick(Sender: TObject);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

type
  TCustRef = class
    CustomerNo : Double;
    constructor Create(CustNo : Double);
  end;
  TDetailsRef = class(TCustRef)
  end;
  TOrdersRef = class(TCustRef)
  end;

  TOrderRef = class
    OrderNo : Double;
    constructor Create(OrdNo : Double);
  end;
  TOrderDetailsRef = class(TOrderRef)
  end;
  TOrderLinesRef = class(TOrderRef)
  end;

{ TCustRef }

constructor TCustRef.Create(CustNo: Double);
begin
  CustomerNo := CustNo;
end;

{ TOrderRef }

constructor TOrderRef.Create(OrdNo: Double);
begin
  OrderNo := OrdNo;
end;

procedure TForm1.OvcOutline1NodeDestroy(Sender: TOvcCustomOutline;
  Node: TOvcOutlineNode);
begin
  TObject(Node.Data).Free;
end;

procedure TForm1.OvcOutline1DynamicLoad(Sender: TOvcCustomOutline;
  Node: TOvcOutlineNode);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    if (Node.Data <> nil) then
      if (TObject(Node.Data) is TOrderLinesRef) then begin
        ItemTable.SetRange([TOrderLinesRef(Node.Data).OrderNo],[TOrderLinesRef(Node.Data).OrderNo]);
        ItemTable.First;
        while not ItemTable.eof do begin
          OvcOutline1.Nodes.AddChild(
            Node,
            format('Item: %s  Part#: %s  Qty: %s  Discount: %s',
              [ItemTableItemNo.AsString,
               ItemTablePartNo.AsString,
               ItemTableQty.AsString,
               ItemTableDiscount.AsString]));
          ItemTable.Next;
        end;
        ItemTable.CancelRange;
      end else
      if (TObject(Node.Data) is TOrderDetailsRef) then begin
        OrdTable.IndexFieldNames := 'OrderNo';
        if OrdTable.FindKey([TOrderDetailsRef(Node.Data).OrderNo]) then begin
          OvcOutline1.Nodes.AddChild(Node,'Sale Date: '+OrdTableSaleDate.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Ship Date: '+OrdTableShipDate.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Terms: '+OrdTableTerms.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Payment: '+OrdTablePaymentMethod.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Items Total: '+OrdTableItemsTotal.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Amount Paid: '+OrdTableAmountPaid.AsString);
        end;
      end else
      if (TObject(Node.Data) is TOrderRef) then begin
        OvcOutline1.Nodes.AddChildObjectEx(
          Node,'Order Details', TOrderDetailsRef.Create(TOrderRef(Node.Data).OrderNo),
            -1, omDynamic);
        OvcOutline1.Nodes.AddChildObjectEx(
          Node,'Order Lines', TOrderLinesRef.Create(TOrderRef(Node.Data).OrderNo),
            -1, omDynamic);
      end else
      if (TObject(Node.Data) is TOrdersRef) then begin
        OrdTable.IndexFieldNames := 'CustNo';
        OrdTable.SetRange([TOrdersRef(Node.Data).CustomerNo],[TOrdersRef(Node.Data).CustomerNo]);
        OrdTable.First;
        while not OrdTable.eof do begin
          OvcOutline1.Nodes.AddChildObjectEx(
            Node,
            OrdTableOrderNo.AsString,
            TOrderRef.Create(OrdTableOrderNo.AsFloat),
            -1, omDynamic);
          OrdTable.Next;
        end;
        OrdTable.CancelRange;
      end else
      if (TObject(Node.Data) is TDetailsRef) then begin
        if CustTable.FindKey([TDetailsRef(Node.Data).CustomerNo]) then begin
          OvcOutline1.Nodes.AddChild(Node,'Customer #: ' + CustTableCustNo.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Addr1: '+CustTableAddr1.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Addr2: '+CustTableAddr2.AsString);
          OvcOutline1.Nodes.AddChild(Node,'City: '+CustTableCity.AsString);
          OvcOutline1.Nodes.AddChild(Node,'State: '+CustTableState.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Zip: '+CustTableZip.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Country: '+CustTableCountry.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Phone: '+CustTablePhone.AsString);
          OvcOutline1.Nodes.AddChild(Node,'FAX: '+CustTableFAX.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Tax Rate: '+CustTableTaxRate.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Contact: '+CustTableContact.AsString);
          OvcOutline1.Nodes.AddChild(Node,'Last Invoice: '+CustTableLastInvoiceDate.AsString);
        end;
      end else
      if (TObject(Node.Data) is TCustRef) then begin
        OvcOutline1.Nodes.AddChildObjectEx(
          Node,'Company Details', TDetailsRef.Create(TCustRef(Node.Data).CustomerNo),
            -1, omDynamic);
        OvcOutline1.Nodes.AddChildObjectEx(
          Node,'Orders', TOrdersRef.Create(TCustRef(Node.Data).CustomerNo),
            -1, omDynamic);
      end;
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CustTable.Open;
  CustTable.First;
  while not CustTable.eof do begin
    OvcOutline1.Nodes.AddObjectEx(
      CustTableCompany.AsString,
      TCustRef.Create(CustTableCustNo.AsFloat),
      -1, omDynamic);
    CustTable.Next;
  end;
  OrdTable.Open;
  ItemTable.Open;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  CustTable.Close;
  OrdTable.Close;
  ItemTable.Close;
end;

procedure TForm1.OvcOutline1DrawText(Sender: TOvcCustomOutline;
  Canvas: TCanvas; Item: TOvcOutlineNode; const Text: String; Rect: TRect;
  var DefaultDrawing: Boolean);
begin
  if (TObject(Item.Data) is TOrderLinesRef) then begin
    Canvas.Font.Color := clWhite;
    Canvas.Brush.Color := clBlack;
  end else
  if (TObject(Item.Data) is TOrderDetailsRef) then
    Canvas.Font.Color := clGreen
  else
  if (TObject(Item.Data) is TOrderRef) then
    Canvas.Font.Color := clMaroon
  else
  if (TObject(Item.Data) is TOrdersRef) then
    Canvas.Font.Style := [fsItalic]
  else
  if (TObject(Item.Data) is TDetailsRef) then
    Canvas.Font.Style := [fsUnderline]
  else
  if (TObject(Item.Data) is TCustRef) then
    Canvas.Font.Style := [fsBold];
end;

procedure TForm1.mnExpandAllClick(Sender: TObject);
begin
  OvcOutline1.ExpandAll;
end;

procedure TForm1.mnCollapseAllClick(Sender: TObject);
begin
  OvcOutline1.CollapseAll;
end;

end.
