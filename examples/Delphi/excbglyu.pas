{$J+} {Writable constants}

{$I OVC.INC}

unit excbglyu;

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ovcvlb, OvcCkLb, OvcLB,
  {$IFDEF VERSION4} ImgList, {$ENDIF}
  {$IFNDEF Win32} OvcImLst, {$ENDIF}
  OvcBase;

type
  TForm1 = class(TForm)
    OvcCheckList1: TOvcCheckList;
    Memo1: TMemo;
    OvcController1: TOvcController;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    MyBitmaps : array[0..4] of TBitmap;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  ImageList1.ResourceLoad(rtBitmap, 'CBGLY', clFuchsia);
  {the image list can be filled at design-time}
  {it's done this way here to allow the example to work with}
  {all versions of Delphi}

  for I := 0 to ImageList1.Count-1 do
    {tell the listbox which glyph to use for each item}
    OvcCheckList1.GlyphIndex[I] := I;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I : Integer;
begin
  for I := 0 to 4 do
    MyBitmaps[I].Free;
end;

end.
