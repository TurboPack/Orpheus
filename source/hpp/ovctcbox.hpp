// CodeGear C++Builder
// Copyright (c) 1995, 2014 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ovctcbox.pas' rev: 27.00 (Windows)

#ifndef OvctcboxHPP
#define OvctcboxHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <Winapi.Windows.hpp>	// Pascal unit
#include <System.SysUtils.hpp>	// Pascal unit
#include <Vcl.Graphics.hpp>	// Pascal unit
#include <System.Classes.hpp>	// Pascal unit
#include <Vcl.Controls.hpp>	// Pascal unit
#include <Vcl.StdCtrls.hpp>	// Pascal unit
#include <ovctcmmn.hpp>	// Pascal unit
#include <ovctcell.hpp>	// Pascal unit
#include <ovctgres.hpp>	// Pascal unit
#include <ovctcgly.hpp>	// Pascal unit
#include <ovcmisc.hpp>	// Pascal unit
#include <System.Types.hpp>	// Pascal unit
#include <System.UITypes.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Ovctcbox
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOvcTCCustomCheckBox;
class PASCALIMPLEMENTATION TOvcTCCustomCheckBox : public Ovctcgly::TOvcTCCustomGlyph
{
	typedef Ovctcgly::TOvcTCCustomGlyph inherited;
	
protected:
	bool FAllowGrayed;
	int FatherValue;
	void __fastcall SetAllowGrayed(bool AG);
	HIDESBASE void __fastcall GlyphsHaveChanged(System::TObject* Sender);
	virtual void __fastcall tcPaint(Vcl::Graphics::TCanvas* TableCanvas, const System::Types::TRect &CellRect, int RowNum, int ColNum, const Ovctcmmn::TOvcCellAttributes &CellAttr, void * Data);
	
public:
	__fastcall virtual TOvcTCCustomCheckBox(System::Classes::TComponent* AOwner);
	virtual bool __fastcall CanAssignGlyphs(Ovctgres::TOvcCellGlyphs* CBG);
	virtual void __fastcall SaveEditedData(void * Data);
	virtual void __fastcall StartEditing(int RowNum, int ColNum, const System::Types::TRect &CellRect, const Ovctcmmn::TOvcCellAttributes &CellAttr, Ovctcmmn::TOvcTblEditorStyle CellStyle, void * Data);
	virtual void __fastcall StopEditing(bool SaveValue, void * Data);
	__property bool AllowGrayed = {read=FAllowGrayed, write=SetAllowGrayed, nodefault};
public:
	/* TOvcTCCustomGlyph.Destroy */ inline __fastcall virtual ~TOvcTCCustomCheckBox(void) { }
	
};


class DELPHICLASS TOvcTCCheckBox;
class PASCALIMPLEMENTATION TOvcTCCheckBox : public TOvcTCCustomCheckBox
{
	typedef TOvcTCCustomCheckBox inherited;
	
__published:
	__property AcceptActivationClick = {default=1};
	__property Access = {default=0};
	__property Adjust = {default=0};
	__property AllowGrayed = {default=0};
	__property CellGlyphs;
	__property Color;
	__property Hint = {default=0};
	__property Margin = {default=4};
	__property ShowHint = {default=0};
	__property Table;
	__property TableColor = {default=1};
	__property OnClick;
	__property OnDragDrop;
	__property OnDragOver;
	__property OnEndDrag;
	__property OnEnter;
	__property OnExit;
	__property OnKeyDown;
	__property OnKeyPress;
	__property OnKeyUp;
	__property OnMouseDown;
	__property OnMouseMove;
	__property OnMouseUp;
	__property OnOwnerDraw;
public:
	/* TOvcTCCustomCheckBox.Create */ inline __fastcall virtual TOvcTCCheckBox(System::Classes::TComponent* AOwner) : TOvcTCCustomCheckBox(AOwner) { }
	
public:
	/* TOvcTCCustomGlyph.Destroy */ inline __fastcall virtual ~TOvcTCCheckBox(void) { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Ovctcbox */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_OVCTCBOX)
using namespace Ovctcbox;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// OvctcboxHPP
