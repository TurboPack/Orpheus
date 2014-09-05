// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovccklb.pas' rev: 27.00 (Windows)

#ifndef OvccklbHPP
#define OvccklbHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.ImgList.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovclb.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <Vcl.Themes.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovccklb
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcCheckStyle : unsigned char { csCheck, csX };

typedef void __fastcall (__closure *TOvcStateChangeEvent)(System::TObject* Sender, int Index, Vcl::Stdctrls::TCheckBoxState OldState, Vcl::Stdctrls::TCheckBoxState NewState);

typedef void __fastcall (__closure *TOvcOwnerDrawCheckEvent)(System::TObject* Sender, Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &R, Winapi::Windows::TOwnerDrawState AState, TOvcCheckStyle CheckStyle);

class DELPHICLASS TOvcCheckList;
class PASCALIMPLEMENTATION TOvcCheckList : public Ovclb::TOvcCustomListBox
{
	typedef Ovclb::TOvcCustomListBox inherited;
	
protected:
	System::Uitypes::TColor FBoxColor;
	bool FBoxClickOnly;
	int FBoxMargin;
	TOvcCheckStyle FCheckStyle;
	System::Uitypes::TColor FCheckColor;
	System::Classes::TList* FGlyphIndex;
	Vcl::Controls::TImageList* FGlyphs;
	int FGlyphWidth;
	bool FShowGlyphs;
	System::Classes::TList* FStates;
	bool FReadOnly;
	bool FThreeState;
	bool FWantDblClicks;
	TOvcStateChangeEvent FOnStateChange;
	TOvcOwnerDrawCheckEvent FOwnerDrawCheck;
	bool FMultiCheck;
	Vcl::Graphics::TBitmap* clGrayBitmap;
	Vcl::Graphics::TBitmap* clDrawBmp;
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	int __fastcall GetGlyphIndex(int Index);
	Vcl::Stdctrls::TCheckBoxState __fastcall GetStates(int Index);
	void __fastcall SetBoxColor(System::Uitypes::TColor Value);
	void __fastcall SetBoxMargin(int Value);
	void __fastcall SetGlyphIndex(int Index, int AGlyphIndex);
	void __fastcall SetGlyphs(Vcl::Controls::TImageList* Value);
	void __fastcall SetShowGlyphs(bool Value);
	void __fastcall SetStates(int Index, Vcl::Stdctrls::TCheckBoxState State);
	void __fastcall SetWantDblClicks(bool Value);
	void __fastcall SetMultiCheck(const bool Value);
	void __fastcall InvalidateItem(int Index);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Winapi::Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMNCHitTest(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall LBAddString(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall LBDeleteString(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall LBResetContent(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CNDrawItem(Winapi::Messages::TWMDrawItem &Msg);
	Ovcbase::TOvcLabelPosition DefaultLabelPosition;
	virtual void __fastcall CreateParams(Vcl::Controls::TCreateParams &Params);
	DYNAMIC void __fastcall DoOnStateChange(int Index, Vcl::Stdctrls::TCheckBoxState OldState, Vcl::Stdctrls::TCheckBoxState NewState);
	virtual void __fastcall DrawItem(int Index, const System::Types::TRect &Rect, Winapi::Windows::TOwnerDrawState AState);
	virtual void __fastcall tlResetHorizontalExtent(void);
	__property Style = {default=0};
	virtual void __fastcall LoadRecreateItems(System::Classes::TStrings* RecreateItems);
	virtual void __fastcall SaveRecreateItems(System::Classes::TStrings* RecreateItems);
	
public:
	__fastcall virtual TOvcCheckList(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCheckList(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	__property Canvas;
	void __fastcall ChangeStateForAll(Vcl::Stdctrls::TCheckBoxState NewState);
	void __fastcall ChangeStateForNotSelected(Vcl::Stdctrls::TCheckBoxState NewState);
	void __fastcall ChangeStateForSelected(Vcl::Stdctrls::TCheckBoxState NewState);
	int __fastcall GetStateCount(Vcl::Stdctrls::TCheckBoxState AState);
	__property int GlyphIndex[int Index] = {read=GetGlyphIndex, write=SetGlyphIndex};
	__property Vcl::Stdctrls::TCheckBoxState States[int Index] = {read=GetStates, write=SetStates};
	
__published:
	__property AutoComplete = {default=1};
	__property bool BoxClickOnly = {read=FBoxClickOnly, write=FBoxClickOnly, default=1};
	__property System::Uitypes::TColor BoxColor = {read=FBoxColor, write=SetBoxColor, default=16777215};
	__property int BoxMargin = {read=FBoxMargin, write=SetBoxMargin, default=1};
	__property System::Uitypes::TColor CheckColor = {read=FCheckColor, write=FCheckColor, default=-16777211};
	__property TOvcCheckStyle CheckStyle = {read=FCheckStyle, write=FCheckStyle, default=0};
	__property Vcl::Controls::TImageList* Glyphs = {read=FGlyphs, write=SetGlyphs};
	__property Ovcbase::TOvcLabelInfo* LabelInfo = {read=FLabelInfo, write=FLabelInfo};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, default=0};
	__property bool ShowGlyphs = {read=FShowGlyphs, write=SetShowGlyphs, default=0};
	__property bool ThreeState = {read=FThreeState, write=FThreeState, default=0};
	__property bool WantDblClicks = {read=FWantDblClicks, write=SetWantDblClicks, default=1};
	__property bool MultiCheck = {read=FMultiCheck, write=SetMultiCheck, default=1};
	__property TOvcStateChangeEvent OnStateChange = {read=FOnStateChange, write=FOnStateChange};
	__property TOvcOwnerDrawCheckEvent OwnerDrawCheck = {read=FOwnerDrawCheck, write=FOwnerDrawCheck};
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
	__property Items;
	__property ItemHeight = {default=16};
	__property MultiSelect = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Sorted = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property TabStops;
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
	/* TWinControl.CreateParented */ inline __fastcall TOvcCheckList(HWND ParentWindow) : Ovclb::TOvcCustomListBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovccklb */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCCKLB)
using namespace Ovccklb;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvccklbHPP
