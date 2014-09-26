unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
  ComCtrls, ovctcedtHTMLText, Controls, StdCtrls, ovcRTF_Paint;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    OvcHtmlMemo1: TOvcHtmlMemo;
    procedure OvcHtmlMemo1Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  ovcRTF_IText;

{$R *.dfm}

procedure TForm2.FormPaint(Sender: TObject);
var
  Painter: TOvcRTFPainter;
  Doc: ITextDocument;
  H, W: Integer;
  R: TRect;
  size: TSize;
const
  REBorder = 5;
begin
//SpeedMeasureStart;
  Painter := TOvcRTFPainter.Create;
  try
    Doc := Painter.GetDoc;  // must store GetDoc in a temporary variable so it can be set to nil before Painter.Free
    TOvcCustomHtmlTextEditBase.FillIDocument(Doc, OvcHtmlMemo1.HTMLText, OvcHtmlMemo1.Font);
    Doc := nil;
//SpeedMeasureLogHiRes('fill');

    Canvas.Pen.Color := clBlack;
    R := Rect(8, 8, 289-REBorder, 217);   // reduced width because of RichView borders
    Canvas.Rectangle(R);

    size := Painter.GetDrawExtent(Canvas, OvcHtmlMemo1.Width - REBorder);

//    size.cy := Painter.GetDrawHeight(Canvas, OvcHtmlMemo1.Width - REBorder);
//    size.cx := 0;

    h := size.cy;
    w := size.cx;

    Painter.Draw(canvas, R, true, true);
  finally
    Painter.Free;
  end;

  Canvas.Pen.Color := clRed;
  Canvas.MoveTo(8, 8 + H);
  Canvas.LineTo(289-REBorder, 8 + H);

  if W <> 0 then
  begin
    Canvas.Pen.Color := clBlue;
    Canvas.MoveTo(8 + W, 8);
    Canvas.LineTo(8 + W, 217);
  end;
end;

procedure TForm2.Memo1Change(Sender: TObject);
begin
  OvcHtmlMemo1.OnChange := nil;
  OvcHtmlMemo1.HTMLText := Memo1.Text;
  OvcHtmlMemo1.OnChange := OvcHtmlMemo1Change;
  Invalidate;
end;

procedure TForm2.OvcHtmlMemo1Change(Sender: TObject);
begin
  Memo1.OnChange := nil;
  Memo1.Text := OvcHtmlMemo1.HTMLText;
  Memo1.OnChange := Memo1Change;
  Invalidate;
end;

end.
