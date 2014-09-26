{$J+} {Writable constants}

{Example showing how to work with data used by the table outside the table's}
{usual method. In this case, the data accessed by a TOvcTCTMemo is always}
{displayed in lower case but stored in the data structure in upper case. This}
{could be expanded to access a memo field in a database and store the changed}
{data back to the database. The PictureField accesses a numeric value but }
{displays and edits the data as a string. When the data is placed back to the}
{data structure, it is converted back to a numeric value. This principle might}
{be expanded to allow custom picture mask editing, data conversion, etc.}

unit ExTbl17U;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCBEF, OvcTCPic,
  OvcBase, OvcTable, OvcTCEdt, StdCtrls, Vcl.ComCtrls, ovctcedtHTMLText;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCMemo1: TOvcTCMemo;
    Button1: TButton;
    OvcTCPictureField1: TOvcTCPictureField;
    OvcTCHTMLText1: TOvcTCHTMLText;
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1DoneEdit(Sender: TObject; RowNum: Longint;
      ColNum: Integer);
    procedure Button1Click(Sender: TObject);
  public
    { Public declarations }
    function LoStrBuf(var SB : string) : string;
    procedure UpStrBuf(var SB : string; Row : TRowNum);

    function String2GroupNr(S : string) : Longword;
    function GroupNr2String(N : Longword) : string;
  end;

var
  Form1: TForm1;
  MyMemos : array[1..9] of string;
  ABuf : string;

  MyWords : array[1..9] of Longword;
  AString : string;

implementation

{$R *.DFM}

function TForm1.LoStrBuf(var SB : string) : string;
begin
  SB := AnsiLowerCase(SB);
  Result := SB;
end;

procedure TForm1.UpStrBuf(var SB : string; Row : TRowNum);
begin
  SB := AnsiUpperCase(SB);
  MyMemos[Row] := SB;
end;


function TForm1.String2GroupNr(S : string) : Longword;
var
  w1, w2 : Longword;
  s1: string;
begin
  s1 := Trim(Copy(S, 1, 2));
  if s1='' then
    w1 := 0
  else
    w1 := StrToInt(s1);
  s1 := Trim(Copy(S, 4, 4));
  if s1='' then
    w2 := 0
  else
    w2 := StrToInt(s1);
  Result := (w1 shl 14) + w2;
end;

function TForm1.GroupNr2String(N : Longword) : string;
var
  S1, S2 : string;
begin
  S1 := IntToStr((N and $FFFFc000) shr 14);
  while (Length(S1) < 2) do
    S1 := ' ' + S1;
  S2 := IntToStr(N and $00003FFF);
  while (Length(S2) < 4) do
    S2 := '0' + S2;
  Result := S1 + '/' + S2;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum < 10) then
  begin
    case ColNum of
      1 : begin
            if (Purpose <> cdpForSave) then
            begin
              ABuf := MyMemos[RowNum];
//              ABuf := LoStrBuf(ABuf);
            end;
            Data := @ABuf;
          end;

      2 : begin
            if (Purpose <> cdpForSave) then
              AString := GroupNr2String(MyWords[RowNum]);
            Data := @AString;
          end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  I : integer;
begin
  for I := 1 to 9 do
  begin
    MyWords[I] := I;
    if ((I mod  2) = 0) then
      MyMemos[I] := 'a'
    else
      MyMemos[I] := 'A';
  end;
end;

procedure TForm1.OvcTable1DoneEdit(Sender: TObject; RowNum: Longint;
  ColNum: Integer);
begin
  if ColNum = 1 then
    //UpStrBuf(ABuf, RowNum);
    MyMemos[RowNum] := ABuf;
  if ColNum = 2 then
    MyWords[RowNum] := String2GroupNr(AString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with OvcTable1 do
    ShowMessage(MyMemos[ActiveRow]);
end;

end.
