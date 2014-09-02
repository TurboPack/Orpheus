unit Exabtn2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, OvcBase, OvcCal, StdCtrls, Buttons, OvcEF,
  OvcData, OvcSF, Menus, OvcSc;

type
  TfrmCal = class(TForm)
    Calendar: TOvcCalendar;
    OvcController1: TOvcController;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure CalendarDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCal: TfrmCal;

implementation

{$R *.DFM}

procedure TfrmCal.CalendarDblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F1,                                                             {!!.01}
    VK_RETURN,
    VK_ESCAPE,
    VK_NONE,
    VK_SHIFT,
    VK_CONTROL,
    VK_ALT,
    VK_CAPITAL,
    VK_NUMLOCK,
    VK_SCROLL,
    VK_UP,
    VK_DOWN,
    VK_LEFT,
    VK_RIGHT,
    VK_HOME,
    VK_END,
    VK_PRIOR,
    VK_NEXT,
    VK_SPACE,
    VK_TAB : {};
  else
    ModalResult := mrCancel;
  end;
end;

end.
