//---------------------------------------------------------------------------
#ifndef ExABtn1H
#define ExABtn1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Buttons.hpp>
#include "OvcABtn.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcEF.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TBitBtn *BitBtn1;
  TOvcAttachedButton *ABtn;
  TOvcPictureField *PF;
  TOvcController *OvcController1;
  void __fastcall ABtnClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
