//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("Mdieditm.cpp", MainForm);
USERES("MDIEdit.res");
USEFORM("Mdiedita.cpp", MdiAbout);
USEFORM("Mdieditc.cpp", MDIChild);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TMainForm), &MainForm);
     Application->CreateForm(__classid(TMdiAbout), &MdiAbout);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
