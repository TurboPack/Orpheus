//---------------------------------------------------------------------------
#ifndef ExTbl8UH
#define ExTbl8UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include <vcl\DBTables.hpp>
#include <vcl\DB.hpp>
#include "OvcTCSim.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TMemo *Memo1;
  TOvcController *OvcController1;
  TQuery *Query1;
  TOvcTCSimpleField *OvcTCSimpleField1;
  TOvcTCSimpleField *OvcTCSimpleField2;
  TOvcTCSimpleField *OvcTCSimpleField3;
  TOvcTCSimpleField *OvcTCSimpleField4;
  TOvcTCSimpleField *OvcTCSimpleField5;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
private:	// User declarations
  int TotalRecs;
  int GI;
  ShortString GS; // SmallString with a size of 255
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
