object Form1: TForm1
  Left = 215
  Top = 107
  ActiveControl = TB
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 375
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TBitBtn
    Left = 400
    Top = 344
    Width = 73
    Height = 24
    Caption = '&Close'
    DoubleBuffered = True
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object TB: TOvcDbTable
    Left = 8
    Top = 8
    Width = 465
    Height = 150
    LockedColumns = 0
    Access = otxNormal
    Adjust = otaCenterLeft
    BorderStyle = bsSingle
    ColorUnused = clTeal
    Colors.ActiveFocused = clTeal
    Colors.ActiveFocusedText = clWindowText
    Colors.ActiveUnfocused = clLime
    Colors.ActiveUnfocusedText = clWindowText
    Colors.Editing = clWindow
    Controller = OvcController1
    Ctl3D = True
    DataSource = DataSource1
    DefaultMargin = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    GridPenSet.NormalGrid.NormalColor = clBtnShadow
    GridPenSet.NormalGrid.Style = psSolid
    GridPenSet.NormalGrid.Effect = ge3D
    GridPenSet.LockedGrid.NormalColor = clBtnShadow
    GridPenSet.LockedGrid.Style = psSolid
    GridPenSet.LockedGrid.Effect = ge3D
    GridPenSet.CellWhenFocused.NormalColor = clBlack
    GridPenSet.CellWhenFocused.Style = psSolid
    GridPenSet.CellWhenFocused.Effect = ge3D
    GridPenSet.CellWhenUnfocused.NormalColor = clBlack
    GridPenSet.CellWhenUnfocused.Style = psSolid
    GridPenSet.CellWhenUnfocused.Effect = ge3D
    HeaderCell = OvcTCColHead1
    HeaderHeight = 25
    HeaderOptions = [hoShowHeader, hoUseHeaderCell]
    Options = [dtoCellsPaintText, dtoShowIndicators]
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    RowHeight = 20
    RowIndicatorWidth = 11
    ScrollBars = ssBoth
    TabOrder = 1
    TabStop = True
    TextStyle = tsFlat
    OnActiveCellChanged = TBActiveCellChanged
    OnIndicatorClick = TBIndicatorClick
    OnLeftColumnChanged = TBLeftColumnChanged
    OnLockedCellClick = TBLockedCellClick
    OnUnusedAreaClick = TBUnusedAreaClick
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCPictureField1'
      'Form1.OvcTCNumericField1'
      'Form1.OvcTCComboBox1'
      'Form1.OvcTCString1')
    ColData = (
      64
      False
      'CustNo'
      0
      False
      184
      False
      'Company'
      0
      True
      'OvcTCString1'
      184
      False
      'Addr1'
      0
      True
      'OvcTCString1'
      184
      False
      'Addr2'
      0
      False
      94
      False
      'City'
      0
      False
      124
      False
      'State'
      0
      True
      'OvcTCComboBox1'
      64
      False
      'Zip'
      0
      False
      124
      False
      'Country'
      0
      False
      94
      False
      'Phone'
      0
      False
      94
      False
      'FAX'
      0
      False
      64
      False
      'TaxRate'
      0
      True
      'OvcTCNumericField1'
      124
      False
      'Contact'
      0
      False
      97
      False
      'LastInvoiceDate'
      0
      True
      'OvcTCPictureField1')
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 160
    Width = 385
    Height = 209
    TabOrder = 2
    object TLabel
      Left = 232
      Top = 16
      Width = 78
      Height = 13
      Caption = 'Locked columns'
    end
    object TLabel
      Left = 232
      Top = 40
      Width = 55
      Height = 13
      Caption = 'Left column'
    end
    object TLabel
      Left = 232
      Top = 64
      Width = 50
      Height = 13
      Caption = 'Active row'
    end
    object TLabel
      Left = 232
      Top = 88
      Width = 67
      Height = 13
      Caption = 'Active column'
    end
    object TLabel
      Left = 232
      Top = 112
      Width = 67
      Height = 13
      Caption = 'Header height'
    end
    object TLabel
      Left = 232
      Top = 136
      Width = 54
      Height = 13
      Caption = 'Row height'
    end
    object lblClicks: TLabel
      Left = 112
      Top = 184
      Width = 183
      Height = 13
      Caption = 'Non-Cell click notifications display here'
    end
    object cbCellsPaintText: TCheckBox
      Left = 8
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Cells paint text'
      TabOrder = 3
      OnClick = cbCellsPaintTextClick
    end
    object cbAlwaysEditing: TCheckBox
      Left = 8
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Always editing'
      TabOrder = 2
      OnClick = cbAlwaysEditingClick
    end
    object cbTableActive: TCheckBox
      Left = 112
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Table active'
      TabOrder = 12
      OnClick = cbTableActiveClick
    end
    object cbShowPictures: TCheckBox
      Left = 8
      Top = 168
      Width = 97
      Height = 17
      Caption = 'Show pictures'
      TabOrder = 10
      OnClick = cbShowPicturesClick
    end
    object sfLockedColumns: TOvcSimpleField
      Left = 320
      Top = 16
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 21
      OnExit = sfLockedColumnsExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object cbShowHeader: TCheckBox
      Left = 8
      Top = 136
      Width = 97
      Height = 17
      Caption = 'Show header'
      TabOrder = 8
      OnClick = cbShowHeaderClick
    end
    object sfLeftColumn: TOvcSimpleField
      Left = 320
      Top = 40
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 22
      OnExit = sfLeftColumnExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object sfActiveRow: TOvcSimpleField
      Left = 320
      Top = 64
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 23
      OnExit = sfActiveRowExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object cbUseHeaderCell: TCheckBox
      Left = 112
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Use header cell'
      TabOrder = 13
      OnClick = cbUseHeaderCellClick
    end
    object cbAllowMove: TCheckBox
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Allow move'
      TabOrder = 0
      OnClick = cbAllowMoveClick
    end
    object cbAllowSize: TCheckBox
      Left = 8
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Allow size'
      TabOrder = 1
      OnClick = cbAllowSizeClick
    end
    object cbShowIndicators: TCheckBox
      Left = 8
      Top = 152
      Width = 97
      Height = 17
      Caption = 'Show indicators'
      TabOrder = 9
      OnClick = cbShowIndicatorsClick
    end
    object sfActiveColumn: TOvcSimpleField
      Left = 320
      Top = 88
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 24
      OnExit = sfActiveColumnExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object sfHeaderHeight: TOvcSimpleField
      Left = 320
      Top = 112
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 25
      OnExit = sfHeaderHeightExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object sfRowHeight: TOvcSimpleField
      Left = 320
      Top = 136
      Width = 57
      Height = 21
      Cursor = crIBeam
      DataType = sftInteger
      CaretOvr.Shape = csBlock
      ControlCharColor = clRed
      Controller = OvcController1
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      MaxLength = 5
      Options = [efoCaretToEnd]
      PictureMask = 'i'
      TabOrder = 26
      OnExit = sfRowHeightExit
      RangeHigh = {FF7F0000000000000000}
      RangeLow = {00000000000000000000}
    end
    object cbHighlightRow: TCheckBox
      Left = 8
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Highlight row'
      TabOrder = 5
      OnClick = cbHighlightRowClick
    end
    object cbUseLetters: TCheckBox
      Left = 112
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Use letters'
      TabOrder = 14
      OnClick = cbUseLettersClick
    end
    object cbUseStrings: TCheckBox
      Left = 112
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Use strings'
      TabOrder = 15
      OnClick = cbUseStringsClick
    end
    object cbVisible: TCheckBox
      Left = 112
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Visible'
      TabOrder = 16
      OnClick = cbVisibleClick
    end
    object cbEnterToTab: TCheckBox
      Left = 8
      Top = 72
      Width = 97
      Height = 17
      Caption = 'Enter to tab'
      TabOrder = 4
      OnClick = cbEnterToTabClick
    end
    object cbWantTabs: TCheckBox
      Left = 112
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Want tabs'
      TabOrder = 17
      OnClick = cbWantTabsClick
    end
    object cbPageScroll: TCheckBox
      Left = 8
      Top = 120
      Width = 97
      Height = 17
      Caption = 'Page scroll'
      TabOrder = 7
      OnClick = cbPageScrollClick
    end
    object cbStretchPictures: TCheckBox
      Left = 8
      Top = 184
      Width = 97
      Height = 17
      Caption = 'Stretch pictures'
      TabOrder = 11
      OnClick = cbStretchPicturesClick
    end
    object cbIntegralHeight: TCheckBox
      Left = 8
      Top = 104
      Width = 97
      Height = 17
      Caption = 'Integral height'
      TabOrder = 6
      OnClick = cbIntegralHeightClick
    end
    object cbWrapAtEnds: TCheckBox
      Left = 112
      Top = 104
      Width = 97
      Height = 17
      Caption = 'Wrap at ends'
      TabOrder = 18
      OnClick = cbWrapAtEndsClick
    end
    object cbTable1: TCheckBox
      Left = 112
      Top = 120
      Width = 97
      Height = 17
      Caption = 'Use Table1'
      TabOrder = 19
      OnClick = cbTable1Click
    end
    object cbTable2: TCheckBox
      Left = 112
      Top = 136
      Width = 97
      Height = 17
      Caption = 'Use Table2'
      TabOrder = 20
      OnClick = cbTable2Click
    end
  end
  object btnUpdate: TBitBtn
    Left = 400
    Top = 304
    Width = 73
    Height = 24
    Caption = 'Update'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btnUpdateClick
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
    Left = 120
    Top = 312
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'CUSTOMER.DB'
    Left = 184
    Top = 312
  end
  object OvcTCString1: TOvcTCString
    Adjust = otaCenterLeft
    MaxLength = 30
    Table = TB
    TextStyle = tsLowered
    UseASCIIZStrings = False
    Left = 152
    Top = 344
  end
  object OvcTCPictureField1: TOvcTCPictureField
    DataType = pftDate
    PictureMask = 'MM/DD/yy'
    MaxLength = 8
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Table = TB
    Left = 216
    Top = 344
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 152
    Top = 312
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'ANIMALS.DBF'
    Left = 216
    Top = 312
  end
  object OvcTCCheckBox1: TOvcTCCheckBox
    CellGlyphs.IsDefault = True
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    Left = 352
    Top = 224
  end
  object OvcTCComboBox1: TOvcTCComboBox
    AutoAdvanceChar = True
    AutoAdvanceLeftRight = True
    Items.Strings = (
      'AK'
      'AL'
      'AR'
      'AZ'
      'CA'
      'CO'
      'CT'
      'DC'
      'DE'
      'FL'
      'GA'
      'HI'
      'IA'
      'ID'
      'IL'
      'IN'
      'KS'
      'KY'
      'LA'
      'MA'
      'MD'
      'ME'
      'MI'
      'MN'
      'MO'
      'MS'
      'MT'
      'NC'
      'ND'
      'NE'
      'NH'
      'NJ'
      'NM'
      'NV'
      'NY'
      'OH'
      'OK'
      'OR'
      'PA'
      'RI'
      'SC'
      'SD'
      'TN'
      'TX'
      'UT'
      'VA'
      'VT'
      'WA'
      'WI'
      'WV'
      'WY')
    MaxLength = 20
    Style = csDropDownList
    Table = TB
    Left = 352
    Top = 256
  end
  object OvcTCSimpleField1: TOvcTCSimpleField
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 30
    Options = [efoCaretToEnd]
    TextStyle = tsLowered
    Left = 184
    Top = 344
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCNumericField1: TOvcTCNumericField
    Adjust = otaCenterRight
    DataType = nftExtended
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PictureMask = '###.##'
    Table = TB
    Left = 248
    Top = 344
    RangeHigh = {00000000000000C80540}
    RangeLow = {00000000000000000000}
  end
  object OvcTCBitMap1: TOvcTCBitMap
    Adjust = otaCenterLeft
    Left = 280
    Top = 344
  end
  object OvcTCGlyph1: TOvcTCGlyph
    CellGlyphs.IsDefault = False
    CellGlyphs.BitMap.Data = {
      9E060000424D9E0600000000000036040000280000002A0000000E0000000100
      0800000000006802000000000000000000000001000000010000000000000000
      80000080000000808000800000008000800080800000C0C0C00070686800A8A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D0D0D000A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDF8F8F8F8F8
      F8F8F8F8F8F8F8F8FDF8F8F8F8F8F8F8F8F8F8F8F8F8FDF8F8F8F8F8F8F8F8F8
      F8F8F8F8000000FFFFFFFFFFFFFFFFFFFFFFFFF800FFFFFFFFFFFFFFFFFFFFFF
      FFF800FFFFFFFFFFFFFFFFFFFFFFFFF8000000F807070707070707070707FFF8
      00F807070707070707070707FFF800F800070700000707000007FFF8000000F8
      07070707070707070707FFF800F807000007070707000007FFF800F807000007
      070000070700FFF8000000F807070707070707070707FFF800F8070000000707
      00000007FFF800F807000007070000070700FFF8000000F80707070707070707
      0707FFF800F807070000000000000707FFF800F800070700000707000007FFF8
      000000F807070707070707070707FFF800F807070700000000070707FFF800F8
      00070700000707000007FFF8000000F807070707070707070707FFF800F80707
      0700000000070707FFF800F807000007070000070700FFF8000000F807070707
      070707070707FFF800F807070000000000000707FFF800F80700000707000007
      0700FFF8000000F807070707070707070707FFF800F807000000070700000007
      FFF800F800070700000707000007FFF8000000F807070707070707070707FFF8
      00F807000007070707000007FFF800F800070700000707000007FFF8000000F8
      07070707070707070707FFF800F807070707070707070707FFF800F807000007
      070000070700FFF8000000F8F8F8F8F8F8F8F8F8F8F8FFF800F8F8F8F8F8F8F8
      F8F8F8F8FFF800F8F8F8F8F8F8F8F8F8F8F8FFF8000000000000000000000000
      000000F800000000000000000000000000F800000000000000000000000000F8
      0000}
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 3
    Left = 352
    Top = 192
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20')
    ShowLetters = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    Table = TB
    TableFont = False
    TextStyle = tsRaised
    UseASCIIZStrings = False
    UseWordWrap = True
    Left = 120
    Top = 344
  end
end
