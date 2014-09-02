// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdrcbx.pas' rev: 27.00 (Windows)

#ifndef OvcdrcbxHPP
#define OvcdrcbxHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovcflcbx.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdrcbx
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcDirectoryComboBox;
class PASCALIMPLEMENTATION TOvcDirectoryComboBox : public Ovccmbx::TOvcBaseComboBox
{
	typedef Ovccmbx::TOvcBaseComboBox inherited;
	
protected:
	System::UnicodeString FDirectory;
	System::WideChar FDrive;
	System::UnicodeString FMask;
	Ovcflcbx::TOvcFileComboBox* FFileComboBox;
	int cbDirLevel;
	Vcl::Controls::TImageList* cbDirImages;
	void __fastcall SetDirectory(const System::UnicodeString Value);
	void __fastcall SetDrive(const System::WideChar Value);
	void __fastcall SetMask(const System::UnicodeString Value);
	virtual void __fastcall DrawItem(int Index, const System::Types::TRect &ItemRect, Winapi::Windows::TOwnerDrawState State);
	virtual void __fastcall Loaded(void);
	virtual void __fastcall Notification(System::Classes::TComponent* Component, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TOvcDirectoryComboBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcDirectoryComboBox(void);
	void __fastcall Populate(void);
	virtual void __fastcall SelectionChanged(void);
	
__published:
	__property System::UnicodeString Directory = {read=FDirectory, write=SetDirectory};
	__property System::WideChar Drive = {read=FDrive, write=SetDrive, default=0};
	__property System::UnicodeString Mask = {read=FMask, write=SetMask};
	__property Ovcflcbx::TOvcFileComboBox* FileComboBox = {read=FFileComboBox, write=FFileComboBox};
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
	__property ItemHeight;
	__property KeyDelay = {default=500};
	__property LabelInfo;
	__property MRUListColor = {default=-16777211};
	__property MRUListCount = {default=3};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Style = {default=0};
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
	/* TWinControl.CreateParented */ inline __fastcall TOvcDirectoryComboBox(HWND ParentWindow) : Ovccmbx::TOvcBaseComboBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdrcbx */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDRCBX)
using namespace Ovcdrcbx;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdrcbxHPP
