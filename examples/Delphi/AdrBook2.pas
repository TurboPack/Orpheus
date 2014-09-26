{$J+} {Writable constants}

unit Adrbook2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons;

type
  TAdrAbout = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AdrAbout: TAdrAbout;

implementation

{$R *.DFM}

end.
