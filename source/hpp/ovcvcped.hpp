// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcvcped.pas' rev: 27.00 (Windows)

#ifndef OvcvcpedHPP
#define OvcvcpedHPP

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
#include <ovcbase.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcpb.hpp>	// Pascal unit
#include <ovcnf.hpp>	// Pascal unit
#include <ovcrptvw.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcvcped
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmViewCEd;
class PASCALIMPLEMENTATION TfrmViewCEd : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Buttons::TBitBtn* btnOk;
	Vcl::Buttons::TBitBtn* btnCancel;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TListBox* ListBox1;
	Vcl::Stdctrls::TCheckBox* chkTotals;
	Vcl::Stdctrls::TCheckBox* chkGroupBy;
	Vcl::Stdctrls::TCheckBox* chkShowHint;
	Vcl::Stdctrls::TCheckBox* chkAllowResize;
	Vcl::Stdctrls::TEdit* edtWidth;
	Vcl::Stdctrls::TEdit* edtPrintWidth;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TComboBox* cbxMeasure;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Extctrls::TBevel* Bevel2;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Stdctrls::TEdit* edtAgg;
	Vcl::Stdctrls::TLabel* Label6;
	Ovccmbx::TOvcComboBox* cbxField;
	Vcl::Stdctrls::TLabel* Label7;
	Ovccmbx::TOvcComboBox* cbxOp;
	Vcl::Stdctrls::TLabel* Label8;
	Ovccmbx::TOvcComboBox* cbxFunc;
	Vcl::Extctrls::TBevel* Bevel3;
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall chkTotalsClick(System::TObject* Sender);
	void __fastcall edtWidthChange(System::TObject* Sender);
	void __fastcall edtPrintWidthChange(System::TObject* Sender);
	void __fastcall chkShowHintClick(System::TObject* Sender);
	void __fastcall chkAllowResizeClick(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall cbxMeasureChange(System::TObject* Sender);
	void __fastcall cbxFieldClick(System::TObject* Sender);
	void __fastcall cbxOpClick(System::TObject* Sender);
	void __fastcall cbxFuncClick(System::TObject* Sender);
	void __fastcall edtAggChange(System::TObject* Sender);
	void __fastcall btnOkClick(System::TObject* Sender);
	
private:
	bool InLoad;
	int __fastcall CurrentToTwips(const System::UnicodeString S);
	System::UnicodeString __fastcall TwipsToCurrent(int T);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmViewCEd(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmViewCEd(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmViewCEd(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmViewCEd(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcvcped */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCVCPED)
using namespace Ovcvcped;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcvcpedHPP
