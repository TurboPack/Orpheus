unit Table15Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ovctchdr, ovctcmmn, ovctcell, ovctcstr, ovctcbef, ovctcpic, ovcbase,
  ovctable, ovcuser, ovcdata;

type
  TForm12 = class(TForm)
    OvcTable1: TOvcTable;
    OvcTCPictureField1: TOvcTCPictureField;
    OvcTCPictureField2: TOvcTCPictureField;
    OvcTCColHead1: TOvcTCColHead;
    OvcTCRowHead1: TOvcTCRowHead;
    Memo1: TMemo;
    OvcTCPictureField3: TOvcTCPictureField;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum, ColNum: Integer; var Data: Pointer;
      Purpose: TOvcCellDataPurpose);
    procedure OvcTable1DoneEdit(Sender: TObject; RowNum, ColNum: Integer);
    procedure OvcTCPictureField1KeyPress(Sender: TObject; var Key: Char);
  private
    OvcUserData: TOvcUserdata;
    DataArray: array[1..3,1..9] of Double;
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

procedure TForm12.FormCreate(Sender: TObject);
var
  j: Integer;
begin
  { Use 'TOvcUserdata' to display 'Mio' in a PicturField }
  OvcUserData := TOvcUserdata.Create;
  OvcUserData.SubstChars[Subst1] := 'M';  // -> Use 'ñ' for 'M' in PictureMask
  OvcUserData.SubstChars[Subst2] := 'i';  // -> Use 'ò' for 'i' in PictureMask
  OvcTCPictureField1.UserData := OvcUserData;
  OvcTCPictureField2.UserData := OvcUserData;
  OvcTCPictureField3.UserData := OvcUserData;

  { Initialize Data }
  for j := 1 to 9 do begin
    DataArray[1,j] := 1/j;
    DataArray[2,j] := j/2000;
    DataArray[3,j] := j*Sqrt(j)*1000000.0;
  end;
end;

procedure TForm12.FormDestroy(Sender: TObject);
begin
  OvcUserData.Free;
end;


procedure TForm12.OvcTable1DoneEdit(Sender: TObject; RowNum, ColNum: Integer);
begin
  if (RowNum>=1) and (RowNum<=9) and (ColNum>=1) and (ColNum<=3) then
    { Show the value stored in 'DataArray' }
    Edit1.Text := Format('Value at %s%d is %g',
                         [Chr(Ord('A')+ColNum-1),RowNum,DataArray[ColNum,RowNum]])
  else
    Edit1.Text := '';
end;


procedure TForm12.OvcTable1GetCellData(Sender: TObject; RowNum, ColNum: Integer;
  var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  if (RowNum>=1) and (RowNum<=9) and (ColNum>=1) and (ColNum<=3) then
    Data := @DataArray[ColNum,RowNum]
  else
    Data := nil;
end;


procedure TForm12.OvcTCPictureField1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then OvcTable1.StopEditingState(True);
end;

end.

