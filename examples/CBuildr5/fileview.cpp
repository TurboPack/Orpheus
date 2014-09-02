//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#pragma hdrstop
//---------------------------------------------------------------------------
USEFORM("FilView1.cpp", ViewForm);
USERES("FileView.res");
USEFORM("FilView2.cpp", FileAbout);
USEFORM("FilView3.cpp", FindDlg);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
  try
  {
     Application->Initialize();
     Application->CreateForm(__classid(TViewForm), &ViewForm);
     Application->CreateForm(__classid(TFileAbout), &FileAbout);
     Application->CreateForm(__classid(TFindDlg), &FindDlg);
     Application->Run();
  }
  catch (Exception &exception)
  {
     Application->ShowException(&exception);
  }
  return 0;
}
//---------------------------------------------------------------------------
