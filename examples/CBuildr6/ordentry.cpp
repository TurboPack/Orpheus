//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("OrdNtry1.cpp", OrdEntryForm);
USERES("OrdEntry.res");
USEFORM("OrdNtry2.cpp", OrdAbout);
USEOBJ("\ORPHEUS\OvcValid.OBJ");
USEFORM("CalUnit.cpp", CalForm);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TOrdEntryForm), &OrdEntryForm);
     Application->CreateForm(__classid(TOrdAbout), &OrdAbout);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
