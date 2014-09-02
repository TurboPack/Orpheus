//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <vcl\inifiles.hpp>
#include <stdlib.h>
#pragma hdrstop

#include "ExTbl12u.h"
//---------------------------------------------------------------------------
#pragma link "OvcTable"
#pragma link "OvcTCmmn"
#pragma link "OvcBase"
#pragma link "OvcTCBox"
#pragma link "OvcTCGly"
#pragma link "OvcTCBmp"
#pragma link "OvcTCell"
#pragma link "OvcTCEdt"
#pragma link "OvcTCStr"
#pragma link "OvcTCPic"
#pragma link "OvcTCBEF"
#pragma resource "*.dfm"
TForm1 *Form1;

struct MyDataRecord  {
  bool    TF1;
  char    TF2[10];
  TStTime TF3;
};

MyDataRecord MyData[10];
TColNum ColToFieldMap[4];

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Randomize();
  for (int i=1; i<10; i++)  {
    MyData[i].TF1 = false;
    strcpy(MyData[i].TF2, "False");
    MyData[i].TF3 = rand();
  }

  if (FileExists("c:\extbl12.ini"))  {
    TIniFile* IniF = new TIniFile("c:\extbl12.ini");
    try
    {
      for (int i=1; i<=3; i++)  {
        String S = IniF->ReadString("Column" + i, "DefaultCell", NULL);
          if (S == "CB1")
            OvcTable1->Columns->DefaultCell[i] = CB1;
          else if (S == "SF1")
            OvcTable1->Columns->DefaultCell[i] = SF1;
          else if (S == "PF1")
            OvcTable1->Columns->DefaultCell[i] = PF1;
          OvcTable1->Columns->Width[i] = IniF->ReadInteger("Column" + i, "Width", 60);
          ColToFieldMap[i] = IniF->ReadInteger("Column" + i, "Design Position", i);
      }
    }
    catch(...)  {} //finally
    delete(IniF);
  }
  else  {
    OvcTable1->Columns->DefaultCell[1] = CB1;
    OvcTable1->Columns->DefaultCell[2] = SF1;
    OvcTable1->Columns->DefaultCell[3] = PF1;
    for (int i=1; i<=3; i++)
      ColToFieldMap[i] = i;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1GetCellData(TObject *Sender, int RowNum,
	int ColNum, Pointer &Data, TOvcCellDataPurpose Purpose)
{
  Data = 0;
  if ((RowNum > 0) && (RowNum < 10))  {
    if (ColNum > 0)  {
      switch(ColToFieldMap[ColNum])  {
        case 1 : Data = &MyData[RowNum].TF1; break;
        case 2 : Data = &MyData[RowNum].TF2; break;
        case 3 : Data = &MyData[RowNum].TF3; break;
      }
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CB1Click(TObject *Sender)
{
  TCheckBoxState V = (TCheckBoxState)(dynamic_cast <TOvcTCGlyphEdit*>(Sender)->Value);
  OvcTable1->AllowRedraw = false;
  if (V == cbChecked)
    strcpy(MyData[OvcTable1->ActiveRow].TF2, "True");
  else
    strcpy(MyData[OvcTable1->ActiveRow].TF2, "False");
  OvcTable1->InvalidateRow(OvcTable1->ActiveRow);
  OvcTable1->AllowRedraw = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1Exit(TObject *Sender)
{
  if (OvcTable1->InEditingState())
    OvcTable1->StopEditingState(true);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcTable1ColumnsChanged(TObject *Sender, int ColNum1,
	int ColNum2, TOvcTblActions Action)
{
//  for a column exchange, update the column-to-field mapping
  if (Action == taExchange)  {
    TColNum Temp = ColToFieldMap[ColNum1];
    ColToFieldMap[ColNum1] = ColToFieldMap[ColNum2];
    ColToFieldMap[ColNum2] = Temp;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
  TIniFile* IniF = new TIniFile("c:\extbl12.ini");
  int P = 1;
  String S = "CB1";
  try
  {
    for (int i=1; i<=3; i++)  {
      switch(ColToFieldMap[i])  {
        case 1 :
          S = "CB1";
          P = 1;
          break;
        case 2 :
          S = "SF1";
          P = 2;
          break;
        case 3 :
          S = "PF1";
          P = 3;
          break;
      }
      IniF->WriteString("Column" + i, "DefaultCell", S);
      IniF->WriteInteger("Column" + i, "Width", OvcTable1->Columns->Width[i]);
      IniF->WriteInteger("Column" + i, "Design Position", P);
    }
  }
  catch (...) {}  //finally
  delete(IniF);
}
//---------------------------------------------------------------------------
