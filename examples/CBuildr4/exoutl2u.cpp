//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop

#include "ExOutl2u.h"
//---------------------------------------------------------------------------
#pragma link "OvcOutln"
#pragma link "OvcVLB"
#pragma link "OvcBase"
#pragma resource "*.dfm"
#pragma resource "exoutl2g.res"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1NodeClick(TOvcCustomOutline *Sender,
	TOvcOutlineNode *Node)
{
  switch ((int)(Node->Data))  {
    case 0 : OvcOutline1->BorderStyle = bsNone; break;
    case 1 : OvcOutline1->BorderStyle = bsSingle; break;
    case 2 : OvcOutline1->Ctl3D = Node->Checked; break;
    case 3 : OvcOutline1->ShowButtons = Node->Checked; break;
    case 4 : OvcOutline1->ShowLines = Node->Checked; break;
    case 5 : OvcOutline1->ShowImages = Node->Checked; break;
    case 6 :
      OwnerDrawChecks = !OwnerDrawChecks;
      OvcOutline1->Invalidate();
      break;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormShow(TObject *Sender)
{
  TOvcOutlineNode* RootNode = OvcOutline1->Nodes->Add("OUTLINE PROPERTIES");
  RootNode->ImageIndex = 0;

  TOvcOutlineNode* OptionNode = OvcOutline1->Nodes->AddChild(RootNode, "Border style");
  OptionNode->ImageIndex = 1;

  OvcOutline1->Nodes->AddButtonChildObject(OptionNode, "None", (void*)0, osRadio, false);
  OvcOutline1->Nodes->AddButtonChildObject(OptionNode, "Single", (void*)1, osRadio, true);
  OvcOutline1->Nodes->AddButtonChildObject(RootNode, "Ctl3D", (void*)2, osCheck, true);
  OvcOutline1->Nodes->AddButtonChildObject(RootNode, "Show Buttons", (void*)3, osCheck, true);
  OvcOutline1->Nodes->AddButtonChildObject(RootNode, "Show Lines", (void*)4, osCheck, true);
  OvcOutline1->Nodes->AddButtonChildObject(RootNode, "Show Images", (void*)5, osCheck, true);
  OvcOutline1->Nodes->AddButtonChildObject(RootNode, "Owner-draw checks", (void*)6, osCheck, false);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  ImageList1->ResourceLoad(rtBitmap, "GLYPHS", clWhite);
  ImageList2->ResourceLoad(rtBitmap, "CHECKS", clWhite);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::OvcOutline1DrawCheck(TOvcCustomOutline *Sender,
	TCanvas *Canvas, TOvcOutlineNode *Node, TRect &Rect, TOvcOlNodeStyle Style,
	bool Checked, bool &DefaultDrawing)
{
  if (OwnerDrawChecks)  {
    DefaultDrawing = false;
    switch (Style)  {
      case osRadio :
        if (Checked)
          ImageList2->Draw(Canvas, Rect.Left, 0, 0);
        else
          ImageList2->Draw(Canvas, Rect.Left, 0, 1);
        break;
      case osCheck :
        if (Checked)
          ImageList2->Draw(Canvas, Rect.Left, 0, 2);
        else
          ImageList2->Draw(Canvas, Rect.Left, 0, 3);
        break;
    }
  }
}
//--------------------------------------------------------------------------- 
