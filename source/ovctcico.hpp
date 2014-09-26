// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctcico.pas' rev: 27.00 (Windows)

#ifndef OvctcicoHPP
#define OvctcicoHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctcico
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcTCCustomIcon;
class PASCALIMPLEMENTATION TOvcTCCustomIcon : public Ovctcell::TOvcBaseTableCell
{
	typedef Ovctcell::TOvcBaseTableCell inherited;
	
protected:
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	
public:
	virtual void __fastcall ResolveAttributes(int RowNum, int ColNum, Ovctcmmn::TOvcCellAttributes &CellAttr);
public:
	/* TOvcBaseTableCell.Create */ inline __fastcall virtual TOvcTCCustomIcon(System::Classes::TComponent* AOwner) : Ovctcell::TOvcBaseTableCell(AOwner) { }
	/* TOvcBaseTableCell.Destroy */ inline __fastcall virtual ~TOvcTCCustomIcon(void) { }
	
};


class DELPHICLASS TOvcTCIcon;
class PASCALIMPLEMENTATION TOvcTCIcon : public TOvcTCCustomIcon
{
	typedef TOvcTCCustomIcon inherited;
	
__published:
	__property AcceptActivationClick = {default=0};
	__property Access = {default=0};
	__property Adjust = {default=0};
	__property Color;
	__property Margin = {default=4};
	__property Table;
	__property TableColor = {default=1};
	__property OnOwnerDraw;
public:
	/* TOvcBaseTableCell.Create */ inline __fastcall virtual TOvcTCIcon(System::Classes::TComponent* AOwner) : TOvcTCCustomIcon(AOwner) { }
	/* TOvcBaseTableCell.Destroy */ inline __fastcall virtual ~TOvcTCIcon(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctcico */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCICO)
using namespace Ovctcico;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctcicoHPP
