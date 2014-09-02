// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovceditf.pas' rev: 27.00 (Windows)

#ifndef OvceditfHPP
#define OvceditfHPP

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
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcver.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovceditf
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcCustomEdit;
class PASCALIMPLEMENTATION TOvcCustomEdit : public Vcl::Stdctrls::TCustomEdit
{
	typedef Vcl::Stdctrls::TCustomEdit inherited;
	
protected:
	Ovcbase::TOvcController* FController;
	Ovcbase::TOvcLabelInfo* FLabelInfo;
	System::UnicodeString __fastcall GetAbout(void);
	Ovcbase::TOvcAttachedLabel* __fastcall GetAttachedLabel(void);
	void __fastcall SetAbout(const System::UnicodeString Value);
	void __fastcall SetController(Ovcbase::TOvcController* Value);
	void __fastcall LabelChange(System::TObject* Sender);
	void __fastcall LabelAttach(System::TObject* Sender, bool Value);
	void __fastcall PositionLabel(void);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrAssignLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrPositionLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OrRecordLabelPosition(Winapi::Messages::TMessage &Msg);
	Ovcbase::TOvcLabelPosition DefaultLabelPosition;
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	bool __fastcall ControllerAssigned(void);
	__property System::UnicodeString About = {read=GetAbout, write=SetAbout, stored=false};
	__property Ovcbase::TOvcLabelInfo* LabelInfo = {read=FLabelInfo, write=FLabelInfo};
	
public:
	__fastcall virtual TOvcCustomEdit(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCustomEdit(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	__property Ovcbase::TOvcAttachedLabel* AttachedLabel = {read=GetAttachedLabel};
	__property Ovcbase::TOvcController* Controller = {read=FController, write=SetController};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcCustomEdit(HWND ParentWindow) : Vcl::Stdctrls::TCustomEdit(ParentWindow) { }
	
};


class DELPHICLASS TOvcEdit;
class PASCALIMPLEMENTATION TOvcEdit : public TOvcCustomEdit
{
	typedef TOvcCustomEdit inherited;
	
__published:
	__property Anchors = {default=3};
	__property BiDiMode;
	__property ParentBiDiMode = {default=1};
	__property Constraints;
	__property DragKind = {default=0};
	__property About = {default=0};
	__property AutoSelect = {default=1};
	__property AutoSize = {default=1};
	__property BorderStyle = {default=1};
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Controller;
	__property Ctl3D;
	__property Cursor = {default=0};
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property HideSelection = {default=1};
	__property ImeMode = {default=3};
	__property ImeName = {default=0};
	__property LabelInfo;
	__property MaxLength = {default=0};
	__property OEMConvert = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PasswordChar = {default=0};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property TabStop = {default=1};
	__property Text = {default=0};
	__property Visible = {default=1};
	__property OnChange;
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDock;
	__property OnStartDock;
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
public:
	/* TOvcCustomEdit.Create */ inline __fastcall virtual TOvcEdit(System::Classes::TComponent* AOwner) : TOvcCustomEdit(AOwner) { }
	/* TOvcCustomEdit.Destroy */ inline __fastcall virtual ~TOvcEdit(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcEdit(HWND ParentWindow) : TOvcCustomEdit(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovceditf */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCEDITF)
using namespace Ovceditf;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvceditfHPP
