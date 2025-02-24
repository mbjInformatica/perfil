unit Necessidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TformNecessidades = class(TForm)
    lblMensagem1     : TLabel;
    lblMensagem2     : TLabel;
    bkOK             : TBitBtn;
    btnCancela       : TBitBtn;
    pgrProcessamento : TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure bkOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNecessidades: TformNecessidades;

implementation

uses ModuloDados, TipoRelNecessita, EntraCompras, DB;

{$R *.DFM}

procedure TformNecessidades.FormShow(Sender: TObject);
begin
   pgrProcessamento.Position := 0;
end;

procedure TformNecessidades.bkOKClick(Sender: TObject);
var
   //intCompra: integer;
   intCompra: double;
begin
   dmBaseDados.tblNecessidade.EmptyTable;
   dmBaseDados.tblNecessidade.Open;
   dmBaseDados.tblProdutos.Open;
   pgrProcessamento.Max := dmBaseDados.tblProdutos.RecordCount;
   while (not dmBaseDados.tblProdutos.Eof) do
   begin
      intCompra := 0;
      if (dmBaseDados.tblProdutosEstoqueAtual.AsFloat < dmBaseDados.
      tblProdutosEstoqueMinimo.AsFloat) then
         intCompra := dmBaseDados.tblProdutosEstoqueMaximo.AsFloat - dmBaseDados.tblProdutosEstoqueAtual.AsFloat;
      {   else if ((dmBaseDados.tblProdutosEstoqueAtual.AsInteger <
      dmBaseDados.tblProdutosEstoqueReposicao.AsInteger) and
      (dmBasedados.tblProdutosEstoqueAtual.AsInteger > dmBaseDados.tblProdutosEstoqueMinimo.AsInteger)) then
         intCompra := dmBaseDados.tblProdutosEstoqueMinimo.AsInteger;}
      if (intCompra <> 0) then
      begin
         dmBaseDados.tblNecessidade.Append;
         dmBaseDados.tblNecessidadeCodigoProduto.AsString := dmBaseDados
         .tblProdutosCodigoFamilia.AsString+dmBaseDados.tblProdutosCodigoCategoria.AsString+
         dmBaseDados.tblProdutosCodigoProduto.AsString;
            dmBaseDados.tblNecessidadeDescricaoAbreviada.AsString :=
         dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
            dmBaseDados.tblNecessidadeUnidadeMedida.AsString :=
         dmBaseDados.tblProdutosUnidadeMedida.AsString;
         dmBaseDados.tblNecessidadeReferenciaFabricante.AsString :=
            dmBaseDados.tblProdutosReferenciaFabricante.AsString;
         dmBaseDados.tblNecessidadeMinimo.AsString :=
            dmBaseDados.tblProdutosEstoqueMinimo.AsString;
         dmBaseDados.tblNecessidadeMaximo.AsString :=
            dmBaseDados.tblProdutosEstoqueMaximo.AsString;
         dmBaseDados.tblNecessidadeEstoque.AsString :=
            dmBaseDados.tblProdutosEstoqueAtual.AsString;
         dmBaseDados.tblNecessidadeReposicao.AsString :=
            dmBaseDados.tblProdutosEstoqueReposicao.AsString;
         dmBasedados.tblNecessidadeNecessidade.AsFloat := intCompra;
         dmBaseDados.tblNecessidadeValorUnitario.AsFloat :=
            dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
         dmBaseDados.tblNecessidade.Post;
      end;
      dmBaseDados.tblProdutos.Next;
      pgrProcessamento.Position := pgrProcessamento.Position + 1;
   end;
   dmBaseDados.tblNecessidade.Close;
   dmBaseDados.tblProdutos.Close;
   formTipoRelCompra.ShowModal;
end;
end.
