// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcbtnh0.pas' rev: 27.00 (Windows)

#ifndef Ovcbtnh0HPP
#define Ovcbtnh0HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcbtnhd.hpp>	// Pascal unit
#include <ovccole0.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcbtnh0
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcButtonHeaderEditor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcButtonHeaderEditor : public Designeditors::TComponentEditor
{
	typedef Designeditors::TComponentEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TOvcButtonHeaderEditor(System::Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TOvcButtonHeaderEditor(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcbtnh0 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCBTNH0)
using namespace Ovcbtnh0;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovcbtnh0HPP
