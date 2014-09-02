{$J+} {Writable constants}

unit Exefu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcNf, OvcPb, OvcPf, OvcBase, OvcEf, OvcSf,
  OvcMisc, OvcSc, OvcIntl, ExtCtrls, Buttons, OvcData, IniFiles, OvcDate;

type
  TForm1 = class(TForm)
    NF1: TOvcNumericField;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    OvcFourWaySpinner1: TOvcSpinner;
    PF1: TOvcPictureField;
    OvcSpinner1: TOvcSpinner;
    BitBtn1: TBitBtn;
    OvcController1: TOvcController;
    SF1: TOvcSimpleField;
    Label9: TLabel;
    PF2: TOvcPictureField;
    OvcFourWaySpinner2: TOvcSpinner;
    Label10: TLabel;
    Label8: TLabel;
    procedure SF1Change(Sender: TObject);
    procedure PF1Change(Sender: TObject);
    procedure PF2Change(Sender: TObject);
    procedure NF1Change(Sender: TObject);
    procedure OvcController1Error(Sender: TObject; ErrorCode: Word;
      const ErrorMessage: string);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure WinIniChange(Sender: TObject);
    procedure SetPictureMasks;
    procedure ShowCountry;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.SF1Change(Sender: TObject);
begin
  Label2.Caption := SF1.AsString;
end;

procedure TForm1.PF1Change(Sender: TObject);
begin
  Label4.Caption := PF1.AsString;
end;

procedure TForm1.PF2Change(Sender: TObject);
begin
  Label6.Caption := PF2.AsString;
end;

procedure TForm1.NF1Change(Sender: TObject);
begin
  Label9.Caption := NF1.AsString;
end;

procedure TForm1.OvcController1Error(Sender: TObject; ErrorCode: Word;
  const ErrorMessage : string);
begin
  MessageDlg(ErrorMessage, mtError, [mbOK], 0);
end;

procedure TForm1.SetPictureMasks;
begin
  {set picture mask to correspond to the new win.ini settings}
  PF1.PictureMask := OvcIntlSup.InternationalDate(True);
  Label3.Caption := PF1.PictureMask;
  PF2.PictureMask := OvcIntlSup.InternationalTime(True);
  Label10.Caption := PF2.PictureMask;
  NF1.PictureMask := OvcIntlSup.InternationalCurrency('#', 7, True, True, True);
  Label5.Caption := NF1.PictureMask;

  {adjust max length to match new picture mask length}
  PF1.MaxLength := Length(PF1.PictureMask);
  PF2.MaxLength := Length(PF2.PictureMask);

end;

procedure TForm1.ShowCountry;
begin
  with TIniFile.Create('WIN.INI') do
    try
      Label8.Caption := 'Country: ' + ReadString('Intl', 'sCountry', 'Unknown');
    finally
      Free;
    end;
end;

procedure TForm1.WinIniChange(Sender: TObject);
var
  D : TOvcDate;
  T : TOvcTime;
  R : Real;
begin
  {save current values}
  D := PF1.AsOvcDate;
  T := PF2.AsOvcTime;
  R := NF1.AsFloat;

  OvcIntlSup.ResetInternationalInfo;                                
  SetPictureMasks;

  {restore values}
  PF1.AsOvcDate := D;
  PF2.AsOvcTime := T;
  NF1.AsFloat := R;

  ShowCountry;

  PF1Change(Sender);
  PF2Change(Sender);
  NF1Change(Sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OvcIntlSup.AutoUpdate := True;
  OvcIntlSup.OnWinIniChange := WinIniChange;;

  SF1.AsString := 'Orpheus';
  SetPictureMasks;
  {assign intial values}
  PF1.AsOvcDate := CurrentDate;
  PF2.AsOvcTime := CurrentTime;
  NF1.AsFloat := 13.13;

  Label2.Caption := SF1.AsString;
  Label4.Caption := PF1.AsString;
  Label6.Caption := PF2.AsString;
  Label9.Caption := NF1.AsString;

  {show the current country from WIN.INI}
  ShowCountry;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
