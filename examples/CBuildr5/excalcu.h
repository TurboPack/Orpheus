//---------------------------------------------------------------------------
#ifndef ExCalcuH
#define ExCalcuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\Printers.hpp>
#include "OvcCalc.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcEdClc.hpp"
#include "OvcEdPop.hpp"
#include "OvcEditF.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TOvcCalculator *Calculator;
	TPanel *Panel2;
	TLabel *Label1;
	TLabel *ResultLbl;
	TSpeedButton *PrintSpeedButton;
	TSpeedButton *SeparatePercentSpeedButton;
	TRadioGroup *DecimalRadioGroup;
	TCheckBox *cbFixedEntry;
	TButton *Button1;
	TCheckBox *cbShowTape;
	TCheckBox *cbSeparate;
	TOvcController *OrController1;
	TOvcNumberEdit *OvcNumberEdit1;
	void __fastcall cbSeparateClick(TObject *Sender);
	void __fastcall cbShowTapeClick(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
	void __fastcall cbFixedEntryClick(TObject *Sender);
	void __fastcall CalculatorButtonPressed(TObject *Sender,
	TOvcCalculatorButton Button);
	void __fastcall DecimalRadioGroupClick(TObject *Sender);
	void __fastcall PrintSpeedButtonClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
