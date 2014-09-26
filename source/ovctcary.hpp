// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctcary.pas' rev: 27.00 (Windows)

#ifndef OvctcaryHPP
#define OvctcaryHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctcary
{
//-- type declarations -------------------------------------------------------
#pragma pack(push,1)
struct DECLSPEC_DRECORD TOvcCellAddress
{
public:
	int Row;
	int Col;
};
#pragma pack(pop)


class DELPHICLASS TOvcCellArray;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcCellArray : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	void *FArray;
	int FLimit;
	int FCount;
	bool DoUnusedBit;
	bool __fastcall GetEmpty(void);
	
public:
	__fastcall virtual ~TOvcCellArray(void);
	void __fastcall AddCell(int RowNum, int ColNum);
	void __fastcall AddUnusedBit(void);
	void __fastcall Clear(void);
	bool __fastcall DeleteCell(int RowNum, int ColNum);
	void __fastcall GetCellAddr(int Inx, TOvcCellAddress &CellAddr);
	void __fastcall Merge(TOvcCellArray* CA);
	bool __fastcall MustDoUnusedBit(void);
	__property int Count = {read=FCount, nodefault};
	__property bool Empty = {read=GetEmpty, nodefault};
public:
	/* TObject.Create */ inline __fastcall TOvcCellArray(void) : System::TObject() { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctcary */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCARY)
using namespace Ovctcary;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctcaryHPP
