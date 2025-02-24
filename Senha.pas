unit Senha;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, StdCtrls, Buttons, TIGradient, TIGradientCaption;

type
  TFormSenha = class(TForm)
    edtSenha: TEdit;
    btnOK: TBitBtn;
    btnRelatorios: TBitBtn;
    TIGradientCaption1: TTIGradientCaption;
    TIGradient1: TTIGradient;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FormSenha: TFormSenha;

implementation

uses ModuloDados, db, RotinasGerais;


{$R *.dfm}


procedure TFormSenha.FormShow(Sender: TObject);
begin
edtSenha.Clear;
edtSenha.SetFocus;
end;

procedure TFormSenha.btnOKClick(Sender: TObject);
var
strNPedidoHis, strNPedidoPed : String;
   strCodFamilia,strCodCategoria,strCodProduto,
   strDigito, strGrup: string;
   strCodigo: string[10];
   strCodigoFamilia,intCodigo,intContador,intTamanho,intFator,intSoma,intDigito,intResto: integer;
   fltResultado: double;
   bmkRegistro : tBookMark;
begin
if (edtSenha.Text = 'mbj6800a') Then
BEGIN
 FormSenha.Close;
//**-->ABAIXO COMEÇA OS COMANDOS A SEREM EXECUTADOS POR NOS DA MBJ<--**//
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblProdutos.First;
while (not dmBaseDados.tblProdutos.Eof) do
 begin
  dmBaseDados.tblProdutos.Edit;
  dmBaseDados.tblProdutosIcms.AsFloat := 0;
  dmBaseDados.tblProdutos.Post;
  dmBaseDados.tblProdutos.FlushBuffers;
  dmBaseDados.tblProdutos.Next;
 end;
dmBaseDados.tblProdutos.Close;
   {dmBaseDados.tblFamilias.Open;
   dmBaseDados.qryItens.Close;
   dmBaseDados.qryItens.SQL.Clear;
   dmBaseDados.qryItens.SQL.Text := 'SELECT * FROM ITEM.DBF ORDER BY GRUP';
   dmBaseDados.qryItens.Open;
   dmBaseDados.qryItens.First;

    while (not dmBaseDados.qryItens.Eof) do
     begin
      strGrup := dmBaseDados.qryItensGRUP.AsString;
      if (dmBaseDados.tblFamilias.Locate('DescricaoFamilia',strGrup,[loCaseInsensitive])= FALSE) then
        begin
         strCodigoFamilia := 0;
         strCodigo        := '';
         dmBaseDados.tblFamilias.Last;
         strCodigoFamilia := (StrToInt(dmBaseDados.tblFamiliasCodigoFamilia.AsString))+1;
         strCodigo        := (FormatFloat('000',strCodigoFamilia));
         dmBaseDados.tblFamilias.Append;
         dmBaseDados.tblFamiliasCodigoFamilia.AsString    := strCodigo;
         dmBaseDados.tblFamiliasDescricaoFamilia.AsString := strGrup;
         dmBaseDados.tblFamilias.Post;
        end;
       dmBaseDados.qryItens.Next;
     end;

dmBaseDados.qryItens.Close;
dmBaseDados.tblFamilias.Close;  }

{dmBaseDados.tblItem.Open;
dmBaseDados.tblProdutos.EmptyTable;
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblItem.First;
 while (not dmBaseDados.tblItem.Eof) do
  begin
   if dmBaseDados.tblItemDESC.AsString = 'CANCELAMENTO HIPERCARD 3841' then dmBaseDados.tblItem.Delete;
   dmBaseDados.tblProdutos.Append;
   if (dmBaseDados.tblFamilias.Locate('DescricaoFamilia',dmBaseDados.tblItemGRUP.AsString,[loCaseInsensitive])= TRUE) then
    begin
     dmBaseDados.tblProdutosCodigoFamilia.AsString := dmBaseDados.tblFamiliasCodigoFamilia.AsString;
    end
   else
    begin
     dmBaseDados.tblProdutosCodigoFamilia.AsString := '999';
    end;
   dmBaseDados.tblProdutosCodigoCategoria.AsString       := '001';
   dmBaseDados.tblProdutosDescricaoAbreviada.AsString    := dmBaseDados.tblItemDESC.AsString;
   dmBaseDados.tblProdutosDescricaoDetalhada.AsString    := dmBaseDados.tblItemDESC.AsString;
   dmBaseDados.tblProdutosUnidadeMedida.AsString         := dmBaseDados.tblItemUNID.AsString;
   dmBaseDados.tblProdutosReferenciaFabricante.AsString  := dmBaseDados.tblItemCODI.AsString;
   dmBaseDados.tblProdutosValorVenda.AsString            := dmBaseDados.tblItemPREC.AsString;}
   {dmBaseDados.tblProdutosValorUnitarioAnterior.AsString := dmBaseDados.tblDTProdutosPRECUL_EST.AsString;
   dmBaseDados.tblProdutosValorUnitarioAtual.AsString    := dmBaseDados.tblDTProdutosPRECRE_EST.AsString;
   if dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat <> 0 then
    begin
     dmBaseDados.tblProdutosMargemLucro.AsFloat := (dmBaseDados.tblProdutosValorVenda.AsFloat-dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat)*100/dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
    end;
   dmBaseDados.tblProdutosEstoqueAtual.AsString          := dmBaseDados.tblDTProdutosQUAMAT_EST.AsString;
   dmBaseDados.tblProdutosCaracteristicas.AsString       := dmBaseDados.tblDTProdutosOBS001_EST.AsString + '          '+dmBaseDados.tblDTProdutosOBS002_EST.AsString;;
   dmBaseDados.tblProdutosReferenciaFabricante2.AsString := dmBaseDados.tblDTProdutosCODFOR_EST.AsString;   }
   {dmBaseDados.tblProdutos.Post;
      bmkRegistro     := dmBaseDados.tblProdutos.GetBookMark;
      strCodFamilia   := dmBaseDados.tblProdutosCodigoFamilia.AsString;
      strCodCategoria := dmBaseDados.tblProdutosCodigoCategoria.AsString;
      intCodigo       := 0;
      dmBaseDados.tblProdutos.Next;
      while ((dmBaseDados.tblProdutosCodigoFamilia.AsString = strCodFamilia) and
        (dmBaseDados.tblProdutosCodigoCategoria.AsString = strCodCategoria) and
        (not dmBaseDados.tblProdutos.Eof)) do
        begin
          strCodProduto   := dmBaseDados.tblProdutosCodigoProduto.AsString;
          intCodigo       := StrToInt(Copy(strCodProduto,1,4));
          dmBaseDados.tblProdutos.Next;
        end;

      Inc(intCodigo);
      strCodProduto      := IntToStr(intCodigo);
      intTamanho         := Length(strCodProduto);
      strCodProduto      := Copy('0000'+strCodProduto,intTamanho+1,4);
      strCodigo          := strCodFamilia+strCodCategoria+strCodProduto;
      intFator           := 10;
      intSoma            := 0;
      for intContador := 1 to 10 do
      begin
         intSoma  := intSoma + (StrToInt(strCodigo[intcontador])*intFator);
         intFator := intFator - 1
      end;
      fltResultado := intSoma /11;
      intResto     := intSoma - (Trunc(fltResultado) * 11);
      intDigito    := 11-intResto;
      if (intDigito > 9) then
         intDigito := 0;
      strDigito := Format('%1d',[intDigito]);
      strCodProduto := strCodProduto+'-'+strDigito;
      dmBaseDados.tblProdutos.GotoBookmark(bmkRegistro);
      dmBaseDados.tblProdutos.FreeBookmark(bmkRegistro);
     dmBaseDados.tblProdutos.Edit;
      dmBaseDados.tblProdutosCodigoProduto.AsString := strCodProduto;
      dmBaseDados.tblProdutosCodigo.AsString        := strCodFamilia+strCodCategoria+strCodProduto;
      dmBaseDados.tblProdutos.Post;

      dmBaseDados.tblItem.Next;
  end;
  ShowMessage('Acapuc0!!');
  dmBaseDados.tblItem.Close;
  dmBaseDados.tblProdutos.Close;
  dmBaseDados.tblFamilias.Close;}











//formIndexar.ShowModal;
{dmBaseDados.tblProdutos.Open;
dmBaseDados.tblProdutos.First;
while (not dmBaseDados.tblProdutos.Eof) do
 begin
  dmBaseDados.tblProdutos.Edit;
  dmBaseDados.tblProdutosValorFuturo.AsFloat := dmBaseDados.tblProdutosValorVenda.AsFloat;
  dmBaseDados.tblProdutos.Post;
  dmBaseDados.tblProdutos.Next;
 end;
 dmBaseDados.tblProdutos.Close; }
{ dmBaseDados.tblHistorico.Open;
 dmBaseDados.tblPedidos.Open;
 dmBaseDados.tblHistorico.First;
 dmBaseDados.tblHistorico.IndexName := 'IndNPedidoHis' ;
 dmBaseDados.tblPedidos.IndexName   := 'IndNroPedido';
 strNPedidoHis := dmBaseDados.tblHistoricoNumeroRequisicao.AsString;
 strNPedidoPed := dmBaseDados.tblPedidosNPedido.AsString;
   while (not dmBaseDados.tblHistorico.Eof) do
    begin
     dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblHistoricoNumeroRequisicao.AsString]);
      if (dmBaseDados.tblPedidosStatus.AsString = '0') then
        begin
          dmBaseDados.tblHistorico.Edit;
          dmBaseDados.tblHistorico.Delete;
        end;
     dmBaseDados.tblHistorico.Next;
    end;
 dmBaseDados.tblHistorico.Close;
 dmBaseDados.tblPedidos.Close;
 dmBaseDados.tblHistorico.IndexName := '' ;
 dmBaseDados.tblPedidos.IndexName   := '';}
 //**-->FIM DOS COMANDOS QUE FORAM EXECUTADOS POR NOS DA MBJ<--**//
END
Else
 Begin
  Application.MessageBox('Senha Incorreta,Redigite','Atenção',MB_OK);
  edtSenha.SetFocus;
 End;
end;

procedure TFormSenha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Close;
end;

end.
