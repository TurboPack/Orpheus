//---------------------------------------------------------------------------
#ifndef ExDbAEuH
#define ExDbAEuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\DBCtrls.hpp>
#include <vcl\ExtCtrls.hpp>
#include "OvcDbAE.hpp"
#include "OvcBase.hpp"
#include <vcl\Buttons.hpp>
#include "OvcDbDLb.hpp"
#include "OvcRLbl.hpp"
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TDBNavigator *DBNavigator1;
  TOvcController *OvcController1;
  TOvcDbSimpleArrayEditor *OvcDbSimpleArrayEditor1;
  TOvcDbPictureArrayEditor *OvcDbPictureArrayEditor1;
  TOvcDbNumericArrayEditor *OvcDbNumericArrayEditor1;
  TBitBtn *BitBtn1;
  TPanel *Panel1;
  TOvcDbDisplayLabel *OvcDbDisplayLabel1;
  TOvcDbDisplayLabel *OvcDbDisplayLabel2;
  TOvcDbDisplayLabel *OvcDbDisplayLabel3;
  TDataSource *DataSource1;
  TTable *Table1;
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
