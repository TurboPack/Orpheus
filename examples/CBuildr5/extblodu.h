//---------------------------------------------------------------------------
#ifndef ExTblOdUH
#define ExTblOdUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCHdr.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *TBL;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  TOvcTCString *OvcTCString1;
  TOvcTCRowHead *OvcTCRowHead1;
  TOvcTCColHead *OvcTCColHead1;
  void __fastcall TBLGetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTCString1OwnerDraw(TObject *Sender, TCanvas *TableCanvas,
  const TRect &CellRect, int RowNum, int ColNum,
  const TOvcCellAttributes &CellAttr, Pointer Data, bool &DoneIt);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
  SmallString<10> S;
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
