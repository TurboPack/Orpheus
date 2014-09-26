//---------------------------------------------------------------------------
#ifndef ExTranUH
#define ExTranUH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcEF.hpp"
#include "OvcBase.hpp"
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
#include "OvcNbk.hpp"
#include "OvcSF.hpp"
#include "OvcNF.hpp"
#include "OvcXfer.hpp"
//---------------------------------------------------------------------------

#pragma pack(push, 1)
struct TForm1TransferRec {
  SmallString<255> Label1Text;
  SmallString<45> Edit1Text;
  bool CheckBox1Checked;
  bool RadioButton1Checked;
  TOvcDate OvcPictureField1Value;
  TListBoxTransfer ListBox1Xfer;
  TComboBoxTransfer ComboBox1Xfer;
  SmallString<255> Panel1Text;
  SmallString<15> OvcSimpleField1Value;
  SmallString<15> OvcPictureField2Value;
  long OvcNumericField1Value;
};
#pragma pack(pop)

class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TButton *Button1;
  TEdit *Edit1;
  TCheckBox *CheckBox1;
  TRadioButton *RadioButton1;
  TOvcPictureField *OvcPictureField1;
  TListBox *ListBox1;
  TComboBox *ComboBox1;
  TPanel *Panel1;
  TButton *Button2;
  TBitBtn *BitBtn1;
  TOvcNotebook *OvcNotebook1;
  TOvcSimpleField *OvcSimpleField1;
  TOvcPictureField *OvcPictureField2;
  TOvcNumericField *OvcNumericField1;
  TOvcController *DefaultController;
  TOvcTransfer *OvcTransfer1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
    TForm1TransferRec Rec;
    void InitForm1Transfer(TForm1TransferRec& Data);
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
