//---------------------------------------------------------------------------
#ifndef ExDbRv0H
#define ExDbRv0H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "OvcBase.hpp"
#include "OvcCmbx.hpp"
#include "OvcDbRpV.hpp"
#include "OvcRptVw.hpp"
#include "OvcRvCbx.hpp"
#include "OvcRVIdx.hpp"
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TOvcController *OvcController1;
    TOvcDbReportView *OvcDbReportView1;
    TPanel *Panel1;
    TOvcViewComboBox *OvcViewComboBox1;
    TDataSource *DataSource1;
    TTable *Table1;
    TOvcController *OrController1;
private:	// User declarations
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
