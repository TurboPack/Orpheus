object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'OvcHtmlMemo Demo'
  ClientHeight = 228
  ClientWidth = 926
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 582
    Top = 8
    Width = 281
    Height = 209
    TabOrder = 1
    OnChange = Memo1Change
  end
  object OvcHtmlMemo1: TOvcHtmlMemo
    Left = 295
    Top = 8
    Width = 281
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'OvcHtmlMemo1')
    ParentFont = False
    TabOrder = 0
    OnChange = OvcHtmlMemo1Change
    DoubleBuffered = False
    ParentDoubleBuffered = False
  end
end
