TurboPower Orpheus


Table of contents

1.  Introduction
2.  Package names
3.  Installation
4.  Deprecated components
5.  Version history
5.1   Release 1.11

==============================================


1. Introduction


Orpheus is an award-winning UI toolkit for Borland Delphi &
C++Builder. It contains over 120 components covering everything from
data entry to calendars and clocks. Other noteworthy components
include an Object Inspector, LookOut bar, & report views.

This is a source-only release of TurboPower Orpheus. It includes
designtime and runtime packages for Delphi 3 through 7 and C++Builder
3 through 6.

==============================================

2. Package names


TurboPower Orpheus package names have the following form:

  ONNN_KVV.*
   |   ||
   |   |+------ VV  VCL version (30=Delphi 3, 35=C++Builder 3, 70=Delphi 7)
   |   +------- K   Kind of package (R=runtime, D=designtime)
   |
   +----------- NNN Product version number (e.g., 406=version 4.06)

For example, the Orpheus runtime package files for Delphi 7 have
the filename O406_R70.*.

The runtime package contains the core functionality of the product and
is not installed into the IDE. The designtime package references the
runtime package, registers the components, and contains property
editors used in the IDE.

==============================================

3. Installation


To install TurboPower Orpheus into your IDE, take the following
steps:

  1. Unzip the release files into a directory (e.g., d:\orpheus).

  2. Start Delphi or C++Builder.

  3. Add the source subdirectory (e.g., d:\orpheus\source) to the
     IDE's library path.

  4. Open & compile the runtime package specific to the IDE being
     used.

  5. Open & install the designtime package specific to the IDE being
     used. The IDE should notify you the components have been
     installed.

==============================================

4. Deprecated components

There is a tab in the component palette called "Orpheus Deprecated",
which contains the older legacy components. As Orpheus evolves and
newer technologies are employed, you should reduce your dependence on
these components. This does not mean that you cannot use them, or that
they are ever going away, just that the emphasis on them is being
diminished as they are replaced with newer, better versions.  For new
projects, you should consider moving away from dependence on these
older style components.

==============================================

5. Version history


5.1 Release 4.06

  Bugs fixed
  ----------
  Please note that the following bug #s are from Bugzilla. These bugs were not
  exported to SourceForge.

    62 - PageUp/PageDown marks data dirty.
   421 - Incorrect memory limitation
  1755 - Invalidate doesn't get fed to controls embeddedin the LookoutBar's container
  3923 - Memory leak
  3936 - SelectionCount property non-functional on db report view
  3972 - FlexButton Popmenu in the wrong place
  4014 - O32FlexButton draws the popglyph improperly
  4036 - Flicker problem in the LookoutBar
  4091 - "Value out of range" bug in the IGrid Component Editor
  4097 - Cannot clear a OvcNumberEdit with a decimal point.
  4105 - FlexButton WheelSelection won't work.
  4106 - Debug code inadvertantly left in the OVC Collection Editor.
  4115 - OvcSearchListBox doesn't respond to programmatic settings
  4116 - Add the ability to change the menu's background color.
  4117 - Bugfix 4105 Incomplete (FlexButton WheelSelection won't work.)
  4171 - Notebook doesn't update PageIndex after programatically adding a new page.
