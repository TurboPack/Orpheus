object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 367
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    409
    367)
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 16
    Top = 138
    Width = 377
    Height = 219
    Anchors = [akLeft, akTop, akBottom]
    Controller = OvcController1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
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
    Options = [otoThumbTrack]
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnGetCellData = OvcTable1GetCellData
    OnLockedCellClick = OvcTable1LockedCellClick
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCString3'
      'Form1.OvcTCString2'
      'Form1.OvcTCString1'
      'Form1.OvcTCRowHead1')
    RowData = (
      30)
    ColData = (
      55
      False
      True
      'Form1.OvcTCRowHead1'
      100
      False
      True
      'Form1.OvcTCString1'
      100
      False
      True
      'Form1.OvcTCString2'
      100
      False
      True
      'Form1.OvcTCString3')
  end
  object Memo1: TMemo
    Left = 16
    Top = 6
    Width = 377
    Height = 121
    Lines.Strings = (
      'This demo shows how to use different kinds of strings to store '
      'data for a table:'
      'column 1 : string'
      'column 2 : PChar (array of Char)'
      'column 3 : ShortString'
      'The property TOvcTCString.DataStringType must be used to '
      'tell the table what kind of strings are provided.')
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
    Left = 227
    Top = 156
  end
  object OvcTCColHead1: TOvcTCColHead
    ShowLetters = False
    Adjust = otaCenterLeft
    Table = OvcTable1
    OnOwnerDraw = OvcTCColHead1OwnerDraw
    Left = 127
    Top = 141
  end
  object OvcTCString1: TOvcTCString
    MaxLength = 50
    Table = OvcTable1
    Left = 127
    Top = 232
  end
  object OvcTCString2: TOvcTCString
    MaxLength = 50
    Table = OvcTable1
    DataStringType = tstPChar
    UseASCIIZStrings = False
    Left = 226
    Top = 231
  end
  object OvcTCString3: TOvcTCString
    MaxLength = 50
    Table = OvcTable1
    DataStringType = tstShortString
    UseASCIIZStrings = False
    Left = 330
    Top = 231
  end
  object OvcTCRowHead1: TOvcTCRowHead
    Adjust = otaCenter
    Table = OvcTable1
    Left = 40
    Top = 172
  end
end
