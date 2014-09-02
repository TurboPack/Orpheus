{$J+} {Writable constants}

unit ExMruU;

interface

uses
  {$IFDEF WIN32}
  Windows,
  {$ELSE}
  WinTypes, WinProcs,
  {$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, OvcBase, OvcMRU, StdCtrls, OvcState, OvcFiler, OvcStore;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    Open1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Reopen1: TMenuItem;
    ClearHistoryList1: TMenuItem;
    OvcComponentState1: TOvcComponentState;
    OvcIniFileStore1: TOvcIniFileStore;
    DelphiList: TOvcMenuMRU;
    FileMenuList: TOvcMenuMRU;
    procedure Open1Click(Sender: TObject);
    procedure ClearHistoryList1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure OvcMRUClick(Sender: TObject; const ItemText: String;
      var Action: TOvcMRUClickAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Open1Click(Sender: TObject);
begin
  { Show the file open dialog. }
  if (OpenDialog1.Execute) then begin
    { Load the file into the Memo. }
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    { Add all files to the main MRU list. }
    FileMenuList.Add(OpenDialog1.FileName);
    { If a Delphi DPR file was opened, add it to the top }
    { of the split MRU list. }
    if UpperCase(ExtractFileExt(OpenDialog1.FileName)) = '.DPR' then begin
      DelphiList.AddSplit(OpenDialog1.FileName, apTop);
      Reopen1.Enabled := True;
    end;
    { If a Delphi PAS file was opened, add it to the bottom }
    { of the split MRU list. }
    if UpperCase(ExtractFileExt(OpenDialog1.FileName)) = '.PAS' then begin
      DelphiList.AddSplit(OpenDialog1.FileName, apBottom);
      Reopen1.Enabled := True;
    end;
  end;
end;

procedure TForm1.ClearHistoryList1Click(Sender: TObject);
begin
  DelphiList.Clear;
  FileMenuList.Clear;
  Reopen1.Enabled := False;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.OvcMRUClick(Sender: TObject; const ItemText: String;
  var Action: TOvcMRUClickAction);
begin
  { A MRU menu item was clicked. Open the file in the Memo. }
  Memo1.Lines.LoadFromFile(ItemText);
end;

end.
