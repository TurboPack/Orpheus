// CodeGear C++Builder
// Copyright (c) 1995, 2017 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctimer.pas' rev: 33.00 (Windows)

#ifndef OvctimerHPP
#define OvctimerHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <Winapi.Windows.hpp>
#include <System.Classes.hpp>
#include <Winapi.Messages.hpp>
#include <System.SysUtils.hpp>
#include <Vcl.Forms.hpp>
#include <ovcexcpt.hpp>
#include <ovcver.hpp>

//-- user supplied -----------------------------------------------------------

namespace Ovctimer
{
//-- forward type declarations -----------------------------------------------
struct TEventRec;
class DELPHICLASS TOvcTimerPool;
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TTriggerEvent)(System::TObject* Sender, int Handle, unsigned Interval, int ElapsedTime);

typedef TEventRec *PEventRec;

#pragma pack(push,1)
struct DECLSPEC_DRECORD TEventRec
{
public:
	int erHandle;
	int erInitTime;
	int erElapsed;
	unsigned erInterval;
	int erLastTrigger;
	TTriggerEvent erOnTrigger;
	bool erEnabled;
	bool erRecurring;
};
#pragma pack(pop)


class PASCALIMPLEMENTATION TOvcTimerPool : public System::Classes::TComponent
{
	typedef System::Classes::TComponent inherited;
	
protected:
	TTriggerEvent FOnAllTriggers;
	System::Classes::TList* tpList;
	HWND tpHandle;
	unsigned tpInterval;
	int tpEnabledCount;
	System::UnicodeString __fastcall GetAbout();
	int __fastcall GetElapsedTriggerTime(int Handle);
	int __fastcall GetElapsedTriggerTimeSec(int Handle);
	TTriggerEvent __fastcall GetOnTrigger(int Handle);
	int __fastcall GetTriggerCount();
	bool __fastcall GetTriggerEnabled(int Handle);
	unsigned __fastcall GetTriggerInterval(int Handle);
	void __fastcall SetAbout(const System::UnicodeString Value);
	void __fastcall SetOnTrigger(int Handle, TTriggerEvent Value);
	void __fastcall SetTriggerEnabled(int Handle, bool Value);
	void __fastcall SetTriggerInterval(int Handle, unsigned Value);
	void __fastcall tpCalcNewInterval();
	int __fastcall tpCountEnabledTriggers();
	int __fastcall tpCreateTriggerHandle();
	int __fastcall tpEventIndex(int Handle);
	void __fastcall tpSortTriggers();
	void __fastcall tpTimerWndProc(Winapi::Messages::TMessage &Msg);
	void __fastcall tpUpdateTimer();
	virtual void __fastcall DoTriggerNotification();
	
public:
	__fastcall virtual TOvcTimerPool(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTimerPool();
	int __fastcall AddOneShot(TTriggerEvent OnTrigger, unsigned Interval);
	int __fastcall AddOneTime(TTriggerEvent OnTrigger, unsigned Interval);
	int __fastcall Add(TTriggerEvent OnTrigger, unsigned Interval);
	HIDESBASE void __fastcall Remove(int Handle);
	void __fastcall RemoveAll();
	void __fastcall ResetElapsedTime(int Handle);
	__property int Count = {read=GetTriggerCount, nodefault};
	__property int ElapsedTime[int Handle] = {read=GetElapsedTriggerTime};
	__property int ElapsedTimeSec[int Handle] = {read=GetElapsedTriggerTimeSec};
	__property bool Enabled[int Handle] = {read=GetTriggerEnabled, write=SetTriggerEnabled};
	__property unsigned Interval[int Handle] = {read=GetTriggerInterval, write=SetTriggerInterval};
	__property TTriggerEvent OnTrigger[int Handle] = {read=GetOnTrigger, write=SetOnTrigger};
	
__published:
	__property System::UnicodeString About = {read=GetAbout, write=SetAbout, stored=false};
	__property TTriggerEvent OnAllTriggers = {read=FOnAllTriggers, write=FOnAllTriggers};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctimer */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTIMER)
using namespace Ovctimer;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctimerHPP
