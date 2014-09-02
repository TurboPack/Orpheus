{$J+} {Writable constants}

unit Exdbcbu;

interface

uses
  WinProcs, WinTypes, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcTCmmn, OvcTCell, OvcTCStr, OvcTCCBx, OvcBase, OvcDbTbl, DB, DBTables,
  ExtCtrls, DBCtrls, OvcTbCls, StdCtrls, OvcTCBEF, OvcTCSim;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    OvcDbTable1: TOvcDbTable;
    OvcController1: TOvcController;
    OvcTCComboBox1: TOvcTCComboBox;
    DataSource2: TDataSource;
    Table2: TTable;
    Table1NAME: TStringField;
    Table1SIZE: TSmallintField;
    DBNavigator1: TDBNavigator;
    Memo1: TMemo;
    OvcTCSimpleField1: TOvcTCSimpleField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Table2.First;
  while not (Table2.EOF) do begin
    OvcTCComboBox1.Items.Add(Table2.Fields[0].AsString);
    Table2.Next;
  end;
end;

end.
