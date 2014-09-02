unit Table16Unit;

interface

uses
  Math, StrUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ovctcmmn, ovctcell, ovctcstr, o32tcflx, ovcbase, ovctable, StdCtrls, o32editf,
  o32flxed, ovctcbef, ovctcpic, ovctcedt, ovctgpns, ExtCtrls, Menus, ovctchdr;

type
  TForm11 = class(TForm)
    OvcTable: TOvcTable;
    O32TCFlexEdit: TO32TCFlexEdit;
    OvcTCString: TOvcTCString;
    OvcTCPictureField: TOvcTCPictureField;
    OvcTCMemo: TOvcTCMemo;
    Panel1: TPanel;
    Memo1: TMemo;
    GroupBox_WW_ICR: TGroupBox;
    CheckBox_UseWordWrap: TCheckBox;
    CheckBox_IgnoreCR: TCheckBox;
    RadioGroup_EllipsisMode: TRadioGroup;
    GroupBox_Access: TGroupBox;
    CheckBox_Access: TCheckBox;
    OvcTCColHead1: TOvcTCColHead;
    Label1: TLabel;
    procedure OvcTableGetCellData(Sender: TObject; RowNum, ColNum: Integer; var Data: Pointer;
      Purpose: TOvcCellDataPurpose);
    procedure FormCreate(Sender: TObject);
    procedure Control_Eventhandler(Sender: TObject);
  private
    sampledata: array[0..3,1..10] of string;
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

{ ---------- Initialize form }

procedure TForm11.FormCreate(Sender: TObject);
var
  c, i: Integer;
begin
  for c := 0 to 3 do begin
    if c = 1 then begin
      for i := 1 to 10 do
        sampledata[c,i] := Format('line %d (just one line here)',[i]);
    end else begin
      sampledata[c,1] := 'line 1';
      for i := 2 to 10 do
        sampledata[c,i]  := sampledata[c,i-1] + #13#10 + Format('line %d: a rather long line',[i]);
    end;
  end;
end;


{ ---------- data-table-connection }

procedure TForm11.OvcTableGetCellData(Sender: TObject; RowNum, ColNum: Integer;
  var Data: Pointer; Purpose: TOvcCellDataPurpose);
begin
  if RowNum=0 then
    data := nil
  else
    data := @sampledata[Colnum,Rownum];
end;


{ ---------- event-handler for controls }

procedure TForm11.Control_Eventhandler(Sender: TObject);
begin
  OvcTable.AllowRedraw := False;

  if Sender=RadioGroup_Ellipsismode then begin
    case RadioGroup_Ellipsismode.ItemIndex of
      0: begin
           OvcTCString.EllipsisMode       := em_dont_show;
           OvcTCPictureField.EllipsisMode := em_dont_show;
           OvcTCMemo.EllipsisMode         := em_dont_show;
           O32TCFlexEdit.EllipsisMode     := em_dont_show;
         end;
      1: begin
           OvcTCString.EllipsisMode       := em_show_readonly;
           OvcTCPictureField.EllipsisMode := em_show_readonly;
           OvcTCMemo.EllipsisMode         := em_show_readonly;
           O32TCFlexEdit.EllipsisMode     := em_show_readonly;
         end;
      2: begin
           OvcTCString.EllipsisMode       := em_show;
           OvcTCPictureField.EllipsisMode := em_show;
           OvcTCMemo.EllipsisMode         := em_show;
           O32TCFlexEdit.EllipsisMode     := em_show;
         end;
    end;
  end else if Sender=CheckBox_UseWordWrap then begin
    OvcTCString.UseWordWrap   := CheckBox_UseWordWrap.Checked;
    OvcTCMemo.UseWordWrap     := CheckBox_UseWordWrap.Checked;
    O32TCFlexEdit.UseWordWrap := CheckBox_UseWordWrap.Checked;
  end else if Sender=CheckBox_IgnoreCR then begin
    OvcTCString.IgnoreCR   := CheckBox_IgnoreCR.Checked;
    OvcTCMemo.IgnoreCR     := CheckBox_IgnoreCR.Checked;
    O32TCFlexEdit.IgnoreCR := CheckBox_IgnoreCR.Checked;
  end else if Sender=CheckBox_Access then begin
    if CheckBox_Access.Checked then
      OvcTable.Access := otxReadOnly
    else
      OvcTable.Access := otxNormal;
  end;

  OvcTable.InvalidateTable;
  OvcTable.AllowRedraw := True;
end;

end.

