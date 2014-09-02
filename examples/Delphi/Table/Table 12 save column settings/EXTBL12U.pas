{$J+} {Writable constants}

unit Extbl12u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCBmp, OvcTCGly, OvcTCBox, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCEdt,
  OvcBase, OvcTable, StdCtrls, OVCDATE, OvcTCBEF, OvcTCPic,  IniFiles;


type
  MyDataRecord = record
    TF1  : Boolean;
    TF2  : String;//[10];
    TF3  : TStTime;
  end;

  TheTablesCells = (OvcCB1, OvcSF1, OvcPF1);

  TForm1 = class(TForm)
    OvcTable1: TOvcTable;
    OvcController1: TOvcController;
    CB1: TOvcTCCheckBox;
    SF1: TOvcTCString;
    Button1: TButton;
    PF1: TOvcTCPictureField;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure CB1Click(Sender: TObject);
    procedure OvcTable1Exit(Sender: TObject);
    procedure OvcTable1ColumnsChanged(Sender: TObject; ColNum1,
      ColNum2: Integer; Action: TOvcTblActions);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniF : TIniFile;
  end;

var
  Form1: TForm1;
  MyData : array [1..9] of MyDataRecord;
  ColToFieldMap : array [1..3] of TColNum;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  I,
  W,
  P : Integer;
  S : string;
begin
  Randomize;
  for I := 1 to 9 do
  with MyData[I] do
  begin
    TF1 := False;
    TF2 := 'False';
    TF3 := Random(30000);
  end;

  if FileExists(ChangeFileExt(Application.ExeName, '.ini')) then begin
    IniF := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini')); // extbl12.ini
    try
      for I := 1 to 3 do begin
        with IniF do begin
          S := ReadString('Column' + IntToStr(I), 'DefaultCell', '');
          if S = 'CB1' then
            OvcTable1.Columns[I].DefaultCell := CB1
          else if S = 'SF1' then
            OvcTable1.Columns[I].DefaultCell := SF1
          else if S = 'PF1' then
            OvcTable1.Columns[I].DefaultCell := PF1;

          W := ReadInteger('Column' + IntToStr(I), 'Width', 60);
          OvcTable1.Columns[I].Width := W;

          P := ReadInteger('Column' + IntToStr(I), 'Design Position', I);
          ColToFieldMap[I] := P;
        end;
      end;
    finally
      IniF.Free;
    end;
  end else begin
    OvcTable1.Columns[1].DefaultCell := CB1;
    OvcTable1.Columns[2].DefaultCell := SF1;
    OvcTable1.Columns[3].DefaultCell := PF1;
    for I := 1 to 3 do
      ColToFieldMap[I] := I;
  end;
end;


procedure TForm1.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := nil;
  if (RowNum > 0) and (RowNum < 10) then
  begin
    case ColToFieldMap[ColNum] of
       1 : Data := @MyData[RowNum].TF1;
       2 : Data := @MyData[RowNum].TF2;
       3 : Data := @MyData[RowNum].TF3;
    end;
  end;
end;

procedure TForm1.CB1Click(Sender: TObject);
var
  V : TCheckBoxState;
begin
  V := TCheckBoxState((Sender as TOvcTCGlyphEdit).value);
  with OvcTable1 do
  begin
    AllowRedraw := False;
    if (V = cbChecked) then
      MyData[ActiveRow].TF2 := 'True'
    else
      MyData[ActiveRow].TF2 := 'False';
    InvalidateRow(ActiveRow);
    AllowRedraw := True;
  end;

end;

procedure TForm1.OvcTable1Exit(Sender: TObject);
begin
  if OvcTable1.InEditingState then
    OvcTable1.StopEditingState(True);
end;


procedure TForm1.OvcTable1ColumnsChanged(Sender: TObject; ColNum1,
  ColNum2: Integer; Action: TOvcTblActions);
var
  Temp : TColNum;
begin
  {for a column exchange, update the column-to-field mapping}
  if (Action = taExchange) then begin
    Temp := ColToFieldMap[ColNum1];
    ColToFieldMap[ColNum1] := ColToFieldMap[ColNum2];
    ColToFieldMap[ColNum2] := Temp;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I,
  P  : Integer;
  S  : string;

begin
  P := 0;
  IniF := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
  try
    for I := 1 to 3 do begin
      case ColToFieldMap[I] of
        1 : begin
              S := 'CB1';
              P := 1;
            end;
        2 : begin
              S := 'SF1';
              P := 2;
            end;
        3 : begin
              S := 'PF1';
              P := 3;
            end;
      end;
      with IniF do begin
        WriteString('Column' + IntToStr(I), 'DefaultCell', S);
        WriteInteger('Column' + IntToStr(I), 'Width', OvcTable1.Columns[I].Width);
        WriteInteger('Column' + IntToStr(I), 'Design Position', P);
      end;
    end;
  finally
    IniF.Free;
  end;
end;

end.

