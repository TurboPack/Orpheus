
unit ExRvDir1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OvcRptVw;

type
  TOvcRvPOptions = class(TForm)
    chkScaleColumns: TCheckBox;
    Label1: TLabel;
    edtCM: TEdit;
    chkPrintGrid: TCheckBox;
    edtLM: TEdit;
    edtRM: TEdit;
    edtTM: TEdit;
    edtBM: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbxMeasure: TRadioGroup;
    Bevel1: TBevel;
    edtLW: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure cbxMeasureClick(Sender: TObject);
    procedure edtLMExit(Sender: TObject);
    procedure chkScaleColumnsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure Transfer(ToScreen: Boolean);
    function TwipsToCurrent(T: Integer): string;
    function CurrentToTwips(const S: string): Integer;
    { Private declarations }
  public
    { Public declarations }
    LM, RM, TM, BM, CM, LW: Integer;
    ScaleColumns, ShowGrid: Boolean;
    procedure LoadValues(const SourceView: TOvcCustomReportView);
    procedure SaveValues(const SourceView: TOvcCustomReportView);
  end;


implementation

{$R *.DFM}

function TwipsToPoints(T: Integer): double;
begin
  Result := T / 20;
end;

function TwipsToInches(T: Integer): double;
begin
  Result := T / 1440;
end;

function TwipsToCMs(T: Integer): double;
begin
  Result := TwipsToInches(T) * 2.54;
end;

function PointsToTwips(P: double): Integer;
begin
  Result := round(P * 20);
end;

function InchesToTwips(I: double): Integer;
begin
  Result := round(I * 1440);
end;

function CMsTOTwips(C: double): Integer;
begin
  Result := InchesToTwips(C / 2.54);
end;

function TOvcRvPOptions.TwipsToCurrent(T: Integer): string;
begin
  case cbxMeasure.ItemIndex of
  0 : // twips
    Result := IntToStr(T);
  1 : // inches
    Result := FloatToStrF(TwipsToInches(T), ffFixed, 6, 3);
  2 : // CMs
    Result := FloatToStrF(TwipsToCMs(T), ffFixed, 5, 2);
  else//3 : // points
    Result := FloatToStrF(TwipsToPoints(T), ffFixed, 4, 1);
  end;
end;

function TOvcRvPOptions.CurrentToTwips(const S: string): Integer;
begin
  case cbxMeasure.ItemIndex of
  0 : // twips
    Result := StrToInt(S);
  1 : // inches
    Result := InchesToTwips(StrToFloat(S));
  2 : // CMs
    Result := CMsToTwips(StrToFloat(S));
  else//3 : // Points
    Result := PointsToTwips(StrToFloat(S));
  end;
end;

procedure TOvcRvPOptions.LoadValues(const SourceView: TOvcCustomReportView);
begin
  LM := SourceView.PrinterProperties.MarginLeft;
  TM := SourceView.PrinterProperties.MarginTop;
  RM := SourceView.PrinterProperties.MarginRight;
  BM := SourceView.PrinterProperties.MarginBottom;
  CM := SourceView.PrinterProperties.PrintColumnMargin;
  LW := SourceView.PrinterProperties.PrintLineWidth;
  ScaleColumns := SourceView.PrinterProperties.AutoScaleColumns;
  ShowGrid := SourceView.PrinterProperties.PrintGridLines;
  Transfer(True);
end;

procedure TOvcRvPOptions.SaveValues(const SourceView: TOvcCustomReportView);
begin
  SourceView.PrinterProperties.MarginLeft := LM;
  SourceView.PrinterProperties.MarginTop := TM;
  SourceView.PrinterProperties.MarginRight := RM;
  SourceView.PrinterProperties.MarginBottom :=BM;
  SourceView.PrinterProperties.PrintColumnMargin := CM;
  SourceView.PrinterProperties.PrintLineWidth := LW;
  SourceView.PrinterProperties.AutoScaleColumns := ScaleColumns;
  SourceView.PrinterProperties.PrintGridLines := ShowGrid;
end;

procedure TOvcRvPOptions.Transfer(ToScreen: Boolean);
begin
  if ToScreen then begin
    edtLM.Text := TwipsToCurrent(LM);
    edtTM.Text := TwipsToCurrent(TM);
    edtRM.Text := TwipsToCurrent(RM);
    edtBM.Text := TwipsToCurrent(BM);
    edtCM.Text := TwipsToCurrent(CM);
    edtLW.Text := TwipsToCurrent(LW);
    chkScaleColumns.Checked := ScaleColumns;
    chkPrintGrid.Checked := ShowGrid;
  end else begin
    LM := CurrentToTwips(edtLM.Text);
    TM := CurrentToTwips(edtTM.Text);
    RM := CurrentToTwips(edtRM.Text);
    BM := CurrentToTwips(edtBM.Text);
    CM := CurrentToTwips(edtCM.Text);
    LW := CurrentToTwips(edtLW.Text);
    ScaleColumns := chkScaleColumns.Checked;
    ShowGrid := chkPrintGrid.Checked;
  end;
end;


procedure TOvcRvPOptions.cbxMeasureClick(Sender: TObject);
begin
  Transfer(True);
end;

procedure TOvcRvPOptions.edtLMExit(Sender: TObject);
begin
  Transfer(False);
end;

procedure TOvcRvPOptions.chkScaleColumnsClick(Sender: TObject);
begin
  Transfer(False);
end;

procedure TOvcRvPOptions.Button1Click(Sender: TObject);
begin
  Transfer(False); //will raise an exception in case of errors
  ModalResult := mrOK;
end;

end.
