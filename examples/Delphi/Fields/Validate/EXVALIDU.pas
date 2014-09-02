{$J+} {Writable constants}

unit Exvalidu;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcNf, OvcPb, OvcPf, OvcBase, OvcEf, OvcSf, StdCtrls,
  Buttons;

type
  TForm1 = class(TForm)
    OvcSimpleField1: TOvcSimpleField;
    DefaultController: TOvcController;
    OvcPictureField1: TOvcPictureField;
    OvcNumericField1: TOvcNumericField;
    Label1: TLabel;
    Label2: TLabel;
    BtnCancel: TBitBtn;
    BtnOK: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure DefaultControllerIsSpecialControl(Sender: TObject;
      Control: TWinControl; var Special: Boolean);
    procedure BtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.DefaultControllerIsSpecialControl(Sender: TObject;
  Control: TWinControl; var Special: Boolean);
begin
  Special := Control = btnCancel;
end;

procedure TForm1.BtnOKClick(Sender: TObject);
begin
  if Form1.DefaultController.ValidateEntryFields = nil then
    Close;
end;

end.
