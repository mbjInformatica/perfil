object formEntradaCompra: TformEntradaCompra
  Left = 81
  Top = 120
  BorderStyle = bsDialog
  Caption = 'Entrada de produtos em estoque - Compras'
  ClientHeight = 348
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNotaFiscal: TLabel
    Left = 8
    Top = 16
    Width = 96
    Height = 13
    Caption = 'N'#250'mero Nota Fiscal:'
  end
  object lblValorICMS: TLabel
    Left = 367
    Top = 56
    Width = 71
    Height = 13
    Caption = 'Valor do ICMS:'
  end
  object lblFornecedor: TLabel
    Left = 192
    Top = 16
    Width = 57
    Height = 13
    Caption = 'Fornecedor:'
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 82
    Height = 13
    Caption = 'Data de emiss'#227'o:'
  end
  object lblValorTotal: TLabel
    Left = 200
    Top = 56
    Width = 54
    Height = 13
    Caption = 'Valor Total:'
  end
  object btnExcluiProduto: TSpeedButton
    Left = 8
    Top = 248
    Width = 73
    Height = 38
    Hint = '|Exclui o produto selecionado.'
    Caption = 'Excluir Produto'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
      333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
      03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
      33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
      0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
      3333333337FFF7F3333333333000003333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnExcluiProdutoClick
  end
  object btnCancelaNota: TSpeedButton
    Left = 80
    Top = 248
    Width = 73
    Height = 38
    Hint = '|Cancela a opera'#231#227'o de entrada da Nota Fiscal.'
    Caption = 'Cancelar Nota'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnCancelaNotaClick
  end
  object btnGravaNota: TSpeedButton
    Left = 152
    Top = 248
    Width = 73
    Height = 38
    Hint = '|Grava opera'#231#227'o de entrada da Nota Fiscal e atualiza estoque.'
    Caption = 'Gravar Nota'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
      00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
      00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
      00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
      00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
      0003737FFFFFFFFF7F7330099999999900333777777777777733}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnGravaNotaClick
  end
  object btnImprimeCliente: TSpeedButton
    Left = 223
    Top = 249
    Width = 67
    Height = 38
    Hint = '|Imprime o relat'#243'rio da venda.'
    Caption = 'Imprimir'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnImprimeClienteClick
  end
  object fldNotaFiscal: TDBEdit
    Left = 112
    Top = 16
    Width = 73
    Height = 21
    DataField = 'NumeroNotaFiscal'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 0
  end
  object fldValorICMS: TDBEdit
    Left = 440
    Top = 55
    Width = 78
    Height = 21
    DataField = 'ValorICMS'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 1
  end
  object fldDataEmissao: TDBEdit
    Left = 96
    Top = 56
    Width = 89
    Height = 21
    DataField = 'DataEmissao'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 3
  end
  object fldFornecedor: TDBLookupComboBox
    Left = 256
    Top = 16
    Width = 225
    Height = 21
    DataField = 'CodigoFornecedor'
    DataSource = dmBaseDados.dsNotaFiscal
    KeyField = 'CodigoFornecedor'
    ListField = 'NomeFantasia'
    ListSource = dmBaseDados.dsFornecedores
    TabOrder = 2
    OnExit = fldFornecedorExit
  end
  object fldValorTotal: TDBEdit
    Left = 264
    Top = 56
    Width = 97
    Height = 21
    DataField = 'ValorTotal'
    DataSource = dmBaseDados.dsNotaFiscal
    TabOrder = 4
    OnExit = fldValorTotalExit
  end
  object grdProdutos: TDBGrid
    Left = 8
    Top = 88
    Width = 513
    Height = 153
    DataSource = dmBaseDados.dsEntrada
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnColEnter = grdProdutosColEnter
    OnColExit = grdProdutosColExit
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AliquotaICMS'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AliquotaIPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        ReadOnly = True
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorComIPI'
        Title.Caption = 'Valor Com IPI'
        Visible = True
      end>
  end
  object btnLocalizar: TButton
    Left = 344
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 6
    OnClick = btnLocalizarClick
  end
end
