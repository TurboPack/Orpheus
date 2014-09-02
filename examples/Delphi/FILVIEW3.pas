{$J+} {Writable constants}

unit Filview3;

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
    CheckBox2: TCheckBox;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FindDlg: TFindDlg;

implementation

{$R *.DFM}

procedure TFindDlg.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFindDlg.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFindDlg.FormActivate(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
