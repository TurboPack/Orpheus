{$I OVC.INC}

unit ExRvDir0;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OvcBase, OvcRVIdx, OvcRptVw, Buttons,
  OvcMisc, OvcLkOut, OvcCmbx, OvcRvCbx, OvcDlg, OvcRvPDg, OvcViewEd,
  OvcFiler, OvcStore, OvcBtnHd, ImgList, FileCtrl, Menus, OvcState,
  {$IFDEF VERSION7} Variants, {$ENDIF}
  OvcHsCbx, ComCtrls;

type
  TForm1 = class(TForm)
    OvcReportView1: TOvcReportView;
    Panel1: TPanel;
    Label1: TLabel;
    OvcViewComboBox1: TOvcViewComboBox;
    OvcIniFileStore1: TOvcIniFileStore;
    Label2: TLabel;
    Button2: TButton;
    ImageList1: TImageList;
    OvcRvPrintDialog1: TOvcRvPrintDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    View1: TMenuItem;
    Appearance1: TMenuItem;
    Exit1: TMenuItem;
    SelectDirectory1: TMenuItem;
    N1: TMenuItem;
    ViewDirectoryIncludeSubdirectories1: TMenuItem;
    Grid1: TMenuItem;
    mnGridNone: TMenuItem;
    mnGridHorz: TMenuItem;
    mnGridVert: TMenuItem;
    mnGridBoth: TMenuItem;
    HeaderFooterStyle1: TMenuItem;
    mnHStyleNorm: TMenuItem;
    mnHStyleEtched: TMenuItem;
    mnHStyleFlat: TMenuItem;
    mnHStyleThin: TMenuItem;
    NewLayout1: TMenuItem;
    EditCurrentLayout1: TMenuItem;
    CopyEditCurrentLayout1: TMenuItem;
    DeleteCurrentLayout1: TMenuItem;
    OvcHistoryComboBox1: TOvcHistoryComboBox;
    OvcComponentState1: TOvcComponentState;
    N2: TMenuItem;
    EditCalculatedFields1: TMenuItem;
    N3: TMenuItem;
    Print1: TMenuItem;
    N4: TMenuItem;
    mnListBorder: TMenuItem;
    ColorDialog1: TColorDialog;
    N5: TMenuItem;
    SetListColor1: TMenuItem;
    SetGroupColor1: TMenuItem;
    FontDialog1: TFontDialog;
    SelectFont1: TMenuItem;
    N6: TMenuItem;
    ScrollBars1: TMenuItem;
    mnScrollHorz: TMenuItem;
    mnScrollVert: TMenuItem;
    N7: TMenuItem;
    mnAllowDrag: TMenuItem;
    Behaviour1: TMenuItem;
    mnMultiSelect: TMenuItem;
    StatusBar1: TStatusBar;
    PrintOptions1: TMenuItem;
    PrinterSettings1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PopupMenu1: TPopupMenu;
    mnShowItemInfo: TMenuItem;
    mnShowGroupInfo: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OvcReportView1CompareColumns(Sender: TObject; Data1,
      Data2: Pointer; Column: Integer; var Res: Integer);
    procedure OvcReportView1SignalBusy(Sender: TObject; BusyFlag: Boolean);
    procedure OvcReportView1GetPrintHeaderFooter(Sender: TObject;
      IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
      RightString: string; var LeftAttr, CenterAttr,
      RightAttr: TFontStyles);
    procedure OvcReportView1GetFieldValue(Sender: TObject; Data: Pointer;
      FieldIndex: Integer; var Value: Variant);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure OvcReportView1ViewSelect(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure OvcReportView1Enumerate(Sender: TObject; Data: Pointer;
      var Stop: Boolean; UserData: Pointer);
    procedure Exit1Click(Sender: TObject);
    procedure ViewDirectoryIncludeSubdirectories1Click(Sender: TObject);
    procedure mnGridNoneClick(Sender: TObject);
    procedure mnGridHorzClick(Sender: TObject);
    procedure mnGridVertClick(Sender: TObject);
    procedure mnGridBothClick(Sender: TObject);
    procedure mnHStyleNormClick(Sender: TObject);
    procedure mnHStyleEtchedClick(Sender: TObject);
    procedure mnHStyleFlatClick(Sender: TObject);
    procedure mnHStyleThinClick(Sender: TObject);
    procedure NewLayout1Click(Sender: TObject);
    procedure EditCurrentLayout1Click(Sender: TObject);
    procedure CopyEditCurrentLayout1Click(Sender: TObject);
    procedure DeleteCurrentLayout1Click(Sender: TObject);
    procedure OvcReportView1DrawViewFieldEx(Sender: TObject;
      Canvas: TCanvas; Field: TOvcRvField; ViewField: TOvcRvViewField;
      var TextAlign: Integer; IsSelected, IsGroupLine: Boolean;
      Data: Pointer; Rect: TRect; const Text, TruncText: String;
      var DefaultDrawing: Boolean);
    procedure EditCalculatedFields1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure mnListBorderClick(Sender: TObject);
    procedure SetListColor1Click(Sender: TObject);
    procedure SetGroupColor1Click(Sender: TObject);
    procedure SelectFont1Click(Sender: TObject);
    procedure mnScrollHorzClick(Sender: TObject);
    procedure mnScrollVertClick(Sender: TObject);
    procedure mnAllowDragClick(Sender: TObject);
    procedure mnMultiSelectClick(Sender: TObject);
    procedure OvcReportView1PrintStatus(Sender: TObject; Page: Integer;
      var Abort: Boolean);
    procedure PrintOptions1Click(Sender: TObject);
    procedure OvcReportView1GetFieldAsString(Sender: TObject;
      Data: Pointer; FieldIndex: Integer; var Str: String);
    procedure OvcReportView1GetFieldAsFloat(Sender: TObject; Data: Pointer;
      FieldIndex: Integer; var Value: Double);
    procedure OvcReportView1KeySearch(Sender: TObject; SortColumn: Integer;
      const KeyString: String);
    procedure PrinterSettings1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure mnShowItemInfoClick(Sender: TObject);
    procedure mnShowGroupInfoClick(Sender: TObject);
    procedure OvcReportView1GetGroupString(Sender: TObject;
      FieldIndex: Integer; GroupRef: TOvcRvIndexGroup; var Str: String);
    procedure OvcReportView1Extern(Sender: TOvcAbstractReportView;
      const ArgList: Variant; var Result: Variant);
  private
    procedure LoadFileListWithSubdirectories(const Root: string);
    procedure SetScrollBars;
  public
    procedure ClearFileList;
    procedure LoadFileList(const Root: string; IncludeSubs: Boolean);
  end;

var
  Form1: TForm1;

implementation
uses
  Math,
  ExRvDir1;

{report view field index constants:}
const
  fiFileName    = 0;
  fiSize        = 1;
  fiDate        = 2;
  fiArchive     = 3;
  fiReadOnly    = 4;
  fiHidden      = 5;
  fiSystem      = 6;
  fiType        = 7;
  fiPath        = 8;

{image index for check mark:}
const
  iiCheck       = 4;

{$R *.DFM}

{record type to hold information for a file}
type
  TFileRec = record
    SearchRec: TSearchRec;
    Path: string;
    Ext: string;
  end;
  PFileRec = ^TFileRec;

procedure TForm1.ClearFileList;
begin
  OvcReportView1.Enumerate(nil);
  OvcReportView1.Clear;
end;

procedure TForm1.LoadFileListWithSubdirectories(const Root: string);
var
  SearchRec : TSearchRec;
  NewFileRec : PFileRec;
begin
  if FindFirst(Root + '\*.*', faAnyFile, SearchRec) = 0 then begin
    StatusBar1.Panels[0].Text := 'Scanning ' + Root + ' ...';
    Application.ProcessMessages;
    repeat
      if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then begin
        New(NewFileRec);
        NewFileRec^.SearchRec := SearchRec;
        NewFileRec^.Path := Root;
        NewFileRec^.Ext := ExtractFileExt(SearchRec.Name);
        OvcReportView1.AddData(NewFileRec);
        if (SearchRec.Attr and faDirectory <> 0) then begin
          LoadFileListWithSubdirectories(Root + '\' + SearchRec.Name);
        end;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
end;

procedure TForm1.LoadFileList(const Root: string; IncludeSubs: Boolean);
var
  SearchRec : TSearchRec;
  NewFileRec : PFileRec;
begin
  StatusBar1.Panels[0].Text := 'Scanning ' + Root + ' ...';
  Application.ProcessMessages;
  OvcReportView1.BeginUpdate;
  try
    if FindFirst(Root + '\' + '*.*', faAnyFile, SearchRec) = 0 then
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then begin
          New(NewFileRec);
          NewFileRec^.SearchRec := SearchRec;
          NewFileRec^.Path := Root;
          NewFileRec^.Ext := ExtractFileExt(SearchRec.Name);
          OvcReportView1.AddData(NewFileRec);
          if IncludeSubs and (SearchRec.Attr and faDirectory <> 0) then
            LoadFileListWithSubdirectories(Root + '\' + SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
  finally
    OvcReportView1.EndUpdate;
  end;
  StatusBar1.Panels[0].Text := copy(Root, 1, length(Root) - 1);
  if IncludeSubs then
    StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text + ' (+ sub-dirs)';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  LoadFileList(ExtractFilePath(ParamStr(0)), False);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  {ClearFileList;} {not necessary since we're going away anyway, but
    uncomment when checking for leaks}
end;

procedure TForm1.OvcReportView1CompareColumns(Sender: TObject; Data1,
  Data2: Pointer; Column: Integer; var Res: Integer);
var
  S1: PFileRec absolute Data1;
  S2: PFileRec absolute Data2;
begin
  {Event handler which defines how columns are sorted by comparing the field
   identified by Column in two rows identified by Data1 and Data2.
   Res is set to a value < 0 if the value in Column in Data1 is less than the value in Data2
   Res is set to 0 if the value in Column in Data1 is equal to the value in Data2
   Res is set to a value > 0 if the value in Column in Data1 is greater than the value in Data2.
   Except for equality, the actual value is ignored - only the sign matters.
   }
  if (S1^.SearchRec.Attr and faDirectory <> 0) <> (S2^.SearchRec.Attr and faDirectory <> 0) then
    if (S1^.SearchRec.Attr and faDirectory <> 0) then
      Res := -1
    else
      Res := 1
  else
   case Column of
   fiFileName :
     if SameText(S1^.SearchRec.Name, S2^.SearchRec.Name) then
       Res := 0
     else
       Res := CompareText(S1^.SearchRec.Name, S2^.SearchRec.Name);
   fiSize :
     Res := CompareInt(S1^.SearchRec.Size, S2^.SearchRec.Size);
   fiDate :
     Res := CompareInt(S1^.SearchRec.Time, S2^.SearchRec.Time);
   fiArchive :
     Res := CompareInt(S1^.SearchRec.Attr and faArchive, S2^.SearchRec.Attr and faArchive);
   fiReadOnly :
     Res := CompareInt(S1^.SearchRec.Attr and faReadOnly, S2^.SearchRec.Attr and faReadOnly);
   fiHidden :
     Res := CompareInt(S1^.SearchRec.Attr and faHidden, S2^.SearchRec.Attr and faHidden);
   fiSystem :
     Res := CompareInt(S1^.SearchRec.Attr and faSysFile, S2^.SearchRec.Attr and faSysFile);
   fiType :
     if (S1^.SearchRec.Attr and faDirectory <> 0) then
       Res := 0
     else
       if SameText(S1^.Ext, S2^.Ext) then
         Res := 0
       else
         Res := CompareText(S1^.Ext, S2^.Ext);
   fiPath :
     if SameText(S1^.Path, S2^.Path) then
       Res := 0
     else
       Res := CompareText(S1^.Path, S2^.Path);
   else
     raise Exception.Create('Invalid field index');
   end;
end;

function TIntToStr(Int: Int64): string;
{- return an int64 with thousand separators}
begin
  Result := format('%12.0n', [int * 1.0]);
end;

procedure TForm1.OvcReportView1SignalBusy(Sender: TObject;
  BusyFlag: Boolean);
{- set/clear hourglass cursor when report view goes busy or idle, resp.}
begin
  if BusyFlag then
    Screen.Cursor := crHourglass
  else
    Screen.Cursor := crDefault;
end;

procedure TForm1.OvcReportView1GetPrintHeaderFooter(Sender: TObject;
  IsHeader: Boolean; Line: Integer; var LeftString, CenterString,
  RightString: string; var LeftAttr, CenterAttr, RightAttr: TFontStyles);
{- print header/footer event handler}
const
  AscDescStr : array[Boolean] of string = (' ascending by ', ' descending by ');
begin
  if IsHeader then begin
    if Line = 0 then begin
      CenterString := Statusbar1.Panels[0].Text;
      CenterAttr := [fsBold];
    end else
    if Line = 1 then begin
      with OvcReportView1 do
        CenterString := OvcReportView1.ActiveViewByTitle + ' ordered'
          + AscDescStr[SortDescending]
          + CurrentView.ViewField[SortColumn].Field.Caption;
    end;
  end else begin
    if Line = 1 then begin{leave first footer line blank}
      LeftString := 'Date printed: ' + DateToStr(Now);
      RightString := format('Page %d of %d',[OvcReportView1.PageNumber, OvcReportView1.PageCount]);
    end;
  end;
end;

procedure TForm1.OvcReportView1GetFieldValue(Sender: TObject;
  Data: Pointer; FieldIndex: Integer; var Value: Variant);
{- return field value as variant. used by the filtering logic and for calculated fields}
begin
  with PFileRec(Data).SearchRec do
    case FieldIndex of
    fiFileName :
      Value := Name;
    fiSize :
      if Attr and faDirectory <> 0 then
        Value := 0
      else
        Value := Size;
    fiDate :
      Value := FileDateToDateTime(Time);
    fiArchive :
      Value := Attr and faArchive <> 0;
    fiReadOnly :
      Value := Attr and faReadOnly <> 0;
    fiHidden :
      Value := Attr and faHidden <> 0;
    fiSystem :
      Value := Attr and faSysFile <> 0;
    fiType :
      if Attr and faDirectory <> 0 then
        Value := '<DIR>'
      else
        Value := PFileRec(Data).Ext;
    fiPath :
      Value := PFileRec(Data).Path;
    else
      raise Exception.Create('Invalid field index');
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  OvcReportView1.CurrentView.Filter := OvcHistoryComboBox1.Text;
end;

procedure TForm1.ComboBox1Enter(Sender: TObject);
begin
  Button2.Default := True;
end;

procedure TForm1.ComboBox1Exit(Sender: TObject);
begin
  Button2.Default := False;
end;

procedure TForm1.OvcReportView1ViewSelect(Sender: TObject);
{- update the filter edit control with the current filter expression}
begin
  if OvcReportView1.CurrentView <> nil then
    OvcHistoryComboBox1.Text := OvcReportView1.CurrentView.Filter;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Select directory', '\', Dir) then begin
    ClearFileList;
    if Dir[Length(Dir)] = '\' then
      Delete(Dir, length(Dir), 1);
    LoadFileList(Dir, False);
  end;
end;

procedure TForm1.OvcReportView1Enumerate(Sender: TObject; Data: Pointer;
  var Stop: Boolean; UserData: Pointer);
{- free memory used to hold file data}
begin
  Dispose(PFileRec(Data));
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ViewDirectoryIncludeSubdirectories1Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Select directory', '\', Dir) then begin
    ClearFileList;
    if Dir[Length(Dir)] = '\' then
      Delete(Dir, length(Dir), 1);
    LoadFileList(Dir, True);
  end;
end;

procedure TForm1.mnGridNoneClick(Sender: TObject);
begin
  OvcReportView1.GridLines := glNone;
  mnGridNone.Checked := True;
end;

procedure TForm1.mnGridHorzClick(Sender: TObject);
begin
  OvcReportView1.GridLines := glHorizontal;
  mnGridHorz.Checked := True;
end;

procedure TForm1.mnGridVertClick(Sender: TObject);
begin
  OvcReportView1.GridLines := glVertical;
  mnGridVert.Checked := True;
end;

procedure TForm1.mnGridBothClick(Sender: TObject);
begin
  OvcReportView1.GridLines := glBoth;
  mnGridBoth.Checked := True;
end;

procedure TForm1.mnHStyleNormClick(Sender: TObject);
begin
  OvcReportView1.Options.HeaderDrawingStyle := bhsDefault;
  OvcReportView1.Options.FooterDrawingStyle := bhsDefault;
  mnHStyleNorm.Checked := True;
end;

procedure TForm1.mnHStyleEtchedClick(Sender: TObject);
begin
  OvcReportView1.Options.HeaderDrawingStyle := bhsEtched;
  OvcReportView1.Options.FooterDrawingStyle := bhsEtched;
  mnHStyleEtched.Checked := True;
end;

procedure TForm1.mnHStyleFlatClick(Sender: TObject);
begin
  OvcReportView1.Options.HeaderDrawingStyle := bhsFlat;
  OvcReportView1.Options.FooterDrawingStyle := bhsFlat;
  mnHStyleFlat.Checked := True;
end;

procedure TForm1.mnHStyleThinClick(Sender: TObject);
begin
  OvcReportView1.Options.HeaderDrawingStyle := bhsThin;
  OvcReportView1.Options.FooterDrawingStyle := bhsThin;
  mnHStyleThin.Checked := True;
end;

procedure TForm1.NewLayout1Click(Sender: TObject);
begin
  OvcReportView1.EditNewView('New View');
end;

procedure TForm1.EditCurrentLayout1Click(Sender: TObject);
begin
  OvcReportView1.EditCurrentView;
end;

procedure TForm1.CopyEditCurrentLayout1Click(Sender: TObject);
begin
  OvcReportView1.EditCopyOfCurrentView;
end;

procedure TForm1.DeleteCurrentLayout1Click(Sender: TObject);
begin
  if OvcReportView1.CurrentView = nil then
    raise Exception.Create('No view is currently selected');
  if MessageDlg('Delete current view. Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYES then
    OvcReportView1.CurrentView.Free;
end;

procedure TForm1.OvcReportView1DrawViewFieldEx(Sender: TObject;
  Canvas: TCanvas; Field: TOvcRvField; ViewField: TOvcRvViewField;
  var TextAlign: Integer; IsSelected, IsGroupLine: Boolean; Data: Pointer;
  Rect: TRect; const Text, TruncText: String; var DefaultDrawing: Boolean);
var
  DrawCheck: Boolean;
begin
  DrawCheck := False;
  with PFileRec(Data).SearchRec do
    case Field.Index of
    fiArchive :
      DrawCheck := Attr and faArchive <> 0;
    fiReadOnly :
      DrawCheck := Attr and faReadOnly <> 0;
    fiHidden :
      DrawCheck := Attr and faHidden <> 0;
    fiSystem :
      DrawCheck := Attr and faSysFile <> 0;
    end;
  if DrawCheck then begin
    if not OvcReportView1.Printing then
      ImageList1.Draw(Canvas, Rect.Left, Rect.Top, iiCheck)
    else
      OvcReportView1.StretchDrawImageListImage(Canvas, ImageList1, Rect, iiCheck, True);
    DefaultDrawing := False;
  end;
end;

procedure TForm1.EditCalculatedFields1Click(Sender: TObject);
begin
  OvcReportView1.EditCalculatedFields;
end;

procedure TForm1.Print1Click(Sender: TObject);
begin
  OvcRvPrintDialog1.Execute;
  Statusbar1.Panels[1].Text := '';
end;

procedure TForm1.mnListBorderClick(Sender: TObject);
begin
  if OvcReportView1.Options.ListBorderStyle = bsNone then
    OvcReportView1.Options.ListBorderStyle := bsSingle
  else
    OvcReportView1.Options.ListBorderStyle := bsNone;
  mnListBorder.Checked := OvcReportView1.Options.ListBorderStyle = bsSingle;
end;

procedure TForm1.SetListColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := OvcReportView1.Options.ListColor;
  if ColorDialog1.Execute then
    OvcReportView1.Options.ListColor := ColorDialog1.Color;
end;

procedure TForm1.SetGroupColor1Click(Sender: TObject);
begin
  ColorDialog1.Color := OvcReportView1.GroupColor;
  if ColorDialog1.Execute then
    OvcReportView1.GroupColor := ColorDialog1.Color;
end;

procedure TForm1.SelectFont1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(OvcReportView1.Font);
  if FontDialog1.Execute then
    OvcReportView1.Font.Assign(FontDialog1.Font);
end;

procedure TForm1.SetScrollBars;
const
  SBHV : array[Boolean, Boolean] of TScrollStyle = ((ssNone, ssVertical), (ssHorizontal, ssBoth));
begin
  OvcReportView1.ScrollBars := SBHV[mnScrollHorz.Checked, mnScrollVert.Checked];
end;

procedure TForm1.mnScrollHorzClick(Sender: TObject);
begin
  mnScrollHorz.Checked := not mnScrollHorz.Checked;
  SetScrollBars;
end;

procedure TForm1.mnScrollVertClick(Sender: TObject);
begin
  mnScrollVert.Checked := not mnScrollVert.Checked;
  SetScrollBars;
end;

procedure TForm1.mnAllowDragClick(Sender: TObject);
begin
  mnAllowDrag.Checked := not mnAllowDrag.Checked;
  OvcReportView1.Options.HeaderAllowDragRearrange := mnAllowDrag.Checked;
end;

procedure TForm1.mnMultiSelectClick(Sender: TObject);
begin
  mnMultiSelect.Checked := not mnMultiSelect.Checked;
  OvcReportView1.MultiSelect := mnMultiSelect.Checked;
end;

procedure TForm1.OvcReportView1PrintStatus(Sender: TObject; Page: Integer;
  var Abort: Boolean);
begin
  Statusbar1.Panels[1].Text := 'Printing page ' + IntToStr(Page);
end;

procedure TForm1.PrintOptions1Click(Sender: TObject);
begin
  with TOvcRvPOptions.Create(Application) do
    try
      LoadValues(OvcReportView1);
      if ShowModal = mrOK then
        SaveValues(OvcReportView1);
    finally
      Free;
    end;
end;

procedure TForm1.OvcReportView1GetFieldAsString(Sender: TObject;
  Data: Pointer; FieldIndex: Integer; var Str: String);
begin
  with PFileRec(Data)^ do
    case FieldIndex of
    fiFileName :
      Str := SearchRec.Name;
    fiSize :
      if SearchRec.Attr and faDirectory <> 0 then
        Str := '-'
      else
        Str := TIntToStr(SearchRec.Size);
    fiDate :
      Str := DateTimeToStr(FileDateToDateTime(SearchRec.Time));
    fiArchive :
      if SearchRec.Attr and faArchive <> 0 then
        Str := 'A'
      else
        Str := ' ';
    fiReadOnly :
      if SearchRec.Attr and faReadOnly <> 0 then
        Str := 'R'
      else
        Str := ' ';
    fiHidden :
      if SearchRec.Attr and faHidden <> 0 then
        Str := 'H'
      else
        Str := ' ';
    fiSystem :
      if SearchRec.Attr and faSysFile <> 0 then
        Str := 'S'
      else
        Str := ' ';
    fiType : if SearchRec.Attr and faDirectory <> 0 then
          Str := '<DIR>'
        else
          Str := Ext;
    fiPath :
      Str := Path;
    else
      raise Exception.Create('Invalid field index');
    end;
end;

procedure TForm1.OvcReportView1GetFieldAsFloat(Sender: TObject;
  Data: Pointer; FieldIndex: Integer; var Value: Double);
begin
  if FieldIndex = fiSize then
    Value := PFileRec(Data)^.SearchRec.Size
  else
    Value := 0;
end;

procedure TForm1.OvcReportView1KeySearch(Sender: TObject;
  SortColumn: Integer; const KeyString: String);
var
  KeySearchRec : TSearchRec;
begin
  if SortColumn = 0 then begin
    fillchar(KeySearchRec,sizeof(KeySearchRec),0);
    KeySearchRec.Name := KeyString;
    OvcReportView1.GotoNearest(@KeySearchRec);
  end;
end;

procedure TForm1.PrinterSettings1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  mnShowItemInfo.Enabled := OvcReportView1.CurrentItem <> nil;
  mnShowGroupInfo.Enabled := OvcReportView1.CurrentGroup <> nil;
end;

procedure TForm1.mnShowItemInfoClick(Sender: TObject);
begin
  with PFileRec(OvcReportView1.CurrentItem)^ do
    ShowMessage(
      format('Name:%s Size:%d Extension:%s Path:%s',
        [SearchRec.Name,
         SearchRec.Size,
         Ext,
         Path])
      );
end;

procedure TForm1.mnShowGroupInfoClick(Sender: TObject);
var
  GroupedFields: set of byte;
  i: Integer;
  Data: Pointer;
  S: string;
begin
  {determine what fields we are grouped on}
  GroupedFields := [];
  for i := 0 to OvcReportView1.CurrentView.ViewFields.Count - 1 do
    if OvcReportView1.CurrentView.ViewField[i].GroupBy then
      Include(GroupedFields, OvcReportView1.CurrentView.ViewField[i].Field.Index)
    else
      break;
  {get a data instance from our group}
  Data := OvcReportView1.GetGroupElement(OvcReportView1.CurrentGroup);
  {build a string representing the grouped fields}
  with PFileRec(Data)^ do begin
    if fiFileName in GroupedFields then
      S := 'Name:' + SearchRec.Name
    else
      S := '';
    if fiSize in GroupedFields then
      S := S + ' Size:' + IntToStr(SearchRec.Size);
    if fiDate in GroupedFields then
      S := S + ' date/time:' + DateTimeToStr(FileDateToDateTime(SearchRec.Time));
    if fiPath in GroupedFields then
      S := S + ' path:' + Path;
    if fiType in GroupedFields then
      S := S + ' type:' + Ext;
  end;
  ShowMessage(S);
end;

procedure TForm1.OvcReportView1GetGroupString(Sender: TObject;
  FieldIndex: Integer; GroupRef: TOvcRvIndexGroup; var Str: String);
begin
  if FieldIndex = fiSize then
    Str := TIntToStr(Round(OvcReportView1.Total(GroupRef, FieldIndex)))
  else
    Str := '';
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

procedure TForm1.OvcReportView1Extern(Sender: TOvcAbstractReportView;
  const ArgList: Variant; var Result: Variant);
var
  ArgCount: Integer;
  FuncName: string;
begin
  {some sanity checks:}
  if not VarIsArray(ArgList) then
    raise Exception.Create('Variant array expected in Extern handler');
  if not VarArrayDimCount(ArgList) = 1 then
    raise Exception.Create('One-dimensional variant array expected');
  if not VarArrayLowBound(ArgList, 1) = 0 then
    raise Exception.Create('A variant array with a low bound of zero was expected');
  ArgCount := VarArrayHighBound(ArgList, 1) + 1;
  if ArgCount = 0 then
    raise EXception.Create('Non-empty variant array expected');

  {By convention, in this example, the function requested is the first argument}
  {We currently support two functions here;
    ProperCase, which takes one text argument and returns it with proper caps (simplified), and
    PI, which takes no arguments and simply returns the well-known constant.}

  FuncName := UpperCase(ArgList[0]);

  if FuncName = 'PROPERCASE' then begin
    if ArgCount > 2 then
      raise Exception.Create('Too many arguments for ProperCase');
    if ArgCount = 1 then
      Result := 'Dummy'
    else
      Result := ProperCase(ArgList[1])
  end else

  if FuncName = 'PI' then begin
    Result := PI;
    
  end else
    raise Exception.Create('Unsupported Extern function referenced:' + FuncName);
end;

end.
