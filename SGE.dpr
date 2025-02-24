program SGE;

uses
  Forms,
  MenuPrincipal in 'MenuPrincipal.pas' {formMenuPrincipal},
  ModuloDados in 'ModuloDados.pas' {dmBaseDados: TDataModule},
  RotinasGerais in 'RotinasGerais.pas',
  FamiliaCategoria in 'FamiliaCategoria.pas' {formFamiliaCategoria},
  SeekPlaca in 'SeekPlaca.pas' {formseekPlaca},
  SeekFamilia in 'SeekFamilia.pas' {formseekFamilia},
  MarcasProdutos in 'MarcasProdutos.pas' {formMarcas},
  Produtos in 'Produtos.pas' {FormProdutos},
  SeekProduto in 'SeekProduto.pas' {formSeekProduto},
  SeekFornecedor in 'SeekFornecedor.pas' {formSeekFornecedor},
  Clientes in 'Clientes.pas' {formClientes},
  Funcionarios in 'Funcionarios.pas' {formFuncionarios},
  SeekFuncionario in 'SeekFuncionario.pas' {formSeekFuncionario},
  EntraCompras in 'EntraCompras.pas' {formEntradaCompra},
  ProcessaNota in 'ProcessaNota.pas' {formProcessaNota},
  Devolucao in 'Devolucao.pas' {formDevolucao},
  ListaProduto in 'ListaProduto.pas' {formListaProdutos},
  Perdas in 'Perdas.pas' {formPerdas},
  RelFamilias in 'RelFamilias.pas' {formRelFamilia},
  RelCategorias in 'RelCategorias.pas' {formRelCategoria},
  RelGrupoFamilia in 'RelGrupoFamilia.pas' {formRelGrupoFamilia},
  RelMarcas in 'RelMarcas.pas' {formRelMarca},
  RelFornecedores in 'RelFornecedores.pas' {formRelFornecedor},
  RelProdutos in 'RelProdutos.pas' {formRelProdutos},
  RelFuncionarios in 'RelFuncionarios.pas' {formRelFuncionario},
  RelClientes in 'RelClientes.pas' {formRelClientes},
  Necessidades in 'Necessidades.pas' {formNecessidades},
  TipoRelNecessita in 'TipoRelNecessita.pas' {formTipoRelCompra},
  RelNecessidade in 'RelNecessidade.pas' {formRelNecessidade},
  OrdemCompra in 'OrdemCompra.pas' {formOrdemCompra},
  NumeroOC in 'NumeroOC.pas' {formNumeroOC},
  dataOC in 'dataOC.pas' {formDataOC},
  RelOrdemCompra in 'RelOrdemCompra.pas' {formRelOC},
  RelVendas in 'RelVendas.pas' {formRelVendas},
  LogMensal in 'LogMensal.pas' {formLogMensal},
  RelLogMensal in 'RelLogMensal.pas' {formRelLogMensal},
  eDITAeSTADOS in 'eDITAeSTADOS.pas' {formEditaEstado},
  SeekClientes in 'SeekClientes.pas' {formSeekClientes},
  SeekMarcas in 'SeekMarcas.pas' {formSeekMarca},
  OrdemServico in 'OrdemServico.pas' {formClientesOficina},
  Fornecedor in 'Fornecedor.pas' {formFornecedores},
  RelOS in 'RelOS.pas' {formRelOS},
  SeekCategorias in 'SeekCategorias.pas' {formseekCategoria},
  ContasPagar in 'ContasPagar.pas' {formContasPagar},
  RelContasPagar in 'RelContasPagar.pas' {formRelContasPagar},
  LocalizaCliente in 'LocalizaCliente.pas' {formLocalizaCliente},
  CaixaServico in 'CaixaServico.pas' {formCaixaServico},
  RelCaixaServico in 'RelCaixaServico.pas' {formRelCaixaServico},
  Comissao in 'Comissao.pas' {FrmComissao},
  RelComissao in 'RelComissao.pas' {FrmRelComissao},
  LoginSGE in 'LoginSGE.pas' {frmSenha},
  RelSelVendedor in 'RelSelVendedor.pas' {formSelVendedor},
  RelSelFamilia in 'RelSelFamilia.pas' {formSelFamilia},
  NotaFiscal in 'NotaFiscal.pas' {FrmEmissaoNF},
  RelNotaFiscal in 'RelNotaFiscal.pas' {FrmNotaFiscal},
  AlteraValor in 'AlteraValor.pas' {FormAlterarValor},
  ContasReceber in 'ContasReceber.pas' {formContasReceber},
  RelContasReceber in 'RelContasReceber.pas' {formRelContasReceber},
  Venda in 'Venda.pas' {formVendasBalcao},
  Estorno in 'Estorno.pas' {formEstornoPedido},
  CadastroChequeDinheiro in 'CadastroChequeDinheiro.pas' {FormCadastroChequesDinheiro},
  RelCheques in 'RelCheques.pas' {FormRelCheques},
  BaixaPedido in 'BaixaPedido.pas' {FormBaixaPedidos},
  RelBonificacaoTroca in 'RelBonificacaoTroca.pas' {FormRelBonificacaoTroca},
  BonificacaoTroca in 'BonificacaoTroca.pas' {FormBonificacaoTroca},
  Cheques in 'Cheques.pas' {FormCheques},
  Contabilidade in 'Contabilidade.pas' {frmContabilidade},
  RelContabilidade in 'RelContabilidade.pas' {frmRelcontabilidade},
  DigitacaoPedido in 'DigitacaoPedido.pas' {frmDigitacaoPedido},
  ProdutosVendidos in 'ProdutosVendidos.pas' {frmProdutosVendidos},
  RelProdutosVendidos in 'RelProdutosVendidos.pas' {FormRelProdutosVendidos},
  MargemRelacionadasMinima in 'MargemRelacionadasMinima.pas' {frmMargemRelacionadasMinima},
  RelMargemRelacionadasMinima in 'RelMargemRelacionadasMinima.pas' {formRelMargemRelacionadasMinima},
  RelSelCategoria in 'RelSelCategoria.pas' {formSelCategoria},
  PedidosEstornado in 'PedidosEstornado.pas' {frmEstornados},
  RelPedidosEstornados in 'RelPedidosEstornados.pas' {formRelPedidosEstornados},
  SelcFamilia in 'SelcFamilia.pas' {formSelecFamilia},
  RelEstoque in 'RelEstoque.pas' {formRelEstoque},
  EmEstoque in 'EmEstoque.pas' {formEmEstoque},
  EmEstoqueDesc in 'EmEstoqueDesc.pas' {formEmEstoqueDesc},
  EmEstoqueRefFab in 'EmEstoqueRefFab.pas' {formEmEstoqueRefFab},
  SituacaoCodCli in 'SituacaoCodCli.pas' {formSituacaoCodCli},
  SituacaoRefFab in 'SituacaoRefFab.pas' {formSituacaoRamAtv},
  SituacaoOrdemAlf in 'SituacaoOrdemAlf.pas' {formSituacaoOrdemAlf},
  FluxoCaixa in 'FluxoCaixa.pas' {formFluxoCaixa},
  RFluxoCaixa in 'RFluxoCaixa.pas' {formRelFluxoCaixa},
  Consulta in 'Consulta.pas' {formConsulta},
  SeekClientes2 in 'SeekClientes2.pas' {formSeekClientes2},
  EstornoBaixado in 'EstornoBaixado.pas' {formEstornoBaixado},
  CopiaLimpeza in 'CopiaLimpeza.pas' {formCopiaLimpeza},
  Cobranca in 'Cobranca.pas' {formCobranca},
  RelCobranca in 'RelCobranca.pas' {formRelCobranca},
  RelProdutosFuturo in 'RelProdutosFuturo.pas' {formRelProdutosFututo},
  PedidosNaoBaixados in 'PedidosNaoBaixados.pas' {formPedidosNaoBaixados},
  RelEstoqueFuturo in 'RelEstoqueFuturo.pas' {formRelEstoqueFuturo},
  NaoBaixadoCR in 'NaoBaixadoCR.pas' {formNaoBaixadoCR},
  RelNaoBaixado in 'RelNaoBaixado.pas' {formRelNaoBaixado},
  IndexarTabela in 'IndexarTabela.pas' {formIndexar},
  RelListaFornecedor in 'RelListaFornecedor.pas' {formRelListaFornecedor},
  situacaonchekout in 'situacaonchekout.pas' {formsituacaonchekout},
  relcliente2 in 'relcliente2.pas' {formrelclientes2},
  TesteProdVen in 'TesteProdVen.pas' {formTesteProdVen},
  Checkout in 'Checkout.pas' {formCheckout},
  RamoAtividade in 'RamoAtividade.pas' {formRamoAtividade},
  PositivacaoCliente in 'PositivacaoCliente.pas' {formPositivacaoCliente},
  RelCheckout in 'RelCheckout.pas' {formRelCheckout},
  RelPositivacao in 'RelPositivacao.pas' {formRelPositivacao},
  RelRamoAtividade in 'RelRamoAtividade.pas' {formRelRamo},
  consultacliente in 'consultacliente.pas' {formemaberto},
  senhavenda in 'senhavenda.pas' {frmsenhavenda},
  Backup in 'Backup.pas' {formBackup},
  NovaPasta in 'NovaPasta.pas' {formNovapasta},
  Local in 'Local.pas' {formLocal},
  RelLocal in 'RelLocal.pas' {formRelLocal},
  Comissaocliente in 'Comissaocliente.pas' {formComissaocliente},
  Relcomissaocliente in 'Relcomissaocliente.pas' {formRelcomissaocliente},
  Contadesconto in 'Contadesconto.pas' {formContadesconto},
  Relcadcli in 'Relcadcli.pas' {FormRelcadcli},
  Relcadvend in 'Relcadvend.pas' {FormRelcadvend},
  RelEntradaNota in 'RelEntradaNota.pas' {formEntradarel},
  RelatorioEntradaNota in 'RelatorioEntradaNota.pas' {formRelEntradaNota},
  SenhadoGerente in 'SenhadoGerente.pas' {formSenhaGerente},
  RelECF in 'RelECF.pas' {FormRelECF},
  ValorProduto in 'ValorProduto.pas' {formValorproduto},
  NotaECF in 'NotaECF.pas' {frmNotaECF},
  Desconto in 'Desconto.pas' {FormDesconto},
  SenhaDesconto in 'SenhaDesconto.pas' {formSenhaDesconto},
  PrecoConsulta in 'PrecoConsulta.pas' {formPrecoConsulta},
  BaixaContasReceber in 'BaixaContasReceber.pas' {formBaixaContasReceber},
  CONSULTACODIGO in 'ConsultaCodigo.pas' {formConsultaCodigo},
  aviso in 'aviso.pas' {FormAviso: Unit2},
  TextoOnline in 'TextoOnline.pas' {FormTextoOnLine},
  CheckCGC in 'CheckCGC.pas' {formCNPJCPF},
  FormaPagamento in 'FormaPagamento.pas' {formFormaPagamento},
  ECF in 'ECF.pas' {formECF},
  ReemissaoPedidos in 'ReemissaoPedidos.pas' {FormReemissaoPedidos},
  SelecCliente in 'SelecCliente.pas' {formSelecCliente},
  Senha in 'Senha.pas' {FormSenha},
  SenhaAltCad in 'SenhaAltCad.pas' {formSenhaAltCad},
  ConfiguraSerial in 'configuraserial.pas',
  SATRelatorio in 'SATRelatorio.pas' {formSATRelatorio},
  RelSAT in 'RelSAT.pas' {formRelSAT},
  CadEntregas in 'CadEntregas.pas' {formCadEntregas},
  XMLSat in 'XMLSat.pas' {formXMLSat},
  TipoVenda in 'TipoVenda.pas' {formTipoVenda},
  RelCliTel in 'RelCliTel.pas' {formRelCliTel},
  RelNFCanceladas in 'RelNFCanceladas.pas' {formRelNFCanceladas},
  RElNotasEmitidas in 'RElNotasEmitidas.pas' {formRelNotasEmitidas},
  CancelarNFe in 'CancelarNFe.pas' {formCancelarNFe},
  ConfigEmail in 'ConfigEmail.pas' {formConfigEmail},
  DadosProdutosNFe in 'DadosProdutosNFe.pas' {formDadosProdutosNFe},
  GerenciarNFe in 'GerenciarNFe.pas' {formGerenciarNFe},
  Inutilizar in 'Inutilizar.pas' {formInutilizar},
  NFeDevolucao in 'NFeDevolucao.pas' {formNFeDevolucao},
  NotasEmitidas in 'NotasEmitidas.pas' {formNotasEmitidas},
  PerguntaNFe in 'PerguntaNFe.pas' {formPerguntaNFe},
  PgtoNFe in 'PgtoNFe.pas' {formPgtoNFe},
  SeekCliNFe in 'SeekCliNFe.pas' {formSeekCliNFe},
  DigitaTransp in 'DigitaTransp.pas' {formDigitaTransp},
  SeekFornecedor2 in 'SeekFornecedor2.pas' {formSeekFornecedor2},
  ConfigAcbr in '..\..\Modulos MBJ\SAT AcBr\ConfigAcbr.pas' {formConfigAcbr},
  RotinasSAT in '..\..\Modulos MBJ\SAT AcBr\RotinasSAT.pas',
  Sat in '..\..\Modulos MBJ\SAT AcBr\Sat.pas' {FormSatAcbr},
  SenhaDiversos in 'SenhaDiversos.pas' {formSenhaDiversos},
  SelSATCanc in 'SelSATCanc.pas' {formSelSATCanc},
  NotaFiscalNew in 'NotaFiscalNew.pas' {FrmEmissaoNFNew},
  GerenciarNFeNew in 'GerenciarNFeNew.pas' {formGerenciarNFeNew},
  NFeDevolucaoNew in 'NFeDevolucaoNew.pas' {formNFeDevolucaoNew},
  FitroProdDesc in 'FitroProdDesc.pas' {formFiltroProdDesc},
  RelFiltroProduto in 'RelFiltroProduto.pas' {formRelFiltroProduto},
  MostraConsultaPedidoComp in 'MostraConsultaPedidoComp.pas' {formMostraConsultaPedidoComp};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Gestão de Estoque';
  Application.CreateForm(TformMenuPrincipal, formMenuPrincipal);
  Application.CreateForm(TdmBaseDados, dmBaseDados);
  Application.CreateForm(TformFamiliaCategoria, formFamiliaCategoria);
  Application.CreateForm(TformseekPlaca, formseekPlaca);
  Application.CreateForm(TformseekFamilia, formseekFamilia);
  Application.CreateForm(TformMarcas, formMarcas);
  Application.CreateForm(TFormProdutos, FormProdutos);
  Application.CreateForm(TformSeekProduto, formSeekProduto);
  Application.CreateForm(TformSeekFornecedor, formSeekFornecedor);
  Application.CreateForm(TformClientes, formClientes);
  Application.CreateForm(TformFuncionarios, formFuncionarios);
  Application.CreateForm(TformSeekFuncionario, formSeekFuncionario);
  Application.CreateForm(TformEntradaCompra, formEntradaCompra);
  Application.CreateForm(TformProcessaNota, formProcessaNota);
  Application.CreateForm(TformDevolucao, formDevolucao);
  Application.CreateForm(TformListaProdutos, formListaProdutos);
  Application.CreateForm(TformPerdas, formPerdas);
  Application.CreateForm(TformRelFamilia, formRelFamilia);
  Application.CreateForm(TformRelCategoria, formRelCategoria);
  Application.CreateForm(TformRelGrupoFamilia, formRelGrupoFamilia);
  Application.CreateForm(TformRelMarca, formRelMarca);
  Application.CreateForm(TformRelFornecedor, formRelFornecedor);
  Application.CreateForm(TformRelProdutos, formRelProdutos);
  Application.CreateForm(TformRelFuncionario, formRelFuncionario);
  Application.CreateForm(TformRelClientes, formRelClientes);
  Application.CreateForm(TformNecessidades, formNecessidades);
  Application.CreateForm(TformTipoRelCompra, formTipoRelCompra);
  Application.CreateForm(TformRelNecessidade, formRelNecessidade);
  Application.CreateForm(TformOrdemCompra, formOrdemCompra);
  Application.CreateForm(TformNumeroOC, formNumeroOC);
  Application.CreateForm(TformDataOC, formDataOC);
  Application.CreateForm(TformRelOC, formRelOC);
  Application.CreateForm(TformRelVendas, formRelVendas);
  Application.CreateForm(TformLogMensal, formLogMensal);
  Application.CreateForm(TformRelLogMensal, formRelLogMensal);
  Application.CreateForm(TformEditaEstado, formEditaEstado);
  Application.CreateForm(TformSeekClientes, formSeekClientes);
  Application.CreateForm(TformSeekMarca, formSeekMarca);
  Application.CreateForm(TformClientesOficina, formClientesOficina);
  Application.CreateForm(TformFornecedores, formFornecedores);
  Application.CreateForm(TformRelOS, formRelOS);
  Application.CreateForm(TformseekCategoria, formseekCategoria);
  Application.CreateForm(TformContasPagar, formContasPagar);
  Application.CreateForm(TformRelContasPagar, formRelContasPagar);
  Application.CreateForm(TformLocalizaCliente, formLocalizaCliente);
  Application.CreateForm(TformCaixaServico, formCaixaServico);
  Application.CreateForm(TformRelCaixaServico, formRelCaixaServico);
  Application.CreateForm(TFrmComissao, FrmComissao);
  Application.CreateForm(TFrmRelComissao, FrmRelComissao);
  Application.CreateForm(TfrmSenha, frmSenha);
  Application.CreateForm(TformSelVendedor, formSelVendedor);
  Application.CreateForm(TformSelFamilia, formSelFamilia);
  Application.CreateForm(TFrmEmissaoNF, FrmEmissaoNF);
  Application.CreateForm(TFrmNotaFiscal, FrmNotaFiscal);
  Application.CreateForm(TFormAlterarValor, FormAlterarValor);
  Application.CreateForm(TformContasReceber, formContasReceber);
  Application.CreateForm(TformRelContasReceber, formRelContasReceber);
  Application.CreateForm(TformVendasBalcao, formVendasBalcao);
  Application.CreateForm(TformEstornoPedido, formEstornoPedido);
  Application.CreateForm(TFormCadastroChequesDinheiro, FormCadastroChequesDinheiro);
  Application.CreateForm(TFormRelCheques, FormRelCheques);
  Application.CreateForm(TFormBaixaPedidos, FormBaixaPedidos);
  Application.CreateForm(TFormRelBonificacaoTroca, FormRelBonificacaoTroca);
  Application.CreateForm(TFormBonificacaoTroca, FormBonificacaoTroca);
  Application.CreateForm(TFormCheques, FormCheques);
  Application.CreateForm(TfrmContabilidade, frmContabilidade);
  Application.CreateForm(TfrmRelcontabilidade, frmRelcontabilidade);
  Application.CreateForm(TfrmDigitacaoPedido, frmDigitacaoPedido);
  Application.CreateForm(TfrmProdutosVendidos, frmProdutosVendidos);
  Application.CreateForm(TFormRelProdutosVendidos, FormRelProdutosVendidos);
  Application.CreateForm(TfrmMargemRelacionadasMinima, frmMargemRelacionadasMinima);
  Application.CreateForm(TformRelMargemRelacionadasMinima, formRelMargemRelacionadasMinima);
  Application.CreateForm(TformSelCategoria, formSelCategoria);
  Application.CreateForm(TfrmEstornados, frmEstornados);
  Application.CreateForm(TformRelPedidosEstornados, formRelPedidosEstornados);
  Application.CreateForm(TformSelecFamilia, formSelecFamilia);
  Application.CreateForm(TformRelEstoque, formRelEstoque);
  Application.CreateForm(TformEmEstoque, formEmEstoque);
  Application.CreateForm(TformEmEstoqueDesc, formEmEstoqueDesc);
  Application.CreateForm(TformEmEstoqueRefFab, formEmEstoqueRefFab);
  Application.CreateForm(TformSituacaoCodCli, formSituacaoCodCli);
  Application.CreateForm(TformSituacaoRamAtv, formSituacaoRamAtv);
  Application.CreateForm(TformSituacaoOrdemAlf, formSituacaoOrdemAlf);
  Application.CreateForm(TformFluxoCaixa, formFluxoCaixa);
  Application.CreateForm(TformRelFluxoCaixa, formRelFluxoCaixa);
  Application.CreateForm(TformConsulta, formConsulta);
  Application.CreateForm(TformSeekClientes2, formSeekClientes2);
  Application.CreateForm(TformEstornoBaixado, formEstornoBaixado);
  Application.CreateForm(TformCopiaLimpeza, formCopiaLimpeza);
  Application.CreateForm(TformCobranca, formCobranca);
  Application.CreateForm(TformRelCobranca, formRelCobranca);
  Application.CreateForm(TformRelProdutosFututo, formRelProdutosFututo);
  Application.CreateForm(TformPedidosNaoBaixados, formPedidosNaoBaixados);
  Application.CreateForm(TformRelEstoqueFuturo, formRelEstoqueFuturo);
  Application.CreateForm(TformNaoBaixadoCR, formNaoBaixadoCR);
  Application.CreateForm(TformRelNaoBaixado, formRelNaoBaixado);
  Application.CreateForm(TformIndexar, formIndexar);
  Application.CreateForm(TformRelListaFornecedor, formRelListaFornecedor);
  Application.CreateForm(Tformsituacaonchekout, formsituacaonchekout);
  Application.CreateForm(Tformrelclientes2, formrelclientes2);
  Application.CreateForm(TformTesteProdVen, formTesteProdVen);
  Application.CreateForm(TformCheckout, formCheckout);
  Application.CreateForm(TformRamoAtividade, formRamoAtividade);
  Application.CreateForm(TformPositivacaoCliente, formPositivacaoCliente);
  Application.CreateForm(TformRelCheckout, formRelCheckout);
  Application.CreateForm(TformRelPositivacao, formRelPositivacao);
  Application.CreateForm(TformRelRamo, formRelRamo);
  Application.CreateForm(Tformemaberto, formemaberto);
  Application.CreateForm(Tfrmsenhavenda, frmsenhavenda);
  Application.CreateForm(TformBackup, formBackup);
  Application.CreateForm(TformNovapasta, formNovapasta);
  Application.CreateForm(TformLocal, formLocal);
  Application.CreateForm(TformRelLocal, formRelLocal);
  Application.CreateForm(TformComissaocliente, formComissaocliente);
  Application.CreateForm(TformRelcomissaocliente, formRelcomissaocliente);
  Application.CreateForm(TformContadesconto, formContadesconto);
  Application.CreateForm(TFormRelcadcli, FormRelcadcli);
  Application.CreateForm(TFormRelcadvend, FormRelcadvend);
  Application.CreateForm(TformEntradarel, formEntradarel);
  Application.CreateForm(TformRelEntradaNota, formRelEntradaNota);
  Application.CreateForm(TformSenhaGerente, formSenhaGerente);
  Application.CreateForm(TFormRelECF, FormRelECF);
  Application.CreateForm(TformValorproduto, formValorproduto);
  Application.CreateForm(TfrmNotaECF, frmNotaECF);
  Application.CreateForm(TFormDesconto, FormDesconto);
  Application.CreateForm(TformSenhaDesconto, formSenhaDesconto);
  Application.CreateForm(TformPrecoConsulta, formPrecoConsulta);
  Application.CreateForm(TformBaixaContasReceber, formBaixaContasReceber);
  Application.CreateForm(TformConsultaCodigo, formConsultaCodigo);
  Application.CreateForm(TFormAviso, FormAviso);
  Application.CreateForm(TFormTextoOnLine, FormTextoOnLine);
  Application.CreateForm(TformCNPJCPF, formCNPJCPF);
  Application.CreateForm(TformFormaPagamento, formFormaPagamento);
  Application.CreateForm(TformECF, formECF);
  Application.CreateForm(TFormReemissaoPedidos, FormReemissaoPedidos);
  Application.CreateForm(TformSelecCliente, formSelecCliente);
  Application.CreateForm(TFormSenha, FormSenha);
  Application.CreateForm(TformSenhaAltCad, formSenhaAltCad);
  Application.CreateForm(TformSATRelatorio, formSATRelatorio);
  Application.CreateForm(TformRelSAT, formRelSAT);
  Application.CreateForm(TformCadEntregas, formCadEntregas);
  Application.CreateForm(TformXMLSat, formXMLSat);
  Application.CreateForm(TformTipoVenda, formTipoVenda);
  Application.CreateForm(TformRelCliTel, formRelCliTel);
  Application.CreateForm(TformRelNFCanceladas, formRelNFCanceladas);
  Application.CreateForm(TformRelNotasEmitidas, formRelNotasEmitidas);
  Application.CreateForm(TformCancelarNFe, formCancelarNFe);
  Application.CreateForm(TformConfigEmail, formConfigEmail);
  Application.CreateForm(TformDadosProdutosNFe, formDadosProdutosNFe);
  Application.CreateForm(TformGerenciarNFe, formGerenciarNFe);
  Application.CreateForm(TformInutilizar, formInutilizar);
  Application.CreateForm(TformNFeDevolucao, formNFeDevolucao);
  Application.CreateForm(TformNotasEmitidas, formNotasEmitidas);
  Application.CreateForm(TformPerguntaNFe, formPerguntaNFe);
  Application.CreateForm(TformPgtoNFe, formPgtoNFe);
  Application.CreateForm(TformSeekCliNFe, formSeekCliNFe);
  Application.CreateForm(TformDigitaTransp, formDigitaTransp);
  Application.CreateForm(TformSeekFornecedor2, formSeekFornecedor2);
  Application.CreateForm(TformConfigAcbr, formConfigAcbr);
  Application.CreateForm(TFormSatAcbr, FormSatAcbr);
  Application.CreateForm(TformSenhaDiversos, formSenhaDiversos);
  Application.CreateForm(TformSelSATCanc, formSelSATCanc);
  Application.CreateForm(TFrmEmissaoNFNew, FrmEmissaoNFNew);
  Application.CreateForm(TformGerenciarNFeNew, formGerenciarNFeNew);
  Application.CreateForm(TformNFeDevolucaoNew, formNFeDevolucaoNew);
  Application.CreateForm(TformFiltroProdDesc, formFiltroProdDesc);
  Application.CreateForm(TformRelFiltroProduto, formRelFiltroProduto);
  Application.CreateForm(TformMostraConsultaPedidoComp, formMostraConsultaPedidoComp);
  Application.Run;
end.
