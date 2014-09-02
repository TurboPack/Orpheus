//---------------------------------------------------------------------------
#ifndef MdieditmH
#define MdieditmH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\ComCtrls.hpp>
#include "OvcBase.hpp"
#include <vcl\Menus.hpp>
#include <vcl\Dialogs.hpp>
#include <vcl\Printers.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
  TPanel *SpeedPanel;
  TSpeedButton *OpenBtn;
  TSpeedButton *SaveBtn;
  TSpeedButton *CutBtn;
  TSpeedButton *CopyBtn;
  TSpeedButton *PasteBtn;
  TSpeedButton *ExitBtn;
  TOvcController *MainController;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *New1;
  TMenuItem *Open1;
  TMenuItem *Save1;
  TMenuItem *SaveAs1;
  TMenuItem *N8;
  TMenuItem *Print1;
  TMenuItem *PrintSetup1;
  TMenuItem *N7;
  TMenuItem *Exit1;
  TMenuItem *Edit1;
  TMenuItem *Undo1;
  TMenuItem *Undo2;
  TMenuItem *Redo1;
  TMenuItem *Redo2;
  TMenuItem *N10;
  TMenuItem *Cut1;
  TMenuItem *Cut2;
  TMenuItem *Copy1;
  TMenuItem *Copy2;
  TMenuItem *Paste1;
  TMenuItem *Paste2;
  TMenuItem *Delete1;
  TMenuItem *N9;
  TMenuItem *SelectAll1;
  TMenuItem *Search1;
  TMenuItem *Find1;
  TMenuItem *Replace1;
  TMenuItem *FindNext1;
  TMenuItem *N11;
  TMenuItem *GoToLine1;
  TMenuItem *Options1;
  TMenuItem *AutoIndentation1;
  TMenuItem *CreateBackupFile1;
  TMenuItem *Font1;
  TMenuItem *N14;
  TMenuItem *Tabs1;
  TMenuItem *FixedTabs1;
  TMenuItem *RealTabs1;
  TMenuItem *SmartTabs1;
  TMenuItem *N13;
  TMenuItem *TabSize1;
  TMenuItem *N12;
  TMenuItem *Wordwrap1;
  TMenuItem *WraptoWindow1;
  TMenuItem *WrapatColumn1;
  TMenuItem *WordStarCommands1;
  TMenuItem *Window1;
  TMenuItem *Cascade1;
  TMenuItem *Tile1;
  TMenuItem *ArrangeIcons1;
  TMenuItem *MinimizeAll1;
  TMenuItem *N2;
  TMenuItem *Split1;
  TMenuItem *Help1;
  TMenuItem *About1;
  TOpenDialog *OpenDialog1;
  TPrintDialog *PrintDialog1;
  TPrinterSetupDialog *PrinterSetupDialog1;
  TSaveDialog *SaveDialog1;
  TFontDialog *FontDialog1;
  TFindDialog *FindDialog1;
  TReplaceDialog *ReplaceDialog1;
  TStatusBar *StatusBar;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall New1Click(TObject *Sender);
  void __fastcall Open1Click(TObject *Sender);
  void __fastcall Save1Click(TObject *Sender);
  void __fastcall SaveAs1Click(TObject *Sender);
  void __fastcall Exit1Click(TObject *Sender);
  void __fastcall Cut1Click(TObject *Sender);
  void __fastcall Copy1Click(TObject *Sender);
  void __fastcall Paste1Click(TObject *Sender);
  void __fastcall Cascade1Click(TObject *Sender);
  void __fastcall Tile1Click(TObject *Sender);
  void __fastcall ArrangeIcons1Click(TObject *Sender);
  void __fastcall MinimizeAll1Click(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall PrintSetup1Click(TObject *Sender);
  void __fastcall File1Click(TObject *Sender);
  void __fastcall Undo1Click(TObject *Sender);
  void __fastcall Redo1Click(TObject *Sender);
  void __fastcall Delete1Click(TObject *Sender);
  void __fastcall SelectAll1Click(TObject *Sender);
  void __fastcall Edit1Click(TObject *Sender);
  void __fastcall Window1Click(TObject *Sender);
  void __fastcall About1Click(TObject *Sender);
  void __fastcall AutoIndentation1Click(TObject *Sender);
  void __fastcall CreateBackupFile1Click(TObject *Sender);
  void __fastcall Font1Click(TObject *Sender);
  void __fastcall Options1Click(TObject *Sender);
  void __fastcall TabTypeClick(TObject *Sender);
  void __fastcall TabSize1Click(TObject *Sender);
  void __fastcall Wordwrap1Click(TObject *Sender);
  void __fastcall WraptoWindow1Click(TObject *Sender);
  void __fastcall WrapatColumn1Click(TObject *Sender);
  void __fastcall WordStarCommands1Click(TObject *Sender);
  void __fastcall Search1Click(TObject *Sender);
  void __fastcall GoToLine1Click(TObject *Sender);
  void __fastcall Find1Click(TObject *Sender);
  void __fastcall FindDialog1Find(TObject *Sender);
  void __fastcall FindNext1Click(TObject *Sender);
  void __fastcall Replace1Click(TObject *Sender);
  void __fastcall ReplaceDialog1Replace(TObject *Sender);
  void __fastcall Split1Click(TObject *Sender);
  void __fastcall Print1Click(TObject *Sender);
private:	// User declarations
  void __fastcall AppMessage(TMsg& Msg, bool& Handled);
  void CreateMDIChild(const String Name, bool NewFile);
  void __fastcall ShowHint(TObject* Sender);
  void __fastcall WMNCLButtonDblClk(TWMNCLButtonDblClk& Message);
public:		// User declarations
  __fastcall TMainForm(TComponent* Owner);
  int TabSize;
  int WrapColumn;
  TSearchOptionSet OptionSet;
  bool FontIsSet;
  Set<unsigned char, 0, 0> NoNameSet;
  void __fastcall UpdateButtons(TObject* Sender);
  void UpdateStatusLine();
  void UpdateChildOptions();
  BEGIN_MESSAGE_MAP
    MESSAGE_HANDLER(WM_NCLBUTTONDBLCLK, TWMNCLButtonDblClk, WMNCLButtonDblClk)
  END_MESSAGE_MAP(TForm)
};
//---------------------------------------------------------------------------
extern TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
