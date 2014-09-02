//---------------------------------------------------------------------------
#ifndef ExCaluH
#define ExCaluH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcCal.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcCalendar *OvcCalendar1;
	void __fastcall OvcCalendar1GetDateEnabled(TObject *Sender, TDateTime ADate,
	bool &Enabled);
	void __fastcall OvcCalendar1GetHighlight(TObject *Sender, TDateTime ADate,
	TColor &Color);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
