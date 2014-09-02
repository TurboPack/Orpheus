{$J+} {Writable constants}

unit Txtedit3;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFindDlg = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindDlg: TFindDlg;

implementation

{$R *.DFM}

procedure TFindDlg.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFindDlg.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
