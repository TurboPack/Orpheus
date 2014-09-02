{$J+} {Writable constants}

{$I OVC.INC}

unit ExLkOutU;

interface
uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  {$IFNDEF Win32} OvcImLst, {$ENDIF}
  {$IFDEF Version4} ImgList, {$ENDIF}
  OvcSF, OvcFiler, OvcStore, Menus, OvcBase, StdCtrls, ExtCtrls,
  O32LkOut, ovcclock;

type
  TForm1 = class(TForm)
    OrController1: TOvcController;
    DetailPanel: TPanel;
    Label1: TLabel;
    TitlePanel: TPanel;
    imgTitle: TPaintBox;
    lblTitle: TLabel;
    PopupMenu1: TPopupMenu;
    miLargeIcons: TMenuItem;
    miSmallIcons: TMenuItem;
    miRenameFolder: TMenuItem;
    miRenameItem: TMenuItem;
    ListBox1: TListBox;
    miAddFolder: TMenuItem;
    miAddItem: TMenuItem;
    ImageList1: TImageList;
    OvcIniFileStore1: TOvcIniFileStore;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LOB: TO32LookoutBar;
    OvcClock1: TOvcClock;
    Button4: TButton;
    Label2: TLabel;
    procedure miLargeIconsClick(Sender: TObject);
    procedure miSmallIconsClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure miRenameFolderClick(Sender: TObject);
    procedure miRenameItemClick(Sender: TObject);
    procedure miAddItemClick(Sender: TObject);
    procedure miAddFolderClick(Sender: TObject);
    procedure LOBDragDrop(Sender, Source: TObject; X, Y, FolderIndex,
      ItemIndex: Integer);
    procedure LOBDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var AcceptFolder, AcceptItem: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LOBItemClick(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; Index: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.LOBItemClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; Index: Integer);
var
  I : Integer;
begin
  if (LOB.ActiveFolder > -1) and (LOB.ActiveItem > -1) then begin
    lblTitle.Caption := LOB.Folders[LOB.ActiveFolder].Items[LOB.ActiveItem].Caption;
    I := LOB.Folders[LOB.ActiveFolder].Items[LOB.ActiveItem].IconIndex;
    imgTitle.Repaint;
    ImageList1.Draw(imgTitle.Canvas, 0, 0, I);
  end;
end;

procedure TForm1.miLargeIconsClick(Sender: TObject);
begin
  LOB.Folders[LOB.ActiveFolder].IconSize := isLarge;
end;

procedure TForm1.miSmallIconsClick(Sender: TObject);
begin
  LOB.Folders[LOB.ActiveFolder].IconSize := isSmall;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  miLargeIcons.Checked := (LOB.Folders[LOB.ActiveFolder].IconSize = isLarge);
  miSmallIcons.Checked := (LOB.Folders[LOB.ActiveFolder].IconSize = isSmall);
  miRenameFolder.Enabled := LOB.PreviousFolder > -1;
  miRenameItem.Enabled := LOB.PreviousItem > -1;
end;

procedure TForm1.miRenameFolderClick(Sender: TObject);
begin
  if LOB.PreviousFolder > -1 then
    LOB.RenameFolder(LOB.PreviousFolder);
end;

procedure TForm1.miRenameItemClick(Sender: TObject);
begin
  if (LOB.ActiveFolder > -1) then
    LOB.RenameItem(LOB.ActiveFolder, LOB.PreviousItem);
end;

procedure TForm1.miAddItemClick(Sender: TObject);
var
  I : Integer;
begin
  I := LOB.ActiveItem;
  if I = -1 then
    I := 0;
  LOB.InsertItem('New Item',
    LOB.ActiveFolder, I, ImageList1.Count - 1);
end;

procedure TForm1.miAddFolderClick(Sender: TObject);
begin
  LOB.InsertFolder('New Folder', LOB.FolderCount);
end;

procedure TForm1.LOBDragDrop(Sender, Source: TObject; X, Y, FolderIndex,
  ItemIndex: Integer);
var
  I : Integer;
begin
  if Source = ListBox1 then begin
    I := LOB.GetItemAt(X, Y);
    while (I = -1) and (Y < LOB.Height) do begin
      Inc(Y, 8);
      I := LOB.GetItemAt(X, Y);
    end;
    if I = -1 then
      I := 0;
    LOB.InsertItem(ListBox1.Items[ListBox1.ItemIndex],
      LOB.ActiveFolder, I, ImageList1.Count - 1);
  end;
end;

procedure TForm1.LOBDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var AcceptFolder, AcceptItem: Boolean);
begin
  AcceptItem := Source = ListBox1;
  AcceptFolder := Source = ListBox1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Imagelist1.ResourceLoad(rtBitmap, 'GLYPHS', clOlive);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  LOB.SaveState('');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  LOB.RestoreState('');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  LOB.FolderCollection.Clear;
  LOB.Invalidate;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  if (Button4.Caption = 'Digital') then begin
    Button4.Caption := 'Analog';
    OvcClock1.DisplayMode := dmDigital;
  end
  else begin
    Button4.Caption := 'Digital';
    OvcClock1.DisplayMode := dmAnalog;
  end;
end;

end.
