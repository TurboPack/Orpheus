{$J+} {Writable constants}

unit ExClok1U;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OvcBase, OvcClock;

type
  TForm1 = class(TForm)
    OrController1: TOvcController;
    OrClock1: TOvcClock;
    OrClock2: TOvcClock;
    OrClock3: TOvcClock;
    OrClock4: TOvcClock;
    OrClock5: TOvcClock;
    OrClock6: TOvcClock;
    OrClock7: TOvcClock;
    OrClock8: TOvcClock;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
  Bias : Integer;
begin
  try
    Bias := StrToInt(Edit1.Text);
  except
    Exit;
  end;
  OrClock1.TimeOffset := OrClock1.TimeOffset - Bias;
  OrClock2.TimeOffset := OrClock2.TimeOffset - Bias;
  OrClock3.TimeOffset := OrClock3.TimeOffset - Bias;
  OrClock4.TimeOffset := OrClock4.TimeOffset - Bias;
  OrClock5.TimeOffset := OrClock5.TimeOffset - Bias;
  OrClock6.TimeOffset := OrClock6.TimeOffset - Bias;
  OrClock7.TimeOffset := OrClock7.TimeOffset - Bias;
  OrClock8.TimeOffset := OrClock8.TimeOffset - Bias;
  Button1.Enabled := False;
end;

end.
