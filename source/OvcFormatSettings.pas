{*********************************************************}
{*                   OVCFORMATSETTINGS.PAS 4.07          *}
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
{*    Roman Kassebaum                                                         *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

unit OvcFormatSettings;

interface

uses
  SysUtils;

type
{$IFDEF VERSIONXE}
  TFormatSettings = SysUtils.TFormatSettings;
{$ELSE}
  TFormatSettings = record
    CurrencyString: string;
    CurrencyFormat: Byte;
    CurrencyDecimals: Byte;
    DateSeparator: Char;
    TimeSeparator: Char;
    ListSeparator: Char;
    ShortDateFormat: string;
    LongDateFormat: string;
    TimeAMString: string;
    TimePMString: string;
    ShortTimeFormat: string;
    LongTimeFormat: string;
    ShortMonthNames: array[1..12] of string;
    LongMonthNames: array[1..12] of string;
    ShortDayNames: array[1..7] of string;
    LongDayNames: array[1..7] of string;
    ThousandSeparator: Char;
    DecimalSeparator: Char;
    TwoDigitYearCenturyWindow: Word;
    NegCurrFormat: Byte;
  end;

function FormatSettings: TFormatSettings;
{$ENDIF}

implementation

{$IFNDEF VERSIONXE}
function FormatSettings: TFormatSettings;
var
  iCount: Integer;
begin
  Result.CurrencyString := CurrencyString;
  Result.CurrencyFormat := CurrencyFormat;
  Result.CurrencyDecimals := CurrencyDecimals;
  Result.DateSeparator := DateSeparator;
  Result.TimeSeparator := TimeSeparator;
  Result.ListSeparator := ListSeparator;
  Result.ShortDateFormat := ShortDateFormat;
  Result.LongDateFormat := LongDateFormat;
  Result.TimeAMString := TimeAMString;
  Result.TimePMString := TimePMString;
  Result.ShortTimeFormat := ShortTimeFormat;
  Result.LongTimeFormat := LongTimeFormat;
  for iCount := Low(Result.ShortMonthNames) to High(Result.ShortMonthNames) do
    Result.ShortMonthNames[iCount] := ShortMonthNames[iCount];
  for iCount := Low(Result.LongMonthNames) to High(Result.LongMonthNames) do
    Result.LongMonthNames[iCount] := LongMonthNames[iCount];
  for iCount := Low(Result.ShortDayNames) to High(Result.ShortDayNames) do
    Result.ShortDayNames[iCount] := ShortDayNames[iCount];
  for iCount := Low(Result.LongDayNames) to High(Result.LongDayNames) do
    Result.LongDayNames[iCount] := LongDayNames[iCount];
  Result.ThousandSeparator := ThousandSeparator;
  Result.DecimalSeparator := DecimalSeparator;
  Result.TwoDigitYearCenturyWindow := TwoDigitYearCenturyWindow;
  Result.NegCurrFormat := NegCurrFormat;
end;
{$ENDIF}

end.