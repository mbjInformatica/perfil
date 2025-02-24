unit ProdutosVendidosBKP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TfrmProdutosVendidosBKP = class(TForm)
    lblDtI: TLabel;
    lblDtF: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    edtCliente: TEdit;
    edtFamilia: TEdit;
    ckbValor: TCheckBox;
    rdgTipoRelatorio: TRadioGroup;
    pgrProcessamento: TProgressBar;
    edtPromocao: TEdit;
    edtFamilia2: TEdit;
    edtFamilia3: TEdit;
    edtFamilia4: TEdit;
    edtFamilia5: TEdit;
    edtFamilia6: TEdit;
    edtFamilia7: TEdit;
    edtFamilia8: TEdit;
    edtVendedor: TEdit;
    edtVendedor2: TEdit;
    edtVendedor3: TEdit;
    edtVendedor4: TEdit;
    edtVendedor5: TEdit;
    edtVendedor6: TEdit;
    edtVendedor7: TEdit;
    edtVendedor8: TEdit;
    edtVendedor9: TEdit;
    edtVendedor10: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosVendidosBKP: TfrmProdutosVendidosBKP;

implementation
uses ModuloDados, RelProdutosVendidos, ProdutosVendidos;

{$R *.DFM}

procedure TfrmProdutosVendidosBKP.btnOKClick(Sender: TObject);
var strCodigoProduto, strCodVen, strDescricao, strCodFamilia, strAntFamilia, strVenAnt, strFamilia, strCodProduto, strCodCategoria : string;
    strQtde, SubTotal, SubQtde, strValor, strCusto, strValorCusto, strLucro, strMargemLucro : Double;
    DataLancamento : TDateTime;
begin
 dmBaseDados.tblLogMensal.EmptyTable;
 dmBaseDados.tblHistoricoBKP.Open;
 dmBaseDados.tblHistoricoBKP.MasterFields := '';
 dmBaseDados.tblLogMensal.Open;
 dmBaseDados.tblSaida.Open;
 dmBaseDados.tblProdutos.Open;
 dmBaseDados.tblFamilias.Open;
//Quando o 2º campo dos Vendedores for diferente de '000'(usado para as listagens de mais de 1 Vendedor)...
  if (edtVendedor2.Text <> '000') then
    begin
//...vai indexar pelo Vendedor...
      dmBaseDados.tblHistoricoBKP.IndexName := 'IndVendedor';
    end
//..se não, ou seja, quando for de somente um Vendedor ou de Todos Vendedores, vai indexar pelo Produto.
  else
    begin
      dmBaseDados.tblHistoricoBKP.IndexName := 'IndProduto';
    end;
//Aqui filtrará o Período selecionado.
 dmBaseDados.tblHistoricoBKP.Filter    := '('+'DataLancamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataLancamento <='+QuotedStr(DateToStr(Data2.Date))+')';
 dmBaseDados.tblHistoricoBKP.Filtered  := True;
 strAntFamilia                         := Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3);
 strVenAnt                             := dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString;
 pgrProcessamento.Max                  := dmBaseDados.tblHistoricoBKP.RecordCount;
   while (not dmBaseDados.tblHistoricoBKP.Eof) do
     begin
        strCodigoProduto := dmBaseDados.tblHistoricoBKPCodigoProduto.AsString;
        strCodFamilia    := Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3);
        strCodCategoria  := Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,4,3);
        strCodProduto    := Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,7,6);
        strCodVen        := dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString;
        strFamilia       := '';
        strDescricao     := '';
        strCusto         := 0;
        strQtde          := 0;
        strValor         := 0;
        strValorCusto    := 0;
        strLucro         := 0;
        strMargemLucro   := 0;
        if (dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
         begin
            strMargemLucro := dmBaseDados.tblProdutosMargemLucro.AsFloat;
            strDescricao   := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
            strCusto       := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
            strFamilia     := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
         end;
//Essa rotina somará enquanto o "PRODUTO" for o mesmo, será usada para listagens de TODOS VENDEDORES ou de um Vendedor apenas.
       while  (strCodigoProduto = dmBaseDados.tblHistoricoBKPCodigoProduto.AsString) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString))
           and((edtPromocao.Text  = '00000') or (edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString))) then
            begin
           //Aqui alimentará o Cabeçalho do RelProdutos Vendidos.
              if(edtVendedor.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := 'Todos';
               end;
              if (edtFamilia.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  :='Todas';
               end;
              if (edtCliente.Text = '0000') then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := 'Todos';
               end;
              if(edtPromocao.Text = '00000') then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := 'Não';
               end;
              if(edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)and(edtVendedor2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := edtVendedor.Text;
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoBKPDataLancamento.AsDateTime;
            end;
//strCusto é o Preço de Custo...
          strValorCusto := strQtde*strCusto;
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistoricoBKP.Next;
          if dmBaseDados.tblHistoricoBKP.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
//Quando o Relatório for "SINTÉTICO"...
    if rdgTipoRelatorio.ItemIndex = 1 then
      begin
//...somará enquanto for a mesma Familia(ex: macarrão,biscoito adria,oetker,etc...).
       while  (strCodFamilia = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString))
           and((edtPromocao.Text  = '00000') or (edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString))) then
            begin
           //Aqui alimentará o Cabeçalho do RelProdutos Vendidos.
              if(edtVendedor.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := 'Todos';
               end;
              if (edtFamilia.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  :='Todas';
               end;
              if (edtCliente.Text = '0000') then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := 'Todos';
               end;
              if(edtPromocao.Text = '00000') then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := 'Não';
               end;
              if(edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)and(edtVendedor2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := edtVendedor.Text;
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoBKPDataLancamento.AsDateTime;
            end;
          strValorCusto := strQtde*strCusto;
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistoricoBKP.Next;
          if dmBaseDados.tblHistoricoBKP.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
         end;
//Quando o 2º campo dos Vendedores for diferente de '000'...
    if edtVendedor2.Text <> '000' then
      begin
//...somará enquanto for o mesmo 'VENDEDOR' e os mesmos PRODUTOS; essa rotina será usada para listagens de 2 ou até 10 VENDEDORES.
//Ex: se você escolher o Vendedor '10' e o '23', primeiro ele vai somar os produtos do vendedor 10, subtotalizando pela Familia do Produto, e depois do Vendedor '23'.
       while ((strCodVen = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)and(strCodigoProduto = dmBaseDados.tblHistoricoBKPCodigoProduto.AsString)) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString))
           and((edtPromocao.Text  = '00000') or (edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString))) then
            begin
            //Aqui alimentará o Cabeçalho do RelProdutos Vendidos.
              if(edtVendedor.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := 'Todos';
               end;
              if (edtFamilia.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := 'Todas';
               end;
              if (edtCliente.Text = '0000') then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := 'Todos';
               end;
              if(edtPromocao.Text = '00000') then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := 'Não';
               end;
              if(edtVendedor.Text = dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString)and(edtVendedor2.Text <> '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := 'Todos';
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoBKPCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoBKPValorLancamento.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoBKPCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoBKPQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoBKPDataLancamento.AsDateTime;
            end;
          strValorCusto := strQtde*strCusto;
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistoricoBKP.Next;
          if dmBaseDados.tblHistoricoBKP.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
         end;
        if frmProdutosVendidos.ckbValor.Checked = True then
           begin
            SubTotal := 0;
           end;
//A tabela LogMensal só será alimentada se a Qtde for diferente de '0'.
          if (strQtde <> 0) then
           begin
              dmBaseDados.tblLogMensal.Append;
              dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodigoProduto;
              dmBaseDados.tblLogMensalQuantidade.AsFloat        := strQtde;
              dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataLancamento;
//Aqui ele vai fazer a subtotalização de cada Familia de Produto e Vendedor, será usada para listagens de 2 ou até 10 Vendedores.
               if (strCodFamilia <> Copy(dmBaseDados.tblHistoricoBKPCodigoProduto.AsString,1,3)) then
                begin
                  if (dmBaseDados.tblFamilias.FindKey([Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3)])) then
                   begin
                    strFamilia := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
                   end;
                  dmBaseDados.tblLogMensalObservacao.AsString    := strCodVen;
                  dmBaseDados.tblLogMensalSubtotal.AsFloat       := SubTotal;
                  dmBaseDados.tblLogMensalSubQtde.AsFloat        := SubQtde;
                  dmBaseDados.tblLogMensalFamilia.AsString       := strFamilia;
                  SubTotal      := 0;
                  SubQtde       := 0;
                  StrQtde       := 0;
                  strFamilia    := '';
                end;
              dmBaseDados.tblLogMensalValorLancamento.AsFloat   := strValor;
              dmBaseDados.tblLogMensalValorDinheiro.AsFloat     := strValorCusto;
              dmBaseDados.tblLogMensalValorCheque.AsFloat       := strLucro;
              dmBaseDados.tblLogMensalValorCobranca.AsFloat     := strMargemLucro;
              dmBaseDados.tblLogMensalDescricao.AsString        := strDescricao;
              dmBaseDados.tblLogMensal.Post;
           end;
    end;
//Essa rotina servirá para fazer a Subtotalização da última FAMILIA do relatório.
 dmBaseDados.tblLogMensal.First;
 strAntFamilia := Copy(dmBaseDados.tblLogmensalCodigoProduto.AsString,1,3);
 SubTotal      := 0;
 SubQtde       := 0;
while (not dmBaseDados.tblLogmensal.Eof) do
 begin
     if (dmBaseDados.tblFamilias.FindKey([Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3)])) then
      begin
        strFamilia := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
      end;
    strQtde        := strQtde  + dmBaseDados.tblLogMensalQuantidade.AsFloat;
    SubTotal       := SubTotal + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
    SubQtde        := SubQtde  + dmBaseDados.tblLogMensalQuantidade.AsFloat;
    dmBaseDados.tblLogMensal.Next;
//Essa rotina será feita para listagens de 1 ou de TODOS vendedores, pois quando for 2 ou até 10 Vendedores ele subtotalizará mais acima.
  if edtVendedor2.Text = '000' then
   begin
     if (strAntFamilia<>Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3))then
      begin
        if frmProdutosVendidos.ckbValor.Checked = True then
         begin
          SubTotal := 0;
         end;
       dmBaseDados.tblLogMensal.Prior;
       dmBaseDados.tblLogMensal.Edit;
       dmBaseDados.tblLogMensalSubtotal.AsFloat := SubTotal;
       dmBaseDados.tblLogMensalSubQtde.AsFloat  := SubQtde;
       dmBaseDados.tblLogMensalFamilia.AsString := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
       dmBaseDados.tblLogMensal.Post;
       dmBaseDados.tblLogMensal.Next;
       SubTotal      := 0;
       SubQtde       := 0;
       StrQtde       := 0;
       strFamilia    := '';
       strAntFamilia := Copy(dmBaseDados.tblLogmensalCodigoProduto.AsString,1,3);
      end;
   end;
 end;
  if frmProdutosVendidos.ckbValor.Checked = True then
   begin
     SubTotal := 0;
   end;
 if edtVendedor2.Text = '000' then
  begin
   dmBaseDados.tblLogMensal.Last;
   dmBaseDados.tblLogMensal.Edit;
   dmBaseDados.tblLogMensalSubtotal.AsFloat := SubTotal;
   dmBaseDados.tblLogMensalSubQtde.AsFloat  := StrQtde;
   dmBaseDados.tblLogMensalFamilia.AsString := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
   dmBaseDados.tblLogMensal.Post;
  end;
 FormRelProdutosVendidos.qrpProdutosVendidos.Preview;
 dmBaseDados.tblHistoricoBKP.Filter    := '';
 dmBaseDados.tblHistoricoBKP.Filtered  := False;
 dmBaseDados.tblHistoricoBKP.IndexName := '';
 dmBaseDados.tblSaida.Close;
 dmBaseDados.tblFamilias.Close;
 dmBaseDados.tblHistoricoBKP.Close;
 dmBaseDados.tblLogMensal.Close;
 dmBaseDados.tblProdutos.Close;
end;



procedure TfrmProdutosVendidosBKP.FormShow(Sender: TObject);
begin
 pgrProcessamento.Position := 0;
 Screen.Cursor             := CrHourGlass;
 Data1.Date                := Date;
 Data2.Date                := Date;
 Screen.Cursor             := CrDefault;
 edtVendedor.Text          := '000';
 edtVendedor2.Text         := '000';
 edtVendedor3.Text         := '000';
 edtVendedor4.Text         := '000';
 edtVendedor5.Text         := '000';
 edtVendedor6.Text         := '000';
 edtVendedor7.Text         := '000';
 edtVendedor8.Text         := '000';
 edtVendedor9.Text         := '000';
 edtVendedor10.Text        := '000';
 edtCliente.Text           := '0000';
 edtPromocao.Text          := '00000';
 edtFamilia.Text           := '000';
 edtFamilia2.Text          := '000';
 edtFamilia3.Text          := '000';
 edtFamilia4.Text          := '000';
 edtFamilia5.Text          := '000';
 edtFamilia6.Text          := '000';
 edtFamilia7.Text          := '000';
 edtFamilia8.Text          := '000';
 ckbValor.Checked          := False;
 Data1.SetFocus;

end;

end.
