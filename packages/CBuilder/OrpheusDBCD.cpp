//---------------------------------------------------------------------------

#include <basepch.h>
#pragma hdrstop
USEFORMNS("..\..\source\ovcdbae2.pas", Ovcdbae2, OvcfrmDbAePictureMask);
USEFORMNS("..\..\source\ovcdbae3.pas", Ovcdbae3, OvcfrmDbAeNumericMask);
USEFORMNS("..\..\source\ovcdbae1.pas", Ovcdbae1, OvcfrmDbAeSimpleMask);
USEFORMNS("..\..\source\ovcdbadg.pas", Ovcdbadg, OvcfrmAliasDlg);
USEFORMNS("..\..\source\ovcdbae0.pas", Ovcdbae0, OvcfrmDbAeRange);
USEFORMNS("..\..\source\ovcdbtb1.pas", Ovcdbtb1, OvcfrmProperties);
USEFORMNS("..\..\source\ovcdbtb0.pas", Ovcdbtb0, OvcfrmDbColEditor);
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------


#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
	return 1;
}
//---------------------------------------------------------------------------
