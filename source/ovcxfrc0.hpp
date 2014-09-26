// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcxfrc0.pas' rev: 27.00 (Windows)

#ifndef Ovcxfrc0HPP
#define Ovcxfrc0HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcxfrc0
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcTransferEditor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcTransferEditor : public Designeditors::TComponentEditor
{
	typedef Designeditors::TComponentEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TOvcTransferEditor(System::Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TComponentEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TOvcTransferEditor(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcxfrc0 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCXFRC0)
using namespace Ovcxfrc0;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovcxfrc0HPP
