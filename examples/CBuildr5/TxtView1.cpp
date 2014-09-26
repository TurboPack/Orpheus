//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <shellapi.h>

#include "TxtView1.h"
#include "TxtView2.h"
//---------------------------------------------------------------------------
#pragma link "OvcViewr"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TViewForm *ViewForm;
//---------------------------------------------------------------------------
__fastcall TViewForm::TViewForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::AppMessage(TMsg& Msg, bool& Handled)
{
  HDROP hDrop;
  char DroppedName[MAX_PATH];
  if (Msg.message == WM_DROPFILES) {
    Handled = true;
    hDrop = (HDROP)Msg.wParam;
    DragQueryFile(hDrop, 0, DroppedName, sizeof(DroppedName));
    Viewer1->FileName = DroppedName;
    Viewer1->IsOpen = true;
    DragFinish(hDrop);
    if (IsIconic(Application->Handle))
      ShowWindow(Application->Handle, SW_SHOWNORMAL);
    else
      BringWindowToTop(Handle);
  }
}

void __fastcall TViewForm::Font1Click(TObject *Sender)
{
  FontDialog1->Font->Assign(Viewer1->FixedFont->Font);
  if (FontDialog1->Execute())
    Viewer1->FixedFont->Assign(FontDialog1->Font);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Open1Click(TObject *Sender)
{
  if (OpenDialog1->Execute()) {
    Viewer1->FileName = OpenDialog1->FileName;
    Viewer1->IsOpen = true;
    Caption = "Text Edit - " + OpenDialog1->FileName;
    Search1Click(this);
    Clipboard1Click(this);
  }
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Exit1Click(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::PrintSetup1Click(TObject *Sender)
{
  PrinterSetupDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::SelectAll1Click(TObject *Sender)
{
  Viewer1->SelectAll(false);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Clipboard1Click(TObject *Sender)
{
  TOvcViewerRange SelRange;
  SelectAll1->Enabled = Viewer1->LineCount > 0;
  Copy1->Enabled = Viewer1->GetSelection(SelRange.Start.Line, SelRange.Start.Col,
          SelRange.Stop.Line, SelRange.Stop.Col);
  Copy2->Enabled = Viewer1->GetSelection(SelRange.Start.Line, SelRange.Start.Col,
          SelRange.Stop.Line, SelRange.Stop.Col);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::File1Click(TObject *Sender)
{
  Print1->Enabled = Viewer1->LineCount > 0;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Copy1Click(TObject *Sender)
{
  Viewer1->CopyToClipboard();
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Search1Click(TObject *Sender)
{
  Find1->Enabled = Viewer1->LineCount > 0;
  FindNext1->Enabled =
    (Viewer1->LineCount > 0) && (FindDialog1->FindText != "");
  GotoLine1->Enabled = Viewer1->LineCount > 0;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::GotoLine1Click(TObject *Sender)
{
  String S = "1";
  if (InputQuery("Go to Line Number", "Enter Line Number (1 to " +
    String((int)Viewer1->LineCount) + String(")"), S))
    try {
      Viewer1->SetCaretPosition(S.ToInt(), 1);
    }
    catch (...) {
      return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Viewer1ShowStatus(TObject *Sender, int LineNum,
  int ColNum)
{
  StatusBar1->Panels->Items[0]->Text =
    String((int)Viewer1->CaretEffectivePos.Line + 1) + ":" +
    String((int)Viewer1->CaretEffectivePos.Col + 1);
  StatusBar1->Panels->Items[1]->Text =
    "Total: " + String((int)Viewer1->LineCount);
  StatusBar1->Panels->Items[2]->Text =
    "Top: " + String((int)Viewer1->TopLine + 1);
  StatusBar1->Panels->Items[3]->Text =
    "Bytes: " + String((int)Viewer1->FileSize);
  StatusBar1->Update();
  Clipboard1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::About1Click(TObject *Sender)
{
  ViewAbout->ShowModal();
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FormCreate(TObject *Sender)
{
  TabExpansion1->Checked = Viewer1->ExpandTabs;
  DragAcceptFiles(Application->Handle, true);
  DragAcceptFiles(Handle, true);
  Application->OnMessage = AppMessage;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::TabExpansion1Click(TObject *Sender)
{
  TabExpansion1->Checked = !TabExpansion1->Checked;
  Viewer1->ExpandTabs = TabExpansion1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::TabSize1Click(TObject *Sender)
{
  String S = String(Viewer1->TabSize);
  if (InputQuery("Tab Size", "Enter Tab Size", S))
    try {
      Viewer1->TabSize = (Word)S.ToInt();
    }
    catch (...) {
      return;
    }
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Find1Click(TObject *Sender)
{
  FindDialog1->Execute();
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FindDialog1Find(TObject *Sender)
{
  OptionSet.Clear();
  if (!FindDialog1->Options.Contains(frDown))
    OptionSet << soBackward;
  if (FindDialog1->Options.Contains(frMatchCase))
    OptionSet << soMatchCase;
  if (FindDialog1->Options.Contains(frWholeWord))
    OptionSet = OptionSet << soWholeWord;
  if (!Viewer1->Search(FindDialog1->FindText, OptionSet))
    MessageDlg("Search string '" + FindDialog1->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
  Search1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FindNext1Click(TObject *Sender)
{
  if (!Viewer1->Search(FindDialog1->FindText, OptionSet))
    MessageDlg("Search string '" + FindDialog1->FindText +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
  Search1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::WordStarCommands1Click(TObject *Sender)
{
  WordStarCommands1->Checked = ! WordStarCommands1->Checked;
  DefaultController->EntryCommands->Table[0]->IsActive = WordStarCommands1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FormDestroy(TObject *Sender)
{
  DragAcceptFiles(Application->Handle, False);
  DragAcceptFiles(Handle, False);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Print1Click(TObject *Sender)
{
  int I;
  String S;
  int X, Y, YD;
  int StartLine = 0, StopLine = 0;
  int StartCol, StopCol;

  if (Viewer1->GetSelection(StartLine, StartCol, StopLine, StopCol)) {
    PrintDialog1->Options << poSelection;
    PrintDialog1->PrintRange = prSelection;
  }
  else
    PrintDialog1->Options >> poSelection;
  if (!PrintDialog1->Execute()) return;

  // assign editor font to printer
  Printer()->Canvas->Font = Viewer1->FixedFont->Font;

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
    if (StopLine == 0) StopLine = Viewer1->LineCount;
    Printer()->BeginDoc();
    for (I=StartLine;I<StopLine + 1;I++) {
      S = Viewer1->Lines[I];
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
