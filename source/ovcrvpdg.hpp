// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcrvpdg.pas' rev: 27.00 (Windows)

#ifndef OvcrvpdgHPP
#define OvcrvpdgHPP

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
#include <ovcbase.hpp>	// Pascal unit
#include <ovcprcbx.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcrptvw.hpp>	// Pascal unit
#include <ovccmbx.hpp>	// Pascal unit
#include <ovcrvcbx.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit
#include <Vcl.Printers.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcrvpdg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmRptVwPrintDlg;
class DELPHICLASS TOvcRvPrintDialog;
class PASCALIMPLEMENTATION TOvcfrmRptVwPrintDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Ovcrvcbx::TOvcViewComboBox* OvcViewComboBox1;
	Vcl::Extctrls::TRadioGroup* RadioGroup1;
	Ovcprcbx::TOvcPrinterComboBox* OvcPrinterComboBox1;
	Ovcbase::TOvcAttachedLabel* OvcPrinterComboBox1Label1;
	Ovcbase::TOvcAttachedLabel* OvcViewComboBox1Label1;
	Vcl::Stdctrls::TButton* btnOk;
	Vcl::Stdctrls::TButton* btnCancel;
	Vcl::Stdctrls::TButton* btnAbort;
	Vcl::Stdctrls::TLabel* lblPageText;
	Vcl::Stdctrls::TLabel* lblPageNumber;
	Vcl::Stdctrls::TCheckBox* chkSelected;
	Vcl::Extctrls::TBevel* Bevel1;
	Vcl::Stdctrls::TButton* btnHelp;
	Vcl::Extctrls::TRadioGroup* RadioGroup2;
	Vcl::Stdctrls::TButton* btnPreview;
	void __fastcall btnOkClick(System::TObject* Sender);
	void __fastcall btnAbortClick(System::TObject* Sender);
	void __fastcall OvcViewComboBox1Change(System::TObject* Sender);
	void __fastcall btnHelpClick(System::TObject* Sender);
	void __fastcall btnPreviewClick(System::TObject* Sender);
	
private:
	void __fastcall SetProperties(void);
	
public:
	TOvcRvPrintDialog* Comp;
	Ovcrptvw::TRVPrintMode Mode;
	bool Aborting;
	void __fastcall PrintStatus(System::TObject* Sender, int Page, bool &Abort);
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmRptVwPrintDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmRptVwPrintDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmRptVwPrintDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmRptVwPrintDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


enum DECLSPEC_DENUM TOvcRvPOption : unsigned char { rdShowPrinterCombo, rdShowViewCombo, rdShowGroupControl, rdShowSelectedCheckbox, rdShowHelp };

typedef System::Set<TOvcRvPOption, TOvcRvPOption::rdShowPrinterCombo, TOvcRvPOption::rdShowHelp> TOvcRvPOptions;

class PASCALIMPLEMENTATION TOvcRvPrintDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	System::UnicodeString FCaption;
	System::Uitypes::TPrinterOrientation FDefaultOrientation;
	TOvcRvPOptions FOptions;
	Ovcrptvw::TOvcCustomReportView* FReportView;
	bool FSelectedCheckedInit;
	virtual void __fastcall Notification(System::Classes::TComponent* AComponent, System::Classes::TOperation Operation);
	
public:
	__fastcall virtual TOvcRvPrintDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcRvPrintDialog(void);
	__property bool SelectedCheckedInit = {read=FSelectedCheckedInit, write=FSelectedCheckedInit, nodefault};
	virtual bool __fastcall Execute(void);
	
__published:
	__property System::UnicodeString Caption = {read=FCaption, write=FCaption};
	__property System::Uitypes::TPrinterOrientation DefaultOrientation = {read=FDefaultOrientation, write=FDefaultOrientation, default=0};
	__property TOvcRvPOptions Options = {read=FOptions, write=FOptions, default=15};
	__property Ovcrptvw::TOvcCustomReportView* ReportView = {read=FReportView, write=FReportView};
	__property Font;
	__property Icon;
	__property Placement;
	__property OnHelpClick;
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcrvpdg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCRVPDG)
using namespace Ovcrvpdg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcrvpdgHPP
