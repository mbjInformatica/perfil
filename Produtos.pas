unit Produtos;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     DBCtrls, StdCtrls, Mask, ComCtrls, Buttons, DB, Grids, DBGrids, TISButton;

type
  TFormProdutos = class(TForm)
    pgProduto               : TPageControl;
    tabIdentificacao        : TTabSheet;
    lblFamilia              : TLabel;
    fldFamilia              : TDBLookupComboBox;
    fldCategoria            : TDBLookupComboBox;
    lblCategoria            : TLabel;
    lblMarca                : TLabel;
    fldMarca                : TDBLookupComboBox;
    lblReferencia           : TLabel;
    fldUnidade              : TDBEdit;
    fldLocalizacao          : TDBEdit;
    lblUnidade              : TLabel;
    lblLocalizacao          : TLabel;
    fldReferencia           : TDBEdit;
    lblCodigo               : TLabel;
    tabDescricao            : TTabSheet;
    lblCaracteristicas      : TLabel;
    fldCaracteristicas      : TDBMemo;
    tabFoto                 : TTabSheet;
    scrlFoto                : TScrollBox;
    tabValor                : TTabSheet;
    lblValorAnterior        : TLabel;
    lblDadaUltimaCompra     : TLabel;
    fldVlAnterior           : TDBEdit;
    fldDataUltimaCompra     : TDBEdit;
    tabEstoque              : TTabSheet;
    lblEstoqueMinimo        : TLabel;
    lblEstoqueMaximo        : TLabel;
    lblPontoReposicao       : TLabel;
    lblEstoqueAtual         : TLabel;
    fldEstoqieMinimo        : TDBEdit;
    fldEstoqueMaximo        : TDBEdit;
    fldPontoReposicao       : TDBEdit;
    fldEstoqueAtual         : TDBEdit;
    lblUltimoFor            : TLabel;
    fldUltimoFor            : TDBEdit;
    lblTaxaIpi              : TLabel;
    fldTaxaIpi              : TDBEdit;
    lblICMS                 : TLabel;
    fldICMS                 : TDBEdit;
    lblReducaoIcms          : TLabel;
    fldReducaoIcms          : TDBEdit;
    lblSitTrib              : TLabel;
    fldSitTrib              : TDBEdit;
    lblComissao             : TLabel;
    fldComissao             : TDBEdit;
    lblPremio               : TLabel;
    fldPremio               : TDBEdit;
    lblValEstoque           : TLabel;
    fldValEstoque           : TDBEdit;
    lblQtdCaixa             : TLabel;
    lblPeso                 : TLabel;
    fldQtdCaixa             : TDBEdit;
    fldPeso                 : TDBEdit;
    TabSheet1               : TTabSheet;
    grdContaCorrenteProduto : TDBGrid;
    lblBeneficio            : TLabel;
    dbcBeneficio            : TDBComboBox;
    lblMargemMinima         : TLabel;
    fldMargemMinima         : TDBEdit;
    fldEmpresa              : TDBEdit;
    Label1                  : TLabel;
    Label2                  : TLabel;
    fldCodigoBarra          : TDBEdit;
    fldVCustoEstoque        : TDBEdit;
    Label3                  : TLabel;
    Label4                  : TLabel;
    fldValorFuturo          : TDBEdit;
    Button1                 : TButton;
    fldValorCustoFuturo     : TDBEdit;
    fldEstoqueFuturo        : TDBEdit;
    Label5                  : TLabel;
    Label6                  : TLabel;
    lblEntrada: TLabel;
    lblNdocumento: TLabel;
    fldEntrada: TEdit;
    lblFornec: TLabel;
    lbldata: TLabel;
    fldValCusto: TEdit;
    lblValcusto: TLabel;
    btnCalcular: TButton;
    lblCustomedio: TLabel;
    fldNdocumento: TEdit;
    edtValorCustoMedio: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    rbEntrada: TRadioButton;
    rbSaida: TRadioButton;
    DBLookupComboBox1: TDBLookupComboBox;
    FLDREFERENCIA2: TDBEdit;
    FLDREFERENCIA3: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    FLDREFERENCIA4: TDBEdit;
    fldCodigoInterno: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    DBImage1: TDBImage;
    FLDREFERENCIA5: TDBEdit;
    FLDREFERENCIA6: TDBEdit;
    FLDREFERENCIA7: TDBEdit;
    fldDescricaoAbreviada: TDBEdit;
    fldDescricaoDetalhada: TDBEdit;
    lblDescricaoDetalhada: TLabel;
    lblDescricaoAbreviada: TLabel;
    lblValorAtual: TLabel;
    fldVlAtual: TDBEdit;
    lblMargemLucro: TLabel;
    fldMargemLucro: TDBEdit;
    lblVlVenda: TLabel;
    fldVlVenda: TDBEdit;
    fldEstoqueMin: TDBEdit;
    fldEstoqueMax: TDBEdit;
    fldEstoqueAt: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btnPrimeiro: TTISButton;
    btnAnterior: TTISButton;
    btnProximo: TTISButton;
    btnUltimo: TTISButton;
    btnGravar: TTISButton;
    btnLocalizar: TTISButton;
    btnExcluir: TTISButton;
    btnAdicionar: TTISButton;
    btnRetornar: TTISButton;
    fldCodFamilia: TDBText;
    fldCodCategoria: TDBText;
    fldCodigo: TDBText;
    btnAlterarFamCat: TTISButton;
    btnAlterar: TTISButton;
    btnBloqueia: TTISButton;
    dbeNCM: TDBEdit;
    lblNCM: TLabel;
    Label11: TLabel;
    fldCFOP: TDBEdit;
    dbeIcms: TDBComboBox;
    Label12: TLabel;
    lblCST: TLabel;
    dbeCST: TDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure rbEntradaClick(Sender: TObject);
    procedure rbSaidaClick(Sender: TObject);
    procedure fldEntradaExit(Sender: TObject);
    procedure fldMargemLucroExit(Sender: TObject);
    procedure fldVlVendaExit(Sender: TObject);
    procedure btnAlterarFamCatClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnBloqueiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FormProdutos : TFormProdutos;
    stsAltProd   : Integer;

implementation

uses ModuloDados, RotinasGerais, SeekProduto,
     ListaProduto, CONSULTACODIGO, SenhaAltCad;


{$R *.DFM}


procedure TFormProdutos.FormShow(Sender: TObject);
begin
stsAltProd := 0;
btnBloqueia.Click;
fldFamilia.Enabled   := False;
fldCategoria.Enabled := False;
fldNdocumento.ReadOnly := true;
fldValCusto.ReadOnly := true;
DateTimePicker1.date := date;
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblFamilias.IndexName := 'indDescricao';
dmBaseDados.tblCategoria.Open;
dmBaseDados.tblCategoria.IndexName := 'indDescricao';
dmBaseDados.tblHistorico.Open;
dmBaseDados.tblHistorico.Append;
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblMarcas.Open;
dmBaseDados.tblMarcas.IndexName := 'indMarca';
dmBaseDados.tblProdutos.Open;
fldEntrada.Clear;
fldNdocumento.Clear;
fldValCusto.Clear;
rbEntrada.Checked := True;
rbSaida.Checked   := False;
if (dmBaseDados.tblProdutos.RecordCount = 0) then
 dmBaseDados.tblProdutos.Append;
pgProduto.ActivePage := tabIdentificacao;
end;

procedure TFormProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
fldNdocumento.ReadOnly     := True;
fldValCusto.ReadOnly       := True;
DBLookupComboBox1.ReadOnly := True;
dmBaseDados.tblMarcas.Close;
dmBaseDados.tblFamilias.Close;
dmBaseDados.tblCategoria.Close;
dmBaseDados.tblHistorico.Close;
dmBaseDados.tblFornecedores.Close;
if (CadastroStatus = '0') then
 begin
  dmBaseDados.tblProdutos.Close;
 end;
end;

procedure TFormProdutos.btnPrimeiroClick(Sender: TObject);
begin
btnBloqueia.Click;
dmBaseDados.tblProdutos.First;
end;

procedure TFormProdutos.btnAnteriorClick(Sender: TObject);
begin
btnBloqueia.Click;
dmBaseDados.tblProdutos.Prior;
if (dmBaseDados.tblProdutos.Bof) then
 begin
  InicioTabela;
  dmBaseDados.tblProdutos.First;
 end;
end;

procedure TFormProdutos.btnProximoClick(Sender: TObject);
begin
btnBloqueia.Click;
dmBaseDados.tblProdutos.Next;
if (dmBaseDados.tblProdutos.Eof) then
 begin
  FimTabela;
  dmBaseDados.tblProdutos.Last;
 end;
dmBaseDados.tblProdutos.Edit;
dmBaseDados.tblProdutosValorEmEstoque.AsFloat    := (dmBaseDados.tblProdutosEstoqueAtual.AsFloat)*(dmBaseDados.tblProdutosValorVenda.AsFloat);
dmBaseDados.tblProdutosValorCustoEstoque.AsFloat := (dmBaseDados.tblProdutosEstoqueAtual.AsFloat)*(dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat);
dmBaseDados.tblProdutos.Post;
end;

procedure TFormProdutos.btnUltimoClick(Sender: TObject);
begin
btnBloqueia.Click;
dmBaseDados.tblProdutos.Last;
end;

procedure TFormProdutos.btnExcluirClick(Sender: TObject);
begin
btnBloqueia.Click;
if (dmBaseDados.tblProdutosCodigo.AsString <> '9999999999-9') then
 begin
  dmBaseDados.tblProdutos.Delete;
 end;
end;

procedure TFormProdutos.btnAdicionarClick(Sender: TObject);
begin
btnBloqueia.Click;     
formConsultaCodigo.ShowModal;
end;

procedure TFormProdutos.btnRetornarClick(Sender: TObject);
begin
if( (dmBaseDados.tblProdutos.State = dsEdit)or(dmBaseDados.tblProdutos.State = dsInsert) )then
 begin
  if (Confirma('Há dados que não foram gravados !'+#13+'Grava alterações antes de fechar ?') = IDYES) then
   begin
    dmBaseDados.tblProdutos.Post;
    Close;
   end;
 end                
else
 Close;
end;

procedure TFormProdutos.btnLocalizarClick(Sender: TObject);
begin
btnBloqueia.Click;
formSeekProduto.ShowModal;
dmBaseDados.tblProdutos.IndexName := '';
end;

procedure TFormProdutos.btnGravarClick(Sender: TObject);
var strCodFamilia, strCodCategoria, strCodProduto, strDigito : String;
    strCodigo : String[10];
    intCodigo, intContador, intTamanho, intFator,
    intSoma, intDigito, intResto : Integer;
    fltResultado : Double;
    bmkRegistro : tBookMark;
begin
dmBaseDados.tblProdutos.IndexName := '';  
dmBaseDados.tblProdutos.Edit;
if( (dmBaseDados.tblProdutos.State = dsEdit)or(dmBaseDados.tblProdutos.State = dsInsert) )then
  Begin
   if (dmBaseDados.tblProdutosCodigoProduto.AsString = '') then
    Begin
     bmkRegistro     := dmBaseDados.tblProdutos.GetBookMark;
     strCodFamilia   := dmBaseDados.tblProdutosCodigoFamilia.AsString;
     strCodCategoria := dmBaseDados.tblProdutosCodigoCategoria.AsString;
     intCodigo       := 0;
     dmBaseDados.tblProdutos.Next;
     while( (dmBaseDados.tblProdutosCodigoFamilia.AsString = strCodFamilia)
      and   (dmBaseDados.tblProdutosCodigoCategoria.AsString = strCodCategoria)
      and   (not dmBaseDados.tblProdutos.Eof) )do
       begin
        strCodProduto   := dmBaseDados.tblProdutosCodigoProduto.AsString;
        intCodigo       := StrToInt(Copy(strCodProduto,1,4));
        dmBaseDados.tblProdutos.Next;
       end;
     Inc(intCodigo);
     strCodProduto      := IntToStr(intCodigo);
     intTamanho         := Length(strCodProduto);
     strCodProduto   := Copy('0000'+strCodProduto,intTamanho+1,4);
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
     dmBaseDados.tblProdutosBeneficio.AsString     := dbcBeneficio.Text;
     dmBaseDados.tblProdutos.Post;
     fldFamilia.Enabled   := False;
     fldCategoria.Enabled := False;
    End;
  End;
btnBloqueia.Click;
end;

procedure TFormProdutos.BitBtn1Click(Sender: TObject);
begin
dmBaseDados.tblProdutos.First;
while (not dmBaseDados.tblProdutos.Eof ) do
 begin
  dmBaseDados.tblProdutos.Edit;
  dmBaseDados.tblProdutosValorEmEstoque.AsFloat    := dmBaseDados.tblProdutosEstoqueAtual.AsFloat*dmBaseDados.tblProdutosValorVenda.AsFloat;
  dmBaseDados.tblProdutosValorCustoEstoque.AsFloat := dmBaseDados.tblProdutosEstoqueAtual.AsFloat*dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
  dmBaseDados.tblProdutos.Post;
  dmBaseDados.tblProdutos.Next;
 end;
end;

procedure TFormProdutos.Button1Click(Sender: TObject);
var strCodFamilia, strCodCategoria, strCodProduto : String;
begin
dmBaseDados.tblProdutos.First;
while (not dmBaseDados.tblProdutos.Eof) do
 begin
  strCodProduto   := dmBaseDados.tblProdutosCodigoProduto.AsString;
  strCodFamilia   := dmBaseDados.tblProdutosCodigoFamilia.AsString;
  strCodCategoria := dmBaseDados.tblProdutosCodigoCategoria.AsString;
  dmBaseDados.tblProdutos.Edit;
  dmBaseDados.tblProdutosCodigo.AsString := strCodFamilia+strCodCategoria+strCodProduto;
  dmBaseDados.tblProdutos.Post;
  dmBaseDados.tblProdutos.Next;
 end;
end;

procedure TFormProdutos.btnCalcularClick(Sender: TObject);
var strResultadoAtual, strResultadoEntrada, strResultadoTotal,
    strValCustoMedio, strProdutoEstoqueAtual : Double;
begin
strResultadoAtual   := 0;
strResultadoEntrada :=0;
strResultadoTotal   := 0;
strValCustoMedio    :=0;
dmBaseDados.tblProdutos.Edit;
dmBaseDados.tblFornecedores.Edit;
if (rbSaida.Checked = True) then
  Begin
   strProdutoEstoqueAtual := dmBaseDados.tblProdutosEstoqueAtual.AsFloat - StrToFloat(fldEntrada.Text);
   dmBaseDados.tblProdutosEstoqueAtual.AsFloat   := strProdutoEstoqueAtual;
   dmBaseDados.tblProdutosValorEmEstoque.AsFloat := (dmBaseDados.tblProdutosEstoqueAtual.AsFloat)*(dmBaseDados.tblProdutosValorVenda.AsFloat);
   dmBaseDados.tblProdutosValorCustoEstoque.AsFloat := (dmBaseDados.tblProdutosEstoqueAtual.AsFloat)* (dmBaseDados.tblProdutosValorCustoMedio.AsFloat);
   dmBaseDados.tblProdutos.Post;
   dmBaseDados.tblHistorico.Edit;
   dmBaseDados.tblHistoricoQuantidade.AsString := fldEntrada.Text;
   dmBaseDados.tblHistoricoNumeroRequisicao.AsString := fldNdocumento.Text;
   dmBaseDados.tblHistoricoClienteFornecedor.AsString := DBLookupComboBox1.Text;
   dmBaseDados.tblHistoricoDataLancamento.AsDateTime := DateTimePicker1.DateTime;
   dmBaseDados.tblHistoricoValorLancamento.AsFloat := StrToFloat(fldEntrada.text) * StrToFloat(fldValCusto.text);
   dmBaseDados.tblHistoricoStatus.AsString := 'S';
   dmBaseDados.tblHistoricoCodigoProduto.AsString  := dmBaseDados.tblProdutosCodigo.AsString;
   dmBaseDados.tblHistorico.Post;
  End
else
  Begin
   strProdutoEstoqueAtual := StrToFloat(fldEntrada.Text) + dmBaseDados.tblProdutosEstoqueAtual.AsFloat;
   strResultadoAtual := dmBaseDados.tblProdutosEstoqueAtual.AsFloat * dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
   strResultadoEntrada := StrToFloat(fldEntrada.text) * StrToFloat(fldValCusto.text);
   strResultadoTotal := strResultadoAtual + strResultadoEntrada;
   strValCustoMedio := (strResultadoTotal / strProdutoEstoqueAtual);
   dmBaseDados.tblProdutosValorCustoMedio.AsFloat   := strValCustoMedio;
   dmBaseDados.tblProdutosEstoqueAtual.AsFloat      := strProdutoEstoqueAtual;
   dmBaseDados.tblProdutosValorEmEstoque.AsFloat    := dmBaseDados.tblProdutosEstoqueAtual.AsFloat * dmBaseDados.tblProdutosValorVenda.AsFloat;
   dmBaseDados.tblProdutosValorCustoEstoque.AsFloat := dmBaseDados.tblProdutosEstoqueAtual.AsFloat * dmBaseDados.tblProdutosValorCustoMedio.AsFloat;
   dmBaseDados.tblProdutos.Post;
   dmBaseDados.tblHistorico.Edit;
   dmBaseDados.tblHistoricoQuantidade.AsString        := fldEntrada.Text;
   dmBaseDados.tblHistoricoNumeroRequisicao.AsString  := fldNdocumento.Text;
   dmBaseDados.tblHistoricoClienteFornecedor.AsString := DBLookupComboBox1.Text;
   dmBaseDados.tblHistoricoDataLancamento.AsDateTime  := DateTimePicker1.DateTime;
   dmBaseDados.tblHistoricoValorLancamento.AsFloat    := StrToFloat(fldEntrada.text) * StrToFloat(fldValCusto.text);
   dmBaseDados.tblHistoricoStatus.AsString            := 'E';
   dmBaseDados.tblHistoricoCodigoProduto.AsString     := dmBaseDados.tblProdutosCodigo.AsString;
   dmBaseDados.tblHistorico.Post;
  End;
end;

procedure TFormProdutos.rbEntradaClick(Sender: TObject);
begin
rbSaida.Checked := False;
end;

procedure TFormProdutos.rbSaidaClick(Sender: TObject);
begin
rbEntrada.Checked := False;
end;

procedure TFormProdutos.fldEntradaExit(Sender: TObject);
begin
fldNdocumento.ReadOnly := False;
fldValCusto.ReadOnly   := False;
DBLookupComboBox1.ReadOnly := False;
dmBaseDados.tblHistorico.Append;
dmBaseDados.tblHistorico.Insert;
end;

procedure TFormProdutos.fldMargemLucroExit(Sender: TObject);
var strValorVenda, strValorCusto, strMargem : Double;
begin
strValorCusto := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
strMargem     := dmBaseDados.tblProdutosMargemLucro.AsFloat;
dmBaseDados.tblProdutos.Edit;
dmBaseDados.tblProdutosValorVenda.AsFloat := (strValorCusto*strMargem/100)+strValorCusto;
dmBaseDados.tblProdutos.Post;
end;

procedure TFormProdutos.fldVlVendaExit(Sender: TObject);
var strpvenda, strpcusto, strmlucro : Double;
begin
strpvenda := dmBaseDados.tblProdutosValorVenda.AsFloat;
strpcusto := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
dmBaseDados.tblProdutos.Edit;
dmBaseDados.tblProdutosMargemLucro.AsFloat := (strpvenda-strpcusto)*100/strpcusto;
dmBaseDados.tblProdutos.Post;
end;

procedure TFormProdutos.btnAlterarFamCatClick(Sender: TObject);
begin
if (Application.MessageBox('Deseja Alterar Família ou Categoria??','Tem Certeza??',MB_YESNO) = IDYES) then
 begin
  fldFamilia.Enabled   := True;
  fldCategoria.Enabled := True;
  dmBaseDados.tblProdutos.Edit;
  dmBaseDados.tblProdutosCodigoProduto.AsString := '';
 end
else
 begin
  fldFamilia.Enabled   := False;
  fldCategoria.Enabled := False;
 end;
end;

procedure TFormProdutos.btnAlterarClick(Sender: TObject);
begin
formSenhaAltCad.ShowModal;
if (stsAltProd = 1) then
  Begin
   btnExcluir.Enabled             := True;
   btnAlterarFamCat.Enabled       := True;
   fldMarca.ReadOnly              := False;
   fldDescricaoAbreviada.ReadOnly := False;
   fldDescricaoDetalhada.ReadOnly := False;
   fldUnidade.ReadOnly            := False;
   fldLocalizacao.ReadOnly        := False;
   dbcBeneficio.ReadOnly          := False;
   fldICMS.ReadOnly               := False;
   fldVlAtual.ReadOnly            := False;
   fldVlVenda.ReadOnly            := False;
   fldMargemLucro.ReadOnly        := False;
   fldEstoqueAtual.ReadOnly       := False;
   fldEstoqueMax.ReadOnly         := False;
   fldEstoqueMin.ReadOnly         := False;
   fldCodigoInterno.ReadOnly      := False;
   fldReferencia.ReadOnly         := False;
   FLDREFERENCIA2.ReadOnly        := False;
   FLDREFERENCIA3.ReadOnly        := False;
   FLDREFERENCIA4.ReadOnly        := False;
   fldCodigoBarra.ReadOnly        := False;
   fldCaracteristicas.ReadOnly    := False;
   fldQtdCaixa.ReadOnly           := False;
   fldPeso.ReadOnly               := False;
  End
else
  Begin
   btnBloqueia.Click;
  End;
end;

procedure TFormProdutos.btnBloqueiaClick(Sender: TObject);
begin
btnExcluir.Enabled             := False;
btnAlterarFamCat.Enabled       := False;
fldMarca.ReadOnly              := True;
fldDescricaoAbreviada.ReadOnly := True;
fldDescricaoDetalhada.ReadOnly := True;
fldUnidade.ReadOnly            := True;
fldLocalizacao.ReadOnly        := True;
dbcBeneficio.ReadOnly          := True;
fldICMS.ReadOnly               := True;
fldVlAtual.ReadOnly            := True;
fldVlVenda.ReadOnly            := True;
fldEstoqueMax.ReadOnly         := True;
fldEstoqueMin.ReadOnly         := True;
fldCodigoInterno.ReadOnly      := True;
fldReferencia.ReadOnly         := True;
FLDREFERENCIA2.ReadOnly        := True;
FLDREFERENCIA3.ReadOnly        := True;
FLDREFERENCIA4.ReadOnly        := True;
fldCodigoBarra.ReadOnly        := True;
fldCaracteristicas.ReadOnly    := True;
fldQtdCaixa.ReadOnly           := True;
fldPeso.ReadOnly               := True;
end;

end.
