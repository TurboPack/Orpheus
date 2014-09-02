//---------------------------------------------------------------------------
#ifndef ExCbxuH
#define ExCbxuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcBase.hpp"
#include "OvcCmbx.hpp"
#include "OvcFtCbx.hpp"
#include "OvcDrCbx.hpp"
#include "OvcFlCbx.hpp"
#include "OvcHsCbx.hpp"
#include "OvcFmCbx.hpp"
#include "OvcPrCbx.hpp"
#include "OvcDbFCb.hpp"
#include "OvcDbACb.hpp"
#include "OvcDbTCb.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include "OvcDvCbx.hpp"
#include <vcl\DBTables.hpp>
#include <vcl\DB.hpp>
#include <Db.hpp>
#include <Dialogs.hpp>
#include "OvcDbHBD.hpp"
#include "OvcDbHLL.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcAttachedLabel *OvcComboBox1Label1;
	TOvcAttachedLabel *OvcFontComboBox1Label1;
	TOvcAttachedLabel *OvcDirectoryComboBox1Label1;
	TOvcAttachedLabel *OvcFileComboBox1Label1;
	TOvcAttachedLabel *OvcHistoryComboBox1Label1;
	TOvcAttachedLabel *OvcPrinterComboBox1Label1;
	TOvcAttachedLabel *OvcDbFieldComboBox1Label1;
	TOvcAttachedLabel *OvcDbAliasComboBox1Label1;
	TOvcAttachedLabel *OvcDbTableNameComboBox1Label1;
	TOvcAttachedLabel *OvcAssociationComboBoxLabel1;
	TOvcAttachedLabel *OvcDriveComboBox1Label1;
	TOvcComboBox *OvcComboBox;
	TOvcFontComboBox *OvcFontComboBox;
	TOvcDirectoryComboBox *OvcDirectoryComboBox;
	TOvcFileComboBox *OvcFileComboBox;
	TOvcHistoryComboBox *OvcHistoryComboBox;
	TOvcAssociationComboBox *OvcAssociationComboBox;
	TOvcPrinterComboBox *OvcPrinterComboBox;
	TOvcDbFieldComboBox *OvcDbFieldComboBox;
	TOvcDbAliasComboBox *OvcDbAliasComboBox;
	TOvcDbTableNameComboBox *OvcDbTableNameComboBox;
	TGroupBox *Properties;
	TLabel *Label5;
	TLabel *Label6;
	TLabel *Label7;
	TImage *Icon1;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label4;
	TSpeedButton *FontBtn;
	TSpeedButton *DirectoryBtn;
	TSpeedButton *MaskBtn;
	TLabel *Label13;
	TEdit *Preview1;
	TEdit *FileMask1;
	TEdit *Directory1;
	TEdit *Description1;
	TEdit *FontName1;
	TEdit *Volume1;
	TGroupBox *GroupBox1;
	TLabel *Label10;
	TLabel *Label11;
	TLabel *Label12;
	TSpeedButton *HeightBtn;
	TSpeedButton *MRUCountBtn;
	TSpeedButton *DropCountBtn;
	TLabel *Label1;
	TLabel *Label2;
	TLabel *Label3;
	TCheckBox *Style1;
	TEdit *DropCount1;
	TEdit *MRUCount1;
	TEdit *Height1;
	TEdit *Text1;
	TEdit *ListIndex1;
	TEdit *ItemIndex1;
	TCheckBox *HotTrack1;
	TOvcDriveComboBox *OvcDriveComboBox;
	TOvcController *OrController1;
	TTable *Table1;
	TDataSource *DataSource1;
    TSpeedButton *AllFontBtn;
    TFontDialog *FontDialog1;
        TOvcDbBDEHelper *OvcDbBDEHelper1;
	void __fastcall OvcComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcFontComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcDriveComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcDirectoryComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcFileComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcPrinterComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcAssociationComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcHistoryComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcDbAliasComboBoxSelectionChange(TObject *Sender);
	void __fastcall OvcDbTableNameComboBoxSelectionChange(TObject *Sender);
	void __fastcall Style1Click(TObject *Sender);
	void __fastcall HotTrack1Click(TObject *Sender);
	void __fastcall DropCountBtnClick(TObject *Sender);
	void __fastcall MRUCountBtnClick(TObject *Sender);
	void __fastcall HeightBtnClick(TObject *Sender);
	void __fastcall FontBtnClick(TObject *Sender);
	void __fastcall DirectoryBtnClick(TObject *Sender);
	void __fastcall MaskBtnClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
    void __fastcall AllFontBtnClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
