// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcfiler.pas' rev: 27.00 (Windows)

#ifndef OvcfilerHPP
#define OvcfilerHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.TypInfo.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcfiler
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcAbstractStore;
class PASCALIMPLEMENTATION TOvcAbstractStore : public Ovcbase::TOvcComponent
{
	typedef Ovcbase::TOvcComponent inherited;
	
protected:
	int RefCount;
	virtual void __fastcall DoOpen(void) = 0 ;
	virtual void __fastcall DoClose(void) = 0 ;
	
public:
	void __fastcall Open(void);
	void __fastcall Close(void);
	virtual System::UnicodeString __fastcall ReadString(const System::UnicodeString Section, const System::UnicodeString Item, const System::UnicodeString DefaultValue) = 0 ;
	virtual void __fastcall WriteString(const System::UnicodeString Section, const System::UnicodeString Item, const System::UnicodeString Value) = 0 ;
	virtual void __fastcall EraseSection(const System::UnicodeString Section);
	bool __fastcall ReadBoolean(const System::UnicodeString Section, const System::UnicodeString Item, bool DefaultValue);
	int __fastcall ReadInteger(const System::UnicodeString Section, const System::UnicodeString Item, int DefaultValue);
	void __fastcall WriteBoolean(const System::UnicodeString Section, const System::UnicodeString Item, bool Value);
	void __fastcall WriteInteger(const System::UnicodeString Section, const System::UnicodeString Item, int Value);
public:
	/* TOvcComponent.Create */ inline __fastcall virtual TOvcAbstractStore(System::Classes::TComponent* AOwner) : Ovcbase::TOvcComponent(AOwner) { }
	/* TOvcComponent.Destroy */ inline __fastcall virtual ~TOvcAbstractStore(void) { }
	
};


struct TExPropInfo;
typedef TExPropInfo *PExPropInfo;

#pragma pack(push,1)
struct DECLSPEC_DRECORD TExPropInfo
{
public:
	System::Typinfo::TPropInfo PI;
	System::TObject* AObject;
};
#pragma pack(pop)


class DELPHICLASS TOvcPropertyList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcPropertyList : public System::TObject
{
	typedef System::TObject inherited;
	
public:
	PExPropInfo operator[](int Index) { return Items[Index]; }
	
protected:
	System::Classes::TList* FList;
	PExPropInfo __fastcall Get(int Index);
	int __fastcall GetCount(void);
	
public:
	__fastcall TOvcPropertyList(System::TObject* AObject, System::Typinfo::TTypeKinds Filter, const System::UnicodeString Prefix);
	__fastcall virtual ~TOvcPropertyList(void);
	bool __fastcall Contains(PExPropInfo P);
	PExPropInfo __fastcall Find(const System::UnicodeString AName);
	void __fastcall Delete(int Index);
	void __fastcall Intersect(TOvcPropertyList* List);
	__property int Count = {read=GetCount, nodefault};
	__property PExPropInfo Items[int Index] = {read=Get/*, default*/};
};

#pragma pack(pop)

class DELPHICLASS TOvcDataFiler;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcDataFiler : public System::TObject
{
	typedef System::TObject inherited;
	
protected:
	System::UnicodeString FPrefix;
	System::UnicodeString FSection;
	TOvcAbstractStore* FStorage;
	System::Classes::TStrings* __fastcall CreatePropertyList(Vcl::Controls::TWinControl* AForm, System::Classes::TStrings* StoredList);
	void __fastcall FreeInfoLists(System::Classes::TStrings* Info);
	System::UnicodeString __fastcall GetCharProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetClassProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetEnumProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetFloatProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetIntegerProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetLStringProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetSetProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetStringProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetUStringProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetWStringProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetStringsProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetVariantProperty(PExPropInfo PropInfo);
	System::UnicodeString __fastcall GetWCharProperty(PExPropInfo PropInfo);
	void __fastcall SetCharProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetClassProperty(PExPropInfo PropInfo);
	void __fastcall SetEnumProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetFloatProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetIntegerProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetLStringProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetSetProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetStringProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetWStringProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetUStringProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetStringsProperty(PExPropInfo PropInfo);
	void __fastcall SetVariantProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	void __fastcall SetWCharProperty(const System::UnicodeString S, PExPropInfo PropInfo);
	virtual TOvcDataFiler* __fastcall CreateDataFiler(void);
	virtual void __fastcall EraseSection(const System::UnicodeString ASection);
	virtual System::UnicodeString __fastcall GetItemName(const System::UnicodeString APropName);
	virtual System::UnicodeString __fastcall ReadString(const System::UnicodeString ASection, const System::UnicodeString Item, const System::UnicodeString Default);
	virtual void __fastcall WriteString(const System::UnicodeString ASection, const System::UnicodeString Item, const System::UnicodeString Value);
	
public:
	void __fastcall LoadObjectsProps(Vcl::Controls::TWinControl* AForm, System::Classes::TStrings* StoredList);
	void __fastcall LoadProperty(PExPropInfo PropInfo);
	void __fastcall LoadAllProperties(System::TObject* AObject);
	void __fastcall StoreObjectsProps(Vcl::Controls::TWinControl* AForm, System::Classes::TStrings* StoredList);
	void __fastcall StoreProperty(PExPropInfo PropInfo);
	void __fastcall StoreAllProperties(System::TObject* AObject);
	__property System::UnicodeString Prefix = {read=FPrefix, write=FPrefix};
	__property System::UnicodeString Section = {read=FSection, write=FSection};
	__property TOvcAbstractStore* Storage = {read=FStorage, write=FStorage};
public:
	/* TObject.Create */ inline __fastcall TOvcDataFiler(void) : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TOvcDataFiler(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE System::UnicodeString __fastcall CreateStoredItem(const System::UnicodeString CompName, const System::UnicodeString PropName);
extern DELPHI_PACKAGE System::Typinfo::PTypeInfo __fastcall GetPropType(PExPropInfo PropInfo);
extern DELPHI_PACKAGE bool __fastcall ParseStoredItem(const System::UnicodeString Item, System::UnicodeString &CompName, System::UnicodeString &PropName);
extern DELPHI_PACKAGE void __fastcall UpdateStoredList(Vcl::Controls::TWinControl* AForm, System::Classes::TStrings* AStoredList, bool FromForm);
}	/* namespace Ovcfiler */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCFILER)
using namespace Ovcfiler;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcfilerHPP
