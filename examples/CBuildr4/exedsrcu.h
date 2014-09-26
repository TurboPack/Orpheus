//---------------------------------------------------------------------------
#ifndef ExEdSrcUH
#define ExEdSrcUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcBase.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TfrmSearch : public TForm
{
__published:	// IDE-managed Components
  TOvcTextFileEditor *ED1;
  TOvcSimpleField *SF1;
  TButton *btnSearch;
  TBitBtn *BitBtn1;
  TOvcController *DefaultController;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall btnSearchClick(TObject *Sender);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TfrmSearch(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TfrmSearch *frmSearch;
//---------------------------------------------------------------------------
#endif
