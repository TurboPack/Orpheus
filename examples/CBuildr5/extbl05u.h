//---------------------------------------------------------------------------
#ifndef ExTbl05UH
#define ExTbl05UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCBox.hpp"
#include "OvcTCGly.hpp"
#include "OvcTCBmp.hpp"
#include "OvcTCell.hpp"

#pragma pack(push, 1)
struct MyDataRecord {
  bool TF1;
  bool TF2;
  bool TF3;
} MyData[9];
#pragma pack(pop)

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcController *OvcController1;
  TOvcTCCheckBox *TblCB1;
  TOvcTCCheckBox *TblCB2;
  TOvcTCCheckBox *TblCB3;
  TOvcTable *OvcTable1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall TblCB1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
