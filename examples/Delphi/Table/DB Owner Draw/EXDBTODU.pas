{$J+} {Writable constants}

unit Exdbtodu;

{This example shows how to use OnOwnerDraw to change the colors of individual}
{cells in the TOvcDbTable. This is a *very* simplified example. Note that the}
{colors of the cell when editing is set using the properties set within in the}
{object inspector (or programmatically)}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DB, DBTables, OvcTCmmn, OvcTCell, OvcTCStr, OvcTCBEF,
  OvcTCSim, OvcBase, OvcDbTbl;

type
  S24 = string;//[24];
  S14 = string;//[14];

  TForm1 = class(TForm)
    OvcDbTable1: TOvcDbTable;
    OvcController1: TOvcController;
    OvcTCSimpleField1: TOvcTCSimpleField;
    DataSource1: TDataSource;
    Table1: TTable;
    OvcTCSimpleField2: TOvcTCSimpleField;
    OvcTCSimpleField3: TOvcTCSimpleField;
    OvcTCSimpleField4: TOvcTCSimpleField;
    OvcTCSimpleField5: TOvcTCSimpleField;
    procedure OvcTCSimpleField1OwnerDraw(Sender: TObject;
      TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
      ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
    procedure OvcTCSimpleField2OwnerDraw(Sender: TObject;
      TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
      ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
    procedure OvcTCSimpleField3OwnerDraw(Sender: TObject;
      TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
      ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
    procedure OvcTCSimpleField4OwnerDraw(Sender: TObject;
      TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
      ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
    procedure OvcTCSimpleField5OwnerDraw(Sender: TObject;
      TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
      ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcTCSimpleField1OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  S : S24;
begin
  if (Table1.Fields[3].AsInteger < 1000000) then
  begin
    TableCanvas.Brush.Color := clRed;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clWhite;
  end else
  begin
    TableCanvas.Brush.Color := clWhite;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clBlack;
  end;
  TableCanvas.FillRect(CellRect);

  S := S24(Data^);
  TableCanvas.TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt := True;
end;

procedure TForm1.OvcTCSimpleField2OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  S : S24;
begin
  if (Table1.Fields[3].AsInteger < 1000000) then
  begin
    TableCanvas.Brush.Color := clRed;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clWhite;
  end else
  begin
    TableCanvas.Brush.Color := clWhite;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clBlack;
  end;
  TableCanvas.FillRect(CellRect);

  S := S24(Data^);
  TableCanvas.TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt := True;
end;

procedure TForm1.OvcTCSimpleField3OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  S : S24;
begin
  if (Table1.Fields[3].AsInteger < 1000000) then
  begin
    TableCanvas.Brush.Color := clRed;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clWhite;
  end else
  begin
    TableCanvas.Brush.Color := clWhite;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clBlack;
  end;
  TableCanvas.FillRect(CellRect);

  S := S24(Data^);
  TableCanvas.TextOut(CellRect.Left + 3, CellRect.Top+1, S);

  DoneIt := True;
end;

procedure TForm1.OvcTCSimpleField4OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  S : string;//[14];
  I : Integer;
begin
  if (Table1.Fields[3].AsInteger < 1000000) then
  begin
    TableCanvas.Brush.Color := clRed;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clWhite;
  end else
  begin
    TableCanvas.Brush.Color := clWhite;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clBlack;
  end;
  TableCanvas.FillRect(CellRect);

  S := FloatToStr(Extended(Data^));
  I := TableCanvas.TextWidth(S);
  I := (CellRect.Right - CellRect.Left) - I - 3;
  TableCanvas.TextOut(CellRect.Left + I, CellRect.Top+1, S);

  DoneIt := True;
end;

procedure TForm1.OvcTCSimpleField5OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  S : String;//[14];
  I : Integer;
begin
  if (Table1.Fields[3].AsInteger < 1000000) then
  begin
    TableCanvas.Brush.Color := clRed;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clWhite;
  end else
  begin
    TableCanvas.Brush.Color := clWhite;
    TableCanvas.Brush.Style := bsSolid;
    TableCanvas.Font.Color := clBlack;
  end;
  TableCanvas.FillRect(CellRect);

  S := FloatToStr(Extended(Data^));
  I := TableCanvas.TextWidth(S);
  I := (CellRect.Right - CellRect.Left) - I - 3;
  TableCanvas.TextOut(CellRect.Left + I, CellRect.Top+1, S);

  DoneIt := True;
end;

end.
