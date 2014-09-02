{$J+} {Writable constants}

unit ExFlexButtonU1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ovcmodg, ovcclcdg, ovccaldg, ovcbase, ovcdlg, ovcclkdg, StdCtrls,
  Buttons, o32flxbn;

type
  TForm1 = class(TForm)
    O32FlexButton1: TO32FlexButton;
    OvcClockDialog1: TOvcClockDialog;
    OvcCalendarDialog1: TOvcCalendarDialog;
    OvcCalculatorDialog1: TOvcCalculatorDialog;
    OvcMemoDialog1: TOvcMemoDialog;
    OpenDialog1: TOpenDialog;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    procedure O32FlexButton1Click(Sender: TObject; Item: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.O32FlexButton1Click(Sender: TObject; Item: Integer);
begin
  case Item of
    0:{ Calendar }
      OvcCalendarDialog1.Execute;
    1:{ Clock }
      OvcClockDialog1.Execute;
    2:{ File }
      OpenDialog1.Execute;
    3:{ Calculator }
      OvcCalculatorDialog1.Execute;
    4:{ Memo }
      OvcMemoDialog1.Execute;
    5:{ Color }
      ColorDialog1.Execute;
    6:{ Font }
      FontDialog1.Execute;
  end;
end;

end.
