//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExCombo1.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCHdr"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCCBx"
#pragma resource "*.dfm"
/* This example shows two techniques...one where the string portion (if the
   user added something not in the list) is temporarily stored in your
   "database" and the second technique uses a temporary record for the
   string, and only stores the index in the database.  The second method
   takes a little more work, since you have to use the OnDoneEdit event to
   update the database.

   Note that you will have to devise some sort of way to initialize the
   combobox"s "Items" property when you initialize the table and/or form...
   and of course to store the "Items" list before you exit the form and/or
   program.  This, of course, depends on what you are doing with your data.

   You"ll also likely want to change some properties in the combobox to help
   you enforce not adding two identical items, etc...and also synch the
   combobox"s index to the index in the database (so the highlighted item in
   the list matches the item in the edit when you first pull it up).  I
   wanted to keep the example as simple as possible, so I didn"t bother with
   those details.  You will likely make use of the OnBeginEdit event to
   handle some of these details...

   There are a couple of key properties to set in the combo, so be sure to
   check what I have done carefully.  A biggie that comes to mind is that
   MaxLength must be properly set.
*/
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
  TestDatabase[0].C1Index = 2;
  TestDatabase[0].C1String = "";
  TestDatabase[0].C2Index = 7;
  TestDatabase[1].C1Index = 2;
  TestDatabase[1].C1String = "";
  TestDatabase[1].C2Index = 4;
  TestDatabase[2].C1Index = 4;
  TestDatabase[2].C1String = "";
  TestDatabase[2].C2Index = 9;
  TestDatabase[3].C1Index = 6;
  TestDatabase[3].C1String = "";
  TestDatabase[3].C2Index = 8;
  TestDatabase[4].C1Index = 1;
  TestDatabase[4].C1String = "";
  TestDatabase[4].C2Index = 2;
  TestDatabase[5].C1Index = 4;
  TestDatabase[5].C1String = "";
  TestDatabase[5].C2Index = 5;
  TestDatabase[6].C1Index = 7;
  TestDatabase[6].C1String = "";
  TestDatabase[6].C2Index = 6;
  TestDatabase[7].C1Index = 3;
  TestDatabase[7].C1String = "";
  TestDatabase[7].C2Index = 7;
  TestDatabase[8].C1Index = 5;
  TestDatabase[8].C1String = "";
  TestDatabase[8].C2Index = 1;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  CellData = "";
  Data = &CellData;
  if (RowNum > 0 && RowNum < 9)
    switch (ColNum) {
      case 1 : {
        Data = reinterpret_cast<TCellComboBoxInfo*>
          (&TestDatabase[RowNum - 1].C1Index);
        if (String(TestDatabase[RowNum - 1].C1String) != "") {
          TestDatabase[RowNum - 1].C1Index =
            OvcTCComboBox1->Items->Add(TestDatabase[RowNum - 1].C1String);
          TestDatabase[RowNum - 1].C1String = "";
        }
        break;
      }
      case 2 : {
        ComboTemp.Index = TestDatabase[RowNum - 1].C2Index;
        strcpy(ComboTemp.St, "");
        Data = reinterpret_cast<TCellComboBoxInfo*>(&ComboTemp);
      }
    }
  else if (RowNum == 0)
    Data = NULL;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1DoneEdit(TObject *Sender, int RowNum,
  int ColNum)
{
  if (ColNum == 2) {
    if (ComboTemp.Index == -1)
      ComboTemp.Index = OvcTCComboBox2->Items->Add(ComboTemp.St);
    TestDatabase[RowNum - 1].C2Index = ComboTemp.Index;
  }
}
//---------------------------------------------------------------------------
