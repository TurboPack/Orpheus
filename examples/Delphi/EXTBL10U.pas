{$J+} {Writable constants}

unit Extbl10u;

interface

uses
  WinProcs, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCEdt, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCHdr, OvcBase, OvcTable,

  Buttons, StdCtrls;


const
  BITMAP_1 = 10001;
  BITMAP_2 = 10002;

type
  MyArrayRecord = record
    S1 : string;
    S2 : array[0..50] of Char;
    S3 : string[50];
  end;

  TForm1 = class(TForm)
    Memo1: TMemo;
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCColHead1: TOvcTCColHead;
    OvcTCString1: TOvcTCString;
    OvcTCString2: TOvcTCString;
    OvcTCString3: TOvcTCString;
    OvcTCRowHead1: TOvcTCRowHead;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTCColHead1OwnerDraw(Sender: TObject; TableCanvas: TCanvas;
      const CellRect: TRect; RowNum: Longint; ColNum: Integer;
      const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
    procedure OvcTable1LockedCellClick(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    { array holding the tables data }
    MyArray : array[1..9] of MyArrayRecord;
    { "active" column }
    DownColNum : TColNum;

    InactiveBMP,
    ActiveBMP    : TBitmap;

    procedure SortRecords(Col : Integer);
  end;

var
  Form1: TForm1;


implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J : integer;
begin
  { Fill MyArray with random data.
    As we are dealing with three different kinds of strings, the code is slightly different
    for S1, S2 and S3 }
  Randomize;
  for I := 1 to 9 do begin
    { Set the string's length }
    SetLength(MyArray[I].S1,10);
    MyArray[I].S2[10] := #0;
    MyArray[I].S3[0] := #10;
    { Fill the strings with characters }
    for J := 1 to 10 do begin
      MyArray[I].S1[J]   := Chr(Ord('A') + Random(26));
      MyArray[I].S2[J-1] := Chr(Ord('A') + Random(26));
      MyArray[I].S3[J]   := AnsiChar(Ord('A') + Random(26));
    end;
  end;

  DownColNum := -1;

  InactiveBMP := TBitmap.Create;
  ActiveBMP := TBitmap.Create;

{$IFDEF WIN32}
  InactiveBMP.LoadFromResourceID(HInstance, BITMAP_1);
  ActiveBMP.LoadFromResourceID(HInstance, BITMAP_2);
{$ELSE}
  InactiveBMP.Handle := LoadBitmap(HInstance, MAKEINTRESOURCE(BITMAP_1));
  ActiveBMP.Handle := LoadBitmap(HInstance, MAKEINTRESOURCE(BITMAP_2));
{$ENDIF}
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(InactiveBMP) then
    InactiveBMP.Free;
  if Assigned(ActiveBMP) then
    ActiveBMP.Free;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  { provide the data for the table.
    It is crucial to match TOvcTCString.DataStringType to the kind of data provided here.
    - MyArray[RowNum].S1 is a string, so the component 'OvcTCString1' which is used for
      ColNum=1 must have DataStringType=tstString.
    - MyArray[RowNum].S2 is an array of Char (containing a zero-terminated string), so the
      component 'OvcTCString2' which is used for ColNum=2 must have DataStringType=tstPChar.
    - MyArray[RowNum].S3 is a ShortString, so the component 'OvcTCString3' which is used for
      ColNum=3 must have DataStringType=tstShortString. }
  Data := nil;
  if (RowNum > 0) and (RowNum <= High(MyArray)) then
    case ColNum of
      1 : Data := @MyArray[RowNum].S1;
      2 : Data := @MyArray[RowNum].S2;
      3 : Data := @MyArray[RowNum].S3;
    end;
end;


procedure TForm1.OvcTCColHead1OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  DRect : TRect;
  SRect : TRect;
begin
  { Use the OwnerDraw-event to create a custom header }
  if RowNum = 0 then begin
    { Draw a ButtonFace }
    DrawButtonFace(TableCanvas, CellRect, 2, bsAutoDetect, False, DownColNum=ColNum, False);

    if ColNum>0 then begin
      TableCanvas.Font.Color := clBlack;
      DRect := Rect(CellRect.Right-24, CellRect.Top+4,
                    CellRect.Right-8, CellRect.Top+20);
      SRect := Rect(0,0,16,16);
      { add text and graphics for columns 1..3 }
      if DownColNum=ColNum then begin
        TableCanvas.TextOut(CellRect.Left+10, CellRect.Top+10, 'Active');
        TableCanvas.BrushCopy(DRect, ActiveBMP, SRect, clSilver);
      end else begin
        TableCanvas.TextOut(CellRect.Left+10, CellRect.Top+10, 'Inactive');
        TableCanvas.BrushCopy(DRect, InactiveBMP, SRect, clSilver);
      end;
    end;
    DoneIt := True;
  end;
end;


procedure TForm1.OvcTable1LockedCellClick(Sender: TObject; RowNum: Longint; ColNum: Integer);
var
  C: Integer;
begin
  { Sort the data and repaint the table when the user clicks on a column's head }
  if RowNum <> 0 then Exit;

  { Save the ColNum }
  DownColNum := ColNum;

  OvcTable1.AllowRedraw := False;

  { Sort the data }
  if DownColNum>0 then
    SortRecords(DownColNum);
  { Set the column's color }
  for C := 1 to OvcTable1.ColCount-1 do begin
    if C=DownColNum then
      (OvcTable1.Columns[C].DefaultCell as TOvcTCString).Color := clRed
    else
      (OvcTable1.Columns[C].DefaultCell as TOvcTCString).Color := clSilver;
  end;

  { Force repainting the table }
  OvcTable1.InvalidateTable;
  OvcTable1.AllowRedraw := True;
end;


procedure TForm1.SortRecords(Col : Integer);
var
  I, J : Integer;
  swap: Boolean;
  TR  : MyArrayRecord;
begin
  { Sort MyArray using a simple sorting-algorithm }
  for I := 1 to High(MyArray)-1 do begin
    for J := I+1 to High(MyArray) do begin
      case Col of
        1 :  swap := CompareText(MyArray[J].S1, MyArray[I].S1) < 0;
        2 :  swap := CompareText(MyArray[J].S2, MyArray[I].S2) < 0;
        else swap := CompareText(string(MyArray[J].S3), string(MyArray[I].S3)) < 0;
      end;
      if swap then begin
        TR := MyArray[I];
        MyArray[I] := MyArray[J];
        MyArray[J] := TR;
      end;
    end;
  end;
end;

end.

