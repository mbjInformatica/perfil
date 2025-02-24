unit ReemicaoPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Qrctrls, QuickRpt, ExtCtrls;

type
  TFormReemicaoPedidos = class(TForm)
    gpbNumeroPedido : TGroupBox;
    edtNumeroPedido : TEdit;
    btnRetornar     : TSpeedButton;
    btnImprime      : TSpeedButton;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReemicaoPedidos: TFormReemicaoPedidos;

implementation

Uses
    ModuloDados,RelVendas,Estorno, Integracao, DB;
{$R *.DFM}

procedure TFormReemicaoPedidos.btnRetornarClick(Sender: TObject);
begin
     Close;
end;

procedure TFormReemicaoPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmBaseDados.tblPedidos.IndexName := '';
        dmBaseDados.tblPedidos.Close;
        Close;
end;

procedure TFormReemicaoPedidos.FormShow(Sender: TObject);
begin
        FormReemicaoPedidos.Caption      := 'Reemição de Pedidos/Estornos';
        dmBaseDados.tblPedidos.Open;
        dmBaseDados.tblPedidos.IndexName := 'IndNPedido';
end;

procedure TFormReemicaoPedidos.btnImprimeClick(Sender: TObject);
var
   strCodCli : string;
   Dias: Real;
   DiasPagamento,PriD,SegD:TDateTime;
   Dia,Mes,Ano:Word;
   strNPedido,strData,strVendedor: string;
   strTotal,strQtde : Double;
   PortaLPT : TextFile;
begin
        dmBaseDados.tblPedidos.Filter     := '('+'NPedido = '+QuotedStr(edtNumeroPedido.Text)+')and('+'Status <>'+QuotedStr('0')+')';
        dmBaseDados.tblPedidos.Filtered   := True;
        strCodCli:=FloatToStr(dmBaseDados.tblPedidosCodigoCliente.AsFloat);
        dmBaseDados.tblRelVendas.EmptyTable;
        dmBaseDados.tblRelVendas.Open;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCodCli';
        dmBaseDados.tblClientes.FindKey([strCodCli]);
        if (dmBaseDados.tblPedidosStatus.AsString < '1') then
                Begin
                Application.MessageBox('Pedido Estornado e/ou Troca','Atenção',MB_OK);
                edtNumeroPedido.Clear;
                dmBaseDados.tblClientes.Close;
                dmBaseDados.tblRelVendas.Close;
                end
        else
                begin
                while (not dmBaseDados.tblPedidos.Eof) do
                begin
                dmBasedados.tblRelVendas.Append;
                dmBaseDados.tblRelVendasCodigoProduto.AsString:=
                dmBaseDados.tblPedidosProduto.AsString;
                dmBaseDados.tblRelVendasRefFabricante.AsString :=
                dmBaseDados.tblPedidosCodigoReferencia.AsString;
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
                dmBaseDados.tblRelVendas.Post;
                strTotal := strTotal + dmBaseDados.tblRelVendasValorTotal.AsFloat;
                strQtde  := strQtde  + dmBaseDados.tblRelVendasQuantidade.AsFloat;
                strNPedido := dmBaseDados.tblPedidosNPedido.AsString;
                strVendedor := dmBaseDados.tblPedidosCodigoVendedor.AsString +'  '+ dmBaseDados.tblPedidosVendedor.AsString;
                dmBaseDados.tblPedidos.Next;
                end;
                //formRelVendas.rptVendas.Preview;
strData     := (DateToStr(Date))+'  '+TimeToStr(Time);
//****IMPRESSÃO DIRETA PARA PORTA LPT1****

    AssignFile(PortaLPT, 'LPT1:');
    Rewrite(PortaLPT);
    try
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, #14+'     JL AUTO PECAS      ');
      Writeln(PortaLPT, '  Av.Joao Ventura dos Santos, 136 Jd. Baronesa  ');
      Writeln(PortaLPT, '           Tel.: 3686-0377 \ 3687-739           ');
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, 'N. Orcamento : ' +strNPedido+'     '+strData);
      Writeln(PortaLPT, 'Vendedor : '+strVendedor);
      Writeln(PortaLPT, 'Cliente  : '+dmbaseDados.tblPedidosCodigoCliente.AsString);
      //Writeln(PortaLPT, '  *Recibo Nao Fiscal. Exija seu Cupom Fiscal!*  ');
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, 'Codigo \ Descricao');
      Writeln(PortaLPT, '                  Qtde     V.Unit.   V.Total');
      Writeln(PortaLPT, '================================================');
    finally
    dmBaseDados.tblRelVendas.FIRST;
   while (not dmBaseDados.tblRelVendas.Eof) do
    begin
      writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+' '+dmBaseDados.tblRelVendasDescricao.AsString);
      writeln(PortaLPT, '                   '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
      +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
      +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
      dmBaseDados.tblRelVendas.Next;
     end;
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, 'Total de Itens : '+ FloatToStr(strQtde));
      Writeln(PortaLPT, '               TOTAL A PAGAR  :      '+(FormatCurr('###,##0.00',strTotal)));
      //Writeln(PortaLPT, '             V. RECEBIDO  : '+(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorRecebido.AsCurrency)));
      //Writeln(PortaLPT, '             TROCO        : '+(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasTroco.AsCurrency)));
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, '*** Agradecemos a Preferencia. Volte Sempre! ***');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      Writeln(PortaLPT, '');
      CloseFile(PortaLPT);
    end;

//****FIM DA IMPRESSÃO****

                dmBaseDAdos.tblRelVendas.Close;
                if (dmBaseDados.tblPedidosStatus.AsString >= '1') then
                        if Application.MessageBox('Clique em OK se for ESTORNAR!','Estorno de Pedido',
                                   MB_OKCANCEL)= IDOK then
                        formEstornoPedido.ShowModal;
                edtNumeroPedido.Clear;
        end;
        edtNumeroPedido.SetFocus;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblPedidos.IndexName  := '';
        Close;
       // dmBaseDados.tblPedidos.Filter     := '';
       // dmBaseDados.tblPedidos.Filtered   := False;
end;

end.
