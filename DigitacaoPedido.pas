unit DigitacaoPedido;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Mask, DB, TISButton, TIGradientCaption, TIGradient;

type
  TfrmDigitacaoPedido = class(TForm)
    mskRequisicao : TMaskEdit;
    ckbFiscal: TCheckBox;
    ckbNaoFiscal: TCheckBox;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    TISButton1: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ckbNaoFiscalClick(Sender: TObject);
    procedure ckbFiscalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var frmDigitacaoPedido: TfrmDigitacaoPedido;
    strCodOper, Status, NPedido, Stts, SttsOrc : String;

implementation

uses ModuloDados, Venda, RotinasGerais;


{$R *.DFM}


procedure TfrmDigitacaoPedido.FormShow(Sender: TObject);
begin
mskRequisicao.Text   := '        ';
ckbNaoFiscal.Checked := True;
mskRequisicao.SetFocus;
end;

procedure TfrmDigitacaoPedido.btnOKClick(Sender: TObject);
begin
Stts       := '';
SttsOrc    := '';
Status     := '';
strCodOper := '';
strCliente := '';
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblHistorico.Open;
dmBaseDados.tblContasReceber.Open;
dmBasedados.tblSaida.EmptyTable;
dmBaseDados.tblSaida.Open;
dmBaseDados.tblSaida.IndexName := '';
dmBaseDados.tblPedidos.First;
dmBaseDados.tblPedidos.IndexName := 'IndNroPedido';
dmBaseDados.tblPedidos.FindKey([mskRequisicao.Text]);
if( (mskRequisicao.Text <> '        ')and(mskRequisicao.Text <> dmBaseDados.tblPedidosNPedido.AsString) )then
  BEGIN
   Application.MessageBox('Pedido não cadastrado ou já baixado','Atenção!',MB_OK);
   dmBaseDados.tblPedidos.close;
   dmBaseDados.tblSaida.close;
   dmBaseDados.tblHistorico.Close;
   dmBaseDados.tblContasReceber.Close;
   Close;
  END
else
  BEGIN
   Status := '1';
   NPedido := mskRequisicao.Text;
   while( (not dmBaseDados.tblPedidos.Eof)and(dmBaseDados.tblPedidosNPedido.AsString = mskRequisicao.Text) )do
     Begin
      SttsOrc := '1';
      if dmBaseDados.tblPedidosStatus.AsString = '1' then
       begin
        Stts := '1';
       end;
      strCodOper := dmBaseDados.tblPedidosCodigoVendedor.AsString;
      strCliente := dmBaseDados.tblPedidosCodigoCliente.AsString;
      strCodOper := LRPad(strCodOper,3,'0','L');
      dmBasedados.tblSaida.Append;
      dmBaseDados.tblSaidaNumeroRequisicao.AsString := dmBaseDados.tblPedidosNPedido.AsString;
      dmBaseDados.tblSaidaDataLancamento.AsDateTime := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
      dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
      dmBaseDados.tblSaidaDataVencimento.AsDateTime := dmBaseDados.tblPedidosVencimento.AsDateTime;
      dmBaseDados.tblSaidaCodVen.AsFloat            := dmBaseDados.tblPedidosCodigoVendedor.AsFloat;
      dmBaseDados.tblSaidaVendedor.AsString         := dmBaseDados.tblPedidosVendedor.AsString;
      dmBaseDados.tblSaidaCodigoProduto.AsString    := dmBaseDados.tblPedidosProduto.AsString;
      dmBaseDados.tblSaidaRefFabricante.AsString    := dmBaseDados.tblPedidosCodigoReferencia.AsString;
      dmBaseDados.tblSaidaDescricaoProduto.AsString := dmBaseDados.tblPedidosDescricao.AsString;
      dmBaseDados.tblSaidaQuantidade.AsFloat        := dmBaseDados.tblPedidosQuantidade.AsFloat;
      dmBaseDados.tblSaidaValorUnitario.AsFloat     := dmBaseDados.tblPedidosUnitario.AsFloat;
      dmBaseDados.tblSaidaValorTotal.AsFloat        := dmBaseDados.tblPedidosTotal.AsFloat;
      dmBaseDados.tblSaidaCondPg.AsString           := dmBaseDados.tblPedidosPagamento.AsString;
      dmBaseDados.tblSaidaPeso.AsFloat              := dmBaseDados.tblPedidosPeso.AsFloat;
      dmBaseDados.tblSaidaDataVencimento.AsString   := dmBaseDados.tblPedidosVencimento.AsString;
      dmBaseDados.tblSaidaDesconto.AsFloat          := dmBaseDados.tblPedidosDesconto.AsFloat;
      dmBaseDados.tblSaidaComissao.AsFloat          := dmBaseDados.tblPedidosComissao.AsFloat;
      dmBaseDados.tblSaidaUnidade.AsString          := dmBaseDados.tblPedidosUnidade.AsString;
      dmBaseDados.tblSaidaQtdeCx.AsFloat            := dmBaseDados.tblPedidosICMS.AsFloat;
      dmBaseDados.tblSaida.Post;
      if dmBaseDados.tblHistorico.Locate('NumeroRequisicao',mskRequisicao.Text,[LOCASEINSENSITIVE])=True then
       begin
        dmBaseDados.tblHistorico.Delete;
       end;
      if dmBaseDados.tblContasReceber.Locate('NumeroDocumento',mskRequisicao.Text,[LOCASEINSENSITIVE])=True then
       begin
        dmBaseDados.tblContasReceber.Delete;
       end;
      dmBaseDados.tblPedidos.Next;
     End;
   dmBaseDados.tblSaida.Close;
   dmBaseDados.tblPedidos.Close;
   dmBaseDados.tblHistorico.Close;
   dmBaseDados.tblContasReceber.Close;
   formVendasBalcao.ShowModal;
  END;
Close;
end;

procedure TfrmDigitacaoPedido.ckbNaoFiscalClick(Sender: TObject);
begin
if ckbNaoFiscal.Checked = True then
 begin
  ckbFiscal.Checked := False;
 end;
end;

procedure TfrmDigitacaoPedido.ckbFiscalClick(Sender: TObject);
begin
if ckbFiscal.Checked = True then
 begin
  ckbNaoFiscal.Checked := False;
 end;
end;

end.
