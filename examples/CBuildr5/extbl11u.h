//---------------------------------------------------------------------------
#ifndef ExTbl11UH
#define ExTbl11UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ComCtrls.hpp>
#include <vcl\Buttons.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCHdr.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCBEF.hpp"

struct TTestRec {
  SmallString<50> Name;
  Word Age;
};

/*TTestRec TestDatabase[] = {
  { "Bucknall, Julian", 39 },
  { "Inman, Lee",       44 },
  { "Hughes, Terry",    37 },
  { "Reisdorph, Kent",  36 },
  { "Leier, John",      32 },
  { "Frerking, Gary",   33 },
  { "Rose, Larry",      36 },
  { "",                 0 },
  { "",                 0 }
}; */

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  TOvcTCString *OvcTCString1;
  TOvcTCRowHead *OvcTCRowHead1;
  TOvcTCPictureField *OvcTCPictureField1;
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTable1GetCellAttributes(TObject *Sender, int RowNum,
  int ColNum, TOvcCellAttributes &CellAttr);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
  SmallString<10> ColHeading;
  TTestRec TestDatabase[9];
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
