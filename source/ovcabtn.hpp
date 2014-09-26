// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcabtn.pas' rev: 27.00 (Windows)

#ifndef OvcabtnHPP
#define OvcabtnHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcver.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcabtn
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcButtonPosition : unsigned char { bpRight, bpLeft, bpTop, bpBottom };

class DELPHICLASS TOvcAttachedButton;
class PASCALIMPLEMENTATION TOvcAttachedButton : public Vcl::Buttons::TBitBtn
{
	typedef Vcl::Buttons::TBitBtn inherited;
	
protected:
	Vcl::Controls::TWinControl* FAttachedControl;
	bool FAttachTwoWay;
	TOvcButtonPosition FPosition;
	int FSeparation;
	void *abNewWndProc;
	void *abPrevWndProc;
	bool abSizing;
	System::UnicodeString __fastcall GetAbout(void);
	void __fastcall SetAbout(const System::UnicodeString Value);
	void __fastcall SetAttachedControl(Vcl::Controls::TWinControl* Value);
	void __fastcall SetAttachTwoWay(bool Value);
	void __fastcall SetPosition(TOvcButtonPosition Value);
	void __fastcall SetSeparation(int Value);
	void __fastcall abHookControl(void);
	void __fastcall abSetButtonBounds(const System::Types::TRect &CR);
	void __fastcall abSetControlBounds(void);
	void __fastcall abUnHookControl(void);
	void __fastcall abWndProc(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OMRecreateWnd(Winapi::Messages::TMessage &Msg);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TOvcAttachedButton(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcAttachedButton(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	
__published:
	__property System::UnicodeString About = {read=GetAbout, write=SetAbout, stored=false};
	__property Vcl::Controls::TWinControl* AttachedControl = {read=FAttachedControl, write=SetAttachedControl};
	__property bool AttachTwoWay = {read=FAttachTwoWay, write=SetAttachTwoWay, default=0};
	__property TOvcButtonPosition Position = {read=FPosition, write=SetPosition, default=0};
	__property int Separation = {read=FSeparation, write=SetSeparation, nodefault};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcAttachedButton(HWND ParentWindow) : Vcl::Buttons::TBitBtn(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcabtn */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCABTN)
using namespace Ovcabtn;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcabtnHPP
