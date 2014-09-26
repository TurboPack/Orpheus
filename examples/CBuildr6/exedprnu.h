//---------------------------------------------------------------------------
#ifndef ExEdPrnUH
#define ExEdPrnUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include <vcl\printers.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TButton *Button1;
  TOvcTextFileEditor *ED;
  TBitBtn *BitBtn1;
  TOvcController *DefaultController;
  void __fastcall Button1Click(TObject *Sender);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
