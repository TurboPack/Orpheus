//---------------------------------------------------------------------------
#ifndef ExDbEfuH
#define ExDbEfuH
//---------------------------------------------------------------------------
#include <vcl\Classes.hpp>
#include <vcl\Controls.hpp>
#include <vcl\StdCtrls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Buttons.hpp>
#include <vcl\DBCtrls.hpp>
#include <vcl\ExtCtrls.hpp>
#include <vcl\DB.hpp>
#include <vcl\DBTables.hpp>
#include <Db.hpp>
#include "OvcDbDLb.hpp"
#include "OvcRLbl.hpp"
#include "OvcDbSF.hpp"
#include "OvcSF.hpp"
#include "OvcEF.hpp"
#include "OvcBase.hpp"
#include "OvcDbPF.hpp"
#include "OvcPF.hpp"
#include "OvcPB.hpp"
#include "OvcDbNF.hpp"
#include "OvcNF.hpp"
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
  TBitBtn *BitBtn1;
  TDBNavigator *DBNavigator1;
  TPanel *Panel1;
  TOvcDbDisplayLabel *OvcDbDisplayLabel1;
  TOvcDbDisplayLabel *OvcDbDisplayLabel2;
  TOvcDbDisplayLabel *OvcDbDisplayLabel3;
  TOvcDbDisplayLabel *OvcDbDisplayLabel4;
  TOvcDbDisplayLabel *OvcDbDisplayLabel5;
  TOvcDbDisplayLabel *OvcDbDisplayLabel6;
  TOvcDbSimpleField *OvcDbSimpleField1;
  TOvcDbPictureField *OvcDbPictureField1;
  TOvcDbNumericField *OvcDbNumericField1;
  TOvcDbPictureField *OvcDbPictureField2;
  TOvcDbSimpleField *OvcDbSimpleField2;
  TOvcDbPictureField *OvcDbPictureField3;
  TDataSource *DataSource1;
  TTable *Table1;
  TOvcController *OvcController1;
    void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
