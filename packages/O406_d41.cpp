/* ***** BEGIN LICENSE BLOCK *****                                            */
/* Version: MPL 1.1                                                           */
/*                                                                            */
/* The contents of this file are subject to the Mozilla Public License Version*/
/* 1.1 (the "License"); you may not use this file except in compliance with   */
/* the License. You may obtain a copy of the License at                       */
/* http://www.mozilla.org/MPL/                                                */
/*                                                                            */
/* Software distributed under the License is distributed on an "AS IS" basis, */
/* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   */
/* for the specific language governing rights and limitations under the       */
/* License.                                                                   */
/*                                                                            */
/* The Original Code is TurboPower Orpheus                                    */
/*                                                                            */
/* The Initial Developer of the Original Code is TurboPower Software          */
/*                                                                            */
/* Portions created by TurboPower Software Co. are Copyright (C) 1995-2002    */
/* TurboPower SOftware Co. All Rights Reserved.                               */
/*                                                                            */
/* Contributor(s):                                                            */
/*                                                                            */
/* ***** END LICENSE BLOCK *****                                              */

//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("O406_d41.res");
USEUNIT("Ovcabot0.pas");
USEUNIT("OvcAEPE.pas");
USEUNIT("OvcBtnH0.pas");
USEUNIT("OvcCmdP0.pas");
USEUNIT("OvcCmdP1.pas");
USEUNIT("ovccole0.pas");
USEUNIT("OvcColr0.pas");
USEUNIT("OvcDock0.pas");
USEUNIT("OvcEfPe.pas");
USEUNIT("OvcFNPE.pas");
USEUNIT("OvcFxFPE.pas");
USEUNIT("OvcLkOu0.pas");
USEUNIT("Ovclkou1.pas");
USEUNIT("OvcNbk0.pas");
USEUNIT("OvcNfPe.pas");
USEUNIT("OvcPfPe.pas");
USEUNIT("OvcReg.pas");
USEUNIT("OvcRvCEd.pas");
USEUNIT("OvcRvPEd.pas");
USEUNIT("OvcSfPe.pas");
USEUNIT("OvcStat0.pas");
USEUNIT("Ovctbpe1.pas");
USEUNIT("Ovctbpe2.pas");
USEUNIT("OvcTCPE.pas");
USEUNIT("OvcXfrC0.pas");
USEUNIT("OvcXfrC1.pas");
USEFORMNS("Ovcdrpve.pas", Ovcdrpve, OvcfrmRvDataItemEditor);
USEUNIT("OvcLbl2.pas");
USEFORMNS("Ovclbl1.pas", Ovclbl1, frmSaveScheme);
USEFORMNS("Ovcoutle.pas", Ovcoutle, OvcfrmOLItemsEditor);
USEPACKAGE("vclx40.bpi");
USEPACKAGE("vcl40.bpi");
USEPACKAGE("bcbsmp40.bpi");
USEPACKAGE("O406_r41.bpi");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
//   Package source.
//---------------------------------------------------------------------------
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
  return 1;
}
//---------------------------------------------------------------------------
