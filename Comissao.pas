unit Comissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Db, DBCtrls, DBTables, Buttons, Mask, ExtCtrls;

type
  TFrmComissao = class(TForm)
    Data1              : TDateTimePicker;
    Data2              : TDateTimePicker;
    Label1             : TLabel;
    Label2             : TLabel;
    Label3             : TLabel;
    bbtVisualizar      : TBitBtn;
    bbtSair            : TBitBtn;
    ckbTotal           : TCheckBox;
    ckbTodosVendedores : TCheckBox;
    Label4             : TLabel;
    edtCliente         : TEdit;
    Label5             : TLabel;
    edtFamilia         : TEdit;
    Label6             : TLabel;
    edtCategoria: TEdit;
    ckbTClientes       : TCheckBox;
    rbtAnalitico       : TRadioButton;
    rbtSintetico       : TRadioButton;
    pgrProcessamento   : TProgressBar;
    edtV1: TEdit;
    edtV2: TEdit;
    edtV3: TEdit;
    edtV4: TEdit;
    edtV5: TEdit;
    edtV6: TEdit;
    edtV7: TEdit;
    edtV8: TEdit;
    edtV9: TEdit;
    edtV10: TEdit;
    dblkVendedor: TDBLookupComboBox;
    ckbPorPedido: TCheckBox;
    rdbData: TRadioGroup;
    edtV11: TEdit;
    edtV12: TEdit;
    edtV13: TEdit;
    edtV14: TEdit;
    edtV15: TEdit;
    edtV16: TEdit;
    edtV17: TEdit;
    edtV18: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtSairClick(Sender: TObject);
    procedure bbtVisualizarClick(Sender: TObject);
    procedure ckbTodosVendedoresClick(Sender: TObject);
    procedure ckbTClientesClick(Sender: TObject);
    procedure edtCategoriaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmComissao    : TFrmComissao;
  strCodVendedor : String;
implementation

uses
        ModuloDados,RelComissao;

{$R *.DFM}

procedure TFrmComissao.FormShow(Sender: TObject);
begin
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblFuncionarios.Open;
Data1.SetFocus;
edtV1.Text                        := '000';
edtV2.Text                        := '000';
edtV3.Text                        := '000';
edtV4.Text                        := '000';
edtV5.Text                        := '000';
edtV6.Text                        := '000';
edtV7.Text                        := '000';
edtV8.Text                        := '000';
edtV9.Text                        := '000';
edtV10.Text                       := '000';
edtV11.Text                       := '000';
edtV12.Text                       := '000';
edtV13.Text                       := '000';
edtV14.Text                       := '000';
edtV15.Text                       := '000';
edtV16.Text                       := '000';
edtV17.Text                       := '000';
edtV18.Text                       := '000';
edtCategoria.Text                 := '000';
edtCliente.Text                   := '0000';
edtFamilia.Text                   := '000';
pgrProcessamento.Position         :=  0;
Screen.Cursor                     := CrHourGlass;
Data1.Date                        := Date-30;
Data2.Date                        := Date;
Screen.Cursor                     := CrDefault;
rbtAnalitico.Checked              := True;
ckbTodosVendedores.Checked        := False;
ckbTClientes.Checked              := False;
ckbTotal.Checked                  := False;
ckbPorPedido.Checked              := False;
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
end;

procedure TFrmComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBaseDados.tblPedidos.Close;
  dmBaseDados.tblFuncionarios.Close;
  dmBaseDados.tblClientes.Close;
end;

procedure TFrmComissao.bbtSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmComissao.bbtVisualizarClick(Sender: TObject);
var
strVendedor,strV1,strV2,strV3,strV4,strV5,strV6,strV7,strV8,strV9,strV10,
strV11,strV12,strV13,strV14,strV15,strV16,strV17,strV18,strV19,strV20,
strNPedido,strCliente,strCodCliente,strSubGrupo,strVendAnt :String;
DataEmissao :TDateTime;
dblTotalComissao,dblTotalVenda,dblQtde, SubTotal, SubComissao:Double;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblProdutos.Open;
//Se a opção "Todos Vendedores" estiver selecionada...
 if ckbTodosVendedores.Checked=True then
   begin
//...vai indexar por Vendedor e filtrar o período selecionado...
     dmBaseDados.tblPedidos.IndexName := 'IndVendedor';
     if rdbData.ItemIndex = 1 then
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')'

       end
     else
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')'
       end;
   end
//...se a opção "Todos Vendedores" não estiver selecionada...
 else
    begin
//...também será indexado pelo Vendedor, filtrando pelo período e pelo Vendedor, ou os Vendedores escolhidos.
     dmBaseDados.tblPedidos.IndexName := 'IndVendedor';
     strV1                            := edtV1.Text;
     strV2                            := edtV2.Text;
     strV3                            := edtV3.Text;
     strV4                            := edtV4.Text;
     strV5                            := edtV5.Text;
     strV6                            := edtV6.Text;
     strV7                            := edtV7.Text;
     strV8                            := edtV8.Text;
     strV9                            := edtV9.Text;
     strV10                           := edtV10.Text;
     strV11                           := edtV11.Text;
     strV12                           := edtV12.Text;
     strV13                           := edtV13.Text;
     strV14                           := edtV14.Text;
     strV15                           := edtV15.Text;
     strV16                           := edtV16.Text;
     strV17                           := edtV17.Text;
     strV18                           := edtV18.Text;
      if rdbData.ItemIndex = 1 then
       begin
         dmBaseDados.tblPedidos.Filter    := '(('+'CodigoVendedor = '+QuotedStr(strV1)+')or('+'CodigoVendedor = '+QuotedStr(strV2)+')or('+'CodigoVendedor = '+QuotedStr(strV3)+')or('+'CodigoVendedor = '+QuotedStr(strV4)+')or('+'CodigoVendedor = '+QuotedStr(strV5)+')or('+'CodigoVendedor = '+QuotedStr(strV6)+')or('+'CodigoVendedor = '+QuotedStr(strV7)+')or('+'CodigoVendedor = '+QuotedStr(strV8)+')or('+'CodigoVendedor = '+QuotedStr(strV9)+')or('+'CodigoVendedor = '+QuotedStr(strV10)+')or('+'CodigoVendedor = '+QuotedStr(strV11)+')or('+'CodigoVendedor = '+QuotedStr(strV12)+')or('+'CodigoVendedor = '+QuotedStr(strV13)+')or('+'CodigoVendedor = '+QuotedStr(strV14)+')or('+'CodigoVendedor = '+QuotedStr(strV15)+')or('+'CodigoVendedor = '+QuotedStr(strV16)+')or('+'CodigoVendedor = '+QuotedStr(strV17)+')or('+'CodigoVendedor = '+QuotedStr(strV18)+'))and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')';

       end
      else
       begin
         dmBaseDados.tblPedidos.Filter    := '(('+'CodigoVendedor = '+QuotedStr(strV1)+')or('+'CodigoVendedor = '+QuotedStr(strV2)+')or('+'CodigoVendedor = '+QuotedStr(strV3)+')or('+'CodigoVendedor = '+QuotedStr(strV4)+')or('+'CodigoVendedor = '+QuotedStr(strV5)+')or('+'CodigoVendedor = '+QuotedStr(strV6)+')or('+'CodigoVendedor = '+QuotedStr(strV7)+')or('+'CodigoVendedor = '+QuotedStr(strV8)+')or('+'CodigoVendedor = '+QuotedStr(strV9)+')or('+'CodigoVendedor = '+QuotedStr(strV10)+')or('+'CodigoVendedor = '+QuotedStr(strV11)+')or('+'CodigoVendedor = '+QuotedStr(strV12)+')or('+'CodigoVendedor = '+QuotedStr(strV13)+')or('+'CodigoVendedor = '+QuotedStr(strV14)+')or('+'CodigoVendedor = '+QuotedStr(strV15)+')or('+'CodigoVendedor = '+QuotedStr(strV16)+')or('+'CodigoVendedor = '+QuotedStr(strV17)+')or('+'CodigoVendedor = '+QuotedStr(strV18)+'))and('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')';


       end;
    end;
//Se a opção "Total de Clientes" for selecionada..
 if ckbTClientes.Checked = True then
   begin
//...vai indexar por Cliente e filtrar o período selecionado.
     dmBaseDados.tblPedidos.IndexName := 'IndCliente';
     if rdbData.ItemIndex = 1 then
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')';
       end
     else
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')' ;
       end;
   //Quando o campo 'Categoria' e o 1º campo dos Vendedores forem diferentes de '000'...
    //(Quando o campo 'Categoria' for diferente de '000', entrará na mesma rotina de "Total de Clientes").
     if (edtCategoria.Text <> '000')and(edtV1.Text <> '000') then
      begin
   //...vai indexar pelo Cliente e filtrar o Vendedor, Período, e Quantidade diferente de '0'.
       dmBaseDados.tblPedidos.IndexName := 'IndCliente';
     if rdbData.ItemIndex = 1 then
       begin
       dmBaseDados.tblPedidos.Filter    := '('+'CodigoVendedor = '+QuotedStr(strV1)+')and('+' Quantidade <>'+QuotedStr('0')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')' ;
       end
     else
       begin
       dmBaseDados.tblPedidos.Filter    := '('+'CodigoVendedor = '+QuotedStr(strV1)+')and('+' Quantidade <>'+QuotedStr('0')+')and('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')'  ;
       end;
      end;
   end;
dmBaseDados.tblPedidos.Filtered       := True;
dmBaseDados.tblLogMensal.Filtered     := True;
pgrProcessamento.Max                  := dmBaseDados.tblPedidos.RecordCount;
   while (not dmBaseDados.tblPedidos.Eof) do
    begin
     dblTotalComissao := 0;
     dblTotalVenda    := 0;
     dblQtde          := 0;
     dmBaseDados.tblLogMensal.Append;
     strCodVendedor   := dmBaseDados.tblPedidosCodigoVendedor.AsString;
//Quando estiver selecionado a opção "Todos Vendedores"...
      if ckbTodosVendedores.Checked=True then
        begin
          strVendedor := dmBaseDados.tblPedidosVendedor.AsString;
          DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
//...essa rotina somará enquanto o Vendedor for o mesmo, usada para listagem de "TODOS VENDEDORES".
           while (strVendedor = dmBaseDados.tblPedidosVendedor.AsString)and(not dmBaseDados.tblPedidos.Eof) do
             begin
                if(((edtCliente.Text   = '0000') or (edtCliente.Text   = dmBaseDados.tblPedidosCodigoCliente.AsString))
                and((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))) then
                  begin
                     if(edtCliente.Text = dmBaseDados.tblPedidosCodigoCliente.AsString) then
                      begin
                       FrmRelComissao.qrlCliente.Caption := edtCliente.Text;
                      end;
                     if(edtFamilia.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)) then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := edtFamilia.Text;
                      end;
                     if(edtCliente.Text = '0000') then
                      begin
                       FrmRelComissao.qrlCliente.Caption := 'Todos';
                      end;
                     if(edtFamilia.Text = '000') then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := 'Todas';
                      end;
                   dblTotalComissao := dblTotalComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblTotalVenda    := dblTotalVenda+dmBaseDados.tblPedidosTotal.AsFloat;
                   dblQtde          := dblQtde+dmBaseDados.tblPedidosQuantidade.AsFloat;
                  end;
              dmBaseDados.tblPedidos.Next;
              pgrProcessamento.Position := pgrProcessamento.Position+1;
             end;
//Aqui ele verifica se Total da Comissão, Total da Venda e a Quantidade são diferentes de '0'...
          if (dblTotalVenda <> 0) and (dblQtde <> 0) then
           begin
//...se for diferente de '0' ele alimentará a tabela LogMensal.
             dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dblTotalVenda;
             dmBaseDados.tblLogMensalSubtotal.AsFloat          := dblTotalComissao;
             dmBaseDados.tblLogMensalQuantidade.AsFloat        := dblQtde;
             dmBaseDados.tblLogMensalDescricao.AsString        := strVendedor;
             dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodVendedor;
           end;
        end
//Quando a opção 'Todos Vendedores' não for selecionada, e o 2º campo dos Vendedores for igual a '000'..
      else if (edtV2.Text = '000') then
        begin
          strNPedido  := dmBaseDados.tblPedidosNPedido.AsString;
          strCliente  := dmBaseDados.tblPedidosCodigoCliente.AsString;
          DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
//...essa rotina será usada quando for tirar listagem de apenas um vendedor,onde somará enquanto o "PEDIDO" for o mesmo.
           while (strNPedido = dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) do
             begin
                if(((edtCliente.Text   = '0000') or (edtCliente.Text   = dmBaseDados.tblPedidosCodigoCliente.AsString))
                and((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))) then
                  begin
                     if(edtCliente.Text = dmBaseDados.tblPedidosCodigoCliente.AsString) then
                      begin
                       FrmRelComissao.qrlCliente.Caption := edtCliente.Text;
                      end;
                     if(edtFamilia.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)) then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := edtFamilia.Text;
                      end;
                     if(edtCliente.Text = '0000') then
                      begin
                       FrmRelComissao.qrlCliente.Caption := 'Todos';
                      end;
                     if(edtFamilia.Text = '000') then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := 'Todas';
                      end;
                   dblTotalComissao := dblTotalComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblTotalVenda    := dblTotalVenda+dmBaseDados.tblPedidosTotal.AsFloat;
                   dblQtde          := dblQtde+dmBaseDados.tblPedidosQuantidade.AsFloat;
                  end;
              dmBaseDados.tblPedidos.Next;
              pgrProcessamento.Position := pgrProcessamento.Position+1;
             end;
//Aqui ele verifica se Total da Comissão, Total da Venda e a Quantidade são diferentes de '0'...
          if (dblTotalVenda <> 0) and (dblQtde <> 0) then
           begin
//...se for diferente de '0' ele alimentará a tabela LogMensal.
             dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dblTotalVenda;
             dmBaseDados.tblLogMensalSubtotal.AsFloat          := dblTotalComissao;
             dmBaseDados.tblLogMensalQuantidade.AsFloat        := dblQtde;
             dmBaseDados.tblLogMensalCodigoProduto.AsString    := strNPedido;
             dmBaseDados.tblClientes.FindKey([strCliente]);
             dmBaseDados.tblLogMensalDescricao.AsString:=
             dmBaseDados.tblClientesNomeCliente.AsString;
           end;
        end
//Se o 2º campo dos Vendedores for diferente de '000'..
      else
         begin
          strNPedido  := dmBaseDados.tblPedidosNPedido.AsString;
          strVendedor := dmBaseDados.tblPedidosVendedor.AsString;
          strCliente  := dmBaseDados.tblPedidosCodigoCliente.AsString;
          DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
//...essa rotina somará enquanto for o mesmo Vendedor, é usada para listagens de 2 ou até 10 Vendedores diferentes.
   if(ckbPorPedido.Checked = False)then
     begin
        while (strVendedor = dmBaseDados.tblPedidosVendedor.AsString)and(not dmBaseDados.tblPedidos.Eof) do
             begin
                if(((edtCliente.Text   = '0000') or (edtCliente.Text   = dmBaseDados.tblPedidosCodigoCliente.AsString))
                and((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))) then
                  begin
                     if(edtCliente.Text = dmBaseDados.tblPedidosCodigoCliente.AsString) then
                      begin
                       FrmRelComissao.qrlCliente.Caption := edtCliente.Text;
                      end;
                     if(edtFamilia.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)) then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := edtFamilia.Text;
                      end;
                     if(edtCliente.Text = '0000') then
                      begin
                       FrmRelComissao.qrlCliente.Caption := 'Todos';
                      end;
                     if(edtFamilia.Text = '000') then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := 'Todas';
                      end;
                   dblTotalComissao := dblTotalComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblTotalVenda    := dblTotalVenda+dmBaseDados.tblPedidosTotal.AsFloat;
                   dblQtde          := dblQtde+dmBaseDados.tblPedidosQuantidade.AsFloat;
                  end;
              dmBaseDados.tblPedidos.Next;
              pgrProcessamento.Position := pgrProcessamento.Position+1;
             end;
//Aqui ele verifica se Total da Comissão, Total da Venda e a Quantidade são diferentes de '0'...
          if {(dblTotalComissao <>0) and} (dblTotalVenda <> 0) and (dblQtde <> 0) then
           begin
//...se for diferente de '0' ele alimentará a tabela LogMensal.
             dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dblTotalVenda;
             dmBaseDados.tblLogMensalSubtotal.AsFloat          := dblTotalComissao;
             dmBaseDados.tblLogMensalQuantidade.AsFloat        := dblQtde;
             dmBaseDados.tblLogMensalDescricao.AsString        := strVendedor;
             dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodVendedor;
           end;
        end
        else
         begin
           while (strVendedor = dmBaseDados.tblPedidosVendedor.AsString)and(strNPedido = dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) do
             begin
                if(((edtCliente.Text   = '0000') or (edtCliente.Text   = dmBaseDados.tblPedidosCodigoCliente.AsString))
                and((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))) then
                  begin
                     if(edtCliente.Text = dmBaseDados.tblPedidosCodigoCliente.AsString) then
                      begin
                       FrmRelComissao.qrlCliente.Caption := edtCliente.Text;
                      end;
                     if(edtFamilia.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)) then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := edtFamilia.Text;
                      end;
                     if(edtCliente.Text = '0000') then
                      begin
                       FrmRelComissao.qrlCliente.Caption := 'Todos';
                      end;
                     if(edtFamilia.Text = '000') then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := 'Todas';
                      end;
                   FrmRelComissao.qrlNPedido_CodVendedor.Caption := 'Nº do Pedido';
                   dblTotalComissao := dblTotalComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblTotalVenda    := dblTotalVenda+dmBaseDados.tblPedidosTotal.AsFloat;
                   SubTotal         := SubTotal+dmBaseDados.tblPedidosTotal.AsFloat;
                   SubComissao      := SubComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblQtde          := dblQtde+dmBaseDados.tblPedidosQuantidade.AsFloat;
                  end;
              dmBaseDados.tblPedidos.Next;
              pgrProcessamento.Position := pgrProcessamento.Position+1;
             end;
//Aqui ele verifica se Total da Comissão, Total da Venda e a Quantidade são diferentes de '0'...
          if (dblTotalVenda <> 0) and (dblQtde <> 0) then
           begin
//...se for diferente de '0' ele alimentará a tabela LogMensal.
             dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
             if (strVendedor <> dmBaseDados.tblPedidosVendedor.AsString) then
             begin
               dmBaseDados.tblLogMensalValorDinheiro.AsFloat   := SubTotal;
               dmBaseDados.tblLogMensalValorCheque.AsFloat     := SubComissao;
               dmBaseDados.tblLogMensalObservacao.AsString     := strVendedor;
               SubTotal    := 0;
               SubComissao := 0;
             end;
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dblTotalVenda;
             dmBaseDados.tblLogMensalSubtotal.AsFloat          := dblTotalComissao;
             dmBaseDados.tblLogMensalQuantidade.AsFloat        := dblQtde;
             dmBaseDados.tblLogMensalCodigoProduto.AsString    := strNPedido;
             dmBaseDados.tblClientes.FindKey([strCliente]);
             dmBaseDados.tblLogMensalDescricao.AsString        := dmBaseDados.tblClientesNomeCliente.AsString;
             //SubTotal := 0;
           end;
       end;
     end;
//Quando a opção "Total de Clientes" estiver selecionada...
      if (ckbTClientes.Checked = True) then
        begin
          strNPedido  := dmBaseDados.tblPedidosNPedido.AsString;
          strCliente  := dmBaseDados.tblPedidosCodigoCliente.AsString;
          DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
          if ((dmBaseDados.tblProdutos.FindKey([dmBaseDados.tblPedidosProduto.AsString])))then
           begin
            strSubGrupo := dmBaseDados.tblProdutosSubGrupo.AsString;
           end;
//...essa rotina somará enquanto o "Cliente" for o mesmo.
           while (strCliente = dmBaseDados.tblPedidosCodigoCliente.AsString)and(not dmBaseDados.tblPedidos.Eof) do
             begin
                if(((edtCliente.Text   = '0000') or (edtCliente.Text   = dmBaseDados.tblPedidosCodigoCliente.AsString))
                and((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtV1.Text        =  '000') or (edtV1.Text        = dmBaseDados.tblPedidosCodigoVendedor.AsString))
                and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))) then
                  begin
                     if(edtCliente.Text = dmBaseDados.tblPedidosCodigoCliente.AsString) then
                      begin
                       FrmRelComissao.qrlCliente.Caption := edtCliente.Text;
                      end;
                     if(edtFamilia.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)) then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := edtFamilia.Text;
                      end;
                     if(edtCliente.Text = '0000') then
                      begin
                       FrmRelComissao.qrlCliente.Caption := 'Todos';
                      end;
                     if(edtFamilia.Text = '000') then
                      begin
                       FrmRelComissao.qrlFamilia.Caption := 'Todas';
                      end;
                   dblTotalComissao := dblTotalComissao+(dmBaseDados.tblPedidosTotal.AsFloat*(dmBaseDados.tblPedidosComissao.AsFloat/100));
                   dblTotalVenda    := dblTotalVenda+dmBaseDados.tblPedidosTotal.AsFloat;
                   dblQtde          := dblQtde+dmBaseDados.tblPedidosQuantidade.AsFloat;
                  end;
               dmBaseDados.tblPedidos.Next;
              pgrProcessamento.Position := pgrProcessamento.Position+1;
             end;
//Aqui ele verifica se Total da Comissão, Total da Venda e a Quantidade são diferentes de '0'...
          if (dblTotalVenda <> 0) and (dblQtde <> 0) then
           begin
//...se for diferente de '0' ele alimentará a tabela LogMensal.
             dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
             dmBaseDados.tblLogMensalSubtotal.AsFloat          := dblTotalComissao;
             dmBaseDados.tblLogMensalQuantidade.AsFloat        := dblQtde;
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dblTotalVenda;
             dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCliente;
             dmBaseDados.tblClientes.FindKey([strCliente]);
             dmBaseDados.tblLogMensalDescricao.AsString:=
             dmBaseDados.tblClientesNomeCliente.AsString;
           end;
         end;
//Se ValorLancamento, SubTotal e Qtde da tabela LogMensal forem diferentes de 0, ele gravará na tabela LogMensal.
         if (dmBaseDados.tblLogMensalValorLancamento.AsFloat <> 0) and (dmBaseDados.tblLogMensalSubtotal.AsFloat <> 0) and (dmBaseDados.tblLogMensalQuantidade.AsFloat <> 0 ) then
          begin
           dmBaseDados.tblLogMensal.Post;
          end;
      end;
dmBaseDados.tblLogMensal.First;
strVendAnt  := dmBaseDados.tblLogMensalObservacao.AsString;
//SubTotal    := 0;
//SubComissao := 0;
while (not dmBaseDados.tblLogmensal.Eof) do
 begin
    strVendedor := dmBaseDados.tblPedidosVendedor.AsString;
    SubTotal    := SubTotal + dmBaseDados.tblLogMensalValorDinheiro.AsFloat;
    SubComissao := SubComissao + dmBaseDados.tblLogMensalValorCheque.AsFloat;
    dmBaseDados.tblLogMensal.Next;
  if edtV2.Text <> '000' then
   begin
     if (strVendAnt <>dmBaseDados.tblLogMensalObservacao.AsString)then
      begin
       dmBaseDados.tblLogMensal.Last;
       dmBaseDados.tblLogMensal.Edit;
       dmBaseDados.tblLogMensalValorDinheiro.AsFloat := SubTotal;
       dmBaseDados.tblLogMensalValorCheque.AsFloat   := SubComissao;
       dmBaseDados.tblLogMensalObservacao.AsString   := dmBaseDados.tblPedidosVendedor.AsString;
       dmBaseDados.tblLogMensal.Post;
       SubTotal    := 0;
       SubComissao := 0;
       strVendedor := '';
       strVendAnt  := dmBaseDados.tblLogMensalObservacao.AsString;
      end;
   end;
  end;
 if edtV2.Text <> '000' then
  begin
   dmBaseDados.tblLogMensal.Last;
   dmBaseDados.tblLogMensal.Edit;
   dmBaseDados.tblLogMensalValorDinheiro.AsFloat := SubTotal;
   dmBaseDados.tblLogMensalValorCheque.AsFloat   := SubComissao;
   dmBaseDados.tblLogMensalObservacao.AsString   := dmBaseDados.tblPedidosVendedor.AsString;
   dmBaseDados.tblLogMensal.Post;
 end;
FrmRelComissao.qrpRelComissao.Preview;
dmBaseDados.tblPedidos.Filter    :='';
dmBaseDados.tblPedidos.Filtered  :=False;
dmBaseDados.tblPedidos.IndexName :='';
FrmComissao.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblProdutos.Close;
end;

procedure TFrmComissao.ckbTodosVendedoresClick(Sender: TObject);
begin
   if ckbTodosVendedores.Checked = True then
    begin
      edtV1.Enabled  := False;
      edtV2.Enabled  := False;
      edtV3.Enabled  := False;
      edtV4.Enabled  := False;
      edtV5.Enabled  := False;
      edtV6.Enabled  := False;
      edtV7.Enabled  := False;
      edtV8.Enabled  := False;
      edtV9.Enabled  := False;
      edtV10.Enabled := False;
      edtV11.Enabled := False;
      edtV12.Enabled := False;
      edtV13.Enabled := False;
      edtV14.Enabled := False;
      edtV15.Enabled := False;
      edtV16.Enabled := False;
      edtV17.Enabled := False;
      edtV18.Enabled := False;
    end
   else
    begin
      edtV1.Enabled  := True;
      edtV2.Enabled  := True;
      edtV3.Enabled  := True;
      edtV4.Enabled  := True;
      edtV5.Enabled  := True;
      edtV6.Enabled  := True;
      edtV7.Enabled  := True;
      edtV8.Enabled  := True;
      edtV9.Enabled  := True;
      edtV10.Enabled := True;
      edtV11.Enabled := True;
      edtV12.Enabled := True;
      edtV13.Enabled := True;
      edtV14.Enabled := True;
      edtV15.Enabled := True;
      edtV16.Enabled := True;
      edtV17.Enabled := True;
      edtV18.Enabled := True;
    end;
end;

procedure TFrmComissao.ckbTClientesClick(Sender: TObject);
begin
   if ckbTClientes.Checked = True then
    begin
      ckbTodosVendedores.Enabled := False;
    end
   else
    begin
      ckbTodosVendedores.Enabled := True ;
    end;
end;

procedure TFrmComissao.edtCategoriaChange(Sender: TObject);
begin
if edtCategoria.Text <> '000' then
 begin
  ckbTClientes.Checked := True;
 end;
end;

end.


