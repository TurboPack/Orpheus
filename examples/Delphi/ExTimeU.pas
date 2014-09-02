{$J+} {Writable constants}

unit ExTimeU;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcEF, OvcSF, StdCtrls, OvcEditF, OvcEdTim, ExtCtrls;

type
  TForm1 = class(TForm)
    OrController1: TOvcController;
    OvcTimeEdit1: TOvcTimeEdit;
    OvcTimeEdit1Label1: TOvcAttachedLabel;
    rgDurationDisplay: TRadioGroup;
    edNowString: TOvcEdit;
    rgPrimaryField: TRadioGroup;
    cbShowSeconds: TCheckBox;
    cbShowUnits: TCheckBox;
    rgTimeMode: TRadioGroup;
    edUnitsLength: TOvcEdit;
    Button1: TButton;
    cbDefaultToPM: TCheckBox;
    edNowStringLabel1: TOvcAttachedLabel;
    edUnitsLengthLabel1: TOvcAttachedLabel;
    procedure rgDurationDisplayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTimeModeClick(Sender: TObject);
    procedure cbShowSecondsClick(Sender: TObject);
    procedure cbShowUnitsClick(Sender: TObject);
    procedure rgPrimaryFieldClick(Sender: TObject);
    procedure edUnitsLengthExit(Sender: TObject);
    procedure edNowStringExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbDefaultToPMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  {place form in top third of screen}
  Top := (Screen.Height - Height) div 3;
  Left := (Screen.Width - Width) div 2;

  rgTimeMode.Itemindex := Ord(OvcTimeEdit1.TimeMode);
  rgTimeMode.Itemindex := Ord(OvcTimeEdit1.DurationDisplay);
  cbShowUnits.Checked := OvcTimeEdit1.ShowUnits;
  cbShowSeconds.Checked := OvcTimeEdit1.ShowSeconds;
  edUnitsLength.Text := IntToStr(OvcTimeEdit1.UnitsLength);
  edNowString.Text := OvcTimeEdit1.NowString;
end;

procedure TForm1.rgDurationDisplayClick(Sender: TObject);
begin
  OvcTimeEdit1.DurationDisplay := TOvcDurationDisplay(rgDurationDisplay.ItemIndex);
end;

procedure TForm1.rgTimeModeClick(Sender: TObject);
begin
  OvcTimeEdit1.TimeMode := TOvcTimeMode(rgTimeMode.Itemindex);
  rgDurationDisplay.Enabled := OvcTimeEdit1.TimeMode = tmDuration;
  rgPrimaryField.Enabled := OvcTimeEdit1.TimeMode = tmDuration;
  cbShowSeconds.Enabled := OvcTimeEdit1.TimeMode = tmClock;
  cbShowUnits.Enabled := OvcTimeEdit1.TimeMode = tmDuration;
  edUnitsLength.Enabled := OvcTimeEdit1.TimeMode = tmDuration;
  cbShowSeconds.Enabled := OvcTimeEdit1.TimeMode = tmClock;
  cbShowUnits.Enabled := OvcTimeEdit1.TimeMode = tmDuration;
  cbDefaultToPM.Enabled := OvcTimeEdit1.TimeMode = tmClock;
  if OvcTimeEdit1.TimeMode = tmClock then
    OvcTimeEdit1Label1.Caption := 'Time edit'
  else
    OvcTimeEdit1Label1.Caption := 'Duration edit'
end;

procedure TForm1.rgPrimaryFieldClick(Sender: TObject);
begin
  OvcTimeEdit1.PrimaryField := TOvcTimeField(rgPrimaryField.Itemindex);
end;

procedure TForm1.cbShowSecondsClick(Sender: TObject);
begin
  OvcTimeEdit1.ShowSeconds := cbShowSeconds.Checked;
end;

procedure TForm1.cbShowUnitsClick(Sender: TObject);
begin
  OvcTimeEdit1.ShowUnits := cbShowUnits.Checked;
end;

procedure TForm1.edUnitsLengthExit(Sender: TObject);
begin
  OvcTimeEdit1.UnitsLength := StrToIntDef(edUnitsLength.Text, 1);
end;

procedure TForm1.edNowStringExit(Sender: TObject);
begin
  if edUnitsLength.Text > '' then
    OvcTimeEdit1.NowString := edNowString.Text
  else
    OvcTimeEdit1.NowString := ':';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cbDefaultToPMClick(Sender: TObject);
begin
  OvcTimeEdit1.DefaultToPM := cbDefaultToPm.Checked;
end;

end.

