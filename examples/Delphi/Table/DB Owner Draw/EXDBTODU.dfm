object Form1: TForm1
  Left = 243
  Top = 185
  ActiveControl = OvcDbTable1
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object OvcDbTable1: TOvcDbTable
    Left = 13
    Top = 14
    Width = 531
    Height = 197
    LockedColumns = 0
    Access = otxNormal
    Adjust = otaCenterLeft
    BorderStyle = bsSingle
    ColorUnused = clWindow
    Controller = OvcController1
    DataSource = DataSource1
    DefaultMargin = 4
    GridPenSet.NormalGrid.NormalColor = clBtnShadow
    GridPenSet.NormalGrid.Style = psDot
    GridPenSet.NormalGrid.Effect = geBoth
    GridPenSet.LockedGrid.NormalColor = clBtnShadow
    GridPenSet.LockedGrid.Style = psSolid
    GridPenSet.LockedGrid.Effect = ge3D
    GridPenSet.CellWhenFocused.NormalColor = clBlack
    GridPenSet.CellWhenFocused.Style = psSolid
    GridPenSet.CellWhenFocused.Effect = geBoth
    GridPenSet.CellWhenUnfocused.NormalColor = clBlack
    GridPenSet.CellWhenUnfocused.Style = psDash
    GridPenSet.CellWhenUnfocused.Effect = geBoth
    HeaderHeight = 21
    HeaderOptions = [hoShowHeader]
    Options = [dtoCellsPaintText, dtoShowIndicators]
    ParentColor = False
    RowHeight = 21
    RowIndicatorWidth = 11
    ScrollBars = ssBoth
    TabOrder = 0
    TabStop = True
    TextStyle = tsFlat
    CellData = (
      'Form1.OvcTCSimpleField5'
      'Form1.OvcTCSimpleField4'
      'Form1.OvcTCSimpleField3'
      'Form1.OvcTCSimpleField2'
      'Form1.OvcTCSimpleField1')
    ColData = (
      107
      False
      'Name'
      0
      True
      'OvcTCSimpleField1'
      104
      False
      'Capital'
      0
      True
      'OvcTCSimpleField2'
      109
      False
      'Continent'
      0
      True
      'OvcTCSimpleField3'
      81
      False
      'Area'
      0
      True
      'OvcTCSimpleField4'
      96
      False
      'Population'
      0
      True
      'OvcTCSimpleField5')
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
    Epoch = 2000
    Left = 122
    Top = 78
  end
  object OvcTCSimpleField1: TOvcTCSimpleField
    Access = otxNormal
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 24
    Options = [efoCaretToEnd]
    Table = OvcDbTable1
    OnOwnerDraw = OvcTCSimpleField1OwnerDraw
    Left = 114
    Top = 171
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 38
    Top = 174
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'COUNTRY.DB'
    Left = 76
    Top = 172
  end
  object OvcTCSimpleField2: TOvcTCSimpleField
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 24
    Options = [efoCaretToEnd]
    Table = OvcDbTable1
    OnOwnerDraw = OvcTCSimpleField2OwnerDraw
    Left = 151
    Top = 168
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCSimpleField3: TOvcTCSimpleField
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 24
    Options = [efoCaretToEnd]
    Table = OvcDbTable1
    OnOwnerDraw = OvcTCSimpleField3OwnerDraw
    Left = 189
    Top = 167
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCSimpleField4: TOvcTCSimpleField
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    DataType = sftExtended
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 14
    Options = [efoCaretToEnd]
    PictureMask = '#'
    Table = OvcDbTable1
    OnOwnerDraw = OvcTCSimpleField4OwnerDraw
    Left = 224
    Top = 166
    RangeHigh = {E175587FED2AB1ECFE7F}
    RangeLow = {E175587FED2AB1ECFEFF}
  end
  object OvcTCSimpleField5: TOvcTCSimpleField
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    DataType = sftExtended
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 14
    Options = [efoCaretToEnd, efoRightAlign]
    PictureMask = '#'
    Table = OvcDbTable1
    OnOwnerDraw = OvcTCSimpleField5OwnerDraw
    Left = 262
    Top = 166
    RangeHigh = {E175587FED2AB1ECFE7F}
    RangeLow = {E175587FED2AB1ECFEFF}
  end
end
