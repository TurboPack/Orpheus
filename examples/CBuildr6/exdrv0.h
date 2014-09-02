//---------------------------------------------------------------------------
#ifndef ExDrv0H
#define ExDrv0H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "OvcBase.hpp"
#include "OvcCmbx.hpp"
#include "OvcDlg.hpp"
#include "OvcDRpVw.hpp"
#include "OvcRptVw.hpp"
#include "OvcRvCbx.hpp"
#include "OvcRVIdx.hpp"
#include "OvcRvPDg.hpp"
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TOvcController *OvcController1;
    TOvcDataReportView *OvcDataReportView1;
    TPanel *Panel1;
    TSpeedButton *SpeedButton1;
    TOvcViewComboBox *OvcViewComboBox1;
    TOvcController *OrController1;
    TOvcRvPrintDialog *OvcRvPrintDialog1;
    void __fastcall SpeedButton1Click(TObject *Sender);
    void __fastcall OvcDataReportView1Filter(TObject *Sender,
          TOvcDataRvItem *Data, int FilterIndex, bool &Include);
private:	// User declarations
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
