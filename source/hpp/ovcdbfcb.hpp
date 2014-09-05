// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbfcb.pas' rev: 27.00 (Windows)

#ifndef OvcdbfcbHPP
#define OvcdbfcbHPP

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
#include <Data.DB.hpp>	// Pascal unit
#include <Vcl.DBCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbfcb
{
//-- type declarations -------------------------------------------------------
typedef System::Set<Data::Db::TFieldType, Data::Db::TFieldType::ftUnknown, Data::Db::TFieldType::ftSingle> TOvcFieldTypeSet;

class DELPHICLASS TOvcDbFieldComboBox;
class PASCALIMPLEMENTATION TOvcDbFieldComboBox : public Ovccmbx::TOvcBaseComboBox
{
	typedef Ovccmbx::TOvcBaseComboBox inherited;
	
protected:
	Vcl::Dbctrls::TFieldDataLink* FDataLink;
	TOvcFieldTypeSet FOmitFields;
	bool FShowHiddenFields;
	Data::Db::TDataSource* __fastcall GetDataSource(void);
	System::UnicodeString __fastcall GetFieldName(void);
	void __fastcall SetDataSource(Data::Db::TDataSource* Value);
	void __fastcall SetOmitFields(const TOvcFieldTypeSet &Value);
	void __fastcall SetShowHiddenFields(bool Value);
	void __fastcall ActiveChanged(System::TObject* Sender);
	virtual void __fastcall DrawItem(int Index, const System::Types::TRect &ItemRect, Winapi::Windows::TOwnerDrawState State);
	virtual void __fastcall Loaded(void);
	
public:
	__fastcall virtual TOvcDbFieldComboBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcDbFieldComboBox(void);
	void __fastcall Populate(void);
	DYNAMIC bool __fastcall ExecuteAction(System::Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(System::Classes::TBasicAction* Action);
	__property System::UnicodeString FieldName = {read=GetFieldName};
	__property TOvcFieldTypeSet OmitFields = {read=FOmitFields, write=SetOmitFields};
	
__published:
	__property Data::Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property bool ShowHiddenFields = {read=FShowHiddenFields, write=SetShowHiddenFields, default=0};
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
	__property ImeMode = {default=3};
	__property ImeName = {default=0};
	__property ItemHeight;
	__property Items;
	__property KeyDelay = {default=500};
	__property LabelInfo;
	__property MRUListColor = {default=-16777211};
	__property MRUListCount = {default=3};
	__property MaxLength = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PopupMenu;
	__property ShowHint;
	__property Sorted = {default=0};
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
	/* TWinControl.CreateParented */ inline __fastcall TOvcDbFieldComboBox(HWND ParentWindow) : Ovccmbx::TOvcBaseComboBox(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbfcb */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBFCB)
using namespace Ovcdbfcb;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbfcbHPP
