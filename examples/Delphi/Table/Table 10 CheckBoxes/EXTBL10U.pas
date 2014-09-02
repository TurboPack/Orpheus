{$J+} {Writable constants}

unit Extbl10u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCEdt, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCHdr, OvcBase, OvcTable,
  Buttons, StdCtrls, ovctcbmp, ovctcgly, ovctcbox;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCColHead1: TOvcTCColHead;
    OvcTCCheckBox1: TOvcTCCheckBox;
    OvcTCCheckBox2: TOvcTCCheckBox;
    OvcTCCheckBox3: TOvcTCCheckBox;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTable1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  public
    { Public declarations }
    MyData : array[0..2,1..5] of Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  i, j : integer;
begin
  for i := 1 to 5 do
    for j := 0 to 2 do
      MyData[j,i] := (i+j) mod 2 = 0;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum <= High(MyData[1])) then
    Data := @MyData[ColNum,RowNum];
end;


procedure TForm1.OvcTable1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  RowNum, ColNum: Integer;
begin
  OvcTable1.CalcRowColFromXY(X,Y,RowNum,ColNum);
  if (RowNum > 0) and (RowNum <= High(MyData[1])) and (ColNum=2) then begin
    PostMessage(OvcTable1.Handle, ctim_StartEdit, 0, 0);
    PostMessage(OvcTable1.Handle, ctim_StartEditMouse, 0,  X+65536*Y);
  end;
end;

end.



