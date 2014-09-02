object Form1: TForm1
  Left = 192
  Top = 108
  Caption = 'Example Orpheus Table program showing use of all cell components'
  ClientHeight = 296
  ClientWidth = 631
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 0
    Top = 0
    Width = 631
    Height = 296
    RowLimit = 200
    Align = alClient
    Colors.ActiveFocused = clTeal
    Colors.ActiveUnfocused = clGreen
    Colors.Editing = clWindow
    Controller = OvcController1
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
    LockedRowsCell = OvcTCColHead1
    Options = [otoMouseDragSelect, otoThumbTrack, otoAllowColMoves, otoAllowRowMoves]
    TabOrder = 0
    OnColumnsChanged = OvcTable1ColumnsChanged
    OnGetCellData = OvcTable1GetCellData
    OnGetCellAttributes = OvcTable1GetCellAttributes
    OnRowsChanged = OvcTable1RowsChanged
    OnSizeCellEditor = OvcTable1SizeCellEditor
    ExplicitWidth = 583
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCRowHead1'
      'Form1.OvcTCString1'
      'Form1.OvcTCMemo1'
      'Form1.OvcTCCheckBox1'
      'Form1.OvcTCSimpleField1'
      'Form1.OvcTCPictureField1'
      'Form1.OvcTCNumericField1'
      'Form1.OvcTCComboBox1'
      'Form1.OvcTCComboBox2'
      'Form1.OvcTCGlyph1'
      'Form1.OvcTCBitMap1'
      'Form1.OvcTCComboBox3')
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
    Epoch = 1900
    Left = 463
    Top = 128
  end
  object OvcTCString1: TOvcTCString
    AutoAdvanceLeftRight = True
    MaxLength = 39
    Table = OvcTable1
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
    Table = OvcTable1
    Left = 112
    Top = 128
  end
  object OvcTCCheckBox1: TOvcTCCheckBox
    Adjust = otaCenter
    CellGlyphs.IsDefault = False
    CellGlyphs.BitMap.Data = {
      06070000424D060700000000000036040000280000002D0000000F0000000100
      080000000000D0020000C40E0000C40E00000001000000010000925A4400945C
      4700955D4800965E4900975F4A0097604B0098614C0099644F009D6A5500A16F
      5C00A1715E00A4736100A4756200A5766400A7786700A87B6900AA7F6E00AC80
      6F00AB867700AF867500B38C7C008F8F8E00B7918200BB988900BA998C00BD9D
      9000BF9D9000B9B3AE00BAB4AF00BCB7B200BDB9B400BFBBB800C0A09300C2A3
      9600C5A79B00C0A79D00C6A99D00C8AEA300CAAEA300CEB4AA00CFB6AC00CFB8
      AF00C1BEBB00C2BFBC00D1B9B000D3BDB400D5BFB700D0BFB900D5C1BA00D6C3
      BC00D8C4BC00C5C3C100C6C4C200C8C7C600CAC8C600CDC9C500CCCBCA00CDCD
      CC00DDCBC400D0CCC900D5CFCB00D1CFCD00DDCFC900D6D0CC00D7D1CD00D5D4
      D400D6D5D400D8D3D000D9D4D000DAD5D200DBD7D400DCD8D500DDD9D500DBDA
      DA00DCDBDB00DEDBD800DCDCDB00DFDCDA00DEDDDC00E2D3CD00E2D4CF00E7DA
      D500E1DFDD00E4DFDC00E1E0DE00E5E2DF00E9E1DE00EBE1DD00E9E2DF00E1E1
      E000E3E1E000E2E2E100E3E2E100E4E3E200E6E2E000E5E4E300E5E5E400E6E6
      E500E7E7E600E8E7E700E8E8E800E9E9E900EAE9E900EAEAEA00EBEBEA00ECEB
      EB00ECECEB00ECECEC00EDEDEC00EEEEED00EFEFEF00F0E9E600F0ECEA00F1EE
      ED00F5EFED00F0F0F000F2F2F200F4F3F200F6F3F200F4F4F400F5F5F500F6F6
      F600F8F8F800F9F9F900FAF9F800FFFFFF000000000000000000000000000000
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
      00000000000000000000000000000000000000000000000000007D7D7D7D7D7D
      7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
      7D7D7D7D7D7D7D0000007D151515151515151515151515157D7D151515151515
      151515151515157D7D151515151515151515151515157D0000007D1577777777
      77777777777777157D7D15777777787B7A7877777777157D7D15777777777777
      7777777777157D0000007D157738414A5962686A696677157D7D157738495818
      19766C696677157D7D15771416171A212426272C77157D0000007D157734656C
      73777979796177157D7D157736701704062C7B796177157D7D157713322D2826
      2220172777157D0000007D15772B5F656C747778775B77157D7D15773D560203
      050B7C775B77157D7D1577113A322D282622202677157D0000007D15771F5260
      676E7474744E77157D7D1577541001500E052E794E77157D7D15770F4F3A322D
      2826222477157D0000007D15771D474D5A646B6C6C4277157D7D1577373E256D
      30030D7A4277157D7D15770C514F3A322D28262177157D0000007D15771B4044
      464D5C61643977157D7D15771B485547750A01314C77157D7D15770957514F3A
      322D281A77157D0000007D15771B3C3C3F454B525D3577157D7D15771B3C3C3F
      5E29000D6377157D7D1577086F57514F3A322D1777157D0000007D15771B3C3C
      3C3C43474D3377157D7D15771B3C3C3C3F7108002F79157D7D157707726F5751
      4F3A321677157D0000007D15771B1B1B1B1B1B1C1E2A77157D7D15771B1B1B1B
      1B3B23125378157D7D1577030708090C0F11131477157D0000007D1577777777
      77777777777777157D7D15777777777777777A7B7977157D7D15777777777777
      7777777777157D0000007D151515151515151515151515157D7D151515151515
      151515151515157D7D151515151515151515151515157D0000007D7D7D7D7D7D
      7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
      7D7D7D7D7D7D7D000000}
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    Table = OvcTable1
    Left = 144
    Top = 128
  end
  object OvcTCSimpleField1: TOvcTCSimpleField
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    MaxLength = 9
    Options = [efoCaretToEnd]
    Table = OvcTable1
    Left = 176
    Top = 128
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCPictureField1: TOvcTCPictureField
    DataType = pftDate
    PictureMask = 'dd/mm/yyyy'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Table = OvcTable1
    Left = 208
    Top = 128
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCNumericField1: TOvcTCNumericField
    Adjust = otaCenterRight
    DataType = nftDouble
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PictureMask = '###.##'
    Table = OvcTable1
    Left = 240
    Top = 128
    RangeHigh = {007814AE47E1FAC70540}
    RangeLow = {007814AE47E1FAC705C0}
  end
  object OvcTCComboBox1: TOvcTCComboBox
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
    Style = csDropDownList
    Table = OvcTable1
    Left = 272
    Top = 128
  end
  object OvcTCComboBox2: TOvcTCComboBox
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
    MaxLength = 19
    Table = OvcTable1
    Left = 304
    Top = 128
  end
  object OvcTCGlyph1: TOvcTCGlyph
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
    Table = OvcTable1
    Left = 368
    Top = 128
  end
  object OvcTCBitMap1: TOvcTCBitMap
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
    ShowLetters = False
    Table = OvcTable1
    TextStyle = tsRaised
    Left = 432
    Top = 128
  end
  object OvcTCComboBox3: TOvcTCComboBox
    Style = csDropDownList
    Table = OvcTable1
    UseRunTimeItems = True
    Left = 336
    Top = 128
  end
end
