unit loginsge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, TIGradient, TISButton ;

type
  TfrmSenha = class(TForm)
    edtSenha: TEdit;
    dbcUsuario: TDBLookupComboBox;
    TIGradient1: TTIGradient;
    btbEntrar: TTISButton;
    btnCancelar: TTISButton;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btbEntrarClick(Sender: TObject);
    procedure btbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcUsuarioCloseUp(Sender: TObject);
    procedure dbcUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSenha: TfrmSenha;
implementation
        
uses MenuPrincipal , ModuloDados, Clientes,
     Fornecedor, ContasReceber, ProdutosVendidos, ListaProduto;


{$R *.DFM}


procedure TfrmSenha.FormShow(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Open;
dbcUsuario.SetFocus;
end;

procedure TfrmSenha.btbEntrarClick(Sender: TObject);
var password : String;
        //i : integer;
begin
Usuario  := '';
password := dmBaseDados.tblFuncionariosPW.AsString;
if (edtSenha.Text = password) Then
 begin
  AcessStatus := 1;
  Usuario     := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
 end
else
 begin
  Application.MessageBox('Senha ou Usuário Incorreto,Redigite','Senhas',MB_OK);
  AcessStatus := 0;
 end;

formMenuPrincipal.opcConsultaPreco.ShortCut    := 112; {F1}
formMenuPrincipal.opcVendas.ShortCut           := 113; {F2}
formMenuPrincipal.opcReemissaoPedidos.ShortCut := 114; {F3}
formMenuPrincipal.opcProdutos.ShortCut         := 115; {F4}            
formMenuPrincipal.opcPedEstornados.ShortCut    := 16453; {Ctrl+E}
formMenuPrincipal.opcContasReceber.ShortCut    := 16466; {Ctrl+R}


         if( (dmBaseDados.tblFuncionariosContasRecEmissao.AsString = 'True')and(dmBaseDados.tblFuncionariosRelContasReceber.AsString = 'False') )then
          begin
           formContasReceber.ckbEmissao.Visible  := False;
          end;

         if( (dmBaseDados.tblFuncionariosProdVenSemValor.AsString = 'True')and(dmBaseDados.tblFuncionariosRelProdutosVendidos.AsString = 'False') )then
          begin
           frmProdutosVendidos.ckbValor.Checked := True;
           frmProdutosVendidos.ckbValor.Visible := False;
          end;

         if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString <> 'MBJ') then
          begin
           formMenuPrincipal.btnFerramentaMBJ.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosClientes.AsString = 'False') then
          begin
           formMenuPrincipal.opcClientes.Visible  := False;
           formMenuPrincipal.btnClientes.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosFornecedores.AsString = 'False') then
          begin
           formMenuPrincipal.opcFornecedores.Visible  := False;
           //formMenuPrincipal.btnFornecedores.Visible  := False;
          end;

        if (dmBaseDados.tblFuncionariosProdutos.AsString = 'False') then
          begin
           formMenuPrincipal.opcProdutos.Visible    := False;
           formMenuPrincipal.btnProdutos.Visible    := False;
           formListaProdutos.btnCadProdutos.Visible := False;
          end;

        if (dmBaseDados.tblFuncionariosFuncionarios.AsString = 'False') then
          begin
           formMenuPrincipal.opcFuncionarios.Visible  := False;
          // formMenuPrincipal.btnFuncionarios.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosFamiliasCategorias.AsString = 'False') then
          begin
           formMenuPrincipal.opcFamiliaCategoria.Visible  := False;
           formMenuPrincipal.btnFamiliaCategoria.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosMarcas.AsString = 'False') then
          begin
           formMenuPrincipal.opcMarcas.Visible  := False;
           formMenuPrincipal.btnMarcas.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosCadEntregas.AsString = 'False') then
          begin
           formMenuPrincipal.opcCadEntregas.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosVendasBalcao.AsString = 'False') then
          begin
           formMenuPrincipal.opcVendas.Visible  := False;
           formMenuPrincipal.btnVendas.Visible  := False;  
           formMenuPrincipal.opcVendas.ShortCut := 0;
          end;

         if (dmBaseDados.tblFuncionariosPerdasDiversas.AsString = 'False') then
          begin
           formMenuPrincipal.opcPerdas.Visible  := False;
           //formMenuPrincipal.btnPerdas.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosEmissaoNF.AsString = 'False') then
          begin
           formMenuPrincipal.opcEmissaoNota.Visible  := False;
//           formMenuPrincipal.btnNF.Visible           := False;
          end;

         if (dmBaseDados.tblFuncionariosBaixaPedidos.AsString = 'False') then
          begin
           formMenuPrincipal.opcBaixa.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosReemicaoEstorno.AsString = 'False') then
          begin
           formMenuPrincipal.opcReemissaoPedidos.Visible  := False;
           formMenuPrincipal.btnReemicaoPedidos.Visible   := False;
           formMenuPrincipal.opcReemissaoPedidos.ShortCut := 0;
          end;

         if (dmBaseDados.tblFuncionariosEstornoBaixados.AsString = 'False') then
          begin
           formMenuPrincipal.EstornodePedidosBaixados1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosCopiaLimpeza.AsString = 'False') then
          begin
           formMenuPrincipal.CpiaLimpeza1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelMarcas.AsString = 'False') then
          begin
           formMenuPrincipal.MarcasdeProdutos1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelFamilias.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelFamilias.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelCategorias.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelCategorias.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelProdutos.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelProdutos.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelFornecedores.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelFornecedores.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelClientes.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelClientes.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelFuncionarios.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelFuncionarios.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelOC.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelOCEmitida.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelLogMensal.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelLogMensal.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelBonificacaoTroca.AsString = 'False') then
          begin
           formMenuPrincipal.opcBonificacaoTroca.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelCheques.AsString = 'False') then
          begin
           formMenuPrincipal.opcRelCheques.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelComissao.AsString = 'False') then
          begin
           formMenuPrincipal.opcComissao.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelContasPagar.AsString = 'False') then
          begin
           formMenuPrincipal.ContasaPagar1.Visible  := False;
           formFornecedores.tabContasPagar.Enabled  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelContasReceber.AsString = 'False') then //and(dmBaseDados.tblFuncionariosContasRecEmissao.AsString = 'False')) then
          begin
           formMenuPrincipal.opcContasReceber.Visible  := False;
           formMenuPrincipal.opcContasReceber.ShortCut := 0;
          end;

         if (dmBaseDados.tblFuncionariosContasReceber.AsString = 'False') then
          begin
           formClientes.grdContasReceber.ReadOnly      := True;
          end;

         if ((dmBaseDados.tblFuncionariosRelProdutosVendidos.AsString = 'False')and(dmBaseDados.tblFuncionariosProdVenSemValor.AsString = 'False')) then
          begin
           formMenuPrincipal.ProdutosVendidos1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelPedidosEstornados.AsString = 'False') then
          begin
           formMenuPrincipal.opcPedEstornados.Visible  := False;
           formMenuPrincipal.opcPedEstornados.ShortCut := 0;
          end;

         if (dmBaseDados.tblFuncionariosRelContabilidade.AsString = 'False') then
          begin
           formMenuPrincipal.GeraArquivoContabilidade1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosRelFluxoCaixa.AsString = 'False') then
          begin
           formMenuPrincipal.FluxodeCaixa1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosComprasNF.AsString = 'False') then
          begin
           formMenuPrincipal.opcNotaFiscal.Visible  := False;
//           formMenuPrincipal.btnEntrada.Visible     := False;
          end;

         if (dmBaseDados.tblFuncionariosDevolucao.AsString = 'False') then
          begin
           formMenuPrincipal.opcDevolucao.Visible  := False;
//           formMenuPrincipal.btnDevolucao.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosEmitirOC.AsString = 'False') then
          begin
           formMenuPrincipal.opcEmitirOC.Visible  := False;
//           formMenuPrincipal.btnEmitirOC.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosNecessidades.AsString = 'False') then
          begin
           formMenuPrincipal.opcNecessidades.Visible  := False;
//           formMenuPrincipal.btnNecessidades.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosClientesOficina.AsString = 'False') then
          begin
           formMenuPrincipal.ClientesOficina1.Visible  := False;
           formMenuPrincipal.btnOrdemServico.Visible   := False;
          end;

         if (dmBaseDados.tblFuncionariosCaixaDiario.AsString = 'False') then
          begin
           formMenuPrincipal.CaixaDirio1.Visible  := False;
          end;

         if (dmBaseDados.tblFuncionariosEstados.AsString = 'False') then
          begin
           formMenuPrincipal.opcEditaEstado.Visible  := False;
//           formMenuPrincipal.btnEditaEstado.Visible  := False;
          end;
if (edtSenha.Text = password) Then
 begin
  Close;
 end;
end;

procedure TfrmSenha.btbCancelarClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Close;
Application.Terminate;
end;

procedure TfrmSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblFuncionarios.Close;
Close;
end;

procedure TfrmSenha.dbcUsuarioCloseUp(Sender: TObject);
begin
edtSenha.SetFocus;
end;

procedure TfrmSenha.dbcUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  edtSenha.SetFocus;
 end;
end;

procedure TfrmSenha.edtSenhaChange(Sender: TObject);
begin
btbEntrar.Default := True;
end;

procedure TfrmSenha.btnCancelarClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Close;
Application.Terminate;
end;

end.
