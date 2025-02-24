unit SenhaDesconto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TformSenhaDesconto = class(TForm)
    edtSenhaDesconto: TEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    Label1: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSenhaDesconto: TformSenhaDesconto;

implementation

uses Desconto;

{$R *.dfm}

procedure TformSenhaDesconto.btnOKClick(Sender: TObject);
begin
 if edtSenhaDesconto.Text = '2929' Then
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
                        edtSenhaDesconto.SetFocus;
                end;

end;

procedure TformSenhaDesconto.FormShow(Sender: TObject);
begin
edtSenhaDesconto.Text := '';
end;

procedure TformSenhaDesconto.btnCancelaClick(Sender: TObject);
begin
NA := 3;
FormDesconto.ShowModal;
end;

end.
