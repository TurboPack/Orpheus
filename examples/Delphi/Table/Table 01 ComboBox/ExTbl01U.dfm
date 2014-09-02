object Form1: TForm1
  Left = 222
  Top = 100
  Caption = 'Table ComboBox Cell Example'
  ClientHeight = 249
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable1: TOvcTable
    Left = 8
    Top = 8
    Width = 271
    Height = 201
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
    TabOrder = 0
    OnDoneEdit = OvcTable1DoneEdit
    OnGetCellData = OvcTable1GetCellData
    CellData = (
      'Form1.OvcTCColHead1'
      'Form1.OvcTCComboBox2'
      'Form1.OvcTCComboBox1'
      'Form1.OvcTCRowHead1')
    RowData = (
      30
      2
      False
      29)
    ColData = (
      39
      False
      True
      'Form1.OvcTCRowHead1'
      97
      False
      True
      'Form1.OvcTCComboBox1'
      112
      False
      True
      'Form1.OvcTCComboBox2')
  end
  object Button1: TButton
    Left = 204
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      ''
      True
      (
        37
        46
        39
        55
        1061
        74
        1063
        75
        36
        42
        35
        16
        46
        10
        8
        1
        520
        1
        1057
        71
        1058
        2
        45
        44
        1114
        72
        2056
        54
        38
        73
        40
        15
        1037
        47
        549
        20
        551
        23
        548
        19
        547
        18
        1573
        29
        1575
        30
        545
        22
        546
        21
        550
        24
        552
        17
        1572
        26
        1571
        27
        1569
        28
        1570
        25
        558
        8
        1112
        8
        1069
        6
        1091
        6
        557
        51
        1110
        51
        33
        52
        34
        48
        1060
        31
        1059
        45
        9
        68
        1033
        68
        1626
        53
        1072
        32
        1073
        33
        1074
        34
        1075
        35
        1076
        36
        1077
        37
        1078
        38
        1079
        39
        1080
        40
        1081
        41
        1584
        58
        1585
        59
        1586
        60
        1587
        61
        1588
        62
        1589
        63
        1590
        64
        1591
        65
        1592
        66
        1593
        67)
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 1900
    Left = 12
    Top = 215
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      ''
      'Combo1'
      'Combo2')
    ShowLetters = False
    Table = OvcTable1
    Left = 44
    Top = 215
  end
  object OvcTCComboBox1: TOvcTCComboBox
    Items.Strings = (
      'Joe'
      'Fred'
      'James'
      'Jim'
      'George'
      'Al'
      'Gary'
      'Brian'
      'Lee'
      'Sue')
    MaxLength = 20
    Table = OvcTable1
    Left = 76
    Top = 215
  end
  object OvcTCComboBox2: TOvcTCComboBox
    Items.Strings = (
      'Sally'
      'Brenda'
      'Elizabeth'
      'Madeline'
      'Sam'
      'Peggy'
      'Kelly'
      'Alicia'
      'Pat'
      'Sherry'
      'Bryan')
    MaxLength = 20
    Table = OvcTable1
    Left = 108
    Top = 215
  end
  object OvcTCRowHead1: TOvcTCRowHead
    Table = OvcTable1
    Left = 140
    Top = 215
  end
end
