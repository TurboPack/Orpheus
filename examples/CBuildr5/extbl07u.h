//---------------------------------------------------------------------------
#ifndef ExTbl07UH
#define ExTbl07UH
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

#define MyMessage1 WM_USER + 1
#define MyMessage2 WM_USER + 2

#pragma pack(push, 1)
struct MyRec {
  int GIdx;
  char CStr[11];
} MyArray[9];
#pragma pack(pop)

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TButton *Button1;
  TOvcController *OvcController1;
  TOvcTCGlyph *OvcTCGlyph1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTCGlyph1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
  void __fastcall OnMyMessage1(TMessage& Msg);
  void __fastcall OnMyMessage2(TMessage& Msg);
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
  BEGIN_MESSAGE_MAP
    MESSAGE_HANDLER(MyMessage1, TMessage, OnMyMessage1)
    MESSAGE_HANDLER(MyMessage2, TMessage, OnMyMessage2)
  END_MESSAGE_MAP(TForm)
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
