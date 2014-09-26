{*********************************************************}
{*                  OVCTHEMES.PAS 4.08                   *}
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
{* Roman Kassebaum                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

unit ovcThemes;

{$I OVC.INC}

interface

uses
  Windows, Graphics{$IFDEF VERSIONXE2}, System.UITypes{$ENDIF}{$IFDEF VERSION2010}, Themes, UxTheme{$ENDIF};

type
  TovcThemes = class(TObject)
  public
    class procedure DrawSelection(Canvas: TCanvas; ARect: TRect);
  end;


implementation

{$IFDEF VERSION2010}
uses
  SysUtils;

function ThemesEnabled: Boolean; inline;
begin
{$IFDEF VERSIONXE2}
  Result := StyleServices.Enabled;
{$ELSE}
  Result := ThemeServices.ThemesEnabled;
{$ENDIF}
end;

{$IFDEF VERSIONXE2}
function ThemeServices: TCustomStyleServices; inline;
begin
  Result := StyleServices;
end;
{$ENDIF}
{$ENDIF}

{ TovcThemes }

class procedure TovcThemes.DrawSelection(Canvas: TCanvas; ARect: TRect);
{$IFDEF VERSION2010}
  var
  LTheme: HTHEME;
  LRect, Rect2: TRect;
  BRC: TBrushRecall;
{$ENDIF VERSION2010}
begin
  {$IFDEF VERSION2010}
  if ThemesEnabled and (Win32MajorVersion >= 6) and (Canvas.Brush.Color = clHighLight) then
  begin
    BRC := TBrushRecall.Create(Canvas.Brush);
    try
      Canvas.Brush.Color := clWindow;
      LRect := ARect;
      Rect2 := ARect;
      LTheme := ThemeServices.Theme[teMenu];
      DrawThemeBackground(LTheme, Canvas.Handle, MENU_POPUPITEM, MPI_HOT,
        LRect, @Rect2);
    finally
      BRC.Free;
    end;
  end
  else
  {$ENDIF VERSION2010}
    Canvas.FillRect(ARect);
end;

end.

