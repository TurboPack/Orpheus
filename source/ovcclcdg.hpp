// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcclcdg.pas' rev: 27.00 (Windows)

#ifndef OvcclcdgHPP
#define OvcclcdgHPP

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
#include <ovccalc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcclcdg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmCalculatorDlg;
class PASCALIMPLEMENTATION TOvcfrmCalculatorDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Stdctrls::TButton* btnOK;
	Vcl::Stdctrls::TButton* btnCancel;
	Ovccalc::TOvcCalculator* OvcCalculator1;
	void __fastcall FormShow(System::TObject* Sender);
	
public:
	double Value;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmCalculatorDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmCalculatorDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmCalculatorDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmCalculatorDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcCalculatorDialog;
class PASCALIMPLEMENTATION TOvcCalculatorDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	Ovccalc::TOvcCalculator* FCalculator;
	double FValue;
	
public:
	__fastcall virtual TOvcCalculatorDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcCalculatorDialog(void);
	virtual bool __fastcall Execute(void);
	__property Ovccalc::TOvcCalculator* Calculator = {read=FCalculator};
	
__published:
	__property Caption = {default=0};
	__property Font;
	__property Icon;
	__property Options;
	__property Placement;
	__property double Value = {read=FValue, write=FValue};
	__property OnHelpClick;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcclcdg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCCLCDG)
using namespace Ovcclcdg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcclcdgHPP
