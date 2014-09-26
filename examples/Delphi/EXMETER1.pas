{$J+} {Writable constants}

unit Exmeter1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcMeter, StdCtrls, Buttons, ExtCtrls, OvcPeakM;

type
  TForm1 = class(TForm)
    OvcMeter1: TOvcMeter;
    Timer1: TTimer;
    OvcMeter2: TOvcMeter;
    OvcPeakMeter1: TOvcPeakMeter;
    OvcPeakMeter2: TOvcPeakMeter;
    OvcMeter3: TOvcMeter;
    OvcMeter4: TOvcMeter;
    OvcMeter5: TOvcMeter;
    OvcMeter6: TOvcMeter;
    OvcMeter7: TOvcMeter;
    OvcMeter8: TOvcMeter;
    OvcMeter9: TOvcMeter;
    OvcMeter10: TOvcMeter;
    OvcMeter11: TOvcMeter;
    OvcMeter12: TOvcMeter;
    OvcPeakMeter3: TOvcPeakMeter;
    OvcPeakMeter4: TOvcPeakMeter;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    procedure ChangeMeters(Meters : array of TOvcMeter);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.ChangeMeters(Meters : array of TOvcMeter);
var
  i : Integer;
begin
  for i := 0 to High(Meters) do
    with Meters[i] do
      if Tag = 0 then
        if Percent >= 100 then
          Tag := 1
        else
          Percent := Percent + 1
      else
        if Percent <= 0 then
          Tag := 0
        else
          Percent := Percent - 1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  r : Integer;
begin
  {increase meter 1's display value}
  OvcMeter1.Percent := OvcMeter1.Percent + 1;
  if OvcMeter1.Percent >= 100 then
    OvcMeter1.Percent := 0;

  if OvcMeter1.Percent mod 10 = 0 then begin
    OvcPeakMeter1.Value := OvcPeakMeter1.Value + 2;
    OvcPeakMeter2.Value := OvcPeakMeter2.Value + 3;
  end;

  r := random(2);
  if r = 0 then begin
    r := random(10) + 1;
    if OvcPeakMeter3.Value + r < 1000 then
      OvcPeakMeter3.Value := OvcPeakMeter3.Value + r;
  end else begin
    r := random(10) + 1;
    if OvcPeakMeter3.Value - r >= 0 then
      OvcPeakMeter3.Value := OvcPeakMeter3.Value - r;
  end;

  r := random(2);
  if r = 0 then begin
    r := random(10) + 1;
    if OvcPeakMeter4.Value + r < 1000 then
      OvcPeakMeter4.Value := OvcPeakMeter4.Value + r;
  end else begin
    r := random(10) + 1;
    if OvcPeakMeter4.Value - r >= 0 then
      OvcPeakMeter4.Value := OvcPeakMeter4.Value - r;
  end;

  {decrease meter 2's display value}
  OvcMeter2.Percent := OvcMeter2.Percent - 1;
  if OvcMeter2.Percent <= 0 then
    OvcMeter2.Percent := 100;
  if OvcMeter2.Percent mod 20 = 0 then begin
    OvcPeakMeter1.Value := OvcPeakMeter1.Value - 3;
    OvcPeakMeter2.Value := OvcPeakMeter2.Value - 5;
  end;
  ChangeMeters([
    OvcMeter3,OvcMeter4,OvcMeter5,OvcMeter6,OvcMeter7,
    OvcMeter8,OvcMeter9,OvcMeter10,OvcMeter11,OvcMeter12]);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Randomize;
end;

end.
