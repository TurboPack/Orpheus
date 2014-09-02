//---------------------------------------------------------------------------
#ifndef ExNbHntUH
#define ExNbHntUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcNbk.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcNotebook *NB1;
  TMemo *Memo1;
  TOvcController *OvcController1;
  void __fastcall NB1MouseOverTab(TObject *Sender, int Index);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
  int  CurIndex;
  bool OverTab;
  void __fastcall DoShowHint(String& HintStr, bool& CanShow, THintInfo& HintInfo);
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
