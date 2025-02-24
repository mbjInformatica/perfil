unit SenhadoGerente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformSenhaGerente = class(TForm)
    edtSenhaCliente: TEdit;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSenhaGerente: TformSenhaGerente;
  // AcessStatus,NA: Integer;
implementation
 uses AlteraValor ;
{$R *.dfm}

procedure TformSenhaGerente.btnOKClick(Sender: TObject);
begin
   if edtSenhaCliente.Text = '2929' Then
                begin
                        AcessStatus:=1;
                        //dmBaseDados.tblLogMensal.Append;
                       // dmBaseDados.tblLogMensalDescricao.AsString := formconsulta.dbecodcli.text;
                       // dmBaseDados.tblLogMensal.Post;

                end
        else
                begin
                        Application.MessageBox('Senha Incorreta,Redigite',
                        'Senhas',MB_OK);
                        AcessStatus:=0;
                        edtSenhaCliente.SetFocus;
                end;

end;

procedure TformSenhaGerente.btnCancelaClick(Sender: TObject);
begin
NA := 3;
end;

procedure TformSenhaGerente.FormShow(Sender: TObject);
begin
edtSenhaCliente.Text := '';
end;

end.
