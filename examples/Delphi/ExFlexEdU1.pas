unit ExFlexEdU1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  O32Flxed, StdCtrls, O32EditF, Mask, OvcClrCb, O32Bordr, OvcBase, ovccmbx;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Label5: TLabel;
    Button2: TButton;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaxLengthLbl: TLabel;
    WordWrapCB: TCheckBox;
    WantReturnsCB: TCheckBox;
    WantTabsCB: TCheckBox;
    MaxLinesEdit: TEdit;
    DefLinesEdit: TEdit;
    FocusedLinesEdit: TEdit;
    MOLinesEdit: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BorderStyleCombo: TComboBox;
    GroupBox3: TGroupBox;
    BottomCB: TCheckBox;
    TopCB: TCheckBox;
    RightCB: TCheckBox;
    LeftCB: TCheckBox;
    JustificationCombo: TComboBox;
    BordersOnCB: TCheckBox;
    CBShowButton: TCheckBox;
    FlatColorCombo: TOvcColorComboBox;
    ColorCombo: TOvcColorComboBox;
    O32FlexEdit1: TO32FlexEdit;
    procedure FormCreate(Sender: TObject);
    procedure DefLinesEditChange(Sender: TObject);
    procedure FocusedLinesEditChange(Sender: TObject);
    procedure MOLinesEditChange(Sender: TObject);
    procedure WordWrapCBClick(Sender: TObject);
    procedure WantReturnsCBClick(Sender: TObject);
    procedure WantTabsCBClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MaxLinesEditChange(Sender: TObject);
    procedure BottomCBClick(Sender: TObject);
    procedure TopCBClick(Sender: TObject);
    procedure RightCBClick(Sender: TObject);
    procedure LeftCBClick(Sender: TObject);
    procedure ColorComboChange(Sender: TObject);
    procedure FlatColorComboChange(Sender: TObject);
    procedure BorderStyleComboChange(Sender: TObject);
    procedure JustificationComboChange(Sender: TObject);
    procedure BordersOnCBClick(Sender: TObject);
    procedure CBShowButtonClick(Sender: TObject);
    procedure FlexEdit1ButtonClick(Sender: TO32CustomFlexEdit;
      PopupPoint: TPoint);
    procedure FlexEdit1UserValidation(Sender: TObject;
      var ValidEntry: Boolean);
    procedure FlexEdit1ValidationError(Sender: TObject; ErrorCode: Word;
      ErrorMsg: String);
    procedure FlexEdit1AfterValidation(Sender: TObject);
    procedure FlexEdit1BeforeValidation(Sender: TObject);
  private { Private declarations }
  public { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  O32FlexEdit1.Color := clSilver;

  O32FlexEdit1.Text := 'TurboPower Software Company' + #13#10
    + '15 North Nevada Avenue' + #13#10
    + 'Colorado Springs, Colorado 80903-1708' + #13#10
    + 'Sales: (719) 471-3898' + #13#10
    + 'Support: (719) 471-9446';

  WordWrapCB.Checked := O32FlexEdit1.WordWrap;
  WantReturnsCB.Checked := O32FlexEdit1.WantReturns;
  WantTabsCB.Checked := O32FlexEdit1.WantTabs;

  MaxLinesEdit.Text := IntToStr(O32FlexEdit1.EditLines.MaxLines);
  DefLinesEdit.Text := IntToStr(O32FlexEdit1.EditLines.DefaultLines);
  FocusedLinesEdit.Text := IntToStr(O32FlexEdit1.EditLines.FocusedLines);
  MOLinesEdit.Text := IntToStr(O32FlexEdit1.EditLines.MouseOverLines);

  MaxLengthLbl.Caption := 'Max Length = ' + IntToStr(O32FlexEdit1.MaxLength);

  if O32FlexEdit1.Borders.BorderStyle = bstyFlat then
    BorderStyleCombo.Text := 'Flat';
  if O32FlexEdit1.Borders.BorderStyle = bstyLowered then
    BorderStyleCombo.Text := 'Lowered';
  if O32FlexEdit1.Borders.BorderStyle = bstyNone then
    BorderStyleCombo.Text := 'None';
  if O32FlexEdit1.Borders.BorderStyle = bstyRaised then
    BorderStyleCombo.Text := 'Raised';
  if O32FlexEdit1.Borders.BorderStyle = bstyRidge then
    BorderStyleCombo.Text := 'Ridge';
  if O32FlexEdit1.Borders.BorderStyle = bstyChannel then
    BorderStyleCombo.Text := 'Channel';

  if O32FlexEdit1.Alignment = taRightJustify then
    JustificationCombo.Text := 'Right Justify';
  if O32FlexEdit1.Alignment = taLeftJustify then
    JustificationCombo.Text := 'Left Justify';

  FlatColorCombo.SelectedColor := O32FlexEdit1.Borders.FlatColor;
  ColorCombo.SelectedColor := O32FlexEdit1.Color;
  BordersOnCB.Checked := O32FlexEdit1.Borders.Active;
  LeftCB.Checked := O32FlexEdit1.Borders.BorderSet.ShowLeft;
  RightCB.Checked := O32FlexEdit1.Borders.BorderSet.ShowRight;
  TopCB.Checked := O32FlexEdit1.Borders.BorderSet.ShowTop;
  BottomCB.Checked := O32FlexEdit1.Borders.BorderSet.ShowBottom;

  CBShowButton.Checked := O32FlexEdit1.ShowButton;
end;

procedure TMainForm.DefLinesEditChange(Sender: TObject);
begin
  O32FlexEdit1.EditLines.DefaultLines := StrToIntDef(DefLinesEdit.Text, 1);
end;

procedure TMainForm.FocusedLinesEditChange(Sender: TObject);
begin
  O32FlexEdit1.EditLines.FocusedLines := StrToIntDef(FocusedLinesEdit.Text, 3);
end;

procedure TMainForm.MOLinesEditChange(Sender: TObject);
begin
  O32FlexEdit1.EditLines.MouseOverLines := StrToIntDef(MOLinesEdit.Text, 3);
end;

procedure TMainForm.WordWrapCBClick(Sender: TObject);
begin
  O32FlexEdit1.WordWrap := WordWrapCB.Checked;
end;

procedure TMainForm.WantReturnsCBClick(Sender: TObject);
begin
  O32FlexEdit1.WantReturns := WantReturnsCB.Checked;
end;

procedure TMainForm.WantTabsCBClick(Sender: TObject);
begin
  O32FlexEdit1.WantTabs := WantTabsCB.Checked;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  O32FlexEdit1.Clear;
  O32FlexEdit1.Text := Memo1.Text;
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
 Memo1.Clear;
 Memo1.Text := O32FlexEdit1.Text;
end;

procedure TMainForm.MaxLinesEditChange(Sender: TObject);
begin
  O32FlexEdit1.EditLines.MaxLines := StrToIntDef(MaxLinesEdit.Text, 3);
end;

procedure TMainForm.BottomCBClick(Sender: TObject);
begin
  O32FlexEdit1.Borders.BorderSet.ShowBottom := BottomCB.Checked;
end;

procedure TMainForm.TopCBClick(Sender: TObject);
begin
  O32FlexEdit1.Borders.BorderSet.ShowTop := TopCB.Checked;
end;

procedure TMainForm.RightCBClick(Sender: TObject);
begin
  O32FlexEdit1.Borders.BorderSet.ShowRight := RightCB.Checked;
end;

procedure TMainForm.LeftCBClick(Sender: TObject);
begin
  O32FlexEdit1.Borders.BorderSet.ShowLeft := LeftCB.Checked;
end;

procedure TMainForm.ColorComboChange(Sender: TObject);
begin
  O32FlexEdit1.Color := ColorCombo.SelectedColor;
end;

procedure TMainForm.FlatColorComboChange(Sender: TObject);
begin
  O32FlexEdit1.Borders.FlatColor := FlatColorCombo.SelectedColor;
end;

procedure TMainForm.BorderStyleComboChange(Sender: TObject);
begin
  if BorderStyleCombo.Text = 'Flat' then
    O32FlexEdit1.Borders.BorderStyle := bstyFlat;
  if BorderStyleCombo.Text = 'Channel' then
    O32FlexEdit1.Borders.BorderStyle := bstyChannel;
  if BorderStyleCombo.Text = 'Lowered' then
    O32FlexEdit1.Borders.BorderStyle := bstyLowered;
  if BorderStyleCombo.Text = 'None' then
    O32FlexEdit1.Borders.BorderStyle := bstyNone;
  if BorderStyleCombo.Text = 'Raised' then
    O32FlexEdit1.Borders.BorderStyle := bstyRaised;
  if BorderStyleCombo.Text = 'Ridge' then
    O32FlexEdit1.Borders.BorderStyle := bstyRidge;
end;

procedure TMainForm.JustificationComboChange(Sender: TObject);
begin
  if JustificationCombo.Text = 'Right' then
    O32FlexEdit1.Alignment := taRightJustify
  else
    O32FlexEdit1.Alignment := taLeftJustify;
end;

procedure TMainForm.BordersOnCBClick(Sender: TObject);
begin
  O32FlexEdit1.Borders.Active := BordersOnCB.Checked;
end;

procedure TMainForm.CBShowButtonClick(Sender: TObject);
begin
  O32FlexEdit1.ShowButton := CBShowButton.Checked;
end;

procedure TMainForm.FlexEdit1ButtonClick(Sender: TO32CustomFlexEdit;
  PopupPoint: TPoint);
begin
  ShowMessage('The Following text was found in your FlexEdit...'#13#13#10
    + O32FlexEdit1.Text);
end;

procedure TMainForm.FlexEdit1UserValidation(Sender: TObject;
  var ValidEntry: Boolean);
begin
  ShowMessage('On User Validation');
end;

procedure TMainForm.FlexEdit1ValidationError(Sender: TObject; ErrorCode: Word;
  ErrorMsg: String);
begin
  ShowMessage('On Validation Error');
end;

procedure TMainForm.FlexEdit1AfterValidation(Sender: TObject);
begin
  ShowMessage('After Validation');
end;

procedure TMainForm.FlexEdit1BeforeValidation(Sender: TObject);
begin
  ShowMessage('Before Validation');
end;


end.
