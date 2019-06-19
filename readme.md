# TurboPack Orpheus

Updated for **10.3 Rio** / VER330 / PKG 260

You can still access [10.2 Tokyo](https://github.com/TurboPack/Orpheus/releases/tag/102Tokyo) and [10.1 Berlin](https://github.com/TurboPack/Orpheus/releases/tag/101Berlin) versions too.

## Table of contents

1.  Introduction
2.  Package names
3.  Installation

## 1. Introduction

Orpheus is an award-winning UI toolkit for Embarcadero Delphi &
C++Builder. It contains over 120 components covering everything from
data entry to calendars and clocks. Other noteworthy components
include an Object Inspector, LookOut bar, & report views.

This is a source-only release of TurboPack Orpheus. It includes
designtime and runtime packages for Delphi and CBuilder and supports Win32 and Win64.

## 2. Package names

TurboPack Orpheus package names have the following form:

### Delphi 
* OrpheusDR.bpl (Delphi Runtime)
* OrpheusDD.bpl (Delphi Designtime)
* OrpheusDBDR.bpl (Delphi data aware Runtime)
* OrpheusDBDD.bpl (Delphi data aware Designtime)

### C++Builder
* OrpheusCR.bpl (C++Builder Runtime)
* OrpheusCD.bpl (C++Builder Designtime)
* OrpheusDBCR.bpl (C++Builder data aware Runtime)
* OrpheusDBCD.bpl (C++Builder data aware Designtime)

## 3. Installation

TurboPack Orpheus is available via the [GetIt Package Manager](http://docwiki.embarcadero.com/RADStudio/en/Installing_a_Package_Using_GetIt_Package_Manager) where you can quickly and easily install and uninstall it.

To manually install into your IDE, take the following steps:

  1. Unzip the release files into a directory (e.g., `d:\orpheus`).

  2. Start RAD Studio.

  3. Add the source subdirectory (e.g., `d:\orpheus\source`) to the
     IDE's library path. For CBuilder, add the hpp subdirectory
     (e.g., `d:\orpheus\source\hpp\Win32\Develop`) to the IDE's system include path.

  4. Open & install the designtime package specific to the IDE being
     used. The IDE should notify you the components have been
     installed.

## 4. License

[Mozilla Public License 1.1 (MPL 1.1)](https://www.mozilla.org/en-US/MPL/1.1/)
