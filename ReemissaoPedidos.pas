unit ReemissaoPedidos;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, Grids, DBGrids, StdCtrls, Buttons, Qrctrls, QuickRpt,
     ExtCtrls, Mask, TISButton, TIGradientCaption, TIGradient;

type
  TFormReemissaoPedidos = class(TForm)
    edtNumeroPedido: TEdit;
    TIGradientCaption1: TTIGradientCaption;
    ckbImprimir: TTISCheckBox;
    TIGradient1: TTIGradient;
    btnImprime: TTISButton;
    btnImprimir: TTISButton;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure edtNumeroPedidoExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FormReemissaoPedidos: TFormReemissaoPedidos;

implementation

uses ModuloDados,RelVendas,Estorno, Integracao, DB, RotinasGerais;


{$R *.DFM}


procedure TFormReemissaoPedidos.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TFormReemissaoPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//dmBaseDados.qryPedidos.IndexName := '';
dmBaseDados.qryPedidos.Close;
Close;
end;

procedure TFormReemissaoPedidos.FormShow(Sender: TObject);
begin
//dmBaseDados.tblPedidos.Open;
//dmBaseDados.tblPedidos.IndexName := 'IndNPedido';
edtNumeroPedido.Clear;
edtNumeroPedido.SetFocus;
end;

procedure TFormReemissaoPedidos.btnImprimeClick(Sender: TObject);
var strData, strVendedor, str0NPed,
    strCodCli, strNPedido, strDataPed, strNomeCli : String;
    DiasPagamento, PriD, SegD : TDateTime;
    strTotal,strQtde          : Double;
    Dia,Mes,Ano               : Word;
    PortaLPT                  : TextFile;
    Dias                      : Real;
begin
str0NPed := LRPad(edtNumeroPedido.Text,8,'0','L');
edtNumeroPedido.Text := str0NPed;
//dmBaseDados.tblPedidos.Filter   := '('+'NPedido = '+QuotedStr(edtNumeroPedido.Text)+')and('+'Status <>'+QuotedStr('0')+')';
//dmBaseDados.tblPedidos.Filtered := True;

dmBaseDados.qryPedidos.Close;
dmBaseDados.qryPedidos.SQL.Text := 'SELECT * FROM Pedidos WHERE (NPedido = "'+edtNumeroPedido.Text+'")AND(Status <> "0")';
dmBaseDados.qryPedidos.Open;

strCodCli:=FloatToStr(dmBaseDados.qryPedidosCodigoCliente.AsFloat);
dmBaseDados.tblRelVendas.Close;
dmBaseDados.tblRelVendas.EmptyTable;
dmBaseDados.tblRelVendas.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
dmBaseDados.tblClientes.FindKey([strCodCli]);
if (dmBaseDados.qryPedidosStatus.AsString < '1') then
  BEGIN
   Application.MessageBox('Pedido Estornado e/ou Troca','Atenção',MB_OK);
   edtNumeroPedido.Clear;
   dmBaseDados.tblClientes.Close;
   dmBaseDados.tblRelVendas.Close;
  END
else
  BEGIN
   while (not dmBaseDados.qryPedidos.Eof) do
     begin
      dmBasedados.tblRelVendas.Append;
      dmBaseDados.tblRelVendasCodigoProduto.AsString := dmBaseDados.qryPedidosProduto.AsString;
      dmBaseDados.tblRelVendasRefFabricante.AsString := dmBaseDados.qryPedidosCodigoReferencia.AsString;
      dmBaseDados.tblRelVendasDescricao.AsString     := dmBaseDados.qryPedidosDescricao.AsString;
      dmBaseDados.tblRelVendasUnidade.AsString       := dmBaseDados.qryPedidosUnidade.AsString;
      dmBaseDados.tblRelVendasQuantidade.AsFloat     := dmBaseDados.qryPedidosQuantidade.AsFloat;
      dmBaseDados.tblRelVendasValorUnitario.AsFloat  := dmBaseDados.qryPedidosUnitario.AsFloat;
      dmBaseDados.tblRelVendasValorTotal.AsFloat     := dmBaseDados.qryPedidosTotal.AsFloat;
      dmBaseDados.tblRelVendasPeso.AsFloat           := dmBaseDados.qryPedidosPeso.AsFloat;
      dmBaseDados.tblRelVendasVencimento.AsDateTime  := dmBaseDados.qryPedidosVencimento.AsDateTime;
      dmBaseDados.tblRelVendas.Post;
      strTotal    := strTotal + dmBaseDados.tblRelVendasValorTotal.AsFloat;
      strQtde     := strQtde  + dmBaseDados.tblRelVendasQuantidade.AsFloat;
      strNPedido  := dmBaseDados.qryPedidosNPedido.AsString;
      strVendedor := dmBaseDados.qryPedidosCodigoVendedor.AsString +'  '+ dmBaseDados.qryPedidosVendedor.AsString;
      strDataPed  := dmBaseDados.qryPedidosDataEmissao.AsString;
      strNomeCli  := dmBaseDados.qryPedidosNomeCli.AsString;
      dmBaseDados.qryPedidos.Next;
     end;
   formRelVendas.rptVendas.Preview;
   strData := (DateToStr(Date))+'  '+TimeToStr(Time);
   if (ckbImprimir.Checked = True) then
     BEGIN
      //****IMPRESSÃO DIRETA PARA PORTA LPT1****
      AssignFile(PortaLPT, 'LPT2:');
      Rewrite(PortaLPT);
      try
        Writeln(PortaLPT, '================================================');
        Writeln(PortaLPT, #14+'        AUTO PECAS PERFIL                   ');
        Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco      ');
        Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568      ');
        Writeln(PortaLPT, '================================================');
        Writeln(PortaLPT, ' N. Orcamento : ' +strNPedido);
        Writeln(PortaLPT, ' Data do Pedido: '+ strDataPed);
        Writeln(PortaLPT, ' Vendedor : '+strVendedor);
        Writeln(PortaLPT, ' Cliente  : '+strNomeCli);
        //Writeln(PortaLPT, ' Pagamento : '+strFPgto);
        //Writeln(PortaLPT, '  *Recibo Nao Fiscal. Exija seu Cupom Fiscal!*  ');
        Writeln(PortaLPT, '================================================');
        Writeln(PortaLPT, 'Codigo \ Descricao');
        Writeln(PortaLPT, '                      Qtde     V.Unit.   V.Total');
        Writeln(PortaLPT, '================================================');
      finally
      dmBaseDados.tblRelVendas.FIRST;
      while (not dmBaseDados.tblRelVendas.Eof) do
        begin
         writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+ '   '+ dmBaseDados.tblRelVendasDescricao.AsString);
         writeln(PortaLPT, '                   '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
         +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
         +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
         dmBaseDados.tblRelVendas.Next;
        end;
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
      Writeln(PortaLPT, '             TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',strTotal)));
      //Writeln(PortaLPT, '             VALOR BRUTO   :  '+(FormatCurr('###,##0.00',strVBruto)));
      // Writeln(PortaLPT, '             DESCONTO      :  '+(FormatCurr('###,##0.00',strDesconto)) );
      Writeln(PortaLPT, '             VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',strTotal)));
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, '*** Agradecemos a Preferencia. Volte Sempre! ***');
      Writeln(PortaLPT, '================================================');
      Writeln(PortaLPT, '');
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
     END;
   if (dmBaseDados.qryPedidosStatus.AsString = '1') then
    begin
     if (Application.MessageBox('CONFIRMA O ESTORNO DO PEDIDO?','Estorno de Pedido?',MB_YESNO)= IDYES) then
      begin
       formEstornoPedido.ShowModal;
       edtNumeroPedido.Clear;
      end;
    end;
  END;
dmBaseDados.tblRelVendas.Close;  
edtNumeroPedido.SetFocus;
dmBaseDados.tblClientes.IndexName := '';
dmBaseDados.qryPedidos.Filter     := '';
dmBaseDados.qryPedidos.Filtered   := False;
//dmBaseDados.qryPedidos.IndexName  := '';
Close;
end;

procedure TFormReemissaoPedidos.edtNumeroPedidoExit(Sender: TObject);
var str0NPed : String;
begin
str0NPed := LRPad(edtNumeroPedido.Text,8,'0','L');
edtNumeroPedido.Text := str0NPed;
end;

procedure TFormReemissaoPedidos.btnImprimirClick(Sender: TObject);
begin
Close;
end;

end.
