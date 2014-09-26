{*********************************************************}
{*                  OVCEDITU.PAS 4.06                    *}
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
{*                                                                            *}
{* Roman Kassebaum                                                            *}
{* Armin Biernaczyk                                                           *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{.W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

unit ovceditu;
  {-Editor utility routines}

interface

uses
  OvcBase;

type
  TOvcEditBase = class(TOvcCustomControlEx);

type
  TMarker = packed record
    Para  : LongInt;  {number of paragraph}
    Pos   : Integer;  {position in paragraph}
  end;
  TMarkerArray = array[0..9] of TMarker;

type
  {text position record}
  TOvcTextPos = packed record
    Line : LongInt;
    Col  : Integer;
  end;

function edBreakPoint(S : PChar; MaxLen : Word): Word;
  {-return the position to word break S}
procedure edDeleteSubString(S : PChar; SLen, Count, Pos : Integer);
  {-delete Cound characters from S starting at Pos}
function edEffectiveLen(S : PChar; Len : Word; TabSize : Byte) : Word;
  {-compute effective length of S, accounting for tabs}
function edFindNextLine(S : PChar; WrapCol : Integer) : PChar;
  {-find the start of the next line}
function edFindPosInMap(Map: Pointer; Lines, Pos : Word) : Word;
  {-return the para position}
function edGetActualCol(S : PChar; Col : Word; TabSize : Byte) : Word;
  {-compute actual column for effective column Col, accounting for tabs}
function edHaveTabs(S : PChar; Len : Cardinal) : Boolean;
  {Return True if tab are found in S}
function edPadPrim(S : PChar; Len : Word) : PChar;
  {-return a string right-padded to length len with blanks}
function edScanToEnd(P : PChar; Len : Word) : Word;
  {-return position of end of para P}
function edStrStInsert(Dest, S : PChar; DLen, SLen, Pos : Word) : PChar;
  {-insert S into Dest}
function edWhiteSpace(C : Char) : Boolean;
  {-return True if C is a white space character}


implementation


uses
   Windows, SysUtils;

function edBreakPoint(S : PChar; MaxLen : Word): Word;
  {-return the position to word break S}
begin
  result := MaxLen;
  while (result > 0) and not edWhiteSpace(S[result-1]) do
    Dec(result);
  if result = 0 then
    result := MaxLen;
end;


procedure edDeleteSubString(S : PChar; SLen, Count, Pos : Integer);
  {-delete Count characters from S starting at Pos}
begin
  if Pos<SLen then
    Move(S[Pos+Count], S[Pos], ((SLen+1)-(Pos+Count)) * SizeOf(Char));
end;


function edEffectiveLen(S : PChar; Len : Word; TabSize : Byte) : Word; register;
  {-compute effective length of S, accounting for tabs
    The function returns the length of S with <tab>-characters expanded to spaces; only the
    first 'Len' characters of S are taken into account. Examples
    S = '1234567890'; Len=20            -> result = 10
    S = '1234567890'; Len= 5            -> result =  5
    S = '1234'#9'90'; Len=20; TabSize=8 -> result = 10
    S = '1234'#9'90'; Len= 5; TabSize=8 -> result =  8 }
{$IFDEF PUREPASCAL}
var
  i: Word;
begin
  result := 0;
  i := 0;
  while (i<Len) and (S[i]<>#0) do begin
    if S[i]<>#9 then
      Inc(result)
    else
      result := ((result div TabSize) + 1) * TabSize;
    Inc(i);
  end;
end;

{$ELSE}
asm
  push   edi            {save}
  push   esi            {save}
  push   ebx            {save}

  mov    esi,eax        {esi = S}
  xor    ebx,ebx        {clear}
  mov    bl,cl          {ebx = TabSize}
  xor    ecx,ecx        {clear}
  mov    cx,dx          {cx = Len}
  xor    edi,edi        {temp length storage}
  xor    edx,edx

@@1:
  jcxz   @@2            {done if ecx is 0}
  dec    ecx            {decrement length}
{$IFDEF UNICODE}
  lodsw                 {get next character}
  or     ax,ax          {is it a null?}
  jz     @@2            {done if so}
  inc    edi            {increment length}
  cmp    ax,9           {is it a tab?}
{$ELSE}
  lodsb                 {get next character}
  or     al,al          {is it a null?}
  jz     @@2            {done if so}
  inc    edi            {increment length}
  cmp    al,9           {is it a tab?}
{$ENDIF}
  jne    @@1            {if not, get next}
  dec    edi            {decrement length}
  mov    eax,edi        {ax has length}
  div    ebx            {divide by tabsize}
  inc    eax            {add one}
  mul    ebx            {multiply by tabsize}
  mov    edi,eax        {save result in edi}
  jmp    @@1            {get next character}
@@2:
  mov    eax,edi        {put effective length in eax}

  pop    ebx            {restore}
  pop    esi            {restore}
  pop    edi            {restore}
end;
{$ENDIF}


function edFindNextLine(S : PChar; WrapCol : Integer) : PChar; register;
  {-find the start of the next line
    1) Find the last '-'/' '/#9 before or at position WrapCol
       If there is none, return pointer to S[WrapCol]
    2) Find the first character behind the ohne found in step 1 that is neither ' '
       nor #9. Return a pointer to this character. }
{$IFDEF PUREPASCAL}
var
  c: Char;
begin
  result := @S[WrapCol];
  if S[WrapCol]<>#0 then begin
    repeat
      c := S[WrapCol];
      if (c<>'-') and (c<>' ') and (c<>#9) then
        Dec(WrapCol)
      else begin
        Inc(WrapCol);
        while (S[WrapCol]=' ') or (S[WrapCol]=#9) do Inc(WrapCol);
        result := @S[WrapCol];
        break;
      end;
    until WrapCol=0;
  end;
end;

{$ELSE}
asm
  push   esi            {save}
  push   edi            {save}

  mov    esi,eax        {esi = S}
  mov    ecx,edx        {ecx = WrapCol}

{$IFDEF UNICODE}
  add    esi,ecx        {point to default wrap point}
  add    esi,ecx
  mov    edi,esi        {save esi in edi}

  std                   {go backward}
  inc    ecx
  cmp    word ptr [esi],0 {is default wrap point a null?}
  jne    @@1
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@1:
  lodsw                 {next char into ax}
  cmp    ax,'-'         {is it a hyphen?}
  ja     @@2
  je     @@3
  cmp    ax,' '         {is it a space?}
  je     @@3
  cmp    ax,9           {is it a tab?}
  je     @@3

@@2:
  loop   @@1            {try previous character}
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@3:
  cld                   {clear direction flag}
  add    esi,4          {go to next character}

@@5:
  lodsw                 {next character into ax}
  cmp    ax,' '         {is it > than a space?}
  ja     @@6            {if so, we're done}
  je     @@5            {if it's a space, keep going}
  cmp    ax,9           {if it's a tab, keep going}
  je     @@5            {otherwise, we're done}

@@6:
  dec    esi
  dec    esi            {point to previous character}
  mov    eax,esi        {wrap point in eax}

{$ELSE}

  add    esi,ecx        {point to default wrap point}
  mov    edi,esi        {save esi in edi}

  std                   {go backward}
  inc    ecx
  cmp    byte ptr [esi],0 {is default wrap point a null?}
  jne    @@1
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@1:
  lodsb                 {next byte into al}
  cmp    al,'-'         {is it a hyphen?}
  ja     @@2
  je     @@3
  cmp    al,' '         {is it a space?}
  je     @@3
  cmp    al,9           {is it a tab?}
  je     @@3

@@2:
  loop   @@1            {try previous character}
  mov    eax,edi        {force a break at the default wrap point}
  jmp    @@7

@@3:
  cld                   {clear direction flag}
  inc    esi
  inc    esi            {point to next character}

@@5:
  lodsb                 {next character into al}
  cmp    al,' '         {is it > than a space?}
  ja     @@6            {if so, we're done}
  je     @@5            {if it's a space, keep going}
  cmp    al,9           {if it's a tab, keep going}
  je     @@5            {otherwise, we're done}

@@6:
  dec    esi            {point to previous character}
  mov    eax,esi        {wrap point in eax}
{$ENDIF}

@@7:
  pop    edi            {restore}
  pop    esi            {restore}
  cld                   {clear direction flag}
end;
{$ENDIF}


function edFindPosInMap(Map: Pointer; Lines, Pos : Word) : Word; register;
  {-return the para position}
{$IFDEF PUREPASCAL}
type
  PLineMap = ^LineMap;
  LineMap  = array[1..High(SmallInt)] of Word;
begin
  result := Lines;
  Dec(Pos);
  while (result>=1) and (Pos<PLineMap(Map)^[result]) do
    Dec(result);
end;

{$ELSE}
asm
  push   esi            {save}
  push   ebx            {save}

  mov    esi,eax        {esi = Map}
  mov    bx,cx          {bx = Pos}
  dec    bx             {bx = Pos-1}
  mov    cx,dx          {cx = Lines}
  movzx  eax,cx         {eax = Lines}
  dec    eax            {prepare for word access}
  shl    eax,1
  add    esi,eax        {point to position in Map}

  std                   {go backwards}
@@1:
  lodsw
  cmp    bx,ax
  jae    @@2
  loop   @@1

@@2:
  mov    ax,cx          {result in ax}

  pop    ebx            {restore}
  pop    esi            {restore}
  cld                   {clear direction flag}
end;
{$ENDIF}


function edGetActualCol(S : PChar; Col : Word; TabSize : Byte) : Word; register;
  {-compute actual column for effective column Col, accounting for tabs
    (If Col is the column in S with "expanded" tabs, the function returns the column in S:
     e.g. for TabSize=6:

                              1  2  3  4  5  6  7  8  9
                          S = a  b  c #9  x #9  r  s  t

     S (with expanded tabs) = a  b  c  _  _  _  x  _  _  _  _  _  r  s  t
                        Col = 1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
                     result = 1  2  3  4  4  4  5  6  6  6  6  6  7  8  9  }

{$IFDEF PUREPASCAL}
var
  c: Word;
begin
  result := 1;
  c := 0;
  repeat
    if S^=#0 then
      Break
    else begin
      if S^=#9 then
        c := (c div TabSize + 1) * TabSize
      else
        Inc(c);
      if c+1<=Col then Inc(result);
    end;
    Inc(S);
  until c+1 >= Col;
end;

{$ELSE}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  cld                   {go forward}

  mov    esi,eax        {esi = S}
  movzx  edi,dx         {edi = Col}
  xor    ebx,ebx        {length = 0}
  mov    dl,cl          {dl = TabSize}
  xor    ecx,ecx        {ecx = actual column}

{$IFDEF UNICODE}

@@1:
  inc    ecx            {increment column}
  lodsw                 {get next character}
  or     ax,ax          {is it a null?}
  jz     @@3            {done if so}
  inc    ebx            {increment effective length}
  cmp    ax, 09         {is it a tab?}

{$ELSE}

  mov    dh,9           {dh = Tab char}
@@1:
  inc    ecx            {increment column}
  lodsb                 {get next character}
  or     al,al          {is it a null?}
  jz     @@3            {done if so}
  inc    ebx            {increment effective length}
  cmp    al,dh          {is it a tab?}
{$ENDIF}

  jne    @@2            {if not, check the column}
  dec    ebx            {decrement length}
  mov    eax,ebx        {eax has length}

  {determine integral offset}
  push   edx            {save}
  push   ecx            {save}
  movzx  cx,dl          {cx=tab size}
  xor    dx,dx          {clear remainder register}
  div    cx             {divide by tabsize}
  inc    ax             {add one}
  mul    cx             {multiply by tabsize}
  pop    ecx            {restore}
  pop    edx            {restore - ignore upper 16 bits}
  mov    ebx,eax        {put result in ebx}

@@2:
  cmp    ebx,edi        {have we reached the target column yet?}
  jb     @@1            {get next character}

@@3:
  mov    eax,ecx        {put result in eax}

  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
end;
{$ENDIF}


function edHaveTabs(S : PChar; Len : Cardinal) : Boolean; register;
  {-return True if tabs are found in S
    Note: this routine returns true if Len=0}
{$IFDEF PUREPASCAL}
begin
  if Len=0 then
    result := True
  else begin
    while (Len>0) and (S^<>#9) do begin
      Inc(S);
      Dec(Len);
    end;
    result := Len>0;
  end;
end;

{$ELSE}
asm
  push   edi            {save}
  mov    edi,eax        {edi = S}
  mov    ax,9           {ax = Tab character}
  mov    ecx,edx        {ecx = Len}
  or     ecx,ecx
  jnz    @@1
  mov    eax,1          {return True if Len=0}
  jmp    @@2
@@1:
  cld                   {go forward}
{$IFDEF UNICODE}
  repne  scasw          {search for the character}
{$ELSE}
  repne  scasb          {search for the character}
{$ENDIF}
  mov    eax,0          {assume False}
  jne    @@2
  inc    eax            {else return True}
@@2:
  pop    edi            {restore}
end;
{$ENDIF}


function edPadPrim(S : PChar; Len : Word) : PChar; register;
  {-return S padded with C to length Len}
{$IFDEF PUREPASCAL}
var
  i: Integer;
begin
  i := 0;
  while S[i]<>#0 do Inc(i);
  if i<Len then begin
    while i<Len do begin
      S[i] := ' ';
      Inc(i);
    end;
    S[i] := #0;
  end;
  result := S;
end;

{$ELSE}
asm
  push   esi            {save}
  push   edi            {save}

  mov    edi,eax        {edi = S}
  mov    esi,eax        {esi = S}

  cld
  xor    eax, eax        {null}
  or     ecx, -1
{$IFDEF UNICODE}
  repne  scasw           {find null terminator}
  not    ecx             {calc length of S}
  dec    ecx             {backup one character}
  sub    edi, 2
  movzx  eax,dx          {eax = Len}
  sub    eax,ecx         {find difference}
  jbe    @@ExitPoint     {nothing to do}
  mov    ecx,eax         {count of character to add}
  mov    ax,' '          {ax = ' '}
  rep    stosw           {add ecx characters}

@@ExitPoint:
  mov    word ptr [edi],0
{$ELSE}
  repne  scasb           {find null terminator}
  not    ecx             {calc length of S}
  dec    ecx             {backup one character}
  dec    edi
  movzx  eax,dx          {eax = Len}
  sub    eax,ecx         {find difference}
  jbe    @@ExitPoint     {nothing to do}
  mov    ecx,eax         {count of character to add}
  mov    al,' '          {al = ' '}
  rep    stosb           {add ecx characters}

@@ExitPoint:
  mov    byte ptr [edi],0
{$ENDIF}
  mov    eax,esi

  pop    edi            {restore}
  pop    esi            {restore}
end;
{$ENDIF}


function edScanToEnd(P : PChar; Len : Word) : Word; register;
  {-return position of end of para P
    (The smallest index 0<i<=Len for which P[i-1]=#10; i=Len if there is no #10.) }
{$IFDEF PUREPASCAL}
begin
  result := 0;
  while (result<Len) and (P[result]<>#10) do
    Inc(result);
  if result<Len then
    Inc(result);
end;

{$ELSE}
asm
  movzx  ecx,dx         {ecx = Len}
  jecxz  @@9            {if Len=0 then result := 0 }

  push   edi            {save edi}
  mov    edi,eax        {edi = P}
  cld
{$IFDEF UNICODE}
  mov    ax, 0Ah        {ax  = $0a (char we are looking for)}
  repne  scasw          {search for ax}
{$ELSE}
  mov    al, 0Ah        {al  = $0a (char we are looking for)}
  repne  scasb          {search for al}
{$ENDIF}
  sub    dx, cx         {dx = Len-cx}
  pop    edi            {restore}
@@9:
  mov    ax,dx
end;
{$ENDIF}


function edStrStInsert(Dest, S : PChar; DLen, SLen, Pos : Word) : PChar; register;
  {-insert S into Dest
    Dest must point to a buffer for DLen+SLen+1 characters. S will be inserted into Dest
    at position Pos (Pos=0: insert at the beginning).
    The function will do nothing if SLen=0 or Pos>DLen. }
{$IFDEF PUREPASCAL}
begin
  result := Dest;
  if (Pos <= DLen) and (SLen > 0) then begin
    SysUtils.StrMove(Dest+(Pos+SLen), Dest+Pos, DLen+1-Pos);
    SysUtils.StrMove(Dest+Pos, S, SLen);
  end;
end;

{$ELSE}
{$IFDEF UNICODE}
// same code as for PUREPASCAL
begin
  result := Dest;
  if (Pos <= DLen) and (SLen > 0) then begin
    SysUtils.StrMove(Dest+(Pos+SLen), Dest+Pos, DLen+1-Pos);
    SysUtils.StrMove(Dest+Pos, S, SLen);
  end;
end;
{$ELSE}
asm
  push   esi            {save}
  push   edi            {save}
  push   ebx            {save}

  push   eax            {save Dest}
  push   edx            {save S}

  movzx  ebx,Pos        {ebx = Pos}
  mov    esi,eax        {eax = Dest}
  mov    edi,eax        {eax = Dest}
  and    ecx,0FFFFh     {ecx = DLen}
  inc    ecx            {ecx = DLen+1}
  add    edi,ecx        {point edi one past terminating null}
  movzx  edx,SLen
  cmp    dx,0           {if str to insert has 0 len then exit}
  je     @@1
  std                   {backwards string ops}
  add    edi,edx
  dec    edi
  add    esi,ecx
  dec    esi            {point to end of source string}
  sub    ecx,ebx        {calculate number to do}
  jbe    @@1            {exit if Pos greater than strlen}
  test   edi,1
  jnz    @@0
  movsb
  dec    ecx

@@0:
  dec    esi
  dec    edi
  shr    ecx,1
  rep    movsw
  jnc    @@2
  inc    esi
  inc    edi
  movsb
  jmp    @@3
@@2:
  inc    edi
@@3:
  pop    esi            {esi = S}
  push   esi
  add    esi,edx
  dec    esi
  mov    ecx,edx
  rep    movsb
@@1:
  cld
  pop    eax            {remove S}
  pop    eax            {eax = Dest}

  pop    ebx            {restore}
  pop    edi            {restore}
  pop    esi            {restore}
end;
{$ENDIF}
{$ENDIF}


function edWhiteSpace(C : Char) : Boolean; register;
  {-return True if C is a white space character}
{$IFDEF PUREPASCAL}
begin
  result := (C = ' ') or (C = #9);
end;

{$ELSE}
asm
{$IFDEF UNICODE}
  cmp    ax,' '
  je     @@001
  cmp    ax,09
{$ELSE}
  cmp    al,' '
  je     @@001
  cmp    al,09
{$ENDIF}
  je     @@001
  xor    eax,eax
  jmp    @@002
@@001:
  mov    eax,01
@@002:
end;
{$ENDIF}

end.
