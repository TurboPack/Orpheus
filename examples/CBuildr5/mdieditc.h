//---------------------------------------------------------------------------
#ifndef MdieditcH
#define MdieditcH
//---------------------------------------------------------------------------
#include <vcl\ExtCtrls.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcBase.hpp"
//---------------------------------------------------------------------------
class TMDIChild : public TForm
{
__published:	// IDE-managed Components
  TOvcTextFileEditor *Editor1;
  void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
  void __fastcall FormResize(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Editor1ShowStatus(TObject *Sender, int LineNum, int ColNum);
  void __fastcall FormCloseQuery(TObject *Sender, bool &CanClose);
  void __fastcall FormActivate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall Editor1Enter(TObject *Sender);
  void __fastcall SplitPanelMouseDown(TObject *Sender, TMouseButton Button,
  TShiftState Shift, int X, int Y);
  void __fastcall SplitPanelMouseUp(TObject *Sender, TMouseButton Button,
  TShiftState Shift, int X, int Y);
  void __fastcall SplitPanelMouseMove(TObject *Sender, TShiftState Shift, int X,
  int Y);
private:	// User declarations
  int StoredHeight;
  TOvcTextFileEditor* Editor2;
  TPanel* SplitPanel;
  int SizeStart;
  TPoint LinePos;
  bool Sizing;
  bool NeedsErase;
  void UpdateEditor(TOvcTextFileEditor* Editor);
public:		// User declarations
  __fastcall TMDIChild(TComponent* Owner);
  bool WindowIsSplit;
  TOvcTextFileEditor* ActiveEditor;
  void UpdateOptions();
  void SplitWindow();
};
//---------------------------------------------------------------------------
extern TMDIChild *MDIChild;
//---------------------------------------------------------------------------
#endif
