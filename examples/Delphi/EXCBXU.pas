{$J+} {Writable constants}


{$IFNDEF VER80}       {Delphi 1.0}
 {$DEFINE VERSION2}   {Delphi 2.0 and BCB 1 or higher}
{$ENDIF}

{$IFDEF VERSION2}
 {$IFNDEF VER90}      {Delphi 2.0}
  {$IFNDEF VER93}     {BCB 1.0}
   {$DEFINE VERSION3} {Delphi 3.0 or BCB 3.0}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

{$IFDEF VERSION3}
 {$IFNDEF VER100}     {Delphi 3}
  {$IFNDEF VER110}    {BCB 3}
   {$DEFINE VERSION4} {Delphi 4.0 or higher}
  {$ENDIF}
 {$ENDIF}
{$ENDIF}

unit Excbxu;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcHsCbx, OvcDrCbx, OvcFlCbx, OvcFmCbx, OvcFtCbx, OvcCmbx, OvcBase,
  {$IFDEF VERSION3} OvcDbHBD, {$ENDIF}
  StdCtrls, OvcDbFCb, FileCtrl, DBLookup, DBCtrls, WinProcs, WinTypes,
  ExtCtrls, Db, DBTables, OvcPrCbx, Printers, Buttons, OvcDbACb, OvcDbTCb,
  OvcDvCbx, ovcdbhll;

type
  TForm1 = class(TForm)
    OvcComboBox: TOvcComboBox;
    OrController1: TOvcController;
    OvcFontComboBox: TOvcFontComboBox;
    OvcDirectoryComboBox: TOvcDirectoryComboBox;
    OvcFileComboBox: TOvcFileComboBox;
    OvcHistoryComboBox: TOvcHistoryComboBox;
    OvcAssociationComboBox: TOvcAssociationComboBox;
    OvcPrinterComboBox: TOvcPrinterComboBox;
    Properties: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Preview1: TEdit;
    FileMask1: TEdit;
    Icon1: TImage;
    Label8: TLabel;
    Directory1: TEdit;
    Description1: TEdit;
    Label9: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    FontName1: TEdit;
    Label4: TLabel;
    FontBtn: TSpeedButton;
    DirectoryBtn: TSpeedButton;
    MaskBtn: TSpeedButton;
    GroupBox1: TGroupBox;
    Style1: TCheckBox;
    Label10: TLabel;
    DropCount1: TEdit;
    Label11: TLabel;
    MRUCount1: TEdit;
    Label12: TLabel;
    Height1: TEdit;
    HeightBtn: TSpeedButton;
    MRUCountBtn: TSpeedButton;
    DropCountBtn: TSpeedButton;
    Label1: TLabel;
    Text1: TEdit;
    Label2: TLabel;
    ListIndex1: TEdit;
    Label3: TLabel;
    ItemIndex1: TEdit;
    HotTrack1: TCheckBox;
    OvcDriveComboBox: TOvcDriveComboBox;
    Label13: TLabel;
    Volume1: TEdit;
    AllFontBtn: TSpeedButton;
    FontDialog1: TFontDialog;
    OvcDbAliasComboBox: TOvcDbAliasComboBox;
    OvcDbTableNameComboBox: TOvcDbTableNameComboBox;
    OvcDbFieldComboBox: TOvcDbFieldComboBox;
    OvcDbBDEHelper1: TOvcDbBDEHelper;
    OvcComboBoxLabel1: TOvcAttachedLabel;
    OvcFontComboBoxLabel1: TOvcAttachedLabel;
    OvcDriveComboBoxLabel1: TOvcAttachedLabel;
    OvcDirectoryComboBoxLabel1: TOvcAttachedLabel;
    OvcFileComboBoxLabel1: TOvcAttachedLabel;
    OvcPrinterComboBoxLabel1: TOvcAttachedLabel;
    OvcAssociationComboBoxLabel1: TOvcAttachedLabel;
    OvcHistoryComboBoxLabel1: TOvcAttachedLabel;
    OvcDbAliasComboBoxLabel1: TOvcAttachedLabel;
    OvcDbTableNameComboBoxLabel1: TOvcAttachedLabel;
    OvcDbFieldComboBoxLabel1: TOvcAttachedLabel;
    procedure ComboBoxSelectionChange(Sender: TObject);
    procedure DropCountBtnClick(Sender: TObject);
    procedure MRUCountBtnClick(Sender: TObject);
    procedure FontBtnClick(Sender: TObject);
    procedure DirectoryBtnClick(Sender: TObject);
    procedure MaskBtnClick(Sender: TObject);
    procedure HeightBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Style1Click(Sender: TObject);
    procedure HotTrack1Click(Sender: TObject);
    procedure AllFontBtnClick(Sender: TObject);
  private
    { Private declarations }
    {$IFDEF VERSION3}
    DBH : TOvcDbBDEHelper;
    {$ENDIF}
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{----------------------------------------------------------------}

procedure TForm1.ComboBoxSelectionChange(Sender: TObject);
begin
  {Common properties}
  OvcDbFieldComboBox.Enabled := False;

  with (Sender as TOvcBaseComboBox) do begin
    Text1.Text := List[ListIndex];
    ListIndex1.Text := IntToStr(ListIndex);
    ItemIndex1.Text := IntToStr(ItemIndex);
  end;

  if (Sender is TOvcFontComboBox) then
    with (Sender as TOvcFontComboBox) do begin
      FontName1.Text := FontName;
      Preview1.Text := FontName;
    end

  else if (Sender is TOvcDriveComboBox) then
    with (Sender as TOvcDriveComboBox) do
      Volume1.Text := VolumeName

  else if (Sender is TOvcDirectoryComboBox) then
    with (Sender as TOvcDirectoryComboBox) do
      Directory1.Text := Directory

  else if (Sender is TOvcAssociationComboBox) then
    with (Sender as TOvcAssociationComboBox) do begin
      Description1.Text := Description;
      Icon1.Picture.Icon.Handle := AssociatedIcon;
    end

  else if (Sender is TOvcDbAliasComboBox) then
    with (Sender as TOvcDbAliasComboBox) do begin
      Table1.Active := False;
      try
        Table1.DatabaseName := AliasName;
        OvcDbTableNameComboBox.Enabled := True;
        OvcDbTableNameComboBox.AliasName := AliasName;
      except
        OvcDbTableNameComboBox.Enabled := False;
        ShowMessage('Cannot set database name');
      end;
    end

  else if (Sender is TOvcDbTableNameComboBox) then
    with (Sender as TOvcDbTableNameComboBox) do begin
      Table1.Active := False;
      try
        Table1.TableName := TableName;
        Table1.Active := True;
      except
        ShowMessage('Cannot open table');
      end;
      OvcDbFieldComboBox.Enabled := Table1.Active;
    end;
end;

{----------------------------------------------------------------}

procedure TForm1.Style1Click(Sender: TObject);
var
  S : TOvcComboStyle;
begin
  S := TOvcComboStyle(Style1.Checked);
  OvcComboBox.Style            := S;
  OvcFontComboBox.Style        := S;
  OvcDirectoryComboBox.Style   := S;
  OvcFileComboBox.Style        := S;
  OvcPrinterComboBox.Style     := S;
  OvcAssociationComboBox.Style := S;
  OvcDbAliasComboBox.Style     := S;
  OvcDbTableNameComboBox.Style := S;
end;

{----------------------------------------------------------------}

procedure TForm1.HotTrack1Click(Sender: TObject);
begin
  OvcComboBox.HotTrack := HotTrack1.Checked;
  OvcFontComboBox.HotTrack := HotTrack1.Checked;
  OvcDriveComboBox.HotTrack := HotTrack1.Checked;
  OvcDirectoryComboBox.HotTrack := HotTrack1.Checked;
  OvcFileComboBox.HotTrack := HotTrack1.Checked;
  OvcPrinterComboBox.HotTrack := HotTrack1.Checked;
  OvcAssociationComboBox.HotTrack := HotTrack1.Checked;
  OvcHistoryComboBox.HotTrack := HotTrack1.Checked;
  OvcDbAliasComboBox.HotTrack := HotTrack1.Checked;
  OvcDbTableNameComboBox.HotTrack := HotTrack1.Checked;
  OvcDbFieldComboBox.HotTrack := HotTrack1.Checked;
end;

procedure TForm1.DropCountBtnClick(Sender: TObject);
var
  C : Integer;
begin
  C := StrToInt(DropCount1.Text);
  OvcComboBox.DropDownCount            := C;
  OvcFontComboBox.DropDownCount        := C;
  OvcDriveComboBox.DropDownCount       := C;
  OvcDirectoryComboBox.DropDownCount   := C;
  OvcFileComboBox.DropDownCount        := C;
  OvcPrinterComboBox.DropDownCount     := C;
  OvcAssociationComboBox.DropDownCount := C;
  OvcHistoryComboBox.DropDownCount     := C;
  OvcDbAliasComboBox.DropDownCount     := C;
  OvcDbTableNameComboBox.DropDownCount := C;
  OvcDbFieldComboBox.DropDownCount     := C;
end;

{----------------------------------------------------------------}

procedure TForm1.MRUCountBtnClick(Sender: TObject);
var
  C : Integer;
begin
  C := StrToInt(MRUCount1.Text);
  OvcComboBox.MRUListCount            := C;
  OvcFontComboBox.MRUListCount        := C;
  OvcDriveComboBox.MRUListCount       := C;
  OvcDirectoryComboBox.MRUListCount   := C;
  OvcFileComboBox.MRUListCount        := C;
  OvcPrinterComboBox.MRUListCount     := C;
  OvcAssociationComboBox.MRUListCount := C;
  OvcDbAliasComboBox.MRUListCount     := C;
  OvcDbTableNameComboBox.MRUListCount := C;
  OvcDbFieldComboBox.MRUListCount     := C;
end;

{----------------------------------------------------------------}

procedure TForm1.HeightBtnClick(Sender: TObject);
var
  H : Integer;
begin
  H := StrToInt(Height1.Text);
  OvcComboBox.ItemHeight            := H;
  OvcFontComboBox.ItemHeight        := H;
  OvcDriveComboBox.ItemHeight       := H;
  OvcDirectoryComboBox.ItemHeight   := H;
  OvcFileComboBox.ItemHeight        := H;
  OvcPrinterComboBox.ItemHeight     := H;
  OvcAssociationComboBox.ItemHeight := H;
  OvcHistoryComboBox.ItemHeight     := H;
  OvcDbAliasComboBox.ItemHeight     := H;
  OvcDbTableNameComboBox.ItemHeight := H;
  OvcDbFieldComboBox.ItemHeight     := H;
end;

{----------------------------------------------------------------}

procedure TForm1.FontBtnClick(Sender: TObject);
begin
  OvcFontComboBox.FontName := FontName1.Text;
  OvcFontComboBox.SelectionChanged;
end;

{----------------------------------------------------------------}

procedure TForm1.DirectoryBtnClick(Sender: TObject);
begin
  OvcDirectoryComboBox.Directory := Directory1.Text;
  OvcDirectoryComboBox.SelectionChanged;
end;

{----------------------------------------------------------------}

procedure TForm1.MaskBtnClick(Sender: TObject);
begin
  OvcFileComboBox.FileMask := FileMask1.Text;
end;

{----------------------------------------------------------------}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Style1Click(nil);
  HotTrack1Click(nil);
  DropCountBtnClick(nil);
  MRUCountBtnClick(nil);
  HeightBtnClick(nil);
  FontDialog1.Font := Font;

  {$IFDEF VERSION3}
  DBH := TOvcDbBDEHelper.Create(Self);
  OvcDBAliasComboBox.DBEngineHelper := DBH;
  OvcDBAliasComboBox.Populate;
  OvcDBTableNameComboBox.DBEngineHelper := DBH;
  OvcDBTableNameComboBox.Populate;
  {$ENDIF}
end;

procedure TForm1.AllFontBtnClick(Sender: TObject);
begin
  if FontDialog1.Execute then
    Font := FontDialog1.Font;
end;

end.
