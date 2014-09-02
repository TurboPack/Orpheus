//---------------------------------------------------------------------------
#ifndef ExTbHnt1H
#define ExTbHnt1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include <vcl\ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcTable *OvcTable;
	TPanel *Panel1;
	TLabel *Label1;
	TLabel *Label2;
	TOvcController *OvcController1;
	TTimer *Timer;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall OvcTableMouseMove(TObject *Sender, TShiftState Shift, int X,
	int Y);
	void __fastcall TimerTimer(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
