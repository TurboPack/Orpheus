//---------------------------------------------------------------------------
#ifndef ExDSpltUH
#define ExDSpltUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcSplit.hpp"
#include "OvcBase.hpp"
#include "ExtCtrls.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  void __fastcall FormActivate(TObject *Sender);
  void __fastcall FormResize(TObject *Sender);
private:	// User declarations
  TOvcSplitter* Split1;
  TOvcController* Controller1;
  TPanel* Panel1;
  TPanel* Panel2;
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
