{$J+} {Writable constants}

unit ExCalU;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcCal;

type
  TForm4 = class(TForm)
    OvcCalendar1: TOvcCalendar;
    procedure OvcCalendar1GetDateEnabled(Sender: TObject; ADate: TDateTime;
      var Enabled: Boolean);
    procedure OvcCalendar1GetHighlight(Sender: TObject; ADate: TDateTime;
      var Color: TColor);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.DFM}

procedure TForm4.OvcCalendar1GetDateEnabled(Sender: TObject;
  ADate: TDateTime; var Enabled: Boolean);
begin
  Enabled := (DayOfWeek(ADate) <> 3);
end;

procedure TForm4.OvcCalendar1GetHighlight(Sender: TObject;
  ADate: TDateTime; var Color: TColor);
begin
  if DayOfWeek(ADate) = 3 then
    Color := clGreen;
end;

end.
