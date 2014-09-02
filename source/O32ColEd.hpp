// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'o32coled.pas' rev: 27.00 (Windows)

#ifndef O32coledHPP
#define O32coledHPP

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
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcspeed.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace O32coled
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TProtectedSelectionList;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TProtectedSelectionList : public Designintf::TDesignerSelections
{
	typedef Designintf::TDesignerSelections inherited;
	
public:
	/* TDesignerSelections.Create */ inline __fastcall virtual TProtectedSelectionList(void) : Designintf::TDesignerSelections() { }
	/* TDesignerSelections.Copy */ inline __fastcall TProtectedSelectionList(const Designintf::_di_IDesignerSelections Selections) : Designintf::TDesignerSelections(Selections) { }
	/* TDesignerSelections.Destroy */ inline __fastcall virtual ~TProtectedSelectionList(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TO32frmCollEditor;
class PASCALIMPLEMENTATION TO32frmCollEditor : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TListBox* ListBox1;
	Vcl::Extctrls::TPanel* Panel1;
	Ovcspeed::TOvcSpeedButton* btnAdd;
	Ovcspeed::TOvcSpeedButton* btnDelete;
	Ovcspeed::TOvcSpeedButton* btnMoveUp;
	Ovcspeed::TOvcSpeedButton* btnMoveDown;
	void __fastcall btnAddClick(System::TObject* Sender);
	void __fastcall btnDeleteClick(System::TObject* Sender);
	void __fastcall btnMoveUpClick(System::TObject* Sender);
	void __fastcall btnMoveDownClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall FormClose(System::TObject* Sender, System::Uitypes::TCloseAction &Action);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall ListBox1KeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	
private:
	void __fastcall FillGrid(void);
	void __fastcall SelectComponentList(Designintf::TDesignerSelections* SelList);
	MESSAGE void __fastcall OmPropChange(Winapi::Messages::TMessage &Msg);
	
public:
	Ovcbase::TO32Collection* Collection;
	Designintf::_di_IDesigner Designer;
	bool InInLined;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TO32frmCollEditor(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TO32frmCollEditor(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TO32frmCollEditor(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TO32frmCollEditor(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TO32CollectionEditor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TO32CollectionEditor : public Designeditors::TPropertyEditor
{
	typedef Designeditors::TPropertyEditor inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
	virtual System::UnicodeString __fastcall GetValue(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TO32CollectionEditor(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TPropertyEditor(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TO32CollectionEditor(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE void __fastcall ShowO32CollectionEditor(Designintf::_di_IDesigner Designer, Ovcbase::TO32Collection* Collection, bool InInLined);
}	/* namespace O32coled */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_O32COLED)
using namespace O32coled;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// O32coledHPP
