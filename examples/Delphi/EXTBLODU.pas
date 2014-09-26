{$J+} {Writable constants}

unit ExTblODu;
  {-example showing owner-draw cells}

interface

uses
  WinTypes, WinProcs, StdCtrls, Buttons, Classes,
  Controls, Forms, Graphics, SysUtils,
  OvcBase, OvcTCmmn, OvcTable, OvcTCHdr,
  OvcTCell, OvcTCStr, OvcTCEdt;

type
  TForm1 = class(TForm)
    TBL: TOvcTable;
    OvcController1: TOvcController;
    OvcTCString1: TOvcTCString;
    OvcTCRowHead1: TOvcTCRowHead;
    OvcTCColHead1: TOvcTCColHead;
    BitBtn1: TBitBtn;
    procedure TBLGetCellData1(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
    procedure OvcTCString1OwnerDraw(Sender: TObject; TableCanvas: TCanvas;
      const CellRect: TRect; RowNum: Longint; ColNum: Integer;
      const CellAttr: TOvcCellAttributes; Data: Pointer;
      var DoneIt: Boolean);
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
const
  S : string[10] = 'Test';

procedure TForm1.TBLGetCellData1(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  Data := @S;
end;

procedure TForm1.OvcTCString1OwnerDraw(Sender: TObject;
  TableCanvas: TCanvas; const CellRect: TRect; RowNum: Longint;
  ColNum: Integer; const CellAttr: TOvcCellAttributes; Data: Pointer;
  var DoneIt: Boolean);
var
  F   : Boolean;
  R   : TRect;
  C   : TCanvas;
  Buf : array[0..255] of Char;
begin
  DoneIt := True;
  
  R := CellRect;
  C := TableCanvas;

  {paint background}
  C.Brush.Style := bsClear;
  C.Pen.Color := clBtnFace;
  C.Rectangle(R.Left, R.Top, R.Right, R.Bottom);

  {draw button}
  F := (RowNum=TBL.ActiveRow) and (ColNum=TBL.ActiveCol);
  DrawButtonFace(C, R, 1, bsNew, True, F, F);

  {draw data}
  if Odd(RowNum) then
    C.Font.Color := clRed
  else
    C.Font.Color := clBlack;
  StrPLCopy(Buf, Format('%d:%d', [RowNum, ColNum]), 255);
  DrawText(C.Handle, Buf, StrLen(Buf), R, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
