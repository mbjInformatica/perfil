unit Estorno;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, DB, DBTables;

type
  TformEstornoPedido = class(TForm)
    lblRequisicao     : TLabel;
    lblDataEmissao    : TLabel;
    dbtDataEmissao    : TDBText;
    lblQuantidade     : TLabel;
    grdProdutos       : TDBGrid;
    btnRetornar       : TSpeedButton;
    lblNumerodoPedido : TLabel;
    ckbTotalParcial   : TCheckBox;
    dbtNumeroPedido   : TDBText;
    dbtNomeCliente    : TDBText;
    dbtNomeVendedor   : TDBText;
    edtQuantidade     : TEdit;
    ckbAproveitarpedido: TCheckBox;
    qryUtil: TQuery;
    procedure FormShow(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ckbTotalParcialClick(Sender: TObject);
    procedure grdProdutosCellClick(Column: TColumn);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEstornoPedido: TformEstornoPedido;
//  intQuantidade:Integer;
  intQuantidade:Double;
implementation

uses
        MenuPrincipal ,ModuloDados;

{$R *.DFM}

procedure TformEstornoPedido.FormShow(Sender: TObject);
begin
   dmBaseDados.tblClientes.FindKey([dmBaseDados.qryPedidosCodigoCliente.AsFloat]);
end;

procedure TformEstornoPedido.btnRetornarClick(Sender: TObject);
var
        strCodFamilia,strCodCategoria,strCodProduto,strNPedido,strStatus: String;
        //intQPedido:Integer;
        intQPedido:Double;
Begin
        if ckbTotalParcial.Checked=True then
           begin
                strNPedido := dmBaseDados.qryPedidosNPedido.AsString;
                dmBaseDados.tblProdutos.Open;
//                dmBaseDados.tblPedidos.IndexName  := 'IndNroPedido';
//                dmBaseDados.tblPedidos.Filter     := '';
//                dmBaseDados.tblPedidos.Filtered   := False;
//                dmBaseDados.tblPedidos.FindKey([strNPedido]);
                dmBaseDados.qryPedidos.First;
                while ((dmBaseDados.qryPedidosNPedido.AsString=strNPedido)and(not dmBaseDados.qryPedidos.Eof))do
                     begin
                        intQPedido      := dmBaseDados.qryPedidosQuantidade.AsFloat;
                        strCodFamilia   := Copy(dmBaseDados.qryPedidosProduto.AsString,1,3);
                        strCodCategoria := Copy(dmBaseDados.qryPedidosProduto.AsString,4,3);
                        strCodProduto   := Copy(dmBaseDados.qryPedidosProduto.AsString,7,6);
                        dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
                        dmBaseDados.tblProdutos.Edit;
                        dmBaseDados.tblProdutosEstoqueAtual.AsFloat:=
                        dmBaseDados.tblProdutosEstoqueAtual.AsFloat+intQPedido;
                        dmBaseDados.tblProdutos.Post;
                        dmBaseDados.qryPedidos.Edit;
                        dmBaseDados.qryPedidosStatus.AsString        := '0';
                        dmBaseDados.qryPedidosPagamento.AsString     := 'ES';
                        dmBaseDados.qryPedidosDataEmissao.AsDateTime := Date;
                        dmBaseDados.qryPedidos.Post;
                        dmBaseDados.qryPedidos.Next;
                     end;
                dmBaseDados.qryPedidos.Close;
                dmBaseDados.tblClientes.Close;
                dmBaseDados.tblProdutos.Close;

                qryUtil.Close;
                qryUtil.SQL.Text := 'DELETE FROM ContasReceber WHERE (NumeroDocumento = "'+strNPedido+'")';
                qryUtil.ExecSQL;

                qryUtil.Close;
                qryUtil.SQL.Text := 'DELETE FROM Historico WHERE (NumeroRequisicao = "'+strNPedido+'")';
                qryUtil.ExecSQL;

{
                dmBaseDados.tblContasReceber.Open;
                dmBaseDados.tblHistorico.Open;
                dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento';
                dmBaseDados.tblHistorico.IndexName     := 'IndNPedidoHis';
                dmBaseDados.tblContasReceber.FindKey([strNPedido]);
                dmBaseDados.tblHistorico.FindKey([strNPedido]);
                while ((dmBaseDados.tblContasReceberNumeroDocumento.AsString = strNPedido)and(not dmBaseDados.tblContasReceber.Eof)) do
                     begin
                       dmBaseDados.tblContasReceber.Edit;
                       dmBaseDados.tblContasReceber.Delete;
                       //dmBaseDados.tblContasReceber.Next;
                     end;
                 while((not dmBaseDados.tblHistorico.Eof)and(dmBaseDados.tblHistoricoNumeroRequisicao.AsString = strNPedido))do
                     begin
                       dmBaseDados.tblHistorico.Edit;
                       dmBaseDados.tblHistorico.Delete;
                      // dmBaseDados.tblHistorico.Next;
                     end;
                dmBaseDados.tblContasReceber.IndexName := '';
                dmBaseDados.tblHistorico.IndexName     := '';
}
//                dmBaseDados.qryPedidos.IndexName       := '';
                Close;
           end
        else
                Close;
      if ckbAproveitarpedido.Checked = true then
          begin
            //Application.Terminate;

          end;
end;

procedure TformEstornoPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
       if Key = #13 then
                begin
                Key := #0;
                if (Sender is TDBGrid) then
                        TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
                else
                        Perform(Wm_NextDlgCtl,0,0);
                end;
end;

procedure TformEstornoPedido.ckbTotalParcialClick(Sender: TObject);
begin
        if ckbTotalParcial.Checked=False then
                begin
                edtQuantidade.Enabled := True;
                grdProdutos.Enabled   := True;
                end
        else
                begin
                edtQuantidade.Enabled := False;
                grdProdutos.Enabled   := False;
                end;
end;
procedure TformEstornoPedido.grdProdutosCellClick(Column: TColumn);
begin
        dmBaseDados.tblProdutos.Open;
        if Application.MessageBox('Deseja excluir este item ?','Exclui Item',
        MB_OKCANCEL)=IDOK then
                begin
                edtQuantidade.Text := FloatToStr(dmBaseDados.qryPedidosQuantidade.AsFloat);
                edtQuantidade.SetFocus;
                end;
end;
procedure TformEstornoPedido.edtQuantidadeExit(Sender: TObject);
var
strCodFamilia,strCodCategoria,strCodProduto,strNPedido, strCodVend,strVendedor,strProduto: String;
strPgto, strDescricao,strMotorista, strStatus, strCST, strUnidade, strCodForn, strCodProdutoES, strCodProdutoES2 : String;
CrcSubTotal,CrcTotal : Currency;
//strCliente :Integer;
strCliente,strQtdeTotal,intQPedido,intQuantidade,strPeso, strCusto, strDesconto, strComissao, strICMS : Double;
strVencimento, strDtEmissao, strDtEmissaoOriginal : TDateTime;
begin
        dmBaseDados.tblProdutos.Open;
        strNPedido      := dmBaseDados.qryPedidosNPedido.AsString;
        intQPedido      := dmBaseDados.qryPedidosQuantidade.AsFloat;
        strCliente      := dmBaseDados.qryPedidosCodigoCliente.AsFloat;
        strCodVend      := dmBaseDados.qryPedidosCodigoVendedor.AsString;
        strVendedor     := dmBaseDados.qryPedidosVendedor.AsString;
        strProduto      := dmBaseDados.qryPedidosProduto.AsString;
        strPeso         := dmBaseDados.qryPedidosPeso.AsFloat;
        strDescricao    := dmBaseDados.qryPedidosDescricao.AsString;
        strPgto         := dmBaseDados.qryPedidosPagamento.AsString;
        strVencimento   := dmBaseDados.qryPedidosVencimento.AsDateTime;
        strCusto        := dmBaseDados.qryPedidosCusto.AsFloat;
        strDesconto     := dmBaseDados.qryPedidosDesconto.AsFloat;
        strComissao     := dmBaseDados.qryPedidosComissao.AsFloat;
        strMotorista    := dmBaseDados.qryPedidosMotorista.AsString;
        strCST          := dmBaseDados.qryPedidosCST.AsString;
        strUnidade      := dmBaseDados.qryPedidosUnidade.AsString;
        strICMS         := dmBaseDados.qryPedidosICMS.AsFloat;
        strDtEmissao    := dmBaseDados.qryPedidosDataEmissao.AsDateTime;
   strDtEmissaoOriginal := dmBaseDados.qryPedidosDataEmissaoOriginal.AsDateTime;
        strCodForn      := dmBaseDados.qryPedidosCodigoFornecedor.AsString;
        intQuantidade   := StrToFloat(edtQuantidade.Text);
        strCodFamilia   := Copy(dmBaseDados.qryPedidosProduto.AsString,1,3);
        strCodCategoria := Copy(dmBaseDados.qryPedidosProduto.AsString,4,3);
        strCodProduto   := Copy(dmBaseDados.qryPedidosProduto.AsString,7,6);
        strCodProdutoES := Copy(dmBaseDados.qryPedidosProduto.AsString,7,4);
        strCodProdutoES2:= Copy(dmBaseDados.qryPedidosProduto.AsString,12,1);
        dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
        if ((intQuantidade>0)and(intQuantidade<intQPedido))then
                begin
                 dmBaseDados.tblProdutos.Edit;
                 dmBaseDados.tblProdutosEstoqueAtual.AsFloat:=
                 dmBaseDados.tblProdutosEstoqueAtual.AsFloat+intQuantidade;
                 dmBaseDados.tblProdutos.Post;
                 CrcSubTotal := dmBaseDados.qryPedidosUnitario.AsCurrency; //Preço unitário
                 CrcTotal    := CrcSubTotal*intQuantidade; // Valor do estorno
                 dmBaseDados.qryPedidos.Edit;
                 dmBaseDados.qryPedidosQuantidade.AsFloat := intQPedido-intQuantidade;
                 dmBaseDados.qryPedidosTotal.AsCurrency   := dmBaseDados.qryPedidosQuantidade.AsCurrency*CrcSubTotal;
                 dmBaseDados.qryPedidos.Post;
                 strQtdeTotal := intQPedido-intQuantidade;
                 if (strQtdeTotal > 0) then
                  begin
                    dmBaseDados.qryPedidos.Append;
                    dmBaseDados.qryPedidosCodigoCliente.AsFloat   := strCliente;
                    dmBaseDados.qryPedidosNPedido.AsString          := strNPedido;
                    dmBaseDados.qryPedidosCodigoVendedor.AsString   := strCodVend;
                    dmBaseDados.qryPedidosVendedor.AsString         := strVendedor;
                    dmBaseDados.qryPedidosProduto.AsString          := strCodFamilia+strCodCategoria+strCodProdutoES+strCodProdutoES2;
                    dmBaseDados.qryPedidosQuantidade.AsFloat        := intQuantidade;
                    dmBaseDados.qryPedidosPeso.AsFloat              := strPeso;
                    dmBaseDados.qryPedidosDescricao.AsString        := 'Item Estornado Parcialmente';
                    dmBaseDados.qryPedidosUnitario.AsFloat          := CrcSubTotal;
                    dmBaseDados.qryPedidosTotal.AsFloat             := CrcTotal;
                    dmBaseDados.qryPedidosPagamento.AsString        := 'ES';
                    dmBaseDados.qryPedidosVencimento.AsDateTime     := strVencimento;
                    dmBaseDados.qryPedidosCusto.AsFloat             := strCusto;
                    dmBaseDados.qryPedidosDesconto.AsFloat          := strDesconto;
                    dmBaseDados.qryPedidosComissao.AsFloat          := strComissao;
                    dmBaseDados.qryPedidosMotorista.AsString        := strMotorista;
                    dmBaseDados.qryPedidosStatus.AsString           := '0';
                    dmBaseDados.qryPedidosCST.AsString              := strCST;
                    dmBaseDados.qryPedidosUnidade.AsString          := strUnidade;
                    dmBaseDados.qryPedidosICMS.AsFloat              := strICMS;
                    //dmBaseDados.qryPedidosDataEmissao.AsDateTime    := strDtEmissao;
                    dmBaseDados.qryPedidosDataEmissao.AsDateTime    := Date;
                    dmBaseDados.qryPedidosDataEmissaoOriginal.AsDateTime := strDtEmissaoOriginal;
                    dmBaseDados.qryPedidosCodigoFornecedor.AsString := strCodForn;
                    dmBaseDados.qryPedidos.Post;
                  end;
                 dmBaseDados.qryPedidos.Close;
                 dmBaseDados.tblClientes.Close;
                 dmBaseDados.tblContasReceber.Open;
                 dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento';
                if dmBaseDados.tblContasReceber.FindKey([strNPedido])then
                  begin
                     if(CrcTotal > dmBaseDados.tblContasReceberValorDocumento.AsCurrency) then
                      begin
                       CrcTotal := CrcTotal-dmBaseDados.tblContasReceberValorDocumento.AsCurrency;
                       dmBaseDados.tblContasReceber.Edit;
                       dmBaseDados.tblContasReceber.Delete;
                      end;
                    dmBaseDados.tblContasReceber.Edit;
                    dmBaseDados.tblContasReceberValorDocumento.AsCurrency:=
                    dmBaseDados.tblContasReceberValorDocumento.AsCurrency-CrcTotal;
                    dmBaseDados.tblContasReceber.Post;
                  end;
                dmBaseDados.tblContasReceber.IndexName := '';
                dmBaseDados.tblContasReceber.Close;
                end
        else
                if (intQuantidade>intQPedido)or(intQuantidade=0) then
                begin
                  Application.MessageBox('Redigite a quantidade a ser estornada','Atenção',MB_OK);
                  edtQuantidade.Text := FloatToStr(dmBaseDados.qryPedidosQuantidade.AsFloat);
                  edtQuantidade.SetFocus;
                end
                else
                  begin
                    dmBaseDados.tblProdutos.Edit;
                    dmBaseDados.tblProdutosEstoqueAtual.AsFloat:=
                    dmBaseDados.tblProdutosEstoqueAtual.AsFloat+intQuantidade;
                    dmBaseDados.tblProdutos.Post;
                    CrcSubTotal := dmBaseDados.qryPedidosUnitario.AsCurrency; //Preço unitário
                    CrcTotal    := CrcSubTotal*intQuantidade; // Valor do estorno
                    dmBaseDados.qryPedidos.Edit;
                    dmBaseDados.qryPedidosStatus.AsString    := '0';
                    dmBaseDados.qryPedidosPagamento.AsString := 'ES';
                    dmBaseDados.qryPedidosDataEmissao.AsDateTime := Date;
                    dmBaseDados.qryPedidos.Post;
                    dmBaseDados.qryPedidos.Close;
                    dmBaseDados.tblClientes.Close;
                    dmBaseDados.tblContasReceber.Open;
                    dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento';
                    dmBaseDados.tblContasReceber.FindKey([strNPedido]);
                      if  (CrcTotal > dmBaseDados.tblContasReceberValorDocumento.AsCurrency) then
                        begin
                          CrcTotal := CrcTotal-dmBaseDados.tblContasReceberValorDocumento.AsCurrency;
                          dmBaseDados.tblContasReceber.Edit;
                          dmBaseDados.tblContasReceber.Delete;
                          if dmBaseDados.tblContasReceber.FindKey([strNPedido])then
                            begin
                              dmBaseDados.tblContasReceber.Edit;
                              dmBaseDados.tblContasReceberValorDocumento.AsCurrency:=
                              dmBaseDados.tblContasReceberValorDocumento.AsCurrency-CrcTotal;
                              dmBaseDados.tblContasReceber.Post;
                            end;
                        end
                        else if (CrcTotal = dmBaseDados.tblContasReceberValorDocumento.AsCurrency) then
                              begin
                                dmBaseDados.tblContasReceber.Edit;
                                dmBaseDados.tblContasReceber.Delete;
                              end
                              else
                                begin
                                  dmBaseDados.tblContasReceber.Edit;
                                  dmBaseDados.tblContasReceberValorDocumento.AsCurrency:=
                                  dmBaseDados.tblContasReceberValorDocumento.AsCurrency-CrcTotal;
                                  dmBaseDados.tblContasReceber.Post;
                                end;
                        dmBaseDados.tblContasReceber.IndexName := '';
                        dmBaseDados.tblContasReceber.Close;
                        end;
        edtQuantidade.Clear;
end;
procedure TformEstornoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        ckbTotalParcial.Checked := False;
        dmBaseDados.tblProdutos.Close;
end;

end.
