{$J+} {Writable constants}

unit Txtedit1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, OvcBase, OvcData, Menus, Printers, OvcEdit, ShellAPI,
  OvcEditU, OvcConst, ComCtrls;

type
  TEditForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    PrintSetup1: TMenuItem;
    Print1: TMenuItem;
    N2: TMenuItem;
    Open1: TMenuItem;
    Edit1: TMenuItem;
    Copy1: TMenuItem;
    Search1: TMenuItem;
    GotoLine1: TMenuItem;
    N3: TMenuItem;
    FindNext1: TMenuItem;
    Find1: TMenuItem;
    Options1: TMenuItem;
    Font1: TMenuItem;
    N4: TMenuItem;
    Tabs1: TMenuItem;
    N5: TMenuItem;
    WordStarCommands1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    DefaultController: TOvcController;
//    Panel1: TPanel;
    FontDialog1: TFontDialog;
    OpenDialog1: TOpenDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
{
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
}
    New1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N6: TMenuItem;
    Redo1: TMenuItem;
    Undo1: TMenuItem;
    Undo2: TMenuItem;
    Cut1: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste1: TMenuItem;
    Paste2: TMenuItem;
    Delete1: TMenuItem;
    Replace1: TMenuItem;
    AutoIndentation1: TMenuItem;
    CreateBackupFile1: TMenuItem;
    FixedTabs1: TMenuItem;
    RealTabs1: TMenuItem;
    SmartTabs1: TMenuItem;
    N7: TMenuItem;
    TabSize1: TMenuItem;
    WordWrap1: TMenuItem;
    WrapAtColumn1: TMenuItem;
    Redo2: TMenuItem;
    Editor1: TOvcTextFileEditor;
    N8: TMenuItem;
    SelectAll1: TMenuItem;
    SaveDialog1: TSaveDialog;
//    Panel6: TPanel;
//    Panel7: TPanel;
    WraptoWindow1: TMenuItem;
    N9: TMenuItem;
    Send1: TMenuItem;
    StatusBar1: TStatusBar;
    FindDialog1: TFindDialog;
    ReplaceDialog1: TReplaceDialog;
    procedure Font1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure File1Click(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure GotoLine1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure TabSize1Click(Sender: TObject);
    procedure Find1Click(Sender: TObject);
    procedure FindNext1Click(Sender: TObject);
    procedure WordStarCommands1Click(Sender: TObject);
    procedure Editor1ShowStatus(Sender: TObject; LineNum: Longint;
      ColNum: Integer);
    procedure WordWrap1Click(Sender: TObject);
    procedure WrapAtColumn1Click(Sender: TObject);
    procedure AutoIndentation1Click(Sender: TObject);
    procedure CreateBackupFile1Click(Sender: TObject);
    procedure TabTypeClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure UndoClick(Sender: TObject);
    procedure RedoClick(Sender: TObject);
    procedure CutClick(Sender: TObject);
    procedure PasteClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WraptoWindow1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
{$IFDEF Win32}
    procedure Send1Click(Sender: TObject);
{$ENDIF}
  private
    { Private declarations }
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
    { Public declarations }
  end;

var
  EditForm: TEditForm;

implementation

uses TxtEdit2, TxtEdit3, Txtedit4{$IFDEF Win32}, Mapi{$ENDIF};

{$R *.DFM}

procedure TEditForm.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  hDrop : THandle;
  DroppedName : array[0..80] of Char;
begin
  if Msg.Message = WM_DROPFILES then begin
    Handled := True;
    hDrop := Msg.wParam;
    DragQueryFile(hDrop, 0, DroppedName, SizeOf(DroppedName));
    Editor1.FileName := StrPas(DroppedName);
    Editor1.IsOpen := True;
    DragFinish(hDrop);
    if IsIconic(Application.Handle) then
      ShowWindow(Application.Handle, sw_ShowNormal)
    else
      BringWindowToTop(Handle);
  end;
end;

procedure TEditForm.Font1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor1.FixedFont.Font);
  if FontDialog1.Execute then
    Editor1.FixedFont.Assign(FontDialog1.Font);
end;

procedure TEditForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    with Editor1 do begin
      FileName := OpenDialog1.Filename;
      IsOpen := True;
    end;
    EditForm.Caption := 'Text Edit - ' + OpenDialog1.Filename;
    Search1Click(Self);
    Edit1Click(Self);
  end;
end;

procedure TEditForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TEditForm.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TEditForm.Print1Click(Sender: TObject);
var
  Line: LongInt;
  Buf: array[0..1023] of Char;
  StartLine, StopLine: LongInt;
  StartCol, StopCol: Integer;
  PrintText: System.Text;
begin
  if Editor1.GetSelection(StartLine, StartCol, StopLine, StopCol) then
    PrintDialog1.Options := PrintDialog1.Options + [poSelection]
  else PrintDialog1.Options := PrintDialog1.Options - [poSelection];
  if PrintDialog1.Execute then begin
    AssignPrn(PrintText);
    try
      Rewrite(PrintText);
      Printer.Canvas.Font := Editor1.FixedFont.Font;
      case PrintDialog1.PrintRange of
        prAllPages :
          for Line := 1 to Editor1.LineCount do begin
            Editor1.GetPrintableLine(Line, Buf, SizeOf(Buf));
            Writeln(PrintText, Buf);
          end;
        prSelection :
          for Line := StartLine to StopLine do begin
            Editor1.GetPrintableLine(Line, Buf, SizeOf(Buf));
            if Line = StartLine then
              FillChar(Buf, StartCol, #32);
            if Line = StopLine then
              Buf[StopCol] := #0;
            Writeln(PrintText, Buf);
          end;
      end;
    finally
      System.Close(PrintText);
    end;
  end;
end;

procedure TEditForm.SelectAll1Click(Sender: TObject);
begin
  if Editor1.LineCount = -1 then Exit;
  Editor1.SelectAll(False);
end;

procedure TEditForm.File1Click(Sender: TObject);
begin
  Print1.Enabled := Editor1.TextLength > 0;
  Save1.Enabled := Editor1.TextLength > 0;
  SaveAs1.Enabled := Editor1.TextLength > 0;
end;

procedure TEditForm.CopyClick(Sender: TObject);
begin
  Editor1.CopyToClipboard;
end;

procedure TEditForm.Search1Click(Sender: TObject);
begin
  Find1.Enabled := Editor1.TextLength > 0;
  Replace1.Enabled := Editor1.TextLength > 0;
  FindNext1.Enabled := (Editor1.TextLength > 0) and (FindDlg.Edit1.Text <> '');
  GoToLine1.Enabled := Editor1.TextLength > 0;
end;

procedure TEditForm.GotoLine1Click(Sender: TObject);
var
  S : string;
begin
  S := '1';
  if InputQuery('Go to Line Number', 'Enter Line Number (1 to ' +
    IntToStr(Editor1.LineCount) + ')', S) then try
      Editor1.SetCaretPosition(StrToInt(S), 1);
    except
      Exit;
    end;
end;

procedure TEditForm.About1Click(Sender: TObject);
begin
  EditAbout.ShowModal;
end;

procedure TEditForm.TabSize1Click(Sender: TObject);
var
  S : string;
begin
  S := IntToStr(Editor1.TabSize);
  if InputQuery('Tab Size', 'Enter Tab Size', S) then try
    Editor1.TabSize := StrToInt(S);
  except
    Exit;
  end;
end;

procedure TEditForm.Find1Click(Sender: TObject);
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
    if not Editor1.Search(FindDlg.Edit1.Text, OptionSet) then
      MessageDlg('Search string ''' + FindDlg.Edit1.Text +
        ''' not found', mtInformation, [mbOk], 0);
    Search1Click(Self);
  end;
end;

procedure TEditForm.FindNext1Click(Sender: TObject);
var
  OptionSet : TSearchOptionSet;
begin
  OptionSet := [];
  if FindDlg.RadioButton2.Checked then
    OptionSet := OptionSet + [soBackward];
  if FindDlg.Checkbox1.Checked then
    OptionSet := OptionSet + [soMatchCase];
  if not Editor1.Search(FindDlg.Edit1.Text, OptionSet) then
    MessageDlg('Search string ''' + FindDlg.Edit1.Text +
      ''' not found', mtInformation, [mbOk], 0);
end;

procedure TEditForm.WordStarCommands1Click(Sender: TObject);
begin
  with WordStarCommands1 do begin
    Checked := not(Checked);
    DefaultController.EntryCommands.Table[0].IsActive := Checked;
  end;
end;

procedure TEditForm.Editor1ShowStatus(Sender: TObject; LineNum: Longint;
  ColNum: Integer);
begin
  StatusBar1.Panels[2].Text := IntToStr(LineNum) + ':' + IntToStr(ColNum);
  if Editor1.Modified then
    StatusBar1.Panels[3].Text := 'Modified'
  else
    StatusBar1.Panels[3].Text := '';
  StatusBar1.Panels[4].Text := 'Total: ' + IntToStr(Editor1.LineCount);
  StatusBar1.Panels[5].Text := 'Top: ' + IntToStr(Editor1.TopLine);
  StatusBar1.Panels[6].Text := 'Bytes: ' + IntToStr(Editor1.TextLength);
  if Editor1.InsertMode then
    StatusBar1.Panels[7].Text := 'Insert'
  else
    StatusBar1.Panels[7].Text := 'Overwrite';
  Edit1Click(Self);
end;

procedure TEditForm.Edit1Click(Sender: TObject);
var
  StartLine, StopLine: LongInt;
  StartCol, StopCol: Integer;
  IsSelected: Boolean;
begin
  SelectAll1.Enabled := Editor1.TextLength > 0;
  IsSelected := Editor1.GetSelection(StartLine, StartCol, StopLine, StopCol);
  Undo1.Enabled := Editor1.CanUndo;
  Undo2.Enabled := Editor1.CanUndo;
  Redo1.Enabled := Editor1.CanRedo;
  Redo2.Enabled := Editor1.CanRedo;
  Copy1.Enabled := IsSelected;
  Copy2.Enabled := IsSelected;
  Cut1.Enabled := IsSelected;
  Cut2.Enabled := IsSelected;
  OpenClipboard(Handle);
  Paste1.Enabled := GetClipboardData(cf_Text) <> 0;
  CloseClipboard;
  Paste2.Enabled := Paste1.Enabled;
end;


procedure TEditForm.WordWrap1Click(Sender: TObject);
begin
  WordWrap1.Checked := not(WordWrap1.Checked);
  Editor1.WordWrap := WordWrap1.Checked;
end;

procedure TEditForm.WrapAtColumn1Click(Sender: TObject);
var
  S : string;
begin
  S := IntToStr(Editor1.WrapColumn);
  if InputQuery('Word Wrap Column', 'Word Wrap at Column:', S) then try
    Editor1.WrapColumn := StrToInt(S);
  except
    Exit;
  end;
end;

procedure TEditForm.AutoIndentation1Click(Sender: TObject);
begin
  AutoIndentation1.Checked := not(AutoIndentation1.Checked);
  Editor1.AutoIndent := AutoIndentation1.Checked;
end;

procedure TEditForm.CreateBackupFile1Click(Sender: TObject);
begin
  CreateBackupFile1.Checked := not(CreateBackupFile1.Checked);
  Editor1.MakeBackup := CreateBackupFile1.Checked;
end;

procedure TEditForm.TabTypeClick(Sender: TObject);
begin
  FixedTabs1.Checked := False;
  RealTabs1.Checked := False;
  SmartTabs1.Checked := False;
  TMenuItem(Sender).Checked := True;
  if FixedTabs1.Checked then Editor1.TabType := ttFixed;
  if RealTabs1.Checked then Editor1.TabType := ttReal;
  if SmartTabs1.Checked then Editor1.TabType := ttSmart;
end;

procedure TEditForm.New1Click(Sender: TObject);
begin
  Editor1.NewFile('Untitled');
  EditForm.Caption := 'Text Edit - UNTITLED';
  Search1Click(Self);
  Edit1Click(Self);
end;

procedure TEditForm.SaveAs1Click(Sender: TObject);
begin
  SaveDialog1.Title := 'Save ' + ExtractFileName(Editor1.FileName) + ' As';
  SaveDialog1.Filter := OpenDialog1.Filter;
  if Editor1.FileName <> 'UNTITLED' then
    SaveDialog1.FileName := Editor1.FileName;
  if SaveDialog1.Execute then begin
    Editor1.SaveToFile(SaveDialog1.FileName);
    Editor1.FileName := SaveDialog1.FileName;
    EditForm.Caption := 'Text Edit - ' + SaveDialog1.Filename;
  end;
end;

procedure TEditForm.FormCreate(Sender: TObject);
begin
  Editor1.FileName := 'UNTITLED';
  DragAcceptFiles(Application.Handle, True);
  DragAcceptFiles(Handle, True);
  Application.OnMessage := AppMessage;
  {$IFDEF Win32}
  Send1.OnClick := Send1Click;
  Send1.Visible := True;
  N9.Visible := True;
  {$ENDIF}
end;

procedure TEditForm.Save1Click(Sender: TObject);
begin
  if Editor1.FileName <> 'UNTITLED' then
    Editor1.SaveToFile(Editor1.FileName)
  else
    SaveAs1Click(Self);
end;

procedure TEditForm.UndoClick(Sender: TObject);
begin
  Editor1.Undo;
end;

procedure TEditForm.RedoClick(Sender: TObject);
begin
  Editor1.Redo;
end;

procedure TEditForm.CutClick(Sender: TObject);
begin
  Editor1.CutToClipboard;
end;

procedure TEditForm.PasteClick(Sender: TObject);
begin
  Editor1.PasteFromClipboard;
end;

procedure TEditForm.Delete1Click(Sender: TObject);
begin
  Editor1.ProcessCommand(ccDel, 0);
end;

procedure TEditForm.FormDestroy(Sender: TObject);
begin
  DragAcceptFiles(Application.Handle, False);
  DragAcceptFiles(Handle, False);
end;

procedure TEditForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  ButtonSelected : Word;
begin
  if Editor1.Modified then
  begin
    ButtonSelected := MessageDlg('Data has changed, do you wish to save?',
      mtInformation, mbYesNoCancel, 0);
    if ButtonSelected in [mrYes] then begin
      Save1Click(Self);
      CanClose := True;
    end else
      CanClose := ButtonSelected in [mrNo];
  end;
end;

procedure TEditForm.WraptoWindow1Click(Sender: TObject);
begin
  WraptoWindow1.Checked := not(WraptoWindow1.Checked);
  WrapatColumn1.Enabled := not(WraptoWindow1.Checked);
  if WraptoWindow1.Checked then
    Editor1.WrapColumn := Editor1.VisibleColumns;
end;

procedure TEditForm.FormResize(Sender: TObject);
begin
  if WraptoWindow1.Checked then
    Editor1.WrapColumn := Editor1.VisibleColumns;
end;

procedure TEditForm.Replace1Click(Sender: TObject);
var
  OptionSet : TSearchOptionSet;
  Count : LongInt;
  Code : Word;
  Aborted : boolean;
begin
  Aborted := False;
  ReplDlg.ShowModal;
  if (ReplDlg.ModalResult = mrOK) or (ReplDlg.ModalResult = mrYes) then begin
    OptionSet := [];
    if ReplDlg.ModalResult = mrYes then
      OptionSet := OptionSet + [soReplaceAll]
    else OptionSet := OptionSet + [soReplace];
    if ReplDlg.RadioButton2.Checked then
      OptionSet := OptionSet + [soBackward];
    if ReplDlg.Checkbox1.Checked then
      OptionSet := OptionSet + [soMatchCase];
    if ReplDlg.Checkbox2.Checked then
      OptionSet := OptionSet + [soWholeWord];
    if ReplDlg.Checkbox3.Checked then
      OptionSet := OptionSet + [soGlobal];
    Count := Editor1.Replace(ReplDlg.Edit1.Text, ReplDlg.Edit2.Text, OptionSet);
    while Count <> -1 do begin                                         {!!.01}
      if Editor1.HasSelection then begin                               {!!.01}
        Code := MessageDlg('Replace this occurrence?',mtConfirmation, [mbYes, mbNo, mbCancel], 0);
        if Code = mrYes then
          Count := Editor1.Replace(ReplDlg.Edit1.Text, ReplDlg.Edit2.Text, OptionSet);
        if Code = mrNo then begin
          Editor1.Deselect(not (soBackward in OptionSet));
          Count := Editor1.Replace(ReplDlg.Edit1.Text, ReplDlg.Edit2.Text, OptionSet);
        end;
        if Code = mrCancel then begin
          Aborted := True;
          Editor1.Deselect(not (soBackward in OptionSet));
          Count := -1;
        end;
      end else Break;                                                  {!!.01}
    end;                                                               {!!.01}
    if (Count = -1) and not Aborted then
      MessageDlg('Search string ''' + ReplDlg.Edit1.Text +             {!!.01}
        ''' not found', mtInformation, [mbOk], 0);
    Search1Click(Self);
  end;
end;

{$IFDEF Win32}
procedure TEditForm.Send1Click(Sender: TObject);
var
  MapiMessage : TMapiMessage;
  MError : Cardinal;
  TempBuffer : PChar;
  I, BufferSize : Integer;
  ParaLen : Word;
  sAnsi: AnsiString;
begin
  BufferSize := 1;
  Inc(BufferSize, Editor1.TextLength);
  Inc(BufferSize, Editor1.ParaCount*2);
  GetMem(TempBuffer, BufferSize);
  try
    TempBuffer[0] := #0;
    for I := 1 to Editor1.ParaCount do begin
      StrCat(TempBuffer, Editor1.GetPara(I, ParaLen));
      StrCat(TempBuffer, #13#10);
    end;
    sAnsi := AnsiString(TempBuffer);
    with MapiMessage do
    begin
      ulReserved := 0;
      lpszSubject := nil;
      lpszNoteText := PAnsiChar(sAnsi);
      lpszMessageType := nil;
      lpszDateReceived := nil;
      lpszConversationID := nil;
      flFlags := 0;
      lpOriginator := nil;
      nRecipCount := 0;
      lpRecips := nil;
      nFileCount := 0;
      lpFiles := nil;
    end;

    MError := MapiSendMail(0, 0, MapiMessage,
      MAPI_DIALOG or MAPI_LOGON_UI or MAPI_NEW_SESSION, 0);
    if MError <> 0 then MessageDlg('Error sending mail', mtError, [mbOK], 0);
  finally
    FreeMem(TempBuffer,BufferSize);
  end;
end;
{$ENDIF}

end.
