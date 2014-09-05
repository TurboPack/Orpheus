// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctbpe1.pas' rev: 27.00 (Windows)

#ifndef Ovctbpe1HPP
#define Ovctbpe1HPP

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
#include <Vcl.Controls.hpp>	// Pascal unit
#include <DesignIntf.hpp>	// Pascal unit
#include <DesignEditors.hpp>	// Pascal unit
#include <Winapi.Messages.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.Forms.hpp>	// Pascal unit
#include <Vcl.Dialogs.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit
#include <ovcef.hpp>	// Pascal unit
#include <ovcpb.hpp>	// Pascal unit
#include <ovcnf.hpp>	// Pascal unit
#include <Vcl.Buttons.hpp>	// Pascal unit
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctable.hpp>	// Pascal unit
#include <ovctbrws.hpp>	// Pascal unit
#include <ovcsf.hpp>	// Pascal unit
#include <ovcsc.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctbpe1
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmRowEditor;
class PASCALIMPLEMENTATION TOvcfrmRowEditor : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Stdctrls::TCheckBox* ctlHidden;
	Vcl::Stdctrls::TRadioButton* ctlUseDefHeight;
	Vcl::Stdctrls::TRadioButton* ctlUseCustHeight;
	Vcl::Buttons::TBitBtn* DoneButton;
	Vcl::Extctrls::TPanel* Panel1;
	Vcl::Buttons::TSpeedButton* SpeedButton1;
	Vcl::Buttons::TSpeedButton* SpeedButton2;
	Vcl::Buttons::TSpeedButton* SpeedButton3;
	Vcl::Buttons::TSpeedButton* SpeedButton4;
	Vcl::Buttons::TSpeedButton* SpeedButton5;
	Vcl::Buttons::TSpeedButton* SpeedButton6;
	Vcl::Stdctrls::TLabel* Label1;
	Vcl::Stdctrls::TGroupBox* GroupBox1;
	Vcl::Stdctrls::TGroupBox* GroupBox2;
	Vcl::Stdctrls::TLabel* Label2;
	Vcl::Stdctrls::TLabel* Label3;
	Vcl::Buttons::TBitBtn* Reset;
	Ovcsf::TOvcSimpleField* ctlHeight;
	Ovcsf::TOvcSimpleField* ctlDefaultHeight;
	Ovcsf::TOvcSimpleField* ctlRowLimit;
	Ovcsf::TOvcSimpleField* ctlRowNumber;
	Vcl::Buttons::TBitBtn* ApplyButton;
	Ovcbase::TOvcController* DefaultController;
	Ovcsc::TOvcSpinner* OvcSpinner1;
	Ovcsc::TOvcSpinner* OvcSpinner2;
	Ovcsc::TOvcSpinner* OvcSpinner3;
	Ovcsc::TOvcSpinner* OvcSpinner4;
	void __fastcall ctlUseDefHeightClick(System::TObject* Sender);
	void __fastcall ctlUseCustHeightClick(System::TObject* Sender);
	void __fastcall SpeedButton1Click(System::TObject* Sender);
	void __fastcall SpeedButton2Click(System::TObject* Sender);
	void __fastcall SpeedButton3Click(System::TObject* Sender);
	void __fastcall SpeedButton4Click(System::TObject* Sender);
	void __fastcall SpeedButton5Click(System::TObject* Sender);
	void __fastcall SpeedButton6Click(System::TObject* Sender);
	void __fastcall ctlRowNumberExit(System::TObject* Sender);
	void __fastcall FormShow(System::TObject* Sender);
	void __fastcall ResetClick(System::TObject* Sender);
	void __fastcall ApplyButtonClick(System::TObject* Sender);
	void __fastcall DoneButtonClick(System::TObject* Sender);
	void __fastcall ctlRowNumberChange(System::TObject* Sender);
	
private:
	Ovctbrws::TOvcTableRows* FRows;
	int FRowNum;
	bool CurDefHt;
	
protected:
	void __fastcall RefreshRowData(void);
	void __fastcall SetRowNum(int R);
	
public:
	void __fastcall SetRows(Ovctbrws::TOvcTableRows* RS);
	__property Ovctbrws::TOvcTableRows* Rows = {read=FRows, write=SetRows};
	__property int RowNum = {read=FRowNum, write=SetRowNum, nodefault};
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmRowEditor(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmRowEditor(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmRowEditor(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmRowEditor(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class DELPHICLASS TOvcTableRowProperty;
#pragma pack(push,4)
class PASCALIMPLEMENTATION TOvcTableRowProperty : public Designeditors::TClassProperty
{
	typedef Designeditors::TClassProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Designintf::TPropertyAttributes __fastcall GetAttributes(void);
public:
	/* TPropertyEditor.Create */ inline __fastcall virtual TOvcTableRowProperty(const Designintf::_di_IDesigner ADesigner, int APropCount) : Designeditors::TClassProperty(ADesigner, APropCount) { }
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TOvcTableRowProperty(void) { }
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctbpe1 */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTBPE1)
using namespace Ovctbpe1;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// Ovctbpe1HPP
