// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovclbl0.pas' rev: 27.00 (Windows)

#ifndef Ovclbl0HPP
#define Ovclbl0HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.Menus.hpp>	// Pascal unit
#include <System.IniFiles.hpp>	// Pascal unit
#include <ovclbl2.hpp>	// Pascal unit
#include <System.TypInfo.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <ovcclrcb.hpp>	// Pascal unit
#include <ovclabel.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovclbl0
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmOvcLabel;
class PASCALIMPLEMENTATION TfrmOvcLabel : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Extctrls::TPanel* Panel1;
	Ovclabel::TOvcLabel* OvcLabel;
	Vcl::Stdctrls::TButton* Button1;
	Vcl::Stdctrls::TButton* Button2;
	Vcl::Extctrls::TPanel* Panel2;
	Vcl::Stdctrls::TComboBox* SchemeCb;
	Vcl::Stdctrls::TButton* SaveAsBtn;
	Vcl::Stdctrls::TButton* DeleteBtn;
	Vcl::Extctrls::TPanel* Panel3;
	Vcl::Extctrls::TRadioGroup* GraduateRg;
	Vcl::Extctrls::TRadioGroup* ShadowRg;
	Vcl::Extctrls::TRadioGroup* HighlightRg;
	Ovcclrcb::TOvcColorComboBox* FromColorCcb;
	Ovcclrcb::TOvcColorComboBox* HighlightColorCcb;
	Ovcclrcb::TOvcColorComboBox* ShadowColorCcb;
	Vcl::Stdctrls::TLabel* HighlightDirectionLbl;
	Vcl::Stdctrls::TLabel* ShadowDirectionLbl;
	Ovcclrcb::TOvcColorComboBox* FontColorCcb;
	Vcl::Extctrls::TPanel* Panel4;
	Vcl::Stdctrls::TScrollBar* FontSizeSb;
	Vcl::Stdctrls::TLabel* FontSizeLbl;
	Vcl::Stdctrls::TLabel* HighlightDepthLbl;
	Vcl::Stdctrls::TLabel* ShadowDepthLbl;
	Vcl::Stdctrls::TScrollBar* ShadowDepthSb;
	Vcl::Stdctrls::TScrollBar* HighlightDepthSb;
	Vcl::Stdctrls::TComboBox* AppearanceCb;
	Vcl::Stdctrls::TComboBox* ColorSchemeCb;
	Ovcbase::TOvcController* OvcController1;
	void __fastcall FontSizeSbChange(System::TObject* Sender);
	void __fastcall HighlightDepthSbChange(System::TObject* Sender);
	void __fastcall ShadowDepthSbChange(System::TObject* Sender);
	void __fastcall GraduateRgClick(System::TObject* Sender);
	void __fastcall HighlightRgClick(System::TObject* Sender);
	void __fastcall ShadowRgClick(System::TObject* Sender);
	void __fastcall FromColorCcbChange(System::TObject* Sender);
	void __fastcall HighlightColorCcbChange(System::TObject* Sender);
	void __fastcall ShadowColorCcbChange(System::TObject* Sender);
	void __fastcall FontColorCcbChange(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall SaveAsBtnClick(System::TObject* Sender);
	void __fastcall DeleteBtnClick(System::TObject* Sender);
	void __fastcall SchemeCbChange(System::TObject* Sender);
	void __fastcall AppearanceCbChange(System::TObject* Sender);
	void __fastcall ColorSchemeCbChange(System::TObject* Sender);
	
public:
	Ovclbl2::TOvcDirectionPicker* HighlightDirectionDp;
	Ovclbl2::TOvcDirectionPicker* ShadowDirectionDp;
	bool SettingScheme;
	bool SettingCb;
	void __fastcall DeleteScheme(const System::UnicodeString S);
	void __fastcall HighlightDirectionChange(System::TObject* Sender);
	void __fastcall ShadowDirectionChange(System::TObject* Sender);
	void __fastcall SchemeChange(void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmOvcLabel(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmOvcLabel(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmOvcLabel(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmOvcLabel(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcLabelEditor;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcLabelEditor : public Designeditors::TDefaultEditor
{
	typedef Designeditors::TDefaultEditor inherited;
	
public:
	virtual void __fastcall ExecuteVerb(int Index);
	virtual System::UnicodeString __fastcall GetVerb(int Index);
	virtual int __fastcall GetVerbCount(void);
public:
	/* TComponentEditor.Create */ inline __fastcall virtual TOvcLabelEditor(System::Classes::TComponent* AComponent, Designintf::_di_IDesigner ADesigner) : Designeditors::TDefaultEditor(AComponent, ADesigner) { }
	
public:
	/* TObject.Destroy */ inline __fastcall virtual ~TOvcLabelEditor(void) { }
	
};

#pragma pack(pop)

class DELPHICLASS TOvcCustomSettingsProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcCustomSettingsProperty : public Designeditors::TClassProperty
{
	typedef Designeditors::TClassProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TOvcCustomSettingsProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TClassProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TOvcCustomSettingsProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE bool __fastcall EditOvcLabel(Ovclabel::TOvcLabel* L);
}	/* namespace Ovclbl0 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCLBL0)
using namespace Ovclbl0;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovclbl0HPP
