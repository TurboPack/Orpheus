object frmOwnerDrawTabs: TfrmOwnerDrawTabs
  Left = 193
  Top = 108
  Width = 400
  Height = 310
  Caption = 'Owner-Draw Notebook Tabs Example'
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Courier New'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Notebook: TOvcNotebook
    Left = 8
    Top = 8
    Width = 376
    Height = 273
    ActiveTabFont.Charset = DEFAULT_CHARSET
    ActiveTabFont.Color = clWindowText
    ActiveTabFont.Height = -13
    ActiveTabFont.Name = 'Courier New'
    ActiveTabFont.Style = [fsBold]
    ConserveResources = True
    DefaultPageIndex = 0
    HighlightColor = clBtnHighlight
    OldStyle = False
    PageUsesTabColor = True
    ShadowColor = clBtnShadow
    ShadowedText = False
    TabAutoHeight = False
    TabHeight = 60
    TabOrientation = toRight
    TabTextOrientation = ttoHorizontal
    TabRowCount = 0
    TextShadowColor = clBtnShadow
    TabUseDefaultColor = True
    UseActiveTabFont = True
    OnDrawTab = NotebookDrawTab
    OnPageChanged = NotebookPageChanged
    Controller = OvcController1
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&ABC'
      Enabled = True
      PageVisible = True
      object NB01: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 252
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 227
          Caption = 'A'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 227
          Caption = 'B'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 227
          Caption = 'C'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&DEF'
      Enabled = True
      PageVisible = True
      object NB02: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'D'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'E'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'F'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&GHI'
      Enabled = True
      PageVisible = True
      object NB03: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'G'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'H'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'I'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&JKL'
      Enabled = True
      PageVisible = True
      object NB04: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'J'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'K'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'L'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&MNO'
      Enabled = True
      PageVisible = True
      object NB05: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'M'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'N'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'O'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&PQR'
      Enabled = True
      PageVisible = True
      object NB06: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'P'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'Q'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'R'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&STU'
      Enabled = True
      PageVisible = True
      object NB07: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'S'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'T'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'U'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&VWX'
      Enabled = True
      PageVisible = True
      object NB08: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'V'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'W'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'X'
          Enabled = True
          PageVisible = True
        end
      end
    end
    object TOvcTabPage
      Left = 1
      Top = 1
      Width = 252
      Height = 270
      Caption = '&YZ'
      Enabled = True
      PageVisible = True
      object NB09: TOvcNotebook
        Left = 8
        Top = 8
        Width = 304
        Height = 414
        ActiveTabFont.Charset = DEFAULT_CHARSET
        ActiveTabFont.Color = clWindowText
        ActiveTabFont.Height = -13
        ActiveTabFont.Name = 'Courier New'
        ActiveTabFont.Style = [fsBold]
        ConserveResources = False
        DefaultPageIndex = 0
        HighlightColor = clBtnHighlight
        OldStyle = False
        PageUsesTabColor = True
        ShadowColor = clBtnShadow
        ShadowedText = False
        TabAutoHeight = True
        TabHeight = 20
        TabOrientation = toTop
        TabTextOrientation = ttoHorizontal
        TabRowCount = 0
        TextShadowColor = clBtnShadow
        TabUseDefaultColor = True
        UseActiveTabFont = True
        OnPageChanged = NotebookPageChanged
        Controller = OvcController1
        Color = clBtnFace
        TabOrder = 0
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'Y'
          Enabled = True
          PageVisible = True
        end
        object TOvcTabPage
          Left = 1
          Top = 23
          Width = 301
          Height = 389
          Caption = 'Z'
          Enabled = True
          PageVisible = True
        end
      end
    end
  end
  object LB: TListBox
    Left = 25
    Top = 45
    Width = 232
    Height = 220
    ItemHeight = 16
    Items.Strings = (
      '(Empty)')
    Sorted = True
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
    Left = 280
    Top = 232
  end
end
