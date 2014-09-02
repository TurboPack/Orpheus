# * ***** BEGIN LICENSE BLOCK *****                                              *
# * Version: MPL 1.1                                                             *
# *                                                                              *
# * The contents of this file are subject to the Mozilla Public License          *
# * Version 1.1 (the "License"); you may not use this file except in             *
# * compliance with the License. You may obtain a copy of the License at         *
# * http://www.mozilla.org/MPL/                                                  *
# *                                                                              *
# * Software distributed under the License is distributed on an "AS IS" basis,   *
# * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License     *
# * for the specific language governing rights and limitations under the         *
# * License.                                                                     *
# *                                                                              *
# * The Original Code is TurboPower Orpheus                                      *
# *                                                                              *
# * The Initial Developer of the Original Code is TurboPower Software            *
# *                                                                              *
# * Portions created by TurboPower Software Co. are Copyright (C) 1995-2002      *
# * TurboPower Software Co. All Rights Reserved.                                 *
# *                                                                              *
# * Contributor(s):                                                              *
# *                                                                              *
# * ***** END LICENSE BLOCK *****                                                *

# ---------------------------------------------------------------------------
!if !$d(BCB)
BCB = $(MAKEDIR)\..
!endif

# ---------------------------------------------------------------------------
# IDE SECTION
# ---------------------------------------------------------------------------
# The following section of the project makefile is managed by the BCB IDE.
# It is recommended to use the IDE to change any of the values in this
# section.
# ---------------------------------------------------------------------------

VERSION = BCB.05.03
# ---------------------------------------------------------------------------
PROJECT = O406BR51.bpl
OBJFILES = allordb.obj O406BR51.obj
RESFILES = O406BR51.res
MAINSOURCE = O406BR51.cpp
RESDEPEN = $(RESFILES)
LIBFILES =
IDLFILES =
IDLGENFILES =
LIBRARIES =
PACKAGES = vcl50.bpi vclx50.bpi vcldb50.bpi vclbde50.bpi O406_r51.bpi
SPARELIBS = vcl50.lib
DEFFILE =
# ---------------------------------------------------------------------------
PATHCPP = .;
PATHASM = .;
PATHPAS = .;
PATHRC = .;
DEBUGLIBPATH = $(BCB)\lib\debug
RELEASELIBPATH = $(BCB)\lib\release
USERDEFINES = BCB
SYSDEFINES = NO_STRICT;_VIS_NOLIB;USEPACKAGES
INCLUDEPATH = $(BCB)\include;$(BCB)\include\vcl
LIBPATH = ..\..\BCB5\CBuilder5\Projects\Lib;$(BCB)\lib\release;$(BCB)\lib\obj;$(BCB)\lib;$(BCB)\Source\ToolsAPI
WARNINGS= -w-par -w-8027 -w-8026
# ---------------------------------------------------------------------------
CFLAG1 = -O2 -Vx -Ve -Tkh30000 -X- -a8 -b- -k- -vi -c -tWM
IDLCFLAGS = -I$(BCB)\include -I$(BCB)\include\vcl -src_suffix cpp -DBCB -boa
PFLAGS = -$Y- -$L- -$D- -v -M -JPHNE
RFLAGS =
AFLAGS = /mx /w2 /zn
LFLAGS = -D"TurboPower Orpheus 4.06 data-aware runtime package - VCL51" " -aa -Tpp -Gpr -x \
    -Gn -Gl -Gi
# ---------------------------------------------------------------------------
ALLOBJ = c0pkg32.obj $(PACKAGES) sysinit.obj $(OBJFILES)
ALLRES = $(RESFILES)
ALLLIB = $(LIBFILES) $(LIBRARIES) import32.lib cp32mt.lib
# ---------------------------------------------------------------------------
!ifdef IDEOPTIONS

[Version Info]
IncludeVerInfo=0
AutoIncBuild=0
MajorVer=4
MinorVer=0
Release=6
Build=0
Debug=0
PreRelease=0
Special=0
Private=0
DLL=0

[Version Info Keys]
CompanyName=TurboPower Software Company
FileDescription=
FileVersion=4.0.6.0
InternalName=
LegalCopyright=Copyright (C) 1995-2002 TurboPower Software Company
LegalTrademarks=
OriginalFilename=
ProductName=
ProductVersion=4.06
Comments=

[Debugging]
DebugSourceDirs=$(BCB)\source\vcl

!endif





# ---------------------------------------------------------------------------
# MAKE SECTION
# ---------------------------------------------------------------------------
# This section of the project file is not used by the BCB IDE.  It is for
# the benefit of building from the command-line using the MAKE utility.
# ---------------------------------------------------------------------------

.autodepend
# ---------------------------------------------------------------------------
!if "$(USERDEFINES)" != ""
AUSERDEFINES = -d$(USERDEFINES:;= -d)
!else
AUSERDEFINES =
!endif

!if !$d(BCC32)
BCC32 = bcc32
!endif

!if !$d(CPP32)
CPP32 = cpp32
!endif

!if !$d(DCC32)
DCC32 = dcc32
!endif

!if !$d(TASM32)
TASM32 = tasm32
!endif

!if !$d(LINKER)
LINKER = ilink32
!endif

!if !$d(BRCC32)
BRCC32 = brcc32
!endif


# ---------------------------------------------------------------------------
!if $d(PATHCPP)
.PATH.CPP = $(PATHCPP)
.PATH.C   = $(PATHCPP)
!endif

!if $d(PATHPAS)
.PATH.PAS = $(PATHPAS)
!endif

!if $d(PATHASM)
.PATH.ASM = $(PATHASM)
!endif

!if $d(PATHRC)
.PATH.RC  = $(PATHRC)
!endif
# ---------------------------------------------------------------------------
$(PROJECT): $(IDLGENFILES) $(OBJFILES) $(RESDEPEN) $(DEFFILE)
    $(BCB)\BIN\$(LINKER) @&&!
    $(LFLAGS) -L$(LIBPATH) +
    $(ALLOBJ), +
    $(PROJECT),, +
    $(ALLLIB), +
    $(DEFFILE), +
    $(ALLRES)
!
# ---------------------------------------------------------------------------
.pas.hpp:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.pas.obj:
    $(BCB)\BIN\$(DCC32) $(PFLAGS) -U$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -O$(INCLUDEPATH) --BCB {$< }

.cpp.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.obj:
    $(BCB)\BIN\$(BCC32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n$(@D) {$< }

.c.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.cpp.i:
    $(BCB)\BIN\$(CPP32) $(CFLAG1) $(WARNINGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -n. {$< }

.asm.obj:
    $(BCB)\BIN\$(TASM32) $(AFLAGS) -i$(INCLUDEPATH:;= -i) $(AUSERDEFINES) -d$(SYSDEFINES:;= -d) $<, $@

.rc.res:
    $(BCB)\BIN\$(BRCC32) $(RFLAGS) -I$(INCLUDEPATH) -D$(USERDEFINES);$(SYSDEFINES) -fo$@ $<
# ---------------------------------------------------------------------------




