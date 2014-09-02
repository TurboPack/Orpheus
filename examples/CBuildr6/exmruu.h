//---------------------------------------------------------------------------
#ifndef ExMruUH
#define ExMruUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Menus.hpp>
#include <vcl\Dialogs.hpp>
#include "OvcState.hpp"
#include "OvcBase.hpp"
#include "OvcStore.hpp"
#include "OvcFiler.hpp"
#include "OvcMRU.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TMemo *Memo1;
	TMainMenu *MainMenu1;
	TMenuItem *File1;
	TMenuItem *Open1;
	TMenuItem *Reopen1;
	TMenuItem *ClearHistoryList1;
	TMenuItem *N1;
	TMenuItem *Exit1;
	TOpenDialog *OpenDialog1;
	TOvcComponentState *OvcComponentState1;
	TOvcIniFileStore *OvcIniFileStore1;
	TOvcMenuMRU *BCBList;
	TOvcMenuMRU *FileMenuList;
	void __fastcall Open1Click(TObject *Sender);
	void __fastcall ClearHistoryList1Click(TObject *Sender);
	void __fastcall Exit1Click(TObject *Sender);
	
	
    void __fastcall MenuMRUClick(TObject *Sender, const AnsiString ItemText,
          TOvcMRUClickAction &Action);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
