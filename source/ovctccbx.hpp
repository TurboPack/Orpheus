// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctccbx.pas' rev: 27.00 (Windows)

#ifndef OvctccbxHPP
#define OvctccbxHPP

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
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <ovctcstr.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctccbx
{
//-- type declarations -------------------------------------------------------
enum DECLSPEC_DENUM TOvcTCComboBoxState : unsigned char { otlbsUp, otlbsDown };

class DELPHICLASS TOvcTCComboBoxEdit;
class PASCALIMPLEMENTATION TOvcTCComboBoxEdit : public Vcl::Stdctrls::TCustomComboBox
{
	typedef Vcl::Stdctrls::TCustomComboBox inherited;
	
protected:
	Ovctcell::TOvcBaseTableCell* FCell;
	HWND EditField;
	void *PrevEditWndProc;
	void *NewEditWndProc;
	void __fastcall EditWindowProc(Winapi::Messages::TMessage &Msg);
	bool __fastcall FilterWMKEYDOWN(Winapi::Messages::TWMKey &Msg);
	MESSAGE void __fastcall CMRelease(Winapi::Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WMChar(Winapi::Messages::TWMKey &Msg);
	HIDESBASE MESSAGE void __fastcall WMGetDlgCode(Winapi::Messages::TMessage &Msg);
	HIDESBASE MESSAGE void __fastcall WMKeyDown(Winapi::Messages::TWMKey &Msg);
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Winapi::Messages::TWMSetFocus &Msg);
	
public:
	__fastcall virtual TOvcTCComboBoxEdit(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTCComboBoxEdit(void);
	virtual void __fastcall CreateWnd(void);
	__property Ovctcell::TOvcBaseTableCell* CellOwner = {read=FCell, write=FCell};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcTCComboBoxEdit(HWND ParentWindow) : Vcl::Stdctrls::TCustomComboBox(ParentWindow) { }
	
};


class DELPHICLASS TOvcTCCustomComboBox;
class PASCALIMPLEMENTATION TOvcTCCustomComboBox : public Ovctcstr::TOvcTCBaseString
{
	typedef Ovctcstr::TOvcTCBaseString inherited;
	
protected:
	int FDropDownCount;
	TOvcTCComboBoxEdit* FEdit;
	System::Classes::TStrings* FItems;
	System::Word FMaxLength;
	Vcl::Stdctrls::TComboBoxStyle FStyle;
	bool FAutoAdvanceChar;
	bool FAutoAdvanceLeftRight;
	bool FHideButton;
	bool FSaveStringValue;
	bool FSorted;
	bool FShowArrow;
	bool FUseRunTimeItems;
	System::Classes::TNotifyEvent FOnChange;
	System::Classes::TNotifyEvent FOnDropDown;
	Vcl::Stdctrls::TDrawItemEvent FOnDrawItem;
	Vcl::Stdctrls::TMeasureItemEvent FOnMeasureItem;
	
private:
	System::UnicodeString FTextHint;
	void __fastcall SetTextHint(const System::UnicodeString Value);
	
protected:
	virtual Vcl::Controls::TControl* __fastcall GetCellEditor(void);
	void __fastcall SetShowArrow(bool Value);
	void __fastcall SetItems(System::Classes::TStrings* I);
	void __fastcall SetSorted(bool S);
	void __fastcall DrawArrow(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr);
	void __fastcall DrawButton(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect);
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	__property bool AutoAdvanceChar = {read=FAutoAdvanceChar, write=FAutoAdvanceChar, nodefault};
	__property bool AutoAdvanceLeftRight = {read=FAutoAdvanceLeftRight, write=FAutoAdvanceLeftRight, nodefault};
	__property int DropDownCount = {read=FDropDownCount, write=FDropDownCount, nodefault};
	__property bool HideButton = {read=FHideButton, write=FHideButton, nodefault};
	__property System::Classes::TStrings* Items = {read=FItems, write=SetItems};
	__property System::Word MaxLength = {read=FMaxLength, write=FMaxLength, nodefault};
	__property bool SaveStringValue = {read=FSaveStringValue, write=FSaveStringValue, nodefault};
	__property bool Sorted = {read=FSorted, write=SetSorted, nodefault};
	__property bool ShowArrow = {read=FShowArrow, write=SetShowArrow, nodefault};
	__property Vcl::Stdctrls::TComboBoxStyle Style = {read=FStyle, write=FStyle, nodefault};
	__property bool UseRunTimeItems = {read=FUseRunTimeItems, write=FUseRunTimeItems, nodefault};
	__property System::UnicodeString TextHint = {read=FTextHint, write=SetTextHint};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::Classes::TNotifyEvent OnDropDown = {read=FOnDropDown, write=FOnDropDown};
	__property Vcl::Stdctrls::TDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property Vcl::Stdctrls::TMeasureItemEvent OnMeasureItem = {read=FOnMeasureItem, write=FOnMeasureItem};
	
public:
	__fastcall virtual TOvcTCCustomComboBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTCCustomComboBox(void);
	virtual TOvcTCComboBoxEdit* __fastcall CreateEditControl(void);
	virtual NativeUInt __fastcall EditHandle(void);
	virtual void __fastcall EditHide(void);
	virtual void __fastcall EditMove(const System::Types::TRect &CellRect);
	virtual void __fastcall SaveEditedData(void * Data);
	virtual void __fastcall StartEditing(int RowNum, int ColNum, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, Ovctcmmn::TOvcTblEditorStyle CellStyle, void * Data);
	virtual void __fastcall StopEditing(bool SaveValue, void * Data);
};


class DELPHICLASS TOvcTCComboBox;
class PASCALIMPLEMENTATION TOvcTCComboBox : public TOvcTCCustomComboBox
{
	typedef TOvcTCCustomComboBox inherited;
	
__published:
	__property AcceptActivationClick = {default=1};
	__property Access = {default=0};
	__property Adjust = {default=0};
	__property AutoAdvanceChar = {default=0};
	__property AutoAdvanceLeftRight = {default=0};
	__property Color;
	__property DropDownCount = {default=8};
	__property Font;
	__property HideButton = {default=0};
	__property Hint = {default=0};
	__property Items;
	__property ShowHint = {default=0};
	__property Margin = {default=4};
	__property MaxLength = {default=0};
	__property SaveStringValue = {default=0};
	__property ShowArrow = {default=0};
	__property Sorted = {default=0};
	__property Style = {default=0};
	__property Table;
	__property TableColor = {default=1};
	__property TableFont = {default=1};
	__property TextHiColor = {default=-16777196};
	__property TextStyle = {default=0};
	__property TextHint = {default=0};
	__property UseRunTimeItems = {default=0};
	__property OnChange;
	__property OnClick;
	__property OnDblClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnDrawItem;
	__property OnDropDown;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMeasureItem;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnOwnerDraw;
public:
	/* TOvcTCCustomComboBox.Create */ inline __fastcall virtual TOvcTCComboBox(System::Classes::TComponent* AOwner) : TOvcTCCustomComboBox(AOwner) { }
	/* TOvcTCCustomComboBox.Destroy */ inline __fastcall virtual ~TOvcTCComboBox(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE Vcl::Graphics::TBitmap* OvcComboBoxBitmap;
extern DELPHI_PACKAGE int OvcComboBoxButtonWidth;
}	/* namespace Ovctccbx */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCCBX)
using namespace Ovctccbx;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctccbxHPP
