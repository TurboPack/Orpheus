object Form1: TForm1
  Left = 192
  Top = 108
  Caption = 'Table Example'
  ClientHeight = 232
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 8
    Top = 16
    Width = 289
    Height = 204
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
    LockedRowsCell = OvcTCString2
    Options = [otoNoRowResizing, otoNoColResizing, otoNoSelection]
    ScrollBars = ssNone
    TabOrder = 0
    OnGetCellData = OvcTable1GetCellData
    OnGetCellAttributes = OvcTable1GetCellAttributes
    CellData = (
      'Form1.OvcTCString2'
      'Form1.OvcTCRowHead1'
      'Form1.OvcTCString1'
      'Form1.OvcTCPictureField1')
    RowData = (
      22)
    ColData = (
      40
      False
      True
      'Form1.OvcTCRowHead1'
      155
      False
      True
      'Form1.OvcTCString1'
      90
      False
      True
      'Form1.OvcTCPictureField1')
  end
  object BitBtn1: TBitBtn
    Left = 304
    Top = 195
    Width = 75
    Height = 25
    Caption = '&Close'
    DoubleBuffered = True
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = BitBtn1Click
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
    Left = 17
    Top = 201
  end
  object OvcTCString1: TOvcTCString
    Adjust = otaBottomLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 49
    Table = OvcTable1
    TableFont = False
    Left = 124
    Top = 201
  end
  object OvcTCString2: TOvcTCString
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable1
    TableFont = False
    Left = 53
    Top = 201
  end
  object OvcTCRowHead1: TOvcTCRowHead
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable1
    TableFont = False
    Left = 89
    Top = 201
  end
  object OvcTCPictureField1: TOvcTCPictureField
    DataType = pftWord
    PictureMask = 'iii'
    MaxLength = 3
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable1
    TableFont = False
    Left = 160
    Top = 201
    RangeHigh = {FFFF0000000000000000}
    RangeLow = {00000000000000000000}
  end
end
