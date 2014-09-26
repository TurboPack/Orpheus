{$J+} {Writable constants}

unit CalUnit;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcCal, StdCtrls, Buttons, OvcSc, OvcMisc, OvcBase,
  OvcData, ExtCtrls, OvcDate;

type
  TCalForm = class(TForm)
    OvcController: TOvcController;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Panel1: TPanel;
    Calendar: TOvcCalendar;
    MonthSpinner: TOvcSpinner;
    YearSpinner2: TOvcSpinner;
    procedure YearSpinnerClick(Sender: TObject; State: TOvcSpinState;
      Delta: Double; Wrap: Boolean);
    procedure MonthSpinnerClick(Sender: TObject; State: TOvcSpinState;
      Delta: Double; Wrap: Boolean);
    procedure CalendarDrawItem(Sender : TObject; ADate : TDateTime;
      const Rect : TRect);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalForm : TCalForm;

implementation

{$R *.DFM}

procedure TCalForm.YearSpinnerClick(Sender: TObject; State: TOvcSpinState;
  Delta: Double; Wrap: Boolean);
begin
  with Calendar do
    if State = ssUpBtn then
      AsStDate := IncDateTrunc(AsStDate, 0, 1)
    else
      AsStDate := IncDateTrunc(AsStDate, 0, -1);
end;

procedure TCalForm.MonthSpinnerClick(Sender: TObject; State: TOvcSpinState;
  Delta: Double; Wrap: Boolean);
begin
  with Calendar do
    if State = ssRightBtn then
      AsStDate := IncDateTrunc(AsStDate, 1, 0)
    else
      AsStDate := IncDateTrunc(AsStDate, -1, 0);
end;

procedure TCalForm.CalendarDrawItem(Sender : TObject; ADate : TDateTime;
  const Rect : TRect);
var
  F   : Boolean;
  R   : TRect;
  C   : TCanvas;
  S   : string;
  Buf : array[0..255] of Char;
  Day,
  Month,
  Year : Word;
begin
  R := Rect;
  C := (Sender as TOvcCalendar).Canvas;

  DecodeDate(ADate, Year, Month, Day);

  {paint background}
  C.Brush.Style := bsClear;
  C.Pen.Color := clBtnFace;
  C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  {shrink cell rect to show a border around the button}
  InflateRect(R, -1, -1);

  F := (Day = Calendar.Day);
  if Month = Calendar.Month then
    DrawButtonFace(C, R, 1, bsNew, True, F, F)
  else begin
    C.Brush.Style := bsSolid;
    C.Pen.Color := Calendar.Colors.InactiveDays;
    C.Brush.Color := Calendar.Colors.InactiveDays;
    C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  end;
  S := Format('%d', [Day]);
  C.Font.Color := clBlack;
  StrPCopy(Buf, S);
  DrawText(C.Handle, Buf, Length(S), R, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TCalForm.FormCreate(Sender: TObject);
begin
  Calendar.CalendarDate := CurrentDate;
end;

end.
