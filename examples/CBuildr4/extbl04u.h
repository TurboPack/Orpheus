//---------------------------------------------------------------------------
#ifndef ExTbl04UH
#define ExTbl04UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCGly.hpp"
#include "OvcTCBmp.hpp"
#include "OvcTCell.hpp"
#include "OvcTCCBx.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCEdt.hpp"

#pragma pack(push, 1)
struct MyRec {
  int GIdx;
  int CIdx;
  char CStr[11];
} MyArray[9] ;
#pragma pack(pop)

  //---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TOvcController *OvcController1;
  TOvcTCGlyph *OvcTCGlyph1;
  TOvcTCComboBox *OvcTCComboBox1;
  TOvcTCString *OvcTCString1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTCComboBox1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
