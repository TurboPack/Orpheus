//---------------------------------------------------------------------------
#ifndef ExABtn2H
#define ExABtn2H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcCal.hpp"
#include "OvcBase.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include "OvcSC.hpp"
//---------------------------------------------------------------------------
class TfrmCal : public TForm
{
__published:	// IDE-managed Components
  TPanel *Panel1;
  TBitBtn *BitBtn1;
  TBitBtn *BitBtn2;
  TOvcSpinner *Spinner1;
  TOvcSpinner *Spinner2;
  TOvcController *OvcController1;
  TOvcCalendar *Calendar;
  void __fastcall CalendarDblClick(TObject *Sender);
  void __fastcall Spinner1Click(TObject *Sender, TOvcSpinState State, double Delta,
  bool Wrap);
  void __fastcall Spinner2Click(TObject *Sender, TOvcSpinState State, double Delta,
  bool Wrap);
  void __fastcall FormKeyDown(TObject *Sender, WORD &Key, TShiftState Shift);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TfrmCal(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TfrmCal *frmCal;
//---------------------------------------------------------------------------
#endif
