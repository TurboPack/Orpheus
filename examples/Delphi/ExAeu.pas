{$J+} {Writable constants}

unit Exaeu;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, OvcBase, OvcData, OvcAe, OvcMisc, StdCtrls, CalUnit,
  Buttons, Dialogs, OvcDate;

type
  TAEForm = class(TForm)
    AE1: TOvcSimpleArrayEditor;
    Label1: TLabel;
    AE2: TOvcPictureArrayEditor;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    OvcController1: TOvcController;
    btnColor: TBitBtn;
    dlgColor: TColorDialog;
    Label3: TLabel;
    procedure AE1GetItem(Sender : TObject; Index: Longint;
      var Value: Pointer);
    procedure btnExitClick(Sender: TObject);
    procedure AE1GetItemColor(Sender: TObject;
      Index: Longint; var FG, BG: TColor);
    procedure FormCreate(Sender: TObject);
    procedure AE1DblClick(Sender: TObject);
    procedure AE2GetItem(Sender : TObject; Index: Longint;
      var Value: Pointer);
    procedure AE2DblClick(Sender: TObject);
    procedure btnColorClick(Sender: TObject);
    procedure AE1Select(Sender: TObject; NewIndex: Longint);
    procedure AE2Select(Sender: TObject; NewIndex: Longint);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AEForm: TAEForm;

implementation

{$R *.DFM}

const
  MaxItems = 50;

var
  {Data for the array. Data type must match the array data type}
  Data : array[0..MaxItems-1] of LongInt;
  Colors : array[0..MaxItems-1] of TColor;
  Dates : array[0..MaxItems-1] of TOvcDate;

procedure TAEForm.AE1GetItem(Sender : TObject; Index: Longint;
  var Value: Pointer);
begin
  if (Index > -1) and (Index < MaxItems) then
    Value := @Data[Index]
  else
    raise Exception.Create('Invalid index value');
end;

procedure TAEForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TAEForm.AE1GetItemColor(Sender: TObject;
  Index: Longint; var FG, BG: TColor);
begin
  if (Index > -1) and (Index < MaxItems) then
    {just set the text color--set BG for the background color}
    FG := Colors[Index]
  else
    raise Exception.Create('Invalid index value');
end;

procedure TAEForm.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to MaxItems-1 do begin
    Data[I] := I;
    Colors[I] := AE1.Font.Color;
    Dates[I] := CurrentDate + I;
  end;
end;

procedure TAEForm.AE1DblClick(Sender: TObject);
var
  I : LongInt;
begin
  {requires one click to make the cell active before a}
  {double click is registered}
  I := AE1.ItemIndex;
  Label1.Caption := Format('Index: %d', [I]);
end;

procedure TAEForm.AE2GetItem(Sender : TObject; Index: Longint;
  var Value: Pointer);
begin
  if (Index > -1) and (Index < MaxItems) then
    Value := @Dates[Index]
  else
    raise Exception.Create('Invalid index value');
end;

procedure TAEForm.AE2DblClick(Sender: TObject);
begin
  CalForm := TCalForm.Create(Application);
  try
    CalForm.Calendar.AsStDate := Dates[AE2.ItemIndex];                // This works!
    CalForm.ShowModal;
    if CalForm.ModalResult = idOK then begin
      Dates[AE2.ItemIndex] := CalForm.Calendar.AsStDate;
      AE2.Refresh;
    end;
  finally
    CalForm.Free;
  end;
end;

procedure TAEForm.btnColorClick(Sender: TObject);
var
  I : Integer;
begin
  I := AE1.ItemIndex;
  if I > -1 then begin
    dlgColor.Color := Colors[I];
    if dlgColor.Execute then begin
      Colors[I] := dlgColor.Color;
      AE1.Refresh;
    end;
  end;
end;

procedure TAEForm.AE1Select(Sender: TObject; NewIndex: Longint);
begin
  AE2.ItemIndex := AE1.ItemIndex;
end;

procedure TAEForm.AE2Select(Sender: TObject; NewIndex: Longint);
begin
  AE1.ItemIndex := AE2.ItemIndex;
end;

end.
