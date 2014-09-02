{$J+} {Writable constants}

unit Filview2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TFileAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FileAbout: TFileAbout;

implementation

{$R *.DFM}

procedure TFileAbout.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFileAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
