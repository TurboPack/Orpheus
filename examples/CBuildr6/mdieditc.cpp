//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdio.h>

#include "Mdieditm.h"
#include "Mdieditc.h"
//---------------------------------------------------------------------------
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TMDIChild *MDIChild;
//---------------------------------------------------------------------------
__fastcall TMDIChild::TMDIChild(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::FormClose(TObject *Sender, TCloseAction &Action)
{
  Action = caFree;
  String Temp;
  if (Caption.Pos("NONAME") == 1) {
    Temp = Caption;
    Temp.Delete(1, 6);
    MainForm->NoNameSet >> (Byte)Temp.ToInt();
  }
}
//---------------------------------------------------------------------------
void TMDIChild::SplitWindow()
{
  WindowIsSplit = !WindowIsSplit;
  MainForm->Split1->Checked = WindowIsSplit;
  if (WindowIsSplit) {
    Editor1->Align = alBottom;
    Editor1->Height = ClientHeight / 2;
    SplitPanel = new TPanel(this);
    SplitPanel->Align = alBottom;
    SplitPanel->Height = 5;
    SplitPanel->Cursor = crVSplit;
    SplitPanel->BorderStyle = bsSingle;
    SplitPanel->OnMouseDown = SplitPanelMouseDown;
    SplitPanel->OnMouseUp = SplitPanelMouseUp;
    SplitPanel->OnMouseMove = SplitPanelMouseMove;
    SplitPanel->Parent = this;
    Editor2 = new TOvcTextFileEditor(this);
    Editor2->Controller = MainForm->MainController;
    Editor2->Align = alClient;
    Editor2->BorderStyle = bsNone;
    Editor2->HideSelection = false;
    Editor2->OnEnter = &Editor1Enter;
    Editor2->OnShowStatus = Editor1ShowStatus;
    Editor2->Parent = this;
    UpdateOptions();
    Editor2->Attach(Editor1);
  }
  else {
    ActiveEditor = Editor1;
    delete Editor2;
    delete SplitPanel;
    Editor2 = 0;
    SplitPanel = 0;
    Editor1->Align = alClient;
  }
}

void TMDIChild::UpdateEditor(TOvcTextFileEditor* Editor)
{
  Editor->TabSize = (Word)MainForm->TabSize;
  if (MainForm->FontIsSet)
    Editor->FixedFont->Assign(MainForm->FontDialog1->Font);
  Editor->WordWrap = MainForm->Wordwrap1->Checked;
  Editor->WrapColumn = MainForm->WrapColumn;
  Editor->AutoIndent = MainForm->AutoIndentation1->Checked;
  Editor->MakeBackup = MainForm->CreateBackupFile1->Checked;
  if (MainForm->FixedTabs1->Checked) Editor->TabType = ttFixed;
  if (MainForm->RealTabs1->Checked) Editor->TabType = ttReal;
  if (MainForm->SmartTabs1->Checked) Editor->TabType = ttSmart;
  if (MainForm->WraptoWindow1->Checked)
    Editor->WrapColumn = Editor->VisibleColumns;
}

void TMDIChild::UpdateOptions()
{
  UpdateEditor(Editor1);
  if (Editor2) UpdateEditor(Editor2);
}

void __fastcall TMDIChild::FormResize(TObject *Sender)
{
  if (MainForm->WraptoWindow1->Checked)
    Editor1->WrapColumn = Editor1->VisibleColumns;
  if (WindowIsSplit) {
    SplitPanel->Align = alTop;
    Editor1->Height = MulDiv(Editor1->Height, ClientHeight, StoredHeight);
    SplitPanel->Align = alBottom;
  }
  StoredHeight = ClientHeight;
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::FormCreate(TObject *Sender)
{
  Editor1->Controller = MainForm->MainController;
  WindowIsSplit = false;
  Editor2 = 0;
  SplitPanel = 0;
  StoredHeight = ClientHeight;
  ActiveEditor = Editor1;
  Sizing = false;
  NeedsErase = false;
  UpdateOptions();
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::Editor1ShowStatus(TObject *Sender, int LineNum,
  int ColNum)
{
  MainForm->UpdateStatusLine();
  MainForm->UpdateButtons(this);
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  int ButtonSelected;
  if (Editor1->Modified) {
    char buff[80];
    sprintf(buff, "%s has changed, do you wish to save?", Caption.c_str());
    ButtonSelected = MessageDlg(
      buff, mtInformation, TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
    if (ButtonSelected & mrYes) {
      BringToFront();
      SetFocus();
      MainForm->Save1Click(this);
      CanClose = true;
    }
    else
      CanClose = (ButtonSelected & mrNo);
  }
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::FormActivate(TObject *Sender)
{
  MainForm->Split1->Checked = WindowIsSplit;
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::FormDestroy(TObject *Sender)
{
  delete Editor2;
  delete SplitPanel;
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::Editor1Enter(TObject *Sender)
{
  ActiveEditor = dynamic_cast<TOvcTextFileEditor*>(Sender);
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::SplitPanelMouseDown(TObject *Sender,
  TMouseButton Button, TShiftState Shift, int X, int Y)
{
  TPoint SPos;
  Sizing = true;
  SPos = SplitPanel->ClientToScreen(Point(X, Y));
  SizeStart = SPos.y;
  LinePos = SPos;                                                
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::SplitPanelMouseUp(TObject *Sender,
  TMouseButton Button, TShiftState Shift, int X, int Y)
{
  int NewHeight;
  HDC DC;
  if (NeedsErase) {
    DC = GetDC(0);
    PatBlt(DC, LinePos.x, LinePos.y, ClientWidth, 1, DSTINVERT);
    ReleaseDC(0, DC);
    NeedsErase = false;
  }
  NewHeight = (int)(Editor1->Height + SizeStart - LinePos.y);
  Editor1->Height = NewHeight;
  Sizing = false;
}
//---------------------------------------------------------------------------
void __fastcall TMDIChild::SplitPanelMouseMove(TObject *Sender,
  TShiftState Shift, int X, int Y)
{
  HDC DC;
  TPoint SPos, CPos;
  if (Sizing) {
    SPos = SplitPanel->ClientToScreen(Point(SplitPanel->Left, Y));
    CPos = ClientOrigin;
    if (SPos.y <= CPos.y + 3) return;
    if (SPos.y >= CPos.y + ClientHeight - 3) return;
    if (NeedsErase) {
      DC = GetDC(0);
      PatBlt(DC, SPos.x, LinePos.y, ClientWidth, 1, DSTINVERT);
      ReleaseDC(0, DC);
      NeedsErase = false;
    }
    DC = GetDC(0);
    PatBlt(DC, SPos.x, SPos.y, ClientWidth, 1, DSTINVERT);
    ReleaseDC(0, DC);
    NeedsErase = true;
    LinePos = SPos;
  }
}
//---------------------------------------------------------------------------
