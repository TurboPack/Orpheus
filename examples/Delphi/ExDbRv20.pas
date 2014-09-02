unit ExDbRv20;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, OvcBase, OvcRVIdx, OvcRptVw, OvcDbRpV, Db, DBTables, StdCtrls,
  OvcCmbx, OvcRvCbx, OvcFiler,
  {$IFDEF VER140} Variants, {$ENDIF}                                  {!!.02}
  OvcStore;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    OvcDbReportView1: TOvcDbReportView;
    Panel1: TPanel;
    OvcViewComboBox1: TOvcViewComboBox;
    OvcIniFileStore1: TOvcIniFileStore;
    Table1PartNo: TFloatField;
    Table1VendorNo: TFloatField;
    Table1Description: TStringField;
    Table1OnHand: TFloatField;
    Table1OnOrder: TFloatField;
    Table1Cost: TCurrencyField;
    Table1ListPrice: TCurrencyField;
    procedure OvcDbReportView1DrawViewFieldEx(Sender: TObject;
      Canvas: TCanvas; Field: TOvcRvField; ViewField: TOvcRvViewField;
      var TextAlign: Integer; IsSelected, IsGroupLine: Boolean;
      Data: Pointer; Rect: TRect; const Text, TruncText: String;
      var DefaultDrawing: Boolean);
    procedure OvcDbReportView1Extern(Sender: TOvcAbstractReportView;
      const ArgList: Variant; var Result: Variant);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcDbReportView1DrawViewFieldEx(Sender: TObject;
  Canvas: TCanvas; Field: TOvcRvField; ViewField: TOvcRvViewField;
  var TextAlign: Integer; IsSelected, IsGroupLine: Boolean; Data: Pointer;
  Rect: TRect; const Text, TruncText: String; var DefaultDrawing: Boolean);
begin
  if Field.Index = 2 then {description}
    Canvas.Font.Style := [fsBold];
end;

function ProperCase(const S: string): string;
var
  IsAlpha: Boolean;
  i: Integer;
begin
  IsAlpha := False;
  SetLength(Result, length(S));
  for i := 1 to length(S) do begin
    if IsAlpha then
      Result[i] := chr(dword(CharLower(pointer(ord(s[i])))))
    else
      Result[i] := chr(dword(CharUpper(pointer(ord(s[i])))));
    IsAlpha := IsCharAlpha(S[i]);
  end;
end;

procedure TForm1.OvcDbReportView1Extern(Sender: TOvcAbstractReportView;
  const ArgList: Variant; var Result: Variant);
var
  ArgCount: Integer;
begin
  {some sanity checks:}
  if not VarIsArray(ArgList) then
    raise Exception.Create('Variant array expected in Extern handler');
  if not VarArrayDimCount(ArgList) = 1 then
    raise Exception.Create('One-dimensional variant array expected');
  if not VarArrayLowBound(ArgList, 0) = 0 then
    raise Exception.Create('A variant array with a low bound of zero was expected');
  ArgCount := VarArrayHighBound(ArgList, 0) + 1;
  if ArgCount = 0 then
    raise EXception.Create('Non-empty variant array expected');
  {}
  {by convention in this example, the function requested is the first argument}
  if UpperCase(ArgList[0]) = 'PROPERCASE' then begin
    if ArgCount > 2 then
      raise Exception.Create('Too many arguments for ProperCase');
    if ArgCount = 1 then
      Result := 'Dummy'
    else
      Result := ProperCase(ArgList[1])
  end else
  if UpperCase(ArgList[0]) = 'PI' then begin
    Result := PI;
  end else
    raise Exception.Create('Unsupported Extern function referenced:' + ArgList[0]);
end;

end.
