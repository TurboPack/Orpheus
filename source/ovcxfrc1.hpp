// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcxfrc1.pas' rev: 27.00 (Windows)

#ifndef Ovcxfrc1HPP
#define Ovcxfrc1HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Clipbrd.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcrlbl.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcnbk.hpp>	// Pascal unit
#include <ovclb.hpp>	// Pascal unit
#include <ovcedit.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcxfrc1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmTransfer;
class PASCALIMPLEMENTATION TOvcfrmTransfer : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Ovcnbk::TOvcNotebook* NB;
	Vcl::Stdctrls::TMemo* memoTransfer;
	Vcl::Stdctrls::TMemo* memoInitialize;
	Vcl::Stdctrls::TMemo* memoSample;
	Vcl::Stdctrls::TButton* btnClearAll;
	Vcl::Stdctrls::TButton* btnSelectAll;
	Vcl::Buttons::TBitBtn* btnCopyToClipboard;
	Vcl::Buttons::TBitBtn* btnClose;
	Vcl::Stdctrls::TCheckBox* cbInitialize;
	Vcl::Stdctrls::TCheckBox* cbTransfer;
	Vcl::Stdctrls::TCheckBox* cbSample;
	Vcl::Stdctrls::TGroupBox* gbGenerate;
	Ovclb::TOvcListBox* lbAllComponents;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Ovcbase::TOvcController* OvcController1;
	Vcl::Stdctrls::TLabel* Label4;
	Vcl::Stdctrls::TGroupBox* gbStringOptions;
	Vcl::Stdctrls::TRadioButton* rbString;
	Vcl::Stdctrls::TRadioButton* rbPChar;
	Vcl::Stdctrls::TRadioButton* rbShortString;
	Vcl::Stdctrls::TButton* btnGenerate;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall btnSelectAllClick(System::TObject* Sender);
	void __fastcall btnClearAllClick(System::TObject* Sender);
	void __fastcall SelectionChange(System::TObject* Sender);
	void __fastcall btnGenerateClick(System::TObject* Sender);
	void __fastcall btnCopyToClipboardClick(System::TObject* Sender);
	void __fastcall NBPageChanged(System::TObject* Sender, int Index);
	
public:
	System::Classes::TComponent* ComponentForm;
	System::Classes::TList* ComponentList;
	void __fastcall SetButtonStatus(void);
	void __fastcall SetInstructionText(void);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmTransfer(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmTransfer(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmTransfer(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmTransfer(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcxfrc1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCXFRC1)
using namespace Ovcxfrc1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovcxfrc1HPP
