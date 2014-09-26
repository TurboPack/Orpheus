//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("TxtView1.cpp", ViewForm);
USERES("TextView.res");
USEFORM("TxtView2.cpp", ViewAbout);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TViewForm), &ViewForm);
     Application->CreateForm(__classid(TViewAbout), &ViewAbout);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
