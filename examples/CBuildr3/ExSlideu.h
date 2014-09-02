//---------------------------------------------------------------------------
#ifndef ExSlideuH
#define ExSlideuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcBase.hpp"
#include "OvcSlide.hpp"
#include "OvcDbSld.hpp"
#include <vcl\DBCtrls.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\Mask.hpp>
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcAttachedLabel *OvcSlider1Label1;
	TOvcAttachedLabel *OvcSlider3Label1;
	TOvcAttachedLabel *OvcDbSlider1Label1;
	TOvcAttachedLabel *OvcSlider4Label1;
	TOvcAttachedLabel *OvcSlider5Label1;
	TOvcSlider *OvcSlider1;
	TOvcSlider *OvcSlider2;
	TOvcDbSlider *OvcDbSlider1;
	TDBNavigator *DBNavigator1;
	TDBEdit *DBEdit1;
	TOvcSlider *OvcSlider3;
	TOvcSlider *OvcSlider4;
	TOvcSlider *OvcSlider5;
	TOvcSlider *OvcSlider6;
	TDataSource *DataSource1;
	TTable *Table1;
	void __fastcall OvcSlider1Change(TObject *Sender);
	void __fastcall OvcSlider2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
