{*********************************************************}
{*                  O32INTLST.PAS 4.08                   *}
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
{*   Armin Biernaczyk:                                                        *}
{*     07/2011: Changed 'FList.List^[M]' to 'FList.List[M]' in several        *}
{*              places (for compatibility with Delphi Pulsar)                 *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

unit o32intlst;

interface

uses
  System.Generics.Collections;

type
  // There's a bug in ilink64 related to signed integers (fixed in 13.2).
  // This cast is safe with the current code.
  TO32IntList = class(TList<{$IFDEF BCB}UInt32{$ELSE}Int32{$ENDIF BCB}>);
  //TO32NativeList = class(TList<NativeInt>);

implementation

end.
