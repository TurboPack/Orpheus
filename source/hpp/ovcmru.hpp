// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcmru.pas' rev: 27.00 (Windows)

#ifndef OvcmruHPP
#define OvcmruHPP

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
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcfiler.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcmru
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcMRUOption : unsigned char { moAddAccelerators, moStripPath, moAddSeparator };

enum DECLSPEC_DENUM TOvcMRUAddPosition : unsigned char { apAnchor, apTop, apBottom };

enum DECLSPEC_DENUM TOvcMRUStyle : unsigned char { msNormal, msSplit };

enum DECLSPEC_DENUM TOvcMRUClickAction : unsigned char { caMoveToTop, caRemove, caNoAction };

typedef System::Set<TOvcMRUOption, TOvcMRUOption::moAddAccelerators, TOvcMRUOption::moAddSeparator> TOvcMRUOptions;

typedef void __fastcall (__closure *TOvcMRUClickEvent)(System::TObject* Sender, const System::UnicodeString ItemText, TOvcMRUClickAction &Action);

typedef System::Set<TOvcMRUAddPosition, TOvcMRUAddPosition::apAnchor, TOvcMRUAddPosition::apBottom> TOvcMRUAddPositions;

class DELPHICLASS TOvcMenuMRU;
class PASCALIMPLEMENTATION TOvcMenuMRU : public Ovcbase::TOvcComponent
{
	typedef Ovcbase::TOvcComponent inherited;
	
protected:
	TOvcMRUAddPosition FAddPosition;
	Vcl::Menus::TMenuItem* FAnchorItem;
	int FCount;
	bool FEnabled;
	int FGroupIndex;
	System::UnicodeString FHint;
	System::Classes::TStrings* FItems;
	int FMaxItems;
	int FMaxMenuWidth;
	Vcl::Menus::TMenuItem* FMenuItem;
	TOvcMRUOptions FOptions;
	TOvcMRUStyle FStyle;
	Ovcfiler::TOvcAbstractStore* FStore;
	bool FVisible;
	TOvcMRUClickEvent FOnClick;
	TOvcMRUAddPositions mruSplits;
	bool mruDisableUpdates;
	System::UnicodeString mruStoreKey;
	int __fastcall GetCount(void);
	void __fastcall SetAnchorItem(Vcl::Menus::TMenuItem* const Value);
	void __fastcall SetEnabled(const bool Value);
	void __fastcall SetGroupIndex(const int Value);
	void __fastcall SetHint(const System::UnicodeString Value);
	void __fastcall SetItems(System::Classes::TStrings* const Value);
	void __fastcall SetMaxItems(const int Value);
	void __fastcall SetMaxMenuWidth(const int Value);
	void __fastcall SetMenuItem(Vcl::Menus::TMenuItem* const Value);
	void __fastcall SetOptions(const TOvcMRUOptions Value);
	void __fastcall SetStyle(const TOvcMRUStyle Value);
	void __fastcall SetVisible(const bool Value);
	void __fastcall DoClick(const System::UnicodeString Value, TOvcMRUClickAction &Action);
	void __fastcall GenerateMenuItems(void);
	void __fastcall ListChange(System::TObject* Sender);
	void __fastcall MenuClick(System::TObject* Sender);
	System::UnicodeString __fastcall FixupDisplayString(System::UnicodeString S, int N);
	void __fastcall LoadList(void);
	void __fastcall StoreList(void);
	
public:
	__fastcall virtual TOvcMenuMRU(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcMenuMRU(void);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(System::Classes::TComponent* Component, System::Classes::TOperation Operation);
	void __fastcall Add(const System::UnicodeString Value);
	void __fastcall AddSplit(const System::UnicodeString Value, TOvcMRUAddPosition Position);
	void __fastcall Clear(void);
	HIDESBASE void __fastcall Remove(const System::UnicodeString Value);
	__property int Count = {read=GetCount, nodefault};
	
__published:
	__property TOvcMRUAddPosition AddPosition = {read=FAddPosition, write=FAddPosition, default=0};
	__property Vcl::Menus::TMenuItem* AnchorItem = {read=FAnchorItem, write=SetAnchorItem};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=1};
	__property int GroupIndex = {read=FGroupIndex, write=SetGroupIndex, default=0};
	__property System::UnicodeString Hint = {read=FHint, write=SetHint};
	__property System::Classes::TStrings* Items = {read=FItems, write=SetItems};
	__property int MaxItems = {read=FMaxItems, write=SetMaxItems, default=4};
	__property int MaxMenuWidth = {read=FMaxMenuWidth, write=SetMaxMenuWidth, default=0};
	__property Vcl::Menus::TMenuItem* MenuItem = {read=FMenuItem, write=SetMenuItem};
	__property TOvcMRUOptions Options = {read=FOptions, write=SetOptions, default=5};
	__property Ovcfiler::TOvcAbstractStore* Store = {read=FStore, write=FStore};
	__property TOvcMRUStyle Style = {read=FStyle, write=SetStyle, default=0};
	__property bool Visible = {read=FVisible, write=SetVisible, default=1};
	__property TOvcMRUClickEvent OnClick = {read=FOnClick, write=FOnClick};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcmru */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCMRU)
using namespace Ovcmru;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcmruHPP
