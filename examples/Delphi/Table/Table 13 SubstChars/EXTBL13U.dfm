object Form1: TForm1
  Left = 287
  Top = 253
  Caption = 'Form1'
  ClientHeight = 210
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 17
    Top = 8
    Width = 164
    Height = 195
    RowLimit = 11
    Adjust = otaCenter
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
    LockedRowsCell = OvcTCColHead
    Options = [otoNoRowResizing, otoNoColResizing, otoNoSelection]
    TabOrder = 0
    OnGetCellData = OvcTable1GetCellData
    CellData = (
      'Form1.PF1'
      'Form1.OvcTCRowHead'
      'Form1.OvcTCColHead')
    RowData = (
      30)
    ColData = (
      40
      False
      True
      'Form1.OvcTCRowHead'
      100
      False
      True
      'Form1.PF1')
  end
  object Memo1: TMemo
    Left = 194
    Top = 8
    Width = 249
    Height = 195
    TabStop = False
    Lines.Strings = (
      'This example shows how to use '
      'TOvcUserData to display literal '
      'characters in table cells that have a '
      'predefined meaning - like '#39'M'#39' or '#39'i'#39'. '
      ''
      'You have to use a TOvcUserData-object, '
      'assign '#39'SubstChars'#39' as needed and '
      'assign this object to the picture field'#39's '
      'UserData-property.')
    ReadOnly = True
    TabOrder = 1
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
    Left = 26
    Top = 10
  end
  object PF1: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###,###.## '#241#242'o'
    MaxLength = 14
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    DecimalPlaces = 2
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    EllipsisMode = em_show
    Table = OvcTable1
    Left = 92
    Top = 11
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object OvcTCColHead: TOvcTCColHead
    Adjust = otaCenter
    Table = OvcTable1
    Left = 22
    Top = 74
  end
  object OvcTCRowHead: TOvcTCRowHead
    Table = OvcTable1
    Left = 24
    Top = 116
  end
end
