object OvcfrmAliasDlg: TOvcfrmAliasDlg
  Left = 360
  Top = 206
  Caption = 'Alias Dialog'
  ClientHeight = 232
  ClientWidth = 237
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Default'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 17
  object TPanel
    Left = 0
    Top = 192
    Width = 237
    Height = 40
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 280
    ExplicitWidth = 323
    object btnHelp: TButton
      Left = 5
      Top = 5
      Width = 98
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Help'
      TabOrder = 0
    end
    object TPanel
      Left = 107
      Top = 0
      Width = 216
      Height = 41
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object btnOK: TButton
        Left = 8
        Top = 5
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TButton
        Left = 115
        Top = 5
        Width = 98
        Height = 33
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 237
    Height = 192
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 323
    ExplicitHeight = 280
    object Label1: TLabel
      Left = 9
      Top = 235
      Width = 25
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Alias'
    end
    object Label2: TLabel
      Left = 9
      Top = 56
      Width = 38
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Tables'
    end
    object Label3: TLabel
      Left = 9
      Top = 5
      Width = 84
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Selected table'
    end
    object edTableName: TEdit
      Left = 9
      Top = 22
      Width = 187
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      Text = '*.db;*.dbf'
      OnChange = edTableNameChange
    end
    object cbAliasList: TComboBox
      Left = 9
      Top = 252
      Width = 304
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Sorted = True
      TabOrder = 1
      OnChange = cbAliasListChange
    end
    object FileListBox1: TFileListBox
      Left = 9
      Top = 73
      Width = 302
      Height = 155
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ItemHeight = 17
      Mask = '*.db;*.dbf'
      TabOrder = 2
      OnChange = FileListBox1Change
      OnClick = FileListBox1Change
      OnDblClick = FileListBox1DblClick
    end
    object btnBrowse: TButton
      Left = 211
      Top = 20
      Width = 98
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Browse'
      TabOrder = 3
      OnClick = btnBrowseClick
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'db'
    Filter = 'Tables (*.db, *.dbf)|*.db;*.dbf|All Files (*.*)|*.*'
    Title = 'Select Table'
    Left = 200
    Top = 64
  end
end
