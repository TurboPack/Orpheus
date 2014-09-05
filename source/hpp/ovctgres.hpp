// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctgres.pas' rev: 27.00 (Windows)

#ifndef OvctgresHPP
#define OvctgresHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctgres
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcCellGlyphs;
class PASCALIMPLEMENTATION TOvcCellGlyphs : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
protected:
	void *FResource;
	int FActiveGlyphCount;
	int FGlyphCount;
	System::Classes::TNotifyEvent FOnCfgChanged;
	Vcl::Graphics::TBitmap* __fastcall GetBitMap(void);
	bool __fastcall GetIsDefault(void);
	void __fastcall SetActiveGlyphCount(int G);
	void __fastcall SetBitMap(Vcl::Graphics::TBitmap* BM);
	void __fastcall SetGlyphCount(int G);
	void __fastcall SetIsDefault(bool D);
	void __fastcall CalcGlyphCount(void);
	bool __fastcall IsNotDefault(void);
	void __fastcall DoCfgChanged(void);
	
public:
	__property System::Classes::TNotifyEvent OnCfgChanged = {read=FOnCfgChanged, write=FOnCfgChanged};
	__fastcall TOvcCellGlyphs(void);
	__fastcall virtual ~TOvcCellGlyphs(void);
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property bool IsDefault = {read=GetIsDefault, write=SetIsDefault, stored=true, nodefault};
	__property Vcl::Graphics::TBitmap* BitMap = {read=GetBitMap, write=SetBitMap, stored=IsNotDefault};
	__property int GlyphCount = {read=FGlyphCount, write=SetGlyphCount, nodefault};
	__property int ActiveGlyphCount = {read=FActiveGlyphCount, write=SetActiveGlyphCount, nodefault};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctgres */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTGRES)
using namespace Ovctgres;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctgresHPP
