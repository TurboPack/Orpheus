// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbplb.pas' rev: 27.00 (Windows)

#ifndef OvcdbplbHPP
#define OvcdbplbHPP

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
#include <Vcl.Menus.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcplb.hpp>	// Pascal unit
#include <ovcrlbl.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbplb
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TShowDateOrTime : unsigned char { ftShowDate, ftShowTime };

class DELPHICLASS TOvcDbPictureLabel;
class PASCALIMPLEMENTATION TOvcDbPictureLabel : public Ovcplb::TOvcCustomPictureLabel
{
	typedef Ovcplb::TOvcCustomPictureLabel inherited;
	
protected:
	Vcl::Dbctrls::TFieldDataLink* FDataLink;
	TShowDateOrTime FShowDateOrTime;
	System::UnicodeString __fastcall GetDataField(void);
	Data::Db::TDataSource* __fastcall GetDataSource(void);
	Data::Db::TField* __fastcall GetField(void);
	void __fastcall SetDataField(const System::UnicodeString Value);
	void __fastcall SetDataSource(Data::Db::TDataSource* Value);
	void __fastcall SetShowDateOrTime(TShowDateOrTime Value);
	void __fastcall plDataChange(System::TObject* Sender);
	void __fastcall plGetFieldValue(void);
	MESSAGE void __fastcall CMGetDataLink(Winapi::Messages::TMessage &Msg);
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	virtual void __fastcall Paint(void);
	DYNAMIC System::UnicodeString __fastcall plGetSampleDisplayData(void);
	
public:
	__fastcall virtual TOvcDbPictureLabel(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcDbPictureLabel(void);
	DYNAMIC bool __fastcall ExecuteAction(System::Classes::TBasicAction* Action);
	virtual bool __fastcall UpdateAction(System::Classes::TBasicAction* Action);
	__property Data::Db::TField* Field = {read=GetField};
	
__published:
	__property System::UnicodeString DataField = {read=GetDataField, write=SetDataField};
	__property Data::Db::TDataSource* DataSource = {read=GetDataSource, write=SetDataSource};
	__property TShowDateOrTime ShowDateOrTime = {read=FShowDateOrTime, write=SetShowDateOrTime, nodefault};
	__property Anchors = {default=3};
	__property Constraints;
	__property DragKind = {default=0};
	__property About = {default=0};
	__property Align = {default=0};
	__property Alignment;
	__property AutoSize;
	__property Color = {default=-16777211};
	__property DragCursor = {default=-12};
	__property DragMode = {default=0};
	__property Enabled = {default=1};
	__property Font;
	__property FontAngle;
	__property OriginX;
	__property OriginY;
	__property ParentColor = {default=1};
	__property ParentShowHint = {default=1};
	__property PictureMask = {default=0};
	__property PopupMenu;
	__property ShadowColor;
	__property ShadowedText;
	__property ShowHint;
	__property Transparent;
	__property UseIntlMask;
	__property Visible = {default=1};
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDrag;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnStartDrag;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbplb */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBPLB)
using namespace Ovcdbplb;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbplbHPP
