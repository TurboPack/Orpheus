{$J+} {Writable constants}

unit ExPizzaU;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcVlb, StdCtrls, Buttons, OvcConst;

type
  TForm1 = class(TForm)
    DefaultController: TOvcController;
    VLB: TOvcVirtualListBox;
    BitBtn1: TBitBtn;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    {$IFNDEF Win32}
    procedure VLBGetItem(Sender: TObject; Index: Longint;
      var ItemString: OpenString);
    {$ELSE}
    procedure VLBGetItem(Sender: TObject; Index: Longint;
      var ItemString: string);
    {$ENDIF}
    procedure VLBGetItemStatus(Sender: TObject;
      Index: Longint; var Protect: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure VLBUserCommand(Sender: TObject; Command: Word);
    procedure VLBCharToItem(Sender: TObject; Ch: Char; var Index: Longint);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  MaxNumItems = 14;
  Items : array[0..MaxNumItems-1] of PChar = (
    'Ham',       'Pepperoni', 'Sausage',   'Mushrooms',
    'Anchovies', 'Onions',    'Olives',    'Eggs',
    'Pineapple', 'Spices',    'Artichoke', 'Peppers',
    'Hamburger', 'Hodgepodge');

procedure TForm1.VLBGetItem(Sender: TObject; Index: Longint;
  var ItemString: {$IFDEF Win32} string {$ELSE} OpenString {$ENDIF});
begin
  if (Index >= 0) and (Index < MaxNumItems) then
    ItemString := StrPas(Items[Index])
  else
    ItemString := '*** Error ***';
end;

procedure TForm1.VLBGetItemStatus(Sender: TObject;
  Index: Longint; var Protect: Boolean);
begin
  if (Index = 5) or (Index = 11) then
    Protect := True
  else
    Protect := False;
end;

procedure TForm1.btnAddClick(Sender: TObject);
begin
  with VLB do
    if NumItems < MaxNumItems then begin
      NumItems := NumItems + 1; {increase list items}
    end;
  btnAdd.Enabled := VLB.NumItems < MaxNumItems;
  btnRemove.Enabled := VLB.NumItems > 0;
end                 ;

procedure TForm1.btnRemoveClick(Sender: TObject);
begin
  with VLB do
    if NumItems > 0 then begin
      NumItems := NumItems - 1; {decrease list items}
    end;
  btnRemove.Enabled := VLB.NumItems > 0;
  btnAdd.Enabled := VLB.NumItems < MaxNumItems;
end;

procedure TForm1.VLBUserCommand(Sender: TObject; Command: Word);
begin
  case Command of
    ccUser0 : btnRemoveClick(Sender);
    ccUser1 : btnAddClick(Sender);
  end;
end;

procedure TForm1.VLBCharToItem(Sender: TObject; Ch: Char;
  var Index: Longint);
var
  I     : LongInt;
  Found : Boolean;
begin
  if VLB.NumItems < 2 then Exit;
  I := Index;
  repeat
    Inc(I);
    if I >= VLB.NumItems then I := 0;
    Found := UpCase(Ch) = UpCase(Items[I][0]);
  until Found or (I = Index);
  if Found then Index := I;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
