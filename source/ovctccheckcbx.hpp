// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctccheckcbx.pas' rev: 27.00 (Windows)

#ifndef OvctccheckcbxHPP
#define OvctccheckcbxHPP

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
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <ovccklb.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <ovctcstr.hpp>	// Pascal unit
#include <Vcl.Themes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctccheckcbx
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcPopupWindow;
class PASCALIMPLEMENTATION TOvcPopupWindow : public Vcl::Forms::TCustomForm
{
	typedef Vcl::Forms::TCustomForm inherited;
	
private:
	HWND FPrevActiveWindow;
	System::Uitypes::TCloseAction FCloseAction;
	Vcl::Forms::TFormBorderStyle FBorderStyle;
	bool FCancelled;
	void __fastcall SetCloseAction(const System::Uitypes::TCloseAction Value);
	HIDESBASE void __fastcall SetBorderStyle(const Vcl::Forms::TBorderStyle Value);
	
protected:
	DYNAMIC void __fastcall Deactivate(void);
	DYNAMIC void __fastcall InitializeNewForm(void);
	DYNAMIC void __fastcall DoClose(System::Uitypes::TCloseAction &Action);
	virtual void __fastcall CreateParams(Vcl::Controls::TCreateParams &Params);
	
public:
	HIDESBASE MESSAGE void __fastcall WMActivate(Winapi::Messages::TWMActivate &Message);
	MESSAGE void __fastcall WMActivateApp(Winapi::Messages::TWMActivateApp &Message);
	void __fastcall Popup(const System::Types::TPoint &P);
	DYNAMIC bool __fastcall IsShortCut(Winapi::Messages::TWMKey &Message);
	__fastcall virtual TOvcPopupWindow(System::Classes::TComponent* AOwner);
	__property System::Uitypes::TCloseAction CloseAction = {read=FCloseAction, write=SetCloseAction, nodefault};
	
__published:
	__property Vcl::Forms::TBorderStyle BorderStyle = {read=FBorderStyle, write=SetBorderStyle, default=1};
	__property OnClose;
	__property bool Cancelled = {read=FCancelled, nodefault};
	__property Visible = {default=0};
public:
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcPopupWindow(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TCustomForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcPopupWindow(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcPopupWindow(HWND ParentWindow) : Vcl::Forms::TCustomForm(ParentWindow) { }
	
};


class DELPHICLASS TCellCheckComboBoxItem;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TCellCheckComboBoxItem : public System::Classes::TCollectionItem
{
	typedef System::Classes::TCollectionItem inherited;
	
private:
	System::UnicodeString FValue;
	System::UnicodeString FDisplayValue;
	System::UnicodeString FDisplayValueShort;
	void __fastcall SetDisplayValue(const System::UnicodeString Value);
	void __fastcall SetDisplayValueShort(const System::UnicodeString Value);
	void __fastcall SetValue(const System::UnicodeString Value);
	
public:
	virtual void __fastcall Assign(System::Classes::TPersistent* Source);
	
__published:
	__property System::UnicodeString DisplayValue = {read=FDisplayValue, write=SetDisplayValue};
	__property System::UnicodeString DisplayValueShort = {read=FDisplayValueShort, write=SetDisplayValueShort};
	__property System::UnicodeString Value = {read=FValue, write=SetValue};
public:
	/* TCollectionItem.Create */ inline __fastcall virtual TCellCheckComboBoxItem(System::Classes::TCollection* Collection) : System::Classes::TCollectionItem(Collection) { }
	/* TCollectionItem.Destroy */ inline __fastcall virtual ~TCellCheckComboBoxItem(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TCellCheckComboBoxItems;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TCellCheckComboBoxItems : public System::Classes::TOwnedCollection
{
	typedef System::Classes::TOwnedCollection inherited;
	
public:
	TCellCheckComboBoxItem* operator[](int Index) { return Items[Index]; }
	
private:
	HIDESBASE TCellCheckComboBoxItem* __fastcall GetItem(int Index);
	HIDESBASE void __fastcall SetItem(int Index, TCellCheckComboBoxItem* const Value);
	
protected:
	__fastcall TCellCheckComboBoxItems(Vcl::Controls::TControl* const AOwner);
	virtual void __fastcall Update(System::Classes::TCollectionItem* Item);
	
public:
	HIDESBASE TCellCheckComboBoxItem* __fastcall Add(void)/* overload */;
	HIDESBASE TCellCheckComboBoxItem* __fastcall Add(System::UnicodeString DisplayName, System::UnicodeString DisplayNameShort, System::UnicodeString Value)/* overload */;
	__property TCellCheckComboBoxItem* Items[int Index] = {read=GetItem, write=SetItem/*, default*/};
	__fastcall TCellCheckComboBoxItems(void);
public:
	/* TCollection.Destroy */ inline __fastcall virtual ~TCellCheckComboBoxItems(void) { }
	
};

#pragma pack(pop)

struct DECLSPEC_DRECORD TCellCheckComboBoxInfo
{
public:
	TCellCheckComboBoxItems* RTItems;
	System::Classes::TStrings* CheckedItems;
	System::UnicodeString TextHint;
};


typedef TCellCheckComboBoxInfo *PCellCheckComboBoxInfo;

class DELPHICLASS TOvcTCCheckComboBoxEdit;
class PASCALIMPLEMENTATION TOvcTCCheckComboBoxEdit : public Vcl::Controls::TCustomControl
{
	typedef Vcl::Controls::TCustomControl inherited;
	
private:
	Ovctcell::TOvcBaseTableCell* FCell;
	TOvcPopupWindow* FDropDown;
	Ovccklb::TOvcCheckList* FCheckList;
	TCellCheckComboBoxItems* FItems;
	bool FIsDroppedDown;
	unsigned FCloseTime;
	bool FInUpdate;
	Ovccklb::TOvcStateChangeEvent FOnStateChange;
	Ovctcmmn::TOvcCellAttributes FCellAttr;
	int FDropDownCount;
	System::Classes::TStrings* FCheckedItems;
	void __fastcall ShowDropDown(void);
	void __fastcall SetItems(TCellCheckComboBoxItems* const Value);
	void __fastcall DropDownClose(System::TObject* Sender, System::Uitypes::TCloseAction &Action);
	void __fastcall CheckListStateChange(System::TObject* Sender, int Index, Vcl::Stdctrls::TCheckBoxState OldState, Vcl::Stdctrls::TCheckBoxState NewState);
	void __fastcall CheckedItemsChange(System::TObject* Sender);
	void __fastcall SetOnStateChange(const Ovccklb::TOvcStateChangeEvent Value);
	__classmethod void __fastcall DrawButton(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect);
	void __fastcall DrawBackground(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, bool Focused);
	__classmethod void __fastcall DrawText(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, bool Focused, TCellCheckComboBoxItems* Items, System::Classes::TStrings* const CheckedItems);
	void __fastcall SetCellAttr(const Ovctcmmn::TOvcCellAttributes &Value);
	void __fastcall SetDropDownCount(const int Value);
	void __fastcall SetCheckedItems(System::Classes::TStrings* const Value);
	void __fastcall CheckListMouseMove(System::TObject* Sender, System::Classes::TShiftState Shift, int X, int Y);
	bool __fastcall GetMultiCheck(void);
	void __fastcall SetMultiCheck(const bool Value);
	
protected:
	virtual void __fastcall Paint(void);
	DYNAMIC void __fastcall MouseDown(System::Uitypes::TMouseButton Button, System::Classes::TShiftState Shift, int X, int Y);
	virtual void __fastcall DoOnStateChange(int Index, Vcl::Stdctrls::TCheckBoxState OldState, Vcl::Stdctrls::TCheckBoxState NewState);
	HIDESBASE MESSAGE void __fastcall CMFocusChanged(Vcl::Controls::TCMFocusChanged &Message);
	
public:
	__fastcall virtual TOvcTCCheckComboBoxEdit(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTCCheckComboBoxEdit(void);
	MESSAGE void __fastcall CMRelease(Winapi::Messages::TMessage &Message);
	__property Ovctcmmn::TOvcCellAttributes CellAttr = {read=FCellAttr, write=SetCellAttr};
	HIDESBASE MESSAGE void __fastcall WMKillFocus(Winapi::Messages::TWMKillFocus &Msg);
	HIDESBASE MESSAGE void __fastcall WMSetFocus(Winapi::Messages::TWMSetFocus &Msg);
	__property Ovctcell::TOvcBaseTableCell* CellOwner = {read=FCell, write=FCell};
	
__published:
	__property TCellCheckComboBoxItems* Items = {read=FItems, write=SetItems};
	__property System::Classes::TStrings* CheckedItems = {read=FCheckedItems, write=SetCheckedItems};
	__property Ovccklb::TOvcStateChangeEvent OnStateChange = {read=FOnStateChange, write=SetOnStateChange};
	__property int DropDownCount = {read=FDropDownCount, write=SetDropDownCount, default=8};
	__property bool MultiCheck = {read=GetMultiCheck, write=SetMultiCheck, default=1};
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcTCCheckComboBoxEdit(HWND ParentWindow) : Vcl::Controls::TCustomControl(ParentWindow) { }
	
};


class DELPHICLASS TOvcTCCustomCheckComboBox;
class PASCALIMPLEMENTATION TOvcTCCustomCheckComboBox : public Ovctcstr::TOvcTCBaseString
{
	typedef Ovctcstr::TOvcTCBaseString inherited;
	
protected:
	int FDropDownCount;
	TOvcTCCheckComboBoxEdit* FEdit;
	TCellCheckComboBoxItems* FItems;
	System::Word FMaxLength;
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
	bool FMultiCheck;
	System::UnicodeString FTextHint;
	void __fastcall SetItems(TCellCheckComboBoxItems* const Value);
	void __fastcall SetMultiCheck(const bool Value);
	void __fastcall SetTextHint(const System::UnicodeString Value);
	
protected:
	virtual Vcl::Controls::TControl* __fastcall GetCellEditor(void);
	void __fastcall DrawArrow(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr);
	void __fastcall DrawButton(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect);
	void __fastcall DrawBackground(Vcl::Graphics::TCanvas* Canvas, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr);
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	__property int DropDownCount = {read=FDropDownCount, write=FDropDownCount, nodefault};
	__property bool HideButton = {read=FHideButton, write=FHideButton, nodefault};
	__property TCellCheckComboBoxItems* Items = {read=FItems, write=SetItems};
	__property bool UseRunTimeItems = {read=FUseRunTimeItems, write=FUseRunTimeItems, nodefault};
	__property System::Classes::TNotifyEvent OnChange = {read=FOnChange, write=FOnChange};
	__property System::Classes::TNotifyEvent OnDropDown = {read=FOnDropDown, write=FOnDropDown};
	__property Vcl::Stdctrls::TDrawItemEvent OnDrawItem = {read=FOnDrawItem, write=FOnDrawItem};
	__property Vcl::Stdctrls::TMeasureItemEvent OnMeasureItem = {read=FOnMeasureItem, write=FOnMeasureItem};
	__property bool MultiCheck = {read=FMultiCheck, write=SetMultiCheck, default=1};
	__property System::UnicodeString TextHint = {read=FTextHint, write=SetTextHint};
	
public:
	__fastcall virtual TOvcTCCustomCheckComboBox(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcTCCustomCheckComboBox(void);
	virtual TOvcTCCheckComboBoxEdit* __fastcall CreateEditControl(void);
	virtual NativeUInt __fastcall EditHandle(void);
	virtual void __fastcall EditHide(void);
	virtual void __fastcall EditMove(const System::Types::TRect &CellRect);
	virtual void __fastcall SaveEditedData(void * Data);
	virtual void __fastcall StartEditing(int RowNum, int ColNum, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, Ovctcmmn::TOvcTblEditorStyle CellStyle, void * Data);
	virtual void __fastcall StopEditing(bool SaveValue, void * Data);
};


class DELPHICLASS TOvcTCCheckComboBox;
class PASCALIMPLEMENTATION TOvcTCCheckComboBox : public TOvcTCCustomCheckComboBox
{
	typedef TOvcTCCustomCheckComboBox inherited;
	
__published:
	__property AcceptActivationClick = {default=1};
	__property Access = {default=0};
	__property Adjust = {default=0};
	__property Color;
	__property DropDownCount = {default=8};
	__property Font;
	__property HideButton = {default=0};
	__property Hint = {default=0};
	__property Items;
	__property ShowHint = {default=0};
	__property Margin = {default=4};
	__property MultiCheck = {default=1};
	__property Table;
	__property TableColor = {default=1};
	__property TableFont = {default=1};
	__property TextHiColor = {default=-16777196};
	__property TextStyle = {default=0};
	__property UseRunTimeItems = {default=0};
	__property TextHint = {default=0};
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
	/* TOvcTCCustomCheckComboBox.Create */ inline __fastcall virtual TOvcTCCheckComboBox(System::Classes::TComponent* AOwner) : TOvcTCCustomCheckComboBox(AOwner) { }
	/* TOvcTCCustomCheckComboBox.Destroy */ inline __fastcall virtual ~TOvcTCCheckComboBox(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctccheckcbx */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCCHECKCBX)
using namespace Ovctccheckcbx;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctccheckcbxHPP
