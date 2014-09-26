TurboPower Orpheus -- Version 4.07 Pre-Release


Table of contents

1.  Introduction
2.  Package names
3.  Installation


==============================================


1. Introduction

This is a "pre-release" of Orpheus version 4.07. It contains new Delphi 
packages for Delphi 2005 and Delphi 2006, along with updated packages
for Delphi 3 through Delphi 7. (The original v4.06 D3 - D7 packages did
not specify the correct path to the source files, with the result that
they could not be compiled without the paths first being corrected.)

This release does not contain any other enhancements or bug fixes that may 
have been made since the release of version 4.06. To compile these new 
version 4.07 packages, you will still need all of the source files from 
version 4.06.

==============================================

2. Package names


The Delphi 2005 runtime packages are O407_R90.dpk and O407BR90.dpk. The 
designtime packages are O407_D90.dpk and O407BD90.dpk.

The Delphi 2006 runtime packages are O407_R100.dpk and O407BR100.dpk. The 
designtime packages are O407_D100.dpk and O407BD100.dpk.

==============================================


3. Installation


To install TurboPower Orpheus into your Delphi 2005 or 2006 IDE, take the following steps:

  1. Unzip the release files into the packages directory of your Orpheus 4.06 installation
     (e.g., c:\turbopower\orpheus\packages).

  2. Start Delphi 2005 or 2006.

  3. Add the source subdirectory (e.g., c:\turbopower\orpheus\source) to the IDE's
     library path.

  4. Open & compile the runtime packages specific to the IDE being used. 
     (O407_R90.bdsproj and O407BR90.bdsproj for Delphi 2005, and O407_R100.bdsproj
     and O407BR100.bdsproj for Delphi 2006.)

  5. Open & compile the designtime packages specific to the IDE being used. 
     (O407_D90.bdsproj and O407BD90.bdsproj for Delphi 2005, and O407_D100.bdsproj
     and O407BD100.bdsproj for Delphi 2006.)

  6. Install the designtime packages into the IDE by using the Component/Install
     Packages menu option. From there, click the "Add" button and then navigate
     to the location of your newly-compiled designtime packages. (O407_D90.bpl and
     O407BD90.bpl for Delphi 2005, and O407_D100.bpl and O407BD100.bpl for Delphi 
     2006.) By default, the Delphi compiler places the compiled packages in the 
     C:\Documents and Settings\<Your User Name>\My Documents\Borland Studio Projects\Bpl
     directory.

