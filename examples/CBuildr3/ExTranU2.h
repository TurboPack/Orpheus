//---------------------------------------------------------------------------
#ifndef ExTranU2H
#define ExTranU2H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
//---------------------------------------------------------------------------
class TOutputForm : public TForm
{
__published:	// IDE-managed Components
  TMemo *Memo;
private:	// User declarations
public:		// User declarations
  __fastcall TOutputForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TOutputForm *OutputForm;
//---------------------------------------------------------------------------
#endif
