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

program Textedit;

uses
  Forms,
  Txtedit1 in 'TXTEDIT1.PAS' {EditForm},
  Txtedit2 in 'TXTEDIT2.PAS' {EditAbout},
  Txtedit3 in 'TXTEDIT3.PAS' {FindDlg},
  Txtedit4 in 'Txtedit4.pas' {ReplDlg};

{$IFDEF WIN32}
  {$R *.R32}
{$ELSE}
  {$R *.R16}
{$ENDIF}

begin
  Application.CreateForm(TEditForm, EditForm);
  Application.CreateForm(TEditAbout, EditAbout);
  Application.CreateForm(TFindDlg, FindDlg);
  Application.CreateForm(TReplDlg, ReplDlg);
  Application.Run;
end.
