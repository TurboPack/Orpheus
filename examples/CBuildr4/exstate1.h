//---------------------------------------------------------------------------
#ifndef ExState1H
#define ExState1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcState.hpp"
#include "OvcBase.hpp"
#include "OvcStore.hpp"
#include "OvcFiler.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TMemo *Memo1;
	TCheckBox *CheckBox1;
	TEdit *Edit1;
	TOvcFormState *OvcFormState1;
	TOvcComponentState *OvcComponentState1;
	TOvcIniFileStore *OvcIniFileStore1;
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
