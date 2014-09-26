//---------------------------------------------------------------------------
#ifndef ExDbTodUH
#define ExDbTodUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcDbTbl.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCSim.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcDbTable *OvcDbTable1;
  TOvcController *OvcController1;
  TOvcTCSimpleField *OvcTCSimpleField1;
  TDataSource *DataSource1;
  TTable *Table1;
  TOvcTCSimpleField *OvcTCSimpleField2;
  TOvcTCSimpleField *OvcTCSimpleField3;
  TOvcTCSimpleField *OvcTCSimpleField4;
  TOvcTCSimpleField *OvcTCSimpleField5;
  void __fastcall OvcTCSimpleField1OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
  void __fastcall OvcTCSimpleField2OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
  void __fastcall OvcTCSimpleField3OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
  void __fastcall OvcTCSimpleField4OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
  void __fastcall OvcTCSimpleField5OwnerDraw(TObject *Sender,
  TCanvas *TableCanvas, const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
private:	// User declarations
  String S24;
  String S14;
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
