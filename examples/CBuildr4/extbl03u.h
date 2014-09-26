//---------------------------------------------------------------------------
#ifndef ExTbl03UH
#define ExTbl03UH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include "OvcBase.hpp"
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCBEF.hpp"

typedef SmallString<7> GroupNrString;

//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTable *OvcTable1;
  TButton *Button1;
  TOvcController *OvcController1;
  TOvcTCMemo *OvcTCMemo1;
  TOvcTCPictureField *OvcTCPictureField1;
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall OvcTable1DoneEdit(TObject *Sender, int RowNum, int ColNum);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
  char MyMemos[9][99];
  char ABuf[20];

  Word MyWords[9];
  GroupNrString AString;

  char*  LoStrBuf(PChar SB);
  void   UpStrBuf(char* SB, TRowNum Row);
  Word   String2GroupNr(GroupNrString S);
  GroupNrString GroupNr2String(Word N);
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
