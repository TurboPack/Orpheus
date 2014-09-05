// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovclb.pas' rev: 27.00 (Windows)

#ifndef OvclbHPP
#define OvclbHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovcver.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovclb
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcCustomListBox;
class PASCALIMPLEMENTATION TOvcCustomListBox : public Vcl::Stdctrls::TCustomListBox
{
	typedef Vcl::Stdctrls::TCustomListBox inherited;
	
protected:
	Ovcbase::TOvcController* FController;
	bool FHorizontalScroll;
	Ovcbase::TOvcLabelInfo* FLabelInfo;
	System::Classes::TStrings* FTabStops;
	System::Classes::TNotifyEvent FOnTabStopsChange;
	System::StaticArray<int, 100> tlTabs;
	System::StaticArray<int, 100> tlTabsDU;
	System::UnicodeString __fastcall GetAbout(void);
	void __fastcall SetAbout(const System::UnicodeString Value);
	void __fastcall SetController(Ovcbase::TOvcController* Value);
	void __fastcall SetHorizontalScroll(bool Value);
	void __fastcall SetTabStopsStr(System::Classes::TStrings* Value);
	Ovcbase::TOvcAttachedLabel* __fastcall GetAttachedLabel(void);
	void __fastcall LabelAttach(System::TObject* Sender, bool Value);
	void __fastcall LabelChange(System::TObject* Sender);
	void __fastcall PositionLabel(void);
	int __fastcall tlGetItemWidth(int Index);
	void __fastcall tlSetTabStops(void);
	virtual void __fastcall tlResetHorizontalExtent(void);
	MESSAGE void __fastcall OMAssignLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OMPositionLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OMRecordLabelPosition(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMFontChanged(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Winapi::Messages::TWMNCHitTest &Msg);
	MESSAGE void __fastcall LBAddString(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall LBDeleteString(Winapi::Messages::TMessage &Msg);
	Ovcbase::TOvcLabelPosition DefaultLabelPosition;
	virtual void __fastcall CreateParams(Vcl::Controls::TCreateParams &Params);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	DYNAMIC void __fastcall DoOnTabStopsChanged(void);
	__property System::UnicodeString About = {read=GetAbout, write=SetAbout, stored=false};
	__property bool HorizontalScroll = {read=FHorizontalScroll, write=SetHorizontalScroll, nodefault};
	__property Ovcbase::TOvcLabelInfo* LabelInfo = {read=FLabelInfo, write=FLabelInfo};
	__property System::Classes::TStrings* TabStops = {read=FTabStops, write=SetTabStopsStr};
	__property System::Classes::TNotifyEvent OnTabStopsChange = {read=FOnTabStopsChange, write=FOnTabStopsChange};
	
public:
	__fastcall virtual TOvcCustomListBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCustomListBox(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	void __fastcall ClearTabStops(void);
	void __fastcall ResetHorizontalScrollbar(void);
	void __fastcall SetTabStops(int const *Value, const int Value_High);
	__property Ovcbase::TOvcAttachedLabel* AttachedLabel = {read=GetAttachedLabel};
	__property Ovcbase::TOvcController* Controller = {read=FController, write=SetController};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcCustomListBox(HWND ParentWindow) : Vcl::Stdctrls::TCustomListBox(ParentWindow) { }
	
};


class DELPHICLASS TOvcListBox;
class PASCALIMPLEMENTATION TOvcListBox : public TOvcCustomListBox
{
	typedef TOvcCustomListBox inherited;
	
__published:
	__property Anchors = {default=3};
	__property Constraints;
	__property DragKind = {default=0};
	__property About = {default=0};
	__property Align = {default=0};
	__property BorderStyle = {default=1};
	__property Color = {default=-16777211};
	__property Columns = {default=0};
	__property Controller;
	__property Ctl3D;
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property ExtendedSelect = {default=1};
	__property Font;
	__property HorizontalScroll = {default=0};
	__property IntegralHeight = {default=0};
	__property ItemHeight = {default=16};
	__property LabelInfo;
	__property MultiSelect = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Sorted = {default=0};
	__property TabOrder = {default=-1};
	__property TabStops;
	__property Items;
	__property TabStop = {default=1};
	__property Visible = {default=1};
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDrag;
	__property OnTabStopsChange;
public:
	/* TOvcCustomListBox.Create */ inline __fastcall virtual TOvcListBox(System::Classes::TComponent* AOwner) : TOvcCustomListBox(AOwner) { }
	/* TOvcCustomListBox.Destroy */ inline __fastcall virtual ~TOvcListBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcListBox(HWND ParentWindow) : TOvcCustomListBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovclb */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCLB)
using namespace Ovclb;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvclbHPP
