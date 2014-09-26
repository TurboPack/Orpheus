{$J+} {Writable constants}

unit Exnbhntu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcNbk, StdCtrls;

type
  TForm1 = class(TForm)
    NB1: TOvcNotebook;
    OvcController1: TOvcController;
    Memo1: TMemo;
    procedure NB1MouseOverTab(Sender: TObject; Index: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CurIndex : Integer;
    OverTab  : Boolean;

    procedure DoShowHint(var HintStr: string; var CanShow: Boolean;
                         var HintInfo: THintInfo);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.NB1MouseOverTab(Sender: TObject; Index: Integer);
begin
  CurIndex := Index;

  {If over a tab, set global flag to True}
  OverTab := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Application.OnShowHint := DoShowHint;
end;


procedure TForm1.DoShowHint(var HintStr: string; var CanShow: Boolean;
   var HintInfo: THintInfo);
var
  R : TRect;
  P : TPoint;
  VOffSet : Integer;
begin
  with HintInfo do begin
    if HintControl = NB1 then begin
      R := NB1.GetTabRect(CurIndex);
      CursorRect := R;
      P.X := R.Left;
      P.Y := R.Top;

      P := ClientToScreen(P);

      HintPos.X := P.X + 20;
      VOffSet := (R.Bottom - R.Top) * 3 div 2;
      HintPos.Y := P.Y + VOffSet;

      HintStr := NB1.Pages[CurIndex].Hint;
    end;
  end;

  {Show hint only if over a tab}
  CanShow := OverTab;

  {Force global flag False so hint is not shown unless over a tab}
  OverTab := False;
end;


end.

