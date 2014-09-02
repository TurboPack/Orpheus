// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcfxfnt.pas' rev: 27.00 (Windows)

#ifndef OvcfxfntHPP
#define OvcfxfntHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcfxfnt
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcFixedFont;
class PASCALIMPLEMENTATION TOvcFixedFont : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
protected:
	Vcl::Graphics::TFont* FFont;
	System::Classes::TNotifyEvent FOnChange;
	System::Uitypes::TColor __fastcall GetColor(void);
	System::UnicodeString __fastcall GetName(void);
	int __fastcall GetSize(void);
	System::Uitypes::TFontStyles __fastcall GetStyle(void);
	void __fastcall SetColor(const System::Uitypes::TColor C);
	void __fastcall SetName(const System::UnicodeString S);
	void __fastcall SetSize(const int S);
	void __fastcall SetStyle(const System::Uitypes::TFontStyles FS);
	void __fastcall DoOnChange(void);
	
public:
	__fastcall TOvcFixedFont(void);
	__fastcall virtual ~TOvcFixedFont(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* F);
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property Vcl::Graphics::TFont* Font = {read=FFont};
	
__published:
	__property System::Uitypes::TColor Color = {read=GetColor, write=SetColor, nodefault};
	__property System::UnicodeString Name = {read=GetName, write=SetName};
	__property int Size = {read=GetSize, write=SetSize, nodefault};
	__property System::Uitypes::TFontStyles Style = {read=GetStyle, write=SetStyle, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE System::Classes::TStringList* FixedFontNames;
extern DELPHI_PACKAGE void __fastcall RefreshFixedFontNames(void);
}	/* namespace Ovcfxfnt */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCFXFNT)
using namespace Ovcfxfnt;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcfxfntHPP
