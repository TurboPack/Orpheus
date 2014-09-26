//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "ExTbHnt1.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TForm1 *Form1;

TOvcTblRegion Region;
TRowNum       RowNum;
TColNum       ColNum;
THintWindow*  HintWindow;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  HintWindow = new THintWindow(OvcTable);	
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormDestroy(TObject *Sender)
{
  delete(HintWindow);	
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTableMouseMove(TObject *Sender, TShiftState Shift,
	int X, int Y)
{
  TRowNum NewRow;
  TColNum NewCol;
  Region = OvcTable->CalcRowColFromXY(X, Y, NewRow, NewCol);
  if (Region == otrInMain)  {
    if ((NewRow != RowNum) | (NewCol != ColNum))  {
      RowNum = NewRow;
      ColNum = NewCol;
      HintWindow->ReleaseHandle();
      Timer->Enabled = true;
    }
  }
  else
    HintWindow->ReleaseHandle();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::TimerTimer(TObject *Sender)
{
  TPoint P, Q;
  TRect R;
  char Hint[3];
  if (Region == otrInMain)  {
    sprintf(Hint, "%d", 10*RowNum + ColNum);
    P.x = OvcTable->ColOffset[ColNum];
    P.y = OvcTable->RowOffset[RowNum];
    Q = OvcTable->ClientToScreen(P);
    R.Left   = Q.x;
    R.Top    = Q.y;
    R.Right  = Q.x+20;
    R.Bottom = Q.y+20;
    HintWindow->ActivateHint(R, Hint);
  }
  Timer->Enabled = false;
}
//---------------------------------------------------------------------------
