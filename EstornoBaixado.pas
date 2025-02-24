unit EstornoBaixado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEstornoBaixado = class(TForm)
    gpbNumeroPedido: TGroupBox;
    edtNPedido: TEdit;
    btnImprime: TSpeedButton;
    btnRetornar: TSpeedButton;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEstornoBaixado: TformEstornoBaixado;

implementation
uses ModuloDados, RelVendas, DB;

{$R *.DFM}

procedure TformEstornoBaixado.btnImprimeClick(Sender: TObject);
var
strCodCli : string;
Dias: Real;
DiasPagamento,PriD,SegD,DataEmissao:TDateTime;
Dia,Mes,Ano:Word;
begin
        dmBaseDados.tblPedidos.Filter     := '('+'NPedido = '+QuotedStr(edtNPedido.Text)+')';
        dmBaseDados.tblPedidos.Filtered   := True;
        strCodCli                         := FloatToStr(dmBaseDados.tblPedidosCodigoCliente.AsFloat);
        dmBaseDados.tblRelVendas.EmptyTable;
        dmBaseDados.tblRelVendas.Open;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCodCli';
        dmBaseDados.tblClientes.FindKey([strCodCli]);
           if (dmBaseDados.tblPedidosStatus.AsString <> '2') then
                begin
                if ((dmBaseDados.tblPedidosPagamento.AsString = 'BO') or (dmBaseDados.tblPedidosPagamento.AsString = 'TR')) then
                   begin
                    if Application.MessageBox('Clique em OK se for Estornar BONIFICAÇÃO OU TROCA','Estorno de BONIFICAÇÃO OU TROCA',
                                   MB_OKCANCEL)= IDOK then
                      begin
                        while ((not dmBaseDados.tblPedidos.Eof)and(dmBaseDados.tblPedidosNPedido.AsString=edtNPedido.Text)) do
                          begin
                            dmBaseDados.tblPedidos.Edit;
                            dmBaseDados.tblPedidosPagamento.AsString := '';
                            dmBaseDados.tblPedidos.Post;
                            dmBaseDados.tblPedidos.Next;
                          end;
                       dmBaseDados.tblClientes.IndexName := '';
                       dmBaseDados.tblPedidos.IndexName  := '';
                       dmBaseDados.tblPedidos.Filter     := '';
                       dmBaseDados.tblPedidos.Filtered   := False;
                       dmBaseDados.tblPedidos.Close;
                       dmBaseDados.tblRelVendas.Close;
                       dmBaseDados.tblClientes.Close;
                       dmBaseDados.tblPedidos.Close;
                      end;
                   end
                else
                  begin
                  Application.MessageBox('Pedido não baixado!','Atenção',MB_OK);
                  edtNPedido.Clear;
                  dmBaseDados.tblClientes.Close;
                  dmBaseDados.tblRelVendas.Close;
                  end
                end
           else
                begin
              {dmBaseDados.tblContasReceber.Open;
                while (not dmBaseDados.tblContasReceber.Eof ) do
                    begin
                      if(dmBaseDados.tblContasReceberNumeroDocumento.AsString=edtNPedido.Text)then //and(dmBaseDados.tblContasReceberMotorista.AsString='000')) then
                         begin
                           DataEmissao := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
                         end;
                     dmBaseDados.tblContasReceber.Next;
                    end;
              dmBaseDados.tblContasReceber.Close;}
            while (not dmBaseDados.tblPedidos.Eof) do
                begin
                   dmBasedados.tblRelVendas.Append;
                   dmBaseDados.tblRelVendasCodigoProduto.AsString:=
                   dmBaseDados.tblPedidosProduto.AsString;
                   dmBaseDados.tblRelVendasDescricao.AsString:=
                   dmBaseDados.tblPedidosDescricao.AsString;
                   dmBaseDados.tblRelVendasUnidade.AsString:=
                   dmBaseDados.tblPedidosUnidade.AsString;
                   dmBaseDados.tblRelVendasQuantidade.AsFloat :=
                   dmBaseDados.tblPedidosQuantidade.AsFloat;
                   dmBaseDados.tblRelVendasValorUnitario.AsFloat:=
                   dmBaseDados.tblPedidosUnitario.AsFloat;
                   dmBaseDados.tblRelVendasValorTotal.AsFloat:=
                   dmBaseDados.tblPedidosTotal.AsFloat;
                   dmBaseDados.tblRelVendasPeso.AsFloat:=
                   dmBaseDados.tblPedidosPeso.AsFloat;
                   dmBaseDados.tblRelVendasVencimento.AsDateTime:=
                   dmBaseDados.tblPedidosVencimento.AsDateTime;
                   dmBaseDados.tblPedidos.Edit;
                   dmBaseDados.tblPedidosStatus.AsString:='1';
                   //dmBaseDados.tblPedidosDataEmissao.AsDateTime := DataEmissao;
                   dmBaseDados.tblPedidos.Post;
                   dmBaseDados.tblRelVendas.Post;
                   dmBaseDados.tblPedidos.Next;
                 end;
                formRelVendas.rptVendas.Preview;
                dmBaseDAdos.tblRelVendas.Close;
                dmBaseDados.tblClientes.IndexName := '';
                dmBaseDados.tblPedidos.IndexName  := '';
                dmBaseDados.tblPedidos.Filter     := '';
                dmBaseDados.tblPedidos.Filtered   := False;
                dmBaseDados.tblPedidos.Close;
                dmBaseDados.tblClientes.Close;
                dmBaseDados.tblPedidos.Close;
                dmBaseDados.tblContasReceber.Open;
                while (not dmBaseDados.tblContasReceber.Eof ) do
                    begin
                      if(dmBaseDados.tblContasReceberNumeroDocumento.AsString=edtNPedido.Text)then //and(dmBaseDados.tblContasReceberMotorista.AsString='000')) then
                         begin
                           dmBaseDados.tblContasReceber.Edit;
                           DataEmissao := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
                           dmBaseDados.tblContasReceberDataBaixa.AsString := '';
                           dmBaseDados.tblContasReceberMotorista.AsString := '';
                           dmBaseDados.tblContasReceber.Post;
                         end;
                     dmBaseDados.tblContasReceber.Next;
                    end;
                dmBaseDados.tblContasReceber.Close;
               end;
        Close;
end;

procedure TformEstornoBaixado.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformEstornoBaixado.FormShow(Sender: TObject);
begin
   dmBaseDados.tblPedidos.Open;
   edtNPedido.Clear;
end;

procedure TformEstornoBaixado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Close;
end;

end.
