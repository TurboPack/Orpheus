{$J+} {Writable constants}

unit ExOdtU;

interface

{$IFDEF Win32}
  {$R CHECK.R32}
{$ELSE}
  {$R CHECK.R16}
{$ENDIF}

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcNbk, OvcBase;

type
  TfrmOwnerDrawTabs = class(TForm)
    Notebook: TOvcNotebook;
    NB01: TOvcNotebook;
    NB02: TOvcNotebook;
    NB03: TOvcNotebook;
    NB04: TOvcNotebook;
    NB05: TOvcNotebook;
    NB06: TOvcNotebook;
    NB07: TOvcNotebook;
    NB08: TOvcNotebook;
    NB09: TOvcNotebook;
    LB: TListBox;
    OvcController1: TOvcController;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NotebookDrawTab(Sender: TObject; Index: Integer;
      const Title: string; R: TRect; Enabled, Active: Boolean);
    procedure NotebookPageChanged(Sender: TObject; Index: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    Data  : TStringList;
    Glyph : TBitmap;
  end;

var
  frmOwnerDrawTabs: TfrmOwnerDrawTabs;

implementation

{$R *.DFM}

procedure TfrmOwnerDrawTabs.FormCreate(Sender: TObject);
var
  A  : Char;
  B  : Char;
begin
  {create and load the tab glyph}
  Glyph := TBitmap.Create;
  Glyph.Handle := LoadBitmap(HInstance, 'CHECK');

  {create dummy name list}
  Data := TStringList.Create;
  for A := 'A' to 'Z' do
    for B := 'A' to 'Z' do
      Data.Add(A + B +B);

  {force intial page refresh}
  NotebookPageChanged(Notebook, 0);
end;

procedure TfrmOwnerDrawTabs.FormDestroy(Sender: TObject);
begin
  Glyph.Free;
  Data.Free;
end;

procedure TfrmOwnerDrawTabs.NotebookDrawTab(Sender: TObject; Index: Integer;
  const Title: string; R: TRect; Enabled, Active: Boolean);
var
  C  : TCanvas;
  B  : array[0..255] of Char;
begin
  C := (Sender as TOvcNotebook).Canvas;

  {use the forms font}
  C.Font := Font;

  {draw the glyph for the active tab}
  if Active then begin
    C.BrushCopy(Bounds(R.Left+1, R.Top+1, Glyph.Width, Glyph.Height), Glyph,
            Bounds(0, 0, Glyph.Width, Glyph.Height), clOlive);
  end;

  {draw the tab text}
  StrPCopy(B, Title);
  DrawText(C.Handle, B, StrLen(B), R, DT_CENTER or DT_VCENTER or DT_SINGLELINE);
end;

procedure TfrmOwnerDrawTabs.NotebookPageChanged(Sender: TObject; Index: Integer);
var
  I   : Integer;
  Idx : Integer;
  NB  : TOvcNotebook;
  NBP : TOvcTabPage;
begin
  {disable listbox painting}
  SendMessage(LB.Handle, WM_SETREDRAW, 0, 0);

  try
    LB.Clear;

    NB := Sender as TOvcNotebook;
    Idx := Index;

    {if this was a main tab change, find the notebook on this page}
    if NB.Name = Notebook.Name then begin
      {get the notebook page object}
      NBP := NB.Pages[Index];
      {find the child notebook component on this page}
      for I := 0 to NBP.ControlCount-1 do
        if NBP.Controls[I] is TOvcNotebook then begin
          NB := NBP.Controls[0] as TOvcNotebook;
          Break;
        end;
      Idx := NB.PageIndex;
    end;

    for I := 0 to Data.Count-1 do
      if UpCase(Data[I][1]) = UpCase(NB.Pages[Idx].Caption[1]) then
        LB.Items.Add(Data[I]);

  finally
    {enable listbox painting}
    SendMessage(LB.Handle, WM_SETREDRAW, 1, 0);
  end;
end;

end.
