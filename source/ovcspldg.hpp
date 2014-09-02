// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovcspldg.pas' rev: 27.00 (Windows)

#ifndef OvcspldgHPP
#define OvcspldgHPP

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
#include <Vcl.ExtCtrls.hpp>	// Pascal unit
#include <ovcdlg.hpp>	// Pascal unit
#include <ovcbase.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovcspldg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcfrmSplashDlg;
class DELPHICLASS TOvcSplashDialog;
class PASCALIMPLEMENTATION TOvcfrmSplashDlg : public Vcl::Forms::TForm
{
	typedef Vcl::Forms::TForm inherited;
	
__published:
	Vcl::Extctrls::TImage* Image;
	Vcl::Extctrls::TTimer* Timer;
	void __fastcall TimerTimer(System::TObject* Sender);
	
protected:
	virtual void __fastcall CreateParams(Vcl::Controls::TCreateParams &Params);
	
private:
	TOvcSplashDialog* Dialog;
public:
	/* TCustomForm.Create */ inline __fastcall virtual TOvcfrmSplashDlg(System::Classes::TComponent* AOwner) : Vcl::Forms::TForm(AOwner) { }
	/* TCustomForm.CreateNew */ inline __fastcall virtual TOvcfrmSplashDlg(System::Classes::TComponent* AOwner, int Dummy) : Vcl::Forms::TForm(AOwner, Dummy) { }
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TOvcfrmSplashDlg(void) { }
	
public:
	/* TWinControl.CreateParented */ inline __fastcall TOvcfrmSplashDlg(HWND ParentWindow) : Vcl::Forms::TForm(ParentWindow) { }
	
};


class PASCALIMPLEMENTATION TOvcSplashDialog : public Ovcdlg::TOvcBaseDialog
{
	typedef Ovcdlg::TOvcBaseDialog inherited;
	
protected:
	bool FActive;
	int FDelay;
	Vcl::Graphics::TPicture* FPictureHiRes;
	Vcl::Graphics::TPicture* FPictureLoRes;
	bool FStayOnTop;
	bool FVisible;
	System::Classes::TNotifyEvent FOnClick;
	System::Classes::TNotifyEvent FOnClose;
	System::Classes::TNotifyEvent FOnDblClick;
	TOvcfrmSplashDlg* Splash;
	System::Classes::TNotifyEvent sdSavedOnCreate;
	void __fastcall SetHiResPicture(Vcl::Graphics::TPicture* Value);
	void __fastcall SetLoResPicture(Vcl::Graphics::TPicture* Value);
	void __fastcall SetVisible(bool Value);
	void __fastcall DoOnClick(System::TObject* Sender);
	void __fastcall DoOnCreate(System::TObject* Sender);
	void __fastcall DoOnDblClick(System::TObject* Sender);
	
public:
	__fastcall virtual TOvcSplashDialog(System::Classes::TComponent* AOwner);
	__fastcall virtual ~TOvcSplashDialog(void);
	virtual bool __fastcall Execute(void);
	void __fastcall Close(void);
	void __fastcall Show(void);
	__property bool Visible = {read=FVisible, write=SetVisible, nodefault};
	
__published:
	__property Placement;
	__property bool Active = {read=FActive, write=FActive, default=1};
	__property int Delay = {read=FDelay, write=FDelay, default=0};
	__property Vcl::Graphics::TPicture* PictureHiRes = {read=FPictureHiRes, write=SetHiResPicture};
	__property Vcl::Graphics::TPicture* PictureLoRes = {read=FPictureLoRes, write=SetLoResPicture};
	__property bool StayOnTop = {read=FStayOnTop, write=FStayOnTop, default=1};
	__property System::Classes::TNotifyEvent OnClick = {read=FOnClick, write=FOnClick};
	__property System::Classes::TNotifyEvent OnClose = {read=FOnClose, write=FOnClose};
	__property System::Classes::TNotifyEvent OnDblClick = {read=FOnDblClick, write=FOnDblClick};
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovcspldg */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCSPLDG)
using namespace Ovcspldg;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvcspldgHPP
