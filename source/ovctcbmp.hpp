// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctcbmp.pas' rev: 27.00 (Windows)

#ifndef OvctcbmpHPP
#define OvctcbmpHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctcbmp
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcTCBaseBitMap;
class PASCALIMPLEMENTATION TOvcTCBaseBitMap : public Ovctcell::TOvcBaseTableCell
{
	typedef Ovctcell::TOvcBaseTableCell inherited;
	
protected:
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	
public:
	virtual NativeUInt __fastcall EditHandle(void);
	virtual void __fastcall EditHide(void);
	virtual void __fastcall EditMove(const System::Types::TRect &CellRect);
	virtual void __fastcall SaveEditedData(void * Data);
	virtual void __fastcall StartEditing(int RowNum, int ColNum, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, Ovctcmmn::TOvcTblEditorStyle CellStyle, void * Data);
	virtual void __fastcall StopEditing(bool SaveValue, void * Data);
public:
	/* TOvcBaseTableCell.Create */ inline __fastcall virtual TOvcTCBaseBitMap(System::Classes::TComponent* AOwner) : Ovctcell::TOvcBaseTableCell(AOwner) { }
	/* TOvcBaseTableCell.Destroy */ inline __fastcall virtual ~TOvcTCBaseBitMap(void) { }
	
};


class DELPHICLASS TOvcTCCustomBitMap;
class PASCALIMPLEMENTATION TOvcTCCustomBitMap : public TOvcTCBaseBitMap
{
	typedef TOvcTCBaseBitMap inherited;
	
protected:
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	
public:
	virtual void __fastcall ResolveAttributes(int RowNum, int ColNum, Ovctcmmn::TOvcCellAttributes &CellAttr);
public:
	/* TOvcBaseTableCell.Create */ inline __fastcall virtual TOvcTCCustomBitMap(System::Classes::TComponent* AOwner) : TOvcTCBaseBitMap(AOwner) { }
	/* TOvcBaseTableCell.Destroy */ inline __fastcall virtual ~TOvcTCCustomBitMap(void) { }
	
};


class DELPHICLASS TOvcTCBitMap;
class PASCALIMPLEMENTATION TOvcTCBitMap : public TOvcTCCustomBitMap
{
	typedef TOvcTCCustomBitMap inherited;
	
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
	/* TOvcBaseTableCell.Create */ inline __fastcall virtual TOvcTCBitMap(System::Classes::TComponent* AOwner) : TOvcTCCustomBitMap(AOwner) { }
	/* TOvcBaseTableCell.Destroy */ inline __fastcall virtual ~TOvcTCBitMap(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctcbmp */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCBMP)
using namespace Ovctcbmp;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctcbmpHPP
