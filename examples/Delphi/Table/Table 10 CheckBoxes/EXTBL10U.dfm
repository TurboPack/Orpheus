object Form1: TForm1
  Left = 384
  Top = 212
  Caption = 'Form1'
  ClientHeight = 236
  ClientWidth = 563
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
    Left = 16
    Top = 12
    Width = 197
    Height = 213
    RowLimit = 5
    LockedCols = 0
    LeftCol = 0
    Controller = OvcController1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Default'
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
    ScrollBars = ssNone
    TabOrder = 0
    OnGetCellData = OvcTable1GetCellData
    OnMouseDown = OvcTable1MouseDown
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCCheckBox1'
      'Form1.OvcTCCheckBox2'
      'Form1.OvcTCCheckBox3')
    RowData = (
      30)
    ColData = (
      60
      False
      True
      'Form1.OvcTCCheckBox1'
      60
      False
      True
      'Form1.OvcTCCheckBox2'
      60
      False
      True
      'Form1.OvcTCCheckBox3')
  end
  object Memo1: TMemo
    Left = 224
    Top = 12
    Width = 321
    Height = 213
    Lines.Strings = (
      'This demo shows different possible behaviours for '
      'checkboxes in an OvcTable:'
      'Column 1: AcceptActivationClick=False: the first click '
      'activates the cell, the second activates the checkbox, '
      'the third changes the state.'
      'Column 2: AcceptActivationClick=True: the first click '
      'activates the cell and the checkbox, the second '
      'changes the state.'
      'Column 3: AcceptActivationClick=True + event-'
      'handler (see code): the first click activates the cell '
      'and the checkbox and changes the state.')
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
    Left = 199
    Top = 122
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      '1'
      '2'
      '3')
    ShowLetters = False
    Adjust = otaCenter
    Table = OvcTable1
    Left = 33
    Top = 13
  end
  object OvcTCCheckBox1: TOvcTCCheckBox
    AcceptActivationClick = False
    Adjust = otaCenter
    CellGlyphs.IsDefault = True
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    Table = OvcTable1
    Left = 34
    Top = 44
  end
  object OvcTCCheckBox2: TOvcTCCheckBox
    Adjust = otaCenter
    CellGlyphs.IsDefault = True
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    Table = OvcTable1
    Left = 94
    Top = 44
  end
  object OvcTCCheckBox3: TOvcTCCheckBox
    Adjust = otaCenter
    CellGlyphs.IsDefault = True
    CellGlyphs.GlyphCount = 3
    CellGlyphs.ActiveGlyphCount = 2
    Table = OvcTable1
    Left = 154
    Top = 44
  end
end
