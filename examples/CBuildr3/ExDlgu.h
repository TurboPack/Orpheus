//---------------------------------------------------------------------------
#ifndef ExDlguH
#define ExDlguH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcCalDg.hpp"
#include "OvcDlg.hpp"
#include "OvcBase.hpp"
#include "OvcDbMDg.hpp"
#include "OvcClcDg.hpp"
#include "OvcClkDg.hpp"
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include "OvcMoDg.hpp"
#include "OvcDbADg.hpp"
#include "OvcSplDg.hpp"
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TButton *Button1;
	TButton *Button2;
	TButton *Button3;
	TButton *Button4;
	TButton *Button5;
	TMemo *Memo1;
	TButton *Button6;
	TButton *Button7;
	TOvcCalendarDialog *OvcCalendarDialog1;
	TOvcDbMemoDialog *OvcDbMemoDialog1;
	TOvcCalculatorDialog *OvcCalculatorDialog1;
	TOvcController *OrController1;
	TOvcClockDialog *OvcClockDialog1;
	TDataSource *DataSource1;
	TTable *Table1;
	TOvcMemoDialog *OvcMemoDialog1;
	TOvcDbAliasDialog *OvcDbAliasDialog1;
	TOvcSplashDialog *OvcSplashDialog1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall Button3Click(TObject *Sender);
	void __fastcall Button6Click(TObject *Sender);
	void __fastcall Button7Click(TObject *Sender);
	void __fastcall OvcSplashDialog1Click(TObject *Sender);
	void __fastcall Button2Click(TObject *Sender);
	void __fastcall Button5Click(TObject *Sender);
	void __fastcall Button4Click(TObject *Sender);
	void __fastcall OvcDbMemoDialog1HelpClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
    TDateTime SelectedDate;
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
