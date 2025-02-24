
unit MenuPrincipal; 

interface              

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Menus, ExtCtrls, ComCtrls, ToolWin, ImgList, JPEG, StdCtrls, XPMan, Variants;

type
  TformMenuPrincipal = class(TForm)
    MainMenu1                 : TMainMenu;
    opcCadEntregas: TMenuItem;
    opcFamiliaCategoria       : TMenuItem;
    mnuSair                   : TMenuItem;
    imgFundo                  : TImage;
    stsInforma                : TStatusBar;           
    cbarFerramentas           : TCoolBar;
    tbarBotoes                : TToolBar;
    btnFamiliaCategoria       : TToolButton;
    btnSair                   : TToolButton;
    tmrRelogio                : TTimer;
    opcMarcas                 : TMenuItem;
    btnMarcas                 : TToolButton;
    btnProdutos               : TToolButton;
    opcProdutos               : TMenuItem;
    opcFornecedores           : TMenuItem;
    opcClientes               : TMenuItem;
    opcFuncionarios           : TMenuItem;
    btnClientes               : TToolButton;
    mnuEntradas               : TMenuItem;
    opcNotaFiscal             : TMenuItem;
    ToolButton1               : TToolButton;
    opcDevolucao              : TMenuItem;
    mnuSaidas                 : TMenuItem;
    opcVendas                 : TMenuItem;
    btnVendas                 : TToolButton;
    ToolButton2               : TToolButton;
    opcPerdas                 : TMenuItem;
    mnuRelatorios             : TMenuItem;
    opcRelFamilias            : TMenuItem;
    opcRelFamiliaCodigo       : TMenuItem;
    opcRelFamiliaAlfa         : TMenuItem;
    opcRelCategorias          : TMenuItem;
    opcRelCategoriaCodigo     : TMenuItem;
    opcRelCategoriaAlfa       : TMenuItem;
    opcRelGrupoFamilia        : TMenuItem;
    MarcasdeProdutos1         : TMenuItem;
    opcRelMarcaCodigo         : TMenuItem;
    opcRelMarcaAlfa           : TMenuItem;
    opcRelFornecedores        : TMenuItem;
    opcRelFornecedorCodigo    : TMenuItem;
    opcRelFornecedorCNPJ      : TMenuItem;
    opcRelFornecedorNome      : TMenuItem;
    opcRelFornecedorTipo      : TMenuItem;
    opcRelProdutos            : TMenuItem;
    opcRelFuncionarios        : TMenuItem;
    opcRelFuncionarioCodigo   : TMenuItem;
    opcRelFuncionarioAlfa     : TMenuItem;
    opcRelClientes            : TMenuItem;
    opcRelClienteAlfa         : TMenuItem;
    opcRelClienteCodigo       : TMenuItem;
    mnuCompras                : TMenuItem;
    opcNecessidades           : TMenuItem;
    opcEmitirOC               : TMenuItem;
    opcRelOCEmitida           : TMenuItem;
    opcNumeroOC               : TMenuItem;
    opcDataEmissao            : TMenuItem;
    opcRelLogMensal           : TMenuItem;
    opcEditaEstado            : TMenuItem;
    opcOrdemServico           : TMenuItem;
    btnOrdemServico           : TToolButton;
    ClientesOficina1          : TMenuItem;
    CaixaDirio1               : TMenuItem;
    opcContasReceber          : TMenuItem;
    ContasaPagar1             : TMenuItem;
    opcComissao               : TMenuItem;
    opcTodosVendedores        : TMenuItem;
    opcSelVendedor            : TMenuItem;
    opcRelProdutoFamilia      : TMenuItem;
    opcEmissaoNota            : TMenuItem;
    opcReemissaoPedidos       : TMenuItem;
    btnReemicaoPedidos        : TToolButton;
    ToolButton5               : TToolButton;
    opcBaixa                  : TMenuItem;
    opcBonificacaoTroca       : TMenuItem;
    opcRelCheques             : TMenuItem;
    GeraArquivoContabilidade1 : TMenuItem;
    ProdutosVendidos1         : TMenuItem;
    opcOrdemdeCategoria       : TMenuItem;
    opcPedEstornados: TMenuItem;
    OrdemdeRamodeAtividade1   : TMenuItem;
    OrdemdeIntinerario1       : TMenuItem;
    OrdemdeCdigo1             : TMenuItem;
    OrdemdeDescrio1           : TMenuItem;
    OrdemdeRefdeFabricante1   : TMenuItem;
    FluxodeCaixa1: TMenuItem;
    EstornodePedidosBaixados1: TMenuItem;
    CpiaLimpeza1: TMenuItem;
    opcCobranca: TMenuItem;
    PedidosNoBaixados1: TMenuItem;
    Relatrio1: TMenuItem;
    Lista1: TMenuItem;
    Relatrio2: TMenuItem;
    Lista2: TMenuItem;
    Relatrio3: TMenuItem;
    Lista3: TMenuItem;
    Relatrio4: TMenuItem;
    Lista4: TMenuItem;
    NumeroChekout1: TMenuItem;
    RamoAtividade1: TMenuItem;
    PositivaodeClientes1: TMenuItem;
    Checkout1: TMenuItem;
    Backup1: TMenuItem;
    Local1: TMenuItem;
    IndexarTabelas1: TMenuItem;
    NotaECF1: TMenuItem;
    ReajustarPreo1: TMenuItem;
    opcConsultaPreco: TMenuItem;
    lstImagens: TImageList;
    ECF1: TMenuItem;
    PedidosVendas1: TMenuItem;
    btnFerramentaMBJ: TButton;
    RepararCTEMP1: TMenuItem;
    XPManifest1: TXPManifest;
    opcConfiguracoesSAT: TMenuItem;
    RelatrioSAT1: TMenuItem;
    opcEntregas: TMenuItem;
    GerarXMLSAT1: TMenuItem;
    ListagemClientes1: TMenuItem;
    NotaFiscalEletrnica1: TMenuItem;
    GerenciadorNFe1: TMenuItem;
    AtualizarCdIBGE1: TMenuItem;
    ReimprimirSAT1: TMenuItem;
    CancelarSAT1: TMenuItem;
    btnConfAcbr: TButton;
    FiltroporPalavra1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure opcFamiliaCategoriaClick(Sender: TObject);
    procedure mnuSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    //procedure MostraDicas(sender: TObject);
    procedure tmrRelogioTimer(Sender: TObject);
    procedure opcMarcasClick(Sender: TObject);
    procedure opcProdutosClick(Sender: TObject);
    procedure opcFornecedoresClick(Sender: TObject);
    procedure opcClientesClick(Sender: TObject);
    procedure opcFuncionariosClick(Sender: TObject);
    procedure opcNotaFiscalClick(Sender: TObject);
    procedure opcDevolucaoClick(Sender: TObject);
    procedure opcVendasClick(Sender: TObject);
    procedure opcPerdasClick(Sender: TObject);
    procedure opcRelFamiliaCodigoClick(Sender: TObject);
    procedure opcRelCategoriaCodigoClick(Sender: TObject);
    procedure opcRelGrupoFamiliaClick(Sender: TObject);
    procedure opcRelMarcaCodigoClick(Sender: TObject);
    procedure opcRelFuncionarioCodigoClick(Sender: TObject);
    procedure opcNecessidadesClick(Sender: TObject);
    procedure opcEmitirOCClick(Sender: TObject);
    procedure opcNumeroOCClick(Sender: TObject);
    procedure opcDataEmissaoClick(Sender: TObject);
    procedure opcEditaEstadoClick(Sender: TObject);
    procedure ClientesOficina1Click(Sender: TObject);
    procedure CaixaDirio1Click(Sender: TObject);
    procedure opcContasReceberClick(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure opcComissaoClick(Sender: TObject);
    procedure opcSelVendedorClick(Sender: TObject);
    procedure opcTodosVendedoresClick(Sender: TObject);
    procedure opcRelProdutoFamiliaClick(Sender: TObject);
    procedure opcEmissaoNFClick(Sender: TObject);
    procedure opcEmissaoNotaClick(Sender: TObject);
    procedure opcReemissaoPedidosClick(Sender: TObject);
    procedure opcRelLogMensalClick(Sender: TObject);
    procedure opcBaixaClick(Sender: TObject);
    procedure opcBonificacaoTrocaClick(Sender: TObject);
    procedure opcRelChequesClick(Sender: TObject);
    procedure GeraArquivoContabilidade1Click(Sender: TObject);
    procedure ProdutosVendidos1Click(Sender: TObject);
    procedure opcOrdemdeCategoriaClick(Sender: TObject);
    procedure opcRelClienteCodigoClick(Sender: TObject);
    procedure opcPedEstornadosClick(Sender: TObject);
    procedure OrdemdeRamodeAtividade1Click(Sender: TObject);
    procedure OrdemdeIntinerario1Click(Sender: TObject);
    procedure EstoqueClick(Sender: TObject);
    procedure OrdemdeCdigo1Click(Sender: TObject);
    procedure OrdemdeDescrio1Click(Sender: TObject);
    procedure OrdemdeRefdeFabricante1Click(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
    procedure EstornodePedidosBaixados1Click(Sender: TObject);
    procedure CpiaLimpeza1Click(Sender: TObject);
    procedure opcCobrancaClick(Sender: TObject);
    procedure PedidosNoBaixados1Click(Sender: TObject);
    procedure Relatrio1Click(Sender: TObject);
    procedure Relatrio2Click(Sender: TObject);
    procedure Relatrio4Click(Sender: TObject);
    procedure Relatrio3Click(Sender: TObject);
    procedure Lista1Click(Sender: TObject);
    procedure Lista2Click(Sender: TObject);
    procedure Lista4Click(Sender: TObject);
    procedure Lista3Click(Sender: TObject);
    procedure NumeroChekout1Click(Sender: TObject);
    procedure PositivaodeClientes1Click(Sender: TObject);
    procedure RamoAtividade1Click(Sender: TObject);
    procedure Checkout1Click(Sender: TObject);
    procedure Backup1Click(Sender: TObject);
    procedure Local1Click(Sender: TObject);
    procedure IndexarTabelas1Click(Sender: TObject);
    procedure NotaECF1Click(Sender: TObject);
    procedure ReajustarPreo1Click(Sender: TObject);
    procedure opcConsultaPrecoClick(Sender: TObject);
    procedure ECF1Click(Sender: TObject);
    procedure PedidosVendas1Click(Sender: TObject);
    procedure btnFerramentaMBJClick(Sender: TObject);
    procedure RepararCTEMP1Click(Sender: TObject);
    procedure opcConfiguracoesSATClick(Sender: TObject);
    procedure RelatrioSAT1Click(Sender: TObject);
    procedure opcEntregasClick(Sender: TObject);
    procedure GerarXMLSAT1Click(Sender: TObject);
    procedure ListagemClientes1Click(Sender: TObject);
    procedure GerenciadorNFe1Click(Sender: TObject);
    procedure AtualizarCdIBGE1Click(Sender: TObject);
    procedure ReimprimirSAT1Click(Sender: TObject);
    procedure CancelarSAT1Click(Sender: TObject);
    procedure btnConfAcbrClick(Sender: TObject);
    procedure FiltroporPalavra1Click(Sender: TObject);
    procedure GerenciadorNfeNOVA1Click(Sender: TObject);
    procedure EmissoNotaFiscalNOVA1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formMenuPrincipal : TformMenuPrincipal;
    AcessStatus, NA : Integer;
    Usuario, fltVendedor, fltFamilia,
    fltCategoria, stsNotaE : String;

implementation

uses FamiliaCategoria, RotinasGerais, MarcasProdutos, Produtos,
     Fornecedor, Clientes, Funcionarios, EntraCompras, Devolucao,
     Venda, Perdas, RelFamilias, ModuloDados, RelCategorias,
     RelGrupoFamilia, RelMarcas, RelFornecedores, RelProdutos,
     RelFuncionarios, RelClientes, Necessidades, OrdemCompra,
     RelOrdemCompra, NumeroOC, dataOC, LogMensal, eDITAeSTADOS,
     OrdemServico, CaixaServico, ContasReceber, ContasPagar,
     Comissao, LoginSGE, RelSelVendedor, RelSelFamilia, NotaFiscal,
     RelNotaFiscal, ReemissaoPedidos, ContasPagarN, BaixaPedido,
     BonificacaoTroca, RelBonificacaoTroca, Cheques, Contabilidade,
     DigitacaoPedido, ProdutosVendidos, RelSelCategoria, FluxoCaixa,
     PedidosEstornado, SelcFamilia, EmEstoque, EmEstoqueDesc,
     EmEstoqueRefFab, SituacaoCodCli, SituacaoRefFab, SituacaoOrdemAlf,
     EstornoBaixado, CopiaLimpeza, Cobranca, PedidosNaoBaixados,
     MargemRelacionadasMinima, NaoBaixadoCR, RelListaFornecedor,
     situacaonchekout, PositivacaoCliente, RamoAtividade, Checkout,
     IndexarTabela, Backup, Local, ValorProduto, NotaECF, db,
     PrecoConsulta, ECF, Senha, Unit1, TesteSat, SATRelatorio, XMLSat,
     CadEntregas, RelCliTel, PerguntaNFe, NFeDevolucao, GerenciarNFe,
     RotinasSAT, ConfigAcbr, FitroProdDesc, GerenciarNFeNew, NotaFiscalNew,
  NFeDevolucaoNew;


{$R *.DFM}


procedure TformMenuPrincipal.FormShow(Sender: TObject);
begin
with formMenuPrincipal do
 begin
  Top    := 0;
  Left   := 0;
  Width  := Screen.Width;
  Height := Screen.Height;
 end;
imgFundo.Picture.LoadFromFile('carro3.bmp');
stsInforma.Panels[1].Text := MostraData(Date);
stsInforma.Panels[0].Text := 'SEJA BEM VINDO!!!';
AcessStatus := 0;
NA := 0;
while( (NA < 3)and(AcessStatus = 0) )do
 begin
  frmSenha.ShowModal;              
  NA := NA + 1;
 end;
if (AcessStatus = 0)  then
 Application.Terminate;
end;

procedure TformMenuPrincipal.opcFamiliaCategoriaClick(Sender: TObject);
begin
formFamiliaCategoria.ShowModal;
end;

procedure TformMenuPrincipal.mnuSairClick(Sender: TObject);
begin
if (Confirma('Encerra Sistema ?'+#13) = IDYES) then
 begin
  Application.Terminate;
 end;
end;

procedure TformMenuPrincipal.FormCreate(Sender: TObject);
begin
formMenuPrincipal.stsInforma.Panels[0].Text := Application.Hint;
end;

procedure TformMenuPrincipal.tmrRelogioTimer(Sender: TObject);
begin
stsInforma.Panels[2].Text := TimeToStr(Time);
end;

procedure TformMenuPrincipal.opcMarcasClick(Sender: TObject);
begin
formMarcas.ShowModal;
end;

procedure TformMenuPrincipal.opcProdutosClick(Sender: TObject);
begin
formProdutos.ShowModal;    
end;

procedure TformMenuPrincipal.opcFornecedoresClick(Sender: TObject);
begin
formfornecedores.ShowModal;
end;

procedure TformMenuPrincipal.opcClientesClick(Sender: TObject);
begin
formClientes.ShowModal;
end;

procedure TformMenuPrincipal.opcFuncionariosClick(Sender: TObject);
begin
formFuncionarios.ShowModal;
end;

procedure TformMenuPrincipal.opcNotaFiscalClick(Sender: TObject);
begin
formEntradaCompra.ShowModal;
end;

procedure TformMenuPrincipal.opcDevolucaoClick(Sender: TObject);
begin
formDevolucao.ShowModal;
end;

procedure TformMenuPrincipal.opcVendasClick(Sender: TObject);
begin
frmDigitacaoPedido.ShowModal;
end;

procedure TformMenuPrincipal.opcPerdasClick(Sender: TObject);
begin
formPerdas.ShowModal;
end;

procedure TformMenuPrincipal.opcRelFamiliaCodigoClick(Sender: TObject);
begin
dmBaseDados.tblFamilias.Open;
if (Sender = opcRelFamiliaAlfa) then
 begin
  dmBaseDados.tblFamilias.IndexName := 'IndDescricao';
  formRelFamilia.lblOrdem.Caption   := 'ORDEM DE DESCRIÇÃO';
 end
else
 begin
  formRelFamilia.lblOrdem.Caption   := 'ORDEM DE CÓDIGO';
 end;
formRelFamilia.rptFamilias.Preview;
dmBaseDados.tblFamilias.IndexName := '';
dmBaseDados.tblFamilias.Close;
end;

procedure TformMenuPrincipal.opcRelCategoriaCodigoClick(Sender: TObject);
begin
dmBaseDados.tblCategoria.Open;
if (Sender = opcRelCategoriaAlfa) then
 begin
  dmBaseDados.tblCategoria.IndexName := 'IndDescricao';
  formRelCategoria.lblOrdem.Caption  := 'ORDEM DE DESCRIÇÃO';
 end
else
 begin
  formRelCategoria.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
 end;
formRelCategoria.rptCategorias.Preview;
dmBaseDados.tblCategoria.IndexName := '';
dmBaseDados.tblCategoria.Close;
end;

procedure TformMenuPrincipal.opcRelGrupoFamiliaClick(Sender: TObject);
begin
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblCategoria.Open;
formRelGrupoFamilia.rptGrupoFamilia.Preview;
dmBaseDados.tblFamilias.Close;
dmBaseDados.tblCategoria.Close;
end;

procedure TformMenuPrincipal.opcRelMarcaCodigoClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.Open;
if (Sender = opcRelMarcaAlfa) then
 begin
  dmBaseDados.tblMarcas.IndexName := 'IndMarca';
  formRelMarca.lblOrdem.Caption   := 'ORDEM DE DESCRIÇÃO'
 end
else
 begin
  formRelMarca.lblOrdem.Caption   := 'ORDEM DE CÓDIGO';
 end;
formRelMarca.rptMarcas.Preview;
dmBaseDados.tblMarcas.IndexName := '';
dmBaseDados.tblMarcas.Close;
end;

procedure TformMenuPrincipal.opcRelFuncionarioCodigoClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Open;
if (Sender = opcRelFuncionarioAlfa) then
 begin
  dmBaseDados.tblFuncionarios.IndexName := 'IndFuncionario';
  formRelFuncionario.lblOrdem.Caption   := 'ORDEM DE NOME';
 end
else
 begin
  formRelFuncionario.lblOrdem.Caption   := 'ORDEM DE CÓDIGO';
 end;
formRelFuncionario.rptFuncionarios.Preview;
dmBaseDados.tblFuncionarios.IndexName := '';
dmBaseDados.tblFuncionarios.Close;
end;

procedure TformMenuPrincipal.opcNecessidadesClick(Sender: TObject);
begin
formNecessidades.ShowModal;
end;

procedure TformMenuPrincipal.opcEmitirOCClick(Sender: TObject);
begin
formOrdemCompra.ShowModal;
end;

procedure TformMenuPrincipal.opcNumeroOCClick(Sender: TObject);
begin
formNumeroOC.ShowModal;
dmBaseDados.tblNumeroOC.Open;
dmBaseDados.tblRelOC.Open;
dmBaseDados.tblRelOC.IndexName    := 'IndOrdemCompra';
dmBaseDados.tblRelOC.MasterSource := dmBaseDados.dsNumeroOC;
dmBaseDados.tblRelOC.MasterFields := 'OrdemCompra';
if (dmBaseDados.tblRelOC.RecordCount <> 0) then
 formRelOC.rptOrdemCompra.Preview;
dmBaseDados.tblRelOC.MasterFields := '';
dmBaseDados.tblRelOC.MasterSource := nil;
dmBasedados.tblRelOC.IndexName    := '';
dmBasedados.tblRelOC.Close;
dmBaseDados.tblNumeroOC.Close;
end;

procedure TformMenuPrincipal.opcDataEmissaoClick(Sender: TObject);
begin
formDataOC.ShowModal;
dmBaseDados.tblNumeroOC.Open;
dmBaseDados.tblRelOC.Open;
dmBaseDados.tblRelOC.IndexName    := 'IndOrdemCompra';
dmBaseDados.tblRelOC.MasterSource := dmBaseDados.dsNumeroOC;
dmBaseDados.tblRelOC.MasterFields := 'OrdemCompra';
if (dmBaseDados.tblRelOC.RecordCount <> 0) then
 formRelOC.rptOrdemCompra.Preview;
dmBaseDados.tblRelOC.MasterFields := '';
dmBaseDados.tblRelOC.MasterSource := nil;
dmBasedados.tblRelOC.IndexName    := '';
dmBasedados.tblRelOC.Close;
dmBaseDados.tblNumeroOC.Close;
end;

procedure TformMenuPrincipal.opcEditaEstadoClick(Sender: TObject);
begin
formEditaEstado.ShowModal;
end;

procedure TformMenuPrincipal.ClientesOficina1Click(Sender: TObject);
begin
formNaoBaixadoCR.ShowModal;
end;

procedure TformMenuPrincipal.CaixaDirio1Click(Sender: TObject);
begin
formCaixaServico.ShowModal;
end;

procedure TformMenuPrincipal.opcContasReceberClick(Sender: TObject);
begin
formContasReceber.ShowModal;
end;

procedure TformMenuPrincipal.ContasaPagar1Click(Sender: TObject);
begin
formContasPagar.ShowModal;
end;

procedure TformMenuPrincipal.opcComissaoClick(Sender: TObject);
begin
frmComissao.ShowModal;
end;

procedure TformMenuPrincipal.opcSelVendedorClick(Sender: TObject);
begin
formSelVendedor.ShowModal;
end;

procedure TformMenuPrincipal.opcTodosVendedoresClick(Sender: TObject);
begin
formSituacaoOrdemAlf.ShowModal;
end;

procedure TformMenuPrincipal.opcRelProdutoFamiliaClick(Sender: TObject);
begin
formSelFamilia.ShowModal;
end;

procedure TformMenuPrincipal.opcEmissaoNFClick(Sender: TObject);
begin
FrmEmissaoNF.ShowModal;
end;

procedure TformMenuPrincipal.opcEmissaoNotaClick(Sender: TObject);
begin
formPerguntaNFe.ShowModal;
if (stsNotaE = 'N') then
 begin
  Abort;
 end;
if (stsNotaE = 'D') then
 begin
  formNFeDevolucao.ShowModal;
 end
else
 begin
  FrmEmissaoNF.ShowModal;
 end;
end;

procedure TformMenuPrincipal.opcReemissaoPedidosClick(Sender: TObject);
begin
FormReemissaoPedidos.ShowModal;
end;

procedure TformMenuPrincipal.opcRelLogMensalClick(Sender: TObject);
begin
formLogMensal.ShowModal;
end;

procedure TformMenuPrincipal.opcBaixaClick(Sender: TObject);
begin
FormBaixaPedidos.ShowModal;
end;

procedure TformMenuPrincipal.opcBonificacaoTrocaClick(Sender: TObject);
Begin
FormBonificacaoTroca.ShowModal;
end;

procedure TformMenuPrincipal.opcRelChequesClick(Sender: TObject);
begin
FormCheques.ShowModal;
end;

procedure TformMenuPrincipal.GeraArquivoContabilidade1Click(Sender: TObject);
begin
frmContabilidade.ShowModal;
end;

procedure TformMenuPrincipal.ProdutosVendidos1Click(Sender: TObject);
begin
frmProdutosVendidos.ShowModal;
end;

procedure TformMenuPrincipal.opcOrdemdeCategoriaClick(Sender: TObject);
begin
fltCategoria:='';
formSelCategoria.ShowModal;
end;

procedure TformMenuPrincipal.opcRelClienteCodigoClick(Sender: TObject);
begin
formSituacaoCodCli.ShowModal;
end;

procedure TformMenuPrincipal.opcPedEstornadosClick(Sender: TObject);
begin
frmEstornados.ShowModal;
end;

procedure TformMenuPrincipal.OrdemdeRamodeAtividade1Click(Sender: TObject);
begin
formSituacaoRamAtv.ShowModal;
end;

procedure TformMenuPrincipal.OrdemdeIntinerario1Click(Sender: TObject);
begin
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.IndexName := 'IndInt1';
dmBaseDados.tblClientes.IndexName := 'IndInt2';
dmBaseDados.tblClientes.IndexName := 'IndInt3';
dmBaseDados.tblClientes.IndexName := 'IndInt4';
formRelClientes.lblOrdem.Caption  := 'ORDEM DE INTINERÁRIO';
formRelClientes.rptClientes.Preview;
dmBaseDados.tblClientes.IndexName := '';
dmBaseDados.tblClientes.Close;
end;

procedure TformMenuPrincipal.EstoqueClick(Sender: TObject);
begin
formSelecFamilia.ShowModal;
end;

procedure TformMenuPrincipal.OrdemdeCdigo1Click(Sender: TObject);
begin
formEmEstoque.ShowModal
end;

procedure TformMenuPrincipal.OrdemdeDescrio1Click(Sender: TObject);
begin
formEmEstoqueDesc.ShowModal;
end;

procedure TformMenuPrincipal.OrdemdeRefdeFabricante1Click(Sender: TObject);
begin
formEmEstoqueRefFab.ShowModal;
end;

procedure TformMenuPrincipal.FluxodeCaixa1Click(Sender: TObject);
begin
formFluxoCaixa.ShowModal;
end;

procedure TformMenuPrincipal.EstornodePedidosBaixados1Click(Sender: TObject);
begin
formEstornoBaixado.ShowModal;
end;

procedure TformMenuPrincipal.CpiaLimpeza1Click(Sender: TObject);
begin
formCopiaLimpeza.ShowModal;
end;

procedure TformMenuPrincipal.opcCobrancaClick(Sender: TObject);
begin
formCobranca.ShowModal;
end;

procedure TformMenuPrincipal.PedidosNoBaixados1Click(Sender: TObject);
begin
formPedidosNaoBaixados.ShowModal;
end;

procedure TformMenuPrincipal.Relatrio1Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
formRelFornecedor.lblOrdem.Caption    := 'ORDEM DE CÓDIGO';
formRelFornecedor.rptFornecedores.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Relatrio2Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndCNPJ';
formRelFornecedor.lblOrdem.Caption    := 'ORDEM DE C.N.P.J.';
formRelFornecedor.rptFornecedores.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Relatrio4Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndFornecedor';
formRelFornecedor.lblOrdem.Caption    := 'ORDEM DE NOME FANTASIA';
formRelFornecedor.rptFornecedores.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Relatrio3Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndTipo';
formRelFornecedor.lblOrdem.Caption    := 'ORDEM DE TIPO DE FORNECEDOR';
formRelFornecedor.rptFornecedores.Preview;
dmBaseDados.tblFornecedores.IndexName :='';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Lista1Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
formRellistaFornecedor.lblOrdem1.Caption    := 'ORDEM DE CÓDIGO';
formRellistaFornecedor.qrprellistaFornecedor.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Lista2Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndCNPJ';
formRellistaFornecedor.lblOrdem1.Caption    := 'ORDEM DE C.N.P.J.';
formRellistaFornecedor.qrprellistaFornecedor.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Lista4Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndFornecedor';
formRellistaFornecedor.lblOrdem1.Caption    := 'ORDEM DE NOME FANTASIA';
formRellistaFornecedor.qrprellistaFornecedor.Preview;
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.Lista3Click(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFornecedores.IndexName := 'IndTipo';
formRellistaFornecedor.lblOrdem1.Caption    := 'ORDEM DE TIPO DE FORNECEDOR';
formRellistaFornecedor.qrprellistaFornecedor.Preview;
dmBaseDados.tblFornecedores.IndexName :='';
dmBaseDados.tblFornecedores.Close;
end;

procedure TformMenuPrincipal.NumeroChekout1Click(Sender: TObject);
begin
formsituacaonchekout.ShowModal;
end;

procedure TformMenuPrincipal.PositivaodeClientes1Click(Sender: TObject);
begin
formPositivacaoCliente.ShowModal;
end;

procedure TformMenuPrincipal.RamoAtividade1Click(Sender: TObject);
begin
formRamoAtividade.ShowModal;
end;

procedure TformMenuPrincipal.Checkout1Click(Sender: TObject);
begin
formCheckout.ShowModal;
end;

procedure TformMenuPrincipal.Backup1Click(Sender: TObject);
begin
formbackup.ShowModal;
end;

procedure TformMenuPrincipal.Local1Click(Sender: TObject);
begin
formLocal.ShowModal;
end;

procedure TformMenuPrincipal.IndexarTabelas1Click(Sender: TObject);
begin
formIndexar.ShowModal;
end;

procedure TformMenuPrincipal.NotaECF1Click(Sender: TObject);
begin
frmNotaECF.ShowModal;
end;

procedure TformMenuPrincipal.ReajustarPreo1Click(Sender: TObject);
begin
formValorproduto.ShowModal;
end;

procedure TformMenuPrincipal.opcConsultaPrecoClick(Sender: TObject);
begin
formprecoConsulta.showmodal;
end;

procedure TformMenuPrincipal.ECF1Click(Sender: TObject);
begin
formSAT.ShowModal;
end;

procedure TformMenuPrincipal.PedidosVendas1Click(Sender: TObject);
begin
formPedidosNaoBaixados.ShowModal;
end;

procedure TformMenuPrincipal.btnFerramentaMBJClick(Sender: TObject);
begin
formSenha.ShowModal;
end;

procedure TformMenuPrincipal.RepararCTEMP1Click(Sender: TObject);
begin
Winexec('F:\PERFIL\copiaTEMP.bat',SW_SHOWNORMAL);
end;

procedure TformMenuPrincipal.opcConfiguracoesSATClick(Sender: TObject);
begin
formSwedaSAT.ShowModal;
end;

procedure TformMenuPrincipal.RelatrioSAT1Click(Sender: TObject);
begin
formSATRelatorio.ShowModal;
end;

procedure TformMenuPrincipal.opcEntregasClick(Sender: TObject);
begin
formCadEntregas.ShowModal;
end;

procedure TformMenuPrincipal.GerarXMLSAT1Click(Sender: TObject);
begin
formXMLSat.ShowModal;
end;

procedure TformMenuPrincipal.ListagemClientes1Click(Sender: TObject);
begin
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.IndexName := 'IndCliente';
formRelCliTel.lblOrdem.Caption    := 'Listagem de Clientes';
formRelCliTel.qrpCliTel.Preview;
dmBaseDados.tblClientes.Close;
end;

procedure TformMenuPrincipal.GerenciadorNFe1Click(Sender: TObject);
begin
formGerenciarNFe.ShowModal;
end;

procedure TformMenuPrincipal.AtualizarCdIBGE1Click(Sender: TObject);
var strEstado, strCidade : String;
begin
dmBaseDados.tblCidades.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblFornecedores.Open;
while (not dmBaseDados.tblClientes.Eof) do
  Begin
   strCidade := dmBaseDados.tblClientesCidade.AsString;
   strEstado := dmBaseDados.tblClientesEstado.AsString;
   if (dmBaseDados.tblCidades.Locate('Cidade;Estado',VarArrayOf([strCidade,strEstado]),[loCaseInsensitive]) = True) then
     begin
      dmBaseDados.tblClientes.Edit;
      dmBaseDados.tblClientesCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
      dmBaseDados.tblClientes.Post;
     end;
   dmBaseDados.tblClientes.Next;
  End;
// Fornecedores:
while (not dmBaseDados.tblFornecedores.Eof) do
  Begin
   strCidade := dmBaseDados.tblFornecedoresCidade.AsString;
   strEstado := dmBaseDados.tblFornecedoresEstado.AsString;
   if (dmBaseDados.tblCidades.Locate('Cidade;Estado',VarArrayOf([strCidade,strEstado]),[loCaseInsensitive]) = True) then
     begin
      dmBaseDados.tblFornecedores.Edit;
      dmBaseDados.tblFornecedoresCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
      dmBaseDados.tblFornecedores.Post; 
     end;
   dmBaseDados.tblFornecedores.Next;
  End;
dmBaseDados.tblCidades.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblFornecedores.Close;
ShowMessage('Dados Atualizados !');
end;

procedure TformMenuPrincipal.ReimprimirSAT1Click(Sender: TObject);
begin
ReimprimirCupom;
end;

procedure TformMenuPrincipal.CancelarSAT1Click(Sender: TObject);
begin
CancelarCupom;
end;

procedure TformMenuPrincipal.btnConfAcbrClick(Sender: TObject);
begin
if (PedeSenha('mbj6800a')) then
  formConfigAcbr.ShowModal;
end;

procedure TformMenuPrincipal.FiltroporPalavra1Click(Sender: TObject);
begin
formFiltroProdDesc.ShowModal;
end;

procedure TformMenuPrincipal.GerenciadorNfeNOVA1Click(Sender: TObject);
begin
formGerenciarNFeNew.ShowModal;
end;

procedure TformMenuPrincipal.EmissoNotaFiscalNOVA1Click(Sender: TObject);
begin
formPerguntaNFe.ShowModal;
if (stsNotaE = 'N') then
 begin
  Abort;
 end;
if (stsNotaE = 'D') then
 begin
  formNFeDevolucaoNew.ShowModal;
 end
else
 begin
  frmEmissaoNFNew.ShowModal;
 end;
end;

end.
