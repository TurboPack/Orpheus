program Table16Proj;

uses
  Forms,
  Table16Unit in 'Table16Unit.pas' {Form11};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.

