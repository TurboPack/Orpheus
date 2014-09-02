{$J+} {Writable constants}

unit ExDbAEu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Buttons, StdCtrls,
  OvcBase, DB, DBTables, OvcDbAE, ExtCtrls, DBCtrls, OvcRLbl, OvcDbDLb;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    OvcController1: TOvcController;
    DBNavigator1: TDBNavigator;
    OvcDbSimpleArrayEditor1: TOvcDbSimpleArrayEditor;
    OvcDbPictureArrayEditor1: TOvcDbPictureArrayEditor;
    OvcDbNumericArrayEditor1: TOvcDbNumericArrayEditor;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    OvcDbDisplayLabel1: TOvcDbDisplayLabel;
    OvcDbDisplayLabel2: TOvcDbDisplayLabel;
    OvcDbDisplayLabel3: TOvcDbDisplayLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
