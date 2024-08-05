{*********************************************************}
{*                  O32MOUSEMON.PAS 4.0                  *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Orpheus                                    *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C)1995-2002    *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

unit O32MouseMon;
  { Orpheus Mouse Monitor }

interface
uses
  Windows, Classes, SysUtils, Messages, OvcMisc;

type
{ - HWnd changed to TOvcHWnd for BCB Compatibility}
  TMouseMonHandler = procedure(const MouseMessage, wParam, lParam: Integer;
    const ScreenPt: TPoint; const MouseWnd: TOvcHWnd{hWnd}) of object;

procedure StartMouseMonitor(Callback: TMouseMonHandler);
procedure StopMouseMonitor(Callback: TMouseMonHandler);

implementation

type
  TMouseMonEntry = class
  protected
    FHandler: TMouseMonHandler;
  public
    property Handler: TMouseMonHandler read FHandler write FHandler;
  end;

var
  MouseMonList: TList = nil;
  ghhk: HHook = 0;
  mhhk: HHook = 0;

function MessageHookProc(ACode: Integer; AWParam: WPARAM; ALParam: LPARAM): LRESULT; stdcall;
var
  i: Integer;
begin
  if ACode = 0 then begin
    if (ACode = HC_ACTION) and (PMsg(ALParam).message = WM_MOUSEWHEEL) then
      for i := 0 to MouseMonList.Count - 1 do
        TMouseMonEntry(MouseMonList[i]).Handler(
          PMsg(ALParam).message,
          PMsg(ALParam).wParam,
          PMsg(ALParam).lParam,
          PMsg(ALParam).pt,
          PMsg(ALParam).hwnd);
  end;
  Result := CallNextHookEx(ghhk, ACode, AWParam, ALParam);
end;

function MouseHookProc(ACode: Integer; AWParam: WPARAM; ALParam: LPARAM): LRESULT; stdcall;
var
  i: Integer;
begin
  if (ACode = HC_ACTION) and (AWParam <> WM_MOUSEWHEEL) then
    for i := 0 to MouseMonList.Count - 1 do
      TMouseMonEntry(MouseMonList[i]).Handler(
        AWParam,
        0,
        0,
        PMouseHookStruct(ALParam).pt,
        PMouseHookStruct(ALParam).hwnd);
  Result := CallNextHookEx(mhhk, ACode, AWParam, ALParam);
end;

procedure InstallHook;
begin
  mhhk := SetWindowsHookEx(WH_MOUSE, TFNHookProc(@MouseHookProc), 0, GetCurrentThreadID);
  ghhk := SetWindowsHookEx(WH_GETMESSAGE, TFNHookProc(@MessageHookProc), 0, GetCurrentThreadID);
end;

procedure StartMouseMonitor(Callback: TMouseMonHandler);
var
  NewEntry: TMouseMonEntry;
  i: Integer;
begin
  if MouseMonList = nil then
    MouseMonList := TList.Create;
  for i := 0 to MouseMonList.Count - 1 do
    if (TMethod(TMouseMonEntry(MouseMonList[i]).Handler).Code = TMethod(Callback).Code)
    and (TMethod(TMouseMonEntry(MouseMonList[i]).Handler).Data = TMethod(Callback).Data) then begin
      raise Exception.Create('Only one handler per window at a time, please');
      //exit;
    end;
  NewEntry := TMouseMonEntry.Create;
  NewEntry.Handler := Callback;
  MouseMonList.Add(NewEntry);
  if mhhk = 0 then
    InstallHook;
end;

procedure ClearMonList;
begin
  if MouseMonList = nil then exit;
  while MouseMonList.Count > 0 do begin
    TMouseMonEntry(MouseMonList[0]).Free;
    MouseMonList.Delete(0);
  end;
  MouseMonList.Free;
  MouseMonList := nil;
  if mhhk <> 0 then begin
    UnhookWindowsHookEx(mhhk);
    mhhk := 0;
    UnhookWindowsHookEx(ghhk);
    ghhk := 0;
  end;
end;

procedure StopMouseMonitor(Callback: TMouseMonHandler);
var
  i: Integer;
begin
  if MouseMonList = nil then exit;
  for i := 0 to MouseMonList.Count - 1 do
    if (TMethod(TMouseMonEntry(MouseMonList[i]).Handler).Code = TMethod(Callback).Code)
    and (TMethod(TMouseMonEntry(MouseMonList[i]).Handler).Data = TMethod(Callback).Data) then begin
      TMouseMonEntry(MouseMonList[i]).Free;
      MouseMonList.Delete(i);
      if MouseMonList.Count = 0 then
        ClearMonList;
      exit;
    end;
end;

initialization
finalization
  ClearMonList;
end.
