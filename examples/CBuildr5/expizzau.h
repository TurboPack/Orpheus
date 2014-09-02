//---------------------------------------------------------------------------
#ifndef ExPizzaUH
#define ExPizzaUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcVlb.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcVLB.hpp"

const int MaxNumItems = 14;
char Items[][12] = {
    "Ham",       "Pepperoni", "Sausage",   "Mushrooms",
    "Anchovies", "Onions",    "Olives",    "Eggs",
    "Pineapple", "Spices",    "Artichoke", "Peppers",
    "Hamburger", "Hodgepodge"
};

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcVirtualListBox *VLB;
  TBitBtn *BitBtn1;
  TBitBtn *btnAdd;
  TBitBtn *btnRemove;
  TOvcController *DefaultController;
  void __fastcall VLBGetItem(TObject *Sender, int Index,
  AnsiString &ItemString);
  void __fastcall VLBGetItemStatus(TObject *Sender, int Index, bool &Protect);
  void __fastcall btnAddClick(TObject *Sender);
  void __fastcall btnRemoveClick(TObject *Sender);
  void __fastcall VLBUserCommand(TObject *Sender, WORD Command);
  void __fastcall VLBCharToItem(TObject *Sender, char Ch, int &Index);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
