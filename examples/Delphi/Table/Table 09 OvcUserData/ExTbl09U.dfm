object Form1: TForm1
  Left = 305
  Top = 253
  Caption = 'Table Example'
  ClientHeight = 212
  ClientWidth = 496
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
    Width = 264
    Height = 195
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
    Options = [otoNoRowResizing, otoNoColResizing, otoNoSelection]
    TabOrder = 0
    OnGetCellData = OvcTable1GetCellData
    CellData = (
      'Form1.PF1'
      'Form1.PF2')
    RowData = (
      30)
    ColData = (
      38
      False
      False
      100
      False
      True
      'Form1.PF1'
      100
      False
      True
      'Form1.PF2')
  end
  object Memo1: TMemo
    Left = 292
    Top = 8
    Width = 193
    Height = 195
    TabStop = False
    Lines.Strings = (
      'This example shows how to '
      'assign UserData to a table cell. '
      'In this case, the input '
      'characters are limited to those '
      'in ['#39'A'#39'..'#39'C, '#39'0'#39'..'#39'9'#39'].')
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
    Epoch = 1900
    Left = 20
    Top = 10
  end
  object PF1: TOvcTCPictureField
    PictureMask = '1111111111'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = [efoCaretToEnd, efoTrimBlanks]
    Table = OvcTable1
    Left = 92
    Top = 11
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object PF2: TOvcTCPictureField
    PictureMask = '1111111111'
    MaxLength = 10
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = [efoCaretToEnd, efoTrimBlanks]
    Table = OvcTable1
    Left = 192
    Top = 11
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
end
