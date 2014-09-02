//---------------------------------------------------------------------------
#ifndef ExTbl02UH
#define ExTbl02UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCHdr.hpp"
#include "OvcTCBox.hpp"
#include "OvcTCGly.hpp"
#include "OvcTCBmp.hpp"
#include "OvcTCSim.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCNum.hpp"
#include "OvcTCCBx.hpp"
//---------------------------------------------------------------------------
struct TMyRecord {
  char mrString[40];
  char mrMemo[79];
  TCheckBoxState mrCheckBox;
  char mrSimple[10];
  TOvcDate mrPicture;
  double mrNumeric;
  int mrComboBox1;
  int mrComboBox2Int;
  char mrComboBox2Str[20];
  int mrComboBox3Int;
  TStringList* mrComboBox3Items;
  int mrGlyph;
};

//typedef TMyRecord[200] TMyRecordDB;

class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TOvcController *OvcController1;
  TOvcTCString *OvcTCString1;
  TOvcTCRowHead *OvcTCRowHead1;
  TOvcTCMemo *OvcTCMemo1;
  TOvcTCCheckBox *OvcTCCheckBox1;
  TOvcTCSimpleField *OvcTCSimpleField1;
  TOvcTCPictureField *OvcTCPictureField1;
  TOvcTCNumericField *OvcTCNumericField1;
  TOvcTCComboBox *OvcTCComboBox1;
  TOvcTCComboBox *OvcTCComboBox2;
  TOvcTCGlyph *OvcTCGlyph1;
  TOvcTCBitMap *OvcTCBitMap1;
  TOvcTCColHead *OvcTCColHead1;
  TOvcTCComboBox *OvcTCComboBox3;
  void __fastcall FormCreate(TObject *Sender);
  
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTable1GetCellAttributes(TObject *Sender, int RowNum,
  int ColNum, TOvcCellAttributes &CellAttr);
  void __fastcall OvcTable1ColumnsChanged(TObject *Sender, int ColNum1,
  int ColNum2, TOvcTblActions Action);
  void __fastcall OvcTable1RowsChanged(TObject *Sender, int RowNum1,
  int RowNum2, TOvcTblActions Action);
  void __fastcall OvcTable1SizeCellEditor(TObject *Sender, int RowNum,
  int ColNum, TRect &CellRect, TOvcTblEditorStyle &CellStyle);
private:	// User declarations
  TMyRecord* MyDB[200];
  TColNum ColToFieldMap[12];
  TStringList* Items1;
  TStringList* Items2;
  Graphics::TBitmap* MyBitmap;

  String RandomString(int MaxLen);
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
  __fastcall ~TForm1();
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
