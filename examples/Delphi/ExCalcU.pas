{$J+} {Writable constants}

unit ExCalcU;

interface      

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Printers,
  ExtCtrls, OvcBase, OvcEdPop, OvcCalc, Buttons, OvcEdClc, OvcEditF;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    ResultLbl: TLabel;
    OrController1: TOvcController;
    Calculator: TOvcCalculator;
    OrNumberEdit1: TOvcNumberEdit;
    DecimalRadioGroup: TRadioGroup;
    Panel1: TPanel;
    Panel2: TPanel;
    PrintSpeedButton: TSpeedButton;
    SeparatePercentSpeedButton: TSpeedButton;
    cbFixedEntry: TCheckBox;
    Button1: TButton;
    cbShowTape: TCheckBox;
    cbSeparate: TCheckBox;
    procedure CalculatorButtonPressed(Sender: TObject;
      Button: TOvcCalculatorButton);
    procedure PrintSpeedButtonClick(Sender: TObject);
    procedure DecimalRadioGroupClick(Sender: TObject);
    procedure ClearTapeSpeedButtonClick(Sender: TObject);
    procedure cbFixedEntryClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbShowTapeClick(Sender: TObject);
    procedure cbSeparateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.CalculatorButtonPressed(Sender: TObject;
  Button: TOvcCalculatorButton);
begin
  if Button = cbEqual then
    ResultLbl.Caption := FloatToStr(Calculator.DisplayValue);
end;

procedure TForm1.PrintSpeedButtonClick(Sender: TObject);
var
  PrnFile : TextFile;
  I : Integer;
begin
  AssignPrn(Prnfile);
  Printers.Printer.Canvas.Font.Name := 'Courier New';
  Printers.Printer.Canvas.Font.Size := 10;
  ReWrite(PrnFile);
  with Calculator.Tape do begin
    for I := 0 to Count - 1 do begin
      if I = 0 then
        Writeln(PrnFile, Strings[I])
      else if (Strings[I] <> '') or (Strings[I-1] <> '') then
        Writeln(PrnFile, Strings[I]);
    end;
  end;
  CloseFile(PrnFile);
end;

procedure TForm1.DecimalRadioGroupClick(Sender: TObject);
var
  Decimals : Integer;
begin
  case DecimalRadioGroup.ItemIndex of
    0 : Decimals := 0;
    1 : Decimals := 1;
    2 : Decimals := 2;
    3 : Decimals := 3;
    else
      raise Exception.Create('Illegal Radio Button Click');
  end;
  if cbFixedEntry.Checked then
    Calculator.Decimals := -Decimals
  else
    Calculator.Decimals := Decimals;
end;

procedure TForm1.ClearTapeSpeedButtonClick(Sender: TObject);
var
  I : Integer;
begin
  with Calculator.Tape do begin
    for I := 0 to Count - 1 do begin
      Strings[I] := '';
    end;
  end;
end;

procedure TForm1.cbFixedEntryClick(Sender: TObject);
begin
  DecimalRadioGroupClick(Sender);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.cbShowTapeClick(Sender: TObject);
begin
  if cbShowTape.Checked then
    Calculator.Options := Calculator.Options + [coShowTape]
  else
    Calculator.Options := Calculator.Options - [coShowTape];
end;

procedure TForm1.cbSeparateClick(Sender: TObject);
begin
  with Calculator do begin
    if cbSeparate.Checked then
      Options := Options + [coShowSeparatePercent]
    else
      Options := Options - [coShowSeparatePercent];
  end;
end;

end.
