// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctccustomedt.pas' rev: 27.00 (Windows)

#ifndef OvctccustomedtHPP
#define OvctccustomedtHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovcstr.hpp>	// Pascal unit
#include <ovctcstr.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctccustomedt
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOVCTCCustomEdt;
class PASCALIMPLEMENTATION TOVCTCCustomEdt : public Vcl::Stdctrls::TCustomEdit
{
	typedef Vcl::Stdctrls::TCustomEdit inherited;
	
private:
	Ovctcell::TOvcBaseTableCell* FCellOwner;
	System::Sysutils::TSysCharSet FValidChars;
	
protected:
	virtual bool __fastcall IsValidText(const System::UnicodeString AText);
	DYNAMIC void __fastcall KeyPress(System::WideChar &Key);
	MESSAGE void __fastcall WMGetDlgCode(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Winapi::Messages::TWMKey &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	MESSAGE void __fastcall WMPaste(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Winapi::Messages::TWMSetFocus &Msg);
	
public:
	__property Ovctcell::TOvcBaseTableCell* CellOwner = {read=FCellOwner, write=FCellOwner};
	__property System::Sysutils::TSysCharSet ValidChars = {read=FValidChars, write=FValidChars};
public:
	/* TCustomEdit.Create */ inline __fastcall virtual TOVCTCCustomEdt(System::Classes::TComponent* AOwner) : Vcl::Stdctrls::TCustomEdit(AOwner) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOVCTCCustomEdt(HWND ParentWindow) : Vcl::Stdctrls::TCustomEdit(ParentWindow) { }
	/* TWinControl.Destroy */ inline __fastcall virtual ~TOVCTCCustomEdt(void) { }
	
};


class DELPHICLASS TOVCTCInt;
class PASCALIMPLEMENTATION TOVCTCInt : public TOVCTCCustomEdt
{
	typedef TOVCTCCustomEdt inherited;
	
public:
	__fastcall virtual TOVCTCInt(System::Classes::TComponent* AOwner);
public:
	/* TWinControl.CreateParented */ inline __fastcall TOVCTCInt(HWND ParentWindow) : TOVCTCCustomEdt(ParentWindow) { }
	/* TWinControl.Destroy */ inline __fastcall virtual ~TOVCTCInt(void) { }
	
};


class DELPHICLASS TOvcTCCustomControl;
class PASCALIMPLEMENTATION TOvcTCCustomControl : public Ovctcstr::TOvcTCBaseString
{
	typedef Ovctcstr::TOvcTCBaseString inherited;
	
private:
	System::TObject* FCellEditorBuffer;
	System::Uitypes::TEditCharCase FCharCase;
	int FMaxLength;
	Vcl::Extctrls::TTimer* FTimer;
	void __fastcall OnTimer(System::TObject* Sender);
	
protected:
	TOVCTCCustomEdt* FEdit;
	System::UnicodeString FString;
	virtual Vcl::Controls::TWinControl* __fastcall DoCreateControl(void) = 0 ;
	virtual void __fastcall DoDataToControl(Vcl::Controls::TWinControl* const AControl, void * Data);
	virtual Vcl::Controls::TControl* __fastcall GetCellEditor(void);
	__property System::Uitypes::TEditCharCase CharCase = {read=FCharCase, write=FCharCase, nodefault};
	__property int MaxLength = {read=FMaxLength, write=FMaxLength, nodefault};
	
public:
	__fastcall virtual TOvcTCCustomControl(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTCCustomControl(void);
	virtual NativeUInt __fastcall EditHandle(void);
	virtual void __fastcall EditHide(void);
	virtual void __fastcall EditMove(const System::Types::TRect &CellRect);
	virtual void __fastcall SaveEditedData(void * Data);
	virtual void __fastcall StartEditing(int RowNum, int ColNum, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, Ovctcmmn::TOvcTblEditorStyle CellStyle, void * Data);
	virtual void __fastcall StopEditing(bool SaveValue, void * Data);
	__property System::UnicodeString StringValue = {read=FString};
	
__published:
	__property Adjust;
	__property Color;
	__property Font;
	__property DataStringType = {default=2};
	__property UseASCIIZStrings = {default=1};
};


class DELPHICLASS TOvcTCCustomStr;
class PASCALIMPLEMENTATION TOvcTCCustomStr : public TOvcTCCustomControl
{
	typedef TOvcTCCustomControl inherited;
	
private:
	System::WideChar FPasswordChar;
	System::Sysutils::TSysCharSet FValidChars;
	
protected:
	virtual Vcl::Controls::TWinControl* __fastcall DoCreateControl(void);
	System::WideChar __fastcall get_PasswordChar(void);
	void __fastcall set_PasswordChar(const System::WideChar Value);
	
public:
	void __fastcall StringToData(const System::UnicodeString AValue, void * &Data, Ovctcmmn::TOvcCellDataPurpose Purpose);
	__property System::Sysutils::TSysCharSet ValidChars = {read=FValidChars, write=FValidChars};
	
__published:
	__property CharCase;
	__property System::WideChar PasswordChar = {read=get_PasswordChar, write=set_PasswordChar, nodefault};
	__property MaxLength;
public:
	/* TOvcTCCustomControl.Create */ inline __fastcall virtual TOvcTCCustomStr(System::Classes::TComponent* AOwner) : TOvcTCCustomControl(AOwner) { }
	/* TOvcTCCustomControl.Destroy */ inline __fastcall virtual ~TOvcTCCustomStr(void) { }
	
};


class DELPHICLASS TOvcTCCustomInt;
class PASCALIMPLEMENTATION TOvcTCCustomInt : public TOvcTCCustomControl
{
	typedef TOvcTCCustomControl inherited;
	
private:
	bool FHideZero;
	int __fastcall get_IntegerValue(void);
	
protected:
	virtual Vcl::Controls::TWinControl* __fastcall DoCreateControl(void);
	
public:
	void __fastcall IntToData(const int AValue, void * &Data, Ovctcmmn::TOvcCellDataPurpose Purpose);
	__property int IntegerValue = {read=get_IntegerValue, nodefault};
	
__published:
	__property MaxLength;
	__property bool HideZero = {read=FHideZero, write=FHideZero, nodefault};
public:
	/* TOvcTCCustomControl.Create */ inline __fastcall virtual TOvcTCCustomInt(System::Classes::TComponent* AOwner) : TOvcTCCustomControl(AOwner) { }
	/* TOvcTCCustomControl.Destroy */ inline __fastcall virtual ~TOvcTCCustomInt(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctccustomedt */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCCUSTOMEDT)
using namespace Ovctccustomedt;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctccustomedtHPP
