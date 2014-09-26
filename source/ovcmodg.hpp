// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcmodg.pas' rev: 27.00 (Windows)

#ifndef OvcmodgHPP
#define OvcmodgHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcmodg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmMemoDlg;
class PASCALIMPLEMENTATION TOvcfrmMemoDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TMemo* Memo;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Stdctrls::TButton* btnCancel;
	Vcl::Stdctrls::TLabel* lblReadOnly;
	void __fastcall FormCloseQuery(System::TObject* Sender, bool &CanClose);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmMemoDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmMemoDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmMemoDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmMemoDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcMemoDialog;
class PASCALIMPLEMENTATION TOvcMemoDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	System::Classes::TStrings* FLines;
	Vcl::Graphics::TFont* FMemoFont;
	bool FReadOnly;
	bool FWordWrap;
	void __fastcall SetLines(System::Classes::TStrings* Value);
	void __fastcall SetMemoFont(Vcl::Graphics::TFont* Value);
	
public:
	__fastcall virtual TOvcMemoDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcMemoDialog(void);
	virtual bool __fastcall Execute(void);
	
__published:
	__property Caption = {default=0};
	__property Font;
	__property Icon;
	__property Options;
	__property Placement;
	__property System::Classes::TStrings* Lines = {read=FLines, write=SetLines};
	__property Vcl::Graphics::TFont* MemoFont = {read=FMemoFont, write=SetMemoFont};
	__property bool ReadOnly = {read=FReadOnly, write=FReadOnly, default=0};
	__property bool WordWrap = {read=FWordWrap, write=FWordWrap, default=1};
	__property OnHelpClick;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcmodg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCMODG)
using namespace Ovcmodg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcmodgHPP
