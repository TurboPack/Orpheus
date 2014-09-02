//---------------------------------------------------------------------------
#ifndef ExNbkUH
#define ExNbkUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcSC.hpp"
#include "OvcBase.hpp"
#include "OvcNbk.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcNF.hpp"
#include "OvcCal.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\Dialogs.hpp>
#include "OvcTimer.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TLabel *Label4;
  TButton *btnTabPos;
  TButton *btnShadowText;
  TButton *btnChangeTab;
  TButton *btnFontColor;
  TButton *btnFontSel;
  TOvcNotebook *NB1;
  TLabel *Label6;
  TOvcSimpleField *OvcSimpleField2;
  TOvcPictureField *OvcPictureField2;
  TOvcNumericField *OvcNumericField1;
  TOvcCalendar *OvcCalendar1;
  TLabel *Label3;
  TOvcNotebook *OvcNotebook2;
  TCheckBox *CheckBox1;
  TEdit *Edit1;
  TEdit *Edit2;
  TLabel *Label5;
  TOvcSimpleField *OvcSimpleField3;
  TOvcSimpleField *OvcSimpleField1;
  TOvcPictureField *OvcPictureField1;
  TButton *btnCalDate;
  TButton *btnTabDisable;
  TOvcSpinner *OvcFourWaySpinner2;
  TPanel *Panel1;
  TBitBtn *btnClose;
  TBitBtn *btnAuto;
  TOvcSpinner *OvcSpinner1;
  TOvcController *OvcController1;
  TColorDialog *ColorDialog1;
  TFontDialog *FontDialog1;
  TOvcTimerPool *TP;
  void __fastcall btnTabPosClick(TObject *Sender);
  void __fastcall btnShadowTextClick(TObject *Sender);
  void __fastcall btnChangeTabClick(TObject *Sender);
  void __fastcall btnFontColorClick(TObject *Sender);
  void __fastcall btnFontSelClick(TObject *Sender);
  void __fastcall btnCalDateClick(TObject *Sender);
  void __fastcall OvcCalendar1Change(TObject *Sender, TDateTime Date);
  void __fastcall btnTabDisableClick(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall btnAutoClick(TObject *Sender);
  void __fastcall NB1PageChange(TObject *Sender, int Index, bool &AllowChange);
    void __fastcall btnCloseClick(TObject *Sender);
    void __fastcall TPAllTriggers(TObject *Sender, int Handle,
          DWORD Interval, int ElapsedTime);
private:	// User declarations
  int T1, T2, T3; // trigger handles
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
