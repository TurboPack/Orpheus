// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovclbl1.pas' rev: 27.00 (Windows)

#ifndef Ovclbl1HPP
#define Ovclbl1HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovclbl1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmSaveScheme;
class PASCALIMPLEMENTATION TfrmSaveScheme : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TEdit* SchemeNameEd;
	Vcl::Stdctrls::TButton* OkBtn;
	Vcl::Stdctrls::TButton* CancelBtn;
	void __fastcall FormCreate(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmSaveScheme(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmSaveScheme(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmSaveScheme(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmSaveScheme(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovclbl1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCLBL1)
using namespace Ovclbl1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovclbl1HPP
