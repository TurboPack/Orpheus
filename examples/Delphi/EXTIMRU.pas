{$J+} {Writable constants}


{Timer pool example}

unit Extimru;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcEf, OvcSf, OvcTimer, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    TT: TOvcTimerPool;
    F1: TOvcSimpleField;
    F2: TOvcSimpleField;
    F3: TOvcSimpleField;
    LB: TListBox;
    L1: TLabel;
    L2: TLabel;
    btnAddTrigger: TButton;
    btnAddLots: TButton;
    btnAddOnetime: TButton;
    btnRemoveAllTriggers: TButton;
    btnClear: TButton;
    btnRemoveTrigg: TButton;
    BitBtn1: TBitBtn;
    OvcController1: TOvcController;
    procedure btnAddTriggerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TTTrigger(Sender: TObject; Handle: Integer;
      Interval: Cardinal; ElapsedTime: LongInt);
    procedure btnAddLotsClick(Sender: TObject);
    procedure btnAddOnetimeClick(Sender: TObject);
    procedure btnRemoveAllTriggersClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnRemoveTriggClick(Sender: TObject);
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

procedure TForm1.btnAddTriggerClick(Sender: TObject);
begin
  TT.Add(nil, F1.AsInteger);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  F1.AsInteger := 2000;
  F2.AsInteger := 2000;
  F3.AsInteger := 0;
end;

procedure TForm1.TTTrigger(Sender: TObject; Handle: Integer;
  Interval: Cardinal; ElapsedTime: LongInt);
var
  S : Real;
begin
  S := ElapsedTime / 1000;
  LB.Items.Add(Format('%3d: Interval: %5d  Elapsed: %0.2f Sec',
              [Handle, Interval, S]));
  if LB.Items.Count > 200 then
    LB.Items.Delete(0);
  LB.ItemIndex := LB.Items.Count-1;
end;

procedure TForm1.btnAddLotsClick(Sender: TObject);
var
  I : Integer;
begin
  for I := 1 to 50 do
    TT.Add(nil, Random(10000) + 500);
end;

procedure TForm1.btnAddOnetimeClick(Sender: TObject);
begin
  TT.AddOneTime(nil, F2.AsInteger);
end;

procedure TForm1.btnRemoveAllTriggersClick(Sender: TObject);
begin
  TT.RemoveAll;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  LB.Clear;
end;

procedure TForm1.btnRemoveTriggClick(Sender: TObject);
begin
  TT.Remove(F3.AsInteger);
  F3.SetFocus;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
