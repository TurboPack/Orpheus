//---------------------------------------------------------------------------
#ifndef ExAeuH
#define ExAeuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcAe.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include <vcl\Dialogs.hpp>

const int MaxItems = 50;

//---------------------------------------------------------------------------
class TAEForm : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label2;
  TLabel *Label3;
  TOvcController *OvcController1;
  TOvcSimpleArrayEditor *AE1;
  TOvcPictureArrayEditor *AE2;
  TBitBtn *BitBtn1;
  TBitBtn *btnColor;
  TColorDialog *dlgColor;
  void __fastcall AE1GetItem(TObject *Sender, int Index, Pointer &Value);
  void __fastcall BitBtn1Click(TObject *Sender);
  void __fastcall AE1GetItemColor(TObject *Sender, int Index, TColor &FG,
  TColor &BG);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall AE1DblClick(TObject *Sender);
  void __fastcall AE2GetItem(TObject *Sender, int Index, Pointer &Value);
  void __fastcall AE2DblClick(TObject *Sender);
  void __fastcall btnColorClick(TObject *Sender);
  void __fastcall AE1Select(TObject *Sender, int NewIndex);
  void __fastcall AE2Select(TObject *Sender, int NewIndex);
private:	// User declarations
  // Data for the array. Data type must match the array data type
  long Data[MaxItems];
  TColor Colors[MaxItems];
  TOvcDate Dates[MaxItems];
  
public:		// User declarations
  __fastcall TAEForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TAEForm *AEForm;
//---------------------------------------------------------------------------
#endif
