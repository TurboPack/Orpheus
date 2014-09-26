{$J+} {Writable constants}

unit ExDbEFu;

interface

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables,  ExtCtrls,
  OvcNF, OvcDbNF, OvcPB, OvcPF, OvcDbPF,
  OvcBase, OvcEF, OvcSF, OvcDbSF, DBCtrls, OvcRLbl, OvcDbDLb;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    OvcController1: TOvcController;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    OvcDbSimpleField1: TOvcDbSimpleField;
    OvcDbPictureField1: TOvcDbPictureField;
    OvcDbNumericField1: TOvcDbNumericField;
    OvcDbPictureField2: TOvcDbPictureField;
    OvcDbDisplayLabel1: TOvcDbDisplayLabel;
    OvcDbDisplayLabel2: TOvcDbDisplayLabel;
    OvcDbDisplayLabel3: TOvcDbDisplayLabel;
    OvcDbSimpleField2: TOvcDbSimpleField;
    OvcDbDisplayLabel4: TOvcDbDisplayLabel;
    OvcDbDisplayLabel5: TOvcDbDisplayLabel;
    OvcDbPictureField3: TOvcDbPictureField;
    OvcDbDisplayLabel6: TOvcDbDisplayLabel;
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
