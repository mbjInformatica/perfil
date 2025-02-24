unit ProdutosVendidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls;

type
  TfrmProdutosVendidos = class(TForm)
    btnOK            : TBitBtn;
    btnCancela       : TBitBtn;
    Data1            : TDateTimePicker;
    lblDtI           : TLabel;
    lblDtF           : TLabel;
    Data2            : TDateTimePicker;
    Label1           : TLabel;
    Label2           : TLabel;
    edtCliente       : TEdit;
    edtFamilia       : TEdit;
    Label3           : TLabel;
    ckbValor         : TCheckBox;
    Label4           : TLabel;
    edtPromocao      : TEdit;
    rdgTipoRelatorio : TRadioGroup;
    pgrProcessamento : TProgressBar;
    edtFamilia2      : TEdit;
    edtFamilia3      : TEdit;
    edtFamilia4      : TEdit;
    edtFamilia5      : TEdit;
    edtFamilia6      : TEdit;
    edtFamilia7      : TEdit;
    edtFamilia8      : TEdit;
    edtVendedor      : TEdit;
    edtVendedor2     : TEdit;
    edtVendedor3     : TEdit;
    edtVendedor4     : TEdit;
    edtVendedor5     : TEdit;
    edtVendedor6     : TEdit;
    edtVendedor7     : TEdit;
    edtVendedor8     : TEdit;
    edtVendedor9     : TEdit;
    edtVendedor10    : TEdit;

    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutosVendidos: TfrmProdutosVendidos;

implementation

uses ModuloDados, RelProdutosVendidos, TesteProdVen;

{$R *.DFM}

procedure TfrmProdutosVendidos.btnOKClick(Sender: TObject);
var strCodigoProduto, strCodVen, strDescricao, strCodFamilia, strAntFamilia, strVenAnt, strFamilia, strCodProduto, strCodCategoria : string;
    strPeso,strQtde, SubTotal, SubCusto, SubPeso, SubQtde, strValor, strCusto, strValorCusto, strLucro, strMargemLucro : Double;
    DataLancamento : TDateTime;
    Arqtxt : TextFile;
begin
 dmBaseDados.tblLogMensal.EmptyTable;
 dmBaseDados.tblHistorico.Open;
 dmBaseDados.tblHistorico.MasterFields := '';
 dmBaseDados.tblLogMensal.Open;
 dmBaseDados.tblSaida.Open;
 dmBaseDados.tblProdutos.Open;
 dmBaseDados.tblFamilias.Open;
//Quando o 2º campo dos Vendedores for diferente de '000'(usado para as listagens de mais de 1 Vendedor)...
  if (edtVendedor2.Text <> '000') then
    begin
//...vai indexar pelo Vendedor...
      dmBaseDados.tblHistorico.IndexName := 'IndVendedor';
    end
//..se não, ou seja, quando for de somente um Vendedor ou de Todos Vendedores, vai indexar pelo Produto.
  else
    begin
      dmBaseDados.tblHistorico.IndexName := 'IndProduto';
    end;
//Aqui filtrará o Período selecionado.
 dmBaseDados.tblHistorico.Filter    := '('+'DataLancamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataLancamento <='+QuotedStr(DateToStr(Data2.Date))+')';
 dmBaseDados.tblHistorico.Filtered  := True;
 strAntFamilia                      := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3);
 strVenAnt                          := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
 pgrProcessamento.Max               := dmBaseDados.tblHistorico.RecordCount;
   while (not dmBaseDados.tblHistorico.Eof) do
     begin
        strCodigoProduto := dmBaseDados.tblHistoricoCodigoProduto.AsString;
        strCodFamilia    := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3);
        strCodCategoria  := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,4,3);
        strCodProduto    := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,7,6);
        strCodVen        := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
        strFamilia       := '';
        strDescricao     := '';
        strCusto         := 0;
        strQtde          := 0;
        strValor         := 0;
        strValorCusto    := 0;
        strPeso          := 0;
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
       while  (strCodigoProduto = dmBaseDados.tblHistoricoCodigoProduto.AsString) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString))
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
              if(edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString)and(edtVendedor2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := edtVendedor.Text;
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             strValorCusto  := strValorCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             SubCusto       := SubCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoDataLancamento.AsDateTime;
             strPeso        := strPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
             SubPeso        := SubPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
           end;
//strCusto é o Preço de Custo...
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistorico.Next;
          if dmBaseDados.tblHistorico.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
//Quando o Relatório for "SINTÉTICO"...
    if rdgTipoRelatorio.ItemIndex = 1 then
      begin
//...somará enquanto for a mesma Familia(ex: macarrão,biscoito adria,oetker,etc...).
       while  (strCodFamilia = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString))
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
              if(edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString)and(edtVendedor2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := edtVendedor.Text;
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             strValorCusto  := strValorCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             SubCusto       := SubCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoDataLancamento.AsDateTime;
             strPeso        := strPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
             SubPeso        := SubPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
            end;
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistorico.Next;
          if dmBaseDados.tblHistorico.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
         end;
//Quando o 2º campo dos Vendedores for diferente de '000'...
    if edtVendedor2.Text <> '000' then
      begin
//...somará enquanto for o mesmo 'VENDEDOR' e os mesmos PRODUTOS; essa rotina será usada para listagens de 2 ou até 10 VENDEDORES.
//Ex: se você escolher o Vendedor '10' e o '23', primeiro ele vai somar os produtos do vendedor 10, subtotalizando pela Familia do Produto, e depois do Vendedor '23'.
       while ((strCodVen = dmBaseDados.tblHistoricoCodigoVendedor.AsString)and(strCodigoProduto = dmBaseDados.tblHistoricoCodigoProduto.AsString)) do
         begin
      //Aqui filtrará os Vendedores, as Familias, Cliente e Empresa em Promoção.
          if((((edtVendedor.Text  = '000')   or (edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
            or(edtVendedor2.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor3.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor4.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor5.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor6.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor7.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor8.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor9.Text  = dmBaseDados.tblHistoricoCodigoVendedor.AsString)
            or(edtVendedor10.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString))
           and(((edtFamilia.Text  = '000')   or (edtFamilia.Text  = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
            or(edtFamilia2.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia3.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia4.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia5.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia6.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia7.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3))
            or(edtFamilia8.Text   = Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)))
           and((edtCliente.Text   = '0000')  or (edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString))
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
              if(edtVendedor.Text = dmBaseDados.tblHistoricoCodigoVendedor.AsString)and(edtVendedor2.Text <> '000') then
               begin
                FormRelProdutosVendidos.qrlVendedor.Caption := 'Todos';
               end;
              if(edtFamilia.Text  = strCodFamilia ) and (edtFamilia2.Text = '000') then
               begin
                FormRelProdutosVendidos.qrlFamilia.Caption  := edtFamilia.Text;
               end;
              if(edtCliente.Text  = dmBaseDados.tblHistoricoCodigoCliente.AsString) then
               begin
                FormRelProdutosVendidos.qrlCliente.Caption  := edtCliente.Text;
               end;
              if(edtPromocao.Text = dmBaseDados.tblProdutosEmpresa.AsString) then
               begin
                FormRelProdutosVendidos.qrlPromocao.Caption := edtPromocao.Text;
               end;
//Aqui será somado as variáveis de  Qtde, Valor, SubTotal e SubQtde;e alimentar as variáveis  CodVen(Código do Vendedor) e DataLancamento.
             strQtde        := strQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             strValor       := strValor + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             strValorCusto  := strValorCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             SubTotal       := SubTotal + dmBaseDados.tblHistoricoValorLancamento.AsFloat;
             SubCusto       := SubCusto + dmBaseDados.tblHistoricoValorCusto.AsFloat;
             strCodVen      := dmBaseDados.tblHistoricoCodigoVendedor.AsString;
             SubQtde        := SubQtde  + dmBaseDados.tblHistoricoQuantidade.AsFloat;
             DataLancamento := dmBaseDados.tblHistoricoDataLancamento.AsDateTime;
             strPeso        := strPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
             SubPeso        := SubPeso  + dmBaseDados.tblHistoricoPeso.AsFloat;
            end;
          if strValorCusto <> 0 then
            begin
             strLucro      := strValor/strValorCusto;
            end;
          dmBaseDados.tblHistorico.Next;
          if dmBaseDados.tblHistorico.Eof then break;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
         end;
         end;
        if frmProdutosVendidos.ckbValor.Checked = True then
           begin
            SubTotal := 0;
            SubCusto := 0;
           end;
//A tabela LogMensal só será alimentada se a Qtde for diferente de '0'.
          if (strQtde <> 0) then
           begin
              dmBaseDados.tblLogMensal.Append;
              dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodigoProduto;
              dmBaseDados.tblLogMensalQuantidade.AsFloat        := strQtde;
              dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataLancamento;
//Aqui ele vai fazer a subtotalização de cada Familia de Produto e Vendedor, será usada para listagens de 2 ou até 10 Vendedores.
               if (strCodFamilia <> Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3)) then
                begin
                  if (dmBaseDados.tblFamilias.FindKey([Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3)])) then
                   begin
                    strFamilia := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
                   end;
                  dmBaseDados.tblLogMensalObservacao.AsString    := strCodVen;
                  dmBaseDados.tblLogMensalSubtotal.AsFloat       := SubTotal;
                  dmBaseDados.tblLogMensalDiferenca.AsFloat      := SubCusto;
                  dmBaseDados.tblLogMensalSubPeso.AsFloat        := SubPeso;
                  dmBaseDados.tblLogMensalSubQtde.AsFloat        := SubQtde;
                  dmBaseDados.tblLogMensalFamilia.AsString       := strFamilia;
                  SubTotal      := 0;
                  SubCusto      := 0;
                  SubQtde       := 0;
                  SubPeso       := 0;
                  StrQtde       := 0;
                  strFamilia    := '';
                end;
              dmBaseDados.tblLogMensalValorLancamento.AsFloat   := strValor;
              dmBaseDados.tblLogMensalValorDinheiro.AsFloat     := strValorCusto;
              dmBaseDados.tblLogMensalValorCheque.AsFloat       := strLucro;
              dmBaseDados.tblLogMensalValorCobranca.AsFloat     := strMargemLucro;
              dmBaseDados.tblLogMensalDescricao.AsString        := strDescricao;
              dmBaseDados.tblLogMensalTroco.AsFloat             := strPeso;
              dmBaseDados.tblLogMensal.Post;
           end;
    end;
//Essa rotina servirá para fazer a Subtotalização da última FAMILIA do relatório.
 dmBaseDados.tblLogMensal.First;
 strAntFamilia := Copy(dmBaseDados.tblLogmensalCodigoProduto.AsString,1,3);
 SubTotal      := 0;
 SubCusto      := 0;
 SubQtde       := 0;
 SubPeso       := 0;
while (not dmBaseDados.tblLogmensal.Eof) do
 begin
     if (dmBaseDados.tblFamilias.FindKey([Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3)])) then
      begin
        strFamilia := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
      end;
    strQtde        := strQtde  + dmBaseDados.tblLogMensalQuantidade.AsFloat;
    SubTotal       := SubTotal + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
    SubCusto       := SubCusto + dmBaseDados.tblLogMensalValorDinheiro.AsFloat;
    SubQtde        := SubQtde  + dmBaseDados.tblLogMensalQuantidade.AsFloat;
    SubPeso        := SubPeso  + dmBaseDados.tblLogMensalTroco.AsFloat;
    dmBaseDados.tblLogMensal.Next;
//Essa rotina será feita para listagens de 1 ou de TODOS vendedores, pois quando for 2 ou até 10 Vendedores ele subtotalizará mais acima.
  if edtVendedor2.Text = '000' then
   begin
     if (strAntFamilia<>Copy(dmBaseDados.tblLogMensalCodigoProduto.AsString,1,3))then
      begin
        if frmProdutosVendidos.ckbValor.Checked = True then
         begin
          SubTotal := 0;
          SubCusto := 0;
         end;
       dmBaseDados.tblLogMensal.Prior;
       dmBaseDados.tblLogMensal.Edit;
       dmBaseDados.tblLogMensalSubtotal.AsFloat  := SubTotal;
       dmBaseDados.tblLogMensalDiferenca.AsFloat := SubCusto;
       dmBaseDados.tblLogMensalSubQtde.AsFloat   := SubQtde;
       dmBaseDados.tblLogMensalSubPeso.AsFloat   := SubPeso;
       dmBaseDados.tblLogMensalFamilia.AsString  := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
       dmBaseDados.tblLogMensal.Post;
       dmBaseDados.tblLogMensal.Next;
       SubTotal      := 0;
       SubCusto      := 0;
       SubQtde       := 0;
       SubPeso       := 0;
       StrQtde       := 0;
       strFamilia    := '';
       strAntFamilia := Copy(dmBaseDados.tblLogmensalCodigoProduto.AsString,1,3);
      end;
   end;
 end;
  if frmProdutosVendidos.ckbValor.Checked = True then
   begin
     SubTotal := 0;
     SubCusto := 0;
   end;
 if edtVendedor2.Text = '000' then
  begin
   dmBaseDados.tblLogMensal.Last;
   dmBaseDados.tblLogMensal.Edit;
   dmBaseDados.tblLogMensalSubtotal.AsFloat  := SubTotal;
   dmBaseDados.tblLogMensalDiferenca.AsFloat := SubCusto;
   dmBaseDados.tblLogMensalSubQtde.AsFloat   := StrQtde;
   dmBaseDados.tblLogMensalSubPeso.AsFloat   := SubPeso;
   dmBaseDados.tblLogMensalFamilia.AsString  := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
   dmBaseDados.tblLogMensal.Post;
  end;
 
 FormRelProdutosVendidos.qrpProdutosVendidos.Preview;
dmBaseDados.tblLogMensal.First;
AssignFile(Arqtxt,'ProdVendidos.doc');
Rewrite(Arqtxt);
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
   Writeln(Arqtxt,dmBaseDados.tblLogMensalCodigoProduto.Text+' '+dmBaseDados.tblLogMensaldescricao.Text+' '+dmBaseDados.tblLogMensalquantidade.Text+' '+dmBaseDados.tblLogMensalValorLancamento.Text);
   dmBaseDados.tblLogMensal.Next;
 end;
CloseFile(Arqtxt);
 dmBaseDados.tblHistorico.Filter    := '';
 dmBaseDados.tblHistorico.Filtered  := False;
 dmBaseDados.tblHistorico.IndexName := '';
 dmBaseDados.tblSaida.Close;
 dmBaseDados.tblFamilias.Close;
 dmBaseDados.tblHistorico.Close;
 dmBaseDados.tblLogMensal.Close;
 dmBaseDados.tblProdutos.Close;
end;

procedure TfrmProdutosVendidos.FormShow(Sender: TObject);
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
 //ckbValor.Checked          := False;
 Data1.SetFocus;
end;

procedure TfrmProdutosVendidos.Button1Click(Sender: TObject);
begin
dmBaseDados.tblHistorico.Open;
dmBaseDados.tblHistorico.Filter    := '('+'DataLancamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataLancamento <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblHistorico.Filtered  := True;
dmBaseDados.tblHistorico.First;
while not dmBaseDados.tblHistorico.Eof do
  begin
    if dmBaseDados.tblHistoricoCondPg.AsString = 'TR' then
        begin
          dmBaseDados.tblHistorico.Edit;
          dmBaseDados.tblHistorico.Delete;
        
        end;
          dmBaseDados.tblHistorico.Next;

  end;
formTesteProdVen.qrpTesteProdVen.Preview;
dmBaseDados.tblHistorico.Filter    := '';
dmBaseDados.tblHistorico.Filtered  := False;
dmBaseDados.tblHistorico.Close;
end;

end.
