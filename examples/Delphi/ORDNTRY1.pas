{$J+} {Writable constants}

unit Ordntry1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcNbk, TabNotBk, StdCtrls, OvcNf, OvcPb, OvcPf,
  OvcEf, OvcSf, OvcVlb, OvcEdit, Buttons, Menus, OvcSc, OvcXfer, OvcData,
  OvcDate, ExtCtrls, CalUnit, OvcConst, OvcValid, OvcExcpt, OvcTCmmn, OvcMisc,
  OvcTable, OvcTCHdr, OvcTCSim, OvcTCNum, OvcTCBEF, OvcTCStr, OvcTCEdt,
  OvcTCell, ComCtrls;

const
  NumOrders = 20;  {Changing this will effect your data file}
  DataListIsModified : Boolean = False;

type
  TRecState = (rsDefault, rsNew, rsEdit);

  OrdRec = packed record
    Qty   : SmallInt;
    Desc  : String[25];
    Cost  : Double;
    Total : Double;
  end;

  {transfer buffer for the OrdEntry form}
  PRec = ^TRec;
  TRec = packed record
    LastName    : string[15];
    FirstName   : string[15];
    Company     : string[30];
    Street      : string[30];
    City        : string[15];
    State       : string[2];
    Zip         : string[10];
    Date        : TOvcDate;
    Orders      : array[1..NumOrders] of OrdRec;
  end;

  TOrdEntryForm = class(TForm)
    OvcNotebook1: TOvcNotebook;
    OvcController1: TOvcController;
    GroupBox1: TGroupBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Insert1: TMenuItem;
    Modify1: TMenuItem;
    Delete1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    LastNameField: TOvcSimpleField;
    FirstNameField: TOvcSimpleField;
    CompanyField: TOvcSimpleField;
    StreetField: TOvcSimpleField;
    CityField: TOvcSimpleField;
    StateField: TOvcSimpleField;
    ZipField: TOvcPictureField;
    OvcSpinner1: TOvcSpinner;
    OvcVirtualListbox1: TOvcVirtualListBox;
    OvcTransfer1: TOvcTransfer;
    Label1: TLabel;
    OvcController2: TOvcController;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    FirstButton: TSpeedButton;
    PrevButton: TSpeedButton;
    NextButton: TSpeedButton;
    SpeedButton9: TSpeedButton;
    LastButton: TSpeedButton;
    OvcTable1: TOvcTable;
    OvcTCNumericField1: TOvcTCNumericField;
    OvcTCSimpleField1: TOvcTCSimpleField;
    OvcTCRowHead1: TOvcTCRowHead;
    N3: TMenuItem;
    Calendar1: TMenuItem;
    InsertHotkey1: TMenuItem;                                 {!!.01}
    DeleteHotkey1: TMenuItem;
    StatusBar1: TStatusBar;
    OvcTCString1: TOvcTCString;
    OvcTCColHead1: TOvcTCColHead;                                 {!!.01}
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OvcNotebook1PageChange(Sender: TObject; Index: Integer;
      var AllowChange: Boolean);
    procedure PopupCalendar(Sender: TObject);
    {$IFDEF Ver80}
    procedure OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
      var ItemString: OpenString);
    {$ELSE}
    procedure OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
      var ItemString: string);
    {$ENDIF}
    procedure FormDestroy(Sender: TObject);
    procedure OvcSpinner1Click(Sender: TObject; State: TOvcSpinState;
      Delta: Double; Wrap: Boolean);
    procedure StateFieldUserCommand(Sender: TObject; Command: Word);
    procedure StateFieldUserValidation(Sender: TObject;
      var ErrorCode: Word);
    procedure StateFieldError(Sender: TObject; ErrorCode: Word;
      ErrorMsg: String);
    procedure PictureFieldExit(Sender: TObject);
    procedure ZipFieldUserValidation(Sender: TObject; var ErrorCode: Word);
    procedure Exit1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Insert1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Modify1Click(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure OvcNotebook1PageChanged(Sender: TObject; Index: Integer);
    procedure About1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
    procedure OvcTable1GetCellAttributes(Sender: TObject; RowNum: Longint;
      ColNum: Integer; var CellAttr: TOvcCellAttributes);
    procedure OvcTable1ActiveCellMoving(Sender: TObject; Command: Word;
      var RowNum: Longint; var ColNum: Integer);
    procedure OvcTable1LeavingColumn(Sender: TObject; ColNum: Integer);
    procedure OvcTable1LeavingRow(Sender: TObject; RowNum: Longint);
    procedure FirstButtonClick(Sender: TObject);
    procedure PrevButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure LastButtonClick(Sender: TObject);
  private
    { Private declarations }
    TR : TRec;
    RecState : TRecState;
    DataList : TStringList;
    BH, BW: Word;
    CalcValue : Double;
    procedure AddRecord;
    procedure OrdException(Sender: TObject; E: Exception);
    procedure ClearData;
    procedure InitOrderFormTransfer(var DataRec : TRec);
    function  InvalidRecord: Boolean;
    procedure MoveToRecord(Index : LongInt; var Rec : TRec);
    function  OrderWasModified: Boolean;
    procedure ReadFile(OrderFile: TFileName);
    procedure ResetForm;
    function  ResetTable: Boolean;
    procedure SaveToFile(OrderFile: TFileName);
    procedure StatusHint(Sender: TObject);
    procedure TableHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure TransferFromDataList(Index : LongInt; var Rec : TRec);
    procedure TransferFromForm;
    procedure TransferToForm;
    procedure UpdateFileName(FName : TFileName);
    procedure UpdateIfModified;
    procedure UpdateRecord;
    procedure UpdateTable;
    function  WillNotSave: Boolean;
    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
      message WM_GETMINMAXINFO;
  public
    { Public declarations }
  end;

var
  OrdEntryForm : TOrdEntryForm;
  CurFile : TFileName;

implementation

{$R *.DFM}

uses Ordntry2;

const
  StateError = oeCustomError + 1;
  MaxStates = 51;
  StateAbbrevs : array[1..MaxStates] of string[2] = (
    {01} 'AK', {02} 'AL', {03} 'AR', {04} 'AZ', {05} 'CA', {06} 'CO',
    {07} 'CT', {08} 'DC', {09} 'DE', {10} 'FL', {11} 'GA', {12} 'HI',
    {13} 'IA', {14} 'ID', {15} 'IL', {16} 'IN', {17} 'KS', {18} 'KY',
    {19} 'LA', {20} 'MA', {21} 'MD', {22} 'ME', {23} 'MI', {24} 'MN',
    {25} 'MO', {26} 'MS', {27} 'MT', {28} 'NC', {29} 'ND', {30} 'NE',
    {31} 'NH', {32} 'NJ', {33} 'NM', {34} 'NV', {35} 'NY', {36} 'OH',
    {37} 'OK', {38} 'OR', {39} 'PA', {40} 'RI', {41} 'SC', {42} 'SD',
    {43} 'TN', {44} 'TX', {45} 'UT', {46} 'VA', {47} 'VT', {48} 'WA',
    {49} 'WI', {50} 'WV', {51} 'WY');

function FindState(const P : string) : Integer;
var
  I : Integer;
begin
  for I := 1 to MaxStates do
    if AnsiCompareStr(P, string(StateAbbrevs[I])) = 0 then begin
      Result := I;
      Exit;
    end;
  Result := -1;
end;

procedure TOrdEntryForm.AddRecord;
var
  PTRRec : PRec;
  ItemNum : Integer;
  DateStr : string;
  ListStr : string;
begin
  New(PTRRec);
  PTRRec^ := TR;
  if TR.Date = BadDate then
    TR.Date := CurrentDate;
  DateStr := FormatDateTime('mm/dd/yy', StDateToDateTime(TR.Date));
  if TR.Company = '' then
    ListStr := Format('%s  %s  %s', [DateStr, TR.FirstName, TR.LastName])
  else if (TR.FirstName = '') and (TR.LastName = '') then
    ListStr := Format('%s  %s', [DateStr, TR.Company])
  else ListStr := Format('%s  %s  (%s %s)', [DateStr, TR.Company,
    TR.FirstName, TR.LastName]);
  ItemNum := DataList.AddObject(ListStr, TObject(PTRRec));
  with OvcVirtualListbox1 do begin
    NumItems := DataList.Count;
    ItemIndex := ItemNum;
  end;
  RecState := rsDefault;
end;

procedure TOrdEntryForm.ClearData;
var
  I : Integer;
begin
  for I := 0 to DataList.Count-1 do
    FreeMem(Pointer(DataList.Objects[I]), SizeOf(TRec));
end;

procedure TOrdEntryForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TOrdEntryForm.FormCreate(Sender: TObject);
begin
  BH := Height;
  BW := Width;
  RecState := rsDefault;
  { Initialize our data list }
  DataList := TStringList.Create;
  DataList.Sorted := True;
  DataList.Duplicates := dupAccept;
  OvcVirtualListbox1.NumItems := 0;
  InitOrderFormTransfer(TR);
  Application.OnHint := StatusHint;
  Application.OnShowHint := TableHint;
  Application.OnException := OrdException;
  if OvcNotebook1.PageIndex = 0 then begin                      {!!.01}
    InsertHotkey1.Enabled := True;                              {!!.01}
    DeleteHotkey1.Enabled := True;                              {!!.01}
  end;                                                          {!!.01}
end;

procedure TOrdEntryForm.FormDestroy(Sender: TObject);
begin
  ClearData;
  DataList.Free;
end;

procedure TOrdEntryForm.FormResize(Sender: TObject);
var
  AH, AW: Word;
  R: TRect;
  I: Integer;
begin
  AH := Height;
  AW := Width;
  { Iterate through all components on form }
  for I := 0 to ComponentCount - 1 do
  { Size only if component is a TControl descendant }
  if Components[I] is TControl then
  { Skip sizing certain components }
  if not((Components[I] is TOvcNotebook) or
         (Components[I] is TPanel) or
         (Components[I] is TSpeedButton)) then begin
    { Resize component }
    R := TControl(Components[I]).BoundsRect;
    with R do begin
      Left := MulDiv(R.Left, AW, BW);
      Top := MulDiv(R.Top, AH, BH);
      Right := MulDiv(R.Right, AW, BW);
      Bottom := MulDiv(R.Bottom, AH, BH);
    end;
    TControl(Components[I]).BoundsRect := R;
  end;
  { Update Height/Width for next time }
  BH := Height;
  BW := Width;
end;

procedure TOrdEntryForm.InitOrderFormTransfer(var DataRec : TRec);
begin
  with DataRec do begin
    LastName      := '';
    FirstName     := '';
    Company       := '';
    Street        := '';
    City          := '';
    State         := '';
    Zip           := '';
    Date          := BadDate;
    FillChar(Orders, SizeOf(Orders), #0);
  end; {with}
end;

procedure TOrdEntryForm.Insert1Click(Sender: TObject);
begin
  if RecState <> rsDefault then                                 {!!.01}
    UpdateIfModified;                                           {!!.01}
  InitOrderFormTransfer(TR);
  UpdateTable;
  TransferToForm;
  RecState := rsNew;
  OvcNotebook1.PageIndex := 1;
  LastNameField.SetFocus;
end;

function TOrdEntryForm.InvalidRecord: Boolean;
begin
  Result := (LastNameField.AsString = '') and (FirstNameField.AsString = '')
    and (CompanyField.AsString = '');
end;

procedure TOrdEntryForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    DataList.Clear;
    OvcVirtualListbox1.NumItems := DataList.Count;
    ReadFile(OpenDialog1.FileName);
    UpdateFileName(OpenDialog1.FileName);
  end;
end;

function TOrdEntryForm.OrderWasModified: Boolean;
var
  DataRec : PRec;
  Temp : TRec;                                                  {!!.01}
begin
  TransferFromForm;
  if RecState = rsNew then begin                                {!!.01}
    InitOrderFormTransfer(Temp);                                {!!.01}
    DataRec := @Temp;                                           {!!.01}
  end else
    DataRec := PRec(DataList.Objects[OvcVirtualListbox1.ItemIndex]);
  Result := CompStruct(TR, DataRec^, SizeOf(TR)) <> 0;
end;

procedure TOrdEntryForm.OrdException(Sender: TObject; E: Exception);
begin
  { Handle case where user reaches end of memo }
  if (E is EEditorError) then
    if EEditorError(E).ErrorCode = oeTooManyBytes then Exit;
  Application.ShowException(E);
end;

procedure TOrdEntryForm.OvcNotebook1PageChange(Sender: TObject; Index: Integer;
  var AllowChange: Boolean);
begin
  AllowChange := True;
  if Index = 0 then begin
    if InvalidRecord then begin
      AllowChange := WillNotSave and ResetTable;
      if AllowChange then begin                                 {!!.01}
        InsertHotkey1.Enabled := True;                          {!!.01}
        DeleteHotkey1.Enabled := True;                          {!!.01}
        RecState := rsDefault                                   {!!.01}
      end;                                                      {!!.01}
    end else begin
      AllowChange := ResetTable;
      if AllowChange then begin                                 {!!.01}
        InsertHotkey1.Enabled := True;                          {!!.01}
        DeleteHotkey1.Enabled := True;                          {!!.01}
        UpdateIfModified;
      end;                                                      {!!.01}
    end;
  end;
  if OvcNotebook1.PageIndex = 0 then begin
    InsertHotkey1.Enabled := False;                             {!!.01}
    DeleteHotkey1.Enabled := False;                             {!!.01}
    if (OvcVirtualListbox1.NumItems > 0) and (RecState <> rsNew) then begin
      TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
      TransferToForm;
      RecState := rsEdit;
    end else begin
      InitOrderFormTransfer(TR);
      TransferToForm;
      RecState := rsNew;
    end;
  end;
end;

procedure TOrdEntryForm.OvcSpinner1Click(Sender: TObject; State: TOvcSpinState;
  Delta: Double; Wrap: Boolean);
var
  CurState : string;
  I : Integer;
begin
  { Get the current value of the field }
  CurState := TOvcSimpleField(OvcSpinner1.FocusedControl).AsString;
  if CurState = '' then
    if State = ssUpBtn then
      I := 1
    else I := MaxStates
  else
    { Look for the state }
    I := FindState(CurState);
  if I <> -1 then begin
    if State = ssUpBtn then
      if I = 1 then
        I := MaxStates
      else
        Dec(I)
    else
      if I = MaxStates then
        I := 1
      else
        Inc(I);
    TOvcSimpleField(OvcSpinner1.FocusedControl).AsString := string(StateAbbrevs[I]);
  end;
end;

procedure TOrdEntryForm.OvcVirtualListbox1GetItem(Sender: TObject;
  Index: Longint; var ItemString: {$IFDEF Win32} string {$ELSE} OpenString {$ENDIF});
begin
  if (Index >= 0) and (Index < DataList.Count) then
    ItemString := DataList.Strings[Index];
end;

procedure TOrdEntryForm.PictureFieldExit(Sender: TObject);
begin
  (Sender as TOvcSimpleField).Uninitialized := False;
end;

procedure TOrdEntryForm.PopupCalendar(Sender: TObject);
begin
  CalForm := TCalForm.Create(Application);
  try
    CalForm.Calendar.CalendarDate := CurrentDate;
    CalForm.ShowModal;
  finally
    CalForm.Free;
  end;
end;

procedure TOrdEntryForm.ReadFile(OrderFile: TFileName);
var
  DataFile : file of TRec;
begin
  System.Assign(DataFile, OrderFile);
  try
    Reset(DataFile);
  except
    on EInOutError do exit;
  end;
  LockWindowUpdate(Handle);
  while not Eof(DataFile) do begin
    FillChar(TR, SizeOf(TR), #0);
    Read(DataFile, TR);
    AddRecord;
  end;
  LockWindowUpdate(0);
  System.Close(DataFile);
  OvcVirtualListbox1.Repaint;
  OvcVirtualListbox1.ItemIndex := 0;
end;

procedure TOrdEntryForm.ResetForm;
begin
  if ResetTable then begin
    TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
    TransferToForm;
    UpdateTable;
    RecState := rsEdit;
  end;
end;

function TOrdEntryForm.ResetTable: Boolean;
begin
  if OvcTable1.InEditingState then
    Result := OvcTable1.StopEditingState(True)
  else
    Result := True;
end;

procedure TOrdEntryForm.Save1Click(Sender: TObject);
begin
  if CurFile = 'NONAME' then
    SaveAs1Click(Sender)
  else
    SaveToFile(CurFile);
end;

procedure TOrdEntryForm.SaveToFile(OrderFile: TFileName);
var
  I : integer;
  DataFile : file of TRec;
  Temp : TRec;
begin
  System.Assign(DataFile, OrderFile);
  Rewrite(DataFile);
  for I := 0 to DataList.Count-1 do begin
    TransferFromDataList(I, Temp);
    Write(DataFile, Temp);
  end;
  System.Close(DataFile);
end;

procedure TOrdEntryForm.StateFieldError(Sender: TObject; ErrorCode: Word;
  ErrorMsg: String);
begin
  if ErrorCode = StateError then
    ShowMessage('Not a valid state abbreviation');
end;

procedure TOrdEntryForm.StateFieldUserCommand(Sender: TObject; Command: Word);
var
  CurState : string;
  I : Integer;
begin
  { Get the current value of the field }
  CurState := TOvcSimpleField(OvcSpinner1.FocusedControl).AsString;
  if CurState = '' then
    if Command = ccUser0 then
      I := 1
    else I := MaxStates
  else
    { Look for the state }
    I := FindState(CurState);
  if I <> -1 then begin
    if Command = ccUser0 then
      if I = 1 then
        I := MaxStates
      else
        Dec(I)
    else
      if I = MaxStates then
        I := 1
      else
        Inc(I);
    TOvcSimpleField(OvcSpinner1.FocusedControl).AsString := string(StateAbbrevs[I]);
  end;
end;

procedure TOrdEntryForm.StateFieldUserValidation(Sender: TObject;
  var ErrorCode: Word);
var
  CurState : string;
begin
  if ErrorCode <> 0 then Exit;
  CurState := StateField.AsString;
  if (CurState <> '') and (FindState(CurState) = -1) then
    ErrorCode := StateError;
end;

procedure TOrdEntryForm.StatusHint(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := Application.Hint;
end;

procedure TOrdEntryForm.TableHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
var
  HintRow : TRowNum;
  HintCol : TColNum;
  CellRight, CellBottom : LongInt;
  Temp : TPoint;
  TblRegion : TOvcTblRegion;
begin
  with HintInfo do begin
    if HintControl = OvcTable1 then begin
        { Which cell are we in? }
      TblRegion := OvcTable1.CalcRowColFromXY(CursorPos.X, CursorPos.Y, HintRow, HintCol);
        { Handle if mouse is over a non-cell area }
      if (TblRegion = otrOutside) or (TblRegion = otrInUnused) then begin
        CursorRect := Rect(Pred(CursorPos.X), Pred(CursorPos.Y),
          Succ(CursorPos.X), Succ(CursorPos.Y));
        HintStr := 'Non-cell area';
      end else begin
          { Calculate the right side of the cell }
        CellRight := (OvcTable1.ColOffset[HintCol] +
          OvcTable1.Columns.Width[HintCol]);
          { Handle if next cell is out of view }
        if CellRight > OvcTable1.ClientWidth then
          CellRight := OvcTable1.ClientWidth;
          { Do the same for the bottom of the cell }
        CellBottom := (OvcTable1.RowOffset[HintRow] +
          OvcTable1.Rows.Height[HintRow]);
        if CellBottom > OvcTable1.ClientHeight then
          CellBottom := OvcTable1.ClientHeight;
          { Set CursorRect to the cell's rect }
        CursorRect := Rect(OvcTable1.ColOffset[HintCol], OvcTable1.RowOffset[HintRow],
          CellRight, CellBottom);
          { Set HintStr appropriately }
        HintStr := Format('Column: %d Row: %d', [HintCol, HintRow]);
      end;
        { Set the position of the hint }
      Temp := OvcTable1.ClientToScreen(CursorPos);
      HintPos.X := Temp.X - 10;
      HintPos.Y := Temp.Y + 20;
    end;
  end;
end;

procedure TOrdEntryForm.TransferFromDataList(Index : LongInt; var Rec : TRec);
var
  DataRec : PRec;
  I : integer;
begin
  FillChar(Rec, SizeOf(Rec), #0);
  DataRec := PRec(DataList.Objects[Index]);
  with Rec do begin
    LastName    := DataRec^.LastName;
    FirstName   := DataRec^.FirstName;
    Company     := DataRec^.Company;
    Street      := DataRec^.Street;
    City        := DataRec^.City;
    State       := DataRec^.State;
    Zip         := DataRec^.Zip;
    Date        := DataRec^.Date;
    for I := 1 to NumOrders do begin
      Orders[I].Qty   := DataRec^.Orders[I].Qty;
      Orders[I].Desc  := DataRec^.Orders[I].Desc;
      Orders[I].Cost  := DataRec^.Orders[I].Cost;
      Orders[I].Total := DataRec^.Orders[I].Total;
    end;
  end;
end;

procedure TOrdEntryForm.TransferFromForm;
begin
  OvcTransfer1.TransferFromFormS([LastNameField,
                                 FirstNameField,
                                 CompanyField,
                                 StreetField,
                                 CityField,
                                 StateField,
                                 ZipField], TR);
end;

procedure TOrdEntryForm.TransferToForm;
begin
  OvcTransfer1.TransferToFormS([LastNameField,
                               FirstNameField,
                               CompanyField,
                               StreetField,
                               CityField,
                               StateField,
                               ZipField], TR);
end;

procedure TOrdEntryForm.UpdateFileName(FName : TFileName);
begin
  CurFile := FName;
  OrdEntryForm.Caption := Format('Order Entry Demo - %s',
    [ExtractFileName(FName)]);
end;

procedure TOrdEntryForm.UpdateIfModified;
begin
  if OrderWasModified then begin
    case RecState of
      rsEdit : UpdateRecord;
      rsNew  : AddRecord;
    end;
    OvcVirtualListbox1.Repaint;
    DataListIsModified := True;
  end;
end;

procedure TOrdEntryForm.UpdateRecord;
begin
  DataList.Delete(OvcVirtualListbox1.ItemIndex);
  AddRecord;
  RecState := rsDefault;
end;

function TOrdEntryForm.WillNotSave: Boolean;
begin
  Result := MessageDlg('At least one of the first three fields on the ' +
    'Client Info page must be filled in.  This record will NOT be saved ' +
    'if you choose OK.', mtInformation, [mbOK, mbCancel], 0) = mrOK;
end;

procedure TOrdEntryForm.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
{ Limits the form sizing so the controls don't get all whacked out }
var
  MinMax: PMinMaxInfo;
begin
  inherited;
  MinMax := Message.MinMaxInfo;
  MinMax^.ptMinTrackSize.X := 435;
  MinMax^.ptMinTrackSize.Y := 380;
end;

procedure TOrdEntryForm.ZipFieldUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if ErrorCode <> 0 then Exit;
  ErrorCode := ValidateSubFields(Sender as TOvcPictureField, 'uuuuu-pppp');
end;

procedure TOrdEntryForm.Delete1Click(Sender: TObject);
begin
  if RecState = rsNew then begin
    ResetForm;
    Exit;
  end;
  if OvcVirtualListbox1.ItemIndex = -1 then Exit;
  OvcNotebook1.PageIndex := 0;
  DataList.Delete(OvcVirtualListbox1.ItemIndex);
  OvcVirtualListbox1.NumItems := OvcVirtualListbox1.NumItems - 1;
end;

procedure TOrdEntryForm.Modify1Click(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems <= 0 then Exit;
  TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
  TransferToForm;
  RecState := rsEdit;
  OvcNotebook1.PageIndex := 1;
end;

procedure TOrdEntryForm.SaveAs1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    SaveToFile(SaveDialog1.FileName);
    UpdateFileName(SaveDialog1.FileName);
  end;
end;

procedure TOrdEntryForm.OvcNotebook1PageChanged(Sender: TObject;
  Index: Integer);
begin
  if Index = 1 then begin
    UpdateTable;
    LastNameField.SetFocus;
  end;
end;

procedure TOrdEntryForm.About1Click(Sender: TObject);
begin
  OrdAbout.ShowModal;
end;

procedure TOrdEntryForm.New1Click(Sender: TObject);
begin
  DataList.Clear;
  UpdateFileName('NONAME');
  OvcVirtualListbox1.NumItems := DataList.Count;
  OvcVirtualListbox1.Repaint;
end;

procedure TOrdEntryForm.OvcTable1GetCellData(Sender: TObject; RowNum: Longint;
  ColNum: Integer; var Data: Pointer; Purpose : TOvcCellDataPurpose);
begin
  Data := nil;
  { As a TOvcTCColHead-component is used for the headings, there is no need to provide
    any data for RowNum=0. }
  if (RowNum > 0) and (RowNum<=NumOrders) then begin
    case ColNum of
      1 : Data := @TR.Orders[RowNum].Qty;
      2 : Data := @TR.Orders[RowNum].Desc;
      3 : Data := @TR.Orders[RowNum].Cost;
      4 : begin
            CalcValue := TR.Orders[RowNum].Qty * TR.Orders[RowNum].Cost;
            Data := @CalcValue;
          end;
    end;
  end;
end;

procedure TOrdEntryForm.OvcTable1GetCellAttributes(Sender: TObject;
  RowNum: Longint; ColNum: Integer; var CellAttr: TOvcCellAttributes);
begin
  if ColNum = 4 then
    with CellAttr do begin
      if RowNum <> 0 then caFontColor := clBlue;
      caAccess := otxReadOnly;
    end;
end;

procedure TOrdEntryForm.OvcTable1ActiveCellMoving(Sender: TObject;
  Command: Word; var RowNum: Longint; var ColNum: Integer);
begin
  if ColNum = 4 then
    if RowNum = Pred(OvcTable1.RowLimit) then
      with OvcTable1 do begin
        AllowRedraw := False;
        InvalidateCell(RowNum, 4);
        AllowRedraw := True;
        ColNum := 3;
      end
    else begin
      ColNum := 1;
      Inc(RowNum);
    end;
end;

procedure TOrdEntryForm.OvcTable1LeavingColumn(Sender: TObject;
  ColNum: Integer);
begin
  with OvcTable1 do begin
    if ColNum in [1, 3] then
      InvalidateCell(OvcTable1.ActiveRow, 4);
  end;
end;

procedure TOrdEntryForm.OvcTable1LeavingRow(Sender: TObject;
  RowNum: Longint);
begin
  with OvcTable1 do begin
    if ActiveCol in [1, 3] then
      InvalidateCell(RowNum, 4);
  end;
end;

procedure TOrdEntryForm.UpdateTable;
begin
  with OvcTable1 do begin
    AllowRedraw := False;
    InvalidateTable;
    AllowRedraw := True;
    ActiveRow := 1;
    ActiveCol := 1;
    TopRow := 1;
  end;
end;

procedure TOrdEntryForm.MoveToRecord(Index : LongInt; var Rec : TRec);
begin
  TransferFromDataList(Index, Rec);
  TransferToForm;
  if OvcNotebook1.PageIndex = 1 then
    RecState := rsEdit;
  UpdateTable;
end;

procedure TOrdEntryForm.FirstButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems > 0 then begin
    if ResetTable then begin
      UpdateIfModified;
      OvcVirtualListbox1.ItemIndex := 0;
      MoveToRecord(OvcVirtualListbox1.ItemIndex, TR);
    end;
  end;
end;

procedure TOrdEntryForm.PrevButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.ItemIndex <= 0 then
    Exit;

  if OvcVirtualListbox1.NumItems > 0 then begin
    if ResetTable then begin
      UpdateIfModified;
      OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.ItemIndex - 1;
      MoveToRecord(OvcVirtualListbox1.ItemIndex, TR);
    end;
  end;
end;

procedure TOrdEntryForm.NextButtonClick(Sender: TObject);
begin
  if (OvcVirtualListbox1.ItemIndex >= Pred(OvcVirtualListbox1.NumItems)) then
    Exit;

  if OvcVirtualListbox1.NumItems > 0 then begin
    if ResetTable then begin
      UpdateIfModified;
      OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.ItemIndex + 1;
      MoveToRecord(OvcVirtualListbox1.ItemIndex, TR);
    end;
  end;
end;

procedure TOrdEntryForm.LastButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems > 0 then begin
    if ResetTable then begin
      UpdateIfModified;
      OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.NumItems - 1;
      MoveToRecord(OvcVirtualListbox1.ItemIndex, TR);
    end;
  end;
end;

end.
