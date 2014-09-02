//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExAeu.h"
#include "CalUnit.h"
//---------------------------------------------------------------------------
#pragma link "OvcAe"
#pragma link "OvcBase"
#pragma resource "*.dfm"
TAEForm *AEForm;
//---------------------------------------------------------------------------
__fastcall TAEForm::TAEForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE1GetItem(TObject *Sender, int Index, Pointer &Value)
{
  if ((Index > -1) && (Index < MaxItems))
    Value = &Data[Index];
  else
    throw (Exception("Invalid index value"));
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::BitBtn1Click(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE1GetItemColor(TObject *Sender, int Index,
  TColor &FG, TColor &BG)
{
  if ((Index > -1) && (Index < MaxItems))
    // just set the text color--set BG for the background color
    FG = Colors[Index];
  else
    throw (Exception("Invalid index value"));
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::FormCreate(TObject *Sender)
{
  for (int i=0;i<MaxItems;i++) {
    Data[i] = i;
    Colors[i] = AE1->Font->Color;
    Dates[i] = CurrentDate() + i;
  }
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE1DblClick(TObject *Sender)
{
  // requires one click to make the cell active before a
  // double click is registered
  Label1->Caption = "Index: " + AE1->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE2GetItem(TObject *Sender, int Index, Pointer &Value)
{
  if ((Index > -1) && (Index < MaxItems))
    Value = &Dates[Index];
  else
    throw (Exception("Invalid index value"));
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE2DblClick(TObject *Sender)
{
  CalForm = new TCalForm(Application);
  CalForm->Calendar->AsStDate = Dates[AE2->ItemIndex];
  CalForm->ShowModal();
  if (CalForm->ModalResult == mrOk) {
    Dates[AE2->ItemIndex] = CalForm->Calendar->CalendarDate;
    AE2->Refresh();
  }
  delete CalForm;
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::btnColorClick(TObject *Sender)
{
  int i = AE1->ItemIndex;
  if (i > -1) {
    dlgColor->Color = Colors[i];
    if (dlgColor->Execute()) {
      Colors[i] = dlgColor->Color;
      AE1->Refresh();
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE1Select(TObject *Sender, int NewIndex)
{
  AE2->ItemIndex = AE1->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TAEForm::AE2Select(TObject *Sender, int NewIndex)
{
  AE1->ItemIndex = AE2->ItemIndex;
}
//---------------------------------------------------------------------------
