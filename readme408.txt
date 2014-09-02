TurboPower Orpheus -- Version 4.08

==============================================

1. Introduction

Version 4.08 of Orpheus contains new Delphi packages for Delphi XE2.
It is compatible with Delphi 2006, 2007, 2009, 2010, XE, XE2, XE3, XE4 and XE5
including win64-applications (in Delphi XE2, XE3, XE4 and XE5).

Although there are still packages for older versions of Delphi there
have been no tests to verifiy that this version can still be used
in older versions of Delphi.

==============================================

2. Changes

The main changes are:

A) General
- A large number of bugs - especially regarding unicode - have been fixed.
- Alternative pascal code has been added to all procedures containing
  assembler code; by defining the compiler symbol PUREPASCAL, the Orpheus
  units will not use any assembler code.

B) TOvcTextFileEditor/TOvcEditor
- Support for selecting/copying/pasting rectangular blocks of text (as in
  the Delphi IDE) has been added; this mode is activated by pressing
  <AltGr> when selecting text with the mouse.
- Improved support for handling unicode-files.
- New method TOvcCustomEditor.Text to access the editor's content as a
  string.

C) TOvcTable
- Handling different types of strings (ShortString, PChar and string) in
  table cells has been improved/made possible by introducing the new
  property 'DataStringType'. See the example in
    \examples\Delphi\Table\Table 14 DataStringType
- New property 'FloatScale' for table cells displaying floating point
  numbers. See the example in
    \examples\delphi\table\table 15 FloatScale
- New properties 'EllipsisMode' and 'IgnoreCR' to improve support for
  cells containing long and/or multi-line strings. See the example in
    \examples\delphi\table\table 16 Multiline

==============================================

3. Installation

To install TurboPower Orpheus 4.08 take the following steps:

  1. Remove any previous versions of Orpheus.

  2. Unzip Orpheus408.zip

  3. Start Delphi and add the source subdirectory (e.g., c:\orpheus\source) to
     the IDE's library path.

  4. Open & compile the runtime packages specific to the IDE being used.
     - Orpheus\packages\Delphi <Version>\O408_r.dpk
     - Orpheus\packages\Delphi <Version>\O408br.dpk

  5. Open & install the designtime packages specific to the IDE being used.
     - Orpheus\packages\Delphi <Version>\O408_d.dpk
     - Orpheus\packages\Delphi <Version>\O408bd.dpk

