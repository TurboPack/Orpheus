{$J+} {Writable constants}

unit ExTranU;

interface

{.$IFDEF Win32}
  {.$APPTYPE CONSOLE}
{.$ENDIF}

uses
  WinTypes, WinProcs, Messages, Classes, Graphics,
  {$IFNDEF Win32} WinCrt, {$ENDIF}
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, SysUtils,
  OvcXfer, OvcPb, OvcPf, OvcBase, OvcData, OvcEf, OvcSf, OvcNF,
  OvcNbk, OVCDATE;

type
  {transfer buffer for the Form1 form}
  TForm1TransferRec = packed record
    Label1Text              : string[255];
    Edit1Text               : string[45];
    CheckBox1Checked        : Boolean;
    RadioButton1Checked     : Boolean;
    OvcPictureField1Value   : TOvcDate;
    ListBox1Xfer            : TListBoxTransfer;
    ComboBox1Xfer           : TComboBoxTransfer;
    Panel1Text              : string[255];
    OvcSimpleField1Value    : string[15];
    OvcPictureField2Value   : string[15];
    OvcNumericField1Value   : LongInt;
  end;

type
  TForm1 = class(TForm)
    OvcTransfer1: TOvcTransfer;
    Button1: TButton;
    DefaultController: TOvcController;
    Label1: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    OvcPictureField1: TOvcPictureField;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Button2: TButton;
    BitBtn1: TBitBtn;
    OvcNotebook1: TOvcNotebook;
    OvcSimpleField1: TOvcSimpleField;
    OvcPictureField2: TOvcPictureField;
    OvcNumericField1: TOvcNumericField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Rec : TForm1TransferRec;
    procedure InitForm1Transfer(var Data : TForm1TransferRec);
      {-initialize transfer buffer}
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.InitForm1Transfer(var Data : TForm1TransferRec);
  {-initialize transfer buffer}
begin
  with Data do begin
    Label1Text            := 'Label text';
    Edit1Text             := 'Edit text';
    CheckBox1Checked      := True;
    RadioButton1Checked   := False;
    OvcPictureField1Value := CurrentDate;

    ListBox1Xfer.Items    := TStringList.Create;
    with ListBox1Xfer.Items do begin
      Add('LB Item 1');
      Add('LB Item 2');
      Add('LB Item 3');
    end;
    ListBox1Xfer.ItemIndex := 1;

    ComboBox1Xfer.Items := TStringList.Create;
    with ComboBox1Xfer.Items do begin
      Add('CB Item 1');
      Add('CB Item 2');
      Add('CB Item 3');
    end;
    ComboBox1Xfer.Text := 'Combobox Text';
    ComboBox1Xfer.ItemIndex := -1;

    Panel1Text := 'Panel Text';

    OvcSimpleField1Value    := 'Simple Field';
    OvcPictureField2Value   := 'Picture Field';
    OvcNumericField1Value   := 13;
  end; {with}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  {create transfer objects and init transfer record}
  InitForm1Transfer(Rec);
  {transfer data to the form}
  {the below component order must match the transfer record}
  {definition!}
  OvcTransfer1.TransferToFormS(
    [Label1, Edit1, CheckBox1, RadioButton1, OvcPictureField1,
     Listbox1, ComboBox1, Panel1, OvcSimpleField1,
     OvcPictureField2, OvcNumericField1], Rec);
  {free objects within the transfer buffer}
  Rec.ListBox1Xfer.Items.Free;
  Rec.ComboBox1Xfer.Items.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I : Integer;
begin
  {create transfer objects and init transfer record}
  InitForm1Transfer(Rec);
  {transfer data from the form
   Normally, you would not wish to retrieve the contents of static
   components (Label, Panel, ...)
   As "old fashioned" ShortStrings are used in the transfer record, we
   have to use 'TransferFromFormS': }
  OvcTransfer1.TransferFromFormS(
    [Label1, Edit1, CheckBox1, RadioButton1, OvcPictureField1,
     Listbox1, ComboBox1, Panel1, OvcSimpleField1,
     OvcPictureField2, OvcNumericField1], Rec);

  AllocConsole;

  {display returned data}
  WriteLn('Data returned from the form');
  WriteLn;
  with Rec do begin
    WriteLn(Label1.Name:30, ' >> ', Label1Text);
    WriteLn(Edit1.Name:30, ' >> ', Edit1Text);
    WriteLn(Checkbox1.Name:30, ' >> ', CheckBox1Checked);
    WriteLn(RadioButton1.Name:30, ' >> ', RadioButton1Checked);
    WriteLn(OvcPictureField1.Name:30, ' >> ', OvcPictureField1Value);
    WriteLn(ListBox1.Name:20, ' ItemIndex >> ', ListBox1Xfer.ItemIndex);
    for I := 0 to ListBox1Xfer.Items.Count-1 do
      WriteLn(ListBox1.Name:27,'[',I,'] >> ', ListBox1Xfer.Items[I]);
    WriteLn(ComboBox1.Name:25, ' Text >> ', ComboBox1Xfer.Text);
    WriteLn(ComboBox1.Name:20, ' ItemIndex >> ', ComboBox1Xfer.ItemIndex);
    for I := 0 to ComboBox1Xfer.Items.Count-1 do
      WriteLn(ComboBox1.Name:27,'[',I,'] >> ', ComboBox1Xfer.Items[I]);
    WriteLn(Panel1.Name:30, ' >> ', Panel1Text);
    WriteLn(OvcSimpleField1.Name:30, ' >> ', OvcSimpleField1Value);
    WriteLn(OvcPictureField2.Name:30, ' >> ', OvcPictureField2Value);
    WriteLn(OvcNumericField1.Name:30, ' >> ', OvcNumericField1Value);
    Writeln;
  end;

  {free objects within the transfer buffer}
  Rec.ListBox1Xfer.Items.Free;
  Rec.ComboBox1Xfer.Items.Free;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
