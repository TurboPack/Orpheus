//---------------------------------------------------------------------------
#ifndef ExCaloduH
#define ExCaloduH
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
	TOvcCalendar *Calendar;
	void __fastcall CalendarDrawItem(TObject *Sender, TDateTime ADate,
	const TRect &Rect);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
