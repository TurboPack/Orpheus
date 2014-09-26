object Form1: TForm1
  Left = 201
  Top = 132
  Caption = 'Outline/ReportView example'
  ClientHeight = 474
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object OvcSplitter1: TOvcSplitter
    Left = 0
    Top = 0
    Width = 900
    Height = 474
    Position = 223
    Align = alClient
    object SPL1: TOvcSection
      object OvcOutline1: TOvcOutline
        Left = 0
        Top = 0
        Width = 220
        Height = 471
        Align = alClient
        BorderStyle = bsNone
        Controller = OvcController1
        Images = ImageList1
        IntegralHeight = False
        SelectColor.BackColor = clHighlight
        SelectColor.TextColor = clHighlightText
        TabOrder = 0
        OnActiveChange = OvcOutline1ActiveChange
        OnClick = OvcOutline1Click
        OnDynamicLoad = OvcOutline1DynamicLoad
        OnNodeDestroy = OvcOutline1NodeDestroy
      end
    end
    object SPL2: TOvcSection
      object OvcDataReportView1: TOvcDataReportView
        Left = 0
        Top = 27
        Width = 671
        Height = 444
        ActiveView = 'Default'
        Align = alClient
        Controller = OvcController1
        Options.ListBorderStyle = bsNone
        TabOrder = 0
        OnDblClick = OvcDataReportView1DblClick
        OnViewSelect = OvcDataReportView1ViewSelect
        object FileName: TOvcDataRvField
          Caption = 'Name'
        end
        object FileSize: TOvcDataRvField
          Alignment = taRightJustify
          Caption = 'Size'
          DataType = dtFloat
          Format = '#,###,###,###'
        end
        object FileType: TOvcDataRvField
          Caption = 'Type'
        end
        object FileModified: TOvcDataRvField
          Caption = 'Modified'
          DataType = dtDateTime
          Format = 'yyyy.mm.dd hh:mm:ss'
        end
        object FileAttr: TOvcDataRvField
          Alignment = taRightJustify
          Caption = 'Attributes'
        end
        object FilePath: TOvcDataRvField
          Caption = 'Path'
        end
        object Default: TOvcRVView
          ShowGroupTotals = True
          ShowFooter = True
          Title = 'Default'
          object Default_FileName: TOvcRvViewField
            Width = 131
            FieldName = 'FileName'
          end
          object Default_FileSize: TOvcRvViewField
            Width = 100
            ComputeTotals = True
            FieldName = 'FileSize'
          end
          object Default_FileType: TOvcRvViewField
            FieldName = 'FileType'
          end
          object Default_FileModified: TOvcRvViewField
            Width = 147
            FieldName = 'FileModified'
          end
          object Default_FileAttr: TOvcRvViewField
            Width = 61
            FieldName = 'FileAttr'
          end
        end
        object By_Type: TOvcRVView
          ShowGroupTotals = True
          ShowFooter = True
          Title = 'By Type'
          object By_Type_FileType: TOvcRvViewField
            Width = 18
            FieldName = 'FileType'
            GroupBy = True
          end
          object By_Type_FileName: TOvcRvViewField
            Width = 131
            FieldName = 'FileName'
          end
          object By_Type_FileSize: TOvcRvViewField
            Width = 100
            ComputeTotals = True
            FieldName = 'FileSize'
          end
          object By_Type_FileModified: TOvcRvViewField
            Width = 147
            FieldName = 'FileModified'
          end
          object By_Type_FileAttr: TOvcRvViewField
            Width = 61
            FieldName = 'FileAttr'
          end
        end
        object By_Date_Time_Stamp: TOvcRVView
          ShowGroupTotals = True
          ShowFooter = True
          Title = 'By Date/Time Stamp'
          object By_Date_Time_Stamp_FileModified: TOvcRvViewField
            Width = 18
            FieldName = 'FileModified'
            GroupBy = True
          end
          object By_Date_Time_Stamp_FileName: TOvcRvViewField
            Width = 131
            FieldName = 'FileName'
          end
          object By_Date_Time_Stamp_FileSize: TOvcRvViewField
            Width = 100
            ComputeTotals = True
            FieldName = 'FileSize'
          end
          object By_Date_Time_Stamp_FileType: TOvcRvViewField
            FieldName = 'FileType'
          end
          object By_Date_Time_Stamp_FileAttr: TOvcRvViewField
            Width = 61
            FieldName = 'FileAttr'
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 671
        Height = 27
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 208
          Top = 7
          Width = 25
          Height = 13
          Caption = 'Filter:'
        end
        object OvcViewComboBox1: TOvcViewComboBox
          Left = 2
          Top = 3
          Width = 199
          Height = 19
          Hint = 'Current View'
          ReportView = OvcDataReportView1
          HotTrack = True
          ItemHeight = 13
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object chkArchive: TCheckBox
          Left = 240
          Top = 5
          Width = 65
          Height = 17
          Caption = 'Archive'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkArchiveClick
        end
        object chkSystem: TCheckBox
          Left = 304
          Top = 5
          Width = 57
          Height = 17
          Caption = 'System'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkArchiveClick
        end
        object chkHidden: TCheckBox
          Left = 368
          Top = 5
          Width = 57
          Height = 17
          Caption = 'Hidden'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chkArchiveClick
        end
        object chkReadOnly: TCheckBox
          Left = 424
          Top = 5
          Width = 73
          Height = 17
          Caption = 'Read Only'
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = chkArchiveClick
        end
      end
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
    Left = 64
    Top = 16
  end
  object ImageList1: TImageList
    Left = 106
    Top = 74
  end
end
