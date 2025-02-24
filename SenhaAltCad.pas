unit SenhaAltCad;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TIGradientCaption, StdCtrls, TISButton, TIGradient;

type
  TformSenhaAltCad = class(TForm)
    TIGradient1: TTIGradient;
    btnOK: TTISButton;
    TISButton1: TTISButton;
    edtSenha: TEdit;
    TIGradientCaption2: TTIGradientCaption;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formSenhaAltCad: TformSenhaAltCad;
    Cont : Integer;

implementation

uses Produtos;


{$R *.dfm}


procedure TformSenhaAltCad.FormShow(Sender: TObject);
begin
Cont       := 0;
stsAltProd := 0;
edtSenha.Clear;
edtSenha.SetFocus;
end;

procedure TformSenhaAltCad.btnOKClick(Sender: TObject);
begin
if (edtSenha.Text = '251010') then
  Begin
   stsAltProd := 1;
   Close;
  End
else
  Begin
   if (Cont = 3) then
    begin
     stsAltProd := 0;
     Close;
    end;
   Cont := Cont + 1;
   Application.MessageBox('Senha Incorreta, Redigite','Atenção!',MB_ICONERROR);
   edtSenha.Clear;
   edtSenha.SetFocus;
  End;
end;

procedure TformSenhaAltCad.TISButton1Click(Sender: TObject);
begin
stsAltProd := 0;
Close;
end;

end.
