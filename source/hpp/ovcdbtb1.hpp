// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbtb1.pas' rev: 27.00 (Windows)

#ifndef Ovcdbtb1HPP
#define Ovcdbtb1HPP

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
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcsf.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcintl.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbtb1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmProperties;
class PASCALIMPLEMENTATION TOvcfrmProperties : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Ovcsf::TOvcSimpleField* edPictureMask;
	Ovcbase::TOvcController* OvcController1;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TLabel* Label2;
	Ovcsf::TOvcSimpleField* edDecimalPlaces;
	Vcl::Extctrls::TRadioGroup* rgDateOrTime;
	Vcl::Stdctrls::TButton* Button1;
	Vcl::Stdctrls::TButton* Button2;
	void __fastcall rgDateOrTimeClick(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmProperties(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmProperties(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmProperties(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmProperties(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbtb1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBTB1)
using namespace Ovcdbtb1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovcdbtb1HPP
