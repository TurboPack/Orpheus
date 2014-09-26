// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbccb.pas' rev: 27.00 (Windows)

#ifndef OvcdbccbHPP
#define OvcdbccbHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Data.DB.hpp>	// Pascal unit
#include <Vcl.DBCtrls.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcclrcb.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbccb
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcDbColorComboBox;
class PASCALIMPLEMENTATION TOvcDbColorComboBox : public Ovcclrcb::TOvcCustomColorComboBox
{
	typedef Ovcclrcb::TOvcCustomColorComboBox inherited;
	
protected:
	Vcl::Dbctrls::TFieldDataLink* FDataLink;
	bool ccbBusy;
	System::UnicodeString __fastcall GetDataField(void);
	Data::Db::TDataSource* __fastcall GetDataSource(void);
	Data::Db::TField* __fastcall GetField(void);
	void __fastcall SetDataField(const System::UnicodeString Value);
	void __fastcall SetDataSource(Data::Db::TDataSource* Value);
	void __fastcall ccbDataChange(System::TObject* Sender);
	void __fastcall ccbUpdateData(System::TObject* Sender);
	MESSAGE void __fastcall CMGetDataLink(Winapi::Messages::TMessage &Msg);
	DYNAMIC void __fastcall Change(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TOvcDbColorComboBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcDbColorComboBox(void);
	DYNAMIC bool __fastcall ExecuteAction(System::Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(System::Classes::TBasicAction* Action);
	__property Data::Db::TField* Field = {read=GetField};
	__property System::Uitypes::TColor SelectedColor = {read=GetSelectedColor, write=SetSelectedColor, nodefault};
	
__published:
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Data::Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Anchors = {default=3};
	__property Constraints;
	__property DragKind = {default=0};
	__property About = {default=0};
	__property Color = {default=-16777211};
	__property Ctl3D;
	__property Cursor = {default=0};
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property DropDownCount = {default=8};
	__property Enabled = {default=1};
	__property Font;
	__property HotTrack = {default=0};
	__property Items;
	__property ItemHeight;
	__property LabelInfo;
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowColorNames = {default=1};
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
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnSelectionChange;
	__property OnStartDrag;
	__property OnMouseWheel;
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcDbColorComboBox(HWND ParentWindow) : Ovcclrcb::TOvcCustomColorComboBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbccb */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBCCB)
using namespace Ovcdbccb;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbccbHPP
