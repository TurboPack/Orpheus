//---------------------------------------------------------------------------
#ifndef ExVlbUH
#define ExVlbUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcVlb.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcVLB.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label3;
  TLabel *Label4;
  TOvcVirtualListBox *OvcVirtualListbox1;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  void __fastcall OvcVirtualListbox1GetItem(TObject *Sender, int Index,
  AnsiString &ItemString);
  void __fastcall OvcVirtualListbox1GetItemColor(TObject *Sender, int Index,
  TColor &FG, TColor &BG);
  void __fastcall OvcVirtualListbox1Click(TObject *Sender);
  void __fastcall OvcVirtualListbox1IsSelected(TObject *Sender, int Index,
  bool &Selected);
  void __fastcall OvcVirtualListbox1Select(TObject *Sender, int Index,
  bool Selected);
  void __fastcall OvcVirtualListbox1TopIndexChanged(TObject *Sender,
  int NewTopIndex);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
  // maintain selection status of the first 500 items
  bool Select[500];

public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
