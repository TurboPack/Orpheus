//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExLkOutu.h"
//---------------------------------------------------------------------------
#pragma link "OvcLkOut"
#pragma link "OvcBase"
#pragma link "OvcState"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miLargeIconsClick(TObject *Sender)
{
  LOB->Folders[LOB->ActiveFolder]->IconSize = isLarge;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miSmallIconsClick(TObject *Sender)
{
  LOB->Folders[LOB->ActiveFolder]->IconSize = isSmall;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::PopupMenu1Popup(TObject *Sender)
{
  miLargeIcons->Checked = (LOB->Folders[LOB->ActiveFolder]->IconSize == isLarge);
  miSmallIcons->Checked = (LOB->Folders[LOB->ActiveFolder]->IconSize == isSmall);
  miRenameFolder->Enabled = (LOB->PreviousFolder > -1);
  miRenameItem->Enabled = (LOB->PreviousItem > -1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miRenameFolderClick(TObject *Sender)
{
  if (LOB->PreviousFolder > -1)
    LOB->RenameFolder(LOB->PreviousFolder);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miRenameItemClick(TObject *Sender)
{
  if (LOB->ActiveFolder > -1)
    LOB->RenameItem(LOB->ActiveFolder, LOB->PreviousItem);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miAddItemClick(TObject *Sender)
{
  int i = LOB->ActiveItem;
  if (i == -1)
    i = 0;
  LOB->InsertItem("New Item", LOB->ActiveFolder, i, 9);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::miAddFolderClick(TObject *Sender)
{
  LOB->InsertFolder("New Folder", LOB->FolderCount);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::LOBDragDrop(TObject *Sender, TObject *Source, int X,
	int Y, int FolderIndex, int ItemIndex)
{
  int i;
  if (Source == ListBox1)  {
    i = LOB->GetItemAt(X, Y);
    while ((i == -1) && (Y < LOB->Height))  {
      Y = Y + 8;
      i = LOB->GetItemAt(X, Y);
    }
    if (i == -1)
      i = 0;
    LOB->InsertItem(ListBox1->Items->Strings[ListBox1->ItemIndex],
                    LOB->ActiveFolder, i, 9);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::LOBDragOver(TObject *Sender, TObject *Source, int X,
	int Y, TDragState State, bool &AcceptFolder, bool &AcceptItem)
{
  AcceptItem = (Source == ListBox1);
  AcceptFolder = (Source == ListBox1);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ImageList1->ResourceLoad(rtBitmap, "GLYPHS", clOlive);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::LOBItemClick(TObject *Sender, TMouseButton Button,
      TShiftState Shift, int Index)
{
  int I;

  if ((LOB->ActiveFolder > -1) & (LOB->ActiveItem > -1)) {
    lblTitle->Caption = LOB->Folders[LOB->ActiveFolder]->Items[LOB->ActiveItem]->Caption;
    I = LOB->Folders[LOB->ActiveFolder]->Items[LOB->ActiveItem]->IconIndex;
    imgTitle->Repaint();
    ImageList1->Draw(imgTitle->Canvas, 0, 0, I);
  };
}
//---------------------------------------------------------------------------

