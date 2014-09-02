// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcThemes.pas' rev: 27.00 (Windows)

#ifndef OvcthemesHPP
#define OvcthemesHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Vcl.Themes.hpp>	// Pascal unit
#include <Winapi.UxTheme.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcthemes
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TovcThemes;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TovcThemes : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	__classmethod void __fastcall DrawSelection(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &ARect);
public:
	/* TObject.Create */ inline __fastcall TovcThemes(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TovcThemes(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcthemes */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTHEMES)
using namespace Ovcthemes;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcthemesHPP
