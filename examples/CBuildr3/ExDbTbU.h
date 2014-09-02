//---------------------------------------------------------------------------
#ifndef ExDbTbUH
#define ExDbTbUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\DBTables.hpp>
#include <vcl\DB.hpp>
#include <Db.hpp>
#include "OvcDbTbl.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCBox.hpp"
#include "OvcTCGly.hpp"
#include "OvcTCBmp.hpp"
#include "OvcTCCBx.hpp"
#include "OvcTCSim.hpp"
#include "OvcTCNum.hpp"
#include "OvcTCHdr.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TBitBtn *btnClose;
  TOvcDbTable *TB;
  TGroupBox *GroupBox1;
  TLabel *lblClicks;
  TCheckBox *cbCellsPaintText;
  TCheckBox *cbAlwaysEditing;
  TCheckBox *cbTableActive;
  TCheckBox *cbShowPictures;
  TOvcSimpleField *sfLockedColumns;
  TCheckBox *cbShowHeader;
  TOvcSimpleField *sfLeftColumn;
  TOvcSimpleField *sfActiveRow;
  TCheckBox *cbUseHeaderCell;
  TCheckBox *cbAllowMove;
  TCheckBox *cbAllowSize;
  TCheckBox *cbShowIndicators;
  TOvcSimpleField *sfActiveColumn;
  TOvcSimpleField *sfHeaderHeight;
  TOvcSimpleField *sfRowHeight;
  TCheckBox *cbHighlightRow;
  TCheckBox *cbUseLetters;
  TCheckBox *cbUseStrings;
  TCheckBox *cbVisible;
  TCheckBox *cbEnterToTab;
  TCheckBox *cbWantTabs;
  TCheckBox *cbPageScroll;
  TCheckBox *cbStretchPictures;
  TCheckBox *cbIntegralHeight;
  TCheckBox *cbWrapAtEnds;
  TCheckBox *cbTable1;
  TCheckBox *cbTable2;
  TBitBtn *btnUpdate;
  TOvcController *OvcController1;
  TTable *Table1;
  TOvcTCString *OvcTCString1;
  TOvcTCPictureField *OvcTCPictureField1;
  TDataSource *DataSource1;
  TTable *Table2;
  TOvcTCCheckBox *OvcTCCheckBox1;
  TOvcTCComboBox *OvcTCComboBox1;
  TOvcTCSimpleField *OvcTCSimpleField1;
  TOvcTCNumericField *OvcTCNumericField1;
  TOvcTCGlyph *OvcTCGlyph1;
  TOvcTCColHead *OvcTCColHead1;
  TOvcTCBitMap *OvcTCBitMap1;
  void __fastcall TBLockedCellClick(TObject *Sender, int RowNum, int ColNum);
  void __fastcall TBUnusedAreaClick(TObject *Sender, int RowNum, int ColNum);
  void __fastcall TBIndicatorClick(TObject *Sender, int RowNum, int ColNum);
  void __fastcall TBActiveCellChanged(TObject *Sender, int RowNum, int ColNum);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormKeyPress(TObject *Sender, char &Key);
  void __fastcall cbAllowMoveClick(TObject *Sender);
  void __fastcall cbAllowSizeClick(TObject *Sender);
  void __fastcall cbAlwaysEditingClick(TObject *Sender);
  void __fastcall cbCellsPaintTextClick(TObject *Sender);
  void __fastcall cbEnterToTabClick(TObject *Sender);
  void __fastcall cbHighlightRowClick(TObject *Sender);
  void __fastcall cbIntegralHeightClick(TObject *Sender);
  void __fastcall cbPageScrollClick(TObject *Sender);
  void __fastcall cbShowHeaderClick(TObject *Sender);
  void __fastcall cbShowIndicatorsClick(TObject *Sender);
  void __fastcall cbShowPicturesClick(TObject *Sender);
  void __fastcall cbStretchPicturesClick(TObject *Sender);
  void __fastcall cbTableActiveClick(TObject *Sender);
  void __fastcall cbTable1Click(TObject *Sender);
  void __fastcall cbTable2Click(TObject *Sender);
  void __fastcall cbUseHeaderCellClick(TObject *Sender);
  void __fastcall cbUseLettersClick(TObject *Sender);
  void __fastcall cbUseStringsClick(TObject *Sender);
  void __fastcall cbVisibleClick(TObject *Sender);
  void __fastcall cbWantTabsClick(TObject *Sender);
  void __fastcall cbWrapAtEndsClick(TObject *Sender);
  void __fastcall sfActiveColumnExit(TObject *Sender);
  void __fastcall sfActiveRowExit(TObject *Sender);
  void __fastcall sfHeaderHeightExit(TObject *Sender);
  void __fastcall sfLeftColumnExit(TObject *Sender);
  void __fastcall sfLockedColumnsExit(TObject *Sender);
  void __fastcall sfRowHeightExit(TObject *Sender);
  void __fastcall btnUpdateClick(TObject *Sender);
  void __fastcall TBLeftColumnChanged(TObject *Sender);
    void __fastcall btnCloseClick(TObject *Sender);
private:	// User declarations
  void UpdateStatus();
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
