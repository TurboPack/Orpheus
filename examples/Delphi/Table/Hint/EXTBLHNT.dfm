object Form1: TForm1
  Left = 200
  Top = 99
  Caption = 'ExTblHints'
  ClientHeight = 263
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable: TOvcTable
    Left = 8
    Top = 8
    Width = 313
    Height = 193
    RowLimit = 5
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnMouseMove = OvcTableMouseMove
    CellData = ()
    RowData = (
      30)
    ColData = (
      63
      False
      False
      64
      False
      False
      67
      False
      False
      64
      False
      False)
  end
  object Panel1: TPanel
    Left = 16
    Top = 208
    Width = 289
    Height = 49
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 271
      Height = 16
      Caption = 'Table uses OnMouseMove to display hint when '
    end
    object Label2: TLabel
      Left = 8
      Top = 25
      Width = 246
      Height = 16
      Caption = 'cursor is in the otrInMain area of the table.'
    end
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
    Left = 199
    Top = 122
  end
  object Timer: TTimer
    Enabled = False
    Interval = 750
    OnTimer = TimerTimer
    Left = 248
    Top = 120
  end
end
