//---------------------------------------------------------------------------
#ifndef ExOdtUH
#define ExOdtUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcNbk.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TfrmOwnerDrawTabs : public TForm
{
__published:	// IDE-managed Components
  TOvcNotebook *Notebook;
  TOvcNotebook *NB01;
  TOvcNotebook *NB02;
  TOvcNotebook *NB03;
  TOvcNotebook *NB04;
  TOvcNotebook *NB05;
  TOvcNotebook *NB06;
  TOvcNotebook *NB07;
  TOvcNotebook *NB08;
  TOvcNotebook *NB09;
  TListBox *LB;
  TOvcController *OvcController1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall OvcNotebook1DrTa(TObject *Sender, int Index,
  const AnsiString Title, TRect &R, bool Enabled, bool Active);
  void __fastcall NotebookDrawTab(TObject *Sender, int Index,
  const AnsiString Title, TRect &R, bool Enabled, bool Active);
  void __fastcall NotebookPageChanged(TObject *Sender, int Index);
private:	// User declarations
  TStringList* Data;
  Graphics::TBitmap* Glyph;
public:		// User declarations
  __fastcall TfrmOwnerDrawTabs(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TfrmOwnerDrawTabs *frmOwnerDrawTabs;
//---------------------------------------------------------------------------
#endif
