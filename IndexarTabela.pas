unit IndexarTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TformIndexar = class(TForm)
    Button1: TButton;
    lblindex: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIndexar: TformIndexar;

implementation
uses ModuloDados,MenuPrincipal,dbTables, DbiProcs;

{$R *.DFM}

procedure TformIndexar.Button1Click(Sender: TObject);
begin
//---------------------------------------------------------
dmBaseDados.tblCheques.Exclusive := True;
dmBaseDados.tblCheques.Open;
dbiRegenIndexes(dmBaseDados.tblCheques.Handle);
//---------------------------------------------------------
dmBaseDados.tblCategoria.Exclusive := True;
dmBaseDados.tblCategoria.Open;
dbiRegenIndexes(dmBaseDados.tblCategoria.Handle);
//---------------------------------------------------------
dmBaseDados.tblHistorico.Exclusive := True;
dmBaseDados.tblHistorico.Open;
dbiRegenIndexes(dmBaseDados.tblHistorico.Handle);
//---------------------------------------------------------
dmBaseDados.tblClientes.Exclusive := True;
dmBaseDados.tblClientes.Open;
dbiRegenIndexes(dmBaseDados.tblClientes.Handle);
//---------------------------------------------------------
dmBaseDados.tblContaCorrenteProduto.Exclusive := True;
dmBaseDados.tblContaCorrenteProduto.Open;
dbiRegenIndexes(dmBaseDados.tblContaCorrenteProduto.Handle);
//---------------------------------------------------------
dmBaseDados.tblContasPagar.Exclusive := True;
dmBaseDados.tblContasPagar.Open;
dbiRegenIndexes(dmBaseDados.tblContasPagar.Handle);
//---------------------------------------------------------
dmBaseDados.tblContasReceber.Exclusive := True;
dmBaseDados.tblContasReceber.Open;
dbiRegenIndexes(dmBaseDados.tblContasReceber.Handle);
//---------------------------------------------------------
dmBaseDados.tblEntrada.Exclusive := True;
dmBaseDados.tblEntrada.Open;
dbiRegenIndexes(dmBaseDados.tblEntrada.Handle);
//---------------------------------------------------------
dmBaseDados.tblMarcas.Exclusive := True;
dmBaseDados.tblMarcas.Open;
dbiRegenIndexes(dmBaseDados.tblMarcas.Handle);
//---------------------------------------------------------
dmBaseDados.tblNecessidade.Exclusive := True;
dmBaseDados.tblNecessidade.Open;
dbiRegenIndexes(dmBaseDados.tblNecessidade.Handle);
//---------------------------------------------------------
dmBaseDados.tblProdutos.Exclusive := True;
dmBaseDados.tblProdutos.Open;
dbiRegenIndexes(dmBaseDados.tblProdutos.Handle);
//---------------------------------------------------------
dmBaseDados.tblRequisicoes.Exclusive := True;
dmBaseDados.tblRequisicoes.Open;
dbiRegenIndexes(dmBaseDados.tblRequisicoes.Handle);
//--------------------------------------------------------- }

dmBaseDados.tblANotaFiscal.close;
dmBaseDados.tblCategoria.close;
dmBaseDados.tblCepcid.close;
dmBaseDados.tblCeplog.close;
dmBaseDados.tblCheques.close;
dmBaseDados.tblClientes.close;
dmBaseDados.tblClientesOficina.close;
dmBaseDados.tblContaCorrenteProduto.close;
dmBaseDados.tblContasPagar.close;
dmBaseDados.tblContasReceber.close;
dmBaseDados.tblDataCR.close;
dmBaseDados.tblEntrada.close;
dmBaseDados.tblFamilias.close;
dmBaseDados.tblFichaServico.close;
dmBaseDados.tblFornecedores.close;
dmBaseDados.tblFuncionarios.close;
dmBaseDados.tblHistorico.close;
dmBaseDados.tblMarcas.close;
dmBaseDados.tblNecessidade.close;
dmBaseDados.tblNotaFiscal.close;
dmBaseDados.tblNumeroOC.close;
dmBaseDados.tblOrdemCompra.close;
dmBaseDados.tblPecasServicos.close;
dmBaseDados.tblPedidos.close;
dmBaseDados.tblProdutos.close;
dmBaseDados.tblProdutosComprados.close;
dmBaseDados.tblProdutosFornecidos.close;
dmBaseDados.qryVendedor.close;
dmBaseDados.tblRelNotaFiscal.close;
dmBaseDados.tblRelOC.close;
dmBaseDados.tblRequisicoes.close;
ShowMessage('Tabelas Reindexidas com sucesso!!!');
close;
end;

procedure TformIndexar.FormShow(Sender: TObject);
begin
 dmBaseDados.tblANotaFiscal.close;
dmBaseDados.tblCategoria.close;
dmBaseDados.tblCepcid.close;
dmBaseDados.tblCeplog.close;
dmBaseDados.tblCheques.close;
dmBaseDados.tblClientes.close;
dmBaseDados.tblClientesOficina.close;
dmBaseDados.tblContaCorrenteProduto.close;
dmBaseDados.tblContasPagar.close;
dmBaseDados.tblContasReceber.close;
dmBaseDados.tblDataCR.close;
dmBaseDados.tblEntrada.close;
dmBaseDados.tblFamilias.close;
dmBaseDados.tblFichaServico.close;
dmBaseDados.tblFornecedores.close;
dmBaseDados.tblFuncionarios.close;
dmBaseDados.tblHistorico.close;
dmBaseDados.tblMarcas.close;
dmBaseDados.tblNecessidade.close;
dmBaseDados.tblNotaFiscal.close;
dmBaseDados.tblNumeroOC.close;
dmBaseDados.tblOrdemCompra.close;
dmBaseDados.tblPecasServicos.close;
dmBaseDados.tblPedidos.close;
dmBaseDados.tblProdutos.close;
dmBaseDados.tblProdutosComprados.close;
dmBaseDados.tblProdutosFornecidos.close;
dmBaseDados.qryVendedor.close;
dmBaseDados.tblRelNotaFiscal.close;
dmBaseDados.tblRelOC.close;
dmBaseDados.tblRequisicoes.close;
end;

end.
