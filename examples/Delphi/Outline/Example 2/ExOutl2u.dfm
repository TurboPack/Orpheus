object Form1: TForm1
  Left = 200
  Top = 108
  Width = 256
  Height = 230
  Caption = 'Form1'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OvcOutline1: TOvcOutline
    Left = 0
    Top = 0
    Width = 248
    Height = 203
    Align = alClient
    Controller = OvcController1
    Ctl3D = True
    HideSelection = False
    Images = ImageList1
    IntegralHeight = False
    ParentColor = False
    ParentCtl3D = False
    ParentShowHint = False
    SelectColor.BackColor = clHighlight
    SelectColor.TextColor = clHighlightText
    TabOrder = 0
    TabStop = True
    OnDrawCheck = OvcOutline1DrawCheck
    OnNodeClick = OvcOutline1NodeClick
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
    Left = 32
    Top = 16
  end
  object ImageList1: TImageList
    Left = 104
    Top = 16
  end
  object ImageList2: TImageList
    Left = 176
    Top = 16
  end
end
