unit BonificacaoTroca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, Buttons, ComCtrls, db;

type
  TFormBonificacaoTroca = class(TForm)
    rdgSelecao       : TRadioGroup;
    btbProsseguir    : TBitBtn;
    btbSair          : TBitBtn;
    edtVendedor      : TEdit;
    Label1           : TLabel;
    lblDtI           : TLabel;
    lblDtF           : TLabel;
    Data1            : TDateTimePicker;
    Data2            : TDateTimePicker;
    pgrProcessamento : TProgressBar;
    Label2: TLabel;
    edtFornecedor: TEdit;
    ckbTodosVendedores: TCheckBox;
    ckbTodosFornecedores: TCheckBox;
    Label3: TLabel;
    edtCliente: TEdit;
    ckbTodosClientes: TCheckBox;
    procedure btbProsseguirClick(Sender: TObject);
    procedure btbSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbTodosVendedoresClick(Sender: TObject);
    procedure ckbTodosFornecedoresClick(Sender: TObject);
    procedure ckbTodosClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBonificacaoTroca: TFormBonificacaoTroca;

implementation

uses
  RelBonificacaoTroca, ModuloDados, RelVendas;

{$R *.DFM}

procedure TFormBonificacaoTroca.btbProsseguirClick(Sender: TObject);
var
intproduto,strNPedido,strproduto:String;

dblSoma:Double;
begin
        dmBaseDados.tblFamilias.open;
        //strproduto := dmBaseDados.tblPedidosProduto.AsString;
        //intproduto       := copy(strproduto,1,3);
        dmBaseDados.tblPedidos.Open;
        dmBaseDados.tblLogMensal.EmptyTable;
        dmBaseDados.tblLogMensal.Open;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCodCli';
        dmBaseDados.tblPedidos.IndexName  := 'IndDataEmissao';
    //*****RELATÓRIO DE BONIFICAÇÃO*****

//Quandor for tirar Relatório de BONIFICAÇÃO de Todos Vendedores e Fornecedores...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosVendedores.Checked = True)and(ckbTodosFornecedores.Checked = True)and(ckbTodosClientes.Checked = True)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado VENDEDOR e todos fornecedores e clientes...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosVendedores.Checked = False) then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado FORNECEDOR e todos vendedores e clientes...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')';//and('+'(copy(produto,1,3)) ='+(edtFornecedor.text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
             //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado CLIENTE e todos vendedores e fornecedores...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosClientes.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado FORNECEDOR e determinado VENDEDOR...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosVendedores.Checked = False)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado FORNECEDOR e determinado CLIENTE...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosClientes.Checked = False)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de BONIFICAÇÃO de determinado VENDEDOR e determinado CLIENTE...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosClientes.Checked = False)and(ckbTodosVendedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for Relatório de BONIFICAÇÃO de determinado VENDEDOR, CLIENTE, FORNECEDOR...
        if (rdgSelecao.ItemIndex = 0)and(ckbTodosClientes.Checked = False)and(ckbTodosFornecedores.Checked = False)and(ckbTodosVendedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('BO')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
           // dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            // dmBaseDados.tblFamilias.Filtered := True;
          end;

    //*****RELATÓRIO DE TROCA*****

//Quandor for tirar Relatório de TROCA de Todos Vendedores e Fornecedores...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosVendedores.Checked = True)and(ckbTodosFornecedores.Checked = True)and(ckbTodosClientes.Checked = True)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado VENDEDOR e todos fornecedores e clientes...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosVendedores.Checked = False) then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado FORNECEDOR e todos vendedores e clientes...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')';//and('+'CodigoFamilia ='+QuotedStr(edtFornecedor.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado CLIENTE e todos vendedores e fornecedores...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosClientes.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado FORNECEDOR e determinado VENDEDOR...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosVendedores.Checked = False)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado FORNECEDOR e determinado CLIENTE...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosClientes.Checked = False)and(ckbTodosFornecedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;
//Quando for tirar Relatório de TROCA de determinado VENDEDOR e determinado CLIENTE...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosClientes.Checked = False)and(ckbTodosVendedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
          end;
//Quando for Relatório de TROCA de determinado VENDEDOR, CLIENTE, FORNECEDOR...
        if (rdgSelecao.ItemIndex = 1)and(ckbTodosClientes.Checked = False)and(ckbTodosFornecedores.Checked = False)and(ckbTodosVendedores.Checked = False)  then
          begin
            dmBaseDados.tblPedidos.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Pagamento = '+QuotedStr('TR')+')and('+'CodigoVendedor ='+QuotedStr(edtVendedor.Text)+')and('+'CodigoCliente ='+QuotedStr(edtCliente.Text)+')';
            dmBaseDados.tblPedidos.Filtered := True;
            //dmBaseDados.tblFamilias.Filter   := 'CodigoFamilia = '+edtFornecedor.Text;
            //dmBaseDados.tblFamilias.Filtered := True;
          end;

        pgrProcessamento.Max := dmBaseDados.tblPedidos.RecordCount;
       strproduto := dmBaseDados.tblPedidosProduto.AsString;

        while (not dmBaseDados.tblPedidos.Eof) do
            Begin
                dblSoma:=0;
                if(ckbTodosFornecedores.Checked = true)or(copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtFornecedor.Text) then
                  begin
                    dmBaseDados.tblLogMensal.Append;
                    dmBaseDados.tblClientes.FindKey([dmBaseDados.tblPedidosCodigoCliente.AsFloat]);
                    strNPedido:=dmBaseDados.tblPedidosNPedido.AsString;
                    dmBaseDados.tblLogMensalDataLancamento.AsDateTime:=
                    dmBaseDados.tblPedidosDataEmissao.AsDateTime;
                    dmBaseDados.tblLogMensalDescricao.AsString:=
                    FloatToStr(dmBaseDados.tblPedidosCodigoCliente.AsFloat)+' - '+dmBaseDados.tblClientesNomeCliente.AsString;
                    dmBaseDados.tblLogMensalCodigoProduto.AsString:=
                    dmBaseDados.tblPedidosNPedido.AsString;
                    dmBaseDados.tblLogMensalUnidadeMedida.AsString:=
                    dmBaseDados.tblPedidosPagamento.AsString;
                    dmBaseDados.tblLogMensalDocumento.AsString:=
                    dmBaseDados.tblPedidosCodigoVendedor.AsString;
                    while ((strNPedido = dmBaseDados.tblPedidosNPedido.AsString) and (not dmBaseDados.tblPedidos.Eof)) do
                        begin
                         dblSoma:=dblSoma+dmBaseDados.tblPedidosTotal.AsFloat;
                         dmBaseDados.tblPedidos.Next;
                         pgrProcessamento.Position := pgrProcessamento.Position+1;
                        end;
                    dmBaseDados.tblLogMensalValorLancamento.AsFloat := dblSoma;
                    dmBaseDados.tblLogMensal.Post;
               //dmBaseDados.tblPedidos.Next;
               pgrProcessamento.Position := pgrProcessamento.Position+1;
                  end
                else
                   begin
                     dmBaseDados.tblPedidos.Next;
                   end;
            end;
        FormRelBonificacaoTroca.qrtRelBonificacaoTroca.Preview;
        FormBonificacaoTroca.Close;
        dmBaseDados.tblPedidos.IndexName  := '';
        dmBaseDados.tblPedidos.Filter     := '';
        dmBaseDados.tblPedidos.Filtered   := False;
        dmBaseDados.tblPedidos.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblLogMensal.Close;
        dmBaseDados.tblFamilias.close;
        rdgSelecao.ItemIndex:=0;
end;

procedure TFormBonificacaoTroca.btbSairClick(Sender: TObject);
begin
        Close;
end;

procedure TFormBonificacaoTroca.FormShow(Sender: TObject);
begin
 dmBaseDados.tblFamilias.open;
 Screen.Cursor                := CrHourGlass;
 Data1.Date                   := Date;
 Data2.Date                   := Date;
 Screen.Cursor                := CrDefault;
 edtVendedor.Text             := '000';
 edtCliente.Text              := '000';
 edtFornecedor.Text           := '0000';
 ckbTodosClientes.Checked     := True;
 ckbTodosVendedores.Checked   := True;
 ckbTodosFornecedores.Checked := True;
 pgrProcessamento.Position    := 0;
 Data1.SetFocus;
end;

procedure TFormBonificacaoTroca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblFamilias.close;
close;

end;

procedure TFormBonificacaoTroca.ckbTodosVendedoresClick(Sender: TObject);
begin
   if ckbTodosVendedores.Checked = True then
    begin
      edtVendedor.Enabled := False;
    end
   else
    begin
      edtVendedor.Enabled := True;
    end;
end;

procedure TFormBonificacaoTroca.ckbTodosFornecedoresClick(Sender: TObject);
begin
   if ckbTodosFornecedores.Checked = True then
    begin
      edtFornecedor.Enabled := False;
    end
   else
    begin
      edtFornecedor.Enabled := True;
    end;
end;

procedure TFormBonificacaoTroca.ckbTodosClientesClick(Sender: TObject);
begin
   if ckbTodosClientes.Checked = True then
    begin
      edtCliente.Enabled := False;
    end
   else
    begin
      edtCliente.Enabled := True;
    end;
end;

end.
