{$J+} {Writable constants}

unit ExDrv0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, OvcBase, OvcRVIdx, OvcRptVw, OvcDRpVw, StdCtrls, ExtCtrls,
  OvcSplit, OvcCmbx, OvcRvCbx;

type
  TForm1 = class(TForm)
    OvcDataReportView1: TOvcDataReportView;
    OrController1: TOvcController;
    Panel1: TPanel;
    OvcViewComboBox1: TOvcViewComboBox;
    OvcSplitter1: TOvcSplitter;
    OvcDataReportView2: TOvcDataReportView;
    Panel2: TPanel;
    OvcViewComboBox2: TOvcViewComboBox;
    procedure OvcDataReportView1DragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure OvcDataReportView1DragDrop(Sender, Source: TObject; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var                            
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcDataReportView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source <> Sender)
    and (Source is TOvcDataReportView)
    and (TOvcDataReportView(Source).CurrentItem <> nil);
end;

procedure TForm1.OvcDataReportView1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if TOvcDataReportView(Source).CurrentItem <> nil then
    if Source <> Sender then begin
      TOvcDataReportView(Sender).Items.Add.Assign(
        TOvcDataReportView(Source).CurrentItem);
      TOvcDataReportView(Source).CurrentItem.Free;
    end;
end;

end.
                             
