object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'Demo for table-cells containing multiple lines of text'
  ClientHeight = 413
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object OvcTable: TOvcTable
    Left = 0
    Top = 0
    Width = 473
    Height = 413
    TopRow = 3
    ActiveRow = 2
    RowLimit = 8
    Anchors = [akLeft, akTop, akRight, akBottom]
    Align = alLeft
    DragCursor = 7
    GridPenSet.NormalGrid.NormalColor = clBtnShadow
    GridPenSet.NormalGrid.Style = psDot
    GridPenSet.NormalGrid.Effect = geBoth
    GridPenSet.LockedGrid.NormalColor = clBtnShadow
    GridPenSet.LockedGrid.Style = psSolid
    GridPenSet.LockedGrid.Effect = ge3D
    GridPenSet.CellWhenFocused.NormalColor = clBlack
    GridPenSet.CellWhenFocused.Style = psSolid
    GridPenSet.CellWhenFocused.Effect = geHorizontal
    GridPenSet.CellWhenUnfocused.NormalColor = clBlack
    GridPenSet.CellWhenUnfocused.Style = psDash
    GridPenSet.CellWhenUnfocused.Effect = geBoth
    LockedRowsCell = OvcTCColHead1
    Options = [otoNoRowResizing, otoTabToArrow, otoNoSelection]
    TabOrder = 0
    OnGetCellData = OvcTableGetCellData
    CellData = (
      'Form11.OvcTCPictureField'
      'Form11.OvcTCString'
      'Form11.OvcTCMemo'
      'Form11.O32TCFlexEdit'
      'Form11.OvcTCColHead1')
    RowData = (
      66)
    ColData = (
      100
      False
      True
      'Form11.OvcTCString'
      100
      False
      True
      'Form11.OvcTCPictureField'
      100
      False
      True
      'Form11.OvcTCMemo'
      137
      False
      True
      'Form11.O32TCFlexEdit')
  end
  object Panel1: TPanel
    Left = 473
    Top = 0
    Width = 359
    Height = 413
    Align = alClient
    Anchors = [akTop, akRight, akBottom]
    TabOrder = 1
    ExplicitLeft = 484
    ExplicitWidth = 290
    object Memo1: TMemo
      Left = 12
      Top = 14
      Width = 333
      Height = 199
      Lines.Strings = (
        'This demo shows the new properties '#39'EllipsisMode'#39' and '
        #39'IgnoreCR'#39'.'
        ''
        'Orpheus 4.06 used EllipsisMode=em_show_readonly '
        'and IgnoreCR=True; so '#39'...'#39' were only showed in '
        'readonly-mode and if UseWordWrap=False, the text '
        'was displayed in a single line - ignoring linebreaks.'
        'These were somewhat limited options if you were '
        'working with multiple lines of text.'
        ''
        'Change the settings to test the extended options.')
      TabOrder = 0
    end
    object GroupBox_WW_ICR: TGroupBox
      Left = 185
      Top = 232
      Width = 160
      Height = 105
      Caption = 'UseWordWrap/IgnoreCR'
      TabOrder = 1
      object Label1: TLabel
        Left = 10
        Top = 24
        Width = 139
        Height = 16
        Caption = '(not for OvcPictureField)'
      end
      object CheckBox_UseWordWrap: TCheckBox
        Left = 10
        Top = 50
        Width = 123
        Height = 17
        Caption = 'UseWordWrap'
        TabOrder = 0
        OnClick = Control_Eventhandler
      end
      object CheckBox_IgnoreCR: TCheckBox
        Left = 10
        Top = 79
        Width = 99
        Height = 17
        Caption = 'IgnoreCR'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = Control_Eventhandler
      end
    end
    object RadioGroup_EllipsisMode: TRadioGroup
      Left = 12
      Top = 232
      Width = 157
      Height = 105
      Caption = 'EllipsisMode'
      ItemIndex = 1
      Items.Strings = (
        'em_dont_show'
        'em_show_readonly'
        'em_show')
      TabOrder = 2
      OnClick = Control_Eventhandler
    end
    object GroupBox_Access: TGroupBox
      Left = 14
      Top = 343
      Width = 155
      Height = 52
      Caption = 'Access'
      TabOrder = 3
      object CheckBox_Access: TCheckBox
        Left = 8
        Top = 22
        Width = 97
        Height = 17
        Caption = 'ReadOnly'
        TabOrder = 0
        OnClick = Control_Eventhandler
      end
    end
  end
  object O32TCFlexEdit: TO32TCFlexEdit
    EditorBorders.Active = False
    EditorBorders.FlatColor = clBlack
    EditorBorders.BorderStyle = bstyRidge
    EditorOptions.Alignment = taLeftJustify
    EditorOptions.Color = clWindow
    EditorOptions.Cursor = crDefault
    EditorOptions.MaxLines = 10
    EditorOptions.ReadOnly = False
    EditorOptions.ShowButton = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable
    TableFont = False
    Validation.BeepOnError = True
    Validation.InputRequired = False
    Validation.ValidatorType = 'None'
    Validation.ValidationType = vtUser
    WantReturns = True
    UseWordWrap = False
    Left = 354
    Top = 278
  end
  object OvcTCString: TOvcTCString
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable
    TableFont = False
    Left = 34
    Top = 280
  end
  object OvcTCPictureField: TOvcTCPictureField
    PictureMask = 'XXXXXXXXXXXXXXX'
    MaxLength = 100
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable
    TableFont = False
    Left = 136
    Top = 280
    RangeHigh = {00000000000000000000}
    RangeLow = {00000000000000000000}
  end
  object OvcTCMemo: TOvcTCMemo
    Access = otxNormal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Table = OvcTable
    TableFont = False
    UseWordWrap = False
    Left = 238
    Top = 280
  end
  object OvcTCColHead1: TOvcTCColHead
    Headings.Strings = (
      'OvcTCString'
      'OvcTCPictureField'
      'OvcTCMemo'
      'O32TCFlexEdit')
    ShowLetters = False
    Adjust = otaCenter
    Table = OvcTable
    Left = 138
    Top = 16
  end
end
