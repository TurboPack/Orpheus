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

program ExTbl17_HtmlMemo_XE;

uses
  Forms,
  ExTbl17U in 'ExTbl17U.PAS' {Form1},
  ovctcedtHTMLText in '..\..\..\..\source\ovctcedtHTMLText.pas',
  ovcRTF_TOM in '..\..\..\..\source\ovcRTF_TOM.pas',
  ovcRTF_Paint in '..\..\..\..\source\ovcRTF_Paint.pas',
  ovcRTF_IText in '..\..\..\..\source\ovcRTF_IText.pas',
  ovcRTF_RichOle in '..\..\..\..\source\ovcRTF_RichOle.pas',
  ovctcedtTextFormatBar in '..\..\..\..\source\ovctcedtTextFormatBar.pas' {ovcTextFormatBar};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
