// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcdbadg.pas' rev: 27.00 (Windows)

#ifndef OvcdbadgHPP
#define OvcdbadgHPP

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
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Bde.DBTables.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit
#include <Vcl.FileCtrl.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcdbadg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmAliasDlg;
class PASCALIMPLEMENTATION TOvcfrmAliasDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Stdctrls::TButton* btnCancel;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Stdctrls::TEdit* edTableName;
	Vcl::Stdctrls::TComboBox* cbAliasList;
	Vcl::Filectrl::TFileListBox* FileListBox1;
	Vcl::Dialogs::TOpenDialog* OpenDialog1;
	Vcl::Stdctrls::TButton* btnBrowse;
	void __fastcall edTableNameChange(System::TObject* Sender);
	void __fastcall FileListBox1Change(System::TObject* Sender);
	void __fastcall btnBrowseClick(System::TObject* Sender);
	void __fastcall cbAliasListChange(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall FileListBox1DblClick(System::TObject* Sender);
	
public:
	System::UnicodeString FTableName;
	System::UnicodeString FAliasName;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmAliasDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmAliasDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmAliasDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmAliasDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcDbAliasDialog;
class PASCALIMPLEMENTATION TOvcDbAliasDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	System::UnicodeString FAliasName;
	System::UnicodeString FTableName;
	System::UnicodeString __fastcall GetPath(void);
	System::UnicodeString __fastcall GetTableName(void);
	
public:
	__fastcall virtual TOvcDbAliasDialog(System::Classes::TComponent* AOwner);
	virtual bool __fastcall Execute(void);
	
__published:
	__property Caption = {default=0};
	__property Font;
	__property Icon;
	__property Options;
	__property Placement;
	__property System::UnicodeString AliasName = {read=FAliasName, write=FAliasName};
	__property System::UnicodeString Path = {read=GetPath};
	__property System::UnicodeString TableName = {read=GetTableName};
	__property OnHelpClick;
public:
	/* TOvcBaseDialog.Destroy */ inline __fastcall virtual ~TOvcDbAliasDialog(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
extern DELPHI_PACKAGE System::UnicodeString __fastcall ExpandAlias(const System::UnicodeString Alias);
}	/* namespace Ovcdbadg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCDBADG)
using namespace Ovcdbadg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcdbadgHPP
