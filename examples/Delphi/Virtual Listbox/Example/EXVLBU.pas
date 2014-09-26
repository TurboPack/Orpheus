{$J+} {Writable constants}

unit Exvlbu;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcVlb, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    OvcVirtualListbox1: TOvcVirtualListBox;
    Label1: TLabel;
    Label2: TLabel;
    OvcController1: TOvcController;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TButton;
    procedure OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
      var ItemString: string);
    procedure OvcVirtualListbox1GetItemColor(Sender: TObject;
      Index: Longint; var FG, BG: TColor);
    procedure OvcVirtualListbox1Click(Sender: TObject);
    procedure OvcVirtualListbox1IsSelected(Sender: TObject; Index: Longint;
      var Selected: Boolean);
    procedure OvcVirtualListbox1Select(Sender: TObject; Index: Longint;
      Selected: Boolean);
    procedure OvcVirtualListbox1TopIndexChanged(Sender: TObject;
      NewTopIndex: Longint);
    procedure OvcVirtualListBox2GetItem(Sender: TObject; Index: Integer;
      var ItemString: String);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }

    {maintain selection status of the first 500 items}
    Select : array[0..500] of Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
  var ItemString: {$IFDEF Win32} string {$ELSE} OpenString {$ENDIF});
begin
  {cheat and just return the index number as the item string}
  ItemString := Format('Item # %d', [Index]);
end;

procedure TForm1.OvcVirtualListbox1GetItemColor(Sender: TObject;
  Index: Longint; var FG, BG: TColor);
begin
  if Index <> OvcVirtualListbox1.ItemIndex then begin
    if Index mod 13 = 0 then
      FG := clRed
    else if Index mod 7 = 0 then
      FG := clGreen
    else if Odd(Index) then
      FG := clBlue;
  end;
end;

procedure TForm1.OvcVirtualListbox1Click(Sender: TObject);
var
  I : LongInt;
begin
  I := OvcVirtualListbox1.ItemIndex;
  if I > -1 then
    Label2.Caption := Format('Selected item: %d', [I])
  else
    Label2.Caption := '(none)';
end;

procedure TForm1.OvcVirtualListbox1IsSelected(Sender: TObject;
  Index: Longint; var Selected: Boolean);
begin
  if Index <= 500 then
    Selected := Select[Index]
  else
    Selected := False;
end;

procedure TForm1.OvcVirtualListbox1Select(Sender: TObject; Index: Longint;
  Selected: Boolean);
begin
  if Index = -1 then
    FillChar(Select, SizeOf(Select), Selected)
  else if Index <= 500 then
    Select[Index] := Selected;
end;

procedure TForm1.OvcVirtualListbox1TopIndexChanged(Sender: TObject;
  NewTopIndex: Longint);
begin
  Label3.Caption := Format('Top index: %d', [NewTopIndex])
end;

procedure TForm1.OvcVirtualListBox2GetItem(Sender: TObject; Index: Integer;
  var ItemString: String);
begin
  ItemString := IntToStr(Index);
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
