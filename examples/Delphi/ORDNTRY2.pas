{$J+} {Writable constants}

unit Ordntry2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TOrdAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrdAbout: TOrdAbout;

implementation

{$R *.DFM}


procedure TOrdAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
