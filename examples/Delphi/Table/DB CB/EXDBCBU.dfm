object Form1: TForm1
  Left = 339
  Top = 239
  Width = 534
  Height = 300
  ActiveControl = OvcDbTable1
  Caption = 'Form1'
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OvcDbTable1: TOvcDbTable
    Left = 5
    Top = 12
    Width = 220
    Height = 185
    LockedColumns = 0
    Access = otxNormal
    Adjust = otaCenterLeft
    BorderStyle = bsSingle
    ColorUnused = clWindow
    Colors.ActiveFocused = clHighlight
    Colors.ActiveFocusedText = clHighlightText
    Colors.ActiveUnfocused = clHighlight
    Colors.ActiveUnfocusedText = clHighlightText
    Colors.Locked = clBtnFace
    Colors.LockedText = clWindowText
    Colors.Editing = clWindow
    Colors.EditingText = clWindowText
    Colors.Selected = clHighlight
    Colors.SelectedText = clHighlightText
    Controller = OvcController1
    DataSource = DataSource1
    DefaultMargin = 4
    GridPenSet.NormalGrid.NormalColor = clBtnShadow
    GridPenSet.NormalGrid.SecondColor = clBtnHighlight
    GridPenSet.NormalGrid.Style = psDot
    GridPenSet.NormalGrid.Effect = geBoth
    GridPenSet.LockedGrid.NormalColor = clBtnShadow
    GridPenSet.LockedGrid.SecondColor = clBtnHighlight
    GridPenSet.LockedGrid.Style = psSolid
    GridPenSet.LockedGrid.Effect = ge3D
    GridPenSet.CellWhenFocused.NormalColor = clBlack
    GridPenSet.CellWhenFocused.SecondColor = clBtnHighlight
    GridPenSet.CellWhenFocused.Style = psSolid
    GridPenSet.CellWhenFocused.Effect = geBoth
    GridPenSet.CellWhenUnfocused.NormalColor = clBlack
    GridPenSet.CellWhenUnfocused.SecondColor = clBtnHighlight
    GridPenSet.CellWhenUnfocused.Style = psDash
    GridPenSet.CellWhenUnfocused.Effect = geBoth
    HeaderHeight = 21
    HeaderOptions = [hoShowHeader]
    Options = [dtoShowIndicators]
    ParentColor = False
    RowHeight = 21
    RowIndicatorWidth = 11
    ScrollBars = ssBoth
    TabOrder = 0
    TabStop = True
    TextStyle = tsFlat
    CellData = (
      'Form1.OvcTCSimpleField1'
      'Form1.OvcTCComboBox1')
    ColData = (
      117
      False
      'NAME'
      0
      True
      'OvcTCComboBox1'
      64
      False
      'SIZE'
      0
      True
      'OvcTCSimpleField1')
  end
  object DBNavigator1: TDBNavigator
    Left = 5
    Top = 212
    Width = 220
    Height = 25
    DataSource = DataSource1
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 244
    Top = 11
    Width = 269
    Height = 250
    Lines.Strings = (
      'This example shows how to load items from one '
      'database table into the Items TStringList of a '
      'OvcTCComboBox that is used for another table. '
      'There are several IMPORTANT points to keep '
      'in mind about this example:'
      ''
      '  1. For the sake of simplicity, the same database '
      '      table is used as the primary and secondary '
      '      table. In this case, the ANIMALS.DBF sample'
      '      database that comes with Delphi. In a '
      '      "real-world" case, the two database tables '
      '      would have a common field, say the name '
      '      of a state; the combobox Items list would '
      '      be filled with the names of the states from '
      '      the secondary table and used to choose a '
      '      state while working with the primary table. '
      '      '
      '      In this example, the names of possible animals'
      '      is those already entered into the table.'
      ''
      '  2. The datatype and datalength of the field in '
      '      the primary and that in the secondary table '
      '      *must* be the same. This requirement is '
      '       general, i.e., it is not specific to this example.'
      ''
      '  3. The Items list does not and cannont '
      '      automatically update itself. For example, if '
      '      someone added or deleted a record from the '
      '      secondary table, the Items list of the combo '
      '      box would be unaware of that change. Specific'
      '      to this example, if you add a new animal name '
      '      in the primary table, the Items list will *not* '
      '      include the new name. This feature is on our'
      '      wish list and may be addressed in a future '
      '      version of Orpheus.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    WordWrap = False
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 99
    Top = 27
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'ANIMALS.DBF'
    Left = 138
    Top = 28
    object Table1NAME: TStringField
      FieldName = 'NAME'
      Size = 10
    end
    object Table1SIZE: TSmallintField
      FieldName = 'SIZE'
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
    Left = 140
    Top = 65
  end
  object OvcTCComboBox1: TOvcTCComboBox
    AcceptActivationClick = True
    Access = otxDefault
    Adjust = otaDefault
    AutoAdvanceChar = False
    AutoAdvanceLeftRight = False
    Color = clWindow
    DropDownCount = 8
    HideButton = False
    ShowHint = False
    Margin = 4
    MaxLength = 10
    SaveStringValue = False
    ShowArrow = False
    Sorted = False
    Style = csDropDown
    Table = OvcDbTable1
    TableColor = False
    TableFont = True
    TextHiColor = clBtnHighlight
    TextStyle = tsFlat
    UseRunTimeItems = False
    Left = 102
    Top = 65
  end
  object DataSource2: TDataSource
    DataSet = Table1
    Left = 101
    Top = 99
  end
  object Table2: TTable
    Active = True
    DatabaseName = 'DBDEMOS'
    TableName = 'ANIMALS.DBF'
    Left = 144
    Top = 103
  end
  object OvcTCSimpleField1: TOvcTCSimpleField
    Access = otxDefault
    Adjust = otaDefault
    CaretOvr.Shape = csBlock
    Color = clWindow
    ControlCharColor = clRed
    DataType = sftInteger
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Margin = 4
    MaxLength = 5
    Options = [efoCaretToEnd]
    PadChar = ' '
    PasswordChar = '*'
    PictureMask = 'i'
    ShowHint = False
    Table = OvcDbTable1
    TableColor = False
    TableFont = True
    TextHiColor = clBtnHighlight
    TextMargin = 2
    TextStyle = tsFlat
    Left = 104
    Top = 136
    RangeHigh = {FF7F0000000000000000}
    RangeLow = {0080FFFF000000000000}
  end
end
