unit Exabtn1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, OvcABtn, OvcBase, OvcEF, OvcPB, OvcPF,
  OvcDate;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    ABtn: TOvcAttachedButton;
    PF: TOvcPictureField;
    OvcController1: TOvcController;
    procedure ABtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ExABtn2;

{$R *.DFM}

procedure TForm1.ABtnClick(Sender: TObject);
var
  P : TPoint;
begin
  P := ClientToScreen(Point(ABtn.Left+ABtn.Width , ABtn.Top + ABtn.Height));
  frmCal.Left := P.X - frmCal.Width;
  frmCal.Top := P.Y;
  frmCal.Calendar.CalendarDate := PF.AsDateTime;
  if frmCal.ShowModal = mrOK then
    PF.AsStDate := DateTimeToSTDate(frmCal.Calendar.CalendarDate);
end;

end.
