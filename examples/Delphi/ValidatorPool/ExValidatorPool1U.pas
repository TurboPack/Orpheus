unit ExValidatorPool1U;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ovcbase, o32vpool, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    PhoneEdit: TEdit;
    IntegerEdit: TEdit;
    ZipCodeEdit: TEdit;
    DateEdit: TEdit;
    AllCapsEdit: TEdit;
    TimeEdit: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    O32ValidatorPool1: TO32ValidatorPool;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    PhoneEdit2: TEdit;
    IntegerEdit2: TEdit;
    ZipCodeEdit2: TEdit;
    DateEdit2: TEdit;
    AllCapsEdit2: TEdit;
    TimeEdit2: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Label25: TLabel;
    Label26: TLabel;
    procedure DoOnChange(Sender: TObject);
    procedure TimeEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.DoOnChange(Sender: TObject);
begin
  { As we are accessing the ValidatorPoolItem's encapsulated validator        }
  { directly, we can handle error events more precisely.  Including setting   }
  { the error color directly, playing a wav file or sounding a default "ding" }
  { For instance, you will notice that the first 6 items set their error color}
  { to the color specified in the ValidatorPoolItem's ErrorColor property,    }
  { while the bottom six set their errorcolor to clYellow }

  with (Sender as TEdit) do begin
    if Name = 'PhoneEdit2' then
      with O32ValidatorPool1.Validators.Items[0].Validator do begin
        Mask :=  '!\(999\)000-0000;1;_';
        Input := Text;
        if not IsValid then begin
          MessageBeep(0);
          Color := clYellow;
        end else
          Color := clWhite;
      end

    else if Name = 'IntegerEdit2' then
      with O32ValidatorPool1.Validators.Items[1].Validator do begin
        Mask :=  'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii';
        Input := Text;
        if not IsValid then begin
          MessageBeep(0);
          Color := clYellow;
        end else
          Color := clWhite;
      end

    else if Name = 'ZipCodeEdit2' then
      with O32ValidatorPool1.Validators.Items[2].Validator do begin
        Mask :=  '!99999;1;_';
        Input := Text;
        if not IsValid then begin
          MessageBeep(0);
          Color := clYellow;
        end else
          Color := clWhite;
      end

    else if Name = 'DateEdit2' then
      with O32ValidatorPool1.Validators.Items[3].Validator do begin
        Mask :=  '!99/99/00;1;_';
        Input := Text;
        if not IsValid then begin
          MessageBeep(0);
          Color := clYellow;
        end else
          Color := clWhite;
      end

    else if Name = 'AllCapsEdit2' then
      with O32ValidatorPool1.Validators.Items[4].Validator do begin
        Mask :=  '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!';
        Input := Text;
        if not IsValid then begin
          MessageBeep(0);
          Color := clYellow;
        end else
          Color := clWhite;
      end;

  end;
end;

procedure TForm1.TimeEdit2Exit(Sender: TObject);
begin
  with O32ValidatorPool1.Validators.Items[5].Validator do begin
    Mask :=  '(1[012]|[1-9]):[0-5][0-9] (am|pm)';
    Input := TimeEdit2.Text;
    if not IsValid then begin
      MessageBeep(0);
      TimeEdit2.Color := clYellow;
      TimeEdit2.SetFocus;
    end else
      TimeEdit2.Color := clWhite;
  end;
end;

end.
