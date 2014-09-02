// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovchscbx.pas' rev: 27.00 (Windows)

#ifndef OvchscbxHPP
#define OvchscbxHPP

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
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovchscbx
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcHistoryComboBox;
class PASCALIMPLEMENTATION TOvcHistoryComboBox : public Ovccmbx::TOvcBaseComboBox
{
	typedef Ovccmbx::TOvcBaseComboBox inherited;
	
protected:
	int FMaxHistory;
	DYNAMIC void __fastcall DoExit(void);
	
public:
	__fastcall virtual TOvcHistoryComboBox(System::Classes::TComponent* AOwner);
	void __fastcall UpdateHistory(void);
	
__published:
	__property int MaxHistory = {read=FMaxHistory, write=FMaxHistory, default=5};
	__property Anchors = {default=3};
	__property Constraints;
	__property DragKind = {default=0};
	__property About = {default=0};
	__property AutoSearch = {default=1};
	__property Color = {default=-16777211};
	__property Ctl3D;
	__property Cursor = {default=0};
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property Enabled = {default=1};
	__property Font;
	__property HotTrack = {default=0};
	__property ImeMode = {default=3};
	__property ImeName = {default=0};
	__property Items;
	__property ItemHeight;
	__property KeyDelay = {default=500};
	__property LabelInfo;
	__property MaxLength = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Text = {default=0};
	__property Visible = {default=1};
	__property AfterEnter;
	__property AfterExit;
	__property OnChange;
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDropDown;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnSelectionChange;
	__property OnStartDrag;
	__property OnMouseWheel;
public:
	/* TOvcBaseComboBox.Destroy */ inline __fastcall virtual ~TOvcHistoryComboBox(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcHistoryComboBox(HWND ParentWindow) : Ovccmbx::TOvcBaseComboBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovchscbx */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCHSCBX)
using namespace Ovchscbx;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvchscbxHPP
