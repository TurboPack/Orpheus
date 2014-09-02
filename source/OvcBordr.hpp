// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcbordr.pas' rev: 27.00 (Windows)

#ifndef OvcbordrHPP
#define OvcbordrHPP

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
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovceditf.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcbordr
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcBorderStyle : unsigned char { bpsSolid };

class DELPHICLASS TOvcBorderEdButton;
class PASCALIMPLEMENTATION TOvcBorderEdButton : public Vcl::Buttons::TBitBtn
{
	typedef Vcl::Buttons::TBitBtn inherited;
	
public:
	DYNAMIC void __fastcall Click(void);
public:
	/* TBitBtn.Create */ inline __fastcall virtual TOvcBorderEdButton(System::Classes::TComponent* AOwner) : Vcl::Buttons::TBitBtn(AOwner) { }
	/* TBitBtn.Destroy */ inline __fastcall virtual ~TOvcBorderEdButton(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcBorderEdButton(HWND ParentWindow) : Vcl::Buttons::TBitBtn(ParentWindow) { }
	
};


class DELPHICLASS TOvcBorder;
class PASCALIMPLEMENTATION TOvcBorder : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
protected:
	bool FEnabled;
	TOvcBorderStyle FBorderStyle;
	System::Uitypes::TColor FPenColor;
	Vcl::Graphics::TPenStyle FPenStyle;
	int FPenWidth;
	System::Classes::TNotifyEvent FOnChange;
	void __fastcall DoOnChange(void);
	void __fastcall SetDefaults(void);
	void __fastcall SetEnabled(bool Value);
	void __fastcall SetBorderStyle(TOvcBorderStyle Value);
	void __fastcall SetPenColor(System::Uitypes::TColor Value);
	void __fastcall SetPenStyle(Vcl::Graphics::TPenStyle Value);
	void __fastcall SetPenWidth(int Value);
	
public:
	virtual void __fastcall Assign(System::Classes::TPersistent* Value);
	__fastcall TOvcBorder(void);
	
__published:
	__property TOvcBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, stored=FEnabled, default=0};
	__property bool Enabled = {read=FEnabled, write=SetEnabled, default=0};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::Uitypes::TColor PenColor = {read=FPenColor, write=SetPenColor, stored=FEnabled, default=0};
	__property Vcl::Graphics::TPenStyle PenStyle = {read=FPenStyle, write=SetPenStyle, stored=FEnabled, default=0};
	__property int PenWidth = {read=FPenWidth, write=SetPenWidth, stored=FEnabled, default=2};
public:
	/* TPersistent.Destroy */ inline __fastcall virtual ~TOvcBorder(void) { }
	
};


class DELPHICLASS TOvcBorders;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcBorders : public System::Classes::TPersistent
{
	typedef System::Classes::TPersistent inherited;
	
protected:
	TOvcBorder* FLeftBorder;
	TOvcBorder* FRightBorder;
	TOvcBorder* FTopBorder;
	TOvcBorder* FBottomBorder;
	
public:
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	__fastcall TOvcBorders(void);
	__fastcall virtual ~TOvcBorders(void);
	
__published:
	__property TOvcBorder* BottomBorder = {read=FBottomBorder, write=FBottomBorder};
	__property TOvcBorder* LeftBorder = {read=FLeftBorder, write=FLeftBorder};
	__property TOvcBorder* RightBorder = {read=FRightBorder, write=FRightBorder};
	__property TOvcBorder* TopBorder = {read=FTopBorder, write=FTopBorder};
};

#pragma pack(pop)

class DELPHICLASS TOvcBorderParent;
class PASCALIMPLEMENTATION TOvcBorderParent : public Ovcbase::TOvcCustomControl
{
	typedef Ovcbase::TOvcCustomControl inherited;
	
protected:
	TOvcBorders* FBorders;
	Ovceditf::TOvcCustomEdit* FEdit;
	Ovcbase::TOvcLabelInfo* FLabelInfo;
	int FOrgHeight;
	Ovcbase::TOvcLabelPosition DefaultLabelPosition;
	bool DoingBorders;
	void __fastcall BorderChanged(System::TObject* ABorder);
	HIDESBASE Ovcbase::TOvcAttachedLabel* __fastcall GetAttachedLabel(void);
	virtual void __fastcall Paint(void);
	virtual void __fastcall PaintBorders(void);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Winapi::Messages::TWMSetFocus &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	HIDESBASE void __fastcall LabelChange(System::TObject* Sender);
	HIDESBASE void __fastcall LabelAttach(System::TObject* Sender, bool Value);
	HIDESBASE void __fastcall PositionLabel(void);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrAssignLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrPositionLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrRecordLabelPosition(Winapi::Messages::TMessage &Msg);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	int ButtonWidth;
	bool DoShowButton;
	__fastcall virtual TOvcBorderParent(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcBorderParent(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	virtual void __fastcall SetEditControl(Ovceditf::TOvcCustomEdit* EC);
	__property Ovcbase::TOvcAttachedLabel* AttachedLabel = {read=GetAttachedLabel};
	__property Canvas;
	__property Ovceditf::TOvcCustomEdit* EditControl = {read=FEdit, write=FEdit};
	
__published:
	__property TOvcBorders* Borders = {read=FBorders, write=FBorders};
	__property Ovcbase::TOvcLabelInfo* LabelInfo = {read=FLabelInfo, write=FLabelInfo};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcBorderParent(HWND ParentWindow) : Ovcbase::TOvcCustomControl(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcbordr */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCBORDR)
using namespace Ovcbordr;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcbordrHPP
