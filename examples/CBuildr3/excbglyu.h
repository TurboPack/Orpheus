//---------------------------------------------------------------------------
#ifndef excbglyuH
#define excbglyuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcCkLb.hpp"
#include "OvcLB.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcCheckList *OvcCheckList1;
	TMemo *Memo1;
	TImageList *ImageList1;
	TOvcController *OvcController1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
