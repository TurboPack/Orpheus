//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <shellapi.h>

#include "TxtEdit1.h"
#include "TxtEdit2.h"
//---------------------------------------------------------------------------
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TEditForm *EditForm;
//---------------------------------------------------------------------------
__fastcall TEditForm::TEditForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::AppMessage(TMsg& Msg, bool& Handled)
{
  HDROP hDrop;
  char DroppedName[MAX_PATH];
  if (Msg.message == WM_DROPFILES) {
    Handled = true;
    hDrop = (HDROP)Msg.wParam;
    DragQueryFile(hDrop, 0, DroppedName, sizeof(DroppedName));
    Editor1->FileName = DroppedName;
    Editor1->IsOpen = true;
    DragFinish(hDrop);
    if (IsIconic(Application->Handle))
      ShowWindow(Application->Handle, SW_SHOWNORMAL);
    else
      BringWindowToTop(Handle);
  }
}


void __fastcall TEditForm::Font1Click(TObject *Sender)
{
  FontDialog1->Font->Assign(Editor1->FixedFont->Font);
  if (FontDialog1->Execute())
    Editor1->FixedFont->Assign(FontDialog1->Font);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Open1Click(TObject *Sender)
{
  if (OpenDialog1->Execute()) {
    Editor1->FileName = OpenDialog1->FileName;
    Editor1->IsOpen = true;
    EditForm->Caption = "Text Edit - " + OpenDialog1->FileName;
    Search1Click(this);
    Edit1Click(this);
  }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Exit1Click(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::PrintSetup1Click(TObject *Sender)
{
  PrinterSetupDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::SelectAll1Click(TObject *Sender)
{
  if (Editor1->LineCount == -1) return;
  Editor1->SelectAll(false);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::File1Click(TObject *Sender)
{
  Print1->Enabled = Editor1->TextLength > 0;
  Save1->Enabled = Editor1->TextLength > 0;
  SaveAs1->Enabled = Editor1->TextLength > 0;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Copy1Click(TObject *Sender)
{
  Editor1->CopyToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Search1Click(TObject *Sender)
{
  Find1->Enabled = Editor1->TextLength > 0;
  Replace1->Enabled = Editor1->TextLength > 0;
  FindNext1->Enabled =
    (Editor1->TextLength > 0) && (FindDialog1->FindText != "");
  GotoLine1->Enabled = Editor1->TextLength > 0;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::GotoLine1Click(TObject *Sender)
{
  String S = "1";
  if (InputQuery("Go to Line Number", "Enter Line Number (1 to " +
    String((int)Editor1->LineCount) + String(")"), S))
    try {
      Editor1->SetCaretPosition(S.ToInt(), 1);
    }
    catch (...) {
      return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::About1Click(TObject *Sender)
{
  EditAbout->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::TabSize1Click(TObject *Sender)
{
  String S = String(Editor1->TabSize);
  if (InputQuery("Tab Size", "Enter Tab Size", S))
    try {
      Editor1->TabSize = (Word)S.ToInt();
    }
    catch (...) {
      return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::WordStarCommands1Click(TObject *Sender)
{
  WordStarCommands1->Checked = ! WordStarCommands1->Checked;
  DefaultController->EntryCommands->Table[0]->IsActive = WordStarCommands1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Editor1ShowStatus(TObject *Sender, int LineNum,
  int ColNum)
{
  StatusBar1->Panels->Items[0]->Text =
    String((int)LineNum) + ":" + String((int)ColNum);
  if (Editor1->Modified)
    StatusBar1->Panels->Items[1]->Text = "Modified";
  else
    StatusBar1->Panels->Items[1]->Text = "";
  StatusBar1->Panels->Items[2]->Text = "Total: " + String((int)Editor1->LineCount);
  StatusBar1->Panels->Items[3]->Text = "Top: " + String((int)Editor1->TopLine);
  StatusBar1->Panels->Items[4]->Text = "Bytes: " + String((int)Editor1->TextLength);
  if (Editor1->InsertMode)
    StatusBar1->Panels->Items[5]->Text = "Insert";
  else
    StatusBar1->Panels->Items[5]->Text = "Overwrite";
  StatusBar1->Update();
  Edit1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Edit1Click(TObject *Sender)
{
  int StartLine, StopLine;
  int StartCol, StopCol;
  bool IsSelected;
  SelectAll1->Enabled = Editor1->TextLength > 0;
  IsSelected = Editor1->GetSelection(StartLine, StartCol, StopLine, StopCol);
  Undo1->Enabled = Editor1->CanUndo();
  Undo2->Enabled = Editor1->CanUndo();
  Redo1->Enabled = Editor1->CanRedo();
  Redo2->Enabled = Editor1->CanRedo();
  Copy1->Enabled = IsSelected;
  Copy2->Enabled = IsSelected;
  Cut1->Enabled = IsSelected;
  Cut2->Enabled = IsSelected;
  Paste1->Enabled = Clipboard()->HasFormat(CF_TEXT) != 0;
  Paste2->Enabled = Paste1->Enabled;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::WordWrap1Click(TObject *Sender)
{
  WordWrap1->Checked = !WordWrap1->Checked;
  Editor1->WordWrap = WordWrap1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::WrapAtColumn1Click(TObject *Sender)
{
  String S = String(Editor1->WrapColumn);
  if (InputQuery("Word Wrap Column", "Word Wrap at Column:", S))
    try {
      Editor1->WrapColumn = S.ToInt();
    }
    catch (...)
    {
      return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::AutoIndentation1Click(TObject *Sender)
{
  AutoIndentation1->Checked = !AutoIndentation1->Checked;
  Editor1->AutoIndent = AutoIndentation1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::CreateBackupFile1Click(TObject *Sender)
{
  CreateBackupFile1->Checked = !CreateBackupFile1->Checked;
  Editor1->MakeBackup = CreateBackupFile1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::TabTypeClick(TObject *Sender)
{
  FixedTabs1->Checked = False;
  RealTabs1->Checked = False;
  SmartTabs1->Checked = False;
  TMenuItem* mi = dynamic_cast<TMenuItem*>(Sender);
  if (mi) mi->Checked = true;
  if (FixedTabs1->Checked) Editor1->TabType = ttFixed;
  if (RealTabs1->Checked) Editor1->TabType = ttReal;
  if (SmartTabs1->Checked) Editor1->TabType = ttSmart;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::New1Click(TObject *Sender)
{
  Editor1->NewFile("Untitled");
  EditForm->Caption = "Text Edit - UNTITLED";
  Search1Click(this);
  Edit1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::SaveAs1Click(TObject *Sender)
{
  SaveDialog1->Title = "Save " + ExtractFileName(Editor1->FileName) + " As";
  SaveDialog1->Filter = OpenDialog1->Filter;
  if (Editor1->FileName != "UNTITLED")
    SaveDialog1->FileName = Editor1->FileName;
  if (SaveDialog1->Execute()) {
    Editor1->SaveToFile(SaveDialog1->FileName);
    Editor1->FileName = SaveDialog1->FileName;
    EditForm->Caption = "Text Edit - " + SaveDialog1->FileName;
  }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FormCreate(TObject *Sender)
{
  Editor1->FileName = "UNTITLED";
  DragAcceptFiles(Application->Handle, true);
  DragAcceptFiles(Handle, true);
  Application->OnMessage = AppMessage;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Save1Click(TObject *Sender)
{
  if (Editor1->FileName != "UNTITLED")
    Editor1->SaveToFile(Editor1->FileName);
  else
    SaveAs1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Undo1Click(TObject *Sender)
{
  Editor1->Undo();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Redo1Click(TObject *Sender)
{
  Editor1->Redo();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Cut1Click(TObject *Sender)
{
  Editor1->CutToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Paste1Click(TObject *Sender)
{
  Editor1->PasteFromClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Delete1Click(TObject *Sender)
{
  Editor1->ProcessCommand(ccDel, 0);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FormDestroy(TObject *Sender)
{
  DragAcceptFiles(Application->Handle, False);
  DragAcceptFiles(Handle, False);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  int ButtonSelected;
  if (Editor1->Modified) {
    ButtonSelected = MessageDlg("Data has changed, do you wish to save?",
      mtInformation, TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
    if (ButtonSelected == mrYes) {
      Save1Click(this);
      CanClose = true;
    }
    else
      CanClose = ButtonSelected == mrNo;
  }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::WraptoWindow1Click(TObject *Sender)
{
  WraptoWindow1->Checked = !WraptoWindow1->Checked;
  WrapAtColumn1->Enabled = !WraptoWindow1->Checked;
  if (WraptoWindow1->Checked)
    Editor1->WrapColumn = Editor1->VisibleColumns;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FormResize(TObject *Sender)
{
  if (WraptoWindow1->Checked)
    Editor1->WrapColumn = Editor1->VisibleColumns;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Send1Click(TObject *Sender)
{
  TMapiMessage MapiMessage;
  int MError;
  char* TempBuffer;
  int BufferSize;
  Word ParaLen;
  BufferSize = 1;
  BufferSize += Editor1->TextLength;
  BufferSize += (Editor1->ParaCount() * 2);
  TempBuffer = new char[BufferSize];
  try {
    TempBuffer[0] = 0;
    for (int i=0;i<Editor1->ParaCount() - 1;i++) {
      strcat(TempBuffer, Editor1->GetPara(i, ParaLen));
      strcat(TempBuffer, "\r\n");
    }
    MapiMessage.ulReserved = 0;
    MapiMessage.lpszSubject = 0;
    MapiMessage.lpszNoteText = TempBuffer;
    MapiMessage.lpszMessageType = 0;
    MapiMessage.lpszDateReceived = 0;
    MapiMessage.lpszConversationID = 0;
    MapiMessage.flFlags = 0;
    MapiMessage.lpOriginator = 0;
    MapiMessage.nRecipCount = 0;
    MapiMessage.lpRecips = 0;
    MapiMessage.nFileCount = 0;
    MapiMessage.lpFiles = 0;

    MError = MapiSendMail(0, 0, MapiMessage,
      MAPI_DIALOG | MAPI_LOGON_UI | MAPI_NEW_SESSION, 0);
    if (MError != 0)
      MessageDlg("Error sending mail", mtError, TMsgDlgButtons() << mbOK, 0);
  }
  catch (...) {
    delete[] TempBuffer;
  }
  delete[] TempBuffer;
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Print1Click(TObject *Sender)
{
  int I;
  String S;
  int X, Y, YD;
  int StartLine = 0, StopLine = 0;
  int StartCol, StopCol;

  if (Editor1->GetSelection(StartLine, StartCol, StopLine, StopCol)) {
    PrintDialog1->Options << poSelection;
    PrintDialog1->PrintRange = prSelection;
  }
  else
    PrintDialog1->Options >> poSelection;
  if (!PrintDialog1->Execute()) return;

  // assign editor font to printer
  Printer()->Canvas->Font = Editor1->FixedFont->Font;

  // get vertical line delta
  YD = Printer()->Canvas->TextHeight("Wg");

  // access printer handle to force selection of the font
  // into the printer DC-> Delphi doesn't do this automatically
  if (Printer()->Handle > 0) ;

  Screen->Cursor = crHourGlass;
  try {
    Y = 50;
    X = 50;
    if (StartLine == 0) StartLine = 1;
    if (StopLine == 0) StopLine = Editor1->LineCount;
    Printer()->BeginDoc();
    for (I=StartLine;I<StopLine + 1;I++) {
      S = Editor1->Lines[I];
      Printer()->Canvas->TextOut(X, Y, S);
      Y += YD;
      if (Y > Printer()->PageHeight - 50) {
        Y = 50;
        Printer()->NewPage();
      }
    }
    Printer()->EndDoc();
    Screen->Cursor = crDefault;
  }
  catch (...) {
    Screen->Cursor = crDefault;
  }
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Find1Click(TObject *Sender)
{
  FindDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FindDialog1Find(TObject *Sender)
{
  TFindDialog* dlg = dynamic_cast<TFindDialog*>(Sender);
  OptionSet.Clear();
  if (!dlg->Options.Contains(frDown))
    OptionSet << soBackward;
  if (dlg->Options.Contains(frMatchCase))
    OptionSet << soMatchCase;
  if (dlg->Options.Contains(frWholeWord))
    OptionSet << soWholeWord;
  if (!Editor1->Search(dlg->FindText, OptionSet))
    MessageDlg("Search string '" + dlg->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
  Search1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::FindNext1Click(TObject *Sender)
{
  if (!Editor1->Search(FindDialog1->FindText, OptionSet))
    MessageDlg("Search string '" + FindDialog1->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
  Search1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::Replace1Click(TObject *Sender)
{
  ReplaceDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TEditForm::ReplaceDialog1Replace(TObject *Sender)
{
  int Count;
  int Code;
  bool Aborted = False;
  OptionSet.Clear();
  if (ReplaceDialog1->Options.Contains(frReplaceAll))
    OptionSet << soReplaceAll;
  else OptionSet << soReplace;
  if (!ReplaceDialog1->Options.Contains(frDown))
    OptionSet << soBackward;
  if (ReplaceDialog1->Options.Contains(frMatchCase))
    OptionSet << soMatchCase;
  if (ReplaceDialog1->Options.Contains(frWholeWord))
    OptionSet << soWholeWord;
  Count = Editor1->Replace(
    ReplaceDialog1->FindText, ReplaceDialog1->ReplaceText, OptionSet);
  while (Count != -1) {
    if (Editor1->HasSelection()) {
      Code = MessageDlg("Replace this occurrence?", mtConfirmation,
        TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
      if (Code == mrYes)
        Count = Editor1->Replace(
          ReplaceDialog1->FindText, ReplaceDialog1->ReplaceText, OptionSet);
      if (Code == mrNo) {
        Editor1->Deselect(!OptionSet.Contains(soBackward));
        Count = Editor1->Replace(
          ReplaceDialog1->FindText, ReplaceDialog1->ReplaceText, OptionSet);
      }
      if (Code == mrCancel) {
        Aborted = true;
        Editor1->Deselect(!OptionSet.Contains(soBackward));
        Count = -1;
      }
    }
    else break;
  }
  if (Count == -1 && !Aborted)
    MessageDlg("Search string '" + ReplaceDialog1->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
  Search1Click(this);
}
//---------------------------------------------------------------------------
