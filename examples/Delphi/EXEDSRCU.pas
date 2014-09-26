{$J+} {Writable constants}

unit ExEdSrcU;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, OvcEf, OvcSf, OvcBase, OvcEdit, OvcData,
  Buttons, OvcEditU;

type
  TfrmSearch = class(TForm)
    ED1: TOvcTextFileEditor;
    DefaultController: TOvcController;
    SF1: TOvcSimpleField;
    btnSearch: TButton;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.DFM}

procedure TfrmSearch.FormCreate(Sender: TObject);
begin
  Ed1.Filename := extractfilepath(application.exename)+'EXEDSRCU.pas';
  ED1.IsOpen := True;
end;

procedure TfrmSearch.btnSearchClick(Sender: TObject);
var
  S : string;
begin
  S := SF1.AsString;

  (**************************************************
   the second parameter can be any combination of the
   the following set elements or none (an empty set)
   ****************************************************
   soFind       {perform a find ([] implies soFind)
   soBackward   {search backwards
   soMatchCase  {don't ignore case when searching
   soGlobal     {search globally
   soWholeWord  {match on whole word only (editor only)
   soSelText    {search in selected text  (editor only)
   ****************************************************)

  if not ED1.Search(S, [soFind]) then
    MessageBeep(0);
end;

procedure TfrmSearch.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.                                  
