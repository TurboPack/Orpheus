{$J+} {Writable constants}

{Example program shows how to access data in the TOvcTCComboBox while editing}
{and updating other columns based on the selection. In this case, a glyph in}
{column 1 is changed according to the selection while the string in column 3}
{is the item chosen in the combo box}

unit ExTbl04U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCStr, OvcTCCBx, OvcTCmmn, OvcTCell, OvcTCBmp, OvcTCGly, OvcBase,
  OvcTable, StdCtrls, OvcTCEdt;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCGlyph1: TOvcTCGlyph;
    OvcTCComboBox1: TOvcTCComboBox;
    OvcTCString1: TOvcTCString;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTCComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  MyRec = record
    GIdx : Integer;
    CIdx : Integer;
    CStr : string;
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
    with MyArray[I] do
    begin
      CIdx := (I-1) mod 3;
      if CIdx = 0 then
        GIdx := 1
      else
        GIdx := 0;
      CStr := Chr(Random(26) + Ord('A'));
    end;
end;

procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (rownum in [1..9]) then
  begin
    case colnum of
      1 : Data := @myarray[rownum].GIdx;
      2 : Data := @myarray[rownum].CIdx;
      3 : Data := @myarray[rownum].CStr;
    end;
  end;
end;

procedure TForm1.OvcTCComboBox1Change(Sender: TObject);
var
  I : Integer;
  TCB : TComboBox;
begin
  with ovctable1 do
  begin
    TCB := TComboBox(Sender as TCustomComboBox);
    I := TCB.ItemIndex;
    if (I = 0) then
      MyArray[ActiveRow].GIdx := 1
    else
      MyArray[ActiveRow].GIdx := 0;
    MyArray[ActiveRow].CStr := TCB.Items[I];

    AllowRedraw := False;
    InvalidateCell(ActiveRow, 1);
    InvalidateCell(ActiveRow, 3);
    AllowRedraw := True;
  end;

end;

end.
