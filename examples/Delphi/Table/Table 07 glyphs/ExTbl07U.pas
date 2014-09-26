{$J+} {Writable constants}

{Example program that shows how to display a message that depends on the}
{current setting of the glyph AND keeps the glyph from cycling to the next}
{item. There is a momentary flash of the glyph to the next item; this is}
{unavoidable without a substantial rewrite of the glyph component.}
{A "New Settings" button reassigns random values to the glyphs to show how}
{to reset the values shown by the table}

unit ExTbl07U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCStr, OvcTCCBx, OvcTCmmn, OvcTCell, OvcTCBmp, OvcTCGly, OvcBase,
  OvcTable, StdCtrls, OvcTCEdt;

const
  MyMessage1 = WM_USER + 1;
  MyMessage2 = WM_USER + 2;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCGlyph1: TOvcTCGlyph;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTCGlyph1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure OnMyMessage1(var Msg : TMessage);
      message MyMessage1;
    procedure OnMyMessage2(var Msg : TMessage);
      message MyMessage2;
  end;

  MyRec = record
    GIdx : Integer;
    CStr : string;//[10];
  end;

var
  Form1: TForm1;
  MyArray : array[1..9] of MyRec;

implementation

{$R *.DFM}



procedure TForm1.FormCreate(Sender: TObject);
var
  I : integer;
begin
  for I := 1 to 9 do
    MyArray[I].GIdx := (I-1) mod 2;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (rownum in [1..9]) then
  begin
    case colnum of
      1 : Data := @myarray[rownum].GIdx;
    end;
  end;
end;

procedure TForm1.OnMyMessage1(var Msg : TMessage);
begin
  ShowMessage('The Sun is shining');
end;


procedure TForm1.OnMyMessage2(var Msg : TMessage);
begin
  ShowMessage('Call home');
end;


procedure TForm1.OvcTCGlyph1Click(Sender: TObject);
var
  TV : integer;
begin
  with OvcTable1 do
  begin
    AllowRedraw := False;
    try
      TV := MyArray[ActiveRow].GIdx;
      if (TV = 0) then
      begin
        PostMessage(Form1.Handle, MyMessage1, 0, 0);
        (Sender as TOvcTCGlyphEdit).Value := TV;
      end else
      begin
        PostMessage(Form1.Handle, MyMessage2, 0, 0);
        (Sender as TOvcTCGlyphEdit).Value := TV
      end;
      InvalidateRow(ActiveRow);
    finally
      AllowRedraw := True;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I : integer;
begin
  OvcTable1.AllowRedraw := False;
  try
    for I := 1 to High(MyArray) do
      MyArray[I].GIdx := random(2);
    OvcTable1.InvalidateTable;
  finally
    OvcTable1.AllowRedraw := True;
  end;
end;

end.
