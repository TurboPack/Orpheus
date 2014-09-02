//---------------------------------------------------------------------------
#ifndef ExOutl2uH
#define ExOutl2uH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcOutln.hpp"
#include "OvcVLB.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcOutline *OvcOutline1;
	TOvcController *OvcController1;
	TImageList *ImageList1;
	TImageList *ImageList2;
	void __fastcall OvcOutline1NodeClick(TOvcCustomOutline *Sender,
	TOvcOutlineNode *Node);
	void __fastcall FormShow(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall OvcOutline1DrawCheck(TOvcCustomOutline *Sender,
	TCanvas *Canvas, TOvcOutlineNode *Node, TRect &Rect, TOvcOlNodeStyle Style,
	bool Checked, bool &DefaultDrawing);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
    bool OwnerDrawChecks;

};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
