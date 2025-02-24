unit PedidosNaoBaixados;

interface                                        

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Mask, Buttons, ComCtrls, TISButton, TIGradientCaption, TIGradient;

type
  TformPedidosNaoBaixados = class(TForm)
    lblVendedor: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    mskVendedor: TMaskEdit;
    TIGradient1: TTIGradient;
    Label1: TLabel;
    Label2: TLabel;
    TIGradientCaption1: TTIGradientCaption;
    btGera: TTISButton;
    btnImprimir: TTISButton;
    ckbTodos: TTISRadioButton;
    ckbOrc: TTISRadioButton;
    ckbBaixado: TTISRadioButton;
    edtCliente: TEdit;
    Label3: TLabel;
    procedure btGeraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formPedidosNaoBaixados: TformPedidosNaoBaixados;

implementation

uses ModuloDados, RelPedidosEstornados, DB, SelecCliente;


{$R *.DFM}


procedure TformPedidosNaoBaixados.btGeraClick(Sender: TObject);
var strNPedido, strCliente, strNomeVend,
    strVendedor, strFormaPgto : String;
    Valor,codCli, fltDH, fltCT, fltCV,
    fltCP, fltTR, fltVL, fltBO, fltAB, Desconto : Double;
    DataEmissao : TDateTime;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblPedidos.Open;
IF (edtCliente.Text = '0000') then
  BEGIN
   If (ckbBaixado.Checked = True) then
    Begin
     if (mskVendedor.Text =  '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('1')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
     if (mskVendedor.Text <> '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('1')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+') and ('+ 'CodigoVendedor ='+mskVendedor.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
    End;
   If (ckbOrc.Checked = True) then
    Begin
     if (mskVendedor.Text =  '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('3')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
     if (mskVendedor.Text <> '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('3')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodigoVendedor ='+mskVendedor.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
    End;
  END
ELSE
  BEGIN
   If (ckbBaixado.Checked = True) then
    Begin
     if (mskVendedor.Text =  '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('1')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodigoCliente ='+edtCliente.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
     if (mskVendedor.Text <> '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('1')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodigoVendedor ='+mskVendedor.Text+')and('+ 'CodigoCliente ='+edtCliente.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
    End;
   If (ckbOrc.Checked = True) then
    Begin
     if (mskVendedor.Text =  '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('3')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodigoCliente ='+edtCliente.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
     if (mskVendedor.Text <> '000') then
      begin
       dmBaseDados.tblPedidos.Filter   := '('+'Status ='+QuotedStr('3')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'CodigoVendedor ='+mskVendedor.Text+')and('+ 'CodigoCliente ='+edtCliente.Text+')';
       dmBaseDados.tblPedidos.Filtered := True;
      end;
    End;
  END;
while (not dmBaseDados.tblPedidos.Eof) do
  BEGIN
   Valor      := 0;
   Desconto   := 0;
   strNPedido := dmBaseDados.tblPedidosNPedido.AsString;
   while( (strNPedido = dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) )do
    begin
     Valor        := Valor+dmBaseDados.tblPedidosTotal.AsFloat;
     codCli       := dmBaseDados.tblPedidosCodigoCliente.AsInteger;
     strVendedor  := dmBaseDados.tblPedidosCodigoVendedor.AsString;
     strNomeVend  := dmBaseDados.tblPedidosVendedor.AsString;
     DataEmissao  := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
     strFormaPgto := dmBaseDados.tblPedidosPagamento.AsString;
     {fltDH        := dmBaseDados.tblPedidosDH.Value;
     fltCT        := dmBaseDados.tblPedidosCT.Value;
     fltCV        := dmBaseDados.tblPedidosCV.Value;
     fltCP        := dmBaseDados.tblPedidosCP.Value;
     fltTR        := dmBaseDados.tblPedidosTR.Value;
     fltVL        := dmBaseDados.tblPedidosVL.Value;
     fltBO        := dmBaseDados.tblPedidosBO.Value;
     fltAB        := dmBaseDados.tblPedidosAB.Value; }
     Desconto     := dmBaseDados.tblPedidosDesconto.AsFloat;
     dmBaseDados.tblPedidos.Next;
    end;
   dmBaseDados.tblClientes.Open;
   dmBaseDados.tblClientes.Locate('CodigoCliente',codCli,[loCaseInsensitive]);
   strCliente   := dmBaseDados.tblClientesNomeCliente.AsString;
   dmBaseDados.tblClientes.Close;
   dmBaseDados.tblLogMensal.Append;
   dmBaseDados.tblLogMensalDocumento.AsString        := strNPedido;
   dmBaseDados.tblLogMensalCodigoProduto.AsString    := strVendedor;
   dmBaseDados.tblLogMensalObservacao.AsString       := strVendedor +'  '+ strNomeVend;
   //dmBaseDados.tblLogMensalNCM.AsString              := FloatToStr(codCli);
   dmBaseDados.tblLogMensalDescricao.AsString        := strCliente;
   dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
   dmBaseDados.tblLogMensalUnidadeMedida.AsString    := strFormaPgto;
   Valor := Valor - Desconto;
   if (strFormaPgto = 'DH') then
    begin
     dmBaseDados.tblLogMensalValorDinheiro.AsFloat := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   {if (strFormaPgto = 'CV') then
    begin
     dmBaseDados.tblLogMensalValorCheque.AsFloat   := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'CP') then
    begin
     dmBaseDados.tblLogMensalQuantidade.AsFloat    := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'CT') then
    begin
     dmBaseDados.tblLogMensalTroco.AsFloat         := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'EC') then
    begin
     dmBaseDados.tblLogMensalEcommerce.AsFloat     := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'VL') then
    begin
     dmBaseDados.tblLogMensalValorCobranca.AsFloat := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'TR') then
    begin
     dmBaseDados.tblLogMensalTroca.AsFloat         := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'BO') then
    begin
     dmBaseDados.tblLogMensalEmprestimo.AsFloat    := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if (strFormaPgto = 'AB') then
    begin
     dmBaseDados.tblLogMensalDevolucao.AsFloat     := Valor;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := Valor;
    end;
   if( (strFormaPgto = 'PM')and(fltDH <> 0) )then
    begin
     dmBaseDados.tblLogMensalValorDinheiro.AsFloat := dmBaseDados.tblLogMensalValorDinheiro.AsFloat + fltDH;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltDH;
    end;
   if( (strFormaPgto = 'PM')and(fltCT <> 0) )then
    begin
     dmBaseDados.tblLogMensalTroco.AsFloat    := dmBaseDados.tblLogMensalTroco.AsFloat + fltCT;
     dmBaseDados.tblLogMensalSubtotal.AsFloat := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltCT;
    end;
   if( (strFormaPgto = 'PM')and(fltCV <> 0) )then
    begin
     dmBaseDados.tblLogMensalValorCheque.AsFloat := dmBaseDados.tblLogMensalValorCheque.AsFloat + fltCV;
     dmBaseDados.tblLogMensalSubtotal.AsFloat    := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltCV;
    end;
   if( (strFormaPgto = 'PM')and(fltCP <> 0) )then
    begin
     dmBaseDados.tblLogMensalQuantidade.AsFloat := dmBaseDados.tblLogMensalQuantidade.AsFloat + fltCP;
     dmBaseDados.tblLogMensalSubtotal.AsFloat   := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltCP;
    end;
   if( (strFormaPgto = 'PM')and(fltTR <> 0) )then
    begin
     dmBaseDados.tblLogMensalTroca.AsFloat    := dmBaseDados.tblLogMensalTroca.AsFloat + fltTR;
     dmBaseDados.tblLogMensalSubtotal.AsFloat := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltTR;
    end;
   if( (strFormaPgto = 'PM')and(fltVL <> 0) )then
    begin
     dmBaseDados.tblLogMensalValorCobranca.AsFloat := dmBaseDados.tblLogMensalValorCobranca.AsFloat + fltVL;
     dmBaseDados.tblLogMensalSubtotal.AsFloat      := dmBaseDados.tblLogMensalSubtotal.AsFloat + fltVL;
    end;}
   dmBaseDados.tblLogMensal.Post;
  END; // end do while
  if (ckbBaixado.Checked = True) then
   begin
    formRelPedidosEstornados.qrlTitulo.Caption     := 'Relatório de Pedidos / Vendas';
   end
  else
   begin
    formRelPedidosEstornados.qrlTitulo.Caption     := 'Relatório de Orçamentos';
   end;
formRelPedidosEstornados.qrlDataTitulo.Caption := 'Período de '+DateToStr(formPedidosNaoBaixados.Data1.Date)+' à '+DateToStr(formPedidosNaoBaixados.Data2.Date);
formRelPedidosEstornados.qrpPedidosEstornados.Preview;
dmBaseDados.tblPedidos.Filter   := '';
dmBaseDados.tblPedidos.Filtered := False;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblLogMensal.Close;
Close;
end;

procedure TformPedidosNaoBaixados.FormShow(Sender: TObject);
begin
ckbBaixado.Checked := True;
Screen.Cursor      := CrHourGlass;
Data1.Date         := Date;
Data2.Date         := Date;
Screen.Cursor      := CrDefault;
mskVendedor.Text   := '000';
edtCliente.Text    := '0000';
end;

procedure TformPedidosNaoBaixados.btnImprimirClick(Sender: TObject);
begin
dmBaseDados.tblPedidos.Filter   := '';
dmBaseDados.tblPedidos.Filtered := False;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblLogMensal.Close;
Close;
end;

procedure TformPedidosNaoBaixados.edtClienteClick(Sender: TObject);
begin
formSelecCliente.ShowModal;
edtCliente.Text := IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
edtCliente.SetFocus;
dmBaseDados.tblClientes.Close;
end;

end.
