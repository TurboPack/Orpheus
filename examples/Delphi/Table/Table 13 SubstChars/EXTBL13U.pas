unit extbl13u;

interface

uses
  WinProcs, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,
  OvcBase, OvcTable, OvcUser, OvcData, OvcTCBEF, OvcTCPic, OvcPF, ovctchdr,
  ovctcmmn, ovctcell, ovctcstr;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    PF1: TOvcTCPictureField;
    Memo1: TMemo;
    OvcTCColHead: TOvcTCColHead;
    OvcTCRowHead: TOvcTCRowHead;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    UserData : TOvcUserData;
    MyData: array[1..10] of Double;
  end;

var
  Form1: TForm1;


implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  { We want to use 'Mio' as literal characters in TOvcTCPicturefield. As 'M' and 'i'
    are special characters in the picturemask, we need to use TOvcUserData: }
  UserData := TOvcUserdata.Create;
  UserData.SubstChars[Subst1] := 'M';  // -> Use 'ñ' (<Alt>+(Num)0241) in the picturemask
                                       //    to display 'M'
  UserData.SubstChars[Subst2] := 'i';  // -> Use 'ò' (<Alt>+(Num)0242) in the picturemask
                                       //    to display 'i'.

  PF1.UserData := UserData;
  // It does not work to assign UserData to the CellEditor's UserData-property: This
  // will affect the internal editor-component used to *edit* the data but not the one
  // used to *display* the data:
  // (PF1.CellEditor as TOvcTCPictureFieldEdit).UserData := UserData;

  { Initialize data }
  for i := Low(Mydata) to High(MyData) do
    MyData[i] := i;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum>=Low(Mydata)) and (RowNum<=High(MyData)) and (ColNum=1) then
    Data := @MyData[RowNum];
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UserData.Free;
end;

end.

