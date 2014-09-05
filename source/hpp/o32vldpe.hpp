// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'o32vldpe.pas' rev: 27.00 (Windows)

#ifndef O32vldpeHPP
#define O32vldpeHPP

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
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <o32vldtr.hpp>	// Pascal unit
#include <o32vlop1.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace O32vldpe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TTO32FrmValidatorExpression;
class PASCALIMPLEMENTATION TTO32FrmValidatorExpression : public Vcl::Forms::TForm
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
	/* TCustomForm.Create */ inline __fastcall virtual TTO32FrmValidatorExpression(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TTO32FrmValidatorExpression(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TTO32FrmValidatorExpression(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TTO32FrmValidatorExpression(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TSampleMaskProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TSampleMaskProperty : public Designeditors::TStringProperty
{
	typedef Designeditors::TStringProperty inherited;
	
private:
	System::UnicodeString ValType;
	
public:
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual bool __fastcall AllEqual(void);
	virtual void __fastcall Edit(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TSampleMaskProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TStringProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TSampleMaskProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace O32vldpe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_O32VLDPE)
using namespace O32vldpe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// O32vldpeHPP
