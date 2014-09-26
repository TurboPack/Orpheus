{$J+} {Writable constants}

{$I OVC.INC}

unit ExOutl2U;

interface

uses
  Windows,  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  OvcBase, OvcVLB, OvcOutln,
  {$IFDEF Version4} ImgList, {$ENDIF}
  StdCtrls;

type
  TForm1 = class(TForm)
    OvcOutline1: TOvcOutline;
    OvcController1: TOvcController;
    ImageList1: TImageList;
    ImageList2: TImageList;
    procedure OvcOutline1NodeClick(Sender: TOvcCustomOutline;
      Node: TOvcOutlineNode);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OvcOutline1DrawCheck(Sender: TOvcCustomOutline;
      Canvas: TCanvas; Node: TOvcOutlineNode; Rect: TRect;
      Style: TOvcOlNodeStyle; Checked: Boolean;
      var DefaultDrawing: Boolean);
    public
      OwnerDrawChecks : Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.OvcOutline1NodeClick(Sender: TOvcCustomOutline;
  Node: TOvcOutlineNode);
begin
  case LongInt(Node.Data) of
  0 :
    OvcOutline1.BorderStyle := bsNone;
  1 :
    OvcOutline1.BorderStyle := bsSingle;
  2 :
    OvcOutline1.Ctl3D := Node.Checked;
  3 :
    OvcOutline1.ShowButtons := Node.Checked;
  4 :
    OvcOutline1.ShowLines := Node.Checked;
  5 :
    OvcOutline1.ShowImages := Node.Checked;
  6 :
    begin
      OwnerDrawChecks := not OwnerDrawChecks;
      OvcOutline1.Invalidate;
    end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  RootNode, OptionNode : TOvcOutlineNode;
begin
  RootNode := OvcOutline1.Nodes.Add('OUTLINE PROPERTIES');
  RootNode.ImageIndex := 0;

  OptionNode := OvcOutline1.Nodes.AddChild(RootNode, 'Border style');
  OptionNode.ImageIndex := 1;

  OvcOutline1.Nodes.AddButtonChildObject(OptionNode, 'None', Pointer(LongInt(0)), osRadio, False);
  OvcOutline1.Nodes.AddButtonChildObject(OptionNode, 'Single', Pointer(LongInt(1)), osRadio, True);
  OvcOutline1.Nodes.AddButtonChildObject(RootNode, 'Ctl3D', Pointer(LongInt(2)), osCheck, True);
  OvcOutline1.Nodes.AddButtonChildObject(RootNode, 'Show Buttons', Pointer(LongInt(3)), osCheck, True);
  OvcOutline1.Nodes.AddButtonChildObject(RootNode, 'Show Lines', Pointer(LongInt(4)), osCheck, True);
  OvcOutline1.Nodes.AddButtonChildObject(RootNode, 'Show Images', Pointer(LongInt(5)), osCheck, True);
  OvcOutline1.Nodes.AddButtonChildObject(RootNode, 'Owner-draw checks', Pointer(LongInt(6)), osCheck, False);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ImageList1.ResourceLoad(rtBitmap, 'GLYPHS', clWhite);
  ImageList2.ResourceLoad(rtbitmap, 'CHECKS', clWhite);
end;

procedure TForm1.OvcOutline1DrawCheck(Sender: TOvcCustomOutline;
  Canvas: TCanvas; Node: TOvcOutlineNode; Rect: TRect;
  Style: TOvcOlNodeStyle; Checked: Boolean; var DefaultDrawing: Boolean);
begin
  if OwnerDrawChecks then begin
    DefaultDrawing := False;
    case Style of
    osRadio :
      begin
        if Checked then
          ImageList2.Draw(Canvas, Rect.Left, 0, 0)
        else
          ImageList2.Draw(Canvas, Rect.Left, 0, 1);
      end;
    osCheck :
      begin
        if Checked then
          ImageList2.Draw(Canvas, Rect.Left, 0, 2)
        else
          ImageList2.Draw(Canvas, Rect.Left, 0, 3);
      end;
    end;
  end;
end;

end.
