//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExEdODu.h"
//---------------------------------------------------------------------------
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTextFileEditor1DrawLine(TObject *Sender,
  TCanvas *EditorCanvas, TRect &Rect, PChar S, int Len, int Line, int Pos,
  int Count, int HBLine, int HBCol, int HELine, int HECol, bool &WasDrawn)
{
  TColor SC;
  int L;
  char Buf[1024];

  if (Len <= 0) return;

  if (!(Line % 2)) {
    WasDrawn = True;

    strcpy(Buf, S + Pos);
    L = strlen(Buf);
    if (Count < L)
      L = Count;

    SC = EditorCanvas->Font->Color;
    EditorCanvas->Font->Color = clRed;
    ExtTextOut(EditorCanvas->Handle, Rect.Left, Rect.Top+1,
      ETO_CLIPPED | ETO_OPAQUE, (RECT*)&Rect, Buf, L, 0);
    // restore font color
    EditorCanvas->Font->Color = SC;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

