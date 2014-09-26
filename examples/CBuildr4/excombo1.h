//---------------------------------------------------------------------------
#ifndef ExCombo1H
#define ExCombo1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcTCHdr.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCCBx.hpp"

#pragma pack(push, 1)
struct TTestRec {
  int  C1Index;
  SmallString<20> C1String;
  int  C2Index;
};
#pragma pack(pop)

/*TTestRec TestDatabase[] = {
  {2, "", 7},
  {2, "", 4},
  {4, "", 9},
  {6, "", 8},
  {1, "", 2},
  {4, "", 5},
  {7, "", 6},
  {3, "", 7},
  {5, "", 1}
}; */


//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  TOvcTCColHead *OvcTCColHead1;
  TOvcTCComboBox *OvcTCComboBox1;
  TOvcTCComboBox *OvcTCComboBox2;
  TOvcTCRowHead *OvcTCRowHead1;
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTable1DoneEdit(TObject *Sender, int RowNum, int ColNum);
private:	// User declarations
  ShortString CellData;
  TCellComboBoxInfo ComboTemp;
  TTestRec TestDatabase[9];
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
