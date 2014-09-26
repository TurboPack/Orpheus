{$J+} {Writable constants}

unit Exdspltu;

{Example program of how to dynamically create a splitter}
{and place two dynamically created panels in each section}

interface

uses
  WinTypes, WinProcs, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcSplit, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Split1: TOvcSplitter;
    Controller1: TOvcController;
    Panel1: TPanel;
    Panel2: TPanel;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormActivate(Sender: TObject);
begin
  Controller1 := TOvcController.Create(Self);
  Split1 := TOvcSplitter.Create(Self);
  Panel1 := TPanel.Create(Form1);
  with Panel1 do
  begin
    Parent := Split1.Section[0];
    Align := alClient;
    Caption := 'Left Panel';
  end;

  Panel2 := TPanel.Create(Form1);
  with Panel2 do
  begin
    Parent := Split1.Section[1];
    Align := alClient;
    Caption := 'Right Panel';
  end;

  with Split1 do
  begin
    Parent := Form1;
    Align := alClient;
    Height := Form1.ClientHeight;
    Width  := Form1.ClientWidth;
    Position  := (Form1.ClientWidth) div 2;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
    Split1.Position  := (Form1.ClientWidth) div 2;
end;

end.
