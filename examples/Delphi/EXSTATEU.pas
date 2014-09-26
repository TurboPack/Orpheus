{$J+} {Writable constants}

unit ExStateU;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcState, OvcBase, OvcFiler, OvcStore, StdCtrls;

type
  TForm1 = class(TForm)
    OvcFormState1: TOvcFormState;
    OvcComponentState1: TOvcComponentState;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    OvcIniFileStore1: TOvcIniFileStore;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
