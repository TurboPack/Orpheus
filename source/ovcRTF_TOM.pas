// Delphi interface unit for the windowless rich-edit control
// http://msdn.microsoft.com/library/en-us/shellcc/platform/commctls/richedit/windowlessricheditcontrols.asp

// Copyright © 2003-2006 Rob Kennedy. Some rights reserved.
// For license information, see http://www.cs.wisc.edu/~rkennedy/license

// This code was written using Delphi 5. It should not require any special
// features missing from previous versions, though, except for the obvious
// COM interface support. It should also work with later Delphi versions.

// License (http://www.cs.wisc.edu/~rkennedy/license @15.04.2013)
// Unless otherwise noted, I make the source code on this Web site (anything found within HTML <code> elements, which includes nearly
// everything labeled as a “listing”) available under a Creative Commons license that allows you to use the code in whatever projects
// you want so long as I get credit for the code I wrote (but you should read the license to be sure). That credit can be as little as
// mentioning my name in a comment in your own source code, but if you want to make a more public attribution, I won’t stand in your way.
//
// The text that accompanies the code is a different matter. For that, it’s “all rights reserved.”

unit ovcRTF_TOM;

interface

uses Windows, ActiveX, RichEdit, IMM;

const
  // These GUIDs come from the following newsgroup message.
  // 92gl2vcsn6ie92e71228cr2jkpvap9t6g6@4ax.com
  // Re: ITextServices (Microsoft Text Object Model)
  // comp.os.ms-windows.programmer.controls, comp.os.ms-windows.programmer.ole, comp.os.ms-windows.programmer.win32
  // Frederic Marchal (badibulgator@free.fr)
  // 2003-01-19 07:28:50 PST
  // http://groups.google.com/groups?selm=92gl2vcsn6ie92e71228cr2jkpvap9t6g6%404ax.com
  SID_ITextHost = '{c5bdd8d0-d26e-11ce-a89e-00aa006cadc5}';
  SID_ITextServices = '{8d33f740-cf58-11ce-a89d-00aa006cadc5}';
  IID_ITextHost: TGUID = SID_ITextHost;
  IID_ITextServices: TGUID = SID_ITextServices;

// The following declarations are based on the contents of the TextServ.h
// Windows SDK header file as of 26 March 2003.

type
  // These pointer types are missing from Borland's declarations.
  MYCHARFORMATW = record
    cbSize: UINT;
    dwMask: Integer;
    dwEffects: Integer;
    yHeight: Integer;
    yOffset: Integer;
    crTextColor: TColorRef;
    bCharSet: Byte;
    bPitchAndFamily: Byte;
    szFaceName: array[0..LF_FACESIZE - 1] of WideChar;
  end;
  TMyCharFormatW = MYCHARFORMATW;
  PCharFormatW = ^MYCHARFORMATW;

  PParaFormat = ^TParaFormat;

  TSizeL = TSize;
  TRectL = TRect;

  // For the en_RequestResize notification message
  PReqResize = ^TReqResize;
  TReqResize = packed record
    nmhdr: TNMHdr;
    rc: TRect;
  end;

const
  txtBit_RichText = 1;
  txtBit_Multiline = 2;
  txtBit_ReadOnly = 4;
  txtBit_ShowAccelerator = 8;
  txtBit_UsePassword = $10;
  txtBit_HideSelection = $20;
  txtBit_SaveSelection = $40;
  txtBit_AutoWordSel = $80;
  txtBit_Vertical = $100;
  txtBit_SelBarChange = $200;
  txtBit_WordWrap = $400;
  txtBit_AllowBeep = $800;
  txtBit_DisableDrag = $1000;
  txtBit_ViewInsetChange = $2000;
  txtBit_BackStyleChange = $4000;
  txtBit_MaxLengthChange = $8000;
  txtBit_ScrollBarChange = $10000;
  txtBit_CharFormatChange = $20000;
  txtBit_ParaFormatChange = $40000;
  txtBit_ExtentChange = $80000;
  txtBit_ClientRectChange = $100000;
  txtBit_UseCurrentBkg = $200000;

  txtNS_FitToContent = 1;
  txtNS_RoundToLine = 2;

type
  {$MINENUMSIZE 4}
  TTxtBackStyle = (txtBack_Transparent, txtBack_Opaque);
  TTxtView = (txtView_Active, txtView_Inactive);

  TTxDrawCallback = function(param: DWord): Bool; stdcall;

  ITextServices = interface
    [SID_ITextServices]
    function TxSendMessage(msg: UInt; wParam: wParam; lParam: lParam; out plresult: lResult): HResult; stdcall;
    function TxDraw(dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcBounds, lprcWBounds: TRectL; const lprcUpdate: TRect; pfnContinue: TTxDrawCallback; dwContinue: DWord; lViewID: TTxtView): HResult; stdcall;
    function TxGetHScroll(out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
    function TxGetVScroll(out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
    function OnTxSetCursor(dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer): HResult; stdcall;
    function TxQueryHitPoint(dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer; out pHitResult: DWord): HResult; stdcall;
    function OnTxInPlaceActivate(const prcClient: TRect): HResult; stdcall;
    function OnTxInPlaceDeactivate: HResult; stdcall;
    function OnTxUIActivate: HResult; stdcall;
    function OnTxUIDeactivate: HResult; stdcall;
    function TxGetText(out pbstrText: TBStr): HResult; stdcall;
    function TxSetText(pszText: PWideChar): HResult; stdcall;
    function TxGetCurTargetX(out px: Integer): HResult; stdcall;
    function TxGetBaselinePos(out pBaselinePos: Integer): HResult; stdcall;
    function TxGetNaturalSize(dwAspect: DWord; hdcDraw, hicTargetDev: HDC; ptd: PDVTargetDevice; dwMode: DWord; const psizelExtent: TSizeL; var pwidth, pheight: Integer): HResult; stdcall;
    function TxGetDropTarget(out ppDropTarget: IDropTarget): HResult; stdcall;
    function OnTxPropertyBitsChange(dwMask, dwBits: DWord): HResult; stdcall;
    function TxGetCachedSize(out pdwWidth, pdwHeight: DWord): HResult; stdcall;
  end;

  ITextHost = interface
    [SID_ITextHost]
    function TxGetDC: HDC; stdcall;
    function TxReleaseDC(hdc: HDC): Integer; stdcall;
    function TxShowScrollBar(fnBar: Integer; fShow: Bool): Bool; stdcall;
    function TxEnableScrollBar(fuSBFlags, fuArrowFlags: Integer): Bool; stdcall;
    function TxSetScrollRange(fnBar: Integer; nMinPos: Integer; nMaxPos: Integer; fRedraw: Bool): Bool; stdcall;
    function TxSetScrollPos(fnBar, nPos: Integer; fRedraw: Bool): Bool; stdcall;
    procedure TxInvalidateRect(const prc: TRect; fMode: Bool); stdcall;
    procedure TxViewChange(fUpdate: Bool); stdcall;
    function TxCreateCaret(hbmp: hBitmap; xWidth, yHeight: Integer): Bool; stdcall;
    function TxShowCaret(fShow: Bool): Bool; stdcall;
    function TxSetCaretPos(x, y: Integer): Bool; stdcall;
    function TxSetTimer(idTimer, uTimeout: UInt): Bool; stdcall;
    procedure TxKillTimer(idTimer: UInt); stdcall;
    procedure TxScrollWindowEx(dx, dy: Integer; const lprcScroll, lprcClip: TRect; hrgnUpdate: HRgn; fuScroll: UInt); stdcall;
    procedure TxSetCapture(fCapture: Bool); stdcall;
    procedure TxSetFocus; stdcall;
    procedure TxSetCursor(hcur: hCursor; fText: Bool); stdcall;
    function TxScreenToClient(var lppt: TPoint): Bool; stdcall;
    function TxClientToScreen(var lppt: TPoint): Bool; stdcall;
    function TxActivate(out lpOldState: Integer): HResult; stdcall;
    function TxDeactivate(lNewState: Integer): HResult; stdcall;
    function TxGetClientRect(out prc: TRect): HResult; stdcall;
    function TxGetViewInset(out prc: TRect): HResult; stdcall;
    function TxGetCharFormat(out ppCF: PCharFormatW): HResult; stdcall;
    function TxGetParaFormat(out ppPF: PParaFormat): HResult; stdcall;
    function TxGetSysColor(nIndex: Integer): TColorRef; stdcall;
    function TxGetBackStyle(out pstyle: TTxtBackStyle): HResult; stdcall;
    function TxGetMaxLength(out pLength: DWord): HResult; stdcall;
    function TxGetScrollBars(out pdwScrollBar: DWord): HResult; stdcall;
    function TxGetPasswordChar(out pch: {Wide}Char): HResult; stdcall;
    function TxGetAcceleratorPos(out pcp: Integer): HResult; stdcall;
    function TxGetExtent(out lpExtent: TSizeL): HResult; stdcall;
    function OnTxCharFormatChange(const pcf: TMyCharFormatW): HResult; stdcall;
    function OnTxParaFormatChange(const ppf: TParaFormat): HResult; stdcall;
    function TxGetPropertyBits(dwMask: DWord; out pdwBits: DWord): HResult; stdcall;
    function TxNotify(iNotify: DWord; pv: Pointer): HResult; stdcall;
    function TxImmGetContext: hIMC; stdcall;
    procedure TxImmReleaseContext(himc: hIMC); stdcall;
    function TxGetSelectionBarWidth(out lSelBarWidth: Integer): HResult; stdcall;
  end;

  // TTextHostImpl is a helper class for implementors of the ITextHost
  // interface in Delphi. It could have been declared as an actual
  // implementor of ITextHost itself, but since it has to be wrapped by
  // CreateTextHost anyway, I didn't want to have to deal with reference
  // counting of a helper class and forwarding calls to IUnknown's methods.
  // TTextHostImpl provides default implementations for most of the
  // methods. Override them in descendents. TxGetPropertyBits is an
  // abstract method since I could not decide on a suitable default return
  // value. The layout of this class is important. The virtual-method table
  // MUST have the same layout as the ITextHost method table. To use
  // TTextHostImpl with a windowless rich-edit control, create an instance
  // of a descendent and pass it to CreateTextHost (declared below).
  // CreateTextHost takes ownership of the TTextHostImpl object; do not
  // free it.
  TTextHostImpl = class
  public
    function TxGetDC: HDC; virtual; stdcall;
    function TxReleaseDC(hdc: HDC): Integer; virtual; stdcall;
    function TxShowScrollBar(fnBar: Integer; fShow: Bool): Bool; virtual; stdcall;
    function TxEnableScrollBar(fuSBFlags, fuArrowFlags: Integer): Bool; virtual; stdcall;
    function TxSetScrollRange(fnBar: Integer; nMinPos: Integer; nMaxPos: Integer; fRedraw: Bool): Bool; virtual; stdcall;
    function TxSetScrollPos(fnBar, nPos: Integer; fRedraw: Bool): Bool; virtual; stdcall;
    procedure TxInvalidateRect(const prc: TRect; fMode: Bool); virtual; stdcall;
    procedure TxViewChange(fUpdate: Bool); virtual; stdcall;
    function TxCreateCaret(hbmp: hBitmap; xWidth, yHeight: Integer): Bool; virtual; stdcall;
    function TxShowCaret(fShow: Bool): Bool; virtual; stdcall;
    function TxSetCaretPos(x, y: Integer): Bool; virtual; stdcall;
    function TxSetTimer(idTimer, uTimeout: UInt): Bool; virtual; stdcall;
    procedure TxKillTimer(idTimer: UInt); virtual; stdcall;
    procedure TxScrollWindowEx(dx, dy: Integer; const lprcScroll, lprcClip: TRect; hrgnUpdate: HRgn; fuScroll: UInt); virtual; stdcall;
    procedure TxSetCapture(fCapture: Bool); virtual; stdcall;
    procedure TxSetFocus; virtual; stdcall;
    procedure TxSetCursor(hcur: hCursor; fText: Bool); virtual; stdcall;
    function TxScreenToClient(var lppt: TPoint): Bool; virtual; stdcall;
    function TxClientToScreen(var lppt: TPoint): Bool; virtual; stdcall;
    function TxActivate(out lpOldState: Integer): HResult; virtual; stdcall;
    function TxDeactivate(lNewState: Integer): HResult; virtual; stdcall;
    function TxGetClientRect(out prc: TRect): HResult; virtual; stdcall;
    function TxGetViewInset(out prc: TRect): HResult; virtual; stdcall;
    function TxGetCharFormat(out ppCF: PCharFormatW): HResult; virtual; stdcall;
    function TxGetParaFormat(out ppPF: PParaFormat): HResult; virtual; stdcall;
    function TxGetSysColor(nIndex: Integer): TColorRef; virtual; stdcall;
    function TxGetBackStyle(out pstyle: TTxtBackStyle): HResult; virtual; stdcall;
    function TxGetMaxLength(out pLength: DWord): HResult; virtual; stdcall;
    function TxGetScrollBars(out pdwScrollBar: DWord): HResult; virtual; stdcall;
    function TxGetPasswordChar(out pch: {Wide}Char): HResult; virtual; stdcall;
    function TxGetAcceleratorPos(out pcp: Integer): HResult; virtual; stdcall;
    function TxGetExtent(out lpExtent: TSizeL): HResult; virtual; stdcall;
    function OnTxCharFormatChange(const pcf: TMyCharFormatW): HResult; virtual; stdcall;
    function OnTxParaFormatChange(const ppf: TParaFormat): HResult; virtual; stdcall;
    function TxGetPropertyBits(dwMask: DWord; out pdwBits: DWord): HResult; virtual; stdcall; abstract;
    function TxNotify(iNotify: DWord; pv: Pointer): HResult; virtual; stdcall;
    function TxImmGetContext: hIMC; virtual; stdcall;
    procedure TxImmReleaseContext(himc: hIMC); virtual; stdcall;
    function TxGetSelectionBarWidth(out lSelBarWidth: Integer): HResult; virtual; stdcall;
  end;

// CreateTextHost wraps a TTextHostImpl instance and returns an ITextHost
// interface reference suitable for passing to CreateTextServices.
//
// Caution: Delphi code must NEVER call any functions using the returned
// interface, except for the methods introduced in IUnknown. The actual
// ITextHost methods use the thiscall calling convention, which Delphi
// doesn't understand. If you need to call those methods, call them via
// the original TTextHostImpl reference instead.
//
// See also: TTextHostImpl
function CreateTextHost(const Impl: TTextHostImpl): ITextHost;

// This is the API function, documented by Microsoft. See MSDN for details.
function CreateTextServices(punkOuter: IUnknown; pITextHost: ITextHost; out ppUnk): HResult; stdcall;

// PatchTextServices takes an ITextServices reference, as returned by
// CreateTextServices, and wraps it within a Delphi-compatible
// ITextServices implementation.
//
// Services
//   [in,out] On entry, this parameter is a reference to an ITextServices
//   object returned by CreateTextServices. On exit, it is a reference to a
//   new ITextServices object suitable for use in Delphi.
//
// This function is necessary because the ITextServices interface is
// written to expect the thiscall calling convention, not the usual
// stdcall. Instead of passing Self as a regular variable on the stack, it
// is passed in the ECX register. PatchTextServices creates a wrapper
// object that fixes the stack layout for each function before forwarding
// the call to the original object.
//
// See also: CreateTextServices
procedure PatchTextServices(var Services: ITextServices);

implementation

uses SysUtils;

function CreateTextServices; external 'riched20.dll';

type
  TQueryInterface = function(const This: IUnknown; const riid: TGUID; out ppvObj): HResult; stdcall;

// Many of the following routines are declared without any parameters or
// return types. This is because they must use the stdcall calling
// convention, but the compiler automatically adds prologue and epilogue
// code for all stdcall functions, even if it isn't strictly necessary.
// This is OK, though, since these functions are all implemented in
// assembler and they are never called by any Delphi code. They're always
// called via an interface reference, usually by the operating system.

type
{$IFDEF CPUX86}
  TAddRef = TProcedure;
  TDraw = TProcedure;
  TGetBaselinePos = TProcedure;
  TGetCachedSize = TProcedure;
  TGetCurTargetX = TProcedure;
  TGetDropTarget = TProcedure;
  TGetHScroll = TProcedure;
  TGetNaturalSize = TProcedure;
  TGetText = TProcedure;
  TGetVScroll = TProcedure;
  TOnInPlaceActivate = TProcedure;
  TOnInPlaceDeactivate = TProcedure;
  TOnPropertyBitsChange = TProcedure;
  TOnSetCursor = TProcedure;
  TOnTxUIDeactivate = TProcedure;
  TOnUIActivate = TProcedure;
  TQueryHitPoint = TProcedure;
  TRelease = TProcedure;
  TSendMessage = TProcedure;
  TSetText = TProcedure;
{$ELSE}
  TAddRef = function(const ASelf: IInterface): Integer; stdcall;
  TDraw = function(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcBounds, lprcWBounds: TRectL; const lprcUpdate: TRect; pfnContinue: TTxDrawCallback; dwContinue: DWord; lViewID: TTxtView): HResult; stdcall;
  TGetBaselinePos = function(const ASelf: Pointer; out pBaselinePos: Integer): HResult; stdcall;
  TGetCachedSize = function(const ASelf: Pointer; out pdwWidth, pdwHeight: DWord): HResult; stdcall;
  TGetCurTargetX = function(const ASelf: Pointer; out px: Integer): HResult; stdcall;
  TGetDropTarget = function(const ASelf: Pointer; out ppDropTarget: IDropTarget): HResult; stdcall;
  TGetHScroll = function(const ASelf: Pointer; out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
  TGetNaturalSize = function(const ASelf: Pointer; dwAspect: DWord; hdcDraw, hicTargetDev: HDC; ptd: PDVTargetDevice; dwMode: DWord; const psizelExtent: TSizeL; var pwidth, pheight: Integer): HResult; stdcall;
  TGetText = function(const ASelf: Pointer; out pbstrText: TBStr): HResult; stdcall;
  TGetVScroll = function(const ASelf: Pointer; out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
  TOnInPlaceActivate = function(const ASelf: Pointer; const prcClient: TRect): HResult; stdcall;
  TOnInPlaceDeactivate = function(const ASelf: Pointer): HResult; stdcall;
  TOnPropertyBitsChange = function(const ASelf: Pointer; dwMask, dwBits: DWord): HResult; stdcall;
  TOnSetCursor = function(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer): HResult; stdcall;
  TOnTxUIDeactivate = function(const ASelf: Pointer): HResult; stdcall;
  TOnUIActivate = function(const ASelf: Pointer): HResult; stdcall;
  TQueryHitPoint = function(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer; out pHitResult: DWord): HResult; stdcall;
  TRelease = function(const ASelf: IInterface): Integer; stdcall;
  TSendMessage = function(const ASelf: Pointer; msg: UInt; wParam: wParam; lParam: lParam; out plresult: lResult): HResult; stdcall;
  TSetText = function(const ASelf: Pointer; pszText: PWideChar): HResult; stdcall;
{$ENDIF}

  PITextServicesMT = ^TITextServicesMT;
  TITextServicesMT = packed record
    // IUnknown
    QueryInterface: TQueryInterface;
    _AddRef: TAddRef;
    _Release: TRelease;
    // ITextServices
    TxSendMessage: TSendMessage;
    TxDraw: TDraw;
    TxGetHScroll: TGetHScroll;
    TxGetVScroll: TGetVScroll;
    OnTxSetCursor: TOnSetCursor;
    TxQueryHitPoint: TQueryHitPoint;
    OnTxInPlaceActivate: TOnInPlaceActivate;
    OnTxInPlaceDeactivate: TOnInPlaceDeactivate;
    OnTxUIActivate: TOnUIActivate;
    OnTxUIDeactivate: TOnTxUIDeactivate;
    TxGetText: TGetText;
    TxSetText: TSetText;
    TxGetCurTargetX: TGetCurTargetX;
    TxGetBaselinePos: TGetBaselinePos;
    TxGetNaturalSize: TGetNaturalSize;
    TxGetDropTarget: TGetDropTarget;
    OnTxPropertyBitsChange: TOnPropertyBitsChange;
    TxGetCachedSize: TGetCachedSize;
  end;

  PITextServices = ^TITextServices;
  TITextServices = packed record
    MethodTable: PITextServicesMT;
    Impl: ITextServices;
  end;

function TextServices_QueryInterface(const This: IUnknown; const riid: TGUID; out ppvObj): HResult; stdcall;
begin
  Result := PITextServices(This).Impl.QueryInterface(riid, ppvObj);
end;

{$IFDEF CPUX86}
procedure TextServices_AddRef; // (const This: IUnknown): ULong; stdcall;
asm
  mov eax, [esp + 4]
  mov eax, [eax].TITextServices.Impl
  mov [esp + 4], eax

  mov eax, [eax]
  jmp dword ptr [eax].TITextServicesMT._AddRef
end;
{$ELSE}
function TextServices_AddRef(const ASelf: IInterface): Integer; stdcall;
begin
  Result := PITextServices(ASelf).Impl._AddRef;
end;
{$ENDIF}

procedure ReleaseTextServices(const Services: PITextServices);
// This procedure is not in assembler because Dispose requires compiler
// magic in order to include TypeInfo for a PITextServices pointer.
begin
  Pointer(Services.Impl) := nil;
  Dispose(Services);
end;

{$IFDEF CPUX86}
procedure TextServices_Release; // (const This: IUnknown): ULong; stdcall;
{begin
  Result := PITextServices(This).Impl._Release;
  if Result = 0 then ReleaseTextServices(PTextServices(This));}
asm
  mov eax, [esp + 4]
  mov eax, [eax].TITextServices.Impl
  push eax
  mov eax, [eax]
  call dword ptr [eax].TITextServicesMT._Release
  test eax, eax
  jnz @@exit
  mov eax, [esp + 4]
  call ReleaseTextServices
  xor eax, eax
@@exit:
  ret 4
end;
{$ELSE}
function TextServices_Release(const ASelf: IInterface): Integer; stdcall;
begin
  Result := PITextServices(ASelf).Impl._Release;
  if Result = 0 then
    ReleaseTextServices(PITextServices(ASelf));
end;
{$ENDIF}

// These stubs get called as stdcall methods. They translate the stack into
// a thiscall method. First, there is a breakpoint, which can be set or
// ignored when a method is patched. Next, we pop the return address into
// EDX. Then we pop the Self parameter that Delphi puts at the top of the
// stack. It's actually a PITextServices value. The real ITextServices
// implementor is expecting to find its instance reference in ECX when we
// call it, and that got stored in the Inst field of the TITextServices
// record by the PatchTextServices function. After we set ECX, we push the
// return address back onto the stack (note the PITextServices reference is
// *not* pushed back on). ECX points to the first entry of the
// implementor's VMT, so we add an offset to that pointer and jump to the
// address stored there.

{$IFDEF CPUX86}
procedure TextServices_TxSendMessage; // (msg: UInt; wParam: wParam; lParam: lParam; out plresult: lResult): HResult; stdcall;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxSendMessage
end;
{$ELSE}
function TextServices_TxSendMessage(const ASelf: Pointer; msg: UInt; wParam: wParam; lParam: lParam; out plresult: lResult): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxSendMessage(msg, wParam, lParam, plresult);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxDraw;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxDraw
end;
{$ELSE}
function TextServices_TxDraw(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcBounds, lprcWBounds: TRectL; const lprcUpdate: TRect; pfnContinue: TTxDrawCallback; dwContinue: DWord; lViewID: TTxtView): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxDraw(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcBounds, lprcWBounds, lprcUpdate, pfnContinue, dwContinue, lViewID);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetHScroll; // (out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetHScroll
end;
{$ELSE}
function TextServices_TxGetHScroll(const ASelf: Pointer; out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetHScroll(plMin, plMax, plPos, plPage, pfEnabled);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetVScroll;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetVScroll
end;
{$ELSE}
function TextServices_TxGetVScroll(const ASelf: Pointer; out plMin, plMax, plPos, plPage: Integer; out pfEnabled: Bool): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetVScroll(plMin, plMax, plPos, plPage, pfEnabled);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxSetCursor; // (dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer): HResult; stdcall;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxSetCursor
end;
{$ELSE}
function TextServices_OnTxSetCursor(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxSetCursor(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxQueryHitPoint;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxQueryHitPoint
end;
{$ELSE}
function TextServices_TxQueryHitPoint(const ASelf: Pointer; dwDrawAspect: DWord; lindex: Integer; pvAspect: Pointer; ptd: PDVTargetDevice; hdcDraw, hicTargetDev: HDC; const lprcClient: TRect; x, y: Integer; out pHitResult: DWord): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxQueryHitPoint(dwDrawAspect, lindex, pvAspect, ptd, hdcDraw, hicTargetDev, lprcClient, x, y, pHitResult);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxInPlaceActivate;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxInPlaceActivate
 end;
{$ELSE}
function TextServices_OnTxInPlaceActivate(const ASelf: Pointer; const prcClient: TRect): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxInPlaceActivate(prcClient);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxInPlaceDeactivate; // : HResult; stdcall;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxInPlaceDeactivate
end;
{$ELSE}
function TextServices_OnTxInPlaceDeactivate(const ASelf: Pointer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxInPlaceDeactivate;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxUIActivate;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxUIActivate
end;
{$ELSE}
function TextServices_OnTxUIActivate(const ASelf: Pointer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxUIActivate;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxUIDeactivate;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxUIDeactivate
end;
{$ELSE}
function TextServices_OnTxUIDeactivate(const ASelf: Pointer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxUIDeactivate;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetText;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetText
end;
{$ELSE}
function TextServices_TxGetText(const ASelf: Pointer; out pbstrText: TBStr): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetText(pbstrText);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxSetText;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxSetText
end;
{$ELSE}
function TextServices_TxSetText(const ASelf: Pointer; pszText: PWideChar): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxSetText(pszText);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetCurTargetX;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetCurTargetX
end;
{$ELSE}
function TextServices_TxGetCurTargetX(const ASelf: Pointer; out px: Integer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetCurTargetX(px);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetBaselinePos;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetBaselinePos
end;
{$ELSE}
function TextServices_TxGetBaselinePos(const ASelf: Pointer; out pBaselinePos: Integer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetBaselinePos(pBaselinePos);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetNaturalSize;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetNaturalSize
end;
{$ELSE}
function TextServices_TxGetNaturalSize(const ASelf: Pointer; dwAspect: DWord; hdcDraw, hicTargetDev: HDC; ptd: PDVTargetDevice; dwMode: DWord; const psizelExtent: TSizeL; var pwidth, pheight: Integer): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetNaturalSize(dwAspect, hdcDraw, hicTargetDev, ptd, dwMode, psizelExtent, pwidth, pheight);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetDropTarget;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetDropTarget
end;
{$ELSE}
function TextServices_TxGetDropTarget(const ASelf: Pointer; out ppDropTarget: IDropTarget): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetDropTarget(ppDropTarget);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_OnTxPropertyBitsChange;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.OnTxPropertyBitsChange
end;
{$ELSE}
function TextServices_OnTxPropertyBitsChange(const ASelf: Pointer; dwMask, dwBits: DWord): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.OnTxPropertyBitsChange(dwMask, dwBits);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextServices_TxGetCachedSize;
asm
  pop edx // return address
  pop eax
  mov ecx, [eax].TITextServices.Impl
  push edx // return address
  mov eax, [ecx]
  jmp dword ptr [eax].TITextServicesMT.TxGetCachedSize
end;
{$ELSE}
function TextServices_TxGetCachedSize(const ASelf: Pointer; out pdwWidth, pdwHeight: DWord): HResult; stdcall;
begin
  Result := PITextServices(ASelf).Impl.TxGetCachedSize(pdwWidth, pdwHeight);
end;
{$ENDIF}

var
  TextServicesMethodTable: TITextServicesMT = (
    // IUnknown
    QueryInterface: TextServices_QueryInterface;
    _AddRef: TextServices_AddRef;
    _Release: TextServices_Release;
    // ITextServices
    TxSendMessage: TextServices_TxSendMessage;
    TxDraw: TextServices_TxDraw;
    TxGetHScroll: TextServices_TxGetHScroll;
    TxGetVScroll: TextServices_TxGetVScroll;
    OnTxSetCursor: TextServices_OnTxSetCursor;
    TxQueryHitPoint: TextServices_TxQueryHitPoint;
    OnTxInPlaceActivate: TextServices_OnTxInPlaceActivate;
    OnTxInPlaceDeactivate: TextServices_OnTxInPlaceDeactivate;
    OnTxUIActivate: TextServices_OnTxUIActivate;
    OnTxUIDeactivate: TextServices_OnTxUIDeactivate;
    TxGetText: TextServices_TxGetText;
    TxSetText: TextServices_TxSetText;
    TxGetCurTargetX: TextServices_TxGetCurTargetX;
    TxGetBaselinePos: TextServices_TxGetBaselinePos;
    TxGetNaturalSize: TextServices_TxGetNaturalSize;
    TxGetDropTarget: TextServices_TxGetDropTarget;
    OnTxPropertyBitsChange: TextServices_OnTxPropertyBitsChange;
    TxGetCachedSize: TextServices_TxGetCachedSize
  );

type
{$IFDEF CPUX86}
  TActivate = TProcedure;
  TAddRefRelease = TProcedure;
  TCharFormatChange = TProcedure;
  TClientToScreen = TProcedure;
  TCreateCaret = TProcedure;
  TDeactivate = TProcedure;
  TEnableScrollBar = TProcedure;
  TGetAcceleratorPos = TProcedure;
  TGetBackStyle = TProcedure;
  TGetCharFormat = TProcedure;
  TGetClientRect = TProcedure;
  TGetContext = TProcedure;
  TGetDC = TProcedure;
  TGetExtent = TProcedure;
  TGetMaxLength = TProcedure;
  TGetParaFormat = TProcedure;
  TGetPasswordChar = TProcedure;
  TGetPropertyBits = TProcedure;
  TGetScrollBars = TProcedure;
  TGetSelectionBarWidth = TProcedure;
  TGetSysColor = TProcedure;
  TGetViewInset = TProcedure;
  TInvalidateRect = TProcedure;
  TKillTimer = TProcedure;
  TNotify = TProcedure;
  TParaFormatChange = TProcedure;
  TReleaseContext = TProcedure;
  TReleaseDC = TProcedure;
  TScreenToClient = TProcedure;
  TScrollWindowEx = TProcedure;
  TSetCapture = TProcedure;
  TSetCaretPos = TProcedure;
  TSetCursor = TProcedure;
  TSetFocus = TProcedure;
  TSetScrollBar = TProcedure;
  TSetScrollPos = TProcedure;
  TSetTimer = TProcedure;
  TShowCaret = TProcedure;
  TShowScrollBar = TProcedure;
  TViewChange = TProcedure;
{$ELSE}
  TActivate = function(const ASelf: Pointer; out lpOldState: Integer): HResult; stdcall;
  TAddRefRelease = function(const ASelf: Pointer): Integer; stdcall;
  TCharFormatChange = function(const ASelf: Pointer; const pcf: TMyCharFormatW): HResult; stdcall;
  TClientToScreen = function(const ASelf: Pointer; var lppt: TPoint): Bool; stdcall;
  TCreateCaret = function(const ASelf: Pointer; hbmp: hBitmap; xWidth, yHeight: Integer): Bool; stdcall;
  TDeactivate = function(const ASelf: Pointer; lNewState: Integer): HResult; stdcall;
  TEnableScrollBar = function(const ASelf: Pointer; fuSBFlags, fuArrowFlags: Integer): Bool; stdcall;
  TGetAcceleratorPos = function(const ASelf: Pointer; out pcp: Integer): HResult; stdcall;
  TGetBackStyle = function(const ASelf: Pointer; out pstyle: TTxtBackStyle): HResult; stdcall;
  TGetCharFormat = function(const ASelf: Pointer; out ppCF: PCharFormatW): HResult; stdcall;
  TGetClientRect = function(const ASelf: Pointer; out prc: TRect): HResult; stdcall;
  TGetContext = function(const ASelf: Pointer): hIMC; stdcall;
  TGetDC = function(const ASelf: Pointer): HDC; stdcall;
  TGetExtent = function(const ASelf: Pointer; out lpExtent: TSizeL): HResult; stdcall;
  TGetMaxLength = function(const ASelf: Pointer; out pLength: DWord): HResult; stdcall;
  TGetParaFormat = function(const ASelf: Pointer; out ppPF: PParaFormat): HResult; stdcall;
  TGetPasswordChar = function(const ASelf: Pointer; out pch: Char): HResult; stdcall;
  TGetPropertyBits = function(const ASelf: Pointer; dwMask: DWord; out pdwBits: DWord): HResult; stdcall;
  TGetScrollBars = function(const ASelf: Pointer; out pdwScrollBar: DWord): HResult; stdcall;
  TGetSelectionBarWidth = function(const ASelf: Pointer; out lSelBarWidth: Integer): HResult; stdcall;
  TGetSysColor = function(const ASelf: Pointer; nIndex: Integer): TColorRef; stdcall;
  TGetViewInset = function(const ASelf: Pointer; out prc: TRect): HResult; stdcall;
  TInvalidateRect = procedure(const ASelf: Pointer; const prc: TRect; fMode: Bool); stdcall;
  TKillTimer = procedure(const ASelf: Pointer; idTimer: UInt); stdcall;
  TNotify = function(const ASelf: Pointer; iNotify: DWord; pv: Pointer): HResult; stdcall;
  TParaFormatChange = function(const ASelf: Pointer; const ppf: TParaFormat): HResult; stdcall;
  TReleaseContext = procedure(const ASelf: Pointer; himc: hIMC); stdcall;
  TReleaseDC = function(const ASelf: Pointer; AHDC: HDC): Integer; stdcall;
  TScreenToClient = function(const ASelf: Pointer; var lppt: TPoint): Bool; stdcall;
  TScrollWindowEx = procedure(const ASelf: Pointer; dx, dy: Integer; const lprcScroll, lprcClip: TRect; hrgnUpdate: HRgn; fuScroll: UInt); stdcall;
  TSetCapture = procedure(const ASelf: Pointer; fCapture: Bool); stdcall;
  TSetCaretPos = function(const ASelf: Pointer; x, y: Integer): Bool; stdcall;
  TSetCursor = procedure(const ASelf: Pointer; hcur: hCursor; fText: Bool); stdcall;
  TSetFocus = procedure(const ASelf: Pointer); stdcall;
  TSetScrollBar = function(const ASelf: Pointer; fnBar: Integer; nMinPos: Integer; nMaxPos: Integer; fRedraw: Bool): Bool; stdcall;
  TSetScrollPos = function(const ASelf: Pointer; fnBar, nPos: Integer; fRedraw: Bool): Bool; stdcall;
  TSetTimer = function(const ASelf: Pointer; idTimer, uTimeout: UInt): Bool; stdcall;
  TShowCaret = function(const ASelf: Pointer; fShow: Bool): Bool; stdcall;
  TShowScrollBar = function(const ASelf: Pointer; fnBar: Integer; fShow: Bool): Bool; stdcall;
  TViewChange = procedure(const ASelf: Pointer; fUpdate: Bool); stdcall;
{$ENDIF}
  PITextHostMT = ^TITextHostMT;
  TITextHostMT = packed record
    // IUnknown
    QueryInterface: TQueryInterface;
    _AddRef: TAddRefRelease;
    _Release: TAddRefRelease;
    // ITextHost
    TxGetDC: TGetDC;
    TxReleaseDC: TReleaseDC;
    TxShowScrollBar: TShowScrollBar;
    TxEnableScrollBar: TEnableScrollBar;
    TxSetScrollRange: TSetScrollBar;
    TxSetScrollPos: TSetScrollPos;
    TxInvalidateRect: TInvalidateRect;
    TxViewChange: TViewChange;
    TxCreateCaret: TCreateCaret;
    TxShowCaret: TShowCaret;
    TxSetCaretPos: TSetCaretPos;
    TxSetTimer: TSetTimer;
    TxKillTimer: TKillTimer;
    TxScrollWindowEx: TScrollWindowEx;
    TxSetCapture: TSetCapture;
    TxSetFocus: TSetFocus;
    TxSetCursor: TSetCursor;
    TxScreenToClient: TScreenToClient;
    TxClientToScreen: TClientToScreen;
    TxActivate: TActivate;
    TxDeactivate: TDeactivate;
    TxGetClientRect: TGetClientRect;
    TxGetViewInset: TGetViewInset;
    TxGetCharFormat: TGetCharFormat;
    TxGetParaFormat: TGetParaFormat;
    TxGetSysColor: TGetSysColor;
    TxGetBackStyle: TGetBackStyle;
    TxGetMaxLength: TGetMaxLength;
    TxGetScrollBars: TGetScrollBars;
    TxGetPasswordChar: TGetPasswordChar;
    TxGetAcceleratorPos: TGetAcceleratorPos;
    TxGetExtent: TGetExtent;
    OnTxCharFormatChange: TCharFormatChange;
    OnTxParaFormatChange: TParaFormatChange;
    TxGetPropertyBits: TGetPropertyBits;
    TxNotify: TNotify;
    TxImmGetContext: TGetContext;
    TxImmReleaseContext: TReleaseContext;
    TxGetSelectionBarWidth: TGetSelectionBarWidth;
  end;

  PITextHost = ^TITextHost;
  TITextHost = record
    MethodTable: PITextHostMT;
    RefCount: Integer;
    Impl: TTextHostImpl;
  end;

function TextHost_QueryInterface(const This: IUnknown; const riid: TGUID; out ppvObj): HResult; stdcall;
begin
  if IsEqualGUID(riid, IUnknown) or IsEqualGUID(riid, ITextHost) then begin
    Pointer(ppvObj) := Pointer(This);
    IUnknown(ppvObj)._AddRef;
    Result := S_OK;
  end else begin
    Pointer(ppvObj) := nil;
    Result := E_NoInterface;
  end;
end;

{$IFDEF CPUX86}
procedure TextHost_AddRef;
asm
  mov eax, [esp + 4]
  lea eax, [eax].TITextHost.RefCount
  push eax
  call InterlockedIncrement
  ret 4 // return from stdcall function
end;
{$ELSE}
function TextHost_AddRef(const ASelf: Pointer): Integer; stdcall;
begin
  Result := InterlockedIncrement(PITextHost(ASelf).RefCount);
end;
{$ENDIF}

procedure ReleaseTextHost(const AHost: PITextHost);
begin
  AHost.Impl.Free;
  Dispose(AHost);
end;

{$IFDEF CPUX86}
procedure TextHost_Release;
asm
  mov eax, [esp + 4]
  lea eax, [eax].TITextHost.RefCount
  push eax
  call InterlockedDecrement
  test eax, eax
  jnz @@exit

  mov eax, [esp + 4]
  call ReleaseTextHost
  xor eax, eax

@@exit:
  ret 4 // return from stdcall function
end;
{$ELSE}
function TextHost_Release(const ASelf: Pointer): Integer; stdcall;
begin
  Result := InterlockedDecrement(PITextHost(ASelf).RefCount);
  if Result = 0 then
    ReleaseTextHost(PITextHost(ASelf));
end;
{$ENDIF}

// When these stubs get called, it is as thiscall methods. We translate it
// to a stdcall method and then jump to the Delphi object method that's
// implementing the interface. ECX refers to the PITextHost value that
// CreateTextHost returned as an ITextHost reference. Besides a pointer to
// a VMT of these method stubs, that record also contains a reference to
// the TTextHostImpl instance, eight bytes into the record. That reference
// gets stored in EAX and then pushed onto the stack underneath the return
// address. Then we fetch the address of the method being wrapped from the
// TTextHostImpl's VMT and jump to that method.

{$IFDEF CPUX86}
procedure TextHost_TxGetDC;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetDC]
end;
{$ELSE}
function TextHost_TxGetDC(const ASelf: Pointer): HDC; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetDC;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxReleaseDC; // (hdc: HDC): Integer; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxReleaseDC]
end;
{$ELSE}
function TextHost_TxReleaseDC(const ASelf: Pointer; AHDC: HDC): Integer; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxReleaseDC(AHDC)
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxShowScrollBar;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxShowScrollBar]
 end;
{$ELSE}
function TextHost_TxShowScrollBar(const ASelf: Pointer; fnBar: Integer; fShow: Bool): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxShowScrollBar(fnBar, fShow);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxEnableScrollBar;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxEnableScrollBar]
end;
{$ELSE}
function TextHost_TxEnableScrollBar(const ASelf: Pointer; fuSBFlags, fuArrowFlags: Integer): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxEnableScrollBar(fuSBFlags, fuArrowFlags);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetScrollRange;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetScrollRange]
end;
{$ELSE}
function TextHost_TxSetScrollRange(const ASelf: Pointer; fnBar: Integer; nMinPos: Integer; nMaxPos: Integer; fRedraw: Bool): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxSetScrollRange(fnBar, nMinPos, nMaxPos, fRedraw);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetScrollPos; // (fnBar, nPos: Integer; fRedraw: Bool): Bool; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetScrollPos]
end;
{$ELSE}
function TextHost_TxSetScrollPos(const ASelf: Pointer; fnBar, nPos: Integer; fRedraw: Bool): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxSetScrollPos(fnBar, nPos, fRedraw);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxInvalidateRect;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxInvalidateRect]
end;
{$ELSE}
procedure TextHost_TxInvalidateRect(const ASelf: Pointer; const prc: TRect; fMode: Bool); stdcall;
begin
  PITextHost(ASelf).Impl.TxInvalidateRect(prc, fMode);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxViewChange; // (fUpdate: Bool); stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxViewChange]
end;
{$ELSE}
procedure TextHost_TxViewChange(const ASelf: Pointer; fUpdate: Bool); stdcall;
begin
  PITextHost(ASelf).Impl.TxViewChange(fUpdate);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxCreateCaret;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxCreateCaret]
end;
{$ELSE}
function TextHost_TxCreateCaret(const ASelf: Pointer; hbmp: hBitmap; xWidth, yHeight: Integer): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxCreateCaret(hbmp, xWidth, yHeight);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxShowCaret;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxShowCaret]
end;
{$ELSE}
function TextHost_TxShowCaret(const ASelf: Pointer; fShow: Bool): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxShowCaret(fShow);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetCaretPos;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetCaretPos]
end;
{$ELSE}
function TextHost_TxSetCaretPos(const ASelf: Pointer; x, y: Integer): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxSetCaretPos(x, y);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetTimer;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetTimer]
end;
{$ELSE}
function TextHost_TxSetTimer(const ASelf: Pointer; idTimer, uTimeout: UInt): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxSetTimer(idTimer, uTimeout);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxKillTimer;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxKillTimer]
end;
{$ELSE}
procedure TextHost_TxKillTimer(const ASelf: Pointer; idTimer: UInt); stdcall;
begin
  PITextHost(ASelf).Impl.TxKillTimer(idTimer);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxScrollWindowEx;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxScrollWindowEx]
end;
{$ELSE}
procedure TextHost_TxScrollWindowEx(const ASelf: Pointer; dx, dy: Integer; const lprcScroll, lprcClip: TRect; hrgnUpdate: HRgn; fuScroll: UInt); stdcall;
begin
  PITextHost(ASelf).Impl.TxScrollWindowEx(dx, dy, lprcScroll, lprcClip, hrgnUpdate, fuScroll);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetCapture;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetCapture]
end;
{$ELSE}
procedure TextHost_TxSetCapture(const ASelf: Pointer; fCapture: Bool); stdcall;
begin
  PITextHost(ASelf).Impl.TxSetCapture(fCapture);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetFocus;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetFocus]
end;
{$ELSE}
procedure TextHost_TxSetFocus(const ASelf: Pointer); stdcall;
begin
  PITextHost(ASelf).Impl.TxSetFocus;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxSetCursor;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxSetCursor]
end;
{$ELSE}
procedure TextHost_TxSetCursor(const ASelf: Pointer; hcur: hCursor; fText: Bool); stdcall;
begin
  PITextHost(ASelf).Impl.TxSetCursor(hcur, fText);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxScreenToClient;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxScreenToClient]
end;
{$ELSE}
function TextHost_TxScreenToClient(const ASelf: Pointer; var lppt: TPoint): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxScreenToClient(lppt);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxClientToScreen;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxClientToScreen]
end;
{$ELSE}
function TextHost_TxClientToScreen(const ASelf: Pointer; var lppt: TPoint): Bool; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxClientToScreen(lppt);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxActivate; // (out lpOldState: Integer): HResult; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxActivate]
end;
{$ELSE}
function TextHost_TxActivate(const ASelf: Pointer; out lpOldState: Integer): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxActivate(lpOldState);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxDeactivate;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxDeactivate]
end;
{$ELSE}
function TextHost_TxDeactivate(const ASelf: Pointer; lNewState: Integer): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxDeactivate(lNewState);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetClientRect;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetClientRect]
end;
{$ELSE}
function TextHost_TxGetClientRect(const ASelf: Pointer; out prc: TRect): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetClientRect(prc);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetViewInset; // (out prc: TRect): HResult; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetViewInset]
end;
{$ELSE}
function TextHost_TxGetViewInset(const ASelf: Pointer; out prc: TRect): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetViewInset(prc);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetCharFormat;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetCharFormat]
end;
{$ELSE}
function TextHost_TxGetCharFormat(const ASelf: Pointer; out ppCF: PCharFormatW): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetCharFormat(ppCF);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetParaFormat;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetParaFormat]
end;
{$ELSE}
function TextHost_TxGetParaFormat(const ASelf: Pointer; out ppPF: PParaFormat): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetParaFormat(ppPF);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetSysColor;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetSysColor]
end;
{$ELSE}
function TextHost_TxGetSysColor(const ASelf: Pointer; nIndex: Integer): TColorRef; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetSysColor(nIndex);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetBackStyle; // (out pstyle: TTxtBackStyle): HResult; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetBackStyle]
end;
{$ELSE}
function TextHost_TxGetBackStyle(const ASelf: Pointer; out pstyle: TTxtBackStyle): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetBackStyle(pstyle);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetMaxLength;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetMaxLength]
end;
{$ELSE}
function TextHost_TxGetMaxLength(const ASelf: Pointer; out pLength: DWord): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetMaxLength(pLength);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetScrollBars;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetScrollBars]
end;
{$ELSE}
function TextHost_TxGetScrollBars(const ASelf: Pointer; out pdwScrollBar: DWord): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetScrollBars(pdwScrollBar);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetPasswordChar;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetPasswordChar]
end;
{$ELSE}
function TextHost_TxGetPasswordChar(const ASelf: Pointer; out pch: Char): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetPasswordChar(pch);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetAcceleratorPos;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetAcceleratorPos]
end;
{$ELSE}
function TextHost_TxGetAcceleratorPos(const ASelf: Pointer; out pcp: Integer): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetAcceleratorPos(pcp);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetExtent;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetExtent]
end;
{$ELSE}
function TextHost_TxGetExtent(const ASelf: Pointer; out lpExtent: TSizeL): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetExtent(lpExtent);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_OnTxCharFormatChange;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.OnTxCharFormatChange]
end;
{$ELSE}
function TextHost_OnTxCharFormatChange(const ASelf: Pointer; const pcf: TMyCharFormatW): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.OnTxCharFormatChange(pcf);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_OnTxParaFormatChange;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.OnTxParaFormatChange]
end;
{$ELSE}
function TextHost_OnTxParaFormatChange(const ASelf: Pointer; const ppf: TParaFormat): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.OnTxParaFormatChange(ppf);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetPropertyBits;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetPropertyBits]
end;
{$ELSE}
function TextHost_TxGetPropertyBits(const ASelf: Pointer; dwMask: DWord; out pdwBits: DWord): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetPropertyBits(dwMask, pdwBits);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxNotify;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxNotify]
end;
{$ELSE}
function TextHost_TxNotify(const ASelf: Pointer; iNotify: DWord; pv: Pointer): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxNotify(iNotify, pv);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxImmGetContext;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxImmGetContext]
end;
{$ELSE}
function TextHost_TxImmGetContext(const ASelf: Pointer): hIMC; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxImmGetContext;
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxImmReleaseContext; // (himc: hIMC); stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxImmReleaseContext]
end;
{$ELSE}
procedure TextHost_TxImmReleaseContext(const ASelf: Pointer; himc: hIMC); stdcall;
begin
  PITextHost(ASelf).Impl.TxImmReleaseContext(himc);
end;
{$ENDIF}

{$IFDEF CPUX86}
procedure TextHost_TxGetSelectionBarWidth; // (out lSelBarWidth: Integer): HResult; stdcall;
asm
  pop edx // return address
  mov eax, [ecx].TITextHost.Impl
  push eax
  push edx // return address
  mov eax, [eax]
  jmp dword ptr [eax + vmtoffset TTextHostImpl.TxGetSelectionBarWidth]
end;
{$ELSE}
function TextHost_TxGetSelectionBarWidth(const ASelf: Pointer; out lSelBarWidth: Integer): HResult; stdcall;
begin
  Result := PITextHost(ASelf).Impl.TxGetSelectionBarWidth(lSelBarWidth);
end;
{$ENDIF}

var
  TextHostMethodTable: TITextHostMT = (
    // IUnknown
    QueryInterface: TextHost_QueryInterface;
    _AddRef: TextHost_AddRef;
    _Release: TextHost_Release;
    // ITextHost
    TxGetDC: TextHost_TxGetDC;
    TxReleaseDC: TextHost_TxReleaseDC;
    TxShowScrollBar: TextHost_TxShowScrollBar;
    TxEnableScrollBar: TextHost_TxEnableScrollBar;
    TxSetScrollRange: TextHost_TxSetScrollRange;
    TxSetScrollPos: TextHost_TxSetScrollPos;
    TxInvalidateRect: TextHost_TxInvalidateRect;
    TxViewChange: TextHost_TxViewChange;
    TxCreateCaret: TextHost_TxCreateCaret;
    TxShowCaret: TextHost_TxShowCaret;
    TxSetCaretPos: TextHost_TxSetCaretPos;
    TxSetTimer: TextHost_TxSetTimer;
    TxKillTimer: TextHost_TxKillTimer;
    TxScrollWindowEx: TextHost_TxScrollWindowEx;
    TxSetCapture: TextHost_TxSetCapture;
    TxSetFocus: TextHost_TxSetFocus;
    TxSetCursor: TextHost_TxSetCursor;
    TxScreenToClient: TextHost_TxScreenToClient;
    TxClientToScreen: TextHost_TxClientToScreen;
    TxActivate: TextHost_TxActivate;
    TxDeactivate: TextHost_TxDeactivate;
    TxGetClientRect: TextHost_TxGetClientRect;
    TxGetViewInset: TextHost_TxGetViewInset;
    TxGetCharFormat: TextHost_TxGetCharFormat;
    TxGetParaFormat: TextHost_TxGetParaFormat;
    TxGetSysColor: TextHost_TxGetSysColor;
    TxGetBackStyle: TextHost_TxGetBackStyle;
    TxGetMaxLength: TextHost_TxGetMaxLength;
    TxGetScrollBars: TextHost_TxGetScrollBars;
    TxGetPasswordChar: TextHost_TxGetPasswordChar;
    TxGetAcceleratorPos: TextHost_TxGetAcceleratorPos;
    TxGetExtent: TextHost_TxGetExtent;
    OnTxCharFormatChange: TextHost_OnTxCharFormatChange;
    OnTxParaFormatChange: TextHost_OnTxParaFormatChange;
    TxGetPropertyBits: TextHost_TxGetPropertyBits;
    TxNotify: TextHost_TxNotify;
    TxImmGetContext: TextHost_TxImmGetContext;
    TxImmReleaseContext: TextHost_TxImmReleaseContext;
    TxGetSelectionBarWidth: TextHost_TxGetSelectionBarWidth;
  );

procedure PatchTextServices(var Services: ITextServices);
var
  NewServices: PITextServices;
begin
  New(NewServices);
  NewServices.MethodTable := @TextServicesMethodTable;
  Pointer(NewServices.Impl) := Pointer(Services);
  Pointer(Services) := NewServices;
end;

function CreateTextHost(const Impl: TTextHostImpl): ITextHost;
var
  Obj: PITextHost;
begin
  New(Obj);
  Obj.MethodTable := @TextHostMethodTable;
  Obj.RefCount := 0;
  Obj.Impl := Impl;
  Result := ITextHost(Obj);
end;

{ TTextHostImpl }

// The following is a generic implementation of the ITextHost interface.
// Many of the methods return E_Fail, but that's actually OK. The OS does
// not expect the text-services object to be fully functional.

function TTextHostImpl.OnTxCharFormatChange(const pcf: TMyCharFormatW): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.OnTxParaFormatChange(const ppf: TParaFormat): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.TxActivate(out lpOldState: Integer): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.TxClientToScreen(var lppt: TPoint): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxCreateCaret(hbmp: hBitmap; xWidth, yHeight: Integer): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxDeactivate(lNewState: Integer): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.TxEnableScrollBar(fuSBFlags, fuArrowFlags: Integer): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxGetAcceleratorPos(out pcp: Integer): HResult;
begin
  pcp := -1;
  Result := S_OK;
end;

function TTextHostImpl.TxGetBackStyle(out pstyle: TTxtBackStyle): HResult;
begin
  pstyle := txtBack_Transparent;
  Result := S_OK;
end;

function TTextHostImpl.TxGetCharFormat(out ppCF: PCharFormatW): HResult;
begin
  Result := E_NotImpl;
end;

function TTextHostImpl.TxGetClientRect(out prc: TRect): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.TxGetDC: HDC;
begin
  Result := 0;
end;

function TTextHostImpl.TxGetExtent(out lpExtent: TSizeL): HResult;
begin
  Result := E_Fail;
end;

function TTextHostImpl.TxGetMaxLength(out pLength: DWord): HResult;
begin
  pLength := Infinite;
  Result := S_OK;
end;

function TTextHostImpl.TxGetParaFormat(out ppPF: PParaFormat): HResult;
begin
  Result := E_NotImpl;
end;

function TTextHostImpl.TxGetPasswordChar(out pch: Char): HResult;
begin
  Result := S_False;
end;

function TTextHostImpl.TxGetScrollBars(out pdwScrollBar: DWord): HResult;
begin
  pdwScrollBar := 0;
  Result := S_OK;
end;

function TTextHostImpl.TxGetSelectionBarWidth(out lSelBarWidth: Integer): HResult;
begin
  lSelBarWidth := 0;
  Result := S_OK;
end;

function TTextHostImpl.TxGetSysColor(nIndex: Integer): TColorRef;
begin
  Result := GetSysColor(nIndex);
end;

function TTextHostImpl.TxGetViewInset(out prc: TRect): HResult;
begin
  SetRect(prc, 0, 0, 0, 0);
  Result := S_OK;
end;

function TTextHostImpl.TxImmGetContext: hIMC;
begin
  Result := 0;
end;

procedure TTextHostImpl.TxImmReleaseContext(himc: hIMC);
begin
end;

procedure TTextHostImpl.TxInvalidateRect(const prc: TRect; fMode: Bool);
begin
end;

procedure TTextHostImpl.TxKillTimer(idTimer: UInt);
begin
end;

function TTextHostImpl.TxNotify(iNotify: DWord; pv: Pointer): HResult;
begin
  Result := S_False;
end;

function TTextHostImpl.TxReleaseDC(hdc: HDC): Integer;
begin
  Result := 0;
end;

function TTextHostImpl.TxScreenToClient(var lppt: TPoint): Bool;
begin
  Result := False;
end;

procedure TTextHostImpl.TxScrollWindowEx(dx, dy: Integer; const lprcScroll, lprcClip: TRect; hrgnUpdate: HRgn; fuScroll: UInt);
begin
end;

procedure TTextHostImpl.TxSetCapture(fCapture: Bool);
begin
end;

function TTextHostImpl.TxSetCaretPos(x, y: Integer): Bool;
begin
  Result := False;
end;

procedure TTextHostImpl.TxSetCursor(hcur: hCursor; fText: Bool);
begin
end;

procedure TTextHostImpl.TxSetFocus;
begin
end;

function TTextHostImpl.TxSetScrollPos(fnBar, nPos: Integer; fRedraw: Bool): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxSetScrollRange(fnBar, nMinPos, nMaxPos: Integer; fRedraw: Bool): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxSetTimer(idTimer, uTimeout: UInt): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxShowCaret(fShow: Bool): Bool;
begin
  Result := False;
end;

function TTextHostImpl.TxShowScrollBar(fnBar: Integer; fShow: Bool): Bool;
begin
  Result := False;
end;

procedure TTextHostImpl.TxViewChange(fUpdate: Bool);
begin
end;

end.
