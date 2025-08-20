object dmBaseDados: TdmBaseDados
  OldCreateOrder = False
  Left = 35
  Top = 195
  Height = 532
  Width = 1288
  object tblFamilias: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Familias.db'
    TableType = ttParadox
    Left = 40
    Top = 50
    object tblFamiliasCodigoFamilia: TStringField
      DisplayLabel = 'C'#243'digo da Fam'#237'lia'
      DisplayWidth = 3
      FieldName = 'CodigoFamilia'
      EditMask = '000'
      Size = 3
    end
    object tblFamiliasDescricaoFamilia: TStringField
      DisplayLabel = 'Descri'#231#227'o Fam'#237'lia'
      DisplayWidth = 40
      FieldName = 'DescricaoFamilia'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 40
    end
  end
  object tblOrdemCompra: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'OrdemCompra.db'
    TableType = ttParadox
    Left = 40
    Top = 98
    object tblOrdemCompraOrdemCompra: TStringField
      DisplayLabel = 'N'#250'mero da Ordem de Compra'
      DisplayWidth = 8
      FieldName = 'OrdemCompra'
      EditMask = '00000/00'
      Size = 8
    end
    object tblOrdemCompraDataEmissao: TDateField
      DisplayLabel = 'Data de Emiss'#227'o'
      FieldName = 'DataEmissao'
      EditMask = '99/99/0000'
    end
    object tblOrdemCompraValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 9
      FieldName = 'ValorTotal'
      DisplayFormat = '######.00'
      EditFormat = '######.##'
    end
  end
  object tblCategoria: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Categorias.DB'
    TableType = ttParadox
    Left = 40
    Top = 146
    object tblCategoriaCodigoFamilia: TStringField
      DisplayLabel = 'C'#243'digo da Fam'#237'lia'
      DisplayWidth = 3
      FieldName = 'CodigoFamilia'
      EditMask = '000'
      Size = 3
    end
    object tblCategoriaCodigoCategoria: TStringField
      DisplayLabel = 'C'#243'digo da Categoria'
      DisplayWidth = 3
      FieldName = 'CodigoCategoria'
      EditMask = '000'
      Size = 3
    end
    object tblCategoriaDescricaoCategoria: TStringField
      DisplayLabel = 'Descri'#231#227'o da Categoria'
      DisplayWidth = 40
      FieldName = 'DescricaoCategoria'
      EditMask = '>cccccccccccccccccccccccccccccccccccccccc'
      Size = 40
    end
  end
  object tblProdutosComprados: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    IndexName = 'IndOrdemCompra'
    MasterFields = 'OrdemCompra'
    MasterSource = dsOrdemCompra
    TableName = 'ProdutosComprados.db'
    TableType = ttParadox
    Left = 40
    Top = 194
    object tblProdutosCompradosIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblProdutosCompradosOrdemCompra: TStringField
      DisplayLabel = 'N'#250'mero da Ordem de Compra'
      DisplayWidth = 8
      FieldName = 'OrdemCompra'
      EditMask = '00000/00'
      Size = 8
    end
    object tblProdutosCompradosCodigoProduto: TStringField
      DisplayLabel = 'C'#243'digo do Produto'
      DisplayWidth = 12
      FieldName = 'CodigoProduto'
      EditMask = '0000000000-0'
      Size = 12
    end
    object tblProdutosCompradosQuantidade: TFloatField
      DisplayWidth = 5
      FieldName = 'Quantidade'
      DisplayFormat = '#####'
      EditFormat = '#####'
    end
    object tblProdutosCompradosValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      DisplayWidth = 8
      FieldName = 'ValorUnitario'
      DisplayFormat = '#####.00'
      EditFormat = '#####.##'
    end
  end
  object tblMarcas: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Marcas.db'
    TableType = ttParadox
    Left = 40
    Top = 242
    object tblMarcasCodigoMarca: TStringField
      DisplayLabel = 'C'#243'digo da Marca'
      DisplayWidth = 3
      FieldName = 'CodigoMarca'
      EditMask = '000'
      Size = 3
    end
    object tblMarcasMarca: TStringField
      DisplayLabel = 'Marca do Produto'
      DisplayWidth = 20
      FieldName = 'Marca'
      EditMask = '>cccccccccccccccccccc'
      Size = 40
    end
  end
  object tblNotaFiscal: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'NotaFiscal.db'
    TableType = ttParadox
    Left = 40
    Top = 288
    object tblNotaFiscalIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblNotaFiscalNumeroNotaFiscal: TStringField
      FieldName = 'NumeroNotaFiscal'
      EditMask = '!99999;1;_'
      Size = 6
    end
    object tblNotaFiscalValorICMS: TFloatField
      FieldName = 'ValorICMS'
      currency = True
    end
    object tblNotaFiscalCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      Size = 4
    end
    object tblNotaFiscalDataEmissao: TDateField
      FieldName = 'DataEmissao'
      EditMask = '!99/99/00;1;_'
    end
    object tblNotaFiscalValorTotal: TFloatField
      FieldName = 'ValorTotal'
      currency = True
    end
  end
  object tblProdutos: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'CodigoFamilia;CodigoCategoria;CodigoProduto'
    TableName = 'Produtos.db'
    TableType = ttParadox
    Left = 648
    Top = 18
    object tblProdutosCodigoFamilia: TStringField
      FieldName = 'CodigoFamilia'
      Size = 3
    end
    object tblProdutosCodigoCategoria: TStringField
      FieldName = 'CodigoCategoria'
      Size = 3
    end
    object tblProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 6
    end
    object tblProdutosCodigo: TStringField
      FieldName = 'Codigo'
      Size = 12
    end
    object tblProdutosCodigoBarra: TStringField
      FieldName = 'CodigoBarra'
      Size = 13
    end
    object tblProdutosReferenciaFabricante: TStringField
      FieldName = 'ReferenciaFabricante'
      Size = 12
    end
    object tblProdutosReferenciaFabricante2: TStringField
      FieldName = 'ReferenciaFabricante2'
      Size = 12
    end
    object tblProdutosReferenciaFabricante3: TStringField
      FieldName = 'ReferenciaFabricante3'
      Size = 12
    end
    object tblProdutosReferenciaFabricante4: TStringField
      FieldName = 'ReferenciaFabricante4'
      Size = 12
    end
    object tblProdutosCodigoInterno: TStringField
      FieldName = 'CodigoInterno'
      Size = 12
    end
    object tblProdutosDescricaoAbreviada: TStringField
      FieldName = 'DescricaoAbreviada'
      Size = 80
    end
    object tblProdutosDescricaoDetalhada: TStringField
      FieldName = 'DescricaoDetalhada'
      Size = 200
    end
    object tblProdutosCaracteristicas: TMemoField
      FieldName = 'Caracteristicas'
      BlobType = ftMemo
      Size = 200
    end
    object tblProdutosUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 2
    end
    object tblProdutosCodigoMarca: TStringField
      FieldName = 'CodigoMarca'
      Size = 3
    end
    object tblProdutosValorUnitarioAtual: TFloatField
      FieldName = 'ValorUnitarioAtual'
      DisplayFormat = '0.00'
    end
    object tblProdutosValorUnitarioAnterior: TFloatField
      FieldName = 'ValorUnitarioAnterior'
      DisplayFormat = '0.00'
    end
    object tblProdutosMargemLucro: TFloatField
      FieldName = 'MargemLucro'
    end
    object tblProdutosValorVenda: TFloatField
      FieldName = 'ValorVenda'
      DisplayFormat = '0.00'
    end
    object tblProdutosEstoqueMinimo: TFloatField
      FieldName = 'EstoqueMinimo'
    end
    object tblProdutosEstoqueReposicao: TFloatField
      FieldName = 'EstoqueReposicao'
    end
    object tblProdutosEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tblProdutosEstoqueMaximo: TFloatField
      FieldName = 'EstoqueMaximo'
    end
    object tblProdutosDataUltimaCompra: TDateField
      FieldName = 'DataUltimaCompra'
    end
    object tblProdutosLocalizacao: TStringField
      FieldName = 'Localizacao'
      Size = 7
    end
    object tblProdutosImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tblProdutosTaxaipi: TFloatField
      FieldName = 'Taxaipi'
    end
    object tblProdutosComissao: TFloatField
      FieldName = 'Comissao'
    end
    object tblProdutosPremio: TFloatField
      FieldName = 'Premio'
    end
    object tblProdutosQtdPorCaixa: TFloatField
      FieldName = 'QtdPorCaixa'
    end
    object tblProdutosPeso: TFloatField
      FieldName = 'Peso'
    end
    object tblProdutosIcms: TFloatField
      FieldName = 'Icms'
    end
    object tblProdutosReducaoIcms: TFloatField
      FieldName = 'ReducaoIcms'
    end
    object tblProdutosUltimoFornecedor: TStringField
      FieldName = 'UltimoFornecedor'
      Size = 30
    end
    object tblProdutosValorEmEstoque: TFloatField
      FieldName = 'ValorEmEstoque'
    end
    object tblProdutosBeneficio: TStringField
      FieldName = 'Beneficio'
      Size = 3
    end
    object tblProdutosEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 5
    end
    object tblProdutosSubGrupo: TStringField
      FieldName = 'SubGrupo'
      Size = 5
    end
    object tblProdutosPesoTotal: TFloatField
      FieldName = 'PesoTotal'
    end
    object tblProdutosValorCustoEstoque: TFloatField
      FieldName = 'ValorCustoEstoque'
      DisplayFormat = '0.00'
    end
    object tblProdutosValorFuturo: TFloatField
      FieldName = 'ValorFuturo'
    end
    object tblProdutosEstoqueFuturo: TFloatField
      FieldName = 'EstoqueFuturo'
    end
    object tblProdutosValorCustoFuturo: TFloatField
      FieldName = 'ValorCustoFuturo'
      DisplayFormat = '0.00'
    end
    object tblProdutosValorCustoMedio: TFloatField
      FieldName = 'ValorCustoMedio'
    end
    object tblProdutosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object tblProdutosIVA: TFloatField
      FieldName = 'IVA'
    end
    object tblProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object tblProdutosCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object tblProdutosSituacaoTributaria: TStringField
      FieldName = 'SituacaoTributaria'
      Size = 3
    end
  end
  object tblEntrada: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    IndexName = 'IndNotaFiscal'
    MasterFields = 'NumeroNotaFiscal'
    MasterSource = dsNotaFiscal
    TableName = 'Entrada.db'
    TableType = ttParadox
    Left = 648
    Top = 66
    object tblEntradaIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblEntradaNumeroNotaFiscal: TStringField
      DisplayLabel = 'N'#250'mero da Nota Fiscal'
      DisplayWidth = 6
      FieldName = 'NumeroNotaFiscal'
      EditMask = '000000'
      Size = 6
    end
    object tblEntradaDataLancamento: TDateField
      DisplayLabel = 'Data do Lan'#231'amento'
      FieldName = 'DataLancamento'
      EditMask = '99/99/0000'
    end
    object tblEntradaCodigoMovimento: TStringField
      DisplayLabel = 'C'#243'digo do Movimento'
      DisplayWidth = 1
      FieldName = 'CodigoMovimento'
      EditMask = '>C'
      Size = 1
    end
    object tblEntradaControleDevolucao: TStringField
      DisplayLabel = 'Controle de Devolu'#231#227'o'
      DisplayWidth = 7
      FieldName = 'ControleDevolucao'
      EditMask = '0000/00'
      Size = 7
    end
    object tblEntradaCodigoProduto: TStringField
      DisplayLabel = 'C'#243'digo do Produto'
      DisplayWidth = 12
      FieldName = 'CodigoProduto'
      EditMask = '0000000000-0'
      Size = 12
    end
    object tblEntradaQuantidade: TFloatField
      DisplayWidth = 5
      FieldName = 'Quantidade'
      DisplayFormat = '#####'
      EditFormat = '#####'
    end
    object tblEntradaValorUnitario: TFloatField
      DisplayLabel = 'Valor Unit'#225'rio'
      DisplayWidth = 8
      FieldName = 'ValorUnitario'
      OnChange = tblEntradaValorUnitarioChange
      DisplayFormat = '#####.00'
      EditFormat = '#####.##'
    end
    object tblEntradaAliquotaICMS: TFloatField
      DisplayLabel = 'Al'#237'quota ICMS'
      DisplayWidth = 5
      FieldName = 'AliquotaICMS'
      DisplayFormat = '##.00'
      EditFormat = '##.##'
    end
    object tblEntradaAliquotaIPI: TFloatField
      DisplayLabel = 'Al'#237'quota IPI'
      DisplayWidth = 5
      FieldName = 'AliquotaIPI'
      OnChange = tblEntradaAliquotaIPIChange
      DisplayFormat = '##.00'
      EditFormat = '##.##'
    end
    object tblEntradaValorTotal: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 9
      FieldName = 'ValorTotal'
      DisplayFormat = '######.00'
      EditFormat = '######.##'
      currency = True
    end
    object tblEntradaValorComIPI: TFloatField
      FieldName = 'ValorComIPI'
      DisplayFormat = '######.00'
      currency = True
    end
  end
  object tblFornecedores: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Fornecedores.DB'
    TableType = ttParadox
    Left = 840
    Top = 66
    object tblFornecedoresCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      Size = 4
    end
    object tblFornecedoresRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 40
    end
    object tblFornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object tblFornecedoresNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
    end
    object tblFornecedoresTipoFornecedor: TStringField
      FieldName = 'TipoFornecedor'
      Size = 1
    end
    object tblFornecedoresEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tblFornecedoresNumero: TFloatField
      FieldName = 'Numero'
    end
    object tblFornecedoresBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblFornecedoresCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object tblFornecedoresEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblFornecedoresCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblFornecedoresTelefone: TStringField
      FieldName = 'Telefone'
      Size = 16
    end
    object tblFornecedoresFax: TStringField
      FieldName = 'Fax'
      Size = 16
    end
    object tblFornecedoresRepresentante: TStringField
      FieldName = 'Representante'
      Size = 40
    end
    object tblFornecedoresRamalContato: TStringField
      FieldName = 'RamalContato'
      Size = 4
    end
    object tblFornecedoresHomePage: TStringField
      FieldName = 'HomePage'
      Size = 80
    end
    object tblFornecedoresEmail: TStringField
      FieldName = 'Email'
      Size = 80
    end
    object tblFornecedoresInscricao: TStringField
      FieldName = 'Inscricao'
    end
    object tblFornecedoresObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 200
    end
    object tblFornecedoresComplemento: TStringField
      FieldName = 'Complemento'
    end
    object tblFornecedoresCodigoIBGE: TStringField
      FieldName = 'CodigoIBGE'
      Size = 8
    end
  end
  object tblSaida: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    OnPostError = tblSaidaPostError
    DatabaseName = 'Tabelas'
    TableName = 'Saidas.db'
    TableType = ttParadox
    Left = 136
    Top = 2
    object tblSaidaIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblSaidaNumeroRequisicao: TStringField
      FieldName = 'NumeroRequisicao'
      Size = 8
    end
    object tblSaidaDataLancamento: TDateField
      FieldName = 'DataLancamento'
    end
    object tblSaidaCodigoMovimento: TStringField
      FieldName = 'CodigoMovimento'
      Size = 1
    end
    object tblSaidaDescricaoProduto: TStringField
      FieldName = 'DescricaoProduto'
      Size = 80
    end
    object tblSaidaQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblSaidaPeso: TFloatField
      FieldName = 'Peso'
    end
    object tblSaidaCodCliFor: TIntegerField
      FieldName = 'CodCliFor'
    end
    object tblSaidaClienteFornecedor: TStringField
      FieldName = 'ClienteFornecedor'
      Size = 40
    end
    object tblSaidaCodVen: TIntegerField
      FieldName = 'CodVen'
    end
    object tblSaidaVendedor: TStringField
      FieldName = 'Vendedor'
      Size = 40
    end
    object tblSaidaValorUnitario: TCurrencyField
      DisplayWidth = 12
      FieldName = 'ValorUnitario'
    end
    object tblSaidaValorTotal: TCurrencyField
      DisplayWidth = 12
      FieldName = 'ValorTotal'
    end
    object tblSaidaCondPg: TStringField
      FieldName = 'CondPg'
      Size = 2
    end
    object tblSaidaDataVencimento: TDateField
      FieldName = 'DataVencimento'
    end
    object tblSaidaDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tblSaidaComissao: TFloatField
      FieldName = 'Comissao'
    end
    object tblSaidaRefFabricante: TStringField
      FieldName = 'RefFabricante'
    end
    object tblSaidaCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 15
    end
    object tblSaidaUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object tblSaidaQtdeCx: TFloatField
      FieldName = 'QtdeCx'
    end
  end
  object tblProdutosFornecidos: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'CodigoFornecedor'
    MasterFields = 'CodigoFornecedor'
    MasterSource = dsFornecedores
    TableName = 'ProdutosFornecidos.db'
    TableType = ttParadox
    Left = 40
    Top = 2
    object tblProdutosFornecidosCodigoFornecedor: TStringField
      DisplayLabel = 'C'#243'digo do Fornecedor'
      DisplayWidth = 4
      FieldName = 'CodigoFornecedor'
      EditMask = '0000'
      Size = 4
    end
    object tblProdutosFornecidosCodigoFamilia: TStringField
      DisplayLabel = 'C'#243'digo da Fam'#237'lia'
      DisplayWidth = 3
      FieldName = 'CodigoFamilia'
      EditMask = '000'
      Size = 3
    end
    object tblProdutosFornecidosCodigoCategoria: TStringField
      DisplayLabel = 'C'#243'digo da Categoria'
      DisplayWidth = 3
      FieldName = 'CodigoCategoria'
      EditMask = '000'
      Size = 3
    end
  end
  object tblHistorico: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexName = 'IndProduto'
    MasterFields = 'Codigo'
    MasterSource = dsProdutos
    TableName = 'Historico.db'
    TableType = ttParadox
    Left = 136
    Top = 90
    object tblHistoricoIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblHistoricoDataLancamento: TDateField
      FieldName = 'DataLancamento'
    end
    object tblHistoricoCodigoMovimento: TStringField
      FieldName = 'CodigoMovimento'
      Size = 1
    end
    object tblHistoricoCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 12
    end
    object tblHistoricoNumeroNotaFiscal: TStringField
      FieldName = 'NumeroNotaFiscal'
      Size = 6
    end
    object tblHistoricoNumeroRequisicao: TStringField
      FieldName = 'NumeroRequisicao'
      Size = 9
    end
    object tblHistoricoControleDevolucao: TStringField
      FieldName = 'ControleDevolucao'
      Size = 7
    end
    object tblHistoricoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblHistoricoPeso: TFloatField
      FieldName = 'Peso'
    end
    object tblHistoricoCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object tblHistoricoClienteFornecedor: TStringField
      FieldName = 'ClienteFornecedor'
      Size = 40
    end
    object tblHistoricoCodigoVendedor: TIntegerField
      FieldName = 'CodigoVendedor'
    end
    object tblHistoricoNomeVendedor: TStringField
      FieldName = 'NomeVendedor'
      Size = 40
    end
    object tblHistoricoValorLancamento: TFloatField
      FieldName = 'ValorLancamento'
    end
    object tblHistoricoMesAno: TStringField
      FieldName = 'MesAno'
      Size = 7
    end
    object tblHistoricoOperador: TStringField
      FieldName = 'Operador'
      Size = 40
    end
    object tblHistoricoCondPg: TStringField
      FieldName = 'CondPg'
      Size = 2
    end
    object tblHistoricoDataVencimento: TDateField
      FieldName = 'DataVencimento'
    end
    object tblHistoricoValorCusto: TFloatField
      FieldName = 'ValorCusto'
    end
    object tblHistoricoStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblHistoricoICMS: TFloatField
      FieldName = 'ICMS'
    end
    object tblHistoricoIPI: TFloatField
      FieldName = 'IPI'
    end
    object tblHistoricoValorIPI: TFloatField
      FieldName = 'ValorIPI'
    end
  end
  object tblFuncionarios: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Funcionarios.db'
    TableType = ttParadox
    Left = 136
    Top = 146
    object tblFuncionariosCodigoFuncionario: TStringField
      FieldName = 'CodigoFuncionario'
      Size = 3
    end
    object tblFuncionariosNomeFuncionario: TStringField
      FieldName = 'NomeFuncionario'
      Size = 40
    end
    object tblFuncionariosEnderecoResidencia: TStringField
      FieldName = 'EnderecoResidencia'
      Size = 50
    end
    object tblFuncionariosNumero: TFloatField
      FieldName = 'Numero'
    end
    object tblFuncionariosBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblFuncionariosCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object tblFuncionariosEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblFuncionariosCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblFuncionariosCPF: TStringField
      FieldName = 'CPF'
    end
    object tblFuncionariosRG: TStringField
      FieldName = 'RG'
    end
    object tblFuncionariosTelefone: TStringField
      FieldName = 'Telefone'
      Size = 16
    end
    object tblFuncionariosCelular: TStringField
      FieldName = 'Celular'
      Size = 16
    end
    object tblFuncionariosPW: TStringField
      FieldName = 'PW'
      Size = 7
    end
    object tblFuncionariosPS: TStringField
      FieldName = 'PS'
      Size = 1
    end
    object tblFuncionariosFamiliasCategorias: TStringField
      FieldName = 'FamiliasCategorias'
      Size = 10
    end
    object tblFuncionariosMarcas: TStringField
      FieldName = 'Marcas'
      Size = 10
    end
    object tblFuncionariosProdutos: TStringField
      FieldName = 'Produtos'
      Size = 10
    end
    object tblFuncionariosFornecedores: TStringField
      FieldName = 'Fornecedores'
      Size = 10
    end
    object tblFuncionariosClientes: TStringField
      FieldName = 'Clientes'
      Size = 10
    end
    object tblFuncionariosFuncionarios: TStringField
      FieldName = 'Funcionarios'
      Size = 10
    end
    object tblFuncionariosEstados: TStringField
      FieldName = 'Estados'
      Size = 10
    end
    object tblFuncionariosVendasBalcao: TStringField
      FieldName = 'VendasBalcao'
      Size = 10
    end
    object tblFuncionariosPerdasDiversas: TStringField
      FieldName = 'PerdasDiversas'
      Size = 10
    end
    object tblFuncionariosEmissaoNF: TStringField
      FieldName = 'EmissaoNF'
      Size = 10
    end
    object tblFuncionariosBaixaPedidos: TStringField
      FieldName = 'BaixaPedidos'
      Size = 10
    end
    object tblFuncionariosReemicaoEstorno: TStringField
      FieldName = 'ReemicaoEstorno'
      Size = 10
    end
    object tblFuncionariosEstornoBaixados: TStringField
      FieldName = 'EstornoBaixados'
      Size = 10
    end
    object tblFuncionariosCopiaLimpeza: TStringField
      FieldName = 'CopiaLimpeza'
      Size = 10
    end
    object tblFuncionariosRelMarcas: TStringField
      FieldName = 'RelMarcas'
      Size = 10
    end
    object tblFuncionariosRelFamilias: TStringField
      FieldName = 'RelFamilias'
      Size = 10
    end
    object tblFuncionariosRelCategorias: TStringField
      FieldName = 'RelCategorias'
      Size = 10
    end
    object tblFuncionariosRelProdutos: TStringField
      FieldName = 'RelProdutos'
      Size = 10
    end
    object tblFuncionariosRelFornecedores: TStringField
      FieldName = 'RelFornecedores'
      Size = 10
    end
    object tblFuncionariosRelClientes: TStringField
      FieldName = 'RelClientes'
      Size = 10
    end
    object tblFuncionariosRelFuncionarios: TStringField
      FieldName = 'RelFuncionarios'
      Size = 10
    end
    object tblFuncionariosRelOC: TStringField
      FieldName = 'RelOC'
      Size = 10
    end
    object tblFuncionariosRelLogMensal: TStringField
      FieldName = 'RelLogMensal'
      Size = 10
    end
    object tblFuncionariosRelBonificacaoTroca: TStringField
      FieldName = 'RelBonificacaoTroca'
      Size = 10
    end
    object tblFuncionariosRelCheques: TStringField
      FieldName = 'RelCheques'
      Size = 10
    end
    object tblFuncionariosRelComissao: TStringField
      FieldName = 'RelComissao'
      Size = 10
    end
    object tblFuncionariosRelContasReceber: TStringField
      FieldName = 'RelContasReceber'
      Size = 10
    end
    object tblFuncionariosRelContasPagar: TStringField
      FieldName = 'RelContasPagar'
      Size = 10
    end
    object tblFuncionariosRelProdutosVendidos: TStringField
      FieldName = 'RelProdutosVendidos'
      Size = 10
    end
    object tblFuncionariosRelPedidosEstornados: TStringField
      FieldName = 'RelPedidosEstornados'
      Size = 10
    end
    object tblFuncionariosRelContabilidade: TStringField
      FieldName = 'RelContabilidade'
      Size = 10
    end
    object tblFuncionariosRelFluxoCaixa: TStringField
      FieldName = 'RelFluxoCaixa'
      Size = 10
    end
    object tblFuncionariosComprasNF: TStringField
      FieldName = 'ComprasNF'
      Size = 10
    end
    object tblFuncionariosDevolucao: TStringField
      FieldName = 'Devolucao'
      Size = 10
    end
    object tblFuncionariosNecessidades: TStringField
      FieldName = 'Necessidades'
      Size = 10
    end
    object tblFuncionariosEmitirOC: TStringField
      FieldName = 'EmitirOC'
      Size = 10
    end
    object tblFuncionariosClientesOficina: TStringField
      FieldName = 'ClientesOficina'
      Size = 10
    end
    object tblFuncionariosCaixaDiario: TStringField
      FieldName = 'CaixaDiario'
      Size = 10
    end
    object tblFuncionariosNivelPermissao: TStringField
      FieldName = 'NivelPermissao'
    end
    object tblFuncionariosSupervisor: TStringField
      FieldName = 'Supervisor'
      Size = 40
    end
    object tblFuncionariosContasReceber: TStringField
      FieldName = 'ContasReceber'
      Size = 11
    end
    object tblFuncionariosContasRecEmissao: TStringField
      FieldName = 'ContasRecEmissao'
      Size = 11
    end
    object tblFuncionariosProdVenSemValor: TStringField
      FieldName = 'ProdVenSemValor'
      Size = 11
    end
    object tblFuncionariosCadEntregas: TStringField
      FieldName = 'CadEntregas'
      Size = 11
    end
  end
  object tblClientes: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    FieldDefs = <
      item
        Name = 'NumeroRG'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CodigoCliente'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'DataCadastro'
        DataType = ftDate
      end
      item
        Name = 'NomeCliente'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NomeFantasia'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Situacao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NumeroCIC'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'EnderecoResidencia'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Numero'
        DataType = ftFloat
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Complemento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Estado'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'CodigoIBGE'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Fax'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Contato'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Intinerario'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Intinerario2'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Intinerario12'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Intinerario22'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'Cobranca'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CodigoVendedor1'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CodigoVendedor2'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SituacaoVenda'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'SituacaoCredito'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'RamoAtividade'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'E-mail'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Logistica'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Zona'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DataUltimaCompra'
        DataType = ftDate
      end
      item
        Name = 'Nire'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Obs'
        DataType = ftMemo
        Size = 200
      end
      item
        Name = 'DataAberturaEmpresa'
        DataType = ftDate
      end
      item
        Name = 'PredioProprio'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OutroComercio'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Local'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Fornecedor1'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Fornecedor2'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Fornecedor3'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Fornecedor4'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Fornecedor5'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Banco1'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Banco2'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Banco3'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TipoCliente'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NChekout'
        DataType = ftFloat
      end
      item
        Name = 'RPA'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'LimiteCredito'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'tblClientesIndex1'
        Fields = 'NumeroRG'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IndCodCli'
        Fields = 'CodigoCliente'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'indCNPJCliente'
        Fields = 'NumeroCIC'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndEstado'
        Fields = 'Estado;Cidade'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndCliente'
        Fields = 'NomeCliente'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'Clientes.DB'
    TableType = ttParadox
    Left = 136
    Top = 194
    object tblClientesNumeroRG: TStringField
      FieldName = 'NumeroRG'
      Required = True
      Size = 15
    end
    object tblClientesCodigoCliente: TAutoIncField
      FieldName = 'CodigoCliente'
      ReadOnly = True
    end
    object tblClientesDataCadastro: TDateField
      FieldName = 'DataCadastro'
      EditMask = '!99/99/00;1;_'
    end
    object tblClientesSituacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
    object tblClientesNumeroCIC: TStringField
      FieldName = 'NumeroCIC'
      Required = True
      Size = 18
    end
    object tblClientesEnderecoResidencia: TStringField
      DisplayLabel = 'Endere'#231'o Residencia'
      FieldName = 'EnderecoResidencia'
      Size = 50
    end
    object tblClientesNumero: TFloatField
      FieldName = 'Numero'
    end
    object tblClientesBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblClientesComplemento: TStringField
      FieldName = 'Complemento'
    end
    object tblClientesCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object tblClientesEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblClientesCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblClientesCodigoIBGE: TStringField
      FieldName = 'CodigoIBGE'
      Size = 9
    end
    object tblClientesTelefone: TStringField
      FieldName = 'Telefone'
      Size = 16
    end
    object tblClientesFax: TStringField
      FieldName = 'Fax'
      Size = 16
    end
    object tblClientesContato: TStringField
      FieldName = 'Contato'
    end
    object tblClientesIntinerario: TStringField
      FieldName = 'Intinerario'
      Size = 4
    end
    object tblClientesIntinerario2: TStringField
      FieldName = 'Intinerario2'
      Size = 4
    end
    object tblClientesIntinerario12: TStringField
      FieldName = 'Intinerario12'
      Size = 4
    end
    object tblClientesIntinerario22: TStringField
      FieldName = 'Intinerario22'
      Size = 4
    end
    object tblClientesCobranca: TStringField
      FieldName = 'Cobranca'
      Size = 4
    end
    object tblClientesCodigoVendedor1: TStringField
      FieldName = 'CodigoVendedor1'
      Size = 2
    end
    object tblClientesCodigoVendedor2: TStringField
      FieldName = 'CodigoVendedor2'
      Size = 2
    end
    object tblClientesSituacaoVenda: TStringField
      FieldName = 'SituacaoVenda'
      Size = 2
    end
    object tblClientesSituacaoCredito: TStringField
      FieldName = 'SituacaoCredito'
      Size = 4
    end
    object tblClientesRamoAtividade: TStringField
      FieldName = 'RamoAtividade'
      Size = 4
    end
    object tblClientesEmail: TStringField
      FieldName = 'E-mail'
      Size = 40
    end
    object tblClientesLogistica: TStringField
      FieldName = 'Logistica'
      Size = 5
    end
    object tblClientesZona: TStringField
      FieldName = 'Zona'
      Size = 5
    end
    object tblClientesDataUltimaCompra: TDateField
      FieldName = 'DataUltimaCompra'
      EditMask = '!99/99/00;1;_'
    end
    object tblClientesObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 200
    end
    object tblClientesDataAberturaEmpresa: TDateField
      FieldName = 'DataAberturaEmpresa'
    end
    object tblClientesPredioProprio: TStringField
      FieldName = 'PredioProprio'
      Size = 1
    end
    object tblClientesOutroComercio: TStringField
      FieldName = 'OutroComercio'
      Size = 1
    end
    object tblClientesLocal: TStringField
      FieldName = 'Local'
      Size = 60
    end
    object tblClientesFornecedor1: TStringField
      FieldName = 'Fornecedor1'
      Size = 60
    end
    object tblClientesFornecedor2: TStringField
      FieldName = 'Fornecedor2'
      Size = 60
    end
    object tblClientesFornecedor3: TStringField
      FieldName = 'Fornecedor3'
      Size = 60
    end
    object tblClientesFornecedor4: TStringField
      FieldName = 'Fornecedor4'
      Size = 60
    end
    object tblClientesFornecedor5: TStringField
      FieldName = 'Fornecedor5'
      Size = 60
    end
    object tblClientesBanco1: TStringField
      FieldName = 'Banco1'
      Size = 30
    end
    object tblClientesBanco2: TStringField
      FieldName = 'Banco2'
      Size = 30
    end
    object tblClientesBanco3: TStringField
      FieldName = 'Banco3'
      Size = 30
    end
    object tblClientesNire: TStringField
      FieldName = 'Nire'
      EditMask = '99.999.999.999;1;_'
      Size = 14
    end
    object tblClientesTipoCliente: TStringField
      FieldName = 'TipoCliente'
      Size = 4
    end
    object tblClientesNChekout: TFloatField
      FieldName = 'NChekout'
    end
    object tblClientesRPA: TStringField
      FieldName = 'RPA'
      Size = 3
    end
    object tblClientesNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
      Size = 40
    end
    object tblClientesNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 90
    end
    object tblClientesLimiteCredito: TFloatField
      FieldName = 'LimiteCredito'
      currency = True
    end
  end
  object dsFamilias: TDataSource
    DataSet = tblFamilias
    Left = 344
    Top = 50
  end
  object dsOrdemCompra: TDataSource
    DataSet = tblOrdemCompra
    Left = 344
    Top = 98
  end
  object dsCategoria: TDataSource
    DataSet = tblCategoria
    Left = 344
    Top = 146
  end
  object dsProdutosComprados: TDataSource
    DataSet = tblProdutosComprados
    Left = 344
    Top = 194
  end
  object dsMarcas: TDataSource
    DataSet = tblMarcas
    Left = 344
    Top = 242
  end
  object dsNotaFiscal: TDataSource
    DataSet = tblNotaFiscal
    Left = 952
    Top = 218
  end
  object dsProdutos: TDataSource
    DataSet = tblProdutos
    Left = 952
    Top = 18
  end
  object dsEntrada: TDataSource
    DataSet = tblEntrada
    Left = 952
    Top = 66
  end
  object dsFornecedores: TDataSource
    DataSet = tblFornecedores
    Left = 440
    Top = 2
  end
  object dsSaida: TDataSource
    DataSet = tblSaida
    Left = 440
    Top = 50
  end
  object dsProdutosFornecidos: TDataSource
    DataSet = tblProdutosFornecidos
    Left = 440
    Top = 98
  end
  object dsHistorico: TDataSource
    DataSet = tblHistorico
    Left = 528
    Top = 2
  end
  object dsFuncionarios: TDataSource
    DataSet = tblFuncionarios
    Left = 528
    Top = 50
  end
  object dsClientes: TDataSource
    DataSet = tblClientes
    Left = 528
    Top = 98
  end
  object dsRequisicoes: TDataSource
    DataSet = tblRequisicoes
    Left = 440
    Top = 146
  end
  object tblRequisicoes: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Requisicao.db'
    TableType = ttParadox
    Left = 136
    Top = 242
    object tblRequisicoesNumeroRequisicao: TStringField
      FieldName = 'NumeroRequisicao'
      Size = 9
    end
    object tblRequisicoesDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblRequisicoesSituacao: TStringField
      FieldName = 'Situacao'
      Size = 1
    end
  end
  object dsNecessidade: TDataSource
    DataSet = tblNecessidade
    Left = 528
    Top = 146
  end
  object dsNumeroOC: TDataSource
    DataSet = tblNumeroOC
    Left = 440
    Top = 194
  end
  object dsRelOC: TDataSource
    DataSet = tblRelOC
    Left = 528
    Top = 194
  end
  object tblNecessidade: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Necessidade.db'
    TableType = ttParadox
    Left = 136
    Top = 290
    object tblNecessidadeCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 12
    end
    object tblNecessidadeDescricaoAbreviada: TStringField
      FieldName = 'DescricaoAbreviada'
      Size = 80
    end
    object tblNecessidadeUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 2
    end
    object tblNecessidadeReferenciaFabricante: TStringField
      FieldName = 'ReferenciaFabricante'
    end
    object tblNecessidadeMinimo: TFloatField
      FieldName = 'Minimo'
    end
    object tblNecessidadeMaximo: TFloatField
      FieldName = 'Maximo'
    end
    object tblNecessidadeReposicao: TFloatField
      FieldName = 'Reposicao'
    end
    object tblNecessidadeEstoque: TFloatField
      FieldName = 'Estoque'
    end
    object tblNecessidadeNecessidade: TFloatField
      FieldName = 'Necessidade'
    end
    object tblNecessidadeValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
  end
  object tblNumeroOC: TTable
    BeforeDelete = tblFamiliasBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'NumeroOC'
    TableType = ttParadox
    Left = 744
    Top = 18
    object tblNumeroOCOrdemCompra: TStringField
      DisplayLabel = 'N'#250'mero da Ordem de Compra'
      DisplayWidth = 8
      FieldName = 'OrdemCompra'
      EditMask = '00000/00'
      Size = 8
      AttributeSet = 'OrdemCompra'
    end
  end
  object tblRelOC: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'RelOC.db'
    TableType = ttParadox
    Left = 744
    Top = 66
    object tblRelOCIDRegistro: TAutoIncField
      FieldName = 'IDRegistro'
      ReadOnly = True
    end
    object tblRelOCOrdemCompra: TStringField
      FieldName = 'OrdemCompra'
      Size = 8
    end
    object tblRelOCDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblRelOCCdigoProduto: TStringField
      FieldName = 'CdigoProduto'
      Size = 12
    end
    object tblRelOCDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblRelOCUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 2
    end
    object tblRelOCQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblRelOCValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object tblRelOCValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
  end
  object dsRelVendas: TDataSource
    DataSet = tblRelVendas
    Left = 440
    Top = 242
  end
  object tblRelVendas: TTable
    DatabaseName = 'Tabelas'
    TableName = 'RelVendas.db'
    TableType = ttParadox
    Left = 840
    Top = 18
    object tblRelVendasCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 12
    end
    object tblRelVendasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblRelVendasUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object tblRelVendasQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblRelVendasPeso: TFloatField
      FieldName = 'Peso'
    end
    object tblRelVendasValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object tblRelVendasValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object tblRelVendasVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tblRelVendasData: TDateField
      FieldName = 'Data'
    end
    object tblRelVendasRefFabricante: TStringField
      FieldName = 'RefFabricante'
    end
  end
  object tblLogMensal: TTable
    DatabaseName = 'Tabelas'
    TableName = 'RelLogMensal.db'
    TableType = ttParadox
    Left = 232
    Top = 2
    object tblLogMensalDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblLogMensalDataLancamento: TDateField
      FieldName = 'DataLancamento'
    end
    object tblLogMensalDocumento: TStringField
      FieldName = 'Documento'
      Size = 9
    end
    object tblLogMensalCodigoMovimento: TStringField
      FieldName = 'CodigoMovimento'
      Size = 1
    end
    object tblLogMensalCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 25
    end
    object tblLogMensalUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 2
    end
    object tblLogMensalQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblLogMensalValorLancamento: TFloatField
      FieldName = 'ValorLancamento'
    end
    object tblLogMensalValorDinheiro: TFloatField
      FieldName = 'ValorDinheiro'
    end
    object tblLogMensalValorCheque: TFloatField
      FieldName = 'ValorCheque'
    end
    object tblLogMensalValorCobranca: TFloatField
      FieldName = 'ValorCobranca'
    end
    object tblLogMensalDiferenca: TFloatField
      FieldName = 'Diferenca'
    end
    object tblLogMensalTroco: TFloatField
      FieldName = 'Troco'
    end
    object tblLogMensalSubqtde: TFloatField
      FieldName = 'Subqtde'
    end
    object tblLogMensalSubtotal: TFloatField
      FieldName = 'Subtotal'
    end
    object tblLogMensalObservacao: TStringField
      FieldName = 'Observacao'
      Size = 100
    end
    object tblLogMensalFamilia: TStringField
      FieldName = 'Familia'
      Size = 30
    end
    object tblLogMensalSubpeso: TFloatField
      FieldName = 'Subpeso'
    end
    object tblLogMensalDescon: TFloatField
      FieldName = 'Descon'
    end
    object tblLogMensalDesconCT: TFloatField
      FieldName = 'DesconCT'
    end
    object tblLogMensalImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tblLogMensalCaracteristicas: TMemoField
      FieldName = 'Caracteristicas'
      BlobType = ftMemo
      Size = 200
    end
    object tblLogMensalEcommerce: TFloatField
      FieldName = 'Ecommerce'
    end
    object tblLogMensalTroca: TFloatField
      FieldName = 'Troca'
    end
    object tblLogMensalDevolucao: TFloatField
      FieldName = 'Devolucao'
    end
    object tblLogMensalEmprestimo: TFloatField
      FieldName = 'Emprestimo'
    end
    object tblLogMensalIPI: TFloatField
      FieldName = 'IPI'
    end
    object tblLogMensalValorIPI: TFloatField
      FieldName = 'ValorIPI'
    end
    object tblLogMensalNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
    object tblLogMensalCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
  end
  object dsLogMensal: TDataSource
    DataSet = tblLogMensal
    Left = 528
    Top = 242
  end
  object dsClientesOficina: TDataSource
    DataSet = tblClientesOficina
    Left = 440
    Top = 290
  end
  object tblClientesOficina: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ClientesOficina.db'
    TableType = ttParadox
    Left = 232
    Top = 98
    object tblClientesOficinaPlaca: TStringField
      FieldName = 'Placa'
      EditMask = 'AAA-9999;1;_'
      Size = 8
    end
    object tblClientesOficinaCarro: TStringField
      FieldName = 'Carro'
    end
    object tblClientesOficinaAnoModelo: TStringField
      FieldName = 'Ano/Modelo'
      EditMask = '99/99;1;_'
      Size = 5
    end
    object tblClientesOficinaCliente: TStringField
      FieldName = 'Cliente'
      Size = 50
    end
    object tblClientesOficinaEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tblClientesOficinaBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblClientesOficinaCidade: TStringField
      FieldName = 'Cidade'
    end
    object tblClientesOficinaCep: TStringField
      FieldName = 'Cep'
      EditMask = '99999-999;1;_'
      Size = 9
    end
    object tblClientesOficinaFone: TStringField
      FieldName = 'Fone'
      EditMask = '9999-9999;1;_'
    end
    object tblClientesOficinaMesAniversario: TStringField
      FieldName = 'MesAniversario'
      Size = 2
    end
  end
  object dsFichaServico: TDataSource
    DataSet = tblFichaServico
    Left = 528
    Top = 290
  end
  object tblFichaServico: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'Placa'
    MasterFields = 'Placa'
    MasterSource = dsClientesOficina
    TableName = 'FichaServico.DB'
    TableType = ttParadox
    Left = 232
    Top = 146
    object tblFichaServicoPlaca: TStringField
      FieldName = 'Placa'
      EditMask = 'AAA-9999;1;_'
      Size = 9
    end
    object tblFichaServicoData: TDateField
      FieldName = 'Data'
      EditMask = '!99/99/00;1;_'
    end
    object tblFichaServicoNumeroOS: TStringField
      DisplayLabel = 'Numero da OS'
      FieldName = 'NumeroOS'
      Size = 10
    end
    object tblFichaServicoServico: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'Servico'
      Size = 240
    end
    object tblFichaServicoGarantia: TStringField
      FieldName = 'Garantia'
    end
    object tblFichaServicoValorTotal: TCurrencyField
      DisplayLabel = 'Valor Total'
      FieldName = 'ValorTotal'
    end
    object tblFichaServicoFormaPagamento: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FormaPagamento'
    end
    object tblFichaServicoKm: TStringField
      FieldName = 'Km'
      Size = 6
    end
    object tblFichaServicoMecanico: TStringField
      FieldName = 'Mecanico'
    end
    object tblFichaServicoPrevRevisao: TDateField
      DisplayLabel = 'Previs'#227'o de Revis'#227'o'
      FieldName = 'PrevRevisao'
      EditMask = '!99/99/00;1;_'
    end
    object tblFichaServicoDtRevisao: TDateField
      DisplayLabel = 'Data Revis'#227'o'
      FieldName = 'DtRevisao'
      EditMask = '!99/99/00;1;_'
    end
  end
  object dsPecasServicos: TDataSource
    DataSet = tblPecasServicos
    Left = 1048
    Top = 18
  end
  object tblPecasServicos: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'Placa;NumeroOS'
    MasterFields = 'Placa;NumeroOS'
    MasterSource = dsFichaServico
    TableName = 'PecasServicos.DB'
    TableType = ttParadox
    Left = 232
    Top = 194
    object tblPecasServicosPlaca: TStringField
      FieldName = 'Placa'
      EditMask = 'AAA-9999;1;_'
      Size = 8
    end
    object tblPecasServicosNumeroOS: TStringField
      FieldName = 'NumeroOS'
      Size = 10
    end
    object tblPecasServicosPeca: TStringField
      DisplayLabel = 'Pe'#231'a'
      FieldName = 'Peca'
      Size = 50
    end
    object tblPecasServicosPrecoVenda: TCurrencyField
      DisplayLabel = 'Pre'#231'o de Venda'
      FieldName = 'PrecoVenda'
    end
    object tblPecasServicosPrecoCusto: TCurrencyField
      DisplayLabel = 'Pre'#231'o de Custo'
      FieldName = 'PrecoCusto'
    end
  end
  object tblContasReceber: TTable
    BeforeDelete = tblContasReceberBeforeDelete
    OnDeleteError = tblContasReceberDeleteError
    OnEditError = tblContasReceberEditError
    OnPostError = tblContasReceberPostError
    OnUpdateError = tblContasReceberUpdateError
    DatabaseName = 'SistemaGestaoEstoque'
    FieldDefs = <
      item
        Name = 'NumeroDocumento'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NumeroCIC'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'Parcelas'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NumeroNF'
        DataType = ftInteger
      end
      item
        Name = 'CodCli'
        DataType = ftInteger
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DataEmissao'
        DataType = ftDate
      end
      item
        Name = 'DataVencimento'
        DataType = ftDate
      end
      item
        Name = 'DataBaixa'
        DataType = ftDate
      end
      item
        Name = 'FormaPagamento'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'ValorDocumento'
        DataType = ftCurrency
      end
      item
        Name = 'ValorDinheiro'
        DataType = ftCurrency
      end
      item
        Name = 'ValorCheque'
        DataType = ftCurrency
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end
      item
        Name = 'Diferenca'
        DataType = ftCurrency
      end
      item
        Name = 'Troco'
        DataType = ftCurrency
      end
      item
        Name = 'LocalPagamento'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DataPagamento'
        DataType = ftDate
      end
      item
        Name = 'DiasAtraso'
        DataType = ftFloat
      end
      item
        Name = 'Vendedor'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Motorista'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Observacao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Status'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Restante'
        DataType = ftFloat
      end
      item
        Name = 'Juros'
        DataType = ftFloat
      end
      item
        Name = 'JurosCT'
        DataType = ftFloat
      end
      item
        Name = 'DtBranco'
        DataType = ftDate
      end
      item
        Name = 'Desconto'
        DataType = ftFloat
      end
      item
        Name = 'ValorDesc'
        DataType = ftFloat
      end
      item
        Name = 'DescontoCT'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'tblContasReceberIndex1'
        Fields = 'NumeroDocumento;NumeroCIC;Parcelas'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'IndOrdemVenc'
        Fields = 'NumeroCIC;DataVencimento'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndNota'
        Fields = 'NumeroNF'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndDataBaixa'
        Fields = 'DataBaixa'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndNumeroDocumento'
        Fields = 'NumeroDocumento'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'indctrdtvenc'
        Fields = 'DataVencimento'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'indctrdtemis'
        Fields = 'DataEmissao'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'indCNPJCPF'
        Fields = 'NumeroCIC'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndDataPagamento'
        Fields = 'DataPagamento'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IndCodCli'
        Fields = 'CodCli'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IndCodCli'
    MasterFields = 'CodigoCliente'
    MasterSource = dsClientes
    StoreDefs = True
    TableName = 'ContasReceber'
    TableType = ttParadox
    Left = 232
    Top = 248
    object tblContasReceberNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
      Size = 8
    end
    object tblContasReceberNumeroCIC: TStringField
      FieldName = 'NumeroCIC'
      Size = 18
    end
    object tblContasReceberNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object tblContasReceberParcelas: TStringField
      FieldName = 'Parcelas'
      Size = 3
    end
    object tblContasReceberCliente: TStringField
      FieldName = 'Cliente'
      Size = 40
    end
    object tblContasReceberDataEmissao: TDateField
      FieldName = 'DataEmissao'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasReceberDataVencimento: TDateField
      FieldName = 'DataVencimento'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasReceberFormaPagamento: TStringField
      FieldName = 'FormaPagamento'
      Size = 5
    end
    object tblContasReceberValorDocumento: TCurrencyField
      FieldName = 'ValorDocumento'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberValorDinheiro: TCurrencyField
      FieldName = 'ValorDinheiro'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberValorCheque: TCurrencyField
      FieldName = 'ValorCheque'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberLocalPagamento: TStringField
      FieldName = 'LocalPagamento'
      Size = 2
    end
    object tblContasReceberDataPagamento: TDateField
      FieldName = 'DataPagamento'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasReceberDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tblContasReceberVendedor: TStringField
      FieldName = 'Vendedor'
      Size = 3
    end
    object tblContasReceberObservacao: TStringField
      FieldName = 'Observacao'
      Size = 100
    end
    object tblContasReceberStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblContasReceberDiferenca: TCurrencyField
      FieldName = 'Diferenca'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberMotorista: TStringField
      FieldName = 'Motorista'
      Size = 3
    end
    object tblContasReceberDataBaixa: TDateField
      FieldName = 'DataBaixa'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasReceberCodCli: TIntegerField
      FieldName = 'CodCli'
    end
    object tblContasReceberTroco: TCurrencyField
      FieldName = 'Troco'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberRestante: TFloatField
      FieldName = 'Restante'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberJuros: TFloatField
      FieldName = 'Juros'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberJurosCT: TFloatField
      FieldName = 'JurosCT'
      DisplayFormat = '###,##0.00'
    end
    object tblContasReceberDtBranco: TDateField
      FieldName = 'DtBranco'
    end
    object tblContasReceberDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tblContasReceberValorDesc: TFloatField
      FieldName = 'ValorDesc'
    end
    object tblContasReceberDescontoCT: TFloatField
      FieldName = 'DescontoCT'
    end
  end
  object dsContasReceber: TDataSource
    DataSet = tblContasReceber
    Left = 1136
    Top = 18
  end
  object tblContasPagar: TTable
    BeforeDelete = tblContasPagarBeforeDelete
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'CodigoFornecedor'
    MasterFields = 'CodigoFornecedor'
    MasterSource = dsFornecedores
    TableName = 'ContasPagar.db'
    Left = 240
    Top = 50
    object tblContasPagarCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      Size = 4
    end
    object tblContasPagarNumeroDocumento: TStringField
      FieldName = 'NumeroDocumento'
      Size = 10
    end
    object tblContasPagarFornecedor: TStringField
      FieldName = 'Fornecedor'
      Size = 40
    end
    object tblContasPagarDataEmissao: TDateField
      FieldName = 'DataEmissao'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasPagarDataVencimento: TDateField
      FieldName = 'DataVencimento'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasPagarValorDocumento: TCurrencyField
      FieldName = 'ValorDocumento'
      DisplayFormat = '###,##0.00'
    end
    object tblContasPagarFormaPagamento: TStringField
      FieldName = 'FormaPagamento'
      Size = 5
    end
    object tblContasPagarValorPago: TCurrencyField
      FieldName = 'ValorPago'
      DisplayFormat = '###,##0.00'
    end
    object tblContasPagarDataPagamento: TDateField
      FieldName = 'DataPagamento'
      EditMask = '!99/99/00;1;_'
    end
    object tblContasPagarDiasAtraso: TFloatField
      FieldName = 'DiasAtraso'
    end
    object tblContasPagarObservacao: TStringField
      FieldName = 'Observacao'
      Size = 100
    end
    object tblContasPagarStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblContasPagarAsterisco: TStringField
      FieldName = 'Asterisco'
      Size = 1
    end
    object tblContasPagarPrazo: TFloatField
      FieldName = 'Prazo'
    end
    object tblContasPagarBaixado: TStringField
      FieldName = 'Baixado'
      Size = 3
    end
    object tblContasPagarCreditoICMS: TFloatField
      FieldName = 'CreditoICMS'
      DisplayFormat = '###,##0.00'
    end
    object tblContasPagarDiferenca: TCurrencyField
      FieldName = 'Diferenca'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsContasPagar: TDataSource
    DataSet = tblContasPagar
    Left = 1048
    Top = 66
  end
  object tblCeplog: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ceplog.DB'
    Left = 232
    Top = 290
    object tblCeplogCEP: TFloatField
      FieldName = 'CEP'
    end
    object tblCeplogCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 5
    end
    object tblCeplogRECTYPE: TStringField
      FieldName = 'RECTYPE'
      Size = 1
    end
    object tblCeplogUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tblCeplogTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object tblCeplogTITULO: TStringField
      FieldName = 'TITULO'
      Size = 15
    end
    object tblCeplogPREPOSICAO: TStringField
      FieldName = 'PREPOSICAO'
      Size = 15
    end
    object tblCeplogNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object tblCeplogBAIRRO1: TStringField
      FieldName = 'BAIRRO1'
      Size = 30
    end
    object tblCeplogBAIRRO2: TStringField
      FieldName = 'BAIRRO2'
      Size = 30
    end
    object tblCeplogLIMINFPAR: TFloatField
      FieldName = 'LIMINFPAR'
    end
    object tblCeplogLIMINFIMPA: TFloatField
      FieldName = 'LIMINFIMPA'
    end
    object tblCeplogLIMSUPPAR: TFloatField
      FieldName = 'LIMSUPPAR'
    end
    object tblCeplogLIMSUPIMPA: TFloatField
      FieldName = 'LIMSUPIMPA'
    end
    object tblCeplogFLAGS: TFloatField
      FieldName = 'FLAGS'
    end
    object tblCeplogLADOS: TFloatField
      FieldName = 'LADOS'
    end
  end
  object dsCeplog: TDataSource
    DataSet = tblCeplog
    Left = 1136
    Top = 66
  end
  object tblCepcid: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'UF;CHAVE'
    MasterFields = 'UF;CHAVE'
    MasterSource = dsCeplog
    TableName = 'cepcid.DB'
    Left = 744
    Top = 218
    object tblCepcidUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tblCepcidCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 5
    end
    object tblCepcidCEPMIN: TStringField
      FieldName = 'CEPMIN'
      Size = 8
    end
    object tblCepcidCEPMAX: TStringField
      FieldName = 'CEPMAX'
      Size = 8
    end
    object tblCepcidCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object tblCepcidCOD_DDD: TStringField
      FieldName = 'COD_DDD'
      Size = 3
    end
  end
  object dsCepcid: TDataSource
    DataSet = tblCepcid
    Left = 344
    Top = 10
  end
  object dsPedidos: TDataSource
    DataSet = tblPedidos
    Left = 952
    Top = 266
  end
  object tblRelNotaFiscal: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'RelNotaFiscal.db'
    Left = 744
    Top = 116
    object tblRelNotaFiscalTipoNF: TStringField
      FieldName = 'TipoNF'
      Size = 1
    end
    object tblRelNotaFiscalNumeroNF: TIntegerField
      FieldName = 'NumeroNF'
    end
    object tblRelNotaFiscalNaturezaOP: TStringField
      FieldName = 'NaturezaOP'
      Size = 7
    end
    object tblRelNotaFiscalNumeroRG: TStringField
      FieldName = 'NumeroRG'
      Size = 15
    end
    object tblRelNotaFiscalCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object tblRelNotaFiscalNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 40
    end
    object tblRelNotaFiscalNumeroCIC: TStringField
      FieldName = 'NumeroCIC'
      Size = 18
    end
    object tblRelNotaFiscalEnderecoResidencia: TStringField
      FieldName = 'EnderecoResidencia'
      Size = 50
    end
    object tblRelNotaFiscalNumero: TFloatField
      FieldName = 'Numero'
    end
    object tblRelNotaFiscalBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblRelNotaFiscalComplemento: TStringField
      FieldName = 'Complemento'
    end
    object tblRelNotaFiscalCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object tblRelNotaFiscalEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblRelNotaFiscalCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tblRelNotaFiscalCodigoIBGE: TStringField
      FieldName = 'CodigoIBGE'
      Size = 9
    end
    object tblRelNotaFiscalTelefone: TStringField
      FieldName = 'Telefone'
      Size = 16
    end
    object tblRelNotaFiscalFax: TStringField
      FieldName = 'Fax'
      Size = 16
    end
    object tblRelNotaFiscalDescricaoProd: TStringField
      FieldName = 'DescricaoProd'
      Size = 80
    end
    object tblRelNotaFiscalCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object tblRelNotaFiscalUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object tblRelNotaFiscalQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblRelNotaFiscalValorUnitario: TFloatField
      FieldName = 'ValorUnitario'
    end
    object tblRelNotaFiscalValorTotal: TFloatField
      FieldName = 'ValorTotal'
    end
    object tblRelNotaFiscalAliqICMS: TIntegerField
      FieldName = 'AliqICMS'
    end
    object tblRelNotaFiscalBaseICMS: TFloatField
      FieldName = 'BaseICMS'
    end
    object tblRelNotaFiscalValorICMS: TFloatField
      FieldName = 'ValorICMS'
    end
    object tblRelNotaFiscalValorTotalProd: TFloatField
      FieldName = 'ValorTotalProd'
    end
    object tblRelNotaFiscalValorTotalNota: TFloatField
      FieldName = 'ValorTotalNota'
    end
    object tblRelNotaFiscalTranspNome: TStringField
      FieldName = 'TranspNome'
      Size = 40
    end
    object tblRelNotaFiscalFrete: TStringField
      FieldName = 'Frete'
      Size = 1
    end
    object tblRelNotaFiscalUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tblRelNotaFiscalQuantidadeTotal: TFloatField
      FieldName = 'QuantidadeTotal'
    end
    object tblRelNotaFiscalNPedidoNF: TStringField
      FieldName = 'NPedidoNF'
      Size = 10
    end
    object tblRelNotaFiscalCodigoVendedor1: TStringField
      FieldName = 'CodigoVendedor1'
      Size = 2
    end
    object tblRelNotaFiscalCondPagamento: TStringField
      FieldName = 'CondPagamento'
      Size = 30
    end
  end
  object dsRelNotaFiscal: TDataSource
    DataSet = tblRelNotaFiscal
    Left = 1048
    Top = 116
  end
  object dsANotaFiscal: TDataSource
    DataSet = tblANotaFiscal
    Left = 1136
    Top = 116
  end
  object tblANotaFiscal: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexFieldNames = 'NrNF'
    TableName = 'ANotaFiscal.DB'
    Left = 840
    Top = 116
    object tblANotaFiscalNrNF: TIntegerField
      FieldName = 'NrNF'
    end
    object tblANotaFiscalPedido: TStringField
      FieldName = 'Pedido'
      Size = 8
    end
    object tblANotaFiscalCFOP: TStringField
      FieldName = 'CFOP'
      Size = 70
    end
    object tblANotaFiscalDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblANotaFiscalDMEmissao: TStringField
      FieldName = 'DMEmissao'
      Size = 4
    end
    object tblANotaFiscalCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object tblANotaFiscalBaseCalculo: TFloatField
      FieldName = 'BaseCalculo'
    end
    object tblANotaFiscalValorICMS: TFloatField
      FieldName = 'ValorICMS'
    end
    object tblANotaFiscalVcont7: TFloatField
      FieldName = 'Vcont7'
    end
    object tblANotaFiscalVcont12: TFloatField
      FieldName = 'Vcont12'
    end
    object tblANotaFiscalVcont18: TFloatField
      FieldName = 'Vcont18'
    end
    object tblANotaFiscalVcont25: TFloatField
      FieldName = 'Vcont25'
    end
    object tblANotaFiscalBase7: TFloatField
      FieldName = 'Base7'
    end
    object tblANotaFiscalBase12: TFloatField
      FieldName = 'Base12'
    end
    object tblANotaFiscalBase18: TFloatField
      FieldName = 'Base18'
    end
    object tblANotaFiscalBase25: TFloatField
      FieldName = 'Base25'
    end
    object tblANotaFiscalIcms7: TFloatField
      FieldName = 'Icms7'
    end
    object tblANotaFiscalIcms12: TFloatField
      FieldName = 'Icms12'
    end
    object tblANotaFiscalIcms18: TFloatField
      FieldName = 'Icms18'
    end
    object tblANotaFiscalIcms25: TFloatField
      FieldName = 'Icms25'
    end
    object tblANotaFiscalIcmsR12: TFloatField
      FieldName = 'IcmsR12'
    end
    object tblANotaFiscalIcmsR18: TFloatField
      FieldName = 'IcmsR18'
    end
    object tblANotaFiscalBaseR12: TFloatField
      FieldName = 'BaseR12'
    end
    object tblANotaFiscalBaseR18: TFloatField
      FieldName = 'BaseR18'
    end
    object tblANotaFiscalValorTNF: TFloatField
      FieldName = 'ValorTNF'
    end
    object tblANotaFiscalEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object tblANotaFiscalSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tblANotaFiscalBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object tblANotaFiscalAliqIcms: TFloatField
      FieldName = 'AliqIcms'
    end
    object tblANotaFiscalImpostoIcms: TFloatField
      FieldName = 'ImpostoIcms'
    end
    object tblANotaFiscalIsentoIcms: TFloatField
      FieldName = 'IsentoIcms'
    end
    object tblANotaFiscalOutrasIcms: TFloatField
      FieldName = 'OutrasIcms'
    end
    object tblANotaFiscalIcmsNaFonte: TFloatField
      FieldName = 'IcmsNaFonte'
    end
    object tblANotaFiscalDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tblANotaFiscalValorVista: TFloatField
      FieldName = 'ValorVista'
    end
    object tblANotaFiscalValorPrazo: TFloatField
      FieldName = 'ValorPrazo'
    end
    object tblANotaFiscalContribuinte: TFloatField
      FieldName = 'Contribuinte'
    end
    object tblANotaFiscalTipoNota: TFloatField
      FieldName = 'TipoNota'
    end
    object tblANotaFiscalObsLivre: TStringField
      FieldName = 'ObsLivre'
      Size = 14
    end
    object tblANotaFiscalCgc: TStringField
      FieldName = 'Cgc'
      Size = 14
    end
    object tblANotaFiscalInscrEstadual: TStringField
      FieldName = 'InscrEstadual'
      Size = 16
    end
    object tblANotaFiscalRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 35
    end
    object tblANotaFiscalContaCtblFornecedor: TStringField
      FieldName = 'ContaCtblFornecedor'
      Size = 18
    end
    object tblANotaFiscalUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object tblANotaFiscalNrMunicipio: TFloatField
      FieldName = 'NrMunicipio'
    end
    object tblANotaFiscalIsentoPis: TFloatField
      FieldName = 'IsentoPis'
    end
    object tblANotaFiscalCodContabil: TFloatField
      FieldName = 'CodContabil'
    end
    object tblANotaFiscalIsento7: TFloatField
      FieldName = 'Isento7'
    end
    object tblANotaFiscalIsento12: TFloatField
      FieldName = 'Isento12'
    end
    object tblANotaFiscalIsento18: TFloatField
      FieldName = 'Isento18'
    end
    object tblANotaFiscalIsento25: TFloatField
      FieldName = 'Isento25'
    end
    object tblANotaFiscalIsentoR18: TFloatField
      FieldName = 'IsentoR18'
    end
    object tblANotaFiscalOutras7: TFloatField
      FieldName = 'Outras7'
    end
    object tblANotaFiscalOutras12: TFloatField
      FieldName = 'Outras12'
    end
    object tblANotaFiscalOutras18: TFloatField
      FieldName = 'Outras18'
    end
    object tblANotaFiscalOutras25: TFloatField
      FieldName = 'Outras25'
    end
    object tblANotaFiscalOutrasR18: TFloatField
      FieldName = 'OutrasR18'
    end
    object tblANotaFiscalVago: TStringField
      FieldName = 'Vago'
      Size = 50
    end
    object tblANotaFiscalV: TStringField
      FieldName = 'V'
      Size = 1
    end
    object tblANotaFiscalBaseST: TFloatField
      FieldName = 'BaseST'
    end
    object tblANotaFiscalIcmsST: TFloatField
      FieldName = 'IcmsST'
    end
    object tblANotaFiscalIPI: TFloatField
      FieldName = 'IPI'
    end
    object tblANotaFiscalPIS: TFloatField
      FieldName = 'PIS'
    end
    object tblANotaFiscalCOFINS: TFloatField
      FieldName = 'COFINS'
    end
    object tblANotaFiscalChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Size = 50
    end
    object tblANotaFiscalProtocolo: TStringField
      FieldName = 'Protocolo'
      Size = 30
    end
    object tblANotaFiscalCaminhoXML: TStringField
      FieldName = 'CaminhoXML'
      Size = 90
    end
    object tblANotaFiscalCaminho2: TStringField
      FieldName = 'Caminho2'
      Size = 90
    end
    object tblANotaFiscalDataCanc: TDateField
      FieldName = 'DataCanc'
    end
    object tblANotaFiscalCancelada: TStringField
      FieldName = 'Cancelada'
      Size = 1
    end
    object tblANotaFiscalJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 40
    end
    object tblANotaFiscalDespesasAC: TFloatField
      FieldName = 'DespesasAC'
    end
    object tblANotaFiscalFrete: TFloatField
      FieldName = 'Frete'
    end
    object tblANotaFiscalStatus: TIntegerField
      FieldName = 'Status'
    end
    object tblANotaFiscalMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 100
    end
    object tblANotaFiscalLinhaConting: TStringField
      FieldName = 'LinhaConting'
      Size = 150
    end
    object tblANotaFiscalVTributos: TFloatField
      FieldName = 'VTributos'
    end
    object tblANotaFiscalRamo6: TFloatField
      FieldName = 'Ramo6'
    end
    object tblANotaFiscalRamo7: TFloatField
      FieldName = 'Ramo7'
    end
    object tblANotaFiscalRevIcmsST: TFloatField
      FieldName = 'RevIcmsST'
    end
    object tblANotaFiscalRevBaseST: TFloatField
      FieldName = 'RevBaseST'
    end
    object tblANotaFiscalPartilhaOR: TFloatField
      FieldName = 'PartilhaOR'
    end
    object tblANotaFiscalPartilhaDS: TFloatField
      FieldName = 'PartilhaDS'
    end
    object tblANotaFiscalFCP: TFloatField
      FieldName = 'FCP'
    end
    object tblANotaFiscalTribFed: TFloatField
      FieldName = 'TribFed'
    end
    object tblANotaFiscalTribEst: TFloatField
      FieldName = 'TribEst'
    end
    object tblANotaFiscalTribMun: TFloatField
      FieldName = 'TribMun'
    end
  end
  object qryVendedor: TQuery
    DatabaseName = 'SistemaGestaoEstoque'
    SessionName = 'Default'
    DataSource = dsPedidos
    SQL.Strings = (
      '')
    Left = 744
    Top = 271
    object qryVendedorCodigoVendedor: TStringField
      FieldName = 'CodigoVendedor'
      Origin = 'SISTEMAGESTAOESTOQUE."Pedidos.DB".CodigoVendedor'
      Size = 3
    end
    object qryVendedorVendedor: TStringField
      FieldName = 'Vendedor'
      Origin = 'SISTEMAGESTAOESTOQUE."Pedidos.DB".Vendedor'
      Size = 40
    end
    object qryVendedorTotal: TCurrencyField
      FieldName = 'Total'
      Origin = 'SISTEMAGESTAOESTOQUE."Pedidos.DB".Total'
    end
    object qryVendedorVencimento: TDateField
      FieldName = 'Vencimento'
      Origin = 'SISTEMAGESTAOESTOQUE."Pedidos.DB".Vencimento'
    end
    object qryVendedorComissao: TFloatField
      FieldName = 'Comissao'
      Origin = 'SISTEMAGESTAOESTOQUE."Pedidos.DB".Comissao'
    end
    object qryVendedorInicio: TDateField
      FieldName = 'Inicio'
    end
  end
  object dsVendedor: TDataSource
    DataSet = qryVendedor
    Left = 952
    Top = 167
  end
  object dsCheques: TDataSource
    DataSet = tblCheques
    Left = 1048
    Top = 167
  end
  object tblCheques: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    IndexName = 'IndNPedido'
    MasterFields = 'NumeroDocumento'
    MasterSource = dsContasReceber
    TableName = 'Cheques.db'
    Left = 744
    Top = 167
    object tblChequesID_ChequeDinheiro: TAutoIncField
      FieldName = 'ID_ChequeDinheiro'
      ReadOnly = True
    end
    object tblChequesCodCli: TFloatField
      FieldName = 'CodCli'
    end
    object tblChequesNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 80
    end
    object tblChequesNumeroPedido: TStringField
      FieldName = 'NumeroPedido'
      Size = 8
    end
    object tblChequesParcelas: TStringField
      FieldName = 'Parcelas'
      Size = 3
    end
    object tblChequesBanco: TStringField
      FieldName = 'Banco'
      Size = 5
    end
    object tblChequesAgencia: TStringField
      FieldName = 'Agencia'
      Size = 7
    end
    object tblChequesCorrentista: TStringField
      FieldName = 'Correntista'
      Size = 50
    end
    object tblChequesNumeroCheque: TStringField
      FieldName = 'NumeroCheque'
      Size = 7
    end
    object tblChequesValorCheque: TCurrencyField
      FieldName = 'ValorCheque'
    end
    object tblChequesDataEmissao: TDateField
      FieldName = 'DataEmissao'
      EditMask = '!99/99/00;1;_'
    end
    object tblChequesDataVencimento: TDateField
      FieldName = 'DataVencimento'
      EditMask = '!99/99/00;1;_'
    end
  end
  object tblFluxoCaixa: TTable
    DatabaseName = 'Tabelas'
    TableName = 'FluxoCaixa.db'
    Left = 840
    Top = 168
    object tblFluxoCaixaDataVencimento: TDateField
      FieldName = 'DataVencimento'
    end
    object tblFluxoCaixaDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblFluxoCaixaValorLancamento: TFloatField
      FieldName = 'ValorLancamento'
    end
    object tblFluxoCaixaTotalReceber: TFloatField
      FieldName = 'TotalReceber'
    end
    object tblFluxoCaixaTotalPagar: TFloatField
      FieldName = 'TotalPagar'
    end
    object tblFluxoCaixaSubTotal: TFloatField
      FieldName = 'SubTotal'
    end
    object tblFluxoCaixaStatus: TStringField
      FieldName = 'Status'
      Size = 10
    end
    object tblFluxoCaixaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblFluxoCaixaObs: TStringField
      FieldName = 'Obs'
      Size = 100
    end
    object tblFluxoCaixaNumeroDoc: TStringField
      FieldName = 'NumeroDoc'
      Size = 9
    end
  end
  object dsFluxoCaixa: TDataSource
    DataSet = tblFluxoCaixa
    Left = 1136
    Top = 168
  end
  object tblContaCorrenteProduto: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ContaCorrenteProduto.DB'
    Left = 136
    Top = 46
    object tblContaCorrenteProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblContaCorrenteProdutoCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 14
    end
    object tblContaCorrenteProdutoCliFor: TStringField
      FieldName = 'CliFor'
      Size = 40
    end
    object tblContaCorrenteProdutoDocumento: TStringField
      FieldName = 'Documento'
      Size = 6
    end
    object tblContaCorrenteProdutoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblContaCorrenteProdutoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tblContaCorrenteProdutoData: TDateField
      FieldName = 'Data'
    end
    object tblContaCorrenteProdutoStatus: TStringField
      FieldName = 'Status'
      Size = 2
    end
  end
  object dsContaCorrenteProduto: TDataSource
    DataSet = tblContaCorrenteProduto
    Left = 344
    Top = 288
  end
  object dsPedidosBKP: TDataSource
    Left = 1056
    Top = 272
  end
  object tblPedidos: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Pedidos.DB'
    Left = 648
    Top = 227
    object tblPedidosCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object tblPedidosNPedido: TStringField
      FieldName = 'NPedido'
      Size = 8
    end
    object tblPedidosCodigoVendedor: TStringField
      FieldName = 'CodigoVendedor'
      Size = 3
    end
    object tblPedidosVendedor: TStringField
      FieldName = 'Vendedor'
      Size = 40
    end
    object tblPedidosProduto: TStringField
      FieldName = 'Produto'
      Size = 12
    end
    object tblPedidosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object tblPedidosPeso: TFloatField
      FieldName = 'Peso'
    end
    object tblPedidosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblPedidosUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tblPedidosTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tblPedidosPagamento: TStringField
      FieldName = 'Pagamento'
      Size = 3
    end
    object tblPedidosVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tblPedidosCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object tblPedidosDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tblPedidosComissao: TFloatField
      FieldName = 'Comissao'
    end
    object tblPedidosMotorista: TStringField
      FieldName = 'Motorista'
      Size = 3
    end
    object tblPedidosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object tblPedidosUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object tblPedidosICMS: TFloatField
      FieldName = 'ICMS'
    end
    object tblPedidosDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblPedidosCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      Size = 4
    end
    object tblPedidosDataEmissaoOriginal: TDateField
      FieldName = 'DataEmissaoOriginal'
    end
    object tblPedidosCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object tblPedidosCodigoReferencia: TStringField
      FieldName = 'CodigoReferencia'
    end
    object tblPedidosAliqTrib: TFloatField
      FieldName = 'AliqTrib'
    end
    object tblPedidosVTributos: TFloatField
      FieldName = 'VTributos'
    end
    object tblPedidosNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object tblPedidosTribFed: TFloatField
      FieldName = 'TribFed'
    end
    object tblPedidosTribEst: TFloatField
      FieldName = 'TribEst'
    end
    object tblPedidosTribMun: TFloatField
      FieldName = 'TribMun'
    end
    object tblPedidosValorIPI: TFloatField
      FieldName = 'ValorIPI'
    end
    object tblPedidosIPI: TFloatField
      FieldName = 'IPI'
    end
    object tblPedidosBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object tblPedidosValorICMS: TFloatField
      FieldName = 'ValorICMS'
    end
    object tblPedidosBaseST: TFloatField
      FieldName = 'BaseST'
    end
    object tblPedidosIcmsST: TFloatField
      FieldName = 'IcmsST'
    end
    object tblPedidosPercReducao: TFloatField
      FieldName = 'PercReducao'
    end
    object tblPedidosCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object tblPedidosNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 50
    end
  end
  object tblDataCR: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'DataCR.db'
    Left = 648
    Top = 168
    object tblDataCRData: TDateField
      FieldName = 'Data'
    end
  end
  object dsDataCR: TDataSource
    DataSet = tblDataCR
    Left = 1048
    Top = 222
  end
  object tblECF: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ECF'
    TableType = ttParadox
    Left = 648
    Top = 120
    object tblECFCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 13
    end
    object tblECFDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tblECFQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object tblECFPreco: TFloatField
      FieldName = 'Preco'
    end
    object tblECFAliquota: TStringField
      FieldName = 'Aliquota'
      Size = 2
    end
    object tblECFPedido: TStringField
      FieldName = 'Pedido'
      Size = 10
    end
  end
  object dsECF: TDataSource
    DataSet = tblECF
    Left = 952
    Top = 120
  end
  object dsItem: TDataSource
    DataSet = tblItem
    Left = 1144
    Top = 224
  end
  object tblItem: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ITEM.DBF'
    Left = 840
    Top = 224
    object tblItemCODI: TStringField
      FieldName = 'CODI'
      Size = 5
    end
    object tblItemGRUP: TStringField
      FieldName = 'GRUP'
      Size = 10
    end
    object tblItemDESC: TStringField
      FieldName = 'DESC'
      Size = 40
    end
    object tblItemQUAN: TFloatField
      FieldName = 'QUAN'
    end
    object tblItemPREC: TFloatField
      FieldName = 'PREC'
    end
    object tblItemPRE1: TFloatField
      FieldName = 'PRE1'
    end
    object tblItemUNID: TStringField
      FieldName = 'UNID'
      Size = 2
    end
    object tblItemDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object qryItens: TQuery
    DatabaseName = 'SistemaGestaoEstoque'
    DataSource = dsItem
    SQL.Strings = (
      'SELECT * FROM ITEM.DBF;')
    Left = 656
    Top = 272
    object qryItensCODI: TStringField
      FieldName = 'CODI'
      Size = 5
    end
    object qryItensGRUP: TStringField
      FieldName = 'GRUP'
      Size = 10
    end
    object qryItensDESC: TStringField
      FieldName = 'DESC'
      Size = 40
    end
    object qryItensQUAN: TFloatField
      FieldName = 'QUAN'
    end
    object qryItensPREC: TFloatField
      FieldName = 'PREC'
    end
    object qryItensPRE1: TFloatField
      FieldName = 'PRE1'
    end
    object qryItensUNID: TStringField
      FieldName = 'UNID'
      Size = 2
    end
    object qryItensDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object tblCupomFiscal: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'CupomFiscal.db'
    Left = 784
    Top = 368
    object tblCupomFiscalNrNF: TIntegerField
      FieldName = 'NrNF'
    end
    object tblCupomFiscalNPedido: TStringField
      FieldName = 'NPedido'
      Size = 8
    end
    object tblCupomFiscalCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tblCupomFiscalChave: TStringField
      FieldName = 'Chave'
      Size = 44
    end
    object tblCupomFiscalCaminhoXML: TStringField
      FieldName = 'CaminhoXML'
      Size = 100
    end
    object tblCupomFiscalCancelado: TStringField
      FieldName = 'Cancelado'
      Size = 1
    end
    object tblCupomFiscalData: TDateField
      FieldName = 'Data'
    end
    object tblCupomFiscalHora: TTimeField
      FieldName = 'Hora'
    end
    object tblCupomFiscalValor: TFloatField
      FieldName = 'Valor'
    end
    object tblCupomFiscalPagamento: TStringField
      FieldName = 'Pagamento'
      Size = 2
    end
    object tblCupomFiscalCPFCnpj: TStringField
      FieldName = 'CPFCnpj'
      Size = 14
    end
    object tblCupomFiscalDH: TCurrencyField
      FieldName = 'DH'
    end
    object tblCupomFiscalCC: TCurrencyField
      FieldName = 'CC'
    end
    object tblCupomFiscalCD: TCurrencyField
      FieldName = 'CD'
    end
    object tblCupomFiscalCH: TCurrencyField
      FieldName = 'CH'
    end
    object tblCupomFiscalCL: TCurrencyField
      FieldName = 'CL'
    end
    object tblCupomFiscalVP: TCurrencyField
      FieldName = 'VP'
    end
    object tblCupomFiscalOT: TCurrencyField
      FieldName = 'OT'
    end
    object tblCupomFiscalVA: TCurrencyField
      FieldName = 'VA'
    end
    object tblCupomFiscalVR: TCurrencyField
      FieldName = 'VR'
    end
    object tblCupomFiscalVC: TCurrencyField
      FieldName = 'VC'
    end
    object tblCupomFiscalDT: TCurrencyField
      FieldName = 'DT'
    end
    object tblCupomFiscalPX: TCurrencyField
      FieldName = 'PX'
    end
    object tblCupomFiscalCaminho2: TStringField
      FieldName = 'Caminho2'
      Size = 100
    end
    object tblCupomFiscalStatus: TIntegerField
      FieldName = 'Status'
    end
    object tblCupomFiscalCodContabil: TIntegerField
      FieldName = 'CodContabil'
    end
    object tblCupomFiscalProtocolo: TStringField
      FieldName = 'Protocolo'
      Size = 30
    end
    object tblCupomFiscalJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 60
    end
    object tblCupomFiscalDataCanc: TDateField
      FieldName = 'DataCanc'
    end
    object tblCupomFiscalMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 100
    end
    object tblCupomFiscalEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
  end
  object dsCupomFiscal: TDataSource
    DataSet = tblCupomFiscal
    Left = 832
    Top = 376
  end
  object tblIbpt: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'TabelaIBPT2016.dbf'
    Left = 654
    Top = 353
    object tblIbptNCM: TFloatField
      FieldName = 'NCM'
    end
    object tblIbptNACFEDERAL: TFloatField
      FieldName = 'NACFEDERAL'
    end
    object tblIbptIMPFEDERAL: TFloatField
      FieldName = 'IMPFEDERAL'
    end
    object tblIbptESTADUAL: TFloatField
      FieldName = 'ESTADUAL'
    end
    object tblIbptMUNICIPAL: TFloatField
      FieldName = 'MUNICIPAL'
    end
    object tblIbptALIQNAC: TFloatField
      FieldName = 'ALIQNAC'
    end
    object tblIbptALIQIMP: TFloatField
      FieldName = 'ALIQIMP'
    end
  end
  object dsIBPT: TDataSource
    DataSet = tblIbpt
    Left = 693
    Top = 369
  end
  object tblEntregas: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Entregas.db'
    Left = 1144
    Top = 360
    object tblEntregasRegistro: TAutoIncField
      FieldName = 'Registro'
      ReadOnly = True
    end
    object tblEntregasMotoboy: TStringField
      FieldName = 'Motoboy'
      Size = 40
    end
    object tblEntregasData: TDateField
      FieldName = 'Data'
      EditMask = '##/##/##;1;_'
    end
    object tblEntregasSaida: TTimeField
      FieldName = 'Saida'
      EditMask = '##:##;1;_'
    end
    object tblEntregasRetorno: TTimeField
      FieldName = 'Retorno'
      EditMask = '##:##;1;_'
    end
    object tblEntregasPedidos: TStringField
      FieldName = 'Pedidos'
      Size = 100
    end
    object tblEntregasDestino: TStringField
      FieldName = 'Destino'
      Size = 80
    end
    object tblEntregasCodCli: TIntegerField
      FieldName = 'CodCli'
    end
  end
  object dsEntregas: TDataSource
    DataSet = tblEntregas
    Left = 1176
    Top = 376
  end
  object dsqProdutos: TDataSource
    DataSet = qryProdutos
    Left = 1008
    Top = 371
  end
  object qryProdutos: TQuery
    DatabaseName = 'SistemaGestaoEstoque'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM Produtos.db;')
    Left = 944
    Top = 372
    object qryProdutosCodigoFamilia: TStringField
      FieldName = 'CodigoFamilia'
      Size = 3
    end
    object qryProdutosCodigoCategoria: TStringField
      FieldName = 'CodigoCategoria'
      Size = 3
    end
    object qryProdutosCodigoProduto: TStringField
      FieldName = 'CodigoProduto'
      Size = 6
    end
    object qryProdutosCodigo: TStringField
      FieldName = 'Codigo'
      Size = 12
    end
    object qryProdutosReferenciaFabricante: TStringField
      FieldName = 'ReferenciaFabricante'
      Size = 12
    end
    object qryProdutosCodigoBarra: TStringField
      FieldName = 'CodigoBarra'
      Size = 13
    end
    object qryProdutosReferenciaFabricante2: TStringField
      FieldName = 'ReferenciaFabricante2'
      Size = 12
    end
    object qryProdutosReferenciaFabricante3: TStringField
      FieldName = 'ReferenciaFabricante3'
      Size = 12
    end
    object qryProdutosReferenciaFabricante4: TStringField
      FieldName = 'ReferenciaFabricante4'
      Size = 12
    end
    object qryProdutosCodigoInterno: TStringField
      FieldName = 'CodigoInterno'
      Size = 12
    end
    object qryProdutosDescricaoAbreviada: TStringField
      FieldName = 'DescricaoAbreviada'
      Size = 80
    end
    object qryProdutosDescricaoDetalhada: TStringField
      FieldName = 'DescricaoDetalhada'
      Size = 200
    end
    object qryProdutosCaracteristicas: TMemoField
      FieldName = 'Caracteristicas'
      BlobType = ftMemo
      Size = 200
    end
    object qryProdutosUnidadeMedida: TStringField
      FieldName = 'UnidadeMedida'
      Size = 2
    end
    object qryProdutosCodigoMarca: TStringField
      FieldName = 'CodigoMarca'
      Size = 3
    end
    object qryProdutosValorUnitarioAtual: TFloatField
      FieldName = 'ValorUnitarioAtual'
    end
    object qryProdutosValorUnitarioAnterior: TFloatField
      FieldName = 'ValorUnitarioAnterior'
    end
    object qryProdutosMargemLucro: TFloatField
      FieldName = 'MargemLucro'
    end
    object qryProdutosValorVenda: TFloatField
      FieldName = 'ValorVenda'
      DisplayFormat = '0.00'
    end
    object qryProdutosEstoqueMinimo: TFloatField
      FieldName = 'EstoqueMinimo'
    end
    object qryProdutosEstoqueReposicao: TFloatField
      FieldName = 'EstoqueReposicao'
    end
    object qryProdutosEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object qryProdutosEstoqueMaximo: TFloatField
      FieldName = 'EstoqueMaximo'
    end
    object qryProdutosDataUltimaCompra: TDateField
      FieldName = 'DataUltimaCompra'
    end
    object qryProdutosLocalizacao: TStringField
      FieldName = 'Localizacao'
      Size = 7
    end
    object qryProdutosImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object qryProdutosTaxaipi: TFloatField
      FieldName = 'Taxaipi'
    end
    object qryProdutosComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryProdutosPremio: TFloatField
      FieldName = 'Premio'
    end
    object qryProdutosQtdPorCaixa: TFloatField
      FieldName = 'QtdPorCaixa'
    end
    object qryProdutosPeso: TFloatField
      FieldName = 'Peso'
    end
    object qryProdutosIcms: TFloatField
      FieldName = 'Icms'
    end
    object qryProdutosReducaoIcms: TFloatField
      FieldName = 'ReducaoIcms'
    end
    object qryProdutosUltimoFornecedor: TStringField
      FieldName = 'UltimoFornecedor'
      Size = 30
    end
    object qryProdutosValorEmEstoque: TFloatField
      FieldName = 'ValorEmEstoque'
    end
    object qryProdutosBeneficio: TStringField
      FieldName = 'Beneficio'
      Size = 3
    end
    object qryProdutosEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 5
    end
    object qryProdutosSubGrupo: TStringField
      FieldName = 'SubGrupo'
      Size = 5
    end
    object qryProdutosPesoTotal: TFloatField
      FieldName = 'PesoTotal'
    end
    object qryProdutosValorCustoEstoque: TFloatField
      FieldName = 'ValorCustoEstoque'
    end
    object qryProdutosValorFuturo: TFloatField
      FieldName = 'ValorFuturo'
    end
    object qryProdutosEstoqueFuturo: TFloatField
      FieldName = 'EstoqueFuturo'
    end
    object qryProdutosValorCustoFuturo: TFloatField
      FieldName = 'ValorCustoFuturo'
    end
    object qryProdutosValorCustoMedio: TFloatField
      FieldName = 'ValorCustoMedio'
    end
    object qryProdutosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object qryProdutosNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object qryProdutosSituacaoTributaria: TStringField
      FieldName = 'SituacaoTributaria'
      Size = 3
    end
    object qryProdutosIVA: TFloatField
      FieldName = 'IVA'
    end
    object qryProdutosCFOP: TStringField
      FieldName = 'CFOP'
      Size = 4
    end
    object qryProdutosCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
  end
  object tblInutilizadas: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Inutilizadas.db'
    Left = 48
    Top = 352
    object tblInutilizadasInicio: TIntegerField
      FieldName = 'Inicio'
    end
    object tblInutilizadasFim: TIntegerField
      FieldName = 'Fim'
    end
    object tblInutilizadasJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 40
    end
    object tblInutilizadasData: TDateField
      FieldName = 'Data'
    end
  end
  object dsInutilizadas: TDataSource
    DataSet = tblInutilizadas
    Left = 48
    Top = 400
  end
  object dsCEST: TDataSource
    DataSet = tblCest
    Left = 587
    Top = 374
  end
  object tblCest: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'CEST.DB'
    Left = 539
    Top = 374
    object tblCestNCM: TIntegerField
      FieldName = 'NCM'
    end
    object tblCestCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object tblCestDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object tblCestStrNCM: TStringField
      FieldName = 'StrNCM'
      Size = 8
    end
  end
  object tblEmail: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'EmailNFe.db'
    Left = 112
    Top = 352
    object tblEmailUsuario: TStringField
      FieldName = 'Usuario'
      Size = 50
    end
    object tblEmailSenha: TStringField
      FieldName = 'Senha'
      Size = 50
    end
    object tblEmailServidorSMTP: TStringField
      FieldName = 'ServidorSMTP'
      Size = 50
    end
    object tblEmailPorta: TStringField
      FieldName = 'Porta'
    end
    object tblEmailConexaoSegura: TBooleanField
      FieldName = 'ConexaoSegura'
    end
    object tblEmailMensagem: TMemoField
      FieldName = 'Mensagem'
      BlobType = ftMemo
      Size = 100
    end
  end
  object dsEmail: TDataSource
    DataSet = tblEmail
    Left = 112
    Top = 400
  end
  object tblTransportadora: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Transportadora.DB'
    Left = 184
    Top = 352
    object tblTransportadoraCodigoTransportadora: TStringField
      FieldName = 'CodigoTransportadora'
      Size = 4
    end
    object tblTransportadoraRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 40
    end
    object tblTransportadoraCNPJ: TStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99'
      Size = 18
    end
    object tblTransportadoraNomeFantasia: TStringField
      FieldName = 'NomeFantasia'
    end
    object tblTransportadoraEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tblTransportadoraNumero: TFloatField
      FieldName = 'Numero'
    end
    object tblTransportadoraBairro: TStringField
      FieldName = 'Bairro'
      Size = 40
    end
    object tblTransportadoraCidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
    object tblTransportadoraEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblTransportadoraCEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000\-9999;1;_'
      Size = 9
    end
    object tblTransportadoraTelefone: TStringField
      FieldName = 'Telefone'
      Size = 16
    end
    object tblTransportadoraFax: TStringField
      FieldName = 'Fax'
      Size = 16
    end
    object tblTransportadoraRamalContato: TStringField
      FieldName = 'RamalContato'
      Size = 4
    end
    object tblTransportadoraHomePage: TStringField
      FieldName = 'HomePage'
      Size = 80
    end
    object tblTransportadoraEmail: TStringField
      FieldName = 'Email'
      Size = 80
    end
    object tblTransportadoraInscricao: TStringField
      FieldName = 'Inscricao'
      EditMask = '999.999.999.999;1;_'
    end
    object tblTransportadoraTelefone2: TStringField
      FieldName = 'Telefone2'
      Size = 16
    end
    object tblTransportadoraNextel: TStringField
      FieldName = 'Nextel'
      Size = 15
    end
    object tblTransportadoraComplemento: TStringField
      FieldName = 'Complemento'
    end
    object tblTransportadoraDataCad: TDateField
      FieldName = 'DataCad'
      EditMask = '!99/99/00;1;_'
    end
    object tblTransportadoraCidadesExtra: TStringField
      FieldName = 'CidadesExtra'
      Size = 50
    end
    object tblTransportadoraObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
      Size = 200
    end
    object tblTransportadoraContColeta: TStringField
      FieldName = 'ContColeta'
      Size = 25
    end
    object tblTransportadoraContFinanceiro: TStringField
      FieldName = 'ContFinanceiro'
      Size = 25
    end
  end
  object dsTransportadora: TDataSource
    DataSet = tblTransportadora
    Left = 179
    Top = 408
  end
  object dsCidades: TDataSource
    DataSet = tblCidades
    Left = 260
    Top = 409
  end
  object tblCidades: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'Cidades.db'
    Left = 264
    Top = 351
    object tblCidadesCidade: TStringField
      FieldName = 'Cidade'
      Size = 80
    end
    object tblCidadesEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblCidadesCodigo: TStringField
      FieldName = 'Codigo'
      Size = 9
    end
  end
  object tblAliquotas: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'AliquotasUF.DB'
    Left = 339
    Top = 351
    object tblAliquotasEstado: TStringField
      FieldName = 'Estado'
      Size = 2
    end
    object tblAliquotasAliqInterE: TFloatField
      FieldName = 'AliqInterE'
    end
    object tblAliquotasInterna: TFloatField
      FieldName = 'Interna'
    end
    object tblAliquotasFCP: TFloatField
      FieldName = 'FCP'
    end
  end
  object dsAliquotas: TDataSource
    DataSet = tblAliquotas
    Left = 339
    Top = 415
  end
  object tblFCP: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'FCPAliq.db'
    Left = 419
    Top = 351
    object tblFCPAuto: TIntegerField
      FieldName = 'Auto'
    end
    object tblFCPCodProduto: TStringField
      FieldName = 'CodProduto'
      Size = 15
    end
    object tblFCPDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object tblFCPAliquotaFCP: TFloatField
      FieldName = 'AliquotaFCP'
    end
    object tblFCPUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dsFCP: TDataSource
    DataSet = tblFCP
    Left = 419
    Top = 399
  end
  object dsqPedidos: TDataSource
    DataSet = qryPedidos
    Left = 984
    Top = 435
  end
  object qryPedidos: TQuery
    DatabaseName = 'SistemaGestaoEstoque'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM Pedidos.db;')
    Left = 920
    Top = 436
    object qryPedidosCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object qryPedidosNPedido: TStringField
      FieldName = 'NPedido'
      Size = 8
    end
    object qryPedidosCodigoVendedor: TStringField
      FieldName = 'CodigoVendedor'
      Size = 3
    end
    object qryPedidosVendedor: TStringField
      FieldName = 'Vendedor'
      Size = 40
    end
    object qryPedidosProduto: TStringField
      FieldName = 'Produto'
      Size = 12
    end
    object qryPedidosQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object qryPedidosPeso: TFloatField
      FieldName = 'Peso'
    end
    object qryPedidosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 80
    end
    object qryPedidosUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object qryPedidosTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qryPedidosPagamento: TStringField
      FieldName = 'Pagamento'
      Size = 3
    end
    object qryPedidosVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object qryPedidosCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object qryPedidosDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qryPedidosComissao: TFloatField
      FieldName = 'Comissao'
    end
    object qryPedidosMotorista: TStringField
      FieldName = 'Motorista'
      Size = 3
    end
    object qryPedidosStatus: TStringField
      FieldName = 'Status'
      Size = 1
    end
    object qryPedidosCST: TStringField
      FieldName = 'CST'
      Size = 3
    end
    object qryPedidosUnidade: TStringField
      FieldName = 'Unidade'
      Size = 2
    end
    object qryPedidosICMS: TFloatField
      FieldName = 'ICMS'
    end
    object qryPedidosDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object qryPedidosDataEmissaoOriginal: TDateField
      FieldName = 'DataEmissaoOriginal'
    end
    object qryPedidosCodigoFornecedor: TStringField
      FieldName = 'CodigoFornecedor'
      Size = 4
    end
    object qryPedidosCodigoReferencia: TStringField
      FieldName = 'CodigoReferencia'
      Size = 10
    end
    object qryPedidosAliqTrib: TFloatField
      FieldName = 'AliqTrib'
    end
    object qryPedidosVTributos: TFloatField
      FieldName = 'VTributos'
    end
    object qryPedidosNCM: TStringField
      FieldName = 'NCM'
      Size = 8
    end
    object qryPedidosTribFed: TFloatField
      FieldName = 'TribFed'
    end
    object qryPedidosTribEst: TFloatField
      FieldName = 'TribEst'
    end
    object qryPedidosTribMun: TFloatField
      FieldName = 'TribMun'
    end
    object qryPedidosValorIPI: TFloatField
      FieldName = 'ValorIPI'
    end
    object qryPedidosIPI: TFloatField
      FieldName = 'IPI'
    end
    object qryPedidosBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object qryPedidosValorICMS: TFloatField
      FieldName = 'ValorICMS'
    end
    object qryPedidosBaseST: TFloatField
      FieldName = 'BaseST'
    end
    object qryPedidosIcmsST: TFloatField
      FieldName = 'IcmsST'
    end
    object qryPedidosPercReducao: TFloatField
      FieldName = 'PercReducao'
    end
    object qryPedidosCEST: TStringField
      FieldName = 'CEST'
      Size = 7
    end
    object qryPedidosNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 50
    end
  end
  object qryCupomFiscal: TQuery
    AutoRefresh = True
    DatabaseName = 'SistemaGestaoEstoque'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CupomFiscal')
    Left = 1068
    Top = 432
    object qryCupomFiscalNrNF: TIntegerField
      FieldName = 'NrNF'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".NrNF'
    end
    object qryCupomFiscalNPedido: TStringField
      FieldName = 'NPedido'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".NPedido'
      Size = 8
    end
    object qryCupomFiscalCliente: TIntegerField
      FieldName = 'Cliente'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Cliente'
    end
    object qryCupomFiscalChave: TStringField
      FieldName = 'Chave'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Chave'
      Size = 44
    end
    object qryCupomFiscalCaminhoXML: TStringField
      FieldName = 'CaminhoXML'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CaminhoXML'
      Size = 100
    end
    object qryCupomFiscalCancelado: TStringField
      FieldName = 'Cancelado'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Cancelado'
      Size = 1
    end
    object qryCupomFiscalData: TDateField
      FieldName = 'Data'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Data'
    end
    object qryCupomFiscalHora: TTimeField
      FieldName = 'Hora'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Hora'
    end
    object qryCupomFiscalValor: TFloatField
      FieldName = 'Valor'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Valor'
    end
    object qryCupomFiscalPagamento: TStringField
      FieldName = 'Pagamento'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Pagamento'
      Size = 2
    end
    object qryCupomFiscalCPFCnpj: TStringField
      FieldName = 'CPFCnpj'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CPFCnpj'
      Size = 14
    end
    object qryCupomFiscalDH: TCurrencyField
      FieldName = 'DH'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".DH'
    end
    object qryCupomFiscalCC: TCurrencyField
      FieldName = 'CC'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CC'
    end
    object qryCupomFiscalCD: TCurrencyField
      FieldName = 'CD'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CD'
    end
    object qryCupomFiscalCH: TCurrencyField
      FieldName = 'CH'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CH'
    end
    object qryCupomFiscalCL: TCurrencyField
      FieldName = 'CL'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CL'
    end
    object qryCupomFiscalVP: TCurrencyField
      FieldName = 'VP'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".VP'
    end
    object qryCupomFiscalOT: TCurrencyField
      FieldName = 'OT'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".OT'
    end
    object qryCupomFiscalVA: TCurrencyField
      FieldName = 'VA'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".VA'
    end
    object qryCupomFiscalVR: TCurrencyField
      FieldName = 'VR'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".VR'
    end
    object qryCupomFiscalVC: TCurrencyField
      FieldName = 'VC'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".VC'
    end
    object qryCupomFiscalDT: TCurrencyField
      FieldName = 'DT'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".DT'
    end
    object qryCupomFiscalPX: TCurrencyField
      FieldName = 'PX'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".PX'
    end
    object qryCupomFiscalCaminho2: TStringField
      FieldName = 'Caminho2'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Caminho2'
      Size = 100
    end
    object qryCupomFiscalStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Status'
    end
    object qryCupomFiscalCodContabil: TIntegerField
      FieldName = 'CodContabil'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".CodContabil'
    end
    object qryCupomFiscalProtocolo: TStringField
      FieldName = 'Protocolo'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Protocolo'
      Size = 30
    end
    object qryCupomFiscalJustificativa: TStringField
      FieldName = 'Justificativa'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Justificativa'
      Size = 60
    end
    object qryCupomFiscalDataCanc: TDateField
      FieldName = 'DataCanc'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".DataCanc'
    end
    object qryCupomFiscalMensagem: TStringField
      FieldName = 'Mensagem'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Mensagem'
      Size = 100
    end
    object qryCupomFiscalEspecie: TStringField
      FieldName = 'Especie'
      Origin = 'SISTEMAGESTAOESTOQUE."CupomFiscal.DB".Especie'
      Size = 3
    end
  end
  object dsqCupomFiscal: TDataSource
    DataSet = qryCupomFiscal
    Left = 1148
    Top = 432
  end
  object tblANotaFiscalNew: TTable
    DatabaseName = 'SistemaGestaoEstoque'
    TableName = 'ANotaFiscalNew.DB'
    Left = 568
    Top = 440
    object tblANotaFiscalNewNrNF: TIntegerField
      FieldName = 'NrNF'
    end
    object tblANotaFiscalNewPedido: TStringField
      FieldName = 'Pedido'
      Size = 8
    end
    object tblANotaFiscalNewCFOP: TStringField
      FieldName = 'CFOP'
      Size = 70
    end
    object tblANotaFiscalNewDataEmissao: TDateField
      FieldName = 'DataEmissao'
    end
    object tblANotaFiscalNewDMEmissao: TStringField
      FieldName = 'DMEmissao'
      Size = 4
    end
    object tblANotaFiscalNewCodigoCliente: TIntegerField
      FieldName = 'CodigoCliente'
    end
    object tblANotaFiscalNewBaseCalculo: TFloatField
      FieldName = 'BaseCalculo'
    end
    object tblANotaFiscalNewValorICMS: TFloatField
      FieldName = 'ValorICMS'
    end
    object tblANotaFiscalNewVcont7: TFloatField
      FieldName = 'Vcont7'
    end
    object tblANotaFiscalNewVcont12: TFloatField
      FieldName = 'Vcont12'
    end
    object tblANotaFiscalNewVcont18: TFloatField
      FieldName = 'Vcont18'
    end
    object tblANotaFiscalNewVcont25: TFloatField
      FieldName = 'Vcont25'
    end
    object tblANotaFiscalNewBase7: TFloatField
      FieldName = 'Base7'
    end
    object tblANotaFiscalNewBase12: TFloatField
      FieldName = 'Base12'
    end
    object tblANotaFiscalNewBase18: TFloatField
      FieldName = 'Base18'
    end
    object tblANotaFiscalNewBase25: TFloatField
      FieldName = 'Base25'
    end
    object tblANotaFiscalNewIcms7: TFloatField
      FieldName = 'Icms7'
    end
    object tblANotaFiscalNewIcms12: TFloatField
      FieldName = 'Icms12'
    end
    object tblANotaFiscalNewIcms18: TFloatField
      FieldName = 'Icms18'
    end
    object tblANotaFiscalNewIcms25: TFloatField
      FieldName = 'Icms25'
    end
    object tblANotaFiscalNewIcmsR12: TFloatField
      FieldName = 'IcmsR12'
    end
    object tblANotaFiscalNewIcmsR18: TFloatField
      FieldName = 'IcmsR18'
    end
    object tblANotaFiscalNewBaseR12: TFloatField
      FieldName = 'BaseR12'
    end
    object tblANotaFiscalNewBaseR18: TFloatField
      FieldName = 'BaseR18'
    end
    object tblANotaFiscalNewValorTNF: TFloatField
      FieldName = 'ValorTNF'
    end
    object tblANotaFiscalNewEspecie: TStringField
      FieldName = 'Especie'
      Size = 3
    end
    object tblANotaFiscalNewSerie: TStringField
      FieldName = 'Serie'
      Size = 3
    end
    object tblANotaFiscalNewBaseIcms: TFloatField
      FieldName = 'BaseIcms'
    end
    object tblANotaFiscalNewAliqIcms: TFloatField
      FieldName = 'AliqIcms'
    end
    object tblANotaFiscalNewImpostoIcms: TFloatField
      FieldName = 'ImpostoIcms'
    end
    object tblANotaFiscalNewIsentoIcms: TFloatField
      FieldName = 'IsentoIcms'
    end
    object tblANotaFiscalNewOutrasIcms: TFloatField
      FieldName = 'OutrasIcms'
    end
    object tblANotaFiscalNewIcmsNaFonte: TFloatField
      FieldName = 'IcmsNaFonte'
    end
    object tblANotaFiscalNewDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object tblANotaFiscalNewValorVista: TFloatField
      FieldName = 'ValorVista'
    end
    object tblANotaFiscalNewValorPrazo: TFloatField
      FieldName = 'ValorPrazo'
    end
    object tblANotaFiscalNewContribuinte: TFloatField
      FieldName = 'Contribuinte'
    end
    object tblANotaFiscalNewTipoNota: TFloatField
      FieldName = 'TipoNota'
    end
    object tblANotaFiscalNewObsLivre: TStringField
      FieldName = 'ObsLivre'
      Size = 14
    end
    object tblANotaFiscalNewCgc: TStringField
      FieldName = 'Cgc'
      Size = 14
    end
    object tblANotaFiscalNewInscrEstadual: TStringField
      FieldName = 'InscrEstadual'
      Size = 16
    end
    object tblANotaFiscalNewRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 35
    end
    object tblANotaFiscalNewContaCtblFornecedor: TStringField
      FieldName = 'ContaCtblFornecedor'
      Size = 18
    end
    object tblANotaFiscalNewUf: TStringField
      FieldName = 'Uf'
      Size = 2
    end
    object tblANotaFiscalNewNrMunicipio: TFloatField
      FieldName = 'NrMunicipio'
    end
    object tblANotaFiscalNewIsentoPis: TFloatField
      FieldName = 'IsentoPis'
    end
    object tblANotaFiscalNewCodContabil: TFloatField
      FieldName = 'CodContabil'
    end
    object tblANotaFiscalNewIsento7: TFloatField
      FieldName = 'Isento7'
    end
    object tblANotaFiscalNewIsento12: TFloatField
      FieldName = 'Isento12'
    end
    object tblANotaFiscalNewIsento18: TFloatField
      FieldName = 'Isento18'
    end
    object tblANotaFiscalNewIsento25: TFloatField
      FieldName = 'Isento25'
    end
    object tblANotaFiscalNewIsentoR18: TFloatField
      FieldName = 'IsentoR18'
    end
    object tblANotaFiscalNewOutras7: TFloatField
      FieldName = 'Outras7'
    end
    object tblANotaFiscalNewOutras12: TFloatField
      FieldName = 'Outras12'
    end
    object tblANotaFiscalNewOutras18: TFloatField
      FieldName = 'Outras18'
    end
    object tblANotaFiscalNewOutras25: TFloatField
      FieldName = 'Outras25'
    end
    object tblANotaFiscalNewOutrasR18: TFloatField
      FieldName = 'OutrasR18'
    end
    object tblANotaFiscalNewVago: TStringField
      FieldName = 'Vago'
      Size = 50
    end
    object tblANotaFiscalNewV: TStringField
      FieldName = 'V'
      Size = 1
    end
    object tblANotaFiscalNewBaseST: TFloatField
      FieldName = 'BaseST'
    end
    object tblANotaFiscalNewIcmsST: TFloatField
      FieldName = 'IcmsST'
    end
    object tblANotaFiscalNewIPI: TFloatField
      FieldName = 'IPI'
    end
    object tblANotaFiscalNewPIS: TFloatField
      FieldName = 'PIS'
    end
    object tblANotaFiscalNewCOFINS: TFloatField
      FieldName = 'COFINS'
    end
    object tblANotaFiscalNewChaveAcesso: TStringField
      FieldName = 'ChaveAcesso'
      Size = 50
    end
    object tblANotaFiscalNewProtocolo: TStringField
      FieldName = 'Protocolo'
      Size = 30
    end
    object tblANotaFiscalNewCaminhoXML: TStringField
      FieldName = 'CaminhoXML'
      Size = 90
    end
    object tblANotaFiscalNewCaminho2: TStringField
      FieldName = 'Caminho2'
      Size = 90
    end
    object tblANotaFiscalNewDataCanc: TDateField
      FieldName = 'DataCanc'
    end
    object tblANotaFiscalNewCancelada: TStringField
      FieldName = 'Cancelada'
      Size = 1
    end
    object tblANotaFiscalNewJustificativa: TStringField
      FieldName = 'Justificativa'
      Size = 40
    end
    object tblANotaFiscalNewDespesasAC: TFloatField
      FieldName = 'DespesasAC'
    end
    object tblANotaFiscalNewFrete: TFloatField
      FieldName = 'Frete'
    end
    object tblANotaFiscalNewStatus: TIntegerField
      FieldName = 'Status'
    end
    object tblANotaFiscalNewMensagem: TStringField
      FieldName = 'Mensagem'
      Size = 100
    end
    object tblANotaFiscalNewLinhaConting: TStringField
      FieldName = 'LinhaConting'
      Size = 150
    end
    object tblANotaFiscalNewVTributos: TFloatField
      FieldName = 'VTributos'
    end
    object tblANotaFiscalNewRamo6: TFloatField
      FieldName = 'Ramo6'
    end
    object tblANotaFiscalNewRamo7: TFloatField
      FieldName = 'Ramo7'
    end
    object tblANotaFiscalNewRevIcmsST: TFloatField
      FieldName = 'RevIcmsST'
    end
    object tblANotaFiscalNewRevBaseST: TFloatField
      FieldName = 'RevBaseST'
    end
    object tblANotaFiscalNewPartilhaOR: TFloatField
      FieldName = 'PartilhaOR'
    end
    object tblANotaFiscalNewPartilhaDS: TFloatField
      FieldName = 'PartilhaDS'
    end
    object tblANotaFiscalNewFCP: TFloatField
      FieldName = 'FCP'
    end
    object tblANotaFiscalNewTribFed: TFloatField
      FieldName = 'TribFed'
    end
    object tblANotaFiscalNewTribEst: TFloatField
      FieldName = 'TribEst'
    end
    object tblANotaFiscalNewTribMun: TFloatField
      FieldName = 'TribMun'
    end
  end
  object dsANotaFiscalNew: TDataSource
    DataSet = tblANotaFiscalNew
    Left = 648
    Top = 436
  end
end
