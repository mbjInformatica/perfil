unit FitroProdDesc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TIGradient;

type
  TformFiltroProdDesc = class(TForm)
    TIGradient1: TTIGradient;
    edtDescricao: TEdit;
    Label1: TLabel;
    bbtConfirmar: TBitBtn;
    bbtCancelar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtConfirmarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFiltroProdDesc: TformFiltroProdDesc;

implementation

uses ModuloDados, RelProdutos, RelProdutosFuturo, RelEstoque,
  RelEstoqueFuturo, RelFiltroProduto;

{$R *.dfm}

procedure TformFiltroProdDesc.FormShow(Sender: TObject);
begin
 //faz algo
end;

procedure TformFiltroProdDesc.bbtConfirmarClick(Sender: TObject);
begin
dmBaseDados.qryProdutos.Close;
dmBaseDados.qryProdutos.SQL.Text := 'SELECT * FROM Produtos WHERE (DescricaoAbreviada LIKE "%'+UpperCase(edtDescricao.Text)+'%") ORDER BY DescricaoAbreviada';
dmBaseDados.qryProdutos.Open;
formRelFiltroProduto.qrpEstoque.Preview;
end;

procedure TformFiltroProdDesc.bbtCancelarClick(Sender: TObject);
begin
Close;
end;

end.
