//---------------------------------------------------------------------------
#ifndef ExLkOutuH
#define ExLkOutuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcLkOut.hpp"
#include "OvcBase.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Menus.hpp>
#include "OvcState.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
	TOvcLookOutBar *LOB;
	TPanel *DetailPanel;
	TPanel *TitlePanel;
	TPaintBox *imgTitle;
	TLabel *lblTitle;
	TListBox *ListBox1;
	TOvcController *OrController1;
	TPopupMenu *PopupMenu1;
	TMenuItem *miLargeIcons;
	TMenuItem *miSmallIcons;
	TMenuItem *miRenameFolder;
	TMenuItem *miRenameItem;
	TMenuItem *miAddItem;
	TMenuItem *miAddFolder;
	TImageList *ImageList1;
    TLabel *Label1;
	void __fastcall LOBDragDrop(TObject *Sender, TObject *Source, int X, int Y,
	int FolderIndex, int ItemIndex);
	void __fastcall LOBDragOver(TObject *Sender, TObject *Source, int X, int Y,
	TDragState State, bool &AcceptFolder, bool &AcceptItem);
	void __fastcall PopupMenu1Popup(TObject *Sender);
	void __fastcall miSmallIconsClick(TObject *Sender);
	void __fastcall miLargeIconsClick(TObject *Sender);
	void __fastcall miRenameFolderClick(TObject *Sender);
	void __fastcall miRenameItemClick(TObject *Sender);
	void __fastcall miAddItemClick(TObject *Sender);
	void __fastcall miAddFolderClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
        void __fastcall LOBItemClick(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int Index);
private:	// User declarations
public:		// User declarations
	__fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
