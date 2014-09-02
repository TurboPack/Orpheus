{$J+} {Writable constants}

unit ExTbl08U;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCBEF, OvcTCSim, DB,
  DBTables, OvcBase, OvcTable, StdCtrls;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    Query1: TQuery;
    OvcTCSimpleField1: TOvcTCSimpleField;
    OvcTCSimpleField2: TOvcTCSimpleField;
    OvcTCSimpleField3: TOvcTCSimpleField;
    OvcTCSimpleField4: TOvcTCSimpleField;
    OvcTCSimpleField5: TOvcTCSimpleField;
    Memo1: TMemo;
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TotalRecs : LongInt;
  end;

var
  Form1: TForm1;
  GS : string;//[255];
  GI : LongInt;

implementation

{$R *.DFM}

procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
var
  FN : integer;
begin
  if not Query1.Active then Query1.Open;
  Data := nil;
  if (RowNum > 0) and (RowNum < TotalRecs) then
  begin
    Query1.First;
    Query1.MoveBy(RowNum-1);
    FN := ColNum-1;
    case ColNum of
      1..3 : begin
               GS := Query1.Fields[FN].AsString;
               Data := @GS;
             end;

      4..5 : begin
               GI := Query1.Fields[FN].AsInteger;
               Data := @GI;
             end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TotalRecs := Query1.RecordCount;
end;

end.
