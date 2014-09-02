//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("Adrbook1.cpp", AddrForm);
USERES("Addrbook.res");
USEFORM("Adrbook2.cpp", AdrAbout);
USEFORM("CalUnit.cpp", CalForm);
USEOBJ("..\..\..\ORPHEUS\ExBCB\ovcvalid.obj");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TAddrForm), &AddrForm);
        Application->CreateForm(__classid(TAdrAbout), &AdrAbout);
        Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
