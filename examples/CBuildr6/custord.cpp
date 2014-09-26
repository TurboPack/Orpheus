//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("CustOrd1.cpp", frmCustomers);
USERES("CustOrd.res");
USEFORM("CustOrd2.cpp", frmOrders);
USEFORM("CustOrd3.cpp", frmAbout);
USEUNIT("ovccache.pas");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TfrmCustomers), &frmCustomers);
        Application->CreateForm(__classid(TfrmOrders), &frmOrders);
        Application->CreateForm(__classid(TfrmAbout), &frmAbout);
        Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
