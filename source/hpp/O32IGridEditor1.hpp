// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'O32IGridEditor1.pas' rev: 27.00 (Windows)

#ifndef O32igrideditor1HPP
#define O32igrideditor1HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.ComCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.CheckLst.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcsc.hpp>	// Pascal unit
#include <o32flxbn.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcsf.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <ovcftcbx.hpp>	// Pascal unit
#include <ovcclrcb.hpp>	// Pascal unit
#include <o32igrid.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace O32igrideditor1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TIGridCmpEd;
class PASCALIMPLEMENTATION TIGridCmpEd : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Comctrls::TTreeView* TreeView1;
	O32flxbn::TO32FlexButton* O32FlexButton1;
	Vcl::Stdctrls::TButton* OkButton;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TEdit* CaptionEdit;
	Vcl::Extctrls::TPanel* StringPanel;
	Vcl::Extctrls::TPanel* ParentPanel;
	Vcl::Extctrls::TPanel* IntegerPanel;
	Vcl::Extctrls::TPanel* FloatPanel;
	Vcl::Extctrls::TPanel* ColorPanel;
	Vcl::Extctrls::TPanel* FontPanel;
	Vcl::Extctrls::TPanel* ListPanel;
	Vcl::Extctrls::TPanel* SetPanel;
	Vcl::Extctrls::TPanel* LogicalPanel;
	Vcl::Extctrls::TPanel* DatePanel;
	Vcl::Extctrls::TPanel* CurrencyPanel;
	Vcl::Stdctrls::TLabel* ParentChildCount;
	Vcl::Stdctrls::TLabel* ParentVisibleChildren;
	Vcl::Stdctrls::TLabel* ParentHiddenChildren;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Stdctrls::TEdit* ParentDisplayTextEdit;
	Vcl::Stdctrls::TLabel* Label6;
	Vcl::Stdctrls::TCheckBox* ItemVisible;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Stdctrls::TLabel* TypeLbl;
	Vcl::Checklst::TCheckListBox* SetListBox;
	Vcl::Stdctrls::TLabel* Label8;
	Vcl::Stdctrls::TLabel* SetDisplayText;
	Vcl::Stdctrls::TLabel* Label9;
	Vcl::Stdctrls::TComboBox* ListItems;
	Vcl::Stdctrls::TEdit* StringDisplayText;
	Vcl::Stdctrls::TLabel* Label10;
	Vcl::Stdctrls::TLabel* Label11;
	Ovcsf::TOvcSimpleField* IntegerValue;
	Vcl::Stdctrls::TLabel* Label12;
	Ovcsf::TOvcSimpleField* FloatValue;
	Vcl::Stdctrls::TLabel* Label13;
	Ovcsf::TOvcSimpleField* CurrencyEdit;
	Vcl::Stdctrls::TLabel* Label14;
	Vcl::Comctrls::TDateTimePicker* DatePicker;
	Vcl::Stdctrls::TLabel* Label15;
	Vcl::Stdctrls::TLabel* Label16;
	Vcl::Stdctrls::TComboBox* LogicalValue;
	Vcl::Stdctrls::TLabel* Label17;
	Ovcftcbx::TOvcFontComboBox* FontCombo;
	Ovcclrcb::TOvcColorComboBox* ColorCombo;
	Vcl::Stdctrls::TEdit* SetItem;
	Vcl::Stdctrls::TGroupBox* ImageBox;
	Vcl::Extctrls::TImage* Image1;
	Vcl::Buttons::TSpeedButton* ClearImageBtn;
	Ovcsc::TOvcSpinner* OvcSpinner1;
	Vcl::Menus::TPopupMenu* PopupMenu;
	Vcl::Menus::TMenuItem* Delete1;
	void __fastcall OkButtonClick(System::TObject* Sender);
	void __fastcall O32FlexButton1Click(System::TObject* Sender, int Item);
	void __fastcall SetChange(System::TObject* Sender);
	void __fastcall TreeView1Change(System::TObject* Sender, Vcl::Comctrls::TTreeNode* Node);
	void __fastcall TreeView1KeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall TreeView1KeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall OvcSpinner1Click(System::TObject* Sender, Ovcsc::TOvcSpinState State, double Delta, bool Wrap);
	void __fastcall ListItemsKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall SetListBoxKeyDown(System::TObject* Sender, System::Word &Key, System::Classes::TShiftState Shift);
	void __fastcall SetListBoxClickCheck(System::TObject* Sender);
	void __fastcall SetItemKeyPress(System::TObject* Sender, System::WideChar &Key);
	void __fastcall Delete1Click(System::TObject* Sender);
	void __fastcall ClearImageBtnClick(System::TObject* Sender);
	
private:
	bool OutlineLoading;
	bool ItemLoading;
	bool Changed;
	O32igrid::TO32InspectorItem* CurrentItem;
	void __fastcall LoadOutline(void);
	void __fastcall LoadChildrenOf(int &Index, Vcl::Comctrls::TTreeNode* Node);
	void __fastcall LoadItem(void);
	void __fastcall LoadImage(void);
	void __fastcall UpdateItem(void);
	int __fastcall GetChildCount(void);
	
public:
	O32igrid::TO32CustomInspectorGrid* Grid;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TIGridCmpEd(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TIGridCmpEd(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TIGridCmpEd(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TIGridCmpEd(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TO32InspectorGridEditor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TO32InspectorGridEditor : public Designeditors::TDefaultEditor
{
	typedef Designeditors::TDefaultEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TO32InspectorGridEditor(System::Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TO32InspectorGridEditor(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace O32igrideditor1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_O32IGRIDEDITOR1)
using namespace O32igrideditor1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// O32igrideditor1HPP
