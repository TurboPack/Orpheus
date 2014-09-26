//---------------------------------------------------------------------------
#ifndef TxtView1H
#define TxtView1H
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
#include "OvcViewr.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TViewForm : public TForm
{
__published:	// IDE-managed Components
  TOvcTextFileViewer *Viewer1;
  TOvcController *DefaultController;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *Open1;
  TMenuItem *N2;
  TMenuItem *Print1;
  TMenuItem *PrintSetup1;
  TMenuItem *N1;
  TMenuItem *Exit1;
  TMenuItem *Clipboard1;
  TMenuItem *Copy1;
  TMenuItem *Copy2;
  TMenuItem *SelectAll1;
  TMenuItem *Search1;
  TMenuItem *Find1;
  TMenuItem *FindNext1;
  TMenuItem *N3;
  TMenuItem *GotoLine1;
  TMenuItem *Options1;
  TMenuItem *TabExpansion1;
  TMenuItem *WordStarCommands1;
  TMenuItem *N5;
  TMenuItem *TabSize1;
  TMenuItem *N4;
  TMenuItem *Font1;
  TMenuItem *Help1;
  TMenuItem *About1;
  TFontDialog *FontDialog1;
  TOpenDialog *OpenDialog1;
  TPrinterSetupDialog *PrinterSetupDialog1;
  TPrintDialog *PrintDialog1;
  TFindDialog *FindDialog1;
  TStatusBar *StatusBar1;
  void __fastcall Font1Click(TObject *Sender);
  void __fastcall Open1Click(TObject *Sender);
  void __fastcall Exit1Click(TObject *Sender);
  void __fastcall PrintSetup1Click(TObject *Sender);
  void __fastcall SelectAll1Click(TObject *Sender);
  void __fastcall Clipboard1Click(TObject *Sender);
  void __fastcall File1Click(TObject *Sender);
  void __fastcall Copy1Click(TObject *Sender);
  void __fastcall Search1Click(TObject *Sender);
  void __fastcall GotoLine1Click(TObject *Sender);
  void __fastcall Viewer1ShowStatus(TObject *Sender, int LineNum, int ColNum);
  void __fastcall About1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall TabExpansion1Click(TObject *Sender);
  void __fastcall TabSize1Click(TObject *Sender);
  void __fastcall Find1Click(TObject *Sender);
  void __fastcall FindDialog1Find(TObject *Sender);
  void __fastcall FindNext1Click(TObject *Sender);
  void __fastcall WordStarCommands1Click(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall Print1Click(TObject *Sender);
private:	// User declarations
  void __fastcall AppMessage(TMsg& Msg, bool& Handled);
  TSearchOptionSet OptionSet;
public:		// User declarations
  __fastcall TViewForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TViewForm *ViewForm;
//---------------------------------------------------------------------------
#endif
