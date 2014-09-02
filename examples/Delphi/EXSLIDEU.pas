{$J+} {Writable constants}

unit ExSlideU;

interface

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, ExtCtrls, OvcDbSld, OvcBase, OvcSlide, DB,
  DBTables;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    OvcSlider1: TOvcSlider;
    OvcSlider2: TOvcSlider;
    OvcDbSlider1: TOvcDbSlider;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    OvcSlider3: TOvcSlider;
    OvcSlider1Label1: TOvcAttachedLabel;
    OvcSlider3Label1: TOvcAttachedLabel;
    OvcDbSlider1Label1: TOvcAttachedLabel;
    OvcSlider4: TOvcSlider;
    OvcSlider4Label1: TOvcAttachedLabel;
    OvcSlider5: TOvcSlider;
    OvcSlider5Label1: TOvcAttachedLabel;
    OvcSlider6: TOvcSlider;
    procedure OvcSlider2Change(Sender: TObject);
    procedure OvcSlider1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcSlider2Change(Sender: TObject);
begin
  OvcSlider1.Position := OvcSlider2.Position;
end;

procedure TForm1.OvcSlider1Change(Sender: TObject);
begin
  OvcSlider2.Position := OvcSlider1.Position;
end;

end.
