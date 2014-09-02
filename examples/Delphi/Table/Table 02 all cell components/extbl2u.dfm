object Form1: TForm1
  Left = 192
  Top = 108
  Width = 599
  Height = 334
  Caption = 'Example Orpheus Table program showing use of all cell components'
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OvcTable1: TOvcTable
    Left = 0
    Top = 0
    Width = 591
    Height = 307
    RowLimit = 200
    Align = alClient
    Colors.ActiveFocused = clTeal
    Colors.ActiveFocusedText = clHighlightText
    Colors.ActiveUnfocused = clGreen
    Colors.ActiveUnfocusedText = clHighlightText
    Colors.Locked = clBtnFace
    Colors.LockedText = clWindowText
    Colors.Editing = clWindow
    Colors.EditingText = clWindowText
    Colors.Selected = clHighlight
    Colors.SelectedText = clHighlightText
    Controller = OvcController1
    GridPenSet.NormalGrid.NormalColor = clBtnShadow
    GridPenSet.NormalGrid.SecondColor = clBtnHighlight
    GridPenSet.NormalGrid.Style = psDot
    GridPenSet.NormalGrid.Effect = geBoth
    GridPenSet.LockedGrid.NormalColor = clBtnShadow
    GridPenSet.LockedGrid.SecondColor = clBtnHighlight
    GridPenSet.LockedGrid.Style = psSolid
    GridPenSet.LockedGrid.Effect = ge3D
    GridPenSet.CellWhenFocused.NormalColor = clBlack
    GridPenSet.CellWhenFocused.SecondColor = clBtnHighlight
    GridPenSet.CellWhenFocused.Style = psSolid
    GridPenSet.CellWhenFocused.Effect = geBoth
    GridPenSet.CellWhenUnfocused.NormalColor = clBlack
    GridPenSet.CellWhenUnfocused.SecondColor = clBtnHighlight
    GridPenSet.CellWhenUnfocused.Style = psDash
    GridPenSet.CellWhenUnfocused.Effect = geBoth
    LockedRowsCell = OvcTCColHead1
    Options = [otoMouseDragSelect, otoThumbTrack, otoAllowColMoves, otoAllowRowMoves]
    TabOrder = 0
    OnColumnsChanged = OvcTable1ColumnsChanged
    OnGetCellData = OvcTable1GetCellData
    OnGetCellAttributes = OvcTable1GetCellAttributes
    OnRowsChanged = OvcTable1RowsChanged
    OnSizeCellEditor = OvcTable1SizeCellEditor
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCComboBox3'
      'Form1.OvcTCBitMap1'
      'Form1.OvcTCGlyph1'
      'Form1.OvcTCComboBox2'
      'Form1.OvcTCComboBox1'
      'Form1.OvcTCNumericField1'
      'Form1.OvcTCPictureField1'
      'Form1.OvcTCSimpleField1'
      'Form1.OvcTCCheckBox1'
      'Form1.OvcTCMemo1'
      'Form1.OvcTCString1'
      'Form1.OvcTCRowHead1')
    RowData = (
      25)
    ColData = (
      35
      False
      True
      'Form1.OvcTCRowHead1'
      109
      False
      True
      'Form1.OvcTCString1'
      150
      False
      True
      'Form1.OvcTCMemo1'
      75
      False
      True
      'Form1.OvcTCCheckBox1'
      115
      False
      True
      'Form1.OvcTCSimpleField1'
      81
      False
      True
      'Form1.OvcTCPictureField1'
      105
      False
      True
      'Form1.OvcTCNumericField1'
      85
      False
      True
      'Form1.OvcTCComboBox1'
      83
      False
      True
      'Form1.OvcTCComboBox2'
      118
      False
      True
      'Form1.OvcTCComboBox3'
      48
      False
      True
      'Form1.OvcTCGlyph1'
      150
      False
      True
      'Form1.OvcTCBitMap1')
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
    Left = 463
    Top = 128
  end
  object OvcTCString1: TOvcTCString
    AutoAdvanceChar = False
    AutoAdvanceLeftRight = True
    MaxLength = 39
    ShowHint = False
    Table = OvcTable1
    TextStyle = tsFlat
    UseWordWrap = False
    UseASCIIZStrings = True
    Left = 80
    Top = 128
  end
  object OvcTCRowHead1: TOvcTCRowHead
    ShowActiveRow = True
    Table = OvcTable1
    TextStyle = tsRaised
    Left = 48
    Top = 128
  end
  object OvcTCMemo1: TOvcTCMemo
    MaxLength = 79
    ShowHint = False
    Table = OvcTable1
    TextStyle = tsFlat
    WantReturns = False
    WantTabs = False
    Left = 112
    Top = 128
  end
  object OvcTCCheckBox1: TOvcTCCheckBox
    AcceptActivationClick = True
    Adjust = otaCenter
    AllowGrayed = False
    CellGlyphs.IsDefault = True
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    ShowHint = False
    Table = OvcTable1
    Left = 144
    Top = 128
  end
  object OvcTCSimpleField1: TOvcTCSimpleField
    CaretOvr.Shape = csBlock
    ControlCharColor = clRed
    DataType = sftString
    DecimalPlaces = 0
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 9
    PadChar = ' '
    PasswordChar = '*'
    PictureMask = 'X'
    ShowHint = False
    Table = OvcTable1
    TextMargin = 2
    TextStyle = tsFlat
    Left = 176
    Top = 128
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
    Options = [efoCaretToEnd]
  end
  object OvcTCPictureField1: TOvcTCPictureField
    DataType = pftDate
    PictureMask = 'dd/mm/yyyy'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    ControlCharColor = clRed
    DecimalPlaces = 0
    Epoch = 0
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PadChar = ' '
    PasswordChar = '*'
    ShowHint = False
    Table = OvcTable1
    TextMargin = 2
    TextStyle = tsFlat
    Left = 208
    Top = 128
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
    Options = [efoCaretToEnd]
  end
  object OvcTCNumericField1: TOvcTCNumericField
    Adjust = otaCenterRight
    DataType = nftDouble
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PadChar = ' '
    PictureMask = '###.##'
    ShowHint = False
    Table = OvcTable1
    TextMargin = 2
    TextStyle = tsFlat
    Left = 240
    Top = 128
    RangeHigh = {007814AE47E1FAC70540}
    RangeLow = {007814AE47E1FAC705C0}
  end
  object OvcTCComboBox1: TOvcTCComboBox
    AcceptActivationClick = True
    AutoAdvanceChar = False
    AutoAdvanceLeftRight = True
    Items.Strings = (
      'zero'
      'un '
      'deux'
      'trois'
      'quatre'
      'cinq'
      'six'
      'sept'
      'huit'
      'neuf')
    ShowHint = False
    MaxLength = 0
    SaveStringValue = False
    ShowArrow = False
    Style = csDropDownList
    Table = OvcTable1
    TextStyle = tsFlat
    UseRunTimeItems = False
    Left = 272
    Top = 128
  end
  object OvcTCComboBox2: TOvcTCComboBox
    AcceptActivationClick = True
    AutoAdvanceChar = False
    AutoAdvanceLeftRight = True
    Items.Strings = (
      'zero'
      'one'
      'two'
      'three'
      'four'
      'five'
      'six'
      'seven'
      'eight'
      'nine')
    ShowHint = False
    MaxLength = 19
    SaveStringValue = False
    ShowArrow = False
    Style = csDropDown
    Table = OvcTable1
    TextStyle = tsFlat
    UseRunTimeItems = False
    Left = 304
    Top = 128
  end
  object OvcTCGlyph1: TOvcTCGlyph
    AcceptActivationClick = True
    Adjust = otaCenter
    CellGlyphs.IsDefault = False
    CellGlyphs.BitMap.Data = {
      76020000424D7602000000000000760000002800000040000000100000000100
      0400000000000002000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000F88888888888
      8880F888888888888880F888888888888880F888888888888880F77777777777
      7780F777777777777780F777777777777780F777777777777780F77777777777
      7780F777777777777780F777777777777780F777777777777780F77777727777
      7780F777777277777780F777774427777780F777774427777780F77777212777
      7780F777771127777780F777777477777780F777777477777780F77772111277
      7780F777711112777780F777727472777780F777227472277780F77721111127
      7780F777111111277780F777442444277780F77C444444427780F77911111112
      7780F779111111127780F77C444444427780F77C444444427780F77911111112
      7780F777911111177780F777CC4444477780F777CC4444477780F77911191112
      7780F777791111777780F7777C4444777780F777774447777780F77911979112
      7780F777779117777780F77777CC47777780F7777C4442777780F77799777997
      7780F777777977777780F777777C77777780F77777CCC7777780F77777777777
      7780F777777777777780F777777777777780F777777777777780F77777777777
      7780F777777777777780F777777777777780F777777777777780FFFFFFFFFFFF
      FFF0FFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF0FFFFFFFFFFFFFFF0}
    CellGlyphs.GlyphCount = 4
    CellGlyphs.ActiveGlyphCount = 4
    ShowHint = False
    Table = OvcTable1
    Left = 368
    Top = 128
  end
  object OvcTCBitMap1: TOvcTCBitMap
    AcceptActivationClick = False
    Table = OvcTable1
    Left = 400
    Top = 128
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      ''
      'String'
      'Memo'
      'CheckBox'
      'SimpleField'
      'PictureField'
      'NumericField'
      'ComboBox 1'
      'ComboBox 2'
      'ComboBox 3'
      'Glyph'
      'Bitmap'
      'Icon')
    ShowActiveCol = False
    ShowLetters = False
    Table = OvcTable1
    TextStyle = tsRaised
    UseWordWrap = False
    Left = 432
    Top = 128
  end
  object OvcTCComboBox3: TOvcTCComboBox
    AcceptActivationClick = True
    AutoAdvanceChar = False
    AutoAdvanceLeftRight = False
    ShowHint = False
    MaxLength = 0
    SaveStringValue = False
    ShowArrow = False
    Style = csDropDownList
    Table = OvcTable1
    TextStyle = tsFlat
    UseRunTimeItems = True
    Left = 336
    Top = 128
  end
end
