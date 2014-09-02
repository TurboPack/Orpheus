//---------------------------------------------------------------------------
#ifndef ExClockuH
#define ExClockuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcDbClk.hpp"
#include "OvcClock.hpp"
#include "OvcBase.hpp"
#include <vcl\DBCtrls.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *Label2;
	TOvcDbClock *OvcDbClock1;
	TDBNavigator *DBNavigator1;
	TOvcClock *OvcClock1;
	TDataSource *DataSource1;
	TTable *Table1;
	TOvcController *OvcController1;
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
