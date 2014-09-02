// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcflded.pas' rev: 27.00 (Windows)

#ifndef OvcfldedHPP
#define OvcfldedHPP

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
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcrptvw.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcflded
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TfrmOvcRvFldEd;
class PASCALIMPLEMENTATION TfrmOvcRvFldEd : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TListBox* ListBox1;
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Vcl::Extctrls::TPanel* Panel6;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Stdctrls::TLabel* Label5;
	Vcl::Stdctrls::TLabel* Label6;
	Vcl::Stdctrls::TLabel* Label7;
	Vcl::Stdctrls::TLabel* Label8;
	Vcl::Stdctrls::TLabel* Label9;
	Vcl::Stdctrls::TEdit* edtExpression;
	Ovccmbx::TOvcComboBox* cbxField;
	Ovccmbx::TOvcComboBox* cbxOp;
	Ovccmbx::TOvcComboBox* cbxFunc;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TEdit* edtName;
	Vcl::Stdctrls::TEdit* edtCaption;
	Vcl::Stdctrls::TEdit* edtHint;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TLabel* Label10;
	Vcl::Stdctrls::TLabel* Label11;
	Ovccmbx::TOvcComboBox* ComboBox1;
	Vcl::Stdctrls::TLabel* Label12;
	Vcl::Stdctrls::TLabel* Label13;
	Vcl::Stdctrls::TEdit* edtWidth;
	Vcl::Stdctrls::TEdit* edtPrintWidth;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Stdctrls::TButton* btnCancel;
	Vcl::Stdctrls::TButton* btnNewField;
	Vcl::Stdctrls::TButton* btnDelete;
	Vcl::Stdctrls::TLabel* Label14;
	Vcl::Stdctrls::TLabel* Label15;
	void __fastcall btnNewFieldClick(System::TObject* Sender);
	void __fastcall ListBox1Click(System::TObject* Sender);
	void __fastcall btnOKClick(System::TObject* Sender);
	void __fastcall cbxFieldClick(System::TObject* Sender);
	void __fastcall cbxOpClick(System::TObject* Sender);
	void __fastcall cbxFuncClick(System::TObject* Sender);
	void __fastcall btnDeleteClick(System::TObject* Sender);
	void __fastcall edtNameExit(System::TObject* Sender);
	
private:
	Ovcrptvw::TOvcRvField* FEditField;
	void __fastcall SelectField(const System::UnicodeString FieldName);
	void __fastcall SetEditField(Ovcrptvw::TOvcRvField* const Value);
	
public:
	Ovcrptvw::TOvcCustomReportView* EditReportView;
	void __fastcall PopulateList(void);
	void __fastcall PopulateFieldCombo(void);
	__property Ovcrptvw::TOvcRvField* EditField = {read=FEditField, write=SetEditField};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TfrmOvcRvFldEd(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TfrmOvcRvFldEd(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TfrmOvcRvFldEd(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TfrmOvcRvFldEd(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcflded */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCFLDED)
using namespace Ovcflded;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcfldedHPP
