//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include <stdlib.h>

#include "ExTbl02U.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCell"
#pragma link "OvcTCHdr"
#pragma link "OvcTCBox"
#pragma link "OvcTCGly"
#pragma link "OvcTCBmp"
#pragma link "OvcTCSim"
#pragma link "OvcTCBEF"
#pragma link "OvcTCPic"
#pragma link "OvcTCNum"
#pragma link "OvcTCCBx"
#pragma resource "*.dfm"
TForm1 *Form1;

String TForm1::RandomString(int MaxLen)
{
  int len;
  String s;

  len = random(MaxLen) + 1;
  s.SetLength(len);
  for (int i=1;i<len + 1;i++)
    s[i] = (char)(random(26) + 'A');
  return s;
}

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
  randomize();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  TRowNum Row;
  TColNum Col;

  // set up the items lists for combo box 3: it uses run-time lists
  Items1 = new TStringList;
  Items1->Add("Brie");
  Items1->Add("Camembert");
  Items1->Add("Pont L""Eveque");
  Items1->Add("Port Salut");
  Items1->Add("Boursin");
  Items2 = new TStringList;
  Items2->Add("Youngs");
  Items2->Add("Fullers");
  Items2->Add("Theakstons");
  Items2->Add("Courage");
  Items2->Add("Shepherd Neame");
  // set up the database
  for (int i=0;i<200;i++) {
    MyDB[i] = new TMyRecord;
    memset(MyDB[i], 0, sizeof(TMyRecord));
  }
  for (Row = 0;Row < 200;Row++) {
    strcpy(MyDB[Row]->mrString, RandomString(39).c_str());
    strcpy(MyDB[Row]->mrMemo, RandomString(79).c_str());
    MyDB[Row]->mrCheckBox = TCheckBoxState((random(50) % 2));
    strcpy(MyDB[Row]->mrSimple, RandomString(9).c_str());
    MyDB[Row]->mrPicture = (random(1000) + 144000);
    MyDB[Row]->mrNumeric = ((int)random(2000) - 1000) / 100.0;
    MyDB[Row]->mrComboBox1 = random(10);
    MyDB[Row]->mrComboBox2Int = random(10);
    MyDB[Row]->mrComboBox3Int = random(5);
    if ((random(50) % 2))
      MyDB[Row]->mrComboBox3Items = Items1;
    else
      MyDB[Row]->mrComboBox3Items = Items2;
    MyDB[Row]->mrGlyph = random(4);
  }

  // set up the column-to-field mapping
  for (Col = 0;Col < 12;Col++)
    ColToFieldMap[Col] = Col;

  // get the bitmap
  MyBitmap = new Graphics::TBitmap;
  MyBitmap->LoadFromFile("EXTBL02.BMP");

}
//---------------------------------------------------------------------------
__fastcall TForm1::~TForm1()
{
  delete MyBitmap;
  MyBitmap = 0;
  delete Items1;
  Items1 = 0;
  delete Items2;
  Items2 = 0;
  for (int i=0;i<200;i++) {
    delete MyDB[i];
    MyDB[i] = 0;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
  int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = NULL;
  if (RowNum > 0 && RowNum < 200) {
    switch (ColToFieldMap[ColNum]) {
      case 1 : Data = MyDB[RowNum - 1]->mrString; break;
      case 2 : Data = MyDB[RowNum - 1]->mrMemo; break;
      case 3 : Data = &MyDB[RowNum - 1]->mrCheckBox; break;
      case 4 : Data = MyDB[RowNum - 1]->mrSimple; break;
      case 5 : Data = &MyDB[RowNum - 1]->mrPicture;  break;
      case 6 : Data = &MyDB[RowNum - 1]->mrNumeric; break;
      case 7 : Data = &MyDB[RowNum - 1]->mrComboBox1; break;
      case 8 : Data = &MyDB[RowNum - 1]->mrComboBox2Int; break;
      case 9 : Data = &MyDB[RowNum - 1]->mrComboBox3Int; break;
      case 10 : Data = &MyDB[RowNum - 1]->mrGlyph; break;
      case 11 : Data = MyBitmap;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellAttributes(TObject *Sender, int RowNum,
  int ColNum, TOvcCellAttributes &CellAttr)
{
  if (RowNum == 0) {

    // display the headings for the checkbox and glyph columns centrally
    if (ColToFieldMap[ColNum] == 3 || ColToFieldMap[ColNum] == 10)
      CellAttr.caAdjust = otaCenter;
    // display the heading for the numeric field right adjusted
    else if (ColToFieldMap[ColNum] == 6)
      CellAttr.caAdjust = otaCenterRight;
    // display the active heading flat and red and bold
    if (ColNum == OvcTable1->ActiveCol) {
      CellAttr.caTextStyle = tsFlat;
      CellAttr.caColor = clRed;
      TFontStyles style = CellAttr.caFont->Style;
      style << fsBold;
      CellAttr.caFont->Style = style;
    }
  }
  else { // it's a data row
    // display negative amounts for the numeric field in red
    if (ColToFieldMap[ColNum] == 6)
      if (MyDB[RowNum]->mrNumeric < 0.0)
        CellAttr.caFontColor = clRed;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1ColumnsChanged(TObject *Sender, int ColNum1,
  int ColNum2, TOvcTblActions Action)
{
  TColNum Temp;

  // for a column exchange, update the column-to-field mapping
  if (Action == taExchange) {
    Temp = ColToFieldMap[ColNum1];
    ColToFieldMap[ColNum1] = ColToFieldMap[ColNum2];
    ColToFieldMap[ColNum2] = Temp;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1RowsChanged(TObject *Sender, int RowNum1,
  int RowNum2, TOvcTblActions Action)
{
  TMyRecord* Temp;

  // for a row exchange, swap the actual row data
  if (Action ==taExchange) {
    Temp = MyDB[RowNum1];
    MyDB[RowNum1] = MyDB[RowNum2];
    MyDB[RowNum2] = Temp;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1SizeCellEditor(TObject *Sender, int RowNum,
  int ColNum, TRect &CellRect, TOvcTblEditorStyle &CellStyle)
{
  switch (ColToFieldMap[ColNum]) {
    case 1 : {
      CellRect.Right += CellRect.Right - CellRect.Left;
      CellStyle = tesBorder;
      break;
    }
    case 2 : {
      CellRect.Right += CellRect.Right - CellRect.Left;
      CellRect.Bottom += (CellRect.Bottom - CellRect.Top)*2;
      CellStyle = tesBorder;
      break;
    }
    default :
      CellStyle = tes3D;
  }
}
//---------------------------------------------------------------------------
