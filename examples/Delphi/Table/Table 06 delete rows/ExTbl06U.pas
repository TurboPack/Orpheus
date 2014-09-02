{$J+} {Writable constants}

unit ExTbl06U;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCEdt,
  OvcBase, OvcTable, ovctchdr, OvcMisc;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCString1: TOvcTCString;
    Button1: TButton;
    OvcTCRowHead1: TOvcTCRowHead;
    OvcTCColHead1: TOvcTCColHead;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure Button1Click(Sender: TObject);
    procedure OvcTable1SizeCellEditor(Sender: TObject; RowNum, ColNum: Integer;
      var CellRect: TRect; var CellStyle: TOvcTblEditorStyle);
  public
    { Public declarations }
    HiIdx :   TRowNum;
    { It is possible to use a ShortString (e.g. string[10]) here; however, it is important
      to set OvcTCString1.DataStringType and OvcTCString1.MaxLength accordingly in the
      object-inspector. }
    MyArray : array[1..9] of string;

    procedure DeleteMyArray(Row : TRowNum);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  for I := 1 to High(MyArray) do
    MyArray[I] := Chr(Ord('A') + Random(26));
  HiIdx := High(MyArray);
end;

procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum <= HiIdx) and (ColNum = 1) then
    Data := @MyArray[RowNum];
end;

procedure TForm1.OvcTable1SizeCellEditor(Sender: TObject; RowNum, ColNum: Integer;
  var CellRect: TRect; var CellStyle: TOvcTblEditorStyle);
var
  d: Integer;
begin
  { Usually, the text being displayed and the text being edited are not aligned
    vertically: When you click on a cell to edit the string, the string "jumps"
    to the top of the cell.
    This can be changed using the SizeCellEditor-event. }
  if (RowNum>0) and (ColNum=1) then begin
    d := MaxI(0, CellRect.Bottom - CellRect.Top - OvcTable1.Canvas.TextHeight('X'));
    CellRect.Top := CellRect.Top + d div 2;
  end;
end;

procedure TForm1.DeleteMyArray(Row : TRowNum);
var
  I : LongInt;
begin
  if Row < HiIdx then
    for I := Row to HiIdx-1 do
      MyArray[I] := MyArray[I+1];
  MyArray[HiIdx] := '';
  Dec(HiIdx);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  AR : TRowNum;
begin
  with OvcTable1 do
  begin
    if (HiIdx = 1) then
    begin
      ShowMessage('Cannot delete all records');
      Exit;
    end;
    AR := ActiveRow;
    AllowRedraw := False;
    DeleteMyArray(ActiveRow);
    Rows.Delete(ActiveRow);
    AllowRedraw := True;

    if AR <= HiIdx then
      ActiveRow := AR
    else
      ActiveRow := HiIdx;
  end;
end;

end.
