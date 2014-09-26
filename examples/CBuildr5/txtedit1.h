//---------------------------------------------------------------------------
#ifndef TxtEdit1H
#define TxtEdit1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Menus.hpp>
#include <vcl\Dialogs.hpp>
#include <vcl\ComCtrls.hpp>
#include <vcl\Clipbrd.hpp>
#include <vcl\Printers.hpp>
#include <vcl\Mapi.hpp>
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TEditForm : public TForm
{
__published:	// IDE-managed Components
  TOvcTextFileEditor *Editor1;
  TOvcController *DefaultController;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *New1;
  TMenuItem *Open1;
  TMenuItem *Save1;
  TMenuItem *SaveAs1;
  TMenuItem *N2;
  TMenuItem *Print1;
  TMenuItem *PrintSetup1;
  TMenuItem *N1;
  TMenuItem *Send1;
  TMenuItem *N9;
  TMenuItem *Exit1;
  TMenuItem *Edit1;
  TMenuItem *Undo1;
  TMenuItem *Undo2;
  TMenuItem *Redo1;
  TMenuItem *Redo2;
  TMenuItem *N6;
  TMenuItem *Cut1;
  TMenuItem *Cut2;
  TMenuItem *Copy1;
  TMenuItem *Copy2;
  TMenuItem *Paste1;
  TMenuItem *Paste2;
  TMenuItem *Delete1;
  TMenuItem *N8;
  TMenuItem *SelectAll1;
  TMenuItem *Search1;
  TMenuItem *Find1;
  TMenuItem *Replace1;
  TMenuItem *FindNext1;
  TMenuItem *N3;
  TMenuItem *GotoLine1;
  TMenuItem *Options1;
  TMenuItem *AutoIndentation1;
  TMenuItem *CreateBackupFile1;
  TMenuItem *Font1;
  TMenuItem *N5;
  TMenuItem *Tabs1;
  TMenuItem *FixedTabs1;
  TMenuItem *RealTabs1;
  TMenuItem *SmartTabs1;
  TMenuItem *N7;
  TMenuItem *TabSize1;
  TMenuItem *N4;
  TMenuItem *WordWrap1;
  TMenuItem *WraptoWindow1;
  TMenuItem *WrapAtColumn1;
  TMenuItem *WordStarCommands1;
  TMenuItem *Help1;
  TMenuItem *About1;
  TFontDialog *FontDialog1;
  TOpenDialog *OpenDialog1;
  TPrinterSetupDialog *PrinterSetupDialog1;
  TPrintDialog *PrintDialog1;
  TSaveDialog *SaveDialog1;
  TStatusBar *StatusBar1;
  TFindDialog *FindDialog1;
  TReplaceDialog *ReplaceDialog1;
  void __fastcall Font1Click(TObject *Sender);
  void __fastcall Open1Click(TObject *Sender);
  void __fastcall Exit1Click(TObject *Sender);
  void __fastcall PrintSetup1Click(TObject *Sender);
  void __fastcall SelectAll1Click(TObject *Sender);
  void __fastcall File1Click(TObject *Sender);
  void __fastcall Copy1Click(TObject *Sender);
  void __fastcall Search1Click(TObject *Sender);
  void __fastcall GotoLine1Click(TObject *Sender);
  void __fastcall About1Click(TObject *Sender);
  void __fastcall TabSize1Click(TObject *Sender);
  void __fastcall WordStarCommands1Click(TObject *Sender);
  void __fastcall Editor1ShowStatus(TObject *Sender, int LineNum, int ColNum);
  void __fastcall Edit1Click(TObject *Sender);
  void __fastcall WordWrap1Click(TObject *Sender);
  void __fastcall WrapAtColumn1Click(TObject *Sender);
  void __fastcall AutoIndentation1Click(TObject *Sender);
  void __fastcall CreateBackupFile1Click(TObject *Sender);
  void __fastcall TabTypeClick(TObject *Sender);
  void __fastcall New1Click(TObject *Sender);
  void __fastcall SaveAs1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Save1Click(TObject *Sender);
  void __fastcall Undo1Click(TObject *Sender);
  void __fastcall Redo1Click(TObject *Sender);
  void __fastcall Cut1Click(TObject *Sender);
  void __fastcall Paste1Click(TObject *Sender);
  void __fastcall Delete1Click(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
  void __fastcall WraptoWindow1Click(TObject *Sender);
  void __fastcall FormResize(TObject *Sender);
  void __fastcall Send1Click(TObject *Sender);
  void __fastcall Print1Click(TObject *Sender);
  void __fastcall Find1Click(TObject *Sender);
  void __fastcall FindDialog1Find(TObject *Sender);
  void __fastcall FindNext1Click(TObject *Sender);
  void __fastcall Replace1Click(TObject *Sender);
  void __fastcall ReplaceDialog1Replace(TObject *Sender);
private:	// User declarations
  void __fastcall AppMessage(TMsg& Msg, bool& Handled);
  TSearchOptionSet OptionSet;
public:		// User declarations
  __fastcall TEditForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TEditForm *EditForm;
//---------------------------------------------------------------------------
#endif
