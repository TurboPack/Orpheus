//---------------------------------------------------------------------------
#ifndef FilView3H
#define FilView3H
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\Buttons.hpp>
//---------------------------------------------------------------------------
class TFindDlg : public TForm
{
__published:	// IDE-managed Components
  TGroupBox *GroupBox1;
  TEdit *Edit1;
  TGroupBox *GroupBox2;
  TBevel *Bevel1;
  TRadioButton *RadioButton1;
  TRadioButton *RadioButton2;
  TCheckBox *CheckBox1;
  TCheckBox *CheckBox2;
  TBitBtn *BitBtn1;
  TBitBtn *BitBtn2;
    void __fastcall BitBtn1Click(TObject *Sender);
    void __fastcall BitBtn2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TFindDlg(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TFindDlg *FindDlg;
//---------------------------------------------------------------------------
#endif
