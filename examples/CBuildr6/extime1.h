//---------------------------------------------------------------------------
#ifndef ExTime1H
#define ExTime1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcBase.hpp"
#include "OvcEdTim.hpp"
#include "OvcEditF.hpp"
#include <vcl\ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcAttachedLabel *OvcTimeEdit1Label1;
	TOvcAttachedLabel *edNowStringLabel1;
	TOvcAttachedLabel *edUnitsLengthLabel1;
	TOvcTimeEdit *OvcTimeEdit1;
	TRadioGroup *rgDurationDisplay;
	TOvcEdit *edNowString;
	TRadioGroup *rgPrimaryField;
	TCheckBox *cbShowSeconds;
	TCheckBox *cbShowUnits;
	TRadioGroup *rgTimeMode;
	TOvcEdit *edUnitsLength;
	TButton *Button1;
	TCheckBox *cbDefaultToPM;
	TOvcController *OrController1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall rgDurationDisplayClick(TObject *Sender);
	void __fastcall rgTimeModeClick(TObject *Sender);
	void __fastcall rgPrimaryFieldClick(TObject *Sender);
	void __fastcall cbShowSecondsClick(TObject *Sender);
	void __fastcall cbShowUnitsClick(TObject *Sender);
	void __fastcall edUnitsLengthExit(TObject *Sender);
	void __fastcall edNowStringExit(TObject *Sender);
	void __fastcall cbDefaultToPMClick(TObject *Sender);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
