// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbtb0.pas' rev: 27.00 (Windows)

#ifndef Ovcdbtb0HPP
#define Ovcdbtb0HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcpb.hpp>	// Pascal unit
#include <ovcpf.hpp>	// Pascal unit
#include <ovcnf.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <ovcdbtbl.hpp>	// Pascal unit
#include <ovctbcls.hpp>	// Pascal unit
#include <ovctable.hpp>	// Pascal unit
#include <ovcsf.hpp>	// Pascal unit
#include <ovcsc.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbtb0
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmDbColEditor;
class PASCALIMPLEMENTATION TOvcfrmDbColEditor : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Ovcsf::TOvcSimpleField* ctlColNumber;
	Vcl::Stdctrls::TComboBox* ctlCell;
	Vcl::Stdctrls::TCheckBox* ctlHidden;
	Ovcsf::TOvcSimpleField* ctlWidth;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Buttons::TSpeedButton* btnPrev;
	Vcl::Buttons::TSpeedButton* btnNext;
	Vcl::Buttons::TSpeedButton* btnFirst;
	Vcl::Buttons::TSpeedButton* btnLast;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Ovcbase::TOvcController* DefaultController;
	Ovcsc::TOvcSpinner* OvcSpinner1;
	Ovcsc::TOvcSpinner* OvcSpinner2;
	Vcl::Stdctrls::TEdit* edFieldType;
	Vcl::Stdctrls::TEdit* edFieldName;
	Vcl::Stdctrls::TEdit* edDataType;
	Vcl::Stdctrls::TEdit* edDataSize;
	Vcl::Buttons::TBitBtn* btnProperties;
	Vcl::Stdctrls::TButton* btnApply;
	Vcl::Stdctrls::TButton* btnClose;
	void __fastcall btnApplyClick(System::TObject* Sender);
	void __fastcall btnCloseClick(System::TObject* Sender);
	void __fastcall btnFirstClick(System::TObject* Sender);
	void __fastcall btnLastClick(System::TObject* Sender);
	void __fastcall btnNextClick(System::TObject* Sender);
	void __fastcall btnPrevClick(System::TObject* Sender);
	void __fastcall btnPropertiesClick(System::TObject* Sender);
	void __fastcall ctlColNumberChange(System::TObject* Sender);
	void __fastcall ctlColNumberExit(System::TObject* Sender);
	void __fastcall FormClose(System::TObject* Sender, System::Uitypes::TCloseAction &Action);
	void __fastcall FormShow(System::TObject* Sender);
	
private:
	Ovctbcls::TOvcTableColumns* FCols;
	int FColNum;
	int CurCellIndex;
	System::Classes::TStringList* Cells;
	Ovcdbtbl::TOvcDbTableOptionSet Ops;
	
protected:
	void __fastcall AddCellComponentName(const System::UnicodeString S);
	void __fastcall GetCells(void);
	void __fastcall RefreshColData(void);
	void __fastcall SetColNum(int C);
	
public:
	System::TObject* Editor;
	void __fastcall SetCols(Ovctbcls::TOvcTableColumns* CS);
	__property Ovctbcls::TOvcTableColumns* Cols = {read=FCols, write=SetCols};
	__property int ColNum = {read=FColNum, write=SetColNum, nodefault};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmDbColEditor(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmDbColEditor(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmDbColEditor(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmDbColEditor(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcDbTableColumnProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcDbTableColumnProperty : public Designeditors::TClassProperty
{
	typedef Designeditors::TClassProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TOvcDbTableColumnProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TClassProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TOvcDbTableColumnProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcdbtb0 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBTB0)
using namespace Ovcdbtb0;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovcdbtb0HPP
