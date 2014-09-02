object Form1: TForm1
  Left = 256
  Top = 170
  Caption = 'Example using an outline to display data from a database'
  ClientHeight = 307
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object OvcOutline1: TOvcOutline
    Left = 0
    Top = 0
    Width = 423
    Height = 307
    Align = alClient
    Controller = OvcController1
    IntegralHeight = False
    PopupMenu = PopupMenu1
    SelectColor.BackColor = clHighlight
    SelectColor.TextColor = clHighlightText
    TabOrder = 0
    OnDrawText = OvcOutline1DrawText
    OnDynamicLoad = OvcOutline1DynamicLoad
    OnNodeDestroy = OvcOutline1NodeDestroy
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 1900
  end
  object CustTable: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 24
    Top = 24
    object CustTableCustNo: TFloatField
      FieldName = 'CustNo'
    end
    object CustTableCompany: TStringField
      FieldName = 'Company'
      Size = 30
    end
    object CustTableAddr1: TStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object CustTableAddr2: TStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object CustTableCity: TStringField
      FieldName = 'City'
      Size = 15
    end
    object CustTableState: TStringField
      FieldName = 'State'
    end
    object CustTableZip: TStringField
      FieldName = 'Zip'
      Size = 10
    end
    object CustTableCountry: TStringField
      FieldName = 'Country'
    end
    object CustTablePhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object CustTableFAX: TStringField
      FieldName = 'FAX'
      Size = 15
    end
    object CustTableTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object CustTableContact: TStringField
      FieldName = 'Contact'
    end
    object CustTableLastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
  object OrdTable: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'ORDERS.DB'
    Left = 24
    Top = 80
    object OrdTableOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
    object OrdTableCustNo: TFloatField
      FieldName = 'CustNo'
      Required = True
    end
    object OrdTableSaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object OrdTableShipDate: TDateTimeField
      FieldName = 'ShipDate'
    end
    object OrdTableEmpNo: TIntegerField
      FieldName = 'EmpNo'
      Required = True
    end
    object OrdTableShipToContact: TStringField
      FieldName = 'ShipToContact'
    end
    object OrdTableShipToAddr1: TStringField
      FieldName = 'ShipToAddr1'
      Size = 30
    end
    object OrdTableShipToAddr2: TStringField
      FieldName = 'ShipToAddr2'
      Size = 30
    end
    object OrdTableShipToCity: TStringField
      FieldName = 'ShipToCity'
      Size = 15
    end
    object OrdTableShipToState: TStringField
      FieldName = 'ShipToState'
    end
    object OrdTableShipToZip: TStringField
      FieldName = 'ShipToZip'
      Size = 10
    end
    object OrdTableShipToCountry: TStringField
      FieldName = 'ShipToCountry'
    end
    object OrdTableShipToPhone: TStringField
      FieldName = 'ShipToPhone'
      Size = 15
    end
    object OrdTableShipVIA: TStringField
      FieldName = 'ShipVIA'
      Size = 7
    end
    object OrdTablePO: TStringField
      FieldName = 'PO'
      Size = 15
    end
    object OrdTableTerms: TStringField
      FieldName = 'Terms'
      Size = 6
    end
    object OrdTablePaymentMethod: TStringField
      FieldName = 'PaymentMethod'
      Size = 7
    end
    object OrdTableItemsTotal: TCurrencyField
      FieldName = 'ItemsTotal'
    end
    object OrdTableTaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object OrdTableFreight: TCurrencyField
      FieldName = 'Freight'
    end
    object OrdTableAmountPaid: TCurrencyField
      FieldName = 'AmountPaid'
    end
  end
  object ItemTable: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'ITEMS.DB'
    Left = 24
    Top = 136
    object ItemTableItemNo: TFloatField
      FieldName = 'ItemNo'
    end
    object ItemTablePartNo: TFloatField
      FieldName = 'PartNo'
    end
    object ItemTableQty: TIntegerField
      FieldName = 'Qty'
    end
    object ItemTableDiscount: TFloatField
      FieldName = 'Discount'
    end
    object ItemTableOrderNo: TFloatField
      FieldName = 'OrderNo'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 80
    object mnExpandAll: TMenuItem
      Caption = 'Expand All'
      OnClick = mnExpandAllClick
    end
    object mnCollapseAll: TMenuItem
      Caption = 'Collapse All'
      OnClick = mnCollapseAllClick
    end
  end
end
