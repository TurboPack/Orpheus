//---------------------------------------------------------------------------
#ifndef OrdNtry1H
#define OrdNtry1H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\Menus.hpp>
#include <vcl\ComCtrls.hpp>
#include <vcl\Dialogs.hpp>
#include "OvcXfer.hpp"
#include "OvcTCEdt.hpp"
#include "OvcTCStr.hpp"
#include "OvcTCell.hpp"
#include "OvcTCNum.hpp"
#include "OvcTCBEF.hpp"
#include "OvcTCSim.hpp"
#include "OvcTCHdr.hpp"
#include "OvcValid.hpp"
#include "OvcNbk.hpp"
#include "OvcBase.hpp"
#include "OvcVlb.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcSC.hpp"
#include "OvcTable.hpp"
#include "OvcTCmmn.hpp"
#include <fstream.h>
#include "CalUnit.h"
#include "OvcVLB.hpp"

enum TRecState { rsDefault, rsNew, rsEdit };

const int NumOrders = 20;  // Changing this will effect your data file
const int StateError = oeCustomError + 1;
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
     "WI",  "WV",  "WY"
};

#pragma pack(push, 1)
struct OrdRec {
  __int16 Qty;
  SmallString<25> Desc;
  double Cost;
  double Total;
};

struct TRec {
  SmallString<15> LastName;
  SmallString<15> FirstName;
  SmallString<30> Company;
  SmallString<30> Street;
  SmallString<15> City;
  SmallString<2> State;
  SmallString<10> Zip;
  TOvcDate Date;
  OrdRec Orders[NumOrders];
};
#pragma pack(pop)

//---------------------------------------------------------------------------
class TOrdEntryForm : public TForm
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
  TOvcTable *OvcTable1;
  TPanel *Panel2;
  TSpeedButton *SpeedButton1;
  TSpeedButton *SpeedButton3;
  TSpeedButton *SpeedButton4;
  TSpeedButton *FirstButton;
  TSpeedButton *PrevButton;
  TSpeedButton *NextButton;
  TSpeedButton *SpeedButton9;
  TSpeedButton *LastButton;
  TOvcController *OvcController1;
  TMainMenu *MainMenu1;
  TMenuItem *File1;
  TMenuItem *New1;
  TMenuItem *Open1;
  TMenuItem *N1;
  TMenuItem *Save1;
  TMenuItem *SaveAs1;
  TMenuItem *N3;
  TMenuItem *Calendar1;
  TMenuItem *N2;
  TMenuItem *Exit1;
  TMenuItem *Edit1;
  TMenuItem *Insert1;
  TMenuItem *Modify1;
  TMenuItem *Delete1;
  TMenuItem *InsertHotkey1;
  TMenuItem *DeleteHotkey1;
  TMenuItem *Help1;
  TMenuItem *About1;
  TOvcTransfer *OvcTransfer1;
  TOvcController *OvcController2;
  TOpenDialog *OpenDialog1;
  TSaveDialog *SaveDialog1;
  TOvcTCString *OvcTCString1;
  TOvcTCNumericField *OvcTCNumericField1;
  TOvcTCSimpleField *OvcTCSimpleField1;
  TOvcTCRowHead *OvcTCRowHead1;
  TOvcTCSimpleField *OvcTCSimpleField2;
  TStatusBar *StatusBar1;
  void __fastcall Exit1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
  void __fastcall FormResize(TObject *Sender);
  void __fastcall Insert1Click(TObject *Sender);
  void __fastcall Open1Click(TObject *Sender);
  void __fastcall OvcNotebook1PageChange(TObject *Sender, int Index,
  bool &AllowChange);
  void __fastcall OvcSpinner1Click(TObject *Sender, TOvcSpinState State,
  double Delta, bool Wrap);
  void __fastcall OvcVirtualListbox1GetItem(TObject *Sender, int Index,
  AnsiString &ItemString);
  void __fastcall PictureFieldExit(TObject *Sender);
  void __fastcall PopupCalendar(TObject *Sender);
  void __fastcall Save1Click(TObject *Sender);
  void __fastcall StateFieldError(TObject *Sender, WORD ErrorCode,
  AnsiString ErrorMsg);
  void __fastcall StateFieldUserCommand(TObject *Sender, WORD Command);
  void __fastcall StateFieldUserValidation(TObject *Sender, WORD &ErrorCode);
  void __fastcall ZipFieldUserValidation(TObject *Sender, WORD &ErrorCode);
  void __fastcall Delete1Click(TObject *Sender);
  void __fastcall Modify1Click(TObject *Sender);
  void __fastcall SaveAs1Click(TObject *Sender);
  void __fastcall OvcNotebook1PageChanged(TObject *Sender, int Index);
  void __fastcall About1Click(TObject *Sender);
  void __fastcall New1Click(TObject *Sender);
  void __fastcall OvcTable1GetCellData(TObject *Sender, int RowNum, int ColNum,
  Pointer &Data, TOvcCellDataPurpose Purpose);
  void __fastcall OvcTable1GetCellAttributes(TObject *Sender, int RowNum,
  int ColNum, TOvcCellAttributes &CellAttr);
  void __fastcall OvcTable1ActiveCellMoving(TObject *Sender, WORD Command,
  int &RowNum, int &ColNum);
  void __fastcall OvcTable1LeavingColumn(TObject *Sender, int ColNum);
  void __fastcall OvcTable1LeavingRow(TObject *Sender, int RowNum);
  void __fastcall FirstButtonClick(TObject *Sender);
  void __fastcall PrevButtonClick(TObject *Sender);
  void __fastcall NextButtonClick(TObject *Sender);
  void __fastcall LastButtonClick(TObject *Sender);
private:	// User declarations
  bool DataListIsModified;
public:		// User declarations
  TRec TR;
  TRecState RecState;
  TStringList* DataList;
  int BH, BW;
  ShortString CellData;
  double CalcValue;
  TFileName CurFile;
  void AddRecord();
  int FindState(const String& P);
  void __fastcall OrdException(TObject* Sender, Exception* E);
  void ClearData();
  void InitOrderFormTransfer(TRec& DataRec);
  bool InvalidRecord();
  void MoveToRecord(int Index, TRec& Rec);
  bool OrderWasModified();
  void ReadFile(TFileName OrderFile);
  void ResetForm();
  bool ResetTable();
  void SaveToFile(TFileName OrderFile);
  void __fastcall StatusHint(TObject* Sender);
  void __fastcall TableHint(String& HintStr, bool& CanShow, THintInfo& HintInfo);
  void TransferFromDataList(long Index, TRec& Rec);
  void TransferFromForm();
  void TransferToForm();
  void UpdateFileName(TFileName FName);
  void UpdateIfModified();
  void UpdateRecord();
  void UpdateTable();
  bool WillNotSave();
  void __fastcall WMGetMinMaxInfo(TWMGetMinMaxInfo& Message);
  __fastcall TOrdEntryForm(TComponent* Owner);
  __fastcall ~TOrdEntryForm();
  BEGIN_MESSAGE_MAP
    MESSAGE_HANDLER(WM_GETMINMAXINFO, TWMGetMinMaxInfo, WMGetMinMaxInfo)
  END_MESSAGE_MAP(TForm)
};
//---------------------------------------------------------------------------
extern TOrdEntryForm *OrdEntryForm;
//---------------------------------------------------------------------------
#endif
