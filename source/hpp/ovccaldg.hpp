// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovccaldg.pas' rev: 27.00 (Windows)

#ifndef OvccaldgHPP
#define OvccaldgHPP

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
#include <ovccal.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovccaldg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmCalendarDlg;
class PASCALIMPLEMENTATION TOvcfrmCalendarDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Stdctrls::TButton* btnCancel;
	Ovccal::TOvcCalendar* OvcCalendar1;
	void __fastcall OvcCalendar1DblClick(System::TObject* Sender);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmCalendarDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmCalendarDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmCalendarDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmCalendarDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcCalendarDialog;
class PASCALIMPLEMENTATION TOvcCalendarDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	Ovccal::TOvcCalendar* FCalendar;
	
public:
	__fastcall virtual TOvcCalendarDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCalendarDialog(void);
	virtual bool __fastcall Execute(void);
	__property Ovccal::TOvcCalendar* Calendar = {read=FCalendar};
	
__published:
	__property Caption = {default=0};
	__property Font;
	__property Icon;
	__property Options;
	__property Placement;
	__property OnHelpClick;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovccaldg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCCALDG)
using namespace Ovccaldg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvccaldgHPP
