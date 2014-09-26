{$J+} {Writable constants}

unit Txtview1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OvcBase, OvcViewr, OvcData, Menus, Printers, ShellAPI,
  ComCtrls;

type
  TViewForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    Clipboard1: TMenuItem;
    SelectAll1: TMenuItem;
    Copy2: TMenuItem;
    Search1: TMenuItem;
    GotoLine1: TMenuItem;
    N3: TMenuItem;
    FindNext1: TMenuItem;
    Find1: TMenuItem;
    Options1: TMenuItem;
    Font1: TMenuItem;
    N4: TMenuItem;
    TabSize1: TMenuItem;
    N5: TMenuItem;
    WordStarCommands1: TMenuItem;
    TabExpansion1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    DefaultController: TOvcController;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    Viewer1: TOvcTextFileViewer;
    Copy1: TMenuItem;
    StatusBar1: TStatusBar;
    ReplaceDialog1: TReplaceDialog;
    procedure Font1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure Clipboard1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure GotoLine1Click(Sender: TObject);
    procedure Viewer1ShowStatus(Sender: TObject; Line: Longint;
      Col: Integer);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabExpansion1Click(Sender: TObject);
    procedure TabSize1Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure FindNext1Click(Sender: TObject);
    procedure WordStarCommands1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  ViewForm: TViewForm;

implementation

uses TxtView2, TxtView3;

{$R *.DFM}

procedure TViewForm.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  hDrop : THandle;
  DroppedName : array[0..80] of Char;
begin
  if Msg.Message = WM_DROPFILES then begin
    Handled := True;
    hDrop := Msg.wParam;
    DragQueryFile(hDrop, 0, DroppedName, SizeOf(DroppedName));
    Viewer1.FileName := StrPas(DroppedName);
    Viewer1.IsOpen := True;
    DragFinish(hDrop);
    if IsIconic(Application.Handle) then
      ShowWindow(Application.Handle, sw_ShowNormal)
    else
      BringWindowToTop(Handle);
  end;
end;

procedure TViewForm.Font1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(Viewer1.FixedFont.Font);                     {!!.10}
  if FontDialog1.Execute then
    if FontDialog1.Font <> nil then
      Viewer1.FixedFont.Assign(FontDialog1.Font);
end;

procedure TViewForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    with Viewer1 do begin
      FileName := OpenDialog1.Filename;
      IsOpen := True;
    end;
    ViewForm.Caption := 'Text View - ' + OpenDialog1.Filename;
    Search1Click(Self);
    Clipboard1Click(Self);
  end;
end;

procedure TViewForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TViewForm.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TViewForm.Print1Click(Sender: TObject);
var
  Line: LongInt;
  Buf: array[0..1023] of Char;
  SelRange: TOvcViewerRange;
  PrintText: System.Text;
begin
  if Viewer1.GetSelection(SelRange.Start.Line, SelRange.Start.Col,
             SelRange.Stop.Line, SelRange.Stop.Col) then
    PrintDialog1.Options := PrintDialog1.Options + [poSelection]
  else PrintDialog1.Options := PrintDialog1.Options - [poSelection];
  if PrintDialog1.Execute then begin
    AssignPrn(PrintText);
    try
      Rewrite(PrintText);
      Printer.Canvas.Font := Viewer1.FixedFont.Font;
      case PrintDialog1.PrintRange of
        prAllPages :
          for Line := 0 to Pred(Viewer1.LineCount) do begin
            Viewer1.GetPrintableLine(Line, Buf, SizeOf(Buf));
            Writeln(PrintText, Buf);
          end;
        prSelection :
          for Line := SelRange.Start.Line to SelRange.Stop.Line do begin
            Viewer1.GetPrintableLine(Line, Buf, SizeOf(Buf));
            if Line = SelRange.Start.Line then
              FillChar(Buf, SelRange.Start.Col, #32);
            if Line = SelRange.Stop.Line then
              Buf[SelRange.Stop.Col] := #0;
            Writeln(PrintText, Buf);
          end;
      end;
    finally
      System.Close(PrintText);
    end;
  end;
end;

procedure TViewForm.SelectAll1Click(Sender: TObject);
begin
  Viewer1.SelectAll(False);
end;

procedure TViewForm.Clipboard1Click(Sender: TObject);
var
  SelRange: TOvcViewerRange;
begin
  SelectAll1.Enabled := Viewer1.LineCount > 0;
  Copy1.Enabled := Viewer1.GetSelection(SelRange.Start.Line, SelRange.Start.Col,
          SelRange.Stop.Line, SelRange.Stop.Col);
  Copy2.Enabled := Viewer1.GetSelection(SelRange.Start.Line, SelRange.Start.Col,
          SelRange.Stop.Line, SelRange.Stop.Col);
end;

procedure TViewForm.File1Click(Sender: TObject);
begin
  Print1.Enabled := Viewer1.LineCount > 0;
end;

procedure TViewForm.CopyClick(Sender: TObject);
begin
  Viewer1.CopyToClipboard;
end;

procedure TViewForm.Search1Click(Sender: TObject);
begin
  Find1.Enabled := Viewer1.LineCount > 0;
  FindNext1.Enabled := (Viewer1.LineCount > 0) and (FindDlg.Edit1.Text <> '');
  GoToLine1.Enabled := Viewer1.LineCount > 0;
end;

procedure TViewForm.GotoLine1Click(Sender: TObject);
var
  S : string;
  GoPos : TOvcTextPos;
begin
  S := '';
  if InputQuery('Go to Line Number', 'Enter Line Number (1 to ' +
    IntToStr(Viewer1.LineCount) + ')', S) then begin
    try
      GoPos.Line := Pred(StrToInt(S));
    except
      Exit;
    end;
    GoPos.Col := 0;
    Viewer1.CaretActualPos := GoPos;
  end;
end;

procedure TViewForm.Viewer1ShowStatus(Sender: TObject; Line: Longint;
  Col: Integer);
begin
  StatusBar1.Panels[1].Text := IntToStr(Succ(Viewer1.CaretEffectivePos.Line)) +
    ':' + IntToStr(Succ(Viewer1.CaretEffectivePos.Col));
  StatusBar1.Panels[2].Text := 'Total: ' + IntToStr(Viewer1.LineCount);
  StatusBar1.Panels[3].Text := 'Top: ' + IntToStr(Succ(Viewer1.TopLine));
  StatusBar1.Panels[4].Text := 'Bytes: ' + IntToStr(Viewer1.FileSize);
  Clipboard1Click(Self);
end;

procedure TViewForm.About1Click(Sender: TObject);
begin
  ViewAbout.ShowModal;
end;

procedure TViewForm.FormCreate(Sender: TObject);
begin
  TabExpansion1.Checked := Viewer1.ExpandTabs;
  DragAcceptFiles(Application.Handle, True);
  DragAcceptFiles(Handle, True);
  Application.OnMessage := AppMessage;
end;

procedure TViewForm.TabExpansion1Click(Sender: TObject);
begin
  TabExpansion1.Checked := not(TabExpansion1.Checked);
  Viewer1.ExpandTabs := TabExpansion1.Checked;
end;

procedure TViewForm.TabSize1Click(Sender: TObject);
var
  S : string;
begin
  S := IntToStr(Viewer1.TabSize);
  if InputQuery('Tab Size', 'Enter Tab Size', S) then try
    Viewer1.TabSize := StrToInt(S);
  except
    Exit;
  end;
end;

procedure TViewForm.Find1Click(Sender: TObject);
var
  OptionSet : TSearchOptionSet;
begin
  FindDlg.ShowModal;
  if FindDlg.ModalResult=mrOK then begin
    OptionSet := [];
    if FindDlg.RadioButton2.Checked then
      OptionSet := OptionSet + [soBackward];
    if FindDlg.Checkbox1.Checked then
      OptionSet := OptionSet + [soMatchCase];
    if FindDlg.Checkbox2.Checked then
      OptionSet := OptionSet + [soGlobal];
    if not Viewer1.Search(FindDlg.Edit1.Text, OptionSet) then
      MessageDlg('Search string ''' + FindDlg.Edit1.Text +
        ''' not found', mtInformation, [mbOk], 0);
    Search1Click(Self);
  end;
end;

procedure TViewForm.FindNext1Click(Sender: TObject);
var
  OptionSet : TSearchOptionSet;
begin
  OptionSet := [];
  if FindDlg.RadioButton2.Checked then
    OptionSet := OptionSet + [soBackward];
  if FindDlg.Checkbox1.Checked then
    OptionSet := OptionSet + [soMatchCase];
  if not Viewer1.Search(FindDlg.Edit1.Text, OptionSet) then
    MessageDlg('Search string ''' + FindDlg.Edit1.Text +
      ''' not found', mtInformation, [mbOk], 0);
end;

procedure TViewForm.WordStarCommands1Click(Sender: TObject);
begin
  with WordStarCommands1 do begin
    Checked := not(Checked);
    if Checked then
      DefaultController.EntryCommands.Table[0].IsActive := True
    else
      DefaultController.EntryCommands.Table[0].IsActive := False;
  end;
end;

procedure TViewForm.FormDestroy(Sender: TObject);
begin
  DragAcceptFiles(Application.Handle, False);
  DragAcceptFiles(Handle, False);
end;

end.
