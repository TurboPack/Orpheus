//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <shellapi.h>
#include "Mdieditm.h"
#include "Mdiedita.h"
#include "Mdieditc.h"
//---------------------------------------------------------------------------
#pragma link "OvcBase"
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::AppMessage(TMsg& Msg, bool& Handled)
{
  HDROP hDrop;
  char DroppedName[MAX_PATH];
  TFileName FileName;
  int NumFiles;
  bool AlreadyOpen;
  if (Msg.message == WM_DROPFILES)
    Handled = true;
    hDrop = (HDROP)Msg.wParam;
    NumFiles = DragQueryFile(hDrop, -1, DroppedName, sizeof(DroppedName));
    for (int j = 0;j < NumFiles;j++) {
      AlreadyOpen = false;
      DragQueryFile(hDrop, j, DroppedName, sizeof(DroppedName));
      FileName = StrPas(DroppedName);
      for (int i=0;i<MDIChildCount;i++) {
        if (MDIChildren[i]->Caption == FileName) {
          AlreadyOpen = true;
          MDIChildren[i]->BringToFront();
          MDIChildren[i]->SetFocus();
        }
      if (!AlreadyOpen)
        CreateMDIChild(FileName, false);
    }
    DragFinish(hDrop);
    if (IsIconic(Application->Handle))
      ShowWindow(Application->Handle, SW_SHOWNORMAL);
    else
      BringWindowToTop(Handle);
  }
}

void TMainForm::CreateMDIChild(const String Name, bool NewFile)
{
  TMDIChild* Child = new TMDIChild(Application);
  Child->Caption = Name;
  Child->Editor1->FileName = Name;
  Child->Editor1->IsOpen = !NewFile;
}

void __fastcall TMainForm::ShowHint(TObject* Sender)
{
  if (Application->Hint != "") {
    StatusBar->SimplePanel = true;
    StatusBar->SimpleText = Application->Hint;
  }
  else
    StatusBar->SimplePanel = false;
}

void __fastcall TMainForm::WMNCLButtonDblClk(TWMNCLButtonDblClk& Message)
{
  TPoint ScreenPt, ClientPt;
  ScreenPt.x = Message.XCursor;
  ScreenPt.y = Message.YCursor;
  ClientPt = ScreenToClient(ScreenPt);
  if (Message.HitTest == HTMENU
    && ClientPt.x < GetSystemMetrics(SM_CYMENU)
    && ActiveMDIChild != NULL
    && ActiveMDIChild->WindowState == wsMaximized)
  {
    ActiveMDIChild->Close();
    Message.Result = 0;
  }
  else DefaultHandler(&Message);
}

void TMainForm::UpdateStatusLine()
{
  long LineNum;
  int ColNum;
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    LineNum = c->ActiveEditor->GetCaretPosition(ColNum);
    StatusBar->Panels->Items[0]->Text =
      String((int)LineNum) + ":" + String(ColNum);
    if (c->ActiveEditor->Modified)
      StatusBar->Panels->Items[1]->Text = "Modified";
    else
      StatusBar->Panels->Items[1]->Text = "";
    StatusBar->Panels->Items[2]->Text =
      "Total: " + String((int)c->ActiveEditor->LineCount);
    StatusBar->Panels->Items[3]->Text =
      "Top: " + String((int)c->ActiveEditor->TopLine);
    StatusBar->Panels->Items[4]->Text =
      "Bytes: " + String((int)c->ActiveEditor->TextLength);
    if (c->ActiveEditor->InsertMode)
      StatusBar->Panels->Items[5]->Text = "Insert";
    else
      StatusBar->Panels->Items[5]->Text = "Overwrite";
    Edit1Click(this);
  }
  else {
    StatusBar->Panels->Items[0]->Text = "";
    StatusBar->Panels->Items[1]->Text = "";
    StatusBar->Panels->Items[2]->Text = "";
    StatusBar->Panels->Items[3]->Text = "";
    StatusBar->Panels->Items[4]->Text = "";
    StatusBar->Panels->Items[5]->Text = "";
  }
  StatusBar->Update();
}

void TMainForm::UpdateChildOptions()
{
  for (int i=0;i<MDIChildCount;i++)
    dynamic_cast<TMDIChild*>(MDIChildren[i])->UpdateOptions();
}

void __fastcall TMainForm::FormCreate(TObject *Sender)
{
  Application->OnHint = &ShowHint;
  Screen->OnActiveFormChange = &UpdateButtons;
  TabSize = 8;
  WrapColumn = 80;
  FontIsSet = false;
  DragAcceptFiles(Application->Handle, true);
  DragAcceptFiles(Handle, true);
  //Application->OnMessage = AppMessage;
  NoNameSet.Clear();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::New1Click(TObject *Sender)
{
  int AvailNum = 1;
  for (int i=1;i<256;i++) {
    if (!NoNameSet.Contains((Byte)i)) {
      AvailNum = i;
      NoNameSet << (Byte)i;
      break;
    }
  }
  CreateMDIChild("NONAME" + String(AvailNum), true);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Open1Click(TObject *Sender)
{
  bool AlreadyOpen = false;
  OpenDialog1->FileName = "";
  if (OpenDialog1->Execute()) {
    for (int i=0;i < OpenDialog1->Files->Count;i++) {
      for (int j=0;j<MDIChildCount;j++) {
        String s1 = MDIChildren[j]->Caption;
        String s2 = OpenDialog1->Files->Strings[i];
        if (s1 == s2) {
          AlreadyOpen = true;
          MDIChildren[j]->BringToFront();
          MDIChildren[j]->SetFocus();
        }
      }
      if (!AlreadyOpen)
        CreateMDIChild(OpenDialog1->Files->Strings[i], false);
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Save1Click(TObject *Sender)
{
  if (ActiveMDIChild) {
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    if (c->Editor1->FileName.Pos("NONAME") == 1)
      SaveAs1Click(this);
    else
      c->Editor1->SaveToFile(c->Editor1->FileName);
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::SaveAs1Click(TObject *Sender)
{
  int NoNameNum = 0;
  String Temp;
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    SaveDialog1->Title = "Save " + ExtractFileName(c->Editor1->FileName) + " As";
    SaveDialog1->Filter = OpenDialog1->Filter;
    if (c->Editor1->FileName.Pos("NONAME") != 1)
      SaveDialog1->FileName = c->Editor1->FileName;
    else {
      Temp = c->Caption;
      Temp.Delete(1, 6);
      NoNameNum = Temp.ToInt();
    }
    if (SaveDialog1->Execute()) {
      c->Editor1->SaveToFile(SaveDialog1->FileName);
      c->Editor1->FileName = SaveDialog1->FileName;
      c->Caption = SaveDialog1->FileName;
      if (c->Editor1->FileName.Pos("NONAME") != 1)
        NoNameSet >> (Byte)NoNameNum;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Exit1Click(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Cut1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)->ActiveEditor->CutToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Copy1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)->ActiveEditor->CopyToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Paste1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)->ActiveEditor->PasteFromClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Cascade1Click(TObject *Sender)
{
  Cascade();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Tile1Click(TObject *Sender)
{
  Tile();  
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ArrangeIcons1Click(TObject *Sender)
{
  ArrangeIcons();  
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::MinimizeAll1Click(TObject *Sender)
{
  // Must be done backwards through the MDIChildren array
  for (int i=MDIChildCount - 1;i > -1;i--)
    MDIChildren[i]->WindowState = wsMinimized;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::UpdateButtons(TObject* Sender)
{
  int StartLine, StopLine;
  int StartCol, StopCol;
  bool IsSelected;
  SaveBtn->Enabled = MDIChildCount > 0;
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    IsSelected = c->ActiveEditor->
      GetSelection(StartLine, StartCol, StopLine, StopCol);
    CutBtn->Enabled = IsSelected;
    CopyBtn->Enabled = IsSelected;
    OpenClipboard(Handle);
    PasteBtn->Enabled = GetClipboardData(CF_TEXT) != 0;
    CloseClipboard();
  }
  else {
    CutBtn->Enabled = false;
    CopyBtn->Enabled = false;
    PasteBtn->Enabled = false;
  }
  UpdateStatusLine();
}

void __fastcall TMainForm::FormDestroy(TObject *Sender)
{
  Screen->OnActiveFormChange = NULL;
  DragAcceptFiles(Application->Handle, false);
  DragAcceptFiles(Handle, false);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::PrintSetup1Click(TObject *Sender)
{
  PrinterSetupDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::File1Click(TObject *Sender)
{
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    Print1->Enabled = c->Editor1->TextLength > 0;
    Save1->Enabled = c->Editor1->TextLength > 0;
    SaveAs1->Enabled = c->Editor1->TextLength > 0;
  }
  else {
    Print1->Enabled = false;
    Save1->Enabled = false;
    SaveAs1->Enabled = false;
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Undo1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)->ActiveEditor->Undo();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Redo1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)->ActiveEditor->Redo();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Delete1Click(TObject *Sender)
{
  if (ActiveMDIChild)
    dynamic_cast<TMDIChild*>(ActiveMDIChild)
      ->ActiveEditor->ProcessCommand(ccDel, 0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::SelectAll1Click(TObject *Sender)
{
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    if (c->ActiveEditor->LineCount == -1) return;
    c->ActiveEditor->SelectAll(false);
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Edit1Click(TObject *Sender)
{
  int StartLine, StopLine;
  int StartCol, StopCol;
  bool IsSelected;
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    IsSelected = c->ActiveEditor->
      GetSelection(StartLine, StartCol, StopLine, StopCol);
    Undo1->Enabled = c->ActiveEditor->CanUndo();
    Undo2->Enabled = c->ActiveEditor->CanUndo();
    Redo1->Enabled = c->ActiveEditor->CanRedo();
    Redo2->Enabled = c->ActiveEditor->CanRedo();
    Copy1->Enabled = IsSelected;
    Copy2->Enabled = IsSelected;
    Cut1->Enabled = IsSelected;
    Cut2->Enabled = IsSelected;
    OpenClipboard(Handle);
    Paste1->Enabled = GetClipboardData(CF_TEXT) != 0;
    CloseClipboard();
    Paste2->Enabled = Paste1->Enabled;
    SelectAll1->Enabled = c->Editor1->TextLength > 0;
  }
  else {
    Undo1->Enabled = false;
    Undo2->Enabled = false;
    Redo1->Enabled = false;
    Redo2->Enabled = false;
    Copy1->Enabled = false;
    Copy2->Enabled = false;
    Cut1->Enabled = false;
    Cut2->Enabled = false;
    Paste1->Enabled = false;
    Paste2->Enabled = false;
    SelectAll1->Enabled = false;
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Window1Click(TObject *Sender)
{
  Cascade1->Enabled = MDIChildCount > 0;
  Tile1->Enabled = MDIChildCount > 0;
  ArrangeIcons1->Enabled = MDIChildCount > 0;
  MinimizeAll1->Enabled = MDIChildCount > 0;
  Split1->Enabled = ActiveMDIChild != NULL;
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    Split1->Checked = c->WindowIsSplit;
  }
  else
    Split1->Checked = false;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::About1Click(TObject *Sender)
{
  MdiAbout->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::AutoIndentation1Click(TObject *Sender)
{
  AutoIndentation1->Checked = !AutoIndentation1->Checked;
  UpdateChildOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::CreateBackupFile1Click(TObject *Sender)
{
  CreateBackupFile1->Checked = !CreateBackupFile1->Checked;
  UpdateChildOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Font1Click(TObject *Sender)
{
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    FontDialog1->Font->Assign(c->Editor1->FixedFont->Font);
  }
  if (FontDialog1->Execute()) {
    FontIsSet = true;
    UpdateChildOptions();
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Options1Click(TObject *Sender)
{
  Font1->Enabled = ActiveMDIChild != NULL;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::TabTypeClick(TObject *Sender)
{
  FixedTabs1->Checked = false;
  RealTabs1->Checked = false;
  SmartTabs1->Checked = false;
  dynamic_cast<TMenuItem*>(Sender)->Checked = true;
  UpdateChildOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::TabSize1Click(TObject *Sender)
{
  String S(TabSize);
  if (InputQuery("Tab Size", "Enter Tab Size", S)) {
    try {
      TabSize = S.ToInt();
      UpdateChildOptions();
    }
    catch (...) {
      return;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Wordwrap1Click(TObject *Sender)
{
  Wordwrap1->Checked = !Wordwrap1->Checked;
  UpdateChildOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::WraptoWindow1Click(TObject *Sender)
{
  WraptoWindow1->Checked = !WraptoWindow1->Checked;
  WrapatColumn1->Enabled = !WraptoWindow1->Checked;
  UpdateChildOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::WrapatColumn1Click(TObject *Sender)
{
  String S(WrapColumn);
  if (InputQuery("Word Wrap Column", "Word Wrap at Column:", S)) {
    try {
      WrapColumn = S.ToInt();
      UpdateChildOptions();
    }
    catch (...) {
      return;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::WordStarCommands1Click(TObject *Sender)
{
  WordStarCommands1->Checked = !WordStarCommands1->Checked;
    MainController->EntryCommands->Table[0]->IsActive = WordStarCommands1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Search1Click(TObject *Sender)
{
  if (ActiveMDIChild) {
    TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
    Find1->Enabled = c->Editor1->TextLength > 0;
    Replace1->Enabled = c->Editor1->TextLength > 0;
    FindNext1->Enabled = (c->Editor1->TextLength > 0
      && FindDialog1->FindText != "");
    GoToLine1->Enabled = c->Editor1->TextLength > 0;
  }
  else {
    Find1->Enabled = False;
    Replace1->Enabled = False;
    FindNext1->Enabled = False;
    GoToLine1->Enabled = False;
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::GoToLine1Click(TObject *Sender)
{
  String S = "1";
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  if (InputQuery("Go to Line Number", "Enter Line Number (1 to " +
    String((int)c->ActiveEditor->LineCount) + ")", S)) {
    try {
      c->ActiveEditor->SetCaretPosition(S.ToInt(), 1);
    }
    catch (...) {
      return;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Find1Click(TObject *Sender)
{
  FindDialog1->Position = Point(150, 150);
  FindDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FindDialog1Find(TObject *Sender)
{
  TFindDialog* dlg = dynamic_cast<TFindDialog*>(Sender);
  TFindDialog* rDlg = dynamic_cast<TReplaceDialog*>(Sender);
  OptionSet.Clear();
  if (!FindDialog1->Options.Contains(frDown))
    OptionSet << soBackward;
  if (FindDialog1->Options.Contains(frMatchCase))
    OptionSet << soMatchCase;
  if (FindDialog1->Options.Contains(frWholeWord))
    OptionSet << soWholeWord;
  if (!rDlg) dlg->CloseDialog();
  if (OptionSet.Contains(soReplace))
    OptionSet >> soReplace;
  if (OptionSet.Contains(soReplaceAll))
    OptionSet >> soReplaceAll;
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  if (!c->ActiveEditor->Search(dlg->FindText, OptionSet))
    MessageDlg("Search string '" + dlg->FindText + "' not found",
      mtInformation, TMsgDlgButtons() << mbOK, 0);
  if (rDlg)
    // Copy string to FindDialog so FindNext menu item will work
    FindDialog1->FindText = ReplaceDialog1->FindText;
  Search1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FindNext1Click(TObject *Sender)
{
  if (OptionSet.Contains(soReplace))
    OptionSet << soReplace;
  if (OptionSet.Contains(soReplaceAll))
    OptionSet << soReplaceAll;
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  if (!c->ActiveEditor->Search(FindDialog1->FindText, OptionSet))
    MessageDlg("Search string '" + FindDialog1->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Replace1Click(TObject *Sender)
{
  ReplaceDialog1->Position = Point(150, 150);
  if (ReplaceDialog1->Execute()) {
    OptionSet.Clear();
    if (ReplaceDialog1->Options.Contains(frMatchCase))
      OptionSet << soMatchCase;
    if (ReplaceDialog1->Options.Contains(frWholeWord))
      OptionSet << soWholeWord;
  }
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::ReplaceDialog1Replace(TObject *Sender)
{
  if (ReplaceDialog1->Options.Contains(frReplaceAll))
    OptionSet << soReplaceAll;
  else OptionSet << soReplace;
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  if (c->ActiveEditor->Replace(ReplaceDialog1->FindText,
    ReplaceDialog1->ReplaceText, OptionSet) == -1)
      MessageDlg("Search string '" + ReplaceDialog1->FindText +
        "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Split1Click(TObject *Sender)
{
  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  c->SplitWindow();
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::Print1Click(TObject *Sender)
{
  int I;
  String S;
  int X, Y, YD;
  int StartLine = 0, StopLine = 0;
  int StartCol, StopCol;

  TMDIChild* c = dynamic_cast<TMDIChild*>(ActiveMDIChild);
  if (!c) return;
  if (c->ActiveEditor->GetSelection(StartLine, StartCol, StopLine, StopCol)) {
    PrintDialog1->Options << poSelection;
    PrintDialog1->PrintRange = prSelection;
  }
  else
    PrintDialog1->Options >> poSelection;
  if (!PrintDialog1->Execute()) return;

  // assign editor font to printer
  Printer()->Canvas->Font = c->ActiveEditor->FixedFont->Font;

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
    if (StopLine == 0) StopLine = c->ActiveEditor->LineCount;
    Printer()->BeginDoc();
    for (I=StartLine;I<StopLine + 1;I++) {
      S = c->ActiveEditor->Lines[I];
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
