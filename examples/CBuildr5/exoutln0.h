//---------------------------------------------------------------------------
#ifndef ExOutLn0H
#define ExOutLn0H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "OvcBase.hpp"
#include "OvcCmbx.hpp"
#include "OvcDRpVw.hpp"
#include "OvcOutln.hpp"
#include "OvcRptVw.hpp"
#include "OvcRvCbx.hpp"
#include "OvcRVIdx.hpp"
#include "OvcSplit.hpp"
#include "OvcVLB.hpp"
#include <ShellAPI.hpp>
#include <ExtCtrls.hpp>
#include "ovcbase.hpp"
#include "ovccmbx.hpp"
#include "ovcdrpvw.hpp"
#include "ovcoutln.hpp"
#include "ovcrptvw.hpp"
#include "ovcrvcbx.hpp"
#include "ovcrvidx.hpp"
#include "ovcsplit.hpp"
#include "ovcvlb.hpp"
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TOvcSplitter *OvcSplitter1;
    TOvcOutline *OvcOutline1;
    TOvcDataReportView *OvcDataReportView1;
    TPanel *Panel1;
    TOvcViewComboBox *OvcViewComboBox1;
    TOvcController *OvcController1;
    TImageList *ImageList1;
    void __fastcall OvcDataReportView1DblClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall OvcOutline1ActiveChange(TOvcCustomOutline *Sender,
          TOvcOutlineNode *OldNode, TOvcOutlineNode *NewNode);
    void __fastcall OvcOutline1Click(TObject *Sender);
    void __fastcall OvcOutline1DynamicLoad(TOvcCustomOutline *Sender,
          TOvcOutlineNode *Node);
    void __fastcall FormShow(TObject *Sender);
    void __fastcall OvcOutline1NodeDestroy(TOvcCustomOutline *Sender,
          TOvcOutlineNode *Node);
private:	// User declarations
    String __fastcall TypeString(String FileName);
    String __fastcall AttrString(int Attr);
    void __fastcall AddFiles(String* DirPath);
    void __fastcall AddDirectories(TOvcOutlineNode* TreeRoot, String* DirPath);
public:		// User declarations
    __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
