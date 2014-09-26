object Form12: TForm12
  Left = 0
  Top = 0
  Caption = 'OvcTCPictureField.FloatScale-Demo'
  ClientHeight = 337
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    635
    337)
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 8
    Top = 8
    Width = 323
    Height = 319
    Anchors = [akLeft, akTop, akRight, akBottom]
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
    Options = [otoNoRowResizing, otoNoColResizing, otoTabToArrow]
    TabOrder = 0
    OnDoneEdit = OvcTable1DoneEdit
    OnGetCellData = OvcTable1GetCellData
    CellData = (
      'Form12.OvcTCColHead1'
      'Form12.OvcTCRowHead1'
      'Form12.OvcTCPictureField1'
      'Form12.OvcTCPictureField2'
      'Form12.OvcTCPictureField3')
    RowData = (
      30)
    ColData = (
      50
      False
      True
      'Form12.OvcTCRowHead1'
      80
      False
      True
      'Form12.OvcTCPictureField1'
      80
      False
      True
      'Form12.OvcTCPictureField2'
      80
      False
      True
      'Form12.OvcTCPictureField3')
  end
  object Memo1: TMemo
    Left = 344
    Top = 8
    Width = 279
    Height = 99
    Lines.Strings = (
      'This demo shows the use of the FloatScale-'
      'Field:'
      'Use this field to store a float-value x but to '
      'display and edit x*10^FloatScale.')
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 344
    Top = 206
    Width = 279
    Height = 24
    ReadOnly = True
    TabOrder = 2
  end
  object OvcTCPictureField1: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###.## %'
    MaxLength = 8
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    FloatScale = -2
    Table = OvcTable1
    OnKeyPress = OvcTCPictureField1KeyPress
    Left = 84
    Top = 188
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object OvcTCPictureField2: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '###.## '#8240
    MaxLength = 8
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    FloatScale = -3
    Table = OvcTable1
    OnKeyPress = OvcTCPictureField1KeyPress
    Left = 166
    Top = 188
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
  object OvcTCColHead1: TOvcTCColHead
    Adjust = otaCenter
    Table = OvcTable1
    Left = 166
    Top = 12
  end
  object OvcTCRowHead1: TOvcTCRowHead
    Adjust = otaCenter
    Table = OvcTable1
    Left = 20
    Top = 188
  end
  object OvcTCPictureField3: TOvcTCPictureField
    DataType = pftDouble
    PictureMask = '#,###.### '#241#242'o'
    MaxLength = 13
    Adjust = otaCenterRight
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    FloatScale = 6
    Table = OvcTable1
    OnKeyPress = OvcTCPictureField1KeyPress
    Left = 244
    Top = 188
    RangeHigh = {73B2DBB9838916F2FE43}
    RangeLow = {73B2DBB9838916F2FEC3}
  end
end
