object Form1: TForm1
  Left = 192
  Top = 108
  Caption = 'Form Validation Example'
  ClientHeight = 159
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 59
    Width = 136
    Height = 13
    Caption = '<< Input required for this field'
  end
  object Label2: TLabel
    Left = 208
    Top = 90
    Width = 136
    Height = 13
    Caption = '<< Input required for this field'
  end
  object OvcSimpleField1: TOvcSimpleField
    Left = 48
    Top = 24
    Width = 153
    Height = 21
    Cursor = crIBeam
    DataType = sftString
    CaretOvr.Shape = csBlock
    ControlCharColor = clRed
    Controller = DefaultController
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    PictureMask = 'X'
    TabOrder = 0
  end
  object OvcPictureField1: TOvcPictureField
    Left = 48
    Top = 56
    Width = 153
    Height = 21
    Cursor = crIBeam
    DataType = pftString
    CaretOvr.Shape = csBlock
    Controller = DefaultController
    ControlCharColor = clRed
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 1900
    InitDateTime = False
    Options = [efoInputRequired]
    PictureMask = 'XXXXXXXXXXXXXXX'
    TabOrder = 1
  end
  object OvcNumericField1: TOvcNumericField
    Left = 48
    Top = 88
    Width = 153
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretOvr.Shape = csBlock
    Controller = DefaultController
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = [efoInputRequired]
    PictureMask = '##########'
    TabOrder = 2
    Uninitialized = True
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object BtnCancel: TBitBtn
    Left = 200
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cancel'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BtnCancelClick
  end
  object BtnOK: TBitBtn
    Left = 80
    Top = 128
    Width = 75
    Height = 25
    Caption = 'OK'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = BtnOKClick
  end
  object DefaultController: TOvcController
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
    OnIsSpecialControl = DefaultControllerIsSpecialControl
  end
end
