//---------------------------------------------------------------------------
#ifndef ExEdODuH
#define ExEdODuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TOvcTextFileEditor *OvcTextFileEditor1;
  TBitBtn *BitBtn1;
  TOvcController *OvcController1;
  void __fastcall OvcTextFileEditor1DrawLine(TObject *Sender,
  TCanvas *EditorCanvas, TRect &Rect, PChar S, int Len, int Line, int Pos,
  int Count, int HBLine, int HBCol, int HELine, int HECol, bool &WasDrawn);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
