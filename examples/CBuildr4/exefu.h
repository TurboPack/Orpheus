//---------------------------------------------------------------------------
#ifndef ExEfUH
#define ExEfUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include "OvcSC.hpp"
#include "OvcBase.hpp"
#include "OvcNF.hpp"
#include "OvcPB.hpp"
#include "OvcEF.hpp"
#include "OvcPF.hpp"
#include <vcl\Buttons.hpp>
#include <vcl\inifiles.hpp>
#include "OvcSF.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TBevel *Bevel1;
  TLabel *Label1;
  TLabel *Label3;
  TLabel *Label4;
  TLabel *Label5;
  TLabel *Label6;
  TLabel *Label2;
  TLabel *Label8;
  TLabel *Label9;
  TLabel *Label10;
  TOvcSpinner *OvcFourWaySpinner1;
  TOvcPictureField *PF1;
  TOvcSpinner *OvcSpinner1;
  TBitBtn *BitBtn1;
  TOvcSimpleField *SF1;
  TOvcPictureField *PF2;
  TOvcSpinner *OvcFourWaySpinner2;
  TOvcController *OvcController1;
  TOvcNumericField *NF1;
  void __fastcall SF1Change(TObject *Sender);
  void __fastcall PF1Change(TObject *Sender);
  void __fastcall PF2Change(TObject *Sender);
  void __fastcall NF1Change(TObject *Sender);
  void __fastcall OvcController1Error(TObject *Sender, WORD ErrorCode,
  const AnsiString ErrorMsg);
  void __fastcall FormCreate(TObject *Sender);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
  void __fastcall WinIniChange(TObject* Sender);
  void SetPictureMasks();
  void ShowCountry();
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
