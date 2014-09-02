//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>
#include <stdlib.h>
#include <shellapi.h>

#include "FilView1.h"
#include "FilView2.h"
#include "FilView3.h"
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
  HWND hDrop;
  char DroppedName[80];

  if (Msg.message == WM_DROPFILES) {
    Handled = True;
    hDrop = (HWND)Msg.wParam;
    DragQueryFile(hDrop, 0, DroppedName, sizeof(DroppedName));
    Viewer1->FileName = DroppedName;
    Viewer1->IsOpen = True;
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
    if (FontDialog1->Font != NULL)
      Viewer1->FixedFont->Assign(FontDialog1->Font);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Open1Click(TObject *Sender)
{
  if (OpenDialog1->Execute()) {
    Viewer1->FileName = OpenDialog1->FileName;
    Viewer1->IsOpen = True;
    ViewForm->Caption = "File View - " + OpenDialog1->FileName;
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
void __fastcall TViewForm::Print1Click(TObject *Sender)
{
  char Buf[1024];
  TOvcViewerRange SelRange;
  int startLine, endLine;

  if (Viewer1->GetSelection(SelRange.Start.Line, SelRange.Start.Col,
     SelRange.Stop.Line, SelRange.Stop.Col))
    PrintDialog1->Options << poSelection;
  else PrintDialog1->Options >> poSelection;
  if (PrintDialog1->Execute()) {
    int lineHeight = abs(
      MulDiv(Printer()->Canvas->Font->Size,
      GetDeviceCaps(Printer()->Handle, LOGPIXELSY), 72));
    lineHeight *= 1.4;
    int linesPerPage =
      (Printer()->PageHeight/lineHeight) - 4;
    int lineCount = 4;
    Printer()->BeginDoc();
    TRect rect;
    rect.Top = lineHeight;
    rect.Left = 20;
    rect.Right =  Printer()->PageWidth;
    rect.Bottom = lineHeight * 2;
    DrawText(Printer()->Handle,
      OpenDialog1->FileName.c_str(), -1, (RECT*)&rect, DT_CENTER);
    //
    // Loop through all of the lines and print each one.
    //
    Printer()->Canvas->Font = Viewer1->FixedFont->Font;
    switch (PrintDialog1->PrintRange) {
      case prAllPages : {
        if (Viewer1->LineCount == 2147483647)
          // checking this invalid line forces reading of all lines
          Viewer1->CheckLine(2147483647);
        startLine = 0;
        endLine = Viewer1->LineCount;
        break;
      }
      case prSelection : {
        startLine = SelRange.Start.Line;
        endLine = SelRange.Stop.Line + 1;
        break;
      }
    }
    for (int i=startLine;i<endLine;i++) {
      //
      // When we get to the bottom of the page reset the
      // line counter, eject the page, and start a new page.
      //
      if (lineCount++ == linesPerPage) {
        lineCount = 4;
        Printer()->NewPage();
      }
      //
      // Get the next string and print it using TextOut()
      //
      Viewer1->GetPrintableLine(i, Buf, sizeof(Buf));
      Printer()->Canvas->TextOut
        (0, lineCount * lineHeight, Buf);
    }
    //
    // All done.
    //
    Printer()->EndDoc();
  }
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
  FindNext1->Enabled = (Viewer1->LineCount > 0) && (FindDlg->Edit1->Text != "");
  GotoLine1->Enabled = Viewer1->LineCount > 0;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::GotoLine1Click(TObject *Sender)
{
  String S;
  TOvcTextPos GoPos;

  S = "";
  char buff[30];
  sprintf(buff, "Enter Line Number (1 to %d)", Viewer1->LineCount);
  if (InputQuery("Go to Line Number", buff, S))
    try {
      GoPos.Line = S.ToInt() - 1;
    }
    catch (...) {
      return;
    }
    GoPos.Col = 0;
    Viewer1->CaretActualPos = GoPos;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::Viewer1ShowStatus(TObject *Sender, int LineNum,
  int ColNum)
{
  String S;

  S = String((int)(Viewer1->CaretEffectivePos.Line + 1)) +
       ":" + String((int)Viewer1->CaretEffectivePos.Col + 1);
  while (S.Length() < 8) {
    S += " ";
  }
  Header1->Sections->Strings[0] = S;
  if (Viewer1->LineCount == 2147483647)
    S = "?";
  else
    S = (int)Viewer1->LineCount;
  Header1->Sections->Strings[1] = "Total: " + S;
  S = (int)(Viewer1->TopLine + 1);
  while (S.Length() < 5) {
    S += " ";
  }
  Header1->Sections->Strings[2] = "Top: " + S;
  Header1->Sections->Strings[3] = "Bytes: " + String((int)Viewer1->FileSize);
  Clipboard1Click(this);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::About1Click(TObject *Sender)
{
  FileAbout->ShowModal();
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
  String S = Viewer1->TabSize;
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
  TSearchOptionSet OptionSet;

  FindDlg->ShowModal();
  if (FindDlg->ModalResult == mrOk) {
    OptionSet.Clear();
    if (FindDlg->RadioButton2->Checked)
      OptionSet << soBackward;
    if (FindDlg->CheckBox1->Checked)
      OptionSet << soMatchCase;
    if (FindDlg->CheckBox2->Checked)
      OptionSet << soGlobal;
    if (!Viewer1->Search(FindDlg->Edit1->Text, OptionSet))
      MessageDlg("Search string '" + FindDlg->Edit1->Text +
        "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
    Search1Click(this);
  }
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FindNext1Click(TObject *Sender)
{
  TSearchOptionSet OptionSet;
  OptionSet.Clear();
  if (FindDlg->RadioButton2->Checked)
    OptionSet << soBackward;
  if (FindDlg->CheckBox1->Checked)
    OptionSet << soMatchCase;
  if (!Viewer1->Search(FindDlg->Edit1->Text, OptionSet))
    MessageDlg("Search string '" + FindDlg->Edit1->Text +
      "' not found", mtInformation, TMsgDlgButtons() << mbOK, 0);
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::WordStarCommands1Click(TObject *Sender)
{
  WordStarCommands1->Checked = !WordStarCommands1->Checked;
  if (WordStarCommands1->Checked)
    DefaultController->EntryCommands->Table[0]->IsActive = true;
  else
    DefaultController->EntryCommands->Table[0]->IsActive = false;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::HexMode1Click(TObject *Sender)
{
  HexMode1->Checked = !HexMode1->Checked;
  Viewer1->InHexMode = HexMode1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TViewForm::FormDestroy(TObject *Sender)
{
  DragAcceptFiles(Application->Handle, false);
  DragAcceptFiles(Handle, false);
}
//---------------------------------------------------------------------------
