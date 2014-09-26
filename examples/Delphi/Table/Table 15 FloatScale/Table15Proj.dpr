program Table15Proj;

uses
  Forms,
  Table15Unit in 'Table15Unit.pas' {Form12};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.

