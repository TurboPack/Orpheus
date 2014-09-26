{$J+} {Writable constants}

unit ExTbl09U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCBmp, OvcTCGly, OvcTCBox, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCEdt,
  OvcBase, OvcTable, StdCtrls, OvcUser, OvcData, OvcTCBEF, OvcTCPic, OvcPF;

const
  MyMessage1 = WM_USER + 1;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    PF1: TOvcTCPictureField;
    Memo1: TMemo;
    PF2: TOvcTCPictureField;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  Form1: TForm1;
  MyData : array [1..2,1..9] of string;
  MyUserData : TOvcUserData;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I, J : Integer;
begin
  MyUserData := TOvcUserData.Create;
  MyUserData.UserCharSet[pmUser1] := ['A'..'C', '0'..'9'];

  Randomize;
  for I := 1 to 9 do begin
    SetLength(Mydata[1,I], 10);
    for J := 1 to 5 do
      Mydata[1,I][J] := Chr(Ord('A') + (I - 1) mod 3);
    for J := 6 to 10 do
      Mydata[1,I][J] := IntToStr(I)[1];
    Mydata[2,I] := Mydata[1,I];
  end;

  { The old method was to set the CellEditor's UserData-property - which can be done
    here, because the CellEditor ist created when PF1 is created.
    However, it is not possible to set the display-editor's UserData-property this
    way (this is not important here). }
  (PF1.CellEditor as TOvcPictureField).UserData := MyUserData;

  { The new method to use 'TOvcUserData' in a table-cell ist to simply use it's (new)
    property 'UserData'. Internally, Userdata is "forwarded" to both the cell-editor
    and the display-editor.
    This was implemented in rev233 (06/2011). }
  PF2.UserData := MyUserData;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum < 10) and (ColNum>0) and (Colnum<3) then
    Data := @MyData[ColNum,RowNum];
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MyUserData.Free;
end;

end.

