{$J+} {Writable constants}

unit ExClockU;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcClock, OvcDbClk, ExtCtrls, DBCtrls, Db, DBTables, MPlayer,
  Grids, DBGrids, OvcTCmmn, OvcDbTbl, StdCtrls, OvcTCell, OvcTCStr,
  OvcTCEdt, ovccmbx, ovcclrcb;

type
  TForm3 = class(TForm)
    OvcClock1: TOvcClock;
    DataSource1: TDataSource;
    Table1: TTable;
    DBNavigator1: TDBNavigator;
    OvcController1: TOvcController;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    DigitalPanel: TPanel;
    SegOnColorCombo: TOvcColorComboBox;
    SegOffColorCombo: TOvcColorComboBox;
    Label3: TLabel;
    BGColorCombo: TOvcColorComboBox;
    Label4: TLabel;
    Label5: TLabel;
    MilTimeCB: TCheckBox;
    ShowSecCB: TCheckBox;
    OvcDbClock1: TOvcDbClock;
    procedure CheckBox1Click(Sender: TObject);
    procedure DigitalColorChange(Sender: TObject);
    procedure ChangeDisplay(Sender: TObject);
  private { Private declarations }
    procedure LoadDigitalOptions;
  public { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then begin
    OvcClock1.DisplayMode := dmDigital;
    DigitalPanel.Visible := true;
    LoadDigitalOptions;
  end else begin
    OvcClock1.DisplayMode := dmAnalog;
    DigitalPanel.Visible := false;
  end;
end;

var
  LoadingOptions: Boolean;

procedure TForm3.LoadDigitalOptions;
begin
  LoadingOptions := true;
  SegOnColorCombo.SelectedColor := OvcClock1.DigitalOptions.OnColor;
  SegOffColorCombo.SelectedColor := OvcClock1.DigitalOptions.OffColor;
  BGColorCombo.SelectedColor := OvcClock1.DigitalOptions.BgColor;
  MilTimeCB.Checked := OvcClock1.DigitalOptions.MilitaryTime;
  ShowsecCB.Checked := OvcClock1.DigitalOptions.ShowSeconds;
  LoadingOptions := false;
end;

procedure TForm3.DigitalColorChange(Sender: TObject);
begin
  if not loadingOptions then begin
    OvcClock1.DigitalOptions.OnColor := SegOnColorCombo.SelectedColor;
    OvcClock1.DigitalOptions.OffColor := SegOffColorCombo.SelectedColor;
    OvcClock1.DigitalOptions.BgColor := BGColorCombo.SelectedColor;
  end;
end;

procedure TForm3.ChangeDisplay(Sender: TObject);
begin
  if not LoadingOptions then begin
    OvcClock1.DigitalOptions.MilitaryTime := MilTimeCB.Checked;
    OvcClock1.DigitalOptions.ShowSeconds := ShowsecCB.Checked;
  end;
end;

end.
