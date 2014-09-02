// Example showing how to work with data used by the table outside the table's
// usual method. In this case, the data accessed by a TOvcTCTMemo is always
// displayed in lower case but stored in the data structure in upper case. This
// could be expanded to access a memo field in a database and store the changed
// data back to the database. The PictureField accesses a numeric value but 
// displays and edits the data as a string. When the data is placed back to the
// data structure, it is converted back to a numeric value. This principle might
// be expanded to allow custom picture mask editing, data conversion, etc.
//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExTbl03U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCPic"
#pragma link "OvcTCBEF"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
Word TForm1::String2GroupNr(GroupNrString S)
{
  String temp = S;
  __int8 w1 = (__int8)temp.SubString(2, 1).ToInt();
  __int8 w2 = (__int8)temp.SubString(4, 4).ToInt();
  return MAKEWORD(w2, w1);
}

GroupNrString TForm1::GroupNr2String(Word N)
{
  String S1 = HIBYTE(N);
  while (S1.Length() < 2) {
    S1 = " " + S1;
  }
  String S2 = LOBYTE(N);
  while (S2.Length() < 4) {
    S2 = "0" + S2;
  }
  return GroupNrString(String(S1 + "/" + S2));
}



void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if (RowNum > 0 && RowNum < 10) {
    switch (ColNum) {
      case 1 : {
        if (Purpose != cdpForSave) {
          strcpy(ABuf, MyMemos[RowNum - 1]);
          strcpy(ABuf, strlwr(ABuf));
        }
        Data = ABuf;
        break;
      }
      case 2 : {
        if (Purpose != cdpForSave)
          AString = GroupNr2String(MyWords[RowNum - 1]);
        Data = &AString;
        break;
      }
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  for (Word i=0;i<9;i++) {
    MyWords[i] = i;
    if ((i % 2) == 0)
      strcpy(MyMemos[i], "a");
    else
      strcpy(MyMemos[i], "A");
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1DoneEdit(TObject *Sender, int RowNum,
  int ColNum)
{
  if (ColNum == 1)
    strcpy(MyMemos[RowNum - 1], strupr(ABuf));
  if (ColNum == 2)
    MyWords[RowNum - 1] = String2GroupNr(AString);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  ShowMessage(MyMemos[OvcTable1->ActiveRow - 1]);
}
//---------------------------------------------------------------------------
