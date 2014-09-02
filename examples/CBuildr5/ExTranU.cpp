//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <iostream.h>
#pragma hdrstop

#include "ExTranU.h"
#include "ExTranU2.h"
//---------------------------------------------------------------------------
#pragma link "OvcPF"
#pragma link "OvcPB"
#pragma link "OvcEF"
#pragma link "OvcBase"
#pragma link "OvcNbk"
#pragma link "OvcSF"
#pragma link "OvcNF"
#pragma link "OvcXfer"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void TForm1::InitForm1Transfer(TForm1TransferRec& Data)
{
  Data.Label1Text = "Label text";
  Data.Edit1Text = "Edit text";
  Data.CheckBox1Checked      = true;
  Data.RadioButton1Checked   = false;
  Data.OvcPictureField1Value = CurrentDate();

  Data.ListBox1Xfer.Items    = new TStringList;
  Data.ListBox1Xfer.Items->Add("LB Item 1");
  Data.ListBox1Xfer.Items->Add("LB Item 2");
  Data.ListBox1Xfer.Items->Add("LB Item 3");

  Data.ListBox1Xfer.ItemIndex = 1;

  Data.ComboBox1Xfer.Items = new TStringList;
  Data.ComboBox1Xfer.Items->Add("CB Item 1");
  Data.ComboBox1Xfer.Items->Add("CB Item 2");
  Data.ComboBox1Xfer.Items->Add("CB Item 3");

  Data.ComboBox1Xfer.Text = "Combobox Text";
  Data.ComboBox1Xfer.ItemIndex = -1;

  Data.Panel1Text = "Panel Text";

  Data.OvcSimpleField1Value, "Simple Field";
  Data.OvcPictureField2Value, "Picture Field";
  Data.OvcNumericField1Value   = 13;
}

void __fastcall TForm1::Button1Click(TObject *Sender)
{
  // create transfer objects and init transfer record
  InitForm1Transfer(Rec);
  // transfer data to the form
  // the below component order must match the transfer record
  // definition!
  OvcTransfer1->TransferToForm(OPENARRAY(TComponent*, (
    Label1,
    Edit1,
    CheckBox1,
    RadioButton1,
    OvcPictureField1,
    ListBox1,
    ComboBox1,
    Panel1,
    OvcSimpleField1,
    OvcPictureField2,
    OvcNumericField1)), &Rec);
  // free objects within the transfer buffer
  delete Rec.ListBox1Xfer.Items;
  delete Rec.ComboBox1Xfer.Items;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
  // create transfer objects and init transfer record
  InitForm1Transfer(Rec);
  // transfer data from the form
  // normally, you would not wish to retrieve the contents
  // of static components (Label, Panel, ...)
  OvcTransfer1->TransferFromForm(OPENARRAY(TComponent*, (
    Label1,
    Edit1,
    CheckBox1,
    RadioButton1,
    OvcPictureField1,
    ListBox1,
    ComboBox1,
    Panel1,
    OvcSimpleField1,
    OvcPictureField2,
    OvcNumericField1)), &Rec);

  // *** If you received an error on the WriteLn statement, you      ***
  // *** need to go to the linker page of the project options dialog ***
  // *** and set the "Generate Console Application" option           ***

  TOutputForm* form = new TOutputForm(this);

  // display returned data
  TStrings& list = *form->Memo->Lines;
  list.Clear();
  String s = "Data returned from the form:\r\n";
  list.Add(s);
  s = Label1->Name + " >> " + Rec.Label1Text;
  list.Add(s);
  s = Edit1->Name + " >> " + String(Rec.Edit1Text);
  list.Add(s);
  s = CheckBox1->Name + " >> " + String((int)Rec.CheckBox1Checked);
  list.Add(s);
  s = RadioButton1->Name + " >> " + String((int)Rec.RadioButton1Checked);
  list.Add(s);
  s = OvcPictureField1->Name + " >> " + String((int)Rec.OvcPictureField1Value);
  list.Add(s);
  s = ListBox1->Name + " ItemIndex >> " + String(Rec.ListBox1Xfer.ItemIndex);
  list.Add(s);
  for (int i = 0;i<Rec.ListBox1Xfer.Items->Count;i++)
    s = ListBox1->Name + String(i) + " >> " + Rec.ListBox1Xfer.Items->Strings[i];
  list.Add(s);
  s = ComboBox1->Name + " Text >> " + Rec.ComboBox1Xfer.Text;
  list.Add(s);
  s = ComboBox1->Name + " ItemIndex >> " + Rec.ComboBox1Xfer.ItemIndex;
  list.Add(s);
  for (int i=0;i<Rec.ComboBox1Xfer.Items->Count;i++)
    s = ComboBox1->Name + String(i) + " >> " + Rec.ComboBox1Xfer.Items->Strings[i];
  list.Add(s);
  s = Panel1->Name + " >> " + Panel1->Caption;
  list.Add(s);
  s = OvcSimpleField1->Name + " >> " + Rec.OvcSimpleField1Value;
  list.Add(s);
  s = OvcPictureField2->Name + " >> " + Rec.OvcPictureField2Value;
  list.Add(s);
  s = OvcNumericField1->Name + " >> " + String((int)Rec.OvcNumericField1Value);
  list.Add(s);
  form->ShowModal();
  // free objects within the transfer buffer
  delete Rec.ListBox1Xfer.Items;
  delete Rec.ComboBox1Xfer.Items;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

