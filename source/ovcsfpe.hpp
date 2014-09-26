// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'OvcSfPe.pas' rev: 27.00 (Windows)

#ifndef OvcsfpeHPP
#define OvcsfpeHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcsfpe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmSimpleMask;
class PASCALIMPLEMENTATION TOvcfrmSimpleMask : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Buttons::TBitBtn* btnOk;
	Vcl::Buttons::TBitBtn* btnCancel;
	Vcl::Stdctrls::TComboBox* cbxMaskCharacter;
	Vcl::Stdctrls::TLabel* lblPictureChars;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall cbxMaskCharacterChange(System::TObject* Sender);
	
protected:
	System::WideChar Mask;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmSimpleMask(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmSimpleMask(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmSimpleMask(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmSimpleMask(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TSimpleMaskProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TSimpleMaskProperty : public Designeditors::TCharProperty
{
	typedef Designeditors::TCharProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual bool __fastcall AllEqual(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TSimpleMaskProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TCharProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TSimpleMaskProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcsfpe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCSFPE)
using namespace Ovcsfpe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcsfpeHPP
