// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbise.pas' rev: 27.00 (Windows)

#ifndef OvcdbiseHPP
#define OvcdbiseHPP

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
#include <Bde.DBTables.hpp>	// Pascal unit
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
#include <ovciseb.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovcver.hpp>	// Pascal unit
#include <ovceditf.hpp>	// Pascal unit
#include <ovcdbhll.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbise
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcDbSearchEdit;
class PASCALIMPLEMENTATION TOvcDbSearchEdit : public Ovciseb::TOvcBaseISE
{
	typedef Ovciseb::TOvcBaseISE inherited;
	
protected:
	Ovcdbhll::TOvcDbEngineHelperBase* FDbEngineHelper;
	Data::Db::TDataLink* FDataLink;
	Ovcbase::TOvcLabelInfo* FLabelInfo;
	HIDESBASE System::UnicodeString __fastcall GetAbout(void);
	HIDESBASE Ovcbase::TOvcAttachedLabel* __fastcall GetAttachedLabel(void);
	Data::Db::TDataSource* __fastcall GetDataSource(void);
	HIDESBASE void __fastcall SetAbout(const System::UnicodeString Value);
	void __fastcall SetDataSource(Data::Db::TDataSource* Value);
	HIDESBASE void __fastcall LabelAttach(System::TObject* Sender, bool Value);
	HIDESBASE void __fastcall LabelChange(System::TObject* Sender);
	HIDESBASE void __fastcall PositionLabel(void);
	MESSAGE void __fastcall OMAssignLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OMPositionLabel(Winapi::Messages::TMessage &Msg);
	MESSAGE void __fastcall OMRecordLabelPosition(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall CMVisibleChanged(Winapi::Messages::TMessage &Msg);
	Ovcbase::TOvcLabelPosition DefaultLabelPosition;
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TOvcDbSearchEdit(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcDbSearchEdit(void);
	virtual void __fastcall SetBounds(int ALeft, int ATop, int AWidth, int AHeight);
	virtual void __fastcall PerformSearch(void);
	__property Ovcbase::TOvcAttachedLabel* AttachedLabel = {read=GetAttachedLabel};
	
__published:
	__property System::UnicodeString About = {read=GetAbout, write=SetAbout, stored=false};
	__property AutoSearch = {default=1};
	__property CaseSensitive = {default=0};
	__property Controller;
	__property Data::Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property Ovcbase::TOvcLabelInfo* LabelInfo = {read=FLabelInfo, write=FLabelInfo};
	__property KeyDelay = {default=500};
	__property ShowResults = {default=1};
	__property Ovcdbhll::TOvcDbEngineHelperBase* DbEngineHelper = {read=FDbEngineHelper, write=FDbEngineHelper};
	__property Anchors = {default=3};
	__property Constraints;
	__property DragKind = {default=0};
	__property AutoSelect = {default=1};
	__property AutoSize = {default=1};
	__property BorderStyle = {default=1};
	__property CharCase = {default=0};
	__property Color = {default=-16777211};
	__property Ctl3D;
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property HideSelection = {default=1};
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
	__property Visible = {default=1};
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
	__property OnStartDrag;
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcDbSearchEdit(HWND ParentWindow) : Ovciseb::TOvcBaseISE(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbise */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBISE)
using namespace Ovcdbise;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbiseHPP
