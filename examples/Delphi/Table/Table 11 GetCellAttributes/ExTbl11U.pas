{$J+} {Writable constants}

unit ExTbl11U;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcEf, OvcPb, OvcPf, OvcTCPic, OvcTCBEF, OvcTCHdr,
  OvcTCmmn, OvcTable, OvcTCStr, OvcTCEdt, OvcBase, StdCtrls, Buttons,
  OvcTCell;

type
  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    OvcTCString1: TOvcTCString;
    OvcTCString2: TOvcTCString;
    OvcTCRowHead1: TOvcTCRowHead;
    OvcTCPictureField1: TOvcTCPictureField;
    BitBtn1: TBitBtn;
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
    procedure OvcTable1GetCellAttributes(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var CellAttr: TOvcCellAttributes);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
type
  TTestRec = record
    Name  : string;
    Age   : word;
  end;
  TTestDataBase = array [1..9] of TTestRec;
const
  TestDatabase : TTestDataBase = (
    (Name:'DelRossi, Robert'; Age:36),
    (Name:'Blanton, Phillip'; Age:33),
    (Name:'Reisdorph, Kent';  Age:25),
    (Name:'Welch, Mike';      Age:31),
    (Name:'Frerking, Gary';   Age:27),
    (Name:'Jones, Zack';      Age:35),
    (Name:'Bucknall, Julian'; Age:38),
    (Name:'';                 Age:0),
    (Name:'';                 Age:0));
const
  ColHeading : string = '';
begin
  Data := nil;
  if (1 <= RowNum) and (RowNum <= 9) then
    begin
      case ColNum of
        1 : Data := @TestDatabase[RowNum].Name;
        2 : Data := @TestDatabase[RowNum].Age;
      end;{case}
    end
  else
    begin
      case ColNum of
        0 : ColHeading := 'TP';
        1 : ColHeading := 'Name';
        2 : ColHeading := 'Age';
      end;{case}
      Data := @ColHeading;
    end;
end;

procedure TForm1.OvcTable1GetCellAttributes(Sender: TObject;
  RowNum: Longint; ColNum: Integer; var CellAttr: TOvcCellAttributes);
begin
  if (RowNum = 0) and (ColNum = 2) then
    CellAttr.caAdjust := otaCenterRight;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
