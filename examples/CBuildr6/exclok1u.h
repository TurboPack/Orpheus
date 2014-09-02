//---------------------------------------------------------------------------
#ifndef ExClok1uH
#define ExClok1uH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcBase.hpp"
#include "OvcClock.hpp"
#include "ovcbase.hpp"
#include "ovcclock.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TOvcClock *OrClock1;
	TOvcClock *OrClock2;
	TOvcClock *OrClock3;
	TOvcClock *OrClock4;
	TOvcClock *OrClock5;
	TOvcClock *OrClock6;
	TOvcClock *OrClock7;
	TOvcClock *OrClock8;
	TEdit *Edit1;
	TButton *Button1;
	TOvcController *OrController1;
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
