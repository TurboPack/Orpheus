// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcslide.pas' rev: 27.00 (Windows)

#ifndef OvcslideHPP
#define OvcslideHPP

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
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcslide
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcSliderOrientation : unsigned char { soHorizontal, soVertical };

class DELPHICLASS TOvcCustomSlider;
class PASCALIMPLEMENTATION TOvcCustomSlider : public Ovcbase::TOvcCustomControl
{
	typedef Ovcbase::TOvcCustomControl inherited;
	
protected:
	Vcl::Forms::TFormBorderStyle FBorderStyle;
	bool FDrawMarks;
	System::Uitypes::TColor FMarkColor;
	double FMax;
	double FMin;
	int FMinMarkSpacing;
	TOvcSliderOrientation FOrientation;
	double FPosition;
	double FStep;
	System::Classes::TNotifyEvent FOnChange;
	System::Types::TRect slBtnRect;
	double slClickPos;
	Vcl::Graphics::TBitmap* slMemBM;
	bool slMouseDown;
	int slOffset;
	int slPointerWidth;
	bool slPopup;
	void __fastcall SetBorderStyle(const Vcl::Forms::TBorderStyle Value);
	void __fastcall SetDrawMarks(bool Value);
	void __fastcall SetMarkColor(System::Uitypes::TColor Value);
	void __fastcall SetMinMarkSpacing(int Value);
	void __fastcall SetOrientation(const TOvcSliderOrientation Value);
	void __fastcall SetPosition(const double Value);
	void __fastcall SetRangeHi(const double Value);
	void __fastcall SetRangeLo(const double Value);
	void __fastcall SetStep(const double Value);
	HIDESBASE MESSAGE void __fastcall CMCtl3DChanged(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMEnter(Winapi::Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall CMExit(Winapi::Messages::TWMNoParams &Message);
	HIDESBASE MESSAGE void __fastcall WMEraseBkGnd(Winapi::Messages::TWMEraseBkgnd &Msg);
	MESSAGE void __fastcall WMGetDlgCode(Winapi::Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	virtual void __fastcall CreateParams(Vcl::Controls::TCreateParams &Params);
	DYNAMIC void __fastcall KeyDown(System::Word &Key, System::Classes::TShiftState Shift);
	virtual void __fastcall Paint(void);
	virtual void __fastcall DoOnChange(void);
	DYNAMIC void __fastcall DoOnMouseWheel(System::Classes::TShiftState Shift, short Delta, short XPos, short YPos);
	__property Vcl::Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, nodefault};
	__property bool DrawMarks = {read=FDrawMarks, write=SetDrawMarks, nodefault};
	__property System::Uitypes::TColor MarkColor = {read=FMarkColor, write=SetMarkColor, default=-16777198};
	__property double Max = {read=FMax, write=SetRangeHi};
	__property double Min = {read=FMin, write=SetRangeLo};
	__property int MinMarkSpacing = {read=FMinMarkSpacing, write=SetMinMarkSpacing, nodefault};
	__property TOvcSliderOrientation Orientation = {read=FOrientation, write=SetOrientation, nodefault};
	__property double Position = {read=FPosition, write=SetPosition};
	__property double Step = {read=FStep, write=SetStep};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	
public:
	__fastcall virtual TOvcCustomSlider(System::Classes::TComponent* AOwner);
	__fastcall virtual TOvcCustomSlider(System::Classes::TComponent* AOwner, bool AsPopup);
	__fastcall virtual ~TOvcCustomSlider(void);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	DYNAMIC void __fastcall MouseDown(System::Uitypes::TMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseMove(System::Classes::TShiftState Shift, int X, int Y);
	DYNAMIC void __fastcall MouseUp(System::Uitypes::TMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	__property Canvas;
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcCustomSlider(HWND ParentWindow) : Ovcbase::TOvcCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TOvcSlider;
class PASCALIMPLEMENTATION TOvcSlider : public TOvcCustomSlider
{
	typedef TOvcCustomSlider inherited;
	
__published:
	__property Anchors = {default=3};
	__property Constraints;
	__property About = {default=0};
	__property Align = {default=0};
	__property BorderStyle = {default=1};
	__property Color = {default=-16777211};
	__property Ctl3D;
	__property Cursor = {default=0};
	__property DrawMarks = {default=1};
	__property Enabled = {default=1};
	__property Height = {default=20};
	__property LabelInfo;
	__property Max = {default=0};
	__property MarkColor = {default=-16777198};
	__property Min = {default=0};
	__property Orientation = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property Position = {default=0};
	__property ShowHint;
	__property Step = {default=0};
	__property TabOrder = {default=-1};
	__property TabStop = {default=0};
	__property Visible = {default=1};
	__property AfterEnter;
	__property AfterExit;
	__property OnChange;
	__property OnClick;
	__property OnDblClick;
	__property OnEnter;
	__property OnExit;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnMouseWheel;
public:
	/* TOvcCustomSlider.Create */ inline __fastcall virtual TOvcSlider(System::Classes::TComponent* AOwner) : TOvcCustomSlider(AOwner) { }
	/* TOvcCustomSlider.CreateEx */ inline __fastcall virtual TOvcSlider(System::Classes::TComponent* AOwner, bool AsPopup) : TOvcCustomSlider(AOwner, AsPopup) { }
	/* TOvcCustomSlider.Destroy */ inline __fastcall virtual ~TOvcSlider(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcSlider(HWND ParentWindow) : TOvcCustomSlider(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcslide */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCSLIDE)
using namespace Ovcslide;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcslideHPP
