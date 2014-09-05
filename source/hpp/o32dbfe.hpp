// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'o32dbfe.pas' rev: 27.00 (Windows)

#ifndef O32dbfeHPP
#define O32dbfeHPP

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
#include <Data.DBConsts.hpp>	// Pascal unit
#include <Vcl.DBCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovccolor.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <o32flxed.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <o32editf.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <o32bordr.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace O32dbfe
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TO32DbFlexEdit;
class PASCALIMPLEMENTATION TO32DbFlexEdit : public O32flxed::TO32CustomFlexEdit
{
	typedef O32flxed::TO32CustomFlexEdit inherited;
	
protected:
	Vcl::Controls::TControlCanvas* FCanvas;
	Vcl::Dbctrls::TFieldDataLink* FDataLink;
	Data::Db::TFieldType FFieldType;
	bool FUseTFieldMask;
	bool fedbBusy;
	Ovcdata::TDbEntryFieldState fedbState;
	System::UnicodeString __fastcall GetDataField(void);
	Data::Db::TDataSource* __fastcall GetDataSource(void);
	Data::Db::TField* __fastcall GetField(void);
	void __fastcall SetDataField(const System::UnicodeString Value);
	void __fastcall SetDataSource(Data::Db::TDataSource* Value);
	void __fastcall SetFieldType(Data::Db::TFieldType Value);
	void __fastcall SetUseTFieldMask(bool Value);
	void __fastcall fedbDataChange(System::TObject* Sender);
	void __fastcall fedbEditingChange(System::TObject* Sender);
	void __fastcall fedbGetFieldValue(void);
	void __fastcall fedbSetFieldProperties(void);
	void __fastcall fedbSetFieldValue(void);
	void __fastcall fedbUpdateData(System::TObject* Sender);
	HIDESBASE MESSAGE void __fastcall CMEnter(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMExit(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall CMGetDataLink(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Winapi::Messages::TWMKey &Msg);
	HIDESBASE MESSAGE void __fastcall WMChar(Winapi::Messages::TWMKey &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	HIDESBASE MESSAGE void __fastcall WMLButtonDblClk(Winapi::Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMLButtonDown(Winapi::Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMLButtonUp(Winapi::Messages::TWMMouse &Msg);
	HIDESBASE MESSAGE void __fastcall WMPaint(Winapi::Messages::TWMPaint &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Winapi::Messages::TWMSetFocus &Msg);
	virtual void __fastcall CreateWnd(void);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	virtual void __fastcall DoOnChange(void);
	
public:
	__fastcall virtual TO32DbFlexEdit(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TO32DbFlexEdit(void);
	DYNAMIC bool __fastcall ExecuteAction(System::Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(System::Classes::TBasicAction* Action);
	virtual void __fastcall Restore(void);
	HIDESBASE void __fastcall CutToClipboard(void);
	HIDESBASE void __fastcall PasteFromClipboard(void);
	__property Data::Db::TField* Field = {read=GetField};
	
__published:
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Data::Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Data::Db::TFieldType FieldType = {read=FFieldType, write=SetFieldType, default=0};
	__property bool UseTFieldMask = {read=FUseTFieldMask, write=SetUseTFieldMask, default=0};
	__property Anchors = {default=3};
	__property BiDiMode;
	__property Constraints;
	__property DragKind = {default=0};
	__property DragMode = {default=0};
	__property ParentBiDiMode = {default=1};
	__property AutoSize = {default=0};
	__property About = {default=0};
	__property AutoSelect = {default=1};
	__property Borders;
	__property ButtonGlyph;
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Cursor = {default=0};
	__property DragCursor = {default=-12};
	__property EditLines;
	__property EFColors;
	__property Enabled = {default=1};
	__property Font;
	__property HideSelection = {default=1};
	__property Ctl3D;
	__property ImeMode = {default=3};
	__property ImeName = {default=0};
	__property OEMConvert = {default=0};
	__property PopupAnchor = {default=0};
	__property PopupMenu;
	__property ReadOnly = {default=0};
	__property ShowButton = {default=0};
	__property LabelInfo;
	__property MaxLength = {default=0};
	__property ParentColor = {default=0};
	__property ParentCtl3D = {default=1};
	__property ParentFont = {default=1};
	__property ParentShowHint = {default=1};
	__property PasswordChar = {default=0};
	__property ShowHint;
	__property TabOrder = {default=-1};
	__property Text;
	__property Validation;
	__property WantReturns = {default=0};
	__property WantTabs = {default=0};
	__property WordWrap = {default=0};
	__property TabStop = {default=1};
	__property Tag = {default=0};
	__property Visible = {default=1};
	__property AfterValidation;
	__property BeforeValidation;
	__property OnButtonClick;
	__property OnChange;
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
	__property OnMouseWheel;
	__property OnStartDrag;
	__property OnUserValidation;
	__property OnValidationError;
public:
	/* TWinControl.CreateParented */ inline __fastcall TO32DbFlexEdit(HWND ParentWindow) : O32flxed::TO32CustomFlexEdit(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace O32dbfe */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_O32DBFE)
using namespace O32dbfe;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// O32dbfeHPP
