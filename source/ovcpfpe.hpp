// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcpfpe.pas' rev: 27.00 (Windows)

#ifndef OvcpfpeHPP
#define OvcpfpeHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovcstr.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcpfpe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmPictureMask;
class PASCALIMPLEMENTATION TOvcfrmPictureMask : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Buttons::TBitBtn* btnOK;
	Vcl::Buttons::TBitBtn* btnCancel;
	Vcl::Stdctrls::TLabel* lblMask;
	Vcl::Stdctrls::TLabel* lblMaskEdit;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Stdctrls::TLabel* lblMaskDescription;
	Vcl::Stdctrls::TLabel* lblMaskList;
	Vcl::Stdctrls::TListBox* lbMask;
	Vcl::Stdctrls::TEdit* edMask;
	void __fastcall lbMaskClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	
protected:
	System::Classes::TStringList* Ex;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmPictureMask(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmPictureMask(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmPictureMask(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmPictureMask(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TPictureMaskProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TPictureMaskProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual bool __fastcall AllEqual(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TPictureMaskProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TPictureMaskProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcpfpe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCPFPE)
using namespace Ovcpfpe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcpfpeHPP
