//---------------------------------------------------------------------------
#ifndef ExDbCbuH
#define ExDbCbuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\DBCtrls.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>
#include "OvcTCCBx.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcDbTbl.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcDbTable *OvcDbTable1;
  TDBNavigator *DBNavigator1;
  TMemo *Memo1;
  TDataSource *DataSource1;
  TTable *Table1;
  TStringField *Table1NAME;
  TSmallintField *Table1SIZE;
  TOvcController *OvcController1;
  TOvcTCComboBox *OvcTCComboBox1;
  TDataSource *DataSource2;
  TTable *Table2;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
