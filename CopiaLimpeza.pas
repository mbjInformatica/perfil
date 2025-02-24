unit CopiaLimpeza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, TIGradient;

type
  TformCopiaLimpeza = class(TForm)
    lblDtI: TLabel;
    Data1: TDateTimePicker;
    ckbLimpeza: TCheckBox;
    ckbCopia: TCheckBox;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    edtSenha: TEdit;
    TIGradient1: TTIGradient;
    procedure FormShow(Sender: TObject);
    procedure ckbLimpezaClick(Sender: TObject);
    procedure ckbCopiaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCopiaLimpeza: TformCopiaLimpeza;

implementation
uses ModuloDados;

{$R *.DFM}

procedure TformCopiaLimpeza.FormShow(Sender: TObject);
begin
pgrProcessamento.Position := 0;
Data1.Date                := Date;
ckbLimpeza.Checked        := True;
ckbCopia.Checked          := False;
edtSenha.Text             := '';
dmBaseDados.tblContasPagar.Open;
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblHistorico.Open;
dmBaseDados.tblPedidos.Open;
{dmBaseDados.tblContasPgBKP.Open;
dmBaseDados.tblContasRecBKP.Open;
dmBaseDados.tblHistoricoBKP.Open;
dmBaseDados.tblPedidosBKP.Open;}
end;

procedure TformCopiaLimpeza.ckbLimpezaClick(Sender: TObject);
begin
   if ckbLimpeza.Checked = True then
    begin
      ckbCopia.Enabled := False;
    end
   else
    begin
      ckbCopia.Enabled := True;
    end;

end;

procedure TformCopiaLimpeza.ckbCopiaClick(Sender: TObject);
begin
   if ckbCopia.Checked = True then
    begin
      ckbLimpeza.Enabled := False;
    end
   else
    begin
      ckbLimpeza.Enabled := True;
    end;
end;

procedure TformCopiaLimpeza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//dmBaseDados.tblContasPagar.Close;
//dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblHistorico.Close;
dmBaseDados.tblPedidos.Close;
{dmBaseDados.tblContasPgBKP.Close;
dmBaseDados.tblContasRecBKP.Close;
dmBaseDados.tblHistoricoBKP.Close;
dmBaseDados.tblPedidosBKP.Close;}
end;

procedure TformCopiaLimpeza.btnOKClick(Sender: TObject);
begin
{dmBaseDados.tblContasPagar.Filter   := '('+'DataVencimento <='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'Status <='+QuotedStr('1')+')';
dmBaseDados.tblContasPagar.Filtered := True;}
dmBaseDados.tblHistorico.MasterFields := '';
dmBaseDados.tblPedidos.MasterFields   := '';
pgrProcessamento.Max                  := dmBaseDados.tblHistorico.RecordCount;
pgrProcessamento.Max                  := dmBaseDados.tblPedidos.RecordCount;
//pgrProcessamento.Max                  := dmBaseDados.tblContasReceber.RecordCount;
//pgrProcessamento.Max                  := dmBaseDados.tblContasPagar.RecordCount;
if edtSenha.Text = 'confirmalimpeza' then
BEGIN
if (Application.MessageBox('ATENÇÃO!!!DESEJA REALMENTE FAZER A LIMPEZA ATÉ A DATA SELECIONADA ??','CONFIRMA LIMPEZA?',MB_YESNO)) = IDYES then
BEGIN
while(not dmBaseDados.tblHistorico.Eof) do
 begin
   while (dmBaseDados.tblHistoricoDataLancamento.AsDateTime <= Data1.Date)do
    begin
     {dmBaseDados.tblHistoricoBKP.Append;
     dmBaseDados.tblHistoricoBKPDataLancamento.AsDateTime  := dmBaseDados.tblHistoricoDataLancamento.AsDateTime;
     dmBaseDados.tblHistoricoBKPCodigoMovimento.AsString   := dmBaseDados.tblHistoricoCodigoMovimento.AsString;
     dmBaseDados.tblHistoricoBKPCodigoProduto.AsString     := dmBaseDados.tblHistoricoCodigoProduto.AsString;
     dmBaseDados.tblHistoricoBKPNumeroNotaFiscal.AsString  := dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString;
     dmBaseDados.tblHistoricoBKPNumeroRequisicao.AsString  := dmBaseDados.tblHistoricoNumeroRequisicao.AsString;
     dmBaseDados.tblHistoricoBKPControleDevolucao.AsString := dmBaseDados.tblHistoricoControleDevolucao.AsString;
     dmBaseDados.tblHistoricoBKPQuantidade.AsString        := dmBaseDados.tblHistoricoQuantidade.AsString;
     dmBaseDados.tblHistoricoBKPPeso.AsString              := dmBaseDados.tblHistoricoPeso.AsString;
     dmBaseDados.tblHistoricoBKPCodigoCliente.AsString     := dmBaseDados.tblHistoricoCodigoCliente.AsString;
     dmBaseDados.tblHistoricoBKPClienteFornecedor.AsString := dmBaseDados.tblHistoricoClienteFornecedor.AsString;
     dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString    := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
     dmBaseDados.tblHistoricoBKPNomeVendedor.AsString      := dmBaseDados.tblHistoricoNomeVendedor.AsString;
     dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat    := dmBaseDados.tblHistoricoValorLancamento.AsFloat;
     dmBaseDados.tblHistoricoBKPMesAno.AsString            := dmBaseDados.tblHistoricoMesAno.AsString;
     dmBaseDados.tblHistoricoBKPOperador.AsString          := dmBaseDados.tblHistoricoOperador.AsString;
     dmBaseDados.tblHistoricoBKPCondPg.AsString            := dmBaseDados.tblHistoricoCondPg.AsString;
     dmBaseDados.tblHistoricoBKPDataVencimento.AsDateTime  := dmBaseDados.tblHistoricoDataVencimento.AsDateTime;
     dmBaseDados.tblHistoricoBKP.Post;}
     dmBaseDados.tblHistorico.Delete;
   end;
  dmBaseDados.tblHistorico.Next;
  pgrProcessamento.Position := pgrProcessamento.Position+1;
 end;
 while(not dmBaseDados.tblPedidos.Eof) do
  begin
   while (dmBaseDados.tblPedidosDataEmissao.AsDateTime <= Data1.Date)do
    begin
     {dmBaseDados.tblPedidosBKP.Append;
     dmBaseDados.tblPedidosBKPCodigoCliente.AsString    := dmBaseDados.tblPedidosCodigoCliente.AsString;
     dmBaseDados.tblPedidosBKPNPedido.AsString          := dmBaseDados.tblPedidosNPedido.AsString;
     dmBaseDados.tblPedidosBKPCodigoVendedor.AsString   := dmBaseDados.tblPedidosCodigoVendedor.AsString;
     dmBaseDados.tblPedidosBKPVendedor.AsString         := dmBaseDados.tblPedidosVendedor.AsString;
     dmBaseDados.tblPedidosBKPProduto.AsString          := dmBaseDados.tblPedidosProduto.AsString;
     dmBaseDados.tblPedidosBKPQuantidade.AsString       := dmBaseDados.tblPedidosQuantidade.AsString;
     dmBaseDados.tblPedidosBKPPeso.AsString             := dmBaseDados.tblPedidosPeso.AsString;
     dmBaseDados.tblPedidosBKPDescricao.AsString        := dmBaseDados.tblPedidosDescricao.AsString;
     dmBaseDados.tblPedidosBKPUnitario.AsFloat          := dmBaseDados.tblPedidosUnitario.AsFloat;
     dmBaseDados.tblPedidosBKPTotal.AsFloat             := dmBaseDados.tblPedidosTotal.AsFloat;
     dmBaseDados.tblPedidosBKPPagamento.AsString        := dmBaseDados.tblPedidosPagamento.AsString;
     dmBaseDados.tblPedidosBKPVencimento.AsDateTime     := dmBaseDados.tblPedidosVencimento.AsDateTime;
     dmBaseDados.tblPedidosBKPCusto.AsFloat             := dmBaseDados.tblPedidosCusto.AsFloat;
     dmBaseDados.tblPedidosBKPDesconto.AsFloat          := dmBaseDados. tblPedidosDesconto.AsFloat;
     dmBaseDados.tblPedidosBKPComissao.AsFloat          := dmBaseDados.tblPedidosComissao.AsFloat;
     dmBaseDados.tblPedidosBKPMotorista.AsString        := dmBaseDados.tblPedidosMotorista.AsString;
     dmBaseDados.tblPedidosBKPStatus.AsString           := dmBaseDados.tblPedidosStatus.AsString;
     dmBaseDados.tblPedidosBKPCST.AsFloat               := dmBaseDados.tblPedidosCST.AsFloat;
     dmBaseDados.tblPedidosBKPUnidade.AsString          := dmBaseDados.tblPedidosUnidade.AsString;
     dmBaseDados.tblPedidosBKPICMS.AsFloat              := dmBaseDados.tblPedidosICMS.AsFloat;
     dmBaseDados.tblPedidosBKPDataEmissao.AsDateTime    := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
     dmBaseDados.tblPedidosBKPCodigoFornecedor.AsString := dmBaseDados.tblPedidosCodigoFornecedor.AsString;
     dmBaseDados.tblPedidosBKP.Post;}
     dmBaseDados.tblPedidos.Delete;
   end;
   dmBaseDados.tblPedidos.Next;
   pgrProcessamento.Position := pgrProcessamento.Position+1;
  end;
 {while(not dmBaseDados.tblContasPagar.Eof) do
  begin
   while (dmBaseDados.tblContasPagarDataVencimento.AsDateTime <= Data1.Date)and(dmBaseDados.tblContasPagarStatus.AsString = '1') do
    begin
     {dmBaseDados.tblContasPgBKP.Append;
     dmBaseDados.tblContasPgBKPCodigoFornecedor.AsString := dmBaseDados.tblContasPagarCodigoFornecedor.AsString;
     dmBaseDados.tblContasPgBKPNumeroDocumento.AsString  := dmBaseDados.tblContasPagarNumeroDocumento.AsString;
     dmBaseDados.tblContasPgBKPFornecedor.AsString       := dmBaseDados.tblContasPagarFornecedor.AsString;
     dmBaseDados.tblContasPgBKPAsterisco.AsString        := dmBaseDados.tblContasPagarAsterisco.AsString;
     dmBaseDados.tblContasPgBKPDataEmissao.AsDateTime    := dmBaseDados.tblContasPagarDataEmissao.AsDateTime;
     dmBaseDados.tblContasPgBKPDataVencimento.AsDateTime := dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
     dmBaseDados.tblContasPgBKPPrazo.AsString            := dmBaseDados.tblContasPagarPrazo.AsString;
     dmBaseDados.tblContasPgBKPValorDocumento.AsFloat    := dmBaseDados.tblContasPagarValorDocumento.AsFloat;
     dmBaseDados.tblContasPgBKPFormaPagamento.AsString   := dmBaseDados.tblContasPagarFormaPagamento.AsString;
     dmBaseDados.tblContasPgBKPValorPago.AsFloat         := dmBaseDados.tblContasPagarValorPago.AsFloat;
     dmBaseDados.tblContasPgBKPDataPagamento.AsDateTime  := dmBaseDados.tblContasPagarDataPagamento.AsDateTime;
     dmBaseDados.tblContasPgBKPDiasAtraso.AsString       := dmBaseDados.tblContasPagarDiasAtraso.AsString;
     dmBaseDados.tblContasPgBKPObservacao.AsString       := dmBaseDados.tblContasPagarObservacao.AsString;
     dmBaseDados.tblContasPgBKPStatus.AsString           := dmBaseDados.tblContasPagarStatus.AsString;
     dmBaseDados.tblContasPgBKPBaixado.AsString          := dmBaseDados.tblContasPagarBaixado.AsString;
     dmBaseDados.tblContasPgBKPCreditoICMS.AsFloat       := dmBaseDados.tblContasPagarCreditoICMS.AsFloat;
     dmBaseDados.tblContasPgBKP.Post;
     dmBaseDados.tblContasPagar.Delete;
   end;
  dmBaseDados.tblContasPagar.Next;
  pgrProcessamento.Position := pgrProcessamento.Position+1;
 end;
while(not dmBaseDados.tblContasReceber.Eof) do
 begin
   while (dmBaseDados.tblContasReceberDataEmissao.AsDateTime <= Data1.Date) do
    begin
     dmBaseDados.tblContasRecBKP.Append;
     dmBaseDados.tblContasRecBKPNumeroDocumento.AsString  := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
     dmBaseDados.tblContasRecBKPNumeroCIC.AsString        := dmBaseDados.tblContasReceberNumeroCIC.AsString;
     dmBaseDados.tblContasRecBKPNumeroNF.AsString         := dmBaseDados.tblContasReceberNumeroNF.AsString;
     dmBaseDados.tblContasRecBKPParcelas.AsString         := dmBaseDados.tblContasReceberParcelas.AsString;
     dmBaseDados.tblContasRecBKPDataBaixa.AsDateTime      := dmBaseDados.tblContasReceberDataBaixa.AsDateTime;
     dmBaseDados.tblContasRecBKPCodCli.AsString           := dmBaseDados.tblContasReceberCodCli.AsString;
     dmBaseDados.tblContasRecBKPCliente.AsString          := dmBaseDados.tblContasReceberCliente.AsString;
     dmBaseDados.tblContasRecBKPDataEmissao.AsDateTime    := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
     dmBaseDados.tblContasRecBKPDataVencimento.AsDateTime := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
     dmBaseDados.tblContasRecBKPFormaPagamento.AsString   := dmBaseDados.tblContasReceberFormaPagamento.AsString;
     dmBaseDados.tblContasRecBKPValorDocumento.AsFloat    := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     dmBaseDados.tblContasRecBKPValorDinheiro.AsFloat     := dmBaseDados.tblContasReceberValorDinheiro.AsFloat;
     dmBaseDados.tblContasRecBKPValorCheque.AsFloat       := dmBaseDados.tblContasReceberValorCheque.AsFloat;
     dmBaseDados.tblContasRecBKPValorTotal.AsFloat        := dmBaseDados.tblContasReceberValorTotal.AsFloat;
     dmBaseDados.tblContasRecBKPDiferenca.AsFloat         := dmBaseDados.tblContasReceberDiferenca.AsFloat;
     dmBaseDados.tblContasRecBKPTroco.AsFloat             := dmBaseDados.tblContasReceberTroco.AsFloat;
     dmBaseDados.tblContasRecBKPLocalPagamento.AsString   := dmBaseDados.tblContasReceberLocalPagamento.AsString;
     dmBaseDados.tblContasRecBKPDataPagamento.AsDateTime  := dmBaseDados.tblContasReceberDataPagamento.AsDateTime;
     dmBaseDados.tblContasRecBKPDiasAtraso.AsString       := dmBaseDados.tblContasReceberDiasAtraso.AsString;
     dmBaseDados.tblContasRecBKPVendedor.AsString         := dmBaseDados.tblContasReceberVendedor.AsString;
     dmBaseDados.tblContasRecBKPMotorista.AsString        := dmBaseDados.tblContasReceberMotorista.AsString;
     dmBaseDados.tblContasRecBKPObservacao.AsString       := dmBaseDados.tblContasReceberObservacao.AsString;
     dmBaseDados.tblContasRecBKPStatus.AsString           := dmBaseDados.tblContasReceberStatus.AsString;
     dmBaseDados.tblContasRecBKP.Post;
     dmBaseDados.tblContasReceber.Delete;
   end;
  dmBaseDados.tblContasReceber.Next;
  pgrProcessamento.Position := pgrProcessamento.Position+1;
 end;}
END;
END
ELSE
 BEGIN
  ShowMessage('Senha Inválida!');
  edtSenha.SetFocus;
 END;
 ShowMessage('Limpeza Concluída');

end;

end.
