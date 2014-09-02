// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcaepe.pas' rev: 27.00 (Windows)

#ifndef OvcaepeHPP
#define OvcaepeHPP

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
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcae.hpp>	// Pascal unit
#include <ovcpb.hpp>	// Pascal unit
#include <ovcpf.hpp>	// Pascal unit
#include <ovcstr.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcsf.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcaepe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmAeRange;
class PASCALIMPLEMENTATION TOvcfrmAeRange : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TLabel* lblRange;
	Vcl::Stdctrls::TLabel* lblLower;
	Vcl::Stdctrls::TLabel* lblUpper;
	Ovcpf::TOvcPictureField* pfRange;
	Ovcbase::TOvcController* DefaultController;
	Ovcsf::TOvcSimpleField* sfRange;
	Vcl::Stdctrls::TButton* Button1;
	Vcl::Stdctrls::TButton* Button2;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmAeRange(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmAeRange(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmAeRange(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmAeRange(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TLocalAE;
class PASCALIMPLEMENTATION TLocalAE : public Ovcae::TOvcBaseArrayEditor
{
	typedef Ovcae::TOvcBaseArrayEditor inherited;
	
public:
	/* TOvcBaseArrayEditor.Create */ inline __fastcall virtual TLocalAE(System::Classes::TComponent* AOwner) : Ovcae::TOvcBaseArrayEditor(AOwner) { }
	/* TOvcBaseArrayEditor.Destroy */ inline __fastcall virtual ~TLocalAE(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TLocalAE(HWND ParentWindow) : Ovcae::TOvcBaseArrayEditor(ParentWindow) { }
	
};


class DELPHICLASS TLocalEF;
class PASCALIMPLEMENTATION TLocalEF : public Ovcef::TOvcBaseEntryField
{
	typedef Ovcef::TOvcBaseEntryField inherited;
	
public:
	/* TOvcBaseEntryField.Create */ inline __fastcall virtual TLocalEF(System::Classes::TComponent* AOwner) : Ovcef::TOvcBaseEntryField(AOwner) { }
	/* TOvcBaseEntryField.Destroy */ inline __fastcall virtual ~TLocalEF(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TLocalEF(HWND ParentWindow) : Ovcef::TOvcBaseEntryField(ParentWindow) { }
	
};


class DELPHICLASS TAERangeProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TAERangeProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TAERangeProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TAERangeProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcaepe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCAEPE)
using namespace Ovcaepe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcaepeHPP
