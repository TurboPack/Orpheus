{$J+} {Writable constants}

unit ExDlgU;

interface

uses
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables,
  OvcBase, OvcCal, OvcCalc, OvcDlg, 
  OvcMoDg, OvcDbADg, OvcSplDg, OvcClkDg,
  OvcClcDg, OvcDbMDg, OvcCalDg;

type
  TForm2 = class(TForm)
    OvcCalendarDialog1: TOvcCalendarDialog;
    OvcDbMemoDialog1: TOvcDbMemoDialog;
    Button1: TButton;
    OvcCalculatorDialog1: TOvcCalculatorDialog;
    Button2: TButton;
    OrController1: TOvcController;
    Button3: TButton;
    OvcClockDialog1: TOvcClockDialog;
    DataSource1: TDataSource;
    Table1: TTable;
    Button4: TButton;
    Button5: TButton;
    OvcMemoDialog1: TOvcMemoDialog;
    Label1: TLabel;
    Memo1: TMemo;
    Button6: TButton;
    OvcDbAliasDialog1: TOvcDbAliasDialog;
    Button7: TButton;
    OvcSplashDialog1: TOvcSplashDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure OvcDbMemoDialog1HelpClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure OvcSplashDialog1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelectedDate : TDateTime;
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormCreate(Sender: TObject);
begin
  SelectedDate := Now;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  {initialize calendar date}
  OvcCalendarDialog1.Calendar.Date := Now;
  {show dialog and retrieve date if OK pressed}
  if OvcCalendarDialog1.Execute then begin
    SelectedDate := OvcCalendarDialog1.Calendar.Date;
    Button1.Caption := DateToStr(OvcCalendarDialog1.Calendar.Date);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if OvcCalculatorDialog1.Execute then
    Button2.Caption := FloatToStr(OvcCalculatorDialog1.Calculator.DisplayValue);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  OvcClockDialog1.Clock.DrawMarks := False;
  OvcClockDialog1.Execute;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if OvcDbMemoDialog1.Execute then begin
    {memo field in database has been updated}
  end;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  OvcMemoDialog1.Lines.Assign(Memo1.Lines);
  if OvcMemoDialog1.Execute then begin
    {transfer memo data}
    Memo1.Lines.Assign(OvcMemoDialog1.Lines);
  end;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  {initialize the stating alias} 
  OvcDbAliasDialog1.AliasName := 'DBDEMOS';
  if OvcDbAliasDialog1.Execute then begin
    {do something with alias, table, path}
    Button6.Caption := OvcDbAliasDialog1.TableName;
  end;
end;

procedure TForm2.OvcDbMemoDialog1HelpClick(Sender: TObject);
begin
  ShowMessage('Help button was clicked');
end;


procedure TForm2.Button7Click(Sender: TObject);
begin
  if not OvcSplashDialog1.Visible then
    OvcSplashDialog1.Show
  else
    OvcSplashDialog1.Close;
end;

procedure TForm2.OvcSplashDialog1Click(Sender: TObject);
begin
  OvcSplashDialog1.Close;
end;

end.
