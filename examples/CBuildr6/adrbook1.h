//---------------------------------------------------------------------------
#ifndef Adrbook1H
#define Adrbook1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcNbk.hpp"
#include "OvcBase.hpp"
#include "OvcVlb.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcSC.hpp"
#include "OvcEdit.hpp"
#include "OvcEditU.hpp"
#include "OvcValid.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\Menus.hpp>
#include "OvcXfer.hpp"
#include <vcl\Dialogs.hpp>
#include "OvcVLB.hpp"
//---------------------------------------------------------------------------
enum TRecState {rsDefault, rsNew, rsEdit};
int RecState;
int StateError = oeCustomError + 1;
int MaxStates = 50;
char StateAbbrevs[51][3] = {
     "AK",  "AL",  "AR",  "AZ",  "CA",  "CO",
     "CT",  "DC",  "DE",  "FL",  "GA",  "HI",
     "IA",  "ID",  "IL",  "IN",  "KS",  "KY",
     "LA",  "MA",  "MD",  "ME",  "MI",  "MN",
     "MO",  "MS",  "MT",  "NC",  "ND",  "NE",
     "NH",  "NJ",  "NM",  "NV",  "NY",  "OH",
     "OK",  "OR",  "PA",  "RI",  "SC",  "SD",
     "TN",  "TX",  "UT",  "VA",  "VT",  "WA",
     "WI",  "WV",  "WY" };
// transfer buffer for the AdrForm form
#pragma pack(push, 1)
struct TRec {
  char LastName[16];
  char FirstName[16];
  char Company[31];
  char Street[31];
  char City[16];
  char State[3];
  char Zip[11];
  char HomePhone[15];
  char WorkPhone[15];
  TOvcDate Birthday;
  TOvcDate Anniversary;
  char Memo[256];
};
#pragma pack(pop)

class TAddrForm : public TForm
{
__published:	// IDE-managed Components
  TOvcNotebook *OvcNotebook1;
  TOvcVirtualListBox *OvcVirtualListbox1;
  TGroupBox *GroupBox1;
  TLabel *Label1;
  TOvcSimpleField *LastNameField;
  TOvcSimpleField *FirstNameField;
  TOvcSimpleField *CompanyField;
  TOvcSimpleField *StreetField;
  TOvcSimpleField *CityField;
  TOvcSimpleField *StateField;
  TOvcPictureField *ZipField;
  TOvcSpinner *OvcSpinner1;
  TGroupBox *GroupBox2;
  TOvcPictureField *HomePhoneField;
  TOvcPictureField *WorkPhoneField;
  TGroupBox *GroupBox3;
  TOvcPictureField *BirthdayField;
  TOvcPictureField *AnniversaryField;
  TOvcSpinner *OvcFourWaySpinner1;
  TOvcSpinner *OvcFourWaySpinner2;
  TLabel *Label2;
  TOvcEditor *OvcEditor1;
  TPanel *Panel2;
  TSpeedButton *ExitButton;
  TSpeedButton *InsButton;
  TSpeedButton *DelButton;
  TSpeedButton *FirstButton;
  TSpeedButton *PrevButton;
  TSpeedButton *NextButton;
  TSpeedButton *HelpButton;
  TSpeedButton *LastButton;
  TPanel *Panel1;
  TOvcController *OvcController1;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *New1;
  TMenuItem *Open1;
  TMenuItem *N1;
  TMenuItem *Save1;
  TMenuItem *SaveAs1;
  TMenuItem *N2;
  TMenuItem *Exit1;
  TMenuItem *Edit1;
  TMenuItem *Insert1;
  TMenuItem *Modify1;
  TMenuItem *Delete1;
  TMenuItem *Help1;
  TMenuItem *About1;
  TOvcTransfer *OvcTransfer1;
  TOvcController *OvcController2;
  TOpenDialog *OpenDialog1;
  TSaveDialog *SaveDialog1;
  void __fastcall OvcSpinner1Click(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap);
  void __fastcall StateFieldUserCommand(TObject *Sender, WORD Command);
  void __fastcall StateFieldUserValidation(TObject *Sender, WORD &ErrorCode);
  void __fastcall StateFieldError(TObject *Sender, WORD ErrorCode,
  AnsiString ErrorMsg);
  void __fastcall PictureFieldExit(TObject *Sender);
  void __fastcall PhoneFieldUserValidation(TObject *Sender, WORD &ErrorCode);
  void __fastcall ZipFieldUserValidation(TObject *Sender, WORD &ErrorCode);
  void __fastcall Exit1Click(TObject *Sender);
  void __fastcall Open1Click(TObject *Sender);
  void __fastcall Save1Click(TObject *Sender);
  void __fastcall Insert1Click(TObject *Sender);
  void __fastcall Delete1Click(TObject *Sender);
  void __fastcall Modify1Click(TObject *Sender);
  void __fastcall SaveAs1Click(TObject *Sender);
  void __fastcall OvcNotebook1PageChanged(TObject *Sender, int Index);
  void __fastcall About1Click(TObject *Sender);
  void __fastcall New1Click(TObject *Sender);
  void __fastcall LastButtonClick(TObject *Sender);
  void __fastcall FirstButtonClick(TObject *Sender);
  void __fastcall NextButtonClick(TObject *Sender);
  void __fastcall PrevButtonClick(TObject *Sender);
  void __fastcall DisplayCalendar(TObject *Sender, WORD Command);
  
  void __fastcall PopupCalendar(TObject *Sender);
  
  void __fastcall OvcVirtualListbox1GetItem(TObject *Sender, int Index,
  AnsiString &ItemString);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormResize(TObject *Sender);
  void __fastcall OvcNotebook1PageChange(TObject *Sender, int Index,
  bool &AllowChange);
private:	// User declarations
  TRec TR;
  TStringList* DataList;
  TFileName CurFile;
  int BH;
  int BW;
  void AddRecord();
  void __fastcall AddrException(TObject* Sender, Exception* E);
  void ClearData();
  int  FindState(const String& P);
  void InitAddrFormTransfer(TRec& DataRec);
  void ReadFile(TFileName AddrFile);
  void SaveToFile(TFileName AddrFile);
  void __fastcall StatusHint(TObject* Sender);
  void TransferFromDataList(int Index, TRec& Rec);
  void TransferFromForm();
  void TransferToForm();
  void UpdateFileName(TFileName FName);
  void UpdateMemoLabel();
  void UpdateRecord();
  void WMGetMinMaxInfo(TWMGetMinMaxInfo& Message);
public:		// User declarations
  __fastcall TAddrForm(TComponent* Owner);
  BEGIN_MESSAGE_MAP
    MESSAGE_HANDLER(WM_GETMINMAXINFO, TWMGetMinMaxInfo, WMGetMinMaxInfo);
  END_MESSAGE_MAP(TForm)
};
//---------------------------------------------------------------------------
extern TAddrForm *AddrForm;
//---------------------------------------------------------------------------
#endif
 
