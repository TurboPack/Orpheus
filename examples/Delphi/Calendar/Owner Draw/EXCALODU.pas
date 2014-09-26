{$J+} {Writable constants}

unit ExCalOdU;

interface

uses
  Windows,
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OvcBase, OvcCal;

type
  TForm1 = class(TForm)
    Calendar: TOvcCalendar;
    procedure CalendarDrawItem(Sender: TObject; ADate: TDateTime;
      const Rect: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CalendarDrawItem(Sender: TObject; ADate: TDateTime;
  const Rect: TRect);
var
  Year  : Word;
  Month : Word;
  Day   : Word;
  R     : TRect;
  C     : TCanvas;
  F     : Boolean;
  S     : string;
  Buf   : array[0..255] of Char;
begin
  R := Rect;
  C := Calendar.Canvas;

  {paint background}
  C.Brush.Style := bsClear;
  C.Pen.Color := clBtnFace;
  C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  DecodeDate(ADate, Year, Month, Day);
  F := (ADate = Calendar.Date);
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
  InflateRect(R, -2, -2);
  DrawText(C.Handle, Buf, Length(S), R, DT_TOP or DT_SINGLELINE);

  {hard-coded text for some days}
  case Day of
    3  : S := 'Birthday';
    13 : S := 'Wedding';
    26 : S := 'Vacation';
  else
    S := '';
  end;
  if S > '' then begin
    StrPCopy(Buf, S);
    DrawText(C.Handle, Buf, Length(S), R, DT_CENTER or DT_BOTTOM or DT_SINGLELINE);
  end;
end;

end.
