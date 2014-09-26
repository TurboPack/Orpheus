{$J+} {Writable constants}

unit Exnbku;
    
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcNbk, OvcBase, OvcEf, OvcSf,
  OvcCal, OvcPb, OvcPf, OvcNf, OvcMisc, OvcSc, OvcData, ExtCtrls, Buttons,
  OvcTimer, OvcDate;

type
  TForm1 = class(TForm)
    btnTabPos: TButton;
    btnShadowText: TButton;
    Label1: TLabel;
    btnChangeTab: TButton;
    btnFontColor: TButton;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    btnFontSel: TButton;
    NB1: TOvcNotebook;
    OvcSimpleField1: TOvcSimpleField;
    OvcNotebook2: TOvcNotebook;
    OvcCalendar1: TOvcCalendar;
    Label3: TLabel;
    OvcPictureField1: TOvcPictureField;
    btnCalDate: TButton;
    OvcSimpleField2: TOvcSimpleField;
    OvcPictureField2: TOvcPictureField;
    OvcNumericField1: TOvcNumericField;
    Label4: TLabel;
    Label5: TLabel;
    btnTabDisable: TButton;
    OvcSimpleField3: TOvcSimpleField;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label6: TLabel;
    OvcFourWaySpinner2: TOvcSpinner;
    Panel1: TPanel;
    btnClose: TBitBtn;
    OvcController1: TOvcController;
    OvcSpinner1: TOvcSpinner;
    procedure btnTabPosClick(Sender: TObject);
    procedure btnShadowTextClick(Sender: TObject);
    procedure btnChangeTabClick(Sender: TObject);
    procedure btnFontColorClick(Sender: TObject);
    procedure btnFontSelClick(Sender: TObject);
    procedure btnCalDateClick(Sender: TObject);
    procedure OvcCalendar1Change(Sender: TObject; Date: TDateTime);
    procedure btnTabDisableClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NB1PageChanged(Sender: TObject; Index: Integer);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.btnTabPosClick(Sender: TObject);
begin
  with NB1 do
    if TabOrientation = toRight then
      TabOrientation := toTop
    else
      TabOrientation := toRight;
end;

procedure TForm1.btnShadowTextClick(Sender: TObject);
begin
  with NB1 do
    ShadowedText := not ShadowedText;
end;

procedure TForm1.btnChangeTabClick(Sender: TObject);
begin
  NB1.PageIndex := OvcSimpleField1.AsInteger;
end;

procedure TForm1.btnFontColorClick(Sender: TObject);
begin
  ColorDialog1.Color := NB1.Font.Color;
  ColorDialog1.Execute;
  NB1.Font.Color := ColorDialog1.Color;
end;

procedure TForm1.btnFontSelClick(Sender: TObject);
begin
  FontDialog1.Font := NB1.Font;
  FontDialog1.Execute;
  NB1.Font := FontDialog1.Font;
end;

procedure TForm1.btnCalDateClick(Sender: TObject);
begin
  {second page (index 1) contains the calendar}
  NB1.PageIndex := 1;
  {change the calendar date}
  OvcCalendar1.CalendarDate := OvcPictureField1.AsDateTime;
end;

procedure TForm1.OvcCalendar1Change(Sender: TObject; Date: TDateTime);
begin
  Panel1.Caption := OvcCalendar1.DateString('www, dd nnn yyyy');
end;

procedure TForm1.btnTabDisableClick(Sender: TObject);
begin
  with NB1 do
    Pages[3].Enabled := not Pages[3].Enabled;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Buf : array[0..255] of Char;
begin
  OvcSimpleField1.AsInteger := Form1.NB1.PageIndex;
  OvcCalendar1.CalendarDate := CurrentDate;
  {set picture mask to correspond with the control panel settings}
  OvcPictureField1.PictureMask :=
    StrPas(OvcCalendar1.IntlSupport.InternationalDatePChar(Buf, True));
  OvcPictureField1.AsOvcDate := CurrentDate;
  OvcSimpleField2.AsString := 'Simple Field Editor';
  OvcPictureField2.AsString := 'Picture Field Editor';
  OvcNumericField1.AsFloat := 32768.90;
end;

procedure TForm1.NB1PageChanged(Sender: TObject; Index: Integer);
begin
  OvcSimpleField1.AsInteger := Index;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
