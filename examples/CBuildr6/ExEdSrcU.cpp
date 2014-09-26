//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExEdSrcU.h"
//---------------------------------------------------------------------------
#pragma link "OvcEdit"
#pragma link "OvcEditU"
#pragma link "OvcBase"
#pragma link "OvcSF"
#pragma link "OvcEF"
#pragma resource "*.dfm"
TfrmSearch *frmSearch;
//---------------------------------------------------------------------------
__fastcall TfrmSearch::TfrmSearch(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmSearch::FormCreate(TObject *Sender)
{
  ED1->FileName = "C:\AUTOEXEC.BAT";
  ED1->IsOpen = true;
}
//---------------------------------------------------------------------------
void __fastcall TfrmSearch::btnSearchClick(TObject *Sender)
{
  String S = SF1->AsString;

  /**************************************************
   the second parameter can be any combination of the
   the following set elements or none (an empty set)
   ****************************************************
   soFind       {perform a find ([] implies soFind)
   soBackward   {search backwards
   soMatchCase  {don't ignore case when searching
   soGlobal     {search globally
   soWholeWord  {match on whole word only (editor only)
   soSelText    {search in selected text  (editor only)
   ****************************************************/
  TSearchOptionSet s;
  if (!ED1->Search(S, s << soFind))
    MessageBeep(0);
}
//---------------------------------------------------------------------------
void __fastcall TfrmSearch::BitBtn1Click(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

