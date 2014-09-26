//---------------------------------------------------------------------------
#ifndef ExValidUH
#define ExValidUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcBase.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcNF.hpp"
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label2;
  TOvcSimpleField *OvcSimpleField1;
  TOvcPictureField *OvcPictureField1;
  TOvcNumericField *OvcNumericField1;
  TBitBtn *BitBtn1;
  TOvcController *DefaultController;
    TBitBtn *BitBtn2;
  void __fastcall BitBtn1Click(TObject *Sender);
  void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
