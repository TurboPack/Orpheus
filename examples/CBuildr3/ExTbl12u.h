//---------------------------------------------------------------------------
#ifndef ExTbl12uH
#define ExTbl12uH
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
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCPic.hpp"
#include "OvcTCBEF.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcTable *OvcTable1;
	TButton *Button1;
	TMemo *Memo1;
	TOvcController *OvcController1;
	TOvcTCCheckBox *CB1;
	TOvcTCString *SF1;
	TOvcTCPictureField *PF1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
	Pointer &Data, TOvcCellDataPurpose Purpose);
	void __fastcall CB1Click(TObject *Sender);
	void __fastcall OvcTable1Exit(TObject *Sender);
	void __fastcall OvcTable1ColumnsChanged(TObject *Sender, int ColNum1,
	int ColNum2, TOvcTblActions Action);
	void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
