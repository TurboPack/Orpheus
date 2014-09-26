// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcclkdg.pas' rev: 27.00 (Windows)

#ifndef OvcclkdgHPP
#define OvcclkdgHPP

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
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcconst.hpp>	// Pascal unit
#include <ovcdata.hpp>	// Pascal unit
#include <ovcexcpt.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit
#include <ovcclock.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcclkdg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmClockDlg;
class PASCALIMPLEMENTATION TOvcfrmClockDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TButton* btnCancel;
	Ovcclock::TOvcClock* OvcClock1;
	Ovcbase::TOvcController* OvcController1;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmClockDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmClockDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmClockDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmClockDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcClockDialog;
class PASCALIMPLEMENTATION TOvcClockDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	Ovcclock::TOvcClock* FClock;
	Vcl::Graphics::TBitmap* __fastcall GetClockFace(void);
	void __fastcall SetClockFace(Vcl::Graphics::TBitmap* Value);
	
public:
	__fastcall virtual TOvcClockDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcClockDialog(void);
	virtual bool __fastcall Execute(void);
	__property Ovcclock::TOvcClock* Clock = {read=FClock};
	
__published:
	__property Caption = {default=0};
	__property Vcl::Graphics::TBitmap* ClockFace = {read=GetClockFace, write=SetClockFace};
	__property Font;
	__property Icon;
	__property Options;
	__property Placement;
	__property OnHelpClick;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcclkdg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCCLKDG)
using namespace Ovcclkdg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcclkdgHPP
