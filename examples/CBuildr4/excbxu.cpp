//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExCbxu.h"
//---------------------------------------------------------------------------
#pragma link "OvcBase"
#pragma link "OvcCmbx"
#pragma link "OvcFtCbx"
#pragma link "OvcDrCbx"
#pragma link "OvcFlCbx"
#pragma link "OvcHsCbx"
#pragma link "OvcFmCbx"
#pragma link "OvcPrCbx"
#pragma link "OvcDbFCb"
#pragma link "OvcDbACb"
#pragma link "OvcDbTCb"
#pragma link "OvcDvCbx"
#pragma link "OvcDbHBD"
#pragma link "OvcDbHLL"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcComboBoxSelectionChange(TObject *Sender)
{
  TOvcComboBox* CB = dynamic_cast<TOvcComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcFontComboBoxSelectionChange(TObject *Sender)
{
  TOvcFontComboBox* CB = dynamic_cast<TOvcFontComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  FontName1->Text = CB->FontName;
  Preview1->Text = CB->FontName;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDriveComboBoxSelectionChange(TObject *Sender)
{
  TOvcDriveComboBox* CB = dynamic_cast<TOvcDriveComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  Volume1->Text = CB->VolumeName;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDirectoryComboBoxSelectionChange(TObject *Sender)
{
  TOvcDirectoryComboBox* CB = dynamic_cast<TOvcDirectoryComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  Directory1->Text = CB->Directory;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcFileComboBoxSelectionChange(TObject *Sender)
{
  TOvcFileComboBox* CB = dynamic_cast<TOvcFileComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcPrinterComboBoxSelectionChange(TObject *Sender)
{
  TOvcPrinterComboBox* CB = dynamic_cast<TOvcPrinterComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcAssociationComboBoxSelectionChange(TObject *Sender)
{
  TOvcAssociationComboBox* CB = dynamic_cast<TOvcAssociationComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  Description1->Text = CB->Description;
  Icon1->Picture->Icon->Handle = CB->AssociatedIcon;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcHistoryComboBoxSelectionChange(TObject *Sender)
{
  TOvcHistoryComboBox* CB = dynamic_cast<TOvcHistoryComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDbAliasComboBoxSelectionChange(TObject *Sender)
{
  TOvcDbAliasComboBox* CB = dynamic_cast<TOvcDbAliasComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  Table1->Active = False;
  try  {
    Table1->DatabaseName = CB->AliasName;
    OvcDbTableNameComboBox->Enabled = True;
  }
  catch (...)
  {
    OvcDbTableNameComboBox->Enabled = False;
    ShowMessage("Cannot set database name");
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcDbTableNameComboBoxSelectionChange(TObject *Sender)
{
  TOvcDbTableNameComboBox* CB = dynamic_cast<TOvcDbTableNameComboBox*> (Sender);
  Text1->Text = CB->List->Strings[CB->ListIndex];
  ListIndex1->Text = CB->ListIndex;
  ItemIndex1->Text = CB->ItemIndex;
  Table1->Active = False;
  try  {
    Table1->TableName = CB->TableName;
    Table1->Active = True;
  }
  catch (...)
  {
    ShowMessage("Cannot open table");
  }
  OvcDbFieldComboBox->Enabled = Table1->Active;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Style1Click(TObject *Sender)
{
  TOvcComboStyle S;
  if (Style1->Checked)
    S = ocsDropDownList;
  else
    S = ocsDropDown;
  OvcComboBox->Style            = S;
  OvcFontComboBox->Style        = S;
  OvcDirectoryComboBox->Style   = S;
  OvcFileComboBox->Style        = S;
  OvcPrinterComboBox->Style     = S;
  OvcAssociationComboBox->Style = S;
  OvcDbAliasComboBox->Style     = S;
  OvcDbTableNameComboBox->Style = S;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::HotTrack1Click(TObject *Sender)
{
  OvcComboBox->HotTrack = HotTrack1->Checked;
  OvcFontComboBox->HotTrack = HotTrack1->Checked;
  OvcDriveComboBox->HotTrack = HotTrack1->Checked;
  OvcDirectoryComboBox->HotTrack = HotTrack1->Checked;
  OvcFileComboBox->HotTrack = HotTrack1->Checked;
  OvcPrinterComboBox->HotTrack = HotTrack1->Checked;
  OvcAssociationComboBox->HotTrack = HotTrack1->Checked;
  OvcHistoryComboBox->HotTrack = HotTrack1->Checked;
  OvcDbAliasComboBox->HotTrack = HotTrack1->Checked;
  OvcDbTableNameComboBox->HotTrack = HotTrack1->Checked;
  OvcDbFieldComboBox->HotTrack = HotTrack1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DropCountBtnClick(TObject *Sender)
{
  int C = DropCount1->Text.ToInt();
  OvcComboBox->DropDownCount            = C;
  OvcFontComboBox->DropDownCount        = C;
  OvcDriveComboBox->DropDownCount       = C;
  OvcDirectoryComboBox->DropDownCount   = C;
  OvcFileComboBox->DropDownCount        = C;
  OvcPrinterComboBox->DropDownCount     = C;
  OvcAssociationComboBox->DropDownCount = C;
  OvcHistoryComboBox->DropDownCount     = C;
  OvcDbAliasComboBox->DropDownCount     = C;
  OvcDbTableNameComboBox->DropDownCount = C;
  OvcDbFieldComboBox->DropDownCount     = C;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::MRUCountBtnClick(TObject *Sender)
{
  int C = MRUCount1->Text.ToInt();
  OvcComboBox->MRUListCount            = C;
  OvcFontComboBox->MRUListCount        = C;
  OvcDriveComboBox->MRUListCount       = C;
  OvcDirectoryComboBox->MRUListCount   = C;
  OvcFileComboBox->MRUListCount        = C;
  OvcPrinterComboBox->MRUListCount     = C;
  OvcAssociationComboBox->MRUListCount = C;
  OvcDbAliasComboBox->MRUListCount     = C;
  OvcDbTableNameComboBox->MRUListCount = C;
  OvcDbFieldComboBox->MRUListCount     = C;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::HeightBtnClick(TObject *Sender)
{
  int H = Height1->Text.ToInt();
  OvcComboBox->ItemHeight            = H;
  OvcFontComboBox->ItemHeight        = H;
  OvcDriveComboBox->ItemHeight       = H;
  OvcDirectoryComboBox->ItemHeight   = H;
  OvcFileComboBox->ItemHeight        = H;
  OvcPrinterComboBox->ItemHeight     = H;
  OvcAssociationComboBox->ItemHeight = H;
  OvcHistoryComboBox->ItemHeight     = H;
  OvcDbAliasComboBox->ItemHeight     = H;
  OvcDbTableNameComboBox->ItemHeight = H;
  OvcDbFieldComboBox->ItemHeight     = H;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FontBtnClick(TObject *Sender)
{
  OvcFontComboBox->FontName = FontName1->Text;
  OvcFontComboBox->SelectionChanged();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DirectoryBtnClick(TObject *Sender)
{
  OvcDirectoryComboBox->Directory = Directory1->Text;
  OvcDirectoryComboBox->SelectionChanged();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::MaskBtnClick(TObject *Sender)
{
  OvcFileComboBox->FileMask = FileMask1->Text;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Style1Click(Sender);
  HotTrack1Click(Sender);
  DropCountBtnClick(Sender);
  MRUCountBtnClick(Sender);
  HeightBtnClick(Sender);
  FontDialog1->Font = Font;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::AllFontBtnClick(TObject *Sender)
{
  if (FontDialog1->Execute())
    Font = FontDialog1->Font;    
}
//---------------------------------------------------------------------------
