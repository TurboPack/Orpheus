{$J+} {Writable constants}

unit Adrbook1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, OvcBase, OvcNbk, TabNotBk, StdCtrls, OvcNf, OvcPb, OvcPf,
  OvcEf, OvcSf, OvcVlb, OvcEdit, Buttons, Menus, OvcSc, OvcXfer, OvcData,
  ExtCtrls, CalUnit, OvcConst, OvcValid, OvcExcpt, OvcEditU, OvcDate,
  O32EditF, O32Flxed;

type
  TRecState = (rsDefault, rsNew, rsEdit);

  {transfer buffer for the AdrForm form}
  PRec = ^TRec;
  TRec = packed record
    LastName    : string[15];
    FirstName   : string[15];
    Company     : string[30];
    Street      : string[30];
    City        : string[15];
    State       : string[2];
    Zip         : string[10];
    HomePhone   : string[14];
    WorkPhone   : string[14];
    Birthday    : TStDate;
    Anniversary : TStDate;
    Memo        : string[255];
  end;

  TAddrForm = class(TForm)
    OvcNotebook1: TOvcNotebook;
    OvcController1: TOvcController;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    OvcEditor1: TOvcEditor;
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
    BirthdayField: TOvcPictureField;
    AnniversaryField: TOvcPictureField;
    HomePhoneField: TOvcPictureField;
    WorkPhoneField: TOvcPictureField;
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
    Label2: TLabel;
    Panel1: TPanel;
    OvcController2: TOvcController;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    ExitButton: TSpeedButton;
    InsButton: TSpeedButton;
    DelButton: TSpeedButton;
    FirstButton: TSpeedButton;
    PrevButton: TSpeedButton;
    NextButton: TSpeedButton;
    HelpButton: TSpeedButton;
    LastButton: TSpeedButton;
    OvcFourWaySpinner1: TOvcSpinner;
    OvcFourWaySpinner2: TOvcSpinner;
    FlexEdit1: TO32FlexEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure OvcNotebook1PageChange(Sender: TObject; Index: Integer;
      var AllowChange: Boolean);
    procedure PopupCalendar(Sender: TObject);
    {$IFNDEF Win32}
    procedure OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
      var ItemString: OpenString);
    {$ELSE}
    procedure OvcVirtualListbox1GetItem(Sender: TObject; Index: Longint;
      var ItemString : string);
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
    procedure PhoneFieldUserValidation(Sender: TObject;
      var ErrorCode: Word);
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
    procedure LastButtonClick(Sender: TObject);
    procedure FirstButtonClick(Sender: TObject);
    procedure NextButtonClick(Sender: TObject);
    procedure PrevButtonClick(Sender: TObject);
    procedure DisplayCalendar(Sender: TObject; Command: Word);
  private
    { Private declarations }
    TR : TRec;
    RecState : TRecState;
    DataList : TStringList;
    BH, BW: Word;
    procedure AddRecord;
    procedure AddrException(Sender: TObject; E: Exception);
    procedure ClearData;
    procedure InitAddrFormTransfer(var DataRec : TRec);
    procedure ReadFile(AddrFile: TFileName);
    procedure SaveToFile(AddrFile: TFileName);
    procedure StatusHint(Sender: TObject);
    procedure TransferFromDataList(Index : LongInt; var Rec : TRec);
    procedure TransferFromForm;
    procedure TransferToForm;
    procedure UpdateFileName(FName : TFileName);
    procedure UpdateMemoLabel;
    procedure UpdateRecord;
    procedure WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
      message WM_GETMINMAXINFO;
  public
    { Public declarations }
  end;

var
  AddrForm : TAddrForm;
  CurFile : TFileName;

implementation

{$R *.DFM}

uses AdrBook2;

const
  StateError = oeCustomError + 1;
  MaxStates = 51;
  StateAbbrevs : array[1..MaxStates] of string = (
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
    if AnsiCompareStr(P, StateAbbrevs[I]) = 0 then begin
      Result := I;
      Exit;
    end;
  Result := -1;
end;

procedure TAddrForm.StatusHint(Sender: TObject);
begin
  Panel1.Caption := Application.Hint;
end;

procedure TAddrForm.AddrException(Sender: TObject; E: Exception);
begin
  { Handle case where user reaches end of memo }
  if (E is EEditorError) then
    if EEditorError(E).ErrorCode = oeTooManyBytes then Exit;
  Application.ShowException(E);
end;

procedure TAddrForm.ReadFile(AddrFile: TFileName);
var
  DataFile : file of TRec;
begin
  System.Assign(DataFile, AddrFile);
  try
    Reset(DataFile);
  except
    on EInOutError do exit;
  end;

  {avoid painting while file is loaded}
  LockWindowUpdate(Handle);
  try
    while not Eof(DataFile) do begin
      FillChar(TR, SizeOf(TR), #0);
      Read(DataFile, TR);
      AddRecord;
    end;
  finally
    LockWindowUpdate(0);
  end;

  System.Close(DataFile);
  OvcVirtualListbox1.Repaint;
  OvcVirtualListbox1.ItemIndex := 0;
end;

procedure TAddrForm.SaveToFile(AddrFile: TFileName);
var
  I : integer;
  DataFile : file of TRec;
  Temp : TRec;
begin
  System.Assign(DataFile, AddrFile);
  Rewrite(DataFile);
  for I := 0 to DataList.Count-1 do begin
    TransferFromDataList(I, Temp);
    Write(DataFile, Temp);
  end;
  System.Close(DataFile);
end;

procedure TAddrForm.InitAddrFormTransfer(var DataRec : TRec);
begin
  with DataRec do begin
    LastName      := '';
    FirstName     := '';
    Company       := '';
    Street        := '';
    City          := '';
    State         := '';
    Zip           := '';
    HomePhone     := '';
    WorkPhone     := '';
    Birthday      := CurrentDate;
    Anniversary   := CurrentDate;
    Memo          := '';
  end; {with}
end;

procedure TAddrForm.ClearData;
var
  I : Integer;
begin
  for I := 0 to DataList.Count-1 do
    FreeMem(Pointer(DataList.Objects[I]), SizeOf(TRec));
end;

procedure TAddrForm.AddRecord;
var
  PTRRec : PRec;
  ItemNum : Integer;
  ListStr : string;
begin
  New(PTRRec);
  PTRRec^ := TR;
  if TR.Company = '' then
    ListStr := Format('%s, %s', [TR.LastName, TR.FirstName])
  else ListStr := Format('%s, %s  (%s)', [TR.LastName,
    TR.FirstName, TR.Company]);
  ItemNum := DataList.AddObject(ListStr, TObject(PTRRec));
  with OvcVirtualListbox1 do begin
    NumItems := DataList.Count;
    ItemIndex := ItemNum;
  end;
  RecState := rsDefault;
end;

procedure TAddrForm.UpdateFileName(FName : TFileName);
begin
  CurFile := FName;
  AddrForm.Caption := Format('Address Book Demo - %s',
    [ExtractFileName(FName)]);
end;

procedure TAddrForm.UpdateRecord;
var
  I : Integer;                                                         {!!.01}
begin
  I := OvcVirtualListbox1.ItemIndex;                                   {!!.01}
  FreeMem(Pointer(DataList.Objects[I]), SizeOf(TRec));                 {!!.01}
  DataList.Delete(I);                                                  {!!.01}
  AddRecord;
  RecState := rsDefault;
end;

procedure TAddrForm.FormCreate(Sender: TObject);
begin
  BH := Height;
  BW := Width;
  RecState := rsDefault;
  { Add international date support }
  with BirthdayField do
    PictureMask := IntlSupport.InternationalDate(True);
  with AnniversaryField do
    PictureMask := IntlSupport.InternationalDate(True);
  { Initialize our data list }
  DataList := TStringList.Create;
  DataList.Sorted := True;
  DataList.Duplicates := dupAccept;
  OvcVirtualListbox1.NumItems := 0;
  InitAddrFormTransfer(TR);
  OvcEditor1.WrapColumn := OvcEditor1.VisibleColumns;
  Application.OnHint := StatusHint;
  Application.OnException := AddrException;
end;

procedure TAddrForm.FormResize(Sender: TObject);
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

procedure TAddrForm.OvcNotebook1PageChange(Sender: TObject; Index: Integer;
  var AllowChange: Boolean);
begin
  AllowChange := True;
  if (Index = 0) and (OvcNotebook1.PageIndex <> -1) then begin
    if (LastNameField.AsString = '') and (FirstNameField.AsString = '')
      and (CompanyField.AsString = '') then begin
        AllowChange := MessageDlg('At least one of the first three fields '+
        'on the Client Info page must be filled in.  This record '+
        'will NOT be saved if you choose OK.',
        mtInformation, [mbOK, mbCancel], 0) = mrOK;
        if AllowChange then RecState := rsDefault;
    end else begin
      if homephonefield.efValidateField<>0 then begin
        AllowChange := False;
      end else begin
        TransferFromForm;
        case RecState of
          rsEdit : UpdateRecord;
          rsNew  : AddRecord;
        end;
        OvcVirtualListbox1.Repaint;
      end;
    end;
  end;
  if OvcNotebook1.PageIndex = 0 then begin
    if (OvcVirtualListbox1.NumItems > 0) and (RecState <> rsNew) then begin
      TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
      TransferToForm;
      RecState := rsEdit;
    end else begin
      InitAddrFormTransfer(TR);
      TransferToForm;
      RecState := rsNew;
    end;
  end;
  if Index = 2 then
    UpdateMemoLabel;
end;

procedure TAddrForm.PopupCalendar(Sender: TObject);
var
  PF : TOvcPictureField;
  D  : TOvcDate;
begin
  CalForm := TCalForm.Create(Application);
  try
    PF := TOvcPictureField(Sender);
    D := PF.AsOvcDate;
    if D = BadDate then
      D := CurrentDate;
    CalForm.Calendar.CalendarDate := StDateToDateTime(D);
    CalForm.ShowModal;
    if CalForm.ModalResult = idOK then begin
      PF.AsDateTime := CalForm.Calendar.Date;
      PF.Uninitialized := False;
    end;
  finally
    CalForm.Free;
  end;
end;

procedure TAddrForm.OvcVirtualListbox1GetItem(Sender: TObject;
  Index: Longint; var ItemString: {$IFDEF Ver80} OpenString {$ELSE} string {$ENDIF});
begin
  if (Index >= 0) and (Index < DataList.Count) then
    ItemString := DataList.Strings[Index];
end;

procedure TAddrForm.FormDestroy(Sender: TObject);
begin
  ClearData;
  DataList.Free;
end;

procedure TAddrForm.TransferFromDataList(Index : LongInt; var Rec : TRec);
var
  DataRec : PRec;
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
    HomePhone   := DataRec^.HomePhone;
    WorkPhone   := DataRec^.WorkPhone;
    Birthday    := DataRec^.Birthday;
    Anniversary := DataRec^.Anniversary;
    Memo        := DataRec^.Memo;
  end;
end;

procedure TAddrForm.TransferFromForm;
begin
  OvcTransfer1.TransferFromFormS([LastNameField,
                                  FirstNameField,
                                  CompanyField,
                                  StreetField,
                                  CityField,
                                  StateField,
                                  ZipField,
                                  HomePhoneField,
                                  WorkPhoneField,
                                  BirthdayField,
                                  AnniversaryField,
                                  OvcEditor1], TR);
end;

procedure TAddrForm.TransferToForm;
begin
  FlexEdit1.Strings.Clear;
  FlexEdit1.Editlines.MaxLines := 10;
  OvcTransfer1.TransferToFormS([LastNameField,
                                FirstNameField,
                                CompanyField,
                                StreetField,
                                CityField,
                                StateField,
                                ZipField,
                                HomePhoneField,
                                WorkPhoneField,
                                BirthdayField,
                                AnniversaryField,
                                OvcEditor1], TR);

  FlexEdit1.Strings.Add(LastNameField.Text + ', ' + FirstNameField.Text);
  if CompanyField.Text <> '' then
    FlexEdit1.Strings.Add(CompanyField.Text);
  if StreetField.Text <> '' then
    FlexEdit1.Strings.Add(StreetField.Text);
  if CityField.Text <> '' then
    FlexEdit1.Strings.Add(CityField.Text + ', ' + StateField.Text + ' '
      + ZipField.Text);

  if HomePhoneField.Text <> '' then
    FlexEdit1.Strings.Add('Home Phone: ' + HomePhoneField.Text);
  if WorkPhoneField.Text <> '' then
    FlexEdit1.Strings.Add('WorkPhone: ' + WorkPhoneField.Text);
  if BirthdayField.Text <> '' then
    FlexEdit1.Strings.Add('Birthday: ' + BirthdayField.Text);
  if AnniversaryField.Text <> '' then
    FlexEdit1.Strings.Add('Anniversary: ' + AnniversaryField.Text);

  FlexEdit1.Editlines.MaxLines := FlexEdit1.Strings.Count;
  FlexEdit1.Editlines.MouseOverLines := FlexEdit1.Strings.Count;
  FlexEdit1.Editlines.FocusedLines := FlexEdit1.Strings.Count;
end;

procedure TAddrForm.UpdateMemoLabel;
begin
  Label2.Caption := Format('Memo for: %s %s', [FirstNameField.AsString,
    LastNameField.AsString]);
end;

procedure TAddrForm.WMGetMinMaxInfo(var Message: TWMGetMinMaxInfo);
{ Limits the form sizing so the controls don't get all whacked out }
var
  MinMax: PMinMaxInfo;
begin
  inherited;
  MinMax := Message.MinMaxInfo;
  MinMax^.ptMinTrackSize.X := 435;
  MinMax^.ptMinTrackSize.Y := 380;
end;

procedure TAddrForm.OvcSpinner1Click(Sender: TObject; State: TOvcSpinState;
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
    TOvcSimpleField(OvcSpinner1.FocusedControl).AsString := StateAbbrevs[I];
  end;
end;

procedure TAddrForm.StateFieldUserCommand(Sender: TObject; Command: Word);
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
    TOvcSimpleField(OvcSpinner1.FocusedControl).AsString := StateAbbrevs[I];
  end;
end;

procedure TAddrForm.StateFieldUserValidation(Sender: TObject;
  var ErrorCode: Word);
var
  CurState : string;
begin
  if ErrorCode <> 0 then Exit;
  CurState := StateField.AsString;
  if CurState <> '' then
    if FindState(CurState) = -1 then
      ErrorCode := StateError;
end;

procedure TAddrForm.StateFieldError(Sender: TObject; ErrorCode: Word;
  ErrorMsg: String);
begin
  if ErrorCode = StateError then
    ShowMessage('Not a valid state abbreviation');
end;

procedure TAddrForm.PictureFieldExit(Sender: TObject);
begin
  (Sender as TOvcPictureField).Uninitialized := False;
end;

procedure TAddrForm.PhoneFieldUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if ErrorCode <> 0 then Exit;
  ErrorCode := ValidateSubFields(Sender as TOvcPictureField, '(ppp) uuu-uuuu');
end;

procedure TAddrForm.ZipFieldUserValidation(Sender: TObject;
  var ErrorCode: Word);
begin
  if ErrorCode <> 0 then Exit;
  ErrorCode := ValidateSubFields(Sender as TOvcPictureField, 'uuuuu-pppp');
end;

procedure TAddrForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TAddrForm.Open1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    DataList.Clear;
    OvcVirtualListbox1.NumItems := DataList.Count;
    ReadFile(OpenDialog1.FileName);
    UpdateFileName(OpenDialog1.FileName);
  end;
end;

procedure TAddrForm.Save1Click(Sender: TObject);
begin
  if CurFile = 'NONAME' then
    SaveAs1Click(Sender)
  else
    SaveToFile(CurFile);
end;

procedure TAddrForm.Insert1Click(Sender: TObject);
begin
  if RecState = rsNew then begin
    TransferFromForm;
    AddRecord;
    OvcVirtualListbox1.Repaint;
    LastNameField.SetFocus;
  end;
  InitAddrFormTransfer(TR);
  TransferToForm;
  RecState := rsNew;
  OvcNotebook1.PageIndex := 1;
end;

procedure TAddrForm.Delete1Click(Sender: TObject);
begin
  if OvcVirtualListbox1.ItemIndex = -1 then
    Exit;
  OvcNotebook1.PageIndex := 0;
  DataList.Delete(OvcVirtualListbox1.ItemIndex);
  OvcVirtualListbox1.NumItems := OvcVirtualListbox1.NumItems - 1;
end;

procedure TAddrForm.Modify1Click(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems <= 0 then Exit;
  TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
  TransferToForm;
  RecState := rsEdit;
  OvcNotebook1.PageIndex := 1;
end;

procedure TAddrForm.SaveAs1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then begin
    SaveToFile(SaveDialog1.FileName);
    UpdateFileName(SaveDialog1.FileName);
  end;
end;

procedure TAddrForm.OvcNotebook1PageChanged(Sender: TObject;
  Index: Integer);
begin
  if Index = 1 then
    LastNameField.SetFocus;
end;

procedure TAddrForm.About1Click(Sender: TObject);
begin
  AdrAbout.ShowModal;
end;

procedure TAddrForm.New1Click(Sender: TObject);
begin
  DataList.Clear;
  UpdateFileName('NONAME');
  OvcVirtualListbox1.NumItems := DataList.Count;
  OvcVirtualListbox1.Repaint;
end;

procedure TAddrForm.LastButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems > 0 then begin
    OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.NumItems - 1;
    TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
    TransferToForm;
    UpdateMemoLabel;
  end;
end;

procedure TAddrForm.FirstButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems > 0 then begin
    OvcVirtualListbox1.ItemIndex := 0;
    TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
    TransferToForm;
    UpdateMemoLabel;
  end;
end;

procedure TAddrForm.NextButtonClick(Sender: TObject);
begin
  if OvcVirtualListbox1.NumItems > 0 then begin
    OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.ItemIndex + 1;
    TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
    TransferToForm;
    UpdateMemoLabel;
  end;
end;

procedure TAddrForm.PrevButtonClick(Sender: TObject);
begin
  if (OvcVirtualListbox1.NumItems > 0)
    and (OvcVirtualListbox1.ItemIndex <> 0) then begin                 {!!.03}
    OvcVirtualListbox1.ItemIndex := OvcVirtualListbox1.ItemIndex - 1;
    TransferFromDataList(OvcVirtualListbox1.ItemIndex, TR);
    TransferToForm;
    UpdateMemoLabel;
  end;
end;

procedure TAddrForm.DisplayCalendar(Sender: TObject; Command: Word);
var
  PF : TOvcPictureField;
  D  : TOvcDate;
begin
  CalForm := TCalForm.Create(Application);
  try
    PF := TOvcPictureField(Sender);
    D := PF.AsOvcDate;
    if D = BadDate then
      D := CurrentDate;
    CalForm.Calendar.CalendarDate := D;
    CalForm.ShowModal;
    if CalForm.ModalResult = idOK then begin
      PF.AsDateTime := CalForm.Calendar.Date;
      PF.Uninitialized := False;
    end;
  finally
    CalForm.Free;
  end;
end;

end.
