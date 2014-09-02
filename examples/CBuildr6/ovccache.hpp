// Borland C++ Builder
// Copyright (c) 1995, 1998 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'OvcCache.pas' rev: 3.00

#ifndef OvcCacheHPP
#define OvcCacheHPP
#include <Classes.hpp>
#include <SysInit.hpp>
#include <System.hpp>

//-- user supplied -----------------------------------------------------------

namespace Ovccache
{
//-- type declarations -------------------------------------------------------
enum TDiscardMethod { dmMostDistant, dmLeastUsed };

struct TCacheRecord;
typedef TCacheRecord *PCacheRecord;

struct TCacheRecord
{
	int Index;
	Word Size;
	void *Data;
	int Hits;
} ;

typedef void __fastcall (__closure *TOnGetItemEvent)(int Index, void * &P, Word &Size);

typedef void __fastcall (__closure *TOnDoneItemEvent)(int Index, void * P, Word Size);

class DELPHICLASS TOvcCache;
class PASCALIMPLEMENTATION TOvcCache : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
protected:
	int FCacheHits;
	int FCacheMisses;
	TDiscardMethod FDiscardMethod;
	Classes::TList* FList;
	int FMaxCacheItems;
	int FLockedItem;
	TOnGetItemEvent FOnGetItem;
	TOnDoneItemEvent FOnDoneItem;
	void __fastcall DoOnGetItem(int Index, void * &P, Word &Size);
	void __fastcall DoOnDoneItem(int Index, void * &P, Word Size);
	int __fastcall GetCount(void);
	void * __fastcall GetItem(int Index);
	int __fastcall GetMemoryUsage(void);
	void __fastcall SetMaxCacheItems(int Value);
	void __fastcall ResetHits(void);
	
public:
	void __fastcall Clear(void);
	__fastcall virtual TOvcCache(Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCache(void);
	void __fastcall LockCacheItem(int Index);
	void __fastcall PreLoad(int Index, int Number);
	void __fastcall Refresh(void);
	void __fastcall UnlockCacheItem(void);
	void __fastcall Update(int Index);
	__property int CacheHits = {read=FCacheHits, write=FCacheHits, nodefault};
	__property int CacheMisses = {read=FCacheMisses, write=FCacheMisses, nodefault};
	__property int Count = {read=GetCount, nodefault};
	__property void * Items[int Index] = {read=GetItem};
	__property int LockedItem = {read=FLockedItem, nodefault};
	__property int MemoryUsage = {read=GetMemoryUsage, nodefault};
	
__published:
	__property TDiscardMethod DiscardMethod = {read=FDiscardMethod, write=FDiscardMethod, default=0};
	__property int MaxCacheItems = {read=FMaxCacheItems, write=SetMaxCacheItems, default=10};
	__property TOnDoneItemEvent OnDoneItem = {read=FOnDoneItem, write=FOnDoneItem};
	__property TOnGetItemEvent OnGetItem = {read=FOnGetItem, write=FOnGetItem};
};

//-- var, const, procedure ---------------------------------------------------
#define DefDiscardMethod (TDiscardMethod)(0)
#define DefMaxCacheItems (Byte)(10)
#define DefMinCacheItems (Byte)(2)
extern PACKAGE void __fastcall Register(void);

}	/* namespace Ovccache */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Ovccache;
#endif
//-- end unit ----------------------------------------------------------------
#endif	// OvcCache
