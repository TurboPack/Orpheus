object Form1: TForm1
  Left = 195
  Top = 110
  Caption = 'Form1'
  ClientHeight = 250
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 134
    Top = 214
    Width = 91
    Height = 25
    Caption = 'Delete Record'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Default'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object OvcTable1: TOvcTable
    Left = 20
    Top = 12
    Width = 321
    Height = 189
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
    TabOrder = 1
    OnGetCellData = OvcTable1GetCellData
    OnSizeCellEditor = OvcTable1SizeCellEditor
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCRowHead1'
      'Form1.OvcTCString1')
    RowData = (
      30
      5
      False
      29)
    ColData = (
      37
      False
      True
      'Form1.OvcTCRowHead1'
      261
      False
      True
      'Form1.OvcTCString1')
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
    Left = 9
    Top = 200
  end
  object OvcTCString1: TOvcTCString
    MaxLength = 10
    Table = OvcTable1
    Left = 48
    Top = 200
  end
  object OvcTCRowHead1: TOvcTCRowHead
    Adjust = otaCenter
    Table = OvcTable1
    Left = 92
    Top = 200
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      ''
      'Text')
    ShowLetters = False
    Table = OvcTable1
    Left = 240
    Top = 206
  end
end
