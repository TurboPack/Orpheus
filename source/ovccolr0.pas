{*********************************************************}
{*                  OVCCOLOR0.PAS 4.06                   *}
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

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{.W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

unit ovccolr0;
  {-enhanced color property editor}

interface

uses
  Windows, Classes, Controls,
  {$IFDEF VERSION6}
    DesignIntf, DesignEditors, VCLEditors,
  {$ELSE}
    DsgnIntf,
  {$ENDIF}
  Graphics, Forms, SysUtils, OvcData;

type
  TOvcColorProperty = class(TColorProperty)
  public
    function GetValue: string;
      override;
    procedure GetValues(Proc: TGetStrProc);
      override;
    procedure SetValue(const Value: string);
      override;
    {$IFDEF VERSION5}
      {$IFNDEF VERSION6}
      procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
         const ARect: TRect; ASelected: Boolean); override;
      {$ENDIF}
    {$ENDIF}
  end;

implementation

type
  TColorEntry = packed record
    Value : TColor;
    Name  : PChar;
  end;

const
  Colors : array[0..2] of TColorEntry = (
    (Value : clCream;       Name : 'clCream'),
    (Value : clMoneyGreen;  Name : 'clMoneyGreen'),
    (Value : clSkyBlue;     Name : 'clSkyBlue'));

function OrColorToString(Color : TColor) : string;
var
  I : Integer;
begin
  if not ColorToIdent(Color, Result) then begin
    for I := Low(Colors) to High(Colors) do
      if Colors[I].Value = Color then begin

        Result := StrPas(Colors[I].Name);
        Exit;
      end;
    FmtStr(Result, '$%.8x', [Color]);
  end;
end;



function OrStringToColor(S : string) : TColor;
var
  I    : Integer;
  Text : string;
begin
  Text := S;
  for I := Low(Colors) to High(Colors) do
    if CompareText(Colors[I].Name, Text) = 0 then begin
      Result := Colors[I].Value;
      Exit;
    end;
  Result := StringToColor(S);
end;


procedure OrGetColorValues(Proc : TGetStrProc);
var
  I : Integer;
begin
  GetColorValues(Proc);
  for I := Low(Colors) to High(Colors) do

    Proc(StrPas(Colors[I].Name));
end;



{*** TOvcColorProperty ***}

function TOvcColorProperty.GetValue : string;
begin
  Result := OrColorToString(TColor(GetOrdValue));
end;

procedure TOvcColorProperty.GetValues(Proc : TGetStrProc);
begin
  OrGetColorValues(Proc);
end;

procedure TOvcColorProperty.SetValue(const Value : string);
begin
  SetOrdValue(OrStringToColor(Value));
end;


{$IFDEF VERSION5}
{$IFNDEF VERSION6}
{Note: This routine is copied directly from DSGNINTF.PAS
       Copyright (c) 1995,99 Inprise Corporation

       The problem we are trying to solve here is the "'clCream' is
       not an integer value" exception. This boils down to a design
       flaw in Delphi 5's TColorProperty class (from which we are
       descending TOvcColorProperty). It has a hard coded call to
       StringToColor in its ListDrawValue method. We are adding some
       new color names (clCream, etc) and although we are correctly
       overriding the GetValue method and SetValue methods to convert
       clCream to its TColor value, ListDrawValue doesn't. It blindly
       assumes that color names only exist in the standard VCL color
       list, and anything else is invalid (hence the exception). The
       ideal solution would be to add a new virtual method to
       TColorProperty to enable color names to be converted to TColor
       values. For Delphi 5, we just blindly copy the ListDrawValue
       method in its entirety.}

procedure TOvcColorProperty.ListDrawValue(const Value: string; ACanvas: TCanvas;
  const ARect: TRect; ASelected: Boolean);
  function ColorToBorderColor(AColor: TColor): TColor;
  type
    TColorQuad = record
      Red,
      Green,
      Blue,
      Alpha: Byte;
    end;
  begin
    if (TColorQuad(AColor).Red > 192) or
       (TColorQuad(AColor).Green > 192) or
       (TColorQuad(AColor).Blue > 192) then
      Result := clBlack
    else if ASelected then
      Result := clWhite
    else
      Result := AColor;
  end;
var
  vRight: Integer;
  vOldPenColor, vOldBrushColor: TColor;
begin
  vRight := (ARect.Bottom - ARect.Top) {* 2} + ARect.Left;
  with ACanvas do
  try
    {save off things}
    vOldPenColor := Pen.Color;
    vOldBrushColor := Brush.Color;

    { frame things }
    Pen.Color := Brush.Color;
    Rectangle(ARect.Left, ARect.Top, vRight, ARect.Bottom);

    { set things up and do the work }
    Brush.Color := OrStringToColor(Value);
    Pen.Color := ColorToBorderColor(ColorToRGB(Brush.Color));
    Rectangle(ARect.Left + 1, ARect.Top + 1, vRight - 1, ARect.Bottom - 1);

    { restore the things we twiddled with }
    Brush.Color := vOldBrushColor;
    Pen.Color := vOldPenColor;
  finally
    {we'd like to call our ancestor's ListDrawValue here, but we'd
     just get the same problem again; we can't skip an ancestor with
     inherited, so we just replicate here what's in
     TPropertyEditor.ListDrawValue}
    ACanvas.TextRect(Rect(vRight, ARect.Top, ARect.Right, ARect.Bottom),
                     vRight + 1, ARect.Top + 1, Value);
  end;
end;
{$ENDIF}
{$ENDIF}

end.
