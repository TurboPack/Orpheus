{$J+} {Writable constants}

unit ExEdODu;

interface

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, OvcBase, OvcViewr, OvcEditU, OvcEdit, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    OvcController1: TOvcController;
    OvcTextFileEditor1: TOvcTextFileEditor;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    procedure OvcTextFileEditor1DrawLine(Sender: TObject;
      EditorCanvas: TCanvas; Rect: TRect; S: PChar; Len, Line, Pos, Count,
      HBLine, HBCol, HELine, HECol: Integer; var WasDrawn: Boolean);
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

procedure TForm1.OvcTextFileEditor1DrawLine(Sender: TObject;
  EditorCanvas: TCanvas; Rect: TRect; S: PChar; Len, Line, Pos, Count,
  HBLine, HBCol, HELine, HECol: Integer; var WasDrawn: Boolean);
var
  SC  : TColor;
  L   : Integer;
  Buf : array[0..1024] of Char;
begin
  if Len <= 0 then
    Exit;

  if Odd(Line) then begin
    WasDrawn := True;

    StrLCopy(Buf, @S[Pos], 1024);
    L := StrLen(Buf);
    if Count < L then
      L := Count;

    SC := EditorCanvas.Font.Color;
    EditorCanvas.Font.Color := clRed;
    ExtTextOut(EditorCanvas.Handle, Rect.Left, Rect.Top+1,
      ETO_CLIPPED or ETO_OPAQUE, @Rect, @Buf, L, nil);
    {restore font color}
    EditorCanvas.Font.Color := SC;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
