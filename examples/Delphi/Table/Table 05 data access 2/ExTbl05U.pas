{$J+} {Writable constants}

{Example program that shows how to access current setting of a TOvcTCCheckBox}
{in a TOvcTable and modify other check boxes according to the setting of the first}

{Note that due to the random settings of the data when the project first starts}
{that the first time you click on the first check box in any given row may or}
{may not change the settings of the other two - this is to be expected. A "real"}
{program would have to provide proper synchronization on start up}



unit ExTbl05U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCBmp, OvcTCGly, OvcTCBox, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCEdt,
  OvcBase, OvcTable, StdCtrls;


type
  MyDataRecord = record
    TF1     : Boolean;
    TF2     : Boolean;
    TF3     : Boolean;
  end;


  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    TblCB1: TOvcTCCheckBox;
    TblCB2: TOvcTCCheckBox;
    TblCB3: TOvcTCCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure TblCB1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MyData : array [1..9] of MyDataRecord;


implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  Randomize;
  for I := 1 to 9 do
  with MyData[I] do
  begin
    TF1 := Random(2) = 1;
    TF2 := Random(2) = 1;
    TF3 := Random(2) = 1;
  end;
end;

procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum < 10) then
  begin
    case ColNum of
       1 : Data := @MyData[RowNum].TF1;
       2 : Data := @MyData[RowNum].TF2;
       3 : Data := @MyData[RowNum].TF3;
    end;
  end;
end;

procedure TForm1.TblCB1Click(Sender: TObject);
var
  V : TCheckBoxState;
begin
  V := TCheckBoxState((Sender as TOvcTCGlyphEdit).value);
  with OvcTable1 do
  begin
    AllowRedraw := False;
    MyData[ActiveRow].TF2 := not (V = cbChecked);
    MyData[ActiveRow].TF3 := not (V = cbChecked);
    InvalidateRow(ActiveRow);
    AllowRedraw := True;
  end;

end;

end.

