//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ExOutLn0.h"
#include <stdlib.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "OvcBase"
#pragma link "OvcCmbx"
#pragma link "OvcDRpVw"
#pragma link "OvcOutln"
#pragma link "OvcRptVw"
#pragma link "OvcRvCbx"
#pragma link "OvcRVIdx"
#pragma link "OvcSplit"
#pragma link "OvcVLB"
#pragma resource "*.dfm"
#pragma resource "ExOutlng.res"

TForm1 *Form1;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ImageList1->ResourceLoad(rtBitmap, "GLYPHS", clOlive);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
  for (char c = 'A'; c <= 'Z'; c++)  {
    String root = c;
    AppendStr(root, ":");
    int DriveType = GetDriveType(root.c_str());
    switch (DriveType)  {
      case DRIVE_REMOVABLE :
        OvcOutline1->Nodes->AddObjectEx(root, NewStr(root), 2, omDynamicLoad);
        break;
      case DRIVE_FIXED     :
        OvcOutline1->Nodes->AddObjectEx(root, NewStr(root), 2, omDynamicLoad);
        break;
      case DRIVE_REMOTE    :
        OvcOutline1->Nodes->AddObjectEx(root, NewStr(root), 2, omDynamicLoad);
        break;
      case DRIVE_CDROM     :
        OvcOutline1->Nodes->AddObjectEx(root, NewStr(root), 2, omDynamicLoad);
        break;
      case DRIVE_RAMDISK   :
        OvcOutline1->Nodes->AddObjectEx(root, NewStr(root), 2, omDynamicLoad);
        break;
    }
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1DynamicLoad(TOvcCustomOutline *Sender,
      TOvcOutlineNode *Node)
{
  TCursor OldCursor = Screen->Cursor;
  Screen->Cursor = crHourGlass;
  try
  {
    if (Node->Data != 0)
      AddDirectories(Node, (String*)(Node->Data));
  }
  __finally
  {
    Screen->Cursor = OldCursor;
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1Click(TObject *Sender)
{
  Screen->Cursor = crHourGlass;
  try
  {
    OvcDataReportView1->Items->Clear();
    if (OvcOutline1->ItemIndex != -1)
      AddFiles((String*)OvcOutline1->Node[OvcOutline1->ItemIndex]->Data);
  }
  __finally
  {
    Screen->Cursor = crDefault;
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1ActiveChange(TOvcCustomOutline *Sender,
      TOvcOutlineNode *OldNode, TOvcOutlineNode *NewNode)
{
  if ((OldNode != 0) && (OldNode->ImageIndex == 1))
    OldNode->ImageIndex = 0;
  if ((NewNode != 0) && (NewNode->ImageIndex == 0))
    NewNode->ImageIndex = 1;
}

//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1NodeDestroy(TOvcCustomOutline *Sender,
      TOvcOutlineNode *Node)
{
  DisposeStr((String*)Node->Data);
}

//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDataReportView1DblClick(TObject *Sender)
{
  if (OvcDataReportView1->CurrentItem != 0)  {
    String CommandLine = OvcDataReportView1->CurrentItem->AsString[5] +
      "\\" + OvcDataReportView1->CurrentItem->AsString[0];
    String Path = OvcDataReportView1->CurrentItem->AsString[5];
    ShellExecute(0, "open" , CommandLine.c_str(), 0, Path.c_str(), SW_SHOWNORMAL);
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::AddDirectories(TOvcOutlineNode* TreeRoot, String* DirPath)
{
  TSearchRec SearchRec;
  OvcOutline1->BeginUpdate();
  try
  {
    if (FindFirst(*DirPath + "\\*.*", faDirectory, SearchRec) == 0)  {
      try
      {
        bool Done = false;
        while (!Done) {
          if ((SearchRec.Attr & faDirectory) != 0)
            if (SearchRec.Name != ".")
              if (SearchRec.Name != "..")  {
                String Path = *DirPath + "\\" + SearchRec.Name;
                OvcOutline1->Nodes->AddChildObjectEx(TreeRoot, SearchRec.Name,
                  NewStr(Path), 0, omDynamicLoad);
              }
          if (FindNext(SearchRec) != 0)
            Done = true;
        }
      }
      __finally
      {
        FindClose(SearchRec);
      }
    }
  }
  __finally
  {
    OvcOutline1->EndUpdate();
  }
}

//---------------------------------------------------------------------------
void __fastcall TForm1::AddFiles(String* DirPath)
{
  TSearchRec SearchRec;
  OvcDataReportView1->BeginUpdate();
  try
  {
    if (FindFirst(*DirPath + "\\*.*", faAnyFile, SearchRec) == 0)  {
      try
      {
        bool Done = false;
        while (!Done)  {
          if ((SearchRec.Attr & faDirectory) == 0)  {
            TOvcDataRvItem* Item = OvcDataReportView1->Items->Add();
            Item->AsString[0] = SearchRec.Name;
            Item->AsInteger[1] = SearchRec.Size;
            Item->AsString[2] = TypeString(SearchRec.Name);
            Item->AsDateTime[3] = FileDateToDateTime(SearchRec.Time);
            Item->AsString[4] = AttrString(SearchRec.Attr);
            Item->AsString[5] = *DirPath;
          }
          if (FindNext(SearchRec) != 0)
            Done = true;
        }
      }
      __finally
      {
        FindClose(SearchRec);
      }
    }
  }
  __finally
  {
    OvcDataReportView1->EndUpdate();
  }
}

//---------------------------------------------------------------------------
String __fastcall TForm1::TypeString(String FileName)
{
  String Result = UpperCase(ExtractFileExt(FileName));
  if (Result != "")
    Result.Delete(1, 1);
  return Result;
}

//---------------------------------------------------------------------------
String __fastcall TForm1::AttrString(int Attr)
{
  String Result = "";
  if ((Attr && faArchive) != 0)
    AppendStr(Result, "A");
  if ((Attr && faReadOnly) != 0)
    AppendStr(Result, "R");
  if ((Attr && faHidden) != 0)
    AppendStr(Result, "H");
  if ((Attr && faSysFile) != 0)
    AppendStr(Result, "S");
  return Result;
}

//---------------------------------------------------------------------------

