{$J+} {Writable constants}

unit Extblhnt;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcTCmmn, OvcTable, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    OvcTable: TOvcTable;
    OvcController1: TOvcController;
    Timer: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure OvcTableMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

var
  Region: TOvcTblRegion;
  RowNum: TRowNum;
  ColNum: TColNum;
  HintWindow : THintWindow;

procedure TForm1.OvcTableMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  NewRow: TRowNum;
  NewCol: TColNum;
begin
  Region := OvcTable.CalcRowColFromXY(X, Y, NewRow, NewCol);
  if (Region = otrInMain) then begin
    if ((NewRow <> RowNum) or (NewCol <> ColNum)) then begin
     RowNum := NewRow;
     ColNum := NewCol;
     HintWindow.ReleaseHandle;
     Timer.Enabled := True;
    end;
  end else
    HintWindow.ReleaseHandle;
end;

procedure TForm1.TimerTimer(Sender: TObject);
var
  P : TPoint;
begin
  if (Region = otrInMain) then begin
    P := OvcTable.ClientToScreen(Point(OvcTable.ColOffset[ColNum],
                                       OvcTable.RowOffset[RowNum]));
    HintWindow.ActivateHint(Rect(P.X, P.Y , P.X+20, P.Y+20),
                            IntToStr(10*RowNum + ColNum));
  end;
  Timer.Enabled := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HintWindow := THintWindow.Create(Form1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  HintWindow.Free;
end;

end.
