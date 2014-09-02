{$J+} {Writable constants}

unit ExEdPrnU;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcNbk, OvcEdit, StdCtrls, Printers, OvcViewr,
  Buttons, OvcEditU;

type
  TForm1 = class(TForm)
    DefaultController: TOvcController;
    Button1: TButton;
    ED: TOvcTextFileEditor;
    BitBtn1: TBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  I  : LongInt;
  S  : string;
  X  : Integer;
  Y  : Integer;
  YD : Integer;
begin
  {assign editor font to printer}
  Printer.Canvas.Font := ED.FixedFont.Font;

  {get vertical line delta}
  YD := Printer.Canvas.TextHeight('Wg');

  {access printer handle to force selection of the font}
  {into the printer DC. Delphi doesn't do this automatically}
  if Printer.Handle > 0 then {};

  Screen.Cursor := crHourGlass;
  try
    Y := 50;
    X := 50;
    Printer.BeginDoc;
    for I := 1 to ED.LineCount do begin
      S := ED.Lines[I];
      Printer.Canvas.TextOut(X, Y, S);
      Inc(Y, YD);
      if Y > Printer.PageHeight - 50 then begin
        Y := 50;
        Printer.NewPage;
      end;
    end;
    Printer.EndDoc;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
