{*********************************************************}
{*                   OVCSTR.PAS 4.06                     *}
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
{*   Armin Biernaczyk  (unicode version of BMSearch & BMSearchUC)             *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{.W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

unit ovcstr;
  {-General string handling routines}

interface

uses
  SysUtils;

{ For unicode-strings, we have two options:
  a) Use a huge (64KB) BM-table for searches. This results in a larger overhead, but searching
     is faster, when the buffer being searched contains many 2-byte-characters.
  b) Use a small (256B) BM-Table. The overhead is smaller, but searching can be slower

  use the symbol HUGE_UNICODE_BMTABLE to use the huge BM-table; by default, the small
  BM-table is used.}

type
  BTable = array[0..{$IFDEF UNICODE}{$IFDEF HUGE_UNICODE_BMTABLE}$FFFF{$ELSE}$FF{$ENDIF}{$ELSE}$FF{$ENDIF}] of Byte;
  {table used by the Boyer-Moore search routines}

{$IFDEF UNICODE}
  TOvcCharSet = SysUtils.TSysCharSet;
{$ELSE}
  TOvcCharSet = set of AnsiChar;
{$ENDIF}


function BinaryBPChar(Dest : PChar; B : Byte) : PChar;
  {-Return a binary PChar string for a byte}
function BinaryLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return the binary PChar string for a long integer}
function BinaryWPChar(Dest : PChar; W : Word) : PChar;
  {-Return the binary PChar string for a word}
procedure BMMakeTable(MatchString : PChar; var BT : BTable);
  {-Build a Boyer-Moore link table}
function BMSearch(var Buffer; BufLength : Cardinal; var BT : BTable;
                  MatchString : PChar ; var Pos : Cardinal) : Boolean;
  {-Use the Boyer-Moore search method to search a buffer for a string}
function BMSearchUC(var Buffer; BufLength : Cardinal; var BT : BTable;
                    MatchString : PChar ; var Pos : Cardinal) : Boolean;
  {-Use the Boyer-Moore search method to search a buffer for a string. This
    search is not case sensitive}
function CharStrPChar(Dest : PChar; C : Char; Len : Cardinal) : PChar;
  {-Return a PChar string filled with the specified character}
function DetabPChar(Dest : PChar; Src : PChar; TabSize : Byte) : PChar;
  {-Expand tabs in a PChar string to blanks}
function HexBPChar(Dest : PChar; B : Byte) : PChar;
  {-Return hex PChar string for byte}
function HexLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return the hex PChar string for a long integer}
function HexPtrPChar(Dest : PChar; P : Pointer) : PChar;
  {-Return hex PChar string for pointer}
function HexWPChar(Dest : PChar; W : Word) : PChar;
  {-Return the hex PChar string for a word}
function LoCaseChar(C : Char) : Char;
  {-Convert C to lower case}
function OctalLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return the octal PChar string for a long integer}
function StrChDeletePrim(P : PChar; Pos : Cardinal) : PChar;
  {-Primitive routine to delete a character from a PChar string}
function StrChInsertPrim(Dest : PChar; C : Char; Pos : Cardinal) : PChar;
  {-Primitive routine to insert a character into a PChar string}
function StrChPos(P : PChar; C : Char; var Pos : Cardinal) : Boolean;
  {-Sets Pos to location of C in P, return is True if found}
procedure StrInsertChars(Dest : PChar; Ch : Char; Pos, Count : Word);
  {-Insert count instances of Ch into S at Pos}
function StrStCopy(Dest, S : PChar; Pos, Count : Cardinal) : PChar;
  {-Copy characters at a specified position in a PChar string}
function StrStDeletePrim(P : PChar; Pos, Count : Cardinal) : PChar;
  {-Primitive routine to delete a sub-string from a PChar string}
function StrStInsert(Dest, S1, S2 : PChar; Pos : Cardinal) : PChar;
  {-Insert a PChar string into another at a specified position}
function StrStInsertPrim(Dest, S : PChar; Pos : Cardinal) : PChar;
  {-Insert a PChar string into another at a specified position. This
    primitive version modifies the source directly}
function StrStPos(P, S : PChar; var Pos : Cardinal) : Boolean;
  {-Sets Pos to position of the S in P, returns True if found}
function StrToLongPChar(S : PChar; var I : LongInt) : Boolean;
  {-Convert a PChar string to a long integer}
procedure TrimAllSpacesPChar(P : PChar);
  {-Trim leading and trailing blanks from P}
function TrimEmbeddedZeros(const S : string) : string;
  {-Trim embedded zeros from a numeric string in exponential format}
procedure TrimEmbeddedZerosPChar(P : PChar);
  {-Trim embedded zeros from a numeric PChar string in exponential format}
function TrimTrailPrimPChar(S : PChar) : PChar;
  {-Return a PChar string with trailing white space removed}
function TrimTrailPChar(Dest, S : PChar) : PChar;
  {-Return a PChar string with trailing white space removed}
function TrimTrailingZeros(const S : string) : string;
  {-Trim trailing zeros from a numeric string. It is assumed that there is
    a decimal point prior to the zeros. Also strips leading spaces.}
procedure TrimTrailingZerosPChar(P : PChar);
  {-Trim trailing zeros from a numeric PChar string. It is assumed that
    there is a decimal point prior to the zeros. Also strips leading spaces.}
function UpCaseChar(C : Char) : Char;
  {-Convert a character to uppercase using the AnsiUpper API}

function ovcCharInSet(C: Char; const CharSet: TOvcCharSet): Boolean;

function ovc32StringIsCurrentCodePage(const S: {$IFDEF UNICODE}UnicodeString{$ELSE}WideString{$ENDIF}): Boolean; overload;
function ovc32StringIsCurrentCodePage(const S: PWideChar; CP:Cardinal=0): Boolean; overload;


implementation

uses
  Windows;

const
  Digits : array[0..$F] of Char = '0123456789ABCDEF';

function BinaryBPChar(Dest : PChar; B : Byte) : PChar;
  {-Return binary string for byte}
var
  I : Word;
begin
  Result := Dest;
  for I := 7 downto 0 do begin
    Dest^ := Digits[Ord(B and (1 shl I) <> 0)]; {0 or 1}
    Inc(Dest);
  end;
  Dest^ := #0;
end;

function BinaryLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return binary string for LongInt}
var
  I : LongInt;
begin
  Result := Dest;
  for I := 31 downto 0 do begin
    Dest^ := Digits[Ord(L and LongInt(1 shl I) <> 0)]; {0 or 1}
    Inc(Dest);
  end;
  Dest^ := #0;
end;

function BinaryWPChar(Dest : PChar; W : Word) : PChar;
  {-Return binary string for word}
var
  I : Word;
begin
  Result := Dest;
  for I := 15 downto 0 do begin
    Dest^ := Digits[Ord(W and (1 shl I) <> 0)]; {0 or 1}
    Inc(Dest);
  end;
  Dest^ := #0;
end;

procedure BMMakeTable(MatchString : PChar; var BT : BTable); register;
  {-Build Boyer-Moore link table

   Changes:
     10/2010, AB: unicode version of this procedure.
     03/2011, AB: PUREPASCAL-version added
                  Procedure can handle MatchStrings with more than 255 characters now

   Background: This table is built based on the string to be searched in a buffer to
     accelerate the search. The idea in a nutshell: imagine there is no match for 'MatchString'
     in the buffer at position p. You may try again at position p+1, then at p+2 and so on.
     However, let L := Length(MatchString) and take a look at the character c at position p+L-1
     in the buffer: If c is not present in 'MatchString', you can skip the next L-1 comparisons
     and try again at p+L.
     Even if c is present in 'MatchString' you may skip some positions - depending on the
     last occurrence of ch in MatchString.
     So, what we do is to build a table with one entry for each possible character and store
     the distance we can skip if we find this character in the buffer at p+L+1.

     Keep in mind that there is no need to store the "maximal" distance - smaller values are
     ok - the benefit of the table will just be smaller.

   What we do in detail:
     BT contains one byte for every possible character (256 Bytes for Ansi-Strings /
     65536 bytes for Unicode-Strings. The procedure fills this array as follows
     - For characters c that are not present in 'Matchstring' (not counting the last character)
       BT[c] is set to L (where L := Length(MatchString))
     - For other characters c the position p of the LAST occurrence within 'MatchString', not
       counting the last character (so p=0..L-2) is calculated and BT[c] is set to L-p-1.

     Example: For MatchString='ABCABC' we get
            BT[65] = 2   (65='A', p=4, L=6)
            BT[66] = 1   (66='B', p=5, L=6)
            BT[67] = 3   (67='C', p=3 (remember: the last character does not count), L=6)
            BT[c]  = 6 for c<65 or c>67

   If L>255, we consider the last 255 characters of MatchString. This might result "less than
   optimal" skip-distances, but still leads to a valid table. }
{$IFDEF PUREPASCAL}
var
  L: Cardinal;
  c: {$IFDEF UNICODE}Word{$ELSE}Byte{$ENDIF};
  p: Byte;
begin
  L := StrLen(MatchString);
  if L>255 then begin
    MatchString := @MatchString[L-255];
    L := 255;
  end;
  FillChar(BT, SizeOf(BTable), Byte(L));
  if L>1 then for p := 0 to L-2 do begin
    c := {$IFDEF UNICODE}Word{$ELSE}Byte{$ENDIF}(MatchString[p]);
    {$IFDEF UNICODE}{$IFNDEF HUGE_UNICODE_BMTABLE}
    { If we are using a small (256-Byte) BM-Table in unicode, no information about characters
      with c>255 can be stored. }
    if c<=255 then
    {$ENDIF}{$ENDIF}
    BT[c] := L - p - 1;
  end;
end;

{$ELSE}
{$IFDEF UNICODE}
asm
  push  esi             { Save registers because they will be changed }
  push  edi
  push  ebx

  cld                   { Ensure forward string ops }
  mov   edi, eax        { Move EAX to ESI & EDI }
  mov   esi, eax
  xor   eax, eax        { Zero EAX }
  or    ecx, -1
  repne scasw           { Search for null terminator }
  not   ecx
  dec   ecx             { ECX is length of search string }
  cmp   ecx, 0FFh       { If ECX > 255, use the last 255 characters }
  jbe   @@1
  lea   esi, [esi + 2*ecx - 510]
  mov   ecx, 0FFh

@@1:
  mov   ch, cl          { Duplicate CL in CH }
  mov   eax, ecx        { Fill each byte in EAX with length }
  shl   eax, 16
  mov   ax, cx
  mov   edi, edx        { Point to the table }
{$IFDEF HUGE_UNICODE_BMTABLE}
  mov   ecx, 4000h      { Fill table bytes with length }
{$ELSE}
  mov   ecx, 40h        { Fill table bytes with length }
{$ENDIF}
  rep   stosd
  cmp   al, 1           { If length <= 1, we're done }
  jbe   @@MTDone
  mov   edi, edx        { Reset EDI to beginning of table }
  xor   ebx, ebx        { Zero EBX }
  mov   cl, al          { Restore CL to length of string }
  dec   ecx

@@MTNext:
  lodsw                 { Load table with positions of letters }
{$IFNDEF HUGE_UNICODE_BMTABLE}
  test  ah, ah
  jnz   @@MTDontfill
{$ENDIF}
  mov   bx, ax          { That exist in the search string }
  mov   [edi+ebx], cl
@@MTDontfill:
  loop  @@MTNext

@@MTDone:
  pop   ebx             { Restore registers }
  pop   edi
  pop   esi
end;
{$ELSE}
asm
  push  esi             { Save registers because they will be changed }
  push  edi
  push  ebx

  cld                   { Ensure forward string ops }
  mov   edi, eax        { Move EAX to ESI & EDI }
  mov   esi, eax
  xor   eax, eax        { Zero EAX }
  or    ecx, -1
  repne scasb           { Search for null terminator }
  not   ecx
  dec   ecx             { ECX is length of search string }
  cmp   ecx, 0FFh       { If ECX > 255, use the last 255 characters }
  jbe   @@1
  lea   esi, [esi + ecx - 255]
  mov   ecx, 0FFh

@@1:
  mov   ch, cl          { Duplicate CL in CH }
  mov   eax, ecx        { Fill each byte in EAX with length }
  shl   eax, 16
  mov   ax, cx
  mov   edi, edx        { Point to the table }
  mov   ecx, 64         { Fill table bytes with length }
  rep   stosd
  cmp   al, 1           { If length >= 1, we're done }
  jbe   @@MTDone
  mov   edi, edx        { Reset EDI to beginning of table }
  xor   ebx, ebx        { Zero EBX }
  mov   cl, al          { Restore CL to length of string }
  dec   ecx

@@MTNext:
  lodsb                 { Load table with positions of letters }
  mov   bl, al          { That exist in the search string }
  mov   [edi+ebx], cl
  loop  @@MTNext

@@MTDone:
  pop   ebx             { Restore registers }
  pop   edi
  pop   esi
end;
{$ENDIF}
{$ENDIF}


function BMSearch(var Buffer; BufLength : Cardinal; var BT : BTable;
  MatchString : PChar; var Pos : Cardinal) : Boolean; register;
  {-Search MatchString in Buffer

   Changes:
     10/2010, AB: unicode version of this procedure.
     03/2011, AB: PUREPASCAL-version added
                  Procedure can handle MatchStrings with more than 255 characters now

   Background:
     This function searches 'MatchString' in 'Buffer' and returns True/False accordingly.
     If 'MatchString' is found, 'Pos' returns it's position within the 'Buffer'.
     'BufLength' is the size of 'Buffer' in characters (Unicode: not in bytes!). 'Pos' is
     character-based and zero-based.

     The procedure needs the BTable 'BT' which has to be computed via 'BMMakeTable' based on
     'MatchString'.
     For Length(MatchString)>1, this table ist used to accelerate the search as follows:
     Assume 'MatchString' is NOT found at Position p. The procedure looks at the
     character c at Position p+Length(MatchString)-1. The next position that has to be
     checked is not p+1, but p+BT[c]. In many cases we have BT[c]=Length(MatchString)
     which results in a significant reduction of the number of necessary comparisons.

     (This is a simplyfied version of the Boyer-Moore search algorithm). }

{$IFDEF PUREPASCAL}
var
  BufPtr : PChar;
  lenMS1 : Cardinal;
  c      : Char;
begin
  result := False;
  if (MatchString=nil) or (MatchString^=#0) then
    Exit;

  lenMS1 := StrLen(MatchString) - 1;
  if lenMS1=0 then begin
    { trivial case: we are looking for a single character; BTable is of no use here.
      We could use StrLScan, except that 'Buffer' might not be null-terminated. }
    Pos := 0;
    while (Pos<BufLength) and not result do begin
      result := PChar(@Buffer)[Pos] = MatchString^;
      if not result then Inc(Pos);
    end;
  end else begin
    { 'BufPtr' points at the character in 'Buffer' that has to be compared to the last
      character in 'MatchString'. }
    BufPtr := PChar(@Buffer) + lenMS1;
    while (BufPtr < PChar(@Buffer)+BufLength) and not result do begin
      c := BufPtr^;
      if (c=MatchString[lenMS1]) and (StrLComp(BufPtr-lenMS1, MatchString, lenMS1)=0) then begin
        result := true;
        Pos := BufPtr-lenMS1-PChar(@Buffer);
      end else begin
        if Ord(c)<High(BTable) then
          BufPtr := BufPtr + BT[Ord(c)]
        else
          Inc(BufPtr);
      end;
    end;
  end;
end;
{$ELSE}

  { remark: At the beginning of the code we have EAX=Buffer, EDX=BufLength and ECX=BT;
    MatchString and Pos are on the stack }
var
  BufPtr : Pointer;
{$IFDEF UNICODE}
                            { The Unicode-variant of this function has been derived from
                              the original non-Unicode version. }
  lenMS1: Cardinal;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx
  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BT (Pointer to Boyer-Moore-Table) to EBX }

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasw               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString (in characters) }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer (in characters) into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  cmp   edx, 1              { Check to see if we have a trivial case }
  ja    @@BMSInit           { If Length(MatchString) > 1 do BM search }
  jb    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

  mov   ax,[esi]            { If Length(MatchString) = 1 do a REPNE SCASW }
  mov   ebx, edi
  repne scasw               { search for ax, starting at edi }
  jne   @@BMSNotFound       { No match during REPNE SCASW }
  sub   edi, ebx            { Found, calculate position. EDI points to the
                              character after the matching character. }
  shr   edi, 1
  dec   edi
  mov   esi, Pos            { Set position in Pos }
  mov   [esi], edi
  mov   eax, 1              { Set result to True }
  jmp   @@BMSDone           { We're done }

@@BMSInit:
{ At this point we have: EAX = 0
                         EBX = Pointer to BT
                         EDI = Pointer to Buffer
                         ECX = Length of Buffer in characters
                         ESI = Pointer to MatchString
                         EDX = Length of MatchString in characters }

  dec   edx                 { Set up for BM Search }
  mov   lenMS1, edx         { lenMS1 := Length(MatchString)-1 }

  lea   esi, [esi + 2*edx]  { Set ESI to end of MatchString }
  lea   ecx, [edi + 2*ecx]  { Set ECX to end of buffer }
  lea   edi, [edi + 2*edx]  { Set EDI to first check point }
  mov   dx, [esi]           { Set DX to character we'll be looking for }
  sub   esi, 2              { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
{$IFNDEF HUGE_UNICODE_BMTABLE}
                            { Regarding the BM-Table there are two options:
                              a) Use a table with one entry for every character; this
                                 results in a 64K table. The following 4 lines of code
                                 can be omitted in this case.
                              b) Use a table with only 256 entries. The overhead for
                                 building the table is smaller, but for "real" 2-byte
                                 characters, you can only proceed one character. }
  test  ah,ah
  jz    @@UseBT
  add   edi, 2              { For 2-byte characters the BM-Table is not used. }
  jmp   @@BMSComp
{$ENDIF}

@@UseBT:
  movzx eax, [ebx+eax]      { Look up skip distance from table }
  lea   edi, [edi + 2*eax]  { Skip EDI ahead to next check point }

@@BMSComp:
{ At this point we have: DX  = Last character of MatchString (the char we
                               are looking for in the Buffer)
                         EBX = Pointer to Boyer-Moore-Table
                         ESI = Pointer to the second last character of MatchString
                         EDI = Pointer to the character in the buffer, that has to
                               be compared with DX
                         ECX = Pointer to the end of the Buffer (points to the first
                               byte behind the Buffer) }

  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   ax, [edi]           { Move character from buffer into AX for comparison }
  cmp   dx, ax              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  sub   edi, 2              { EDI now points to the char corresponding to ESI }
  mov   ecx, lenMS1         { Move Length(MatchString)-1 to ECX }
  repe  cmpsw               { Compare MatchString to buffer }
  je    @@BMSFound          { If equal, string is found }

  mov   eax, lenMS1         { Move Length(MatchString)-1 to AX }
  sub   eax, ecx            { Calculate offset that string didn't match }
  shl   eax, 1
  add   esi, eax            { Move ESI back to end of MatchString }
  add   edi, eax            { Move EDI to pre-string compare location }
  add   edi, 2
  mov   ax, dx              { Move character back to AX }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to the char BEFORE the start of match }
  add   edi, 2
  sub   edi, BufPtr         { Calculate position of match }
  mov   eax, edi
  shr   eax,1
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;
{$ELSE}
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx
  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX }

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  cmp   edx, 1              { Check to see if we have a trivial case }
  ja    @@BMSInit           { If Length(MatchString) > 1 do BM search }
  jb    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

  mov   al,[esi]            { If Length(MatchString) = 1 do a REPNE SCASB }
  mov   ebx, edi
  repne scasb
  jne   @@BMSNotFound       { No match during REP SCASB }
  dec   edi                 { Found, calculate position }
  sub   edi, ebx
  mov   esi, Pos            { Set position in Pos }
  mov   [esi], edi
  mov   eax, 1              { Set result to True }
  jmp   @@BMSDone           { We're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  movzx eax, [ebx+eax]      { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { Move character from buffer into AL for comparison }
  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
  mov   cl, dl              { Move Length(MatchString) to ECX }
  repe  cmpsb               { Compare MatchString to buffer }
  je    @@BMSFound          { If equal, string is found }

  mov   al, dl              { Move Length(MatchString) to AL }
  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { Move ESI back to end of MatchString }
  add   edi, eax            { Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;
{$ENDIF}
{$ENDIF}


function BMSearchUC(var Buffer; BufLength : Cardinal; var BT : BTable;
  MatchString : PChar; var Pos : Cardinal) : Boolean; register;
  {- Case-insensitive search for MatchString in Buffer. Return indicates
     success or failure.  Assumes MatchString is already raised to
     uppercase (PRIOR to creating the table)
     For details see 'BMSearch'; }

{$IFDEF PUREPASCAL}
var
  BufPtr : PChar;
  lenMS1 : Cardinal;
  c      : Char;
begin
  result := False;
  if (MatchString=nil) or (MatchString^=#0) then
    Exit;

  lenMS1 := StrLen(MatchString) - 1;
  if lenMS1=0 then begin
    { trivial case: we are looking for a single character; BTable is of no use here. }
    Pos := 0;
    while (Pos<BufLength) and not result do begin
      result := UpCaseChar(PChar(@Buffer)[Pos]) = MatchString^;
      if not result then Inc(Pos);
    end;
  end else begin
    { 'BufPtr' points at the character in 'Buffer' that has to be compared to the last
      character in 'MatchString'. }
    BufPtr := PChar(@Buffer) + lenMS1;
    while (BufPtr < PChar(@Buffer)+BufLength) and not result do begin
      c := UpCaseChar(BufPtr^);
      if (c=MatchString[lenMS1]) and (StrLIComp(BufPtr-lenMS1, MatchString, lenMS1)=0) then begin
        result := true;
        Pos := BufPtr-lenMS1-PChar(@Buffer);
      end else begin
        if Ord(c)<High(BTable) then
          BufPtr := BufPtr + BT[Ord(c)]
        else
          Inc(BufPtr);
      end;
    end;
  end;
end;
{$ELSE}

  { remark: At the beginning of the code we have EAX=Buffer, EDX=BufLength and ECX=BT;
    MatchString and Pos are on the stack
    The code is slightly different to BMSearch, because
     - we cannot use REPNE SCASB(W) when Length(MatchString)=1 and
     - we cannot use REPE CMPB(W) for comparing MatchString with
       a text in the buffer. -}
var
  BufPtr : Pointer;
{$IFDEF UNICODE}
  lenMS1: Cardinal;
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx
  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BT (Pointer to Boyer-Moore-Table) to EBX }

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasw               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString (in Characters) }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer (in characters) into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  or    dl, dl              { Check to see if we have a trivial case }
  jz    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

{ At this point we have: EAX = 0
                         EBX = Pointer to BT
                         EDI = Pointer to Buffer
                         ECX = Length of Buffer in characters
                         ESI = Pointer to MatchString
                         EDX = Length of MatchString in characters }

  dec   edx                 { Set up for BM Search }
  mov   lenMS1, edx         { lenMS1 := Length(MatchString)-1 }

  shl   edx, 1
  add   esi, edx            { Set ESI to end of MatchString }
  shl   ecx, 1
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dx, [esi]           { Set DX to character we'll be looking for }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
{$IFNDEF HUGE_UNICODE_BMTABLE}
  test  ah,ah
  jz    @@UseBT
  add   edi, 2              { For 2-byte characters, the BM-Table is not used. }
  jmp   @@BMSComp
{$ENDIF}

@@UseBT:
  movzx ax, [ebx+eax]       { Look up skip distance from table }
  shl   ax, 1
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
{ At this point we have: EAX = 0
                         DX  = Last character of MatchString (the character we
                               are looking for in the Buffer)
                         EBX = Pointer to Boyer-Moore-Table
                         ESI = Pointer to the last character of MatchString
                         EDI = Pointer to the character in the buffer that has to
                               be compared with DX
                         ECX = Pointer to the end of the Buffer (points to the first
                               byte behind the Buffer) }

  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   ax, [edi]           { Move character from buffer into AX for comparison }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  push  eax                 { Push Char onto stack for CharUpper }
  call  CharUpper
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  cmp   dx, ax              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  mov   ecx, LenMS1         { Move Length(MatchString)-1 to ECX }
  jcxz  @@BMSFound          { If CX is zero, string is found }

@@StringComp:
  sub   edi, 2              { Dec buffer index }
  mov   ax, [edi]           { Get char from buffer }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  push  eax                 { Push Char onto stack for CharUpper }
  call  CharUpper
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  sub   esi, 2
  cmp   ax, [esi]
  loope @@StringComp        { OK?  Get next character }
  je    @@BMSFound          { Matched! }

  mov   eax, lenMS1         { Move Length(MatchString)-1 to AX }
  sub   ax, cx              { Calculate offset that string didn't match }
  shl   ax, 1
  add   esi, eax            { Move ESI back to end of MatchString }
  add   edi, eax            { Move EDI to pre-string compare location }

  mov   ax, dx              { Move character back to AX }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to the char BEFORE the start of match }
  sub   edi, BufPtr         { Calculate position of match }
  mov   eax, edi
  shr   eax,1
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;
{$ELSE}
asm
  push  edi                 { Save registers since we will be changing }
  push  esi
  push  ebx
  push  edx

  mov   BufPtr, eax         { Copy Buffer to local variable and ESI }
  mov   esi, eax
  mov   ebx, ecx            { Copy BufLength to EBX }

  cld                       { Ensure forward string ops }
  xor   eax, eax            { Zero out EAX so we can search for null }
  mov   edi, MatchString    { Set EDI to beginning of MatchString }
  or    ecx, -1             { We will be counting down }
  repne scasb               { Find null }
  not   ecx                 { ECX = length of MatchString + null }
  dec   ecx                 { ECX = length of MatchString }
  mov   edx, ecx            { Copy length of MatchString to EDX }

  pop   ecx                 { Pop length of buffer into ECX }
  mov   edi, esi            { Set EDI to beginning of search buffer }
  mov   esi, MatchString    { Set ESI to beginning of MatchString }

  or    dl, dl              { Check to see if we have a trivial case }
  jz    @@BMSNotFound       { If Length(MatchString) = 0 we're done }

@@BMSInit:
  dec   edx                 { Set up for BM Search }
  add   esi, edx            { Set ESI to end of MatchString }
  add   ecx, edi            { Set ECX to end of buffer }
  add   edi, edx            { Set EDI to first check point }
  mov   dh, [esi]           { Set DH to character we'll be looking for }
  dec   esi                 { Dec ESI in prep for BMSFound loop }
  std                       { Backward string ops }
  jmp   @@BMSComp           { Jump to first comparison }

@@BMSNext:
  mov   al, [ebx+eax]       { Look up skip distance from table }
  add   edi, eax            { Skip EDI ahead to next check point }

@@BMSComp:
  cmp   edi, ecx            { Have we reached end of buffer? }
  jae   @@BMSNotFound       { If so, we're done }
  mov   al, [edi]           { Move character from buffer into AL for comparison }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  push  eax                 { Push Char onto stack for CharUpper }
  cld
  call  CharUpper
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  cmp   dh, al              { Compare }
  jne   @@BMSNext           { If not equal, go to next checkpoint }

  push  ecx                 { Save ECX }
  dec   edi
  xor   ecx, ecx            { Zero ECX }
  mov   cl, dl              { Move Length(MatchString) to ECX }
  jecxz @@BMSFound          { If ECX is zero, string is found }

@@StringComp:
  mov   al, [edi]           { Get char from buffer }
  dec   edi                 { Dec buffer index }

  push  ebx                 { Save registers }
  push  ecx
  push  edx
  push  eax                 { Push Char onto stack for CharUpper }
  cld
  call  CharUpper
  std
  pop   edx                 { Restore registers }
  pop   ecx
  pop   ebx

  mov   ah, al              { Move buffer char to AH }
  lodsb                     { Get MatchString char }
  cmp   ah, al              { Compare }
  loope @@StringComp        { OK?  Get next character }
  je    @@BMSFound          { Matched! }

  xor   ah, ah              { Zero AH }
  mov   al, dl              { Move Length(MatchString) to AL }
  sub   al, cl              { Calculate offset that string didn't match }
  add   esi, eax            { Move ESI back to end of MatchString }
  add   edi, eax            { Move EDI to pre-string compare location }
  inc   edi
  mov   al, dh              { Move character back to AL }
  pop   ecx                 { Restore ECX }
  jmp   @@BMSNext           { Do another compare }

@@BMSFound:                 { EDI points to start of match }
  mov   edx, BufPtr         { Move pointer to buffer into EDX }
  sub   edi, edx            { Calculate position of match }
  mov   eax, edi
  inc   eax
  mov   esi, Pos
  mov   [esi], eax          { Set Pos to position of match }
  mov   eax, 1              { Set result to True }
  pop   ecx                 { Restore ESP }
  jmp   @@BMSDone

@@BMSNotFound:
  xor   eax, eax            { Set result to False }

@@BMSDone:
  cld                       { Restore direction flag }
  pop   ebx                 { Restore registers }
  pop   esi
  pop   edi
end;
{$ENDIF}
{$ENDIF}


function CharStrPChar(Dest : PChar; C : Char;
                      Len : Cardinal) : PChar; register;
  {- inserts char C Len times into Dest; adds #0
     Dest must point to a buffer for at least Len+1 characters

   Changes:
     03/2011, AB: PUREPASCAL-version added }

{$IFDEF PUREPASCAL}
begin
  Dest[Len] := #0;
  while Len>0 do begin
    Dec(Len);
    Dest[Len] := C;
  end;
  Result := Dest;
end;

{$ELSE}
asm
  push    edi            { Save EDI-about to change it }
  push    eax            { Save Dest pointer for return }
  mov     edi, eax       { Point EDI to Dest }
  cld                    { Forward! }

{$IFDEF UNICODE}
  mov     ax, dx         { ax = C }
  shr     ecx,1
  jnc     @@even
  stosw                  { store first char (if C is odd) }

@@even:
  jecxz    @@Done        { Done if ECX=0 }
  shl     eax, $10
  mov     ax, dx         { duplicate character }
  rep     stosd

@@Done:
  xor     ax,ax          { Add null terminator }
  stosw

{$ELSE}
  mov     dh, dl         { Dup character 4 times }
  mov     eax, edx
  shl     eax, $10
  mov     ax, dx

  mov     edx, ecx       { Save Len }

  shr     ecx, 2         { Store dword char chunks first }
  rep     stosd
  mov     ecx, edx       { Store remaining characters }
  and     ecx, 3
  rep     stosb

  xor     al,al          { Add null terminator }
  stosb
{$ENDIF}

  pop     eax            { Return Dest pointer }
  pop     edi            { Restore orig value of EDI }
end;
{$ENDIF}


function DetabPChar(Dest : PChar; Src : PChar; TabSize : Byte) : PChar; register;
  { -Expand tabs in a string to blanks on spacing TabSize

   Changes:
     10/2010, AB: unicode version of this procedure.
     03/2011, AB: PUREPASCAL-version added }

{$IFDEF PUREPASCAL}
  var
  i, j: Integer;
  k: SmallInt;
  ch: Char;
begin
  i := 0;
  j := 0;
  repeat
    ch := Src[j];
    if ch <> #9 then begin
      Dest[i] := ch;
      Inc(i);
    end else begin
      for k := 1 to TabSize - i mod TabSize do begin
        Dest[i] := ' ';
        Inc(i);
      end;
    end;
    Inc(j);
  until ch=#0;
  result := Dest;
end;

{$ELSE}
  asm
  push    eax           { Save Dest for return value }
  push    edi           { Save EDI, ESI and EBX, we'll be changing them }
  push    esi
  push    ebx

  mov     esi, edx      { ESI -> Src }
  mov     edi, eax      { EDI -> Dest }
  xor     ebx, ebx      { Get TabSize in EBX }
  add     bl, cl
  jz      @@Done        { Exit if TabSize is zero }

  cld                   { Forward! }
  xor     edx, edx      { Set output length to zero }

{$IFDEF UNICODE}
@@Next:
  lodsw                 { Get next input character }
  or      ax, ax        { Is it a null? }
  jz      @@Done        { Yes-all done }
  cmp     ax, 09        { Is it a tab? }
  je      @@Tab         { Yes, compute next tab stop }
  stosw                 { No, store to output }
  inc     edx           { Increment output length }
  jmp     @@Next        { Next character }

@@Tab:
  push    edx           { Save output length }
  mov     eax, edx      { Get current output length in DX:AX }
  xor     edx, edx
  div     ebx           { Output length MOD TabSize in DX }
  mov     ecx, ebx      { Calc number of spaces to insert... }
  sub     ecx, edx      { = TabSize - Mod value }
  pop     edx
  add     edx, ecx      { Add count of spaces into current output length }

  mov     eax,$0020     { Blank in AX }
  rep     stosw         { Store blanks }
  jmp     @@Next        { Back for next input }

@@Done:
  xor     ax,ax         { Store final null terminator }
  stosw
{$ELSE}
@@Next:
  lodsb                 { Get next input character }
  or      al, al        { Is it a null? }
  jz      @@Done        { Yes-all done }
  cmp     al, 09        { Is it a tab? }
  je      @@Tab         { Yes, compute next tab stop }
  stosb                 { No, store to output }
  inc     edx           { Increment output length }
  jmp     @@Next        { Next character }

@@Tab:
  push    edx           { Save output length }
  mov     eax, edx      { Get current output length in DX:AX }
  xor     edx, edx
  div     ebx           { Output length MOD TabSize in DX }
  mov     ecx, ebx      { Calc number of spaces to insert... }
  sub     ecx, edx      { = TabSize - Mod value }
  pop     edx
  add     edx, ecx      { Add count of spaces into current output length }

  mov     eax,$2020     { Blank in AH, Blank in AL }
  shr     ecx, 1        { Store blanks }
  rep     stosw
  adc     ecx, ecx
  rep     stosb
  jmp     @@Next        { Back for next input }

@@Done:
  xor     al,al         { Store final null terminator }
  stosb
{$ENDIF}

  pop     ebx           { Restore caller's EBX, ESI and EDI }
  pop     esi
  pop     edi
  pop     eax           { Return Dest }
end;
{$ENDIF}


function HexBPChar(Dest : PChar; B : Byte) : PChar;
  {-Return hex string for byte}
begin
  Result := Dest;
  Dest^ := Digits[B shr 4];
  Inc(Dest);
  Dest^ := Digits[B and $F];
  Inc(Dest);
  Dest^ := #0;
end;


function HexLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return the hex string for a long integer}
var
  T2 : Array[0..4] of Char;
begin
  Result := StrCat(HexWPChar(Dest, HIWORD(L)), HexWPChar(T2, LOWORD(L)));
end;


function HexPtrPChar(Dest : PChar; P : Pointer) : PChar;
  {-Return hex string for pointer}
var
  T2 : Array[0..4] of Char;
begin
  StrCat(HexWPChar(Dest, HIWORD(LongInt(P))), ':');
  Result := StrCat(Dest, HexWPChar(T2, LOWORD(LongInt(P))));
end;


function HexWPChar(Dest : PChar; W : Word) : PChar;
begin
  Result := Dest;
  Dest^ := Digits[Hi(W) shr 4];
  Inc(Dest);
  Dest^ := Digits[Hi(W) and $F];
  Inc(Dest);
  Dest^ := Digits[Lo(W) shr 4];
  Inc(Dest);
  Dest^ := Digits[Lo(W) and $F];
  Inc(Dest);
  Dest^ := #0;
end;


function LoCaseChar(C: Char) : Char; register;
  {-Convert C to lower case

   Changes:
     03/2011, AB: PUREPASCAL-version added
                  Bugfix: function returned an uppercase character }

{$IFDEF PUREPASCAL}
begin
  { CharLower is defined as function CharLower(P:PChar): PChar.
    However, this Windows-function will transform a character C to
    lowercase if the character ist passed to the function - in this
    case, the new charater will be returned. }
  result := Char(CharLower(PChar(C)));
end;

{$ELSE}
asm
{$IFDEF UNICODE}
  movzx eax, ax
{$ELSE}
  movzx eax, al
{$ENDIF}
  push  eax
  call  CharLower
end;
{$ENDIF}


function OctalLPChar(Dest : PChar; L : LongInt) : PChar;
  {-Return the octal PChar string for a long integer

   Changes:
     03/2011, AB: Bugfix: function did not work for UNICODE }
var
  I : Integer;
begin
  Result := Dest;
  Dest[12] := #0;
  for I := 11 downto 0 do begin
    Dest[I] := Digits[L and 7];
    L :=  L shr 3;
  end;
end;


function StrChDeletePrim(P : PChar; Pos : Cardinal) : PChar; register;
  {-Delete one character at pos P

   Changes:
     03/2011, AB: PUREPASCAL-version added
                  Bugfix: both unicode & ansi-version failed for Pos=StrLen(P) }

{$IFDEF PUREPASCAL}
begin
  result := P;
  if Pos < StrLen(P) then
    StrCopy(P + Pos, P + Pos + 1);
end;

{$ELSE}
{$IFDEF UNICODE}
begin
  result := P;
  if Pos < StrLen(P) then
    StrCopy(P + Pos, P + Pos + 1);
end;

{$ELSE}
asm
  push   edi             { Save because we will be changing them }
  push   esi
  push   ebx

  mov    ebx, eax        { Save P to EDI & EBX }
  mov    edi, eax

  xor    al, al          { Zero }
  or     ecx, -1         { Set ECX to $FFFFFFFF }
  cld
  repne  scasb           { Find null terminator }
  not    ecx
  dec    ecx             { ECX = StrLen(P) }
  jecxz  @@ExitPoint
  sub    ecx, edx        { Calc number to move }
  jbe    @@ExitPoint     { Exit if Pos >= StrLen }

  mov    edi, ebx
  add    edi, edx        { Point to position to adjust }
  mov    esi, edi
  inc    esi             { Offset for source string }
  inc    ecx             { One more to include null terminator }
  rep    movsb           { Adjust the string }
@@ExitPoint:

  mov    eax, ebx
  pop    ebx             { restore registers }
  pop    esi
  pop    edi
end;
{$ENDIF}
{$ENDIF}


function StrChInsertPrim(Dest : PChar; C : Char;
                         Pos : Cardinal) : PChar; register;
  {-Primitive routine to insert a character into a PChar string
    note: if Pos>=StrLen(Dest), C will be appended

   Changes:
     01/2010, SZ: Unicode verified 27.01.2010
     03/2011, AB: PUREPASCAL-version added
                  improved performace of unicode-version
                  Bugfix: Ansi-Version failed for Pos=StrLen(Dest) }

{$IFDEF PUREPASCAL}
var
  L: Cardinal;
begin
  result := Dest;
  L := StrLen(Dest);
  if Pos >= L then begin
    Dest[L]   := C;
    Dest[L+1] := #0;
  end else begin
    // StrCopy does not work here...
    Move(Dest[Pos], Dest[Pos+1], (L-Pos+1)*SizeOf(Char));
    Dest[Pos] := C;
  end;
end;

{$ELSE}
asm
  push   eax             {save because we will be changing them}
  push   edi
  push   esi
  push   ebx

  xor    ebx, ebx        {zero}
  mov    ebx, ecx        {move POS to ebx}

  mov    esi, eax        {copy Dest to ESI and EDI}
  mov    edi, eax

  xor    ax, ax          {zero}
  or     ecx, -1         {set ECX to $FFFFFFFF}
  cld                    {ensure forward}

{$IFDEF UNICODE}
  repne  scasw           {find null terminator}

  not    ecx             {calc length (including null)}
  std                    {backwards string ops}
  lea    esi, [edi - 2]  {point to end of source string}
  sub    ecx, ebx        {calculate number to do}
  ja     @@1             {append if Pos greater than strlen }
  mov    ecx, 1

@@1:
  rep    movsw           {adjust tail of string}
  mov    word [edi], dx  {insert the new character}

{$ELSE}
  repne  scasb           {find null terminator}

  not    ecx             {calc length (including null)}
  std                    {backwards string ops}
  add    esi, ecx
  dec    esi             {point to end of source string}
  sub    ecx, ebx        {calculate number to do}
  ja     @@1             {append if Pos greater than strlen}
  mov    ecx, 1

@@1:
  rep    movsb           {adjust tail of string}
  mov    byte [edi], dl  {insert the new character}

{$ENDIF}

@@ExitPoint:

  cld                    {be a good neighbor}
  pop    ebx             {restore registers}
  pop    esi
  pop    edi
  pop    eax
end;
{$ENDIF}


function StrChPos(P : PChar; C : Char;
                  var Pos : Cardinal): Boolean; register;
  {-Sets Pos to position of character C within string P returns True if found

   Changes:
     01/2010, SZ: Unicode verified 27.01.2010
     03/2011, AB: PUREPASCAL-version added (identical to unicode-version)
     09/2011, AB: Fix for issue 3405788 as suggested by Wolfgang Klein }

{$IFDEF PUREPASCAL}
var
  Tmp: PChar;
begin
  Tmp := StrScan(P, C);
  Result := Tmp <> nil;
  if Result then
    Pos := Tmp - P;
end;

{$ELSE}
{$IFDEF UNICODE}
var
  Tmp: PChar;
begin
  Tmp := StrScan(P, C);
  Result := Tmp <> nil;
  if Result then
    Pos := Tmp - P;
end;

{$ELSE}
asm
  push   esi               {save since we'll be changing}
  push   edi
  push   ebx
  mov    esi, ecx          {save Pos}

  cld                      {forward string ops}
  mov    edi, eax          {copy P to EDI}
  or     ecx, -1
  xor    eax, eax          {zero}
  mov    ebx, edi          {save EDI to EBX}
  repne  scasb             {search for NULL terminator}
  not    ecx
  dec    ecx               {ecx has len of string}
  jecxz  @@NotFound        {if len of P = 0 then done}

  mov    edi, ebx          {reset EDI to beginning of string}
  mov    al, dl            {copy C to AL}
  repne  scasb             {find C in string}
  jne    @@NotFound

  mov    ecx, edi          {calculate position of C}
  sub    ecx, ebx
  dec    ecx               {ecx holds found position}

  mov    [esi], ecx        {store location}
  mov    eax, 1            {return true}
  jmp    @@ExitCode

@@NotFound:
  xor    eax, eax

@@ExitCode:

  pop    ebx               {restore registers}
  pop    edi
  pop    esi
end;
{$ENDIF}
{$ENDIF}


procedure StrInsertChars(Dest : PChar; Ch : Char; Pos, Count : Word);
  {-Insert count instances of Ch into S at Pos

   Changes:
     03/2011, AB: Bugfix: procedure did not work for Count>1024 }
var
  Count1024: Word;
  A : array[0..1024] of Char;
begin
  repeat
    if Count<=1024 then Count1024 := Count else Count1024 := 1024;
    StrPCopy(A, StringOfChar(Ch, Count1024));
    StrStInsertPrim(Dest, A, Pos);
    Count := Count - Count1024;
  until Count=0;
end;


function StrStCopy(Dest : PChar; S : PChar; Pos, Count : Cardinal) : PChar;
  {-Copy characters at a specified position in a PChar string}
var
  Len : Cardinal;
begin
  Len := StrLen(S);
  if Pos < Len then begin
    if (Len-Pos) < Count then
      Count := Len-Pos;
    Move(S[Pos], Dest^, Count * SizeOf(Char));
    Dest[Count] := #0;
  end else
    Dest[0] := #0;
  Result := Dest;
end;


function StrStDeletePrim(P : PChar; Pos, Count : Cardinal) : PChar; register;
  {-Primitive routine to delete a sub-string from a PChar string

   Changes:
     01/2010, SZ: Unicode verified 27.01.2010
     03/2011, AB: Bugfixes: function did not work in several cases like
                            P='' or Pos=0 & Count>StrLen(P)
                  Added PUREPASCAL version }

{$IFDEF PUREPASCAL}
var
  LP: Cardinal;
begin
  result := P;
  LP := StrLen(P);
  if Pos>=LP then
    Exit;               { nothing to do if Pos>=StrLen(P) }
  if Pos + Count >= LP then
    P[Pos] := #0
  else
    Move(P[Pos+Count], P[Pos], (LP-Pos-Count+1)*SizeOf(Char));
end;

{$ELSE}
asm
  push   eax             {save because we will be changing them}
  push   edi
  push   esi
  push   ebx

  mov    ebx, ecx        {move Count to EBX}
  mov    esi, eax        {move P to ESI and EDI}
  mov    edi, eax

  xor    eax, eax        {null}
  or     ecx, -1
  cld

{$IFDEF UNICODE}
  repne  scasw           {find null terminator}
  not    ecx             {calc length}
  dec    ecx             {ECX = StrLen(P) }
  jecxz  @@ExitPoint

  sub    ecx, edx
  jle    @@ExitPoint     {nothing to do if StrLen(P)<=Pos }

  lea    edi, [esi + 2*edx] {edi points to first character to delete }

  sub    ecx, ebx
  jg     @@L1

  stosw                  {delete everything starting at edi}
  jmp    @@ExitPoint

@@L1:
  lea    esi, [edi + 2*ebx]
  inc    ecx
  rep    movsw           {adjust the string}

{$ELSE}

  repne  scasb           {find null terminator}
  not    ecx             {calc length}
  dec    ecx             {ECX = StrLen(P) }
  jecxz  @@ExitPoint

  sub    ecx, edx
  jle    @@ExitPoint     {nothing to do if StrLen(P)<=Pos }

  lea    edi, [esi + edx] {edi points to first character to delete }

  sub    ecx, ebx
  jg     @@L1

  stosb                  {delete everything starting at edi}
  jmp    @@ExitPoint

@@L1:
  lea    esi, [edi + ebx]
  inc    ecx
  rep    movsb           {adjust the string}

{$ENDIF}
@@ExitPoint:

  pop    ebx            {restore registers}
  pop    esi
  pop    edi
  pop    eax
end;
{$ENDIF}


function StrStInsert(Dest : PChar; S1, S2 : PChar; Pos : Cardinal) : PChar;
begin
  StrCopy(Dest, S1);
  Result := StrStInsertPrim(Dest, S2, Pos);
end;


function StrStInsertPrim(Dest : PChar; S : PChar;
                         Pos : Cardinal) : PChar; register;
  {-Insert a PChar string into another at a specified position. This
    primitive version modifies the source directly

   Changes:
     01/2010, SZ: Unicode verified 27.01.2010
     03/2011, AB: Added PUREPASCAL version }

{$IFDEF PUREPASCAL}
var
  LS, LD: Cardinal;
begin
  result := Dest;
  LS := StrLen(S);
  if LS=0 then Exit;     { nothing to do if S='' }

  LD := StrLen(Dest);
  if Pos > LD then
    Pos := LD;           { Append if Pos>StrLen(Dest) }
  Move(Dest[Pos], Dest[Pos+LS], (LD-Pos+1)*SizeOf(Char));
                         { get space for S }
  Move(S[0], Dest[Pos], LS*SizeOf(Char));
                         { insert S  into Dest }
end;

{$ELSE}
asm
  push   eax             {save because we will be changing them}
  push   edi
  push   esi
  push   ebx

  mov    ebx, ecx        {move POS to ebx}
  mov    esi, eax        {copy Dest to ESI, S to EDI}
  mov    edi, edx

  xor    ax, ax          {zero}
  or     ecx, -1         {set ECX to $FFFFFFFF}
  cld                    {ensure forward}

{$IFDEF UNICODE}
  repne  scasw           {find null terminator}
  not    ecx             {calc length of source string (including null)}
  dec    ecx             {length without null}
  jecxz  @@ExitPoint     {if source length = 0, exit}
  push   ecx             {save length for later}

  mov    edi, esi        {reset EDI to Dest}
  or     ecx, -1
  repne  scasw           {find null}
  not    ecx             {length of dest string}

  cmp    ebx, ecx
  jb     @@1
  mov    ebx, ecx        { if Pos>StrLen(Dest), append }
  dec    ebx

@@1:
  std                    {backwards string ops}
  pop    eax             {restore length of S from stack}
  lea    edi, [edi+2*eax-2] {set EDI S beyond end of Dest}
  lea    esi, [esi+2*ecx-2] {set ESI to end of Dest}
  sub    ecx, ebx        {# of chars in Dest that are past Pos}
  rep    movsw           {adjust tail of string}

  lea    esi, [edx+2*eax-2] {set ESI to end of S}
  mov    ecx, eax        {# of chars in S}
  rep    movsw           {copy S into Dest}
{$ELSE}
  repne  scasb           {find null terminator}
  not    ecx             {calc length of source string (including null)}
  dec    ecx             {length without null}
  jecxz  @@ExitPoint     {if source length = 0, exit}
  push   ecx             {save length for later}

  mov    edi, esi        {reset EDI to Dest}
  or     ecx, -1
  repne  scasb           {find null}
  not    ecx             {length of dest string}

  cmp    ebx, ecx
  jb     @@1
  mov    ebx, ecx
  dec    ebx

@@1:
  std                    {backwards string ops}
  pop    eax             {restore length of S from stack}
  add    edi, eax        {set EDI S beyond end of Dest}
  dec    edi             {back up one for null}

  add    esi, ecx        {set ESI to end of Dest}
  dec    esi             {back up one for null}
  sub    ecx, ebx        {# of chars in Dest that are past Pos}
  rep    movsb           {adjust tail of string}

  mov    esi, edx        {set ESI to S}
  add    esi, eax        {set ESI to end of S}
  dec    esi             {back up one for null}
  mov    ecx, eax        {# of chars in S}
  rep    movsb           {copy S into Dest}
{$ENDIF}

  cld                    {be a good neighbor}

@@ExitPoint:
  pop    ebx             {restore registers}
  pop    esi
  pop    edi
  pop    eax
end;
{$ENDIF}


function StrStPos(P, S : PChar; var Pos : Cardinal) : boolean; register;
  {-Sets Pos to position of S in P, returns True if found

   Changes:
     01/2010, SZ: Unicode verified 27.01.2010
     03/2011, AB: Added PUREPASCAL version (identical to unicode-version) }

{$IFDEF PUREPASCAL}
var
  Q: PChar;
begin
  Q := StrPos(P, S);
  if Q = nil then
  begin
    Pos := 0;
    Result := False;
  end
  else
  begin
    Pos := Q - P;
    Result := True;
  end;
end;

{$ELSE}
{$IFDEF UNICODE}
var
  Q: PChar;
begin
  Q := StrPos(P, S);
  if Q = nil then
  begin
    Pos := 0;
    Result := False;
  end
  else
  begin
    Pos := Q - P;
    Result := True;
  end;
end;
{$ELSE}
asm
  push   edi                 { Save registers }
  push   esi
  push   ebx
  push   ecx

  mov    ebx, eax            { Move P to EBX }
  mov    edi, edx            { Move S to EDI & ESI }
  mov    esi, edx

  xor    eax, eax            { Zero EAX }
  or     ecx, -1             { Set ECX to FFFFFFFF }
  repne  scasb               { Find null at end of S }
  not    ecx

  mov    edx, ecx            { Save length to EDX }
  dec    edx                 { EDX has len of S }
  test   edx, edx
  jz     @@NotFound          { If len of S = 0 then done }

  mov    edi, ebx            { Set EDI to beginning of P }
  or     ecx, -1             { Set ECX to FFFFFFFF }
  repne  scasb               { Find null at end of P }
  not    ecx
  dec    ecx                 { ECX has len of P }
  jcxz   @@NotFound          { If len of P = 0 then done }

  dec    edx
  sub    ecx,edx             { Max chars to search }
  jbe    @@NotFound          { Done if len S > len P }
  lodsb                      { Get first char of S in AL }
  mov    edi,ebx             { Set EDI to beginning of EDI }

@@Next:
  repne  scasb               { Find first char of S in P }
  jne    @@NotFound          { If not found then done }
  test   edx, edx            { If length of S was one then found }
  jz     @@Found
  push   ecx
  push   edi
  push   esi
  mov    ecx,edx
  repe   cmpsb               { See if remaining chars in S match }
  pop    esi
  pop    edi
  pop    ecx
  je     @@Found             { Yes, so found }
  jmp    @@Next              { Look for next first char occurrence }

@@NotFound:
  pop    ecx
  xor    eax,eax             { Set return to False }
  jmp    @@ExitPoint

@@Found:
  dec    edi                 { Calc position of found string }
  mov    eax, edi
  sub    eax, ebx
  pop    ecx
  mov    [ecx], eax
  mov    eax, 1              { Set return to True }

@@ExitPoint:
  pop    ebx                 { Restore registers }
  pop    esi
  pop    edi
end;
{$ENDIF}
{$ENDIF}


function StrToLongPChar(S : PChar; var I : LongInt) : Boolean;
  {-Convert a string to a longint, returning true if successful}
//SZ Unicode verified 27.01.2010
var
  Code : Cardinal;
  P    : array[0..255] of Char;
begin
  if StrLen(S)+1 > SizeOf(P) then begin
    Result := False;
    I := -1;
    Exit;
  end;
  StrCopy(P, S);
  TrimTrailPrimPChar(P);
  if StrStPos(P, '0x', Code) then begin
    StrStDeletePrim(P, Code, 2);
    StrChInsertPrim(P, '$', Code);
  end;
  Val(P, I, Code);
  if Code <> 0 then begin
    I := Code - 1;
    Result := False;
  end else
    Result := True;
end;


procedure TrimAllSpacesPChar(P : PChar);
  {-Trim leading and trailing blanks from P}
var
  I : Integer;
  PT : PChar;
begin
  I := StrLen(P);
  if I = 0 then
    Exit;

  {delete trailing spaces}
  Dec(I);
  while (I >= 0) and (P[I] = ' ') do begin
    P[I] := #0;
    Dec(I);
  end;

  {delete leading spaces}
  I := 0;
  PT := P;
  while PT^ = ' ' do begin
    Inc(I);
    Inc(PT);
  end;
  if I > 0 then
    StrStDeletePrim(P, 0, I);
end;


function TrimEmbeddedZeros(const S : string) : string;
  {-trim embedded zeros from a numeric string in exponential format

   Changes:
     03/2011, AB: Bugfix: function result was undefined for Pos('E',S)=0 }
var
  I, J : Integer;
begin
  Result := S;

  I := Pos('E', S);
  if I = 0 then
    Exit;  {nothing to do}

  {get rid of excess 0's after the decimal point}
  J := I;
  while (J > 1) and (Result[J-1] = '0') do
    Dec(J);
  if J <> I then begin
    System.Delete(Result, J, I-J);

    {get rid of the decimal point if that's all that's left}
    if (J > 1) and (Result[J-1] = '.') then
      System.Delete(Result, J-1, 1);
  end;

  {get rid of excess 0's in the exponent}
  I := Pos('E', Result);
  if I > 0 then begin
    Inc(I);
    J := I;
    while Result[J+1] = '0' do
      Inc(J);
    if J > I then
      System.Delete(Result, I+1, J-I);
  end;
end;


procedure TrimEmbeddedZerosPChar(P : PChar);
  {-Trim embedded zeros from a numeric string in exponential format}
var
  I, J : Cardinal;
begin
  if not StrChPos(P, 'E', I) then
    Exit;

  {get rid of excess 0's after the decimal point}
  J := I;
  while (J > 0) and (P[J-1] = '0') do
    Dec(J);
  if J <> I then begin
    StrStDeletePrim(P, J, I-J);

    {get rid of the decimal point if that's all that's left}
    if (J > 0) and (P[J-1] = '.') then
      StrStDeletePrim(P, J-1, 1);
  end;

  {Get rid of excess 0's in the exponent}
  if StrChPos(P, 'E', I) then begin
    Inc(I);
    J := I;
    while P[J+1] = '0' do
      Inc(J);
    if J > I then
      if P[J+1] = #0 then
        P[I-1] := #0
      else
        StrStDeletePrim(P, I+1, J-I);
  end;
end;


function TrimTrailingZeros(const S : string) : string;
  {-Trim trailing zeros from a numeric string. It is assumed that there is
    a decimal point prior to the zeros. Also strips leading spaces.

   Changes:
     03/2011, AB: Bugfix: function result was undefined for S='' }
var
  I : Integer;
begin
  Result := S;

  if S = '' then
    Exit;

  I := Length(Result);
  {delete trailing zeros}
  while (Result[I] = '0') and (I > 1) do
    Dec(I);
  {delete decimal point, if any}
  if Result[I] = '.' then
    Dec(I);
  Result := Trim(Copy(Result, 1, I));
end;


procedure TrimTrailingZerosPChar(P : PChar);
  {-Trim trailing zeros from a numeric string. It is assumed that there is
    a decimal point prior to the zeros. Also strips leading spaces.}
var
  PT : PChar;
begin
  PT := StrEnd(P);
  if Pointer(PT) = Pointer(P) then
    Exit;

  {back up to character prior to null}
  Dec(PT);

  {delete trailing zeros}
  while PT^ = '0' do begin
    PT^ := #0;
    Dec(PT);
  end;

  {delete decimal point, if any}
  if PT^ = '.' then
    PT^ := #0;

  TrimAllSpacesPChar(P);
end;


function TrimTrailPrimPChar(S : PChar) : PChar; register;
  {-delete trailing whitespace

   Changes:
     03/2011, AB: PUREPASCAL-version added
                  Bugfix: unicode-version deleted spaces only
                  Bugfix: loop for deleting whitespace in the ansi-version did
                          not stop at the beginning of the string (function could
                          wreak havoc if S = '  '). }

{$IFDEF PUREPASCAL}
var
  PEnd: PChar;
begin
  PEnd := S + StrLen(S) - 1;
  while (PEnd >= S) and (PEnd^ <= ' ') do
    Dec(PEnd);
  PEnd[1] := #0;
  Result := S;
end;

{$ELSE}
asm
   cld
   push   edi
   mov    edx, eax
   mov    edi, eax
   or     ecx, -1
   xor    ax, ax

{$IFDEF UNICODE}
   repne  scasw
   not    ecx
   dec    ecx
   jecxz  @@ExitPoint
   sub    edi,2
   inc    ecx

@@1:
   sub    edi,2
   cmp    word ptr [edi], 32
   ja     @@stop
   dec    ecx
   jnz    @@1
@@stop:
   mov    word ptr [edi+2], ax

{$ELSE}
   repne  scasb
   not    ecx
   dec    ecx
   jecxz  @@ExitPoint
   dec    edi
   inc    ecx

@@1:
   dec    edi
   cmp    byte ptr [edi],' '
   ja     @@stop
   dec    ecx
   jnz    @@1
@@stop:
   mov    byte ptr [edi+1], al
{$ENDIF}

@@ExitPoint:
   mov    eax, edx
   pop    edi
end;
{$ENDIF}


function TrimTrailPChar(Dest, S : PChar) : PChar;
  {-Return a string with trailing white space removed}
begin
  StrCopy(Dest, S);
  Result := TrimTrailPrimPChar(Dest);
end;


function UpCaseChar(C: Char) : Char; register;
  {-Convert C to upper case

   Changes:
     03/2011, AB: PUREPASCAL-version added }

{$IFDEF PUREPASCAL}
begin
  { CharUpper is defined as function CharUpper(P:PChar): PChar.
    However, this Windows-function will transform a character C to
    uppercase if the character ist passed to the function - in this
    case, the new charater will be returned. }
  result := Char(CharUpper(PChar(C)));
end;
{$ELSE}
asm
{$IFDEF UNICODE}
  movzx eax, ax
{$ELSE}
  movzx eax, al
{$ENDIF}
  push  eax
  call  CharUpper
end;
{$ENDIF}


function ovcCharInSet(C: Char; const CharSet: TOvcCharSet): Boolean;
begin
{$IFDEF UNICODE}
  Result := SysUtils.CharInSet(C, CharSet);
{$ELSE}
  Result := C in CharSet;
{$ENDIF}
end;

function ovc32StringIsCurrentCodePage(const S: {$IFDEF UNICODE}UnicodeString{$ELSE}WideString{$ENDIF}): Boolean;
// returns True if a string can be displayed using the current system codepage
const
  WC_NO_BEST_FIT_CHARS = $00000400;
  CP_APC = 0;
var
  UsedDefaultChar: BOOL;   // not Boolean!!
  Len: Integer;
begin
  if Length(S) = 0 then
  begin
    Result := True;
    Exit;
  end;

  UsedDefaultChar := False;
  Len := WideCharToMultiByte(CP_APC, WC_NO_BEST_FIT_CHARS, PWideChar(S), Length(S), nil, 0, nil, @UsedDefaultChar);
  if Len <> 0 then
    Result := not UsedDefaultchar
  else
    Result := False;
end;

function ovc32StringIsCurrentCodePage(const S: PWideChar; CP:Cardinal=0{CP_APC}): Boolean;
// returns True if a string can be displayed using the current system codepage
const
  WC_NO_BEST_FIT_CHARS = $00000400;
var
  UsedDefaultChar: BOOL;   // not Boolean!!
  LenS, Len: Integer;
begin
  // A.B. StrLen(S)=0 does not work in Delphi 2006
  {$IFDEF UNICODE}
  LenS := StrLen(S);
  {$ELSE}
  LenS := 0;
  if Assigned(S) then begin
    while S[LenS]<>#0 do Inc(LenS);
  end;
  {$ENDIF}

  if LenS=0 then
  begin
    Result := True;
    Exit;
  end;

  UsedDefaultChar := False;
  Len := WideCharToMultiByte(CP, WC_NO_BEST_FIT_CHARS, S, LenS, nil, 0, nil, @UsedDefaultChar);
  if Len <> 0 then
    Result := not UsedDefaultchar
  else
    Result := False;
end;

end.
