// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovccmdp1.pas' rev: 27.00 (Windows)

#ifndef Ovccmdp1HPP
#define Ovccmdp1HPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovccmdp1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmScanOrder;
class PASCALIMPLEMENTATION TOvcfrmScanOrder : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TListBox* lbCommands;
	Vcl::Buttons::TBitBtn* btnUp;
	Vcl::Buttons::TBitBtn* bntDown;
	Vcl::Buttons::TBitBtn* btnOk;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Extctrls::TPanel* pnlCmdTables;
	Vcl::Buttons::TBitBtn* btnCancel;
	void __fastcall btnUpClick(System::TObject* Sender);
	void __fastcall bntDownClick(System::TObject* Sender);
	void __fastcall FormCreate(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmScanOrder(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmScanOrder(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmScanOrder(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmScanOrder(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovccmdp1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCCMDP1)
using namespace Ovccmdp1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovccmdp1HPP
