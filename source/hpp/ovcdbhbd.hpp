// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbhbd.pas' rev: 27.00 (Windows)

#ifndef OvcdbhbdHPP
#define OvcdbhbdHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <Data.DB.hpp>	// Pascal unit
#include <Bde.DBTables.hpp>	// Pascal unit
#include <ovcdbhll.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbhbd
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcDbBDEHelper;
class PASCALIMPLEMENTATION TOvcDbBDEHelper : public Ovcdbhll::TOvcDbEngineHelperBase
{
	typedef Ovcdbhll::TOvcDbEngineHelperBase inherited;
	
public:
	virtual void __fastcall GetAliasNames(System::Classes::TStrings* aList);
	virtual void __fastcall GetAliasPath(const System::UnicodeString aAlias, System::UnicodeString &aPath);
	virtual void __fastcall GetAliasDriverName(const System::UnicodeString aAlias, System::UnicodeString &aDriver);
	virtual void __fastcall GetTableNames(const System::UnicodeString aAlias, System::Classes::TStrings* aList);
	virtual void __fastcall FindNearestKey(Data::Db::TDataSet* aDataSet, System::TVarRec const *aKeyValues, const int aKeyValues_High);
	virtual Data::Db::TIndexDefs* __fastcall GetIndexDefs(Data::Db::TDataSet* aDataSet);
	virtual Data::Db::TField* __fastcall GetIndexField(Data::Db::TDataSet* aDataSet, int aFieldIndex);
	virtual int __fastcall GetIndexFieldCount(Data::Db::TDataSet* aDataSet);
	virtual void __fastcall GetIndexFieldNames(Data::Db::TDataSet* aDataSet, System::UnicodeString &aIndexFieldNames);
	virtual void __fastcall GetIndexName(Data::Db::TDataSet* aDataSet, System::UnicodeString &aIndexName);
	virtual bool __fastcall IsChildDataSet(Data::Db::TDataSet* aDataSet);
	virtual void __fastcall SetIndexFieldNames(Data::Db::TDataSet* aDataSet, const System::UnicodeString aIndexFieldNames);
	virtual void __fastcall SetIndexName(Data::Db::TDataSet* aDataSet, const System::UnicodeString aIndexName);
public:
	/* TComponent.Create */ inline __fastcall virtual TOvcDbBDEHelper(System::Classes::TComponent* AOwner) : Ovcdbhll::TOvcDbEngineHelperBase(AOwner) { }
	/* TComponent.Destroy */ inline __fastcall virtual ~TOvcDbBDEHelper(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbhbd */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBHBD)
using namespace Ovcdbhbd;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbhbdHPP
