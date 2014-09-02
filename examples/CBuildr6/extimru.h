//---------------------------------------------------------------------------
#ifndef ExTimrUH
#define ExTimrUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcTimer.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TLabel *L1;
  TLabel *L2;
  TButton *btnAddTrigger;
  TOvcSimpleField *F1;
  TButton *btnAddLots;
  TOvcSimpleField *F2;
  TButton *btnAddOnetime;
  TButton *btnRemoveAllTriggers;
  TListBox *LB;
  TButton *btnClear;
  TOvcSimpleField *F3;
  TButton *btnRemoveTrigg;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  TOvcTimerPool *TT;
  void __fastcall btnAddTriggerClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall TTTrigger(TObject *Sender, int Handle, Cardinal Interval,
  int ElapsedTime);
  void __fastcall btnAddLotsClick(TObject *Sender);
  void __fastcall btnAddOnetimeClick(TObject *Sender);
  void __fastcall btnRemoveAllTriggersClick(TObject *Sender);
  void __fastcall btnClearClick(TObject *Sender);
  void __fastcall btnRemoveTriggClick(TObject *Sender);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
