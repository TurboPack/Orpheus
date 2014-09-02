//---------------------------------------------------------------------------
#ifndef CalUnitH
#define CalUnitH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include "OvcCal.hpp"
#include "OvcBase.hpp"
#include "OvcSC.hpp"
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TCalForm : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel1;
  TOvcCalendar *Calendar;
  TOvcSpinner *MonthSpinner;
  TOvcSpinner *YearSpinner;
  TBitBtn *btnOk;
  TBitBtn *btnCancel;
  TOvcController *OvcController;
  void __fastcall YearSpinnerClick(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap);
  void __fastcall MonthSpinnerClick(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap);
  void __fastcall CalendarDrawItem(TObject *Sender, TDateTime ADate, const TRect &Rect);
  void __fastcall FormCreate(TObject *Sender);
    void __fastcall btnOkClick(TObject *Sender);
    void __fastcall btnCancelClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCalForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TCalForm *CalForm;
//---------------------------------------------------------------------------
#endif
