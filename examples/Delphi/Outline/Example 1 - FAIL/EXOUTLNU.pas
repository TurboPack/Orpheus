{$J+} {Writable constants}

{$I OVC.INC}
unit ExOutlnU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, OvcBase, OvcOutln, StdCtrls, OvcVLB, OvcSplit, OvcRVIdx,
  OvcRptVw, OvcDRpVw, OvcCmbx, OvcRvCbx, ExtCtrls,
  ShellAPI, Menus, ImgList;

type
  TForm1 = class(TForm)
    OvcController1: TOvcController;
    OvcSplitter1: TOvcSplitter;
    OvcOutline1: TOvcOutline;
    OvcDataReportView1: TOvcDataReportView;
    Panel1: TPanel;
    OvcViewComboBox1: TOvcViewComboBox;
    ImageList1: TImageList;
    Label1: TLabel;
    chkArchive: TCheckBox;
    chkSystem: TCheckBox;
    chkHidden: TCheckBox;
    chkReadOnly: TCheckBox;
    procedure OvcOutline1DynamicLoad(Sender: TOvcCustomOutline;
      Node: TOvcOutlineNode);
    procedure FormShow(Sender: TObject);
    procedure OvcOutline1NodeDestroy(Sender: TOvcCustomOutline;
      Node: TOvcOutlineNode);
    procedure OvcOutline1Click(Sender: TObject);
    procedure OvcDataReportView1DblClick(Sender: TObject);
    procedure OvcOutline1ActiveChange(Sender: TOvcCustomOutline; OldNode,
      NewNode: TOvcOutlineNode);
    procedure FormCreate(Sender: TObject);
    procedure chkArchiveClick(Sender: TObject);
    procedure OvcDataReportView1ViewSelect(Sender: TObject);
  private
    procedure UpdateFilter;
  public
    procedure AddDirectories(TreeRoot : TOvcOutlineNode; DirPath : string);
    procedure AddFiles(DirPath : string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.AddDirectories(TreeRoot : TOvcOutlineNode; DirPath : string);
var
  SearchRec : TSearchRec;
  Path : string;
  Data: PString;
begin
  OvcOutline1.BeginUpdate;
  try
    if FindFirst(DirPath+'\*.*',faDirectory,SearchRec) = 0 then
      try
        repeat
          if (SearchRec.Attr and faDirectory <> 0)
          and (SearchRec.Name <> '.')
          and (SearchRec.Name <> '..') then
          begin
            Path := DirPath+'\'+SearchRec.Name;
            New(Data);
            Data^ := Path;
            OvcOutline1.Nodes.AddChildObjectEx(TreeRoot, SearchRec.Name, Data {NewStr(Path)}, 0, omDynamicLoad);
          end;
        until FindNext(SearchRec) <> 0;
      finally
        FindClose(SearchRec);
      end;
  finally
    OvcOutline1.EndUpdate;
  end;
end;

procedure TForm1.OvcOutline1DynamicLoad(Sender: TOvcCustomOutline;
  Node: TOvcOutlineNode);
var
  OldCursor : TCursor;
begin
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
    if Node.Data <> nil then
      AddDirectories(Node, PString(Node.Data)^);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  c : char;
  Root : array[0..4] of char;
  Data: PString;
begin
  for c := 'A' to 'Z' do begin
    StrCopy(Root, '%:\');
    Root[0] := c;
    case GetDriveType(Root) of
      DRIVE_REMOVABLE,
      DRIVE_FIXED,
      DRIVE_REMOTE,
      DRIVE_CDROM,
      DRIVE_RAMDISK :
        begin
          Root[2] := #0;
          New(Data);
          Data^ := Root;
          OvcOutline1.Nodes.AddObjectEx(Root, Data {NewStr(Root)}, 2, omDynamicLoad);
        end;
    end;
  end;
end;

procedure TForm1.OvcOutline1NodeDestroy(Sender: TOvcCustomOutline;
  Node: TOvcOutlineNode);
begin
  Dispose(PString(Node.Data)); //DisposeStr(Node.Data);
end;

function TypeString(FileName : string) : string;
begin
  Result := UpperCase(ExtractFileExt(FileName));
  if Result <> '' then
    Delete(Result, 1, 1);
end;

function AttrString(Attr : Integer) : string;
begin
  Result := '';
  if Attr and faArchive <> 0 then
    Result := Result + 'A';
  if Attr and faReadOnly <> 0 then
    Result := Result + 'R';
  if Attr and faHidden <> 0 then
    Result := Result + 'H';
  if Attr and faSysFile <> 0 then
    Result := Result + 'S';
end;

procedure TForm1.AddFiles(DirPath : string);
var
  SearchRec : TSearchRec;
begin
  OvcDataReportView1.BeginUpdate;
  try
    if FindFirst(DirPath+'\*.*',faAnyFile,SearchRec) = 0 then
      try
        repeat
          if (SearchRec.Attr and faDirectory = 0) then begin
            with OvcDataReportView1.Items.Add do begin
              AsString[0] := SearchRec.Name;
              AsFloat[1] := SearchRec.Size;
              AsString[2] := TypeString(SearchRec.Name);
              AsDateTime[3] := FileDateToDateTime(SearchRec.Time);
              AsString[4] := AttrString(SearchRec.Attr);
              AsString[5] := DirPath;
            end;
          end;
        until FindNext(SearchRec) <> 0;
      finally
        FindClose(SearchRec);
      end;
  finally
    OvcDataReportView1.EndUpdate;
  end;
end;

procedure TForm1.OvcOutline1Click(Sender: TObject);
begin
  Screen.Cursor := crHourglass;
  try
    OvcDataReportView1.Items.Clear;
    with OvcOutline1 do
      if ItemIndex <> -1 then
        with Node[ItemIndex] do
          AddFiles(PString(Data)^);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm1.OvcDataReportView1DblClick(Sender: TObject);
var
  CommandLine, Path : array[0..255] of char;
begin
  if OvcDataReportView1.CurrentItem <> nil then begin
    StrPCopy(CommandLine, OvcDataReportView1.CurrentItem.AsString[5] + '\' + OvcDataReportView1.CurrentItem.AsString[0]);
    StrPCopy(Path, OvcDataReportView1.CurrentItem.AsString[5]);
    ShellExecute(Handle, nil, CommandLine, nil, Path, SW_SHOWNORMAL);
  end;
end;

procedure TForm1.OvcOutline1ActiveChange(Sender: TOvcCustomOutline;
  OldNode, NewNode: TOvcOutlineNode);
begin
  if (OldNode <> nil) and (OldNode.ImageIndex = 1) then
    OldNode.ImageIndex := 0;
  if (NewNode <> nil) and (NewNode.ImageIndex = 0) then
    NewNode.ImageIndex := 1;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ImageList1.ResourceLoad(rtBitmap, 'GLYPHS', clOlive);
end;

procedure TForm1.UpdateFilter;
var
  F: string;
begin
  if OvcDataReportView1.CurrentView = nil then
    exit;
  if chkArchive.Checked then
    F := '(Position(''A'', FileAttr) <> 0)'
  else
    F := '';
  if chkSystem.Checked then begin
    if F <> '' then
      F := F + ' OR ';
    F := F + '(Position(''S'', FileAttr) <> 0)';
  end;
  if chkHidden.Checked then begin
    if F <> '' then
      F := F + ' OR ';
    F := F + '(Position(''H'', FileAttr) <> 0)';
  end;
  if chkReadOnly.Checked then begin
    if F <> '' then
      F := F + ' OR ';
    F := F + '(Position(''R'', FileAttr) <> 0)';
  end;
  if F = '' then
    F := 'False';
  OvcDataReportView1.CurrentView.Filter := F;
end;

procedure TForm1.chkArchiveClick(Sender: TObject);
begin
  UpdateFilter;
end;

procedure TForm1.OvcDataReportView1ViewSelect(Sender: TObject);
begin
  UpdateFilter;
end;

initialization
  ReportMemoryLeaksOnShutdown := true;
end.

