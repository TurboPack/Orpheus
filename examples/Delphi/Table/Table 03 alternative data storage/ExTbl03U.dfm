object Form1: TForm1
  Left = 358
  Top = 206
  Caption = 'Form1'
  ClientHeight = 294
  ClientWidth = 372
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
    Left = 14
    Top = 10
    Width = 333
    Height = 231
    ColorUnused = clBtnFace
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
    TabOrder = 0
    OnDoneEdit = OvcTable1DoneEdit
    OnGetCellData = OvcTable1GetCellData
    CellData = (
      'Form1.OvcTCPictureField1'
      'Form1.OvcTCMemo1')
    RowData = (
      30)
    ColData = (
      69
      False
      False
      153
      False
      True
      'Form1.OvcTCMemo1'
      89
      False
      True
      'Form1.OvcTCPictureField1')
  end
  object Button1: TButton
    Left = 145
    Top = 254
    Width = 84
    Height = 25
    Caption = 'Show Memo'
    TabOrder = 1
    OnClick = Button1Click
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
    Left = 175
    Top = 188
  end
  object OvcTCMemo1: TOvcTCMemo
    MaxLength = 101
    Table = OvcTable1
    Left = 106
    Top = 188
  end
  object OvcTCPictureField1: TOvcTCPictureField
    PictureMask = '99/9999'
    MaxLength = 7
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Table = OvcTable1
    Left = 141
    Top = 188
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
end
