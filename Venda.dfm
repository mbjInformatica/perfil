object formVendasBalcao: TformVendasBalcao
  Left = 268
  Top = 9
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Vendas no Balc'#227'o'
  ClientHeight = 622
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 0
    Width = 895
    Height = 603
    Align = alClient
    Style = grPyramid
    StartColor = 16771026
    EndColor = 14651200
    Steps = 57
  end
  object lblRequisicao: TLabel
    Left = 8
    Top = 7
    Width = 131
    Height = 15
    Caption = 'N'#250'mero da Requisi'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldRequisicao: TDBText
    Left = 144
    Top = 7
    Width = 105
    Height = 17
    DataField = 'NumeroRequisicao'
    DataSource = dmBaseDados.dsRequisicoes
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblDataEmissao: TLabel
    Left = 600
    Top = 7
    Width = 81
    Height = 15
    Caption = 'Data Emiss'#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldDataEmissao: TDBText
    Left = 685
    Top = 7
    Width = 100
    Height = 17
    DataField = 'DataEmissao'
    DataSource = dmBaseDados.dsRequisicoes
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCodigoProduto: TLabel
    Left = 400
    Top = 80
    Width = 106
    Height = 15
    Caption = 'C'#243'digo do produto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblQuantidade: TLabel
    Left = 704
    Top = 80
    Width = 30
    Height = 15
    Caption = 'Qtde:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblValorVenda: TLabel
    Left = 471
    Top = 560
    Width = 222
    Height = 24
    Caption = 'Valor Total da Venda:  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnLocalizar: TSpeedButton
    Left = 416
    Top = 28
    Width = 33
    Height = 33
    Hint = '|Localiza um registro na tabela de clientes.'
    Caption = 'Localizar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Visible = False
    OnClick = btnLocalizarClick
  end
  object Label1: TLabel
    Left = 8
    Top = 36
    Width = 42
    Height = 15
    Caption = 'Cliente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 464
    Top = 36
    Width = 57
    Height = 15
    Caption = 'Vendedor:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCondPgt: TLabel
    Left = 176
    Top = 80
    Width = 114
    Height = 15
    Caption = 'Data de Pagamento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblValorTotalVenda: TLabel
    Left = 794
    Top = 557
    Width = 8
    Height = 32
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    Transparent = True
  end
  object lblTPagto: TLabel
    Left = 20
    Top = 80
    Width = 98
    Height = 15
    Caption = 'Tipo Pagamento :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label3: TLabel
    Left = 7
    Top = 104
    Width = 71
    Height = 15
    Caption = 'Fornecedor :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label9: TLabel
    Left = 510
    Top = 523
    Width = 142
    Height = 16
    Caption = 'Forma de Pagamento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object SpeedButton1: TSpeedButton
    Left = 532
    Top = -5
    Width = 23
    Height = 22
    Caption = #195
    Visible = False
  end
  object LabelPorta: TLabel
    Left = 510
    Top = 4
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 440
    Top = 104
    Width = 66
    Height = 14
    Caption = 'Localiza'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldLocalizacao: TDBText
    Left = 515
    Top = 102
    Width = 65
    Height = 17
    DataField = 'Localizacao'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 32
    Top = 461
    Width = 64
    Height = 15
    Caption = 'Impress'#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldCodigoProduto: TDBEdit
    Left = 509
    Top = 78
    Width = 129
    Height = 22
    DataField = 'CodigoProduto'
    DataSource = dmBaseDados.dsSaida
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnExit = fldCodigoProdutoExit
    OnKeyPress = fldCodigoProdutoKeyPress
  end
  object fldQuantidade: TDBEdit
    Left = 739
    Top = 78
    Width = 44
    Height = 22
    DataField = 'Quantidade'
    DataSource = dmBaseDados.dsSaida
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnExit = fldQuantidadeExit
    OnKeyPress = fldQuantidadeKeyPress
  end
  object grdProdutos: TDBGrid
    Left = 3
    Top = 128
    Width = 888
    Height = 329
    DataSource = dmBaseDados.dsSaida
    FixedColor = 16771026
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnColExit = grdProdutosColExit
    OnKeyPress = grdProdutosKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo '
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RefFabricante'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'digo Ref.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoProduto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 363
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Un.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Qtde'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'Valor Un.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QtdeCx'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'ICMS'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 38
        Visible = True
      end>
  end
  object dblbCliente: TDBLookupListBox
    Left = 56
    Top = 36
    Width = 353
    Height = 20
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    KeyField = 'NomeCliente'
    ListField = 'NomeCliente'
    ListSource = dmBaseDados.dsClientes
    ParentFont = False
    TabOrder = 0
    OnKeyPress = dblbClienteKeyPress
  end
  object cmbTPagamento: TComboBox
    Left = 76
    Top = 78
    Width = 45
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Visible = False
    OnKeyPress = cmbTPagamentoKeyPress
    Items.Strings = (
      'DH - Dinheiro'
      'CT - Cart'#227'o'
      'CV - Cheque a Vista'
      'CP - Cheque a Prazo'
      'CB - Cobran'#231'a'
      'BO - Bonifica'#231#227'o'
      'TR - Troca'
      'DV - Devolu'#231#227'o')
  end
  object dbeDataVencimento: TDBEdit
    Left = 296
    Top = 78
    Width = 89
    Height = 22
    DataField = 'DataVencimento'
    DataSource = dmBaseDados.dsSaida
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnExit = dbeDataVencimentoExit
    OnKeyPress = dbeDataVencimentoKeyPress
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 71
    Top = 104
    Width = 354
    Height = 17
    KeyField = 'NomeFantasia'
    ListField = 'NomeFantasia'
    ListSource = dmBaseDados.dsFornecedores
    TabOrder = 7
    Visible = False
  end
  object ckbDesconto: TCheckBox
    Left = 593
    Top = 107
    Width = 113
    Height = 17
    Caption = 'Com &Desconto'
    Color = 16771026
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 8
  end
  object ckbOrc: TCheckBox
    Left = 306
    Top = 3
    Width = 153
    Height = 20
    Caption = 'OR'#199'AMENTO'
    Color = 16771026
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 9
  end
  object ProgressBar1: TProgressBar
    Left = 528
    Top = 1
    Width = 25
    Height = 17
    Align = alCustom
    Step = 1
    TabOrder = 10
    Visible = False
  end
  object Barra: TStatusBar
    Left = 0
    Top = 603
    Width = 895
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 210
      end
      item
        Width = 50
      end>
  end
  object Memo1: TMemo
    Left = 520
    Top = -9
    Width = 17
    Height = 25
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = False
  end
  object forma: TComboBox
    Left = 661
    Top = 520
    Width = 177
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 13
    Visible = False
  end
  object EdProduto: TMaskEdit
    Left = 532
    Top = -5
    Width = 23
    Height = 21
    TabOrder = 14
    Text = '7890000000001'
    Visible = False
  end
  object Button10: TButton
    Left = 538
    Top = -5
    Width = 17
    Height = 25
    Caption = 'Repete Cupom'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    Visible = False
  end
  object Button3: TButton
    Left = 530
    Top = -5
    Width = 25
    Height = 25
    Caption = 'Emite'
    TabOrder = 16
    Visible = False
  end
  object EdDescricao2: TMemo
    Left = 536
    Top = -5
    Width = 19
    Height = 19
    Lines.Strings = (
      'N'
      'o'
      'm'
      'e '
      'do '
      'Pr'
      'od'
      'u'
      'to')
    MaxLength = 219
    TabOrder = 17
    Visible = False
  end
  object EdQtde: TMaskEdit
    Left = 544
    Top = -5
    Width = 19
    Height = 21
    TabOrder = 18
    Text = '1,000'
    Visible = False
  end
  object EdPreco2: TMaskEdit
    Left = 537
    Top = -5
    Width = 26
    Height = 21
    TabOrder = 19
    Text = '1,00'
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 521
    Top = 3
    Width = 26
    Height = 21
    TabOrder = 20
    Visible = False
  end
  object EdTaxa2: TComboBox
    Left = 535
    Top = 3
    Width = 28
    Height = 21
    ItemHeight = 13
    TabOrder = 21
    Visible = False
  end
  object EdRepete: TMaskEdit
    Left = 529
    Top = -5
    Width = 26
    Height = 21
    TabOrder = 22
    Text = '100'
    Visible = False
  end
  object Tempo: TMaskEdit
    Left = 528
    Top = -1
    Width = 36
    Height = 21
    TabStop = False
    EditMask = '99;0;_'
    MaxLength = 2
    TabOrder = 23
    Text = '10'
    Visible = False
  end
  object rdbVia1: TTISRadioButton
    Left = 104
    Top = 459
    Width = 54
    Height = 21
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '1 Via'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 24
    GroupIndex = 0
  end
  object rdbVia2: TTISRadioButton
    Left = 169
    Top = 459
    Width = 62
    Height = 21
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '2 Vias'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 25
    GroupIndex = 0
  end
  object rdbVia3: TTISRadioButton
    Left = 241
    Top = 459
    Width = 62
    Height = 21
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '3 Vias'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 26
    GroupIndex = 0
  end
  object btnNovo: TTISButton
    Left = 13
    Top = 487
    Width = 78
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   &Novo'
    AutoSize = False
    ParentFont = False
    TabOrder = 5
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      12040000424D1204000000000000D20100002800000018000000180000000100
      08000000000040020000120B0000120B0000670000006700000000000000FFFF
      FF00FF00FF00FEFDFD00AB4E2100AD5F2000FEF9F500CC731A00FEF6EE00FEF7
      F000FEF8F200FEF9F400FEFAF600FEFBF800FEFCFA00FEFDFC00FED7AB00FEDA
      B300FEDDB800FEDDB900FEDFBC00FEE0BF00FEE2C300FEE2C400FEE3C600FEE4
      C800FEE5CA00FEE6CB00FEE6CC00FEE7CD00FEECD900FEEDDA00FEEFDF00FEF2
      E500FEF3E700FEF4E900EE973300FEE0BD00FEE0BE00FEE2C100FEE2C200FEE3
      C400FEE8CF00FEE9D100FEEAD300FEEBD500FEECD700FEEFDE00FEF0DF00FEF0
      E000FEF1E200FEF3E600FEF4E800FEF5EA00FEF7EF00FEF9F300FEEFDC00FEF2
      E300FEF6EC00FEF7EE00FEF8F000FEFBF700FEF7ED00FEFAF400FEFCF900FEFD
      FB00FEFEFD0008750D0010A61D0012A9200012A9210012A8210016AC260019B0
      2C001DB432001EB432001EB4330022B93A0026BE420027BE42002CC44A002CC3
      4A0031C9520031C8520036CE5A0037CE5A003BD362003FD869003FD86A0040D8
      690040D86A0044DC700047E1760047E0760048E076004AE37B004BE47B004BE3
      7B004DE67F0000CCFF00FEFEFE00E4E4E400FFFFFF0002020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202020202020202020202020202020202020202020202
      0202020202020202020202024343434343020202020204040404040404040404
      0404040443444444430404040202043C3A2232382E2B1C182714121143444444
      431010040202040C0A3E23392F1E2C1D1916261343474444431010040202040E
      3D0B3B3521301F2D2A1A17154349484543101004020204040404040404040443
      43434343434D4C49434343434343046363636363636363435B57565453514F4D
      4C4948464443046363636363636363435F5C5B59565552504E4D4B4948430463
      63636363636363436262605E5B58565452514F4D4A4304040404040404040443
      43434343435D5B5A434343434343046464646464646403400C0A08344362615D
      43282504020204646464646464646464413D373643626262431A290402020464
      6464646464646464640F0D0643626262432B1B04020204040404040404040404
      0404040443626262430404040202046464646464646464646464644243434343
      43201E040202046464646464646464646464646464410D3F0933310402020465
      6565656565656565656565656565656565656504020204050505050505050505
      0505050505050505050505040202072424242424242424242424242424242424
      2424240702020207070707070707070707070707070707070707070202020202
      02020202020202020202020202020202020202020202}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnNovoClick
  end
  object btnExcluir: TTISButton
    Left = 109
    Top = 487
    Width = 75
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   &Excluir'
    AutoSize = False
    ParentFont = False
    TabOrder = 27
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
      B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
      0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
      00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
      05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
      0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
      F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
      05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
      B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
      0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
      B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
      0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
      06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
      06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
      F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
      0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnExcluirClick
  end
  object btnReimpressao: TTISButton
    Left = 54
    Top = 548
    Width = 147
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   Reim&p. Or'#231'amento'
    AutoSize = False
    ParentFont = False
    TabOrder = 28
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      5E060000424D5E060000000000001E0400002800000018000000180000000100
      08000000000040020000120B0000120B0000FA000000FA00000000000000FFFF
      FF00B3B2B500ACABAE00FAF9FC00F4F3F600C9C8CB00A7A5A900DCDADE00A7A6
      A80095949600EDECEE00D3D2D400C3C2C400C1C0C200AEADAF00ABA8AD00A9A6
      AB0085838600A8A6A9009F9DA000A8A5A900A5A2A600A29FA300928F9300B4B1
      B500EBE8EC00D0CDD1009C989D00DEDADF00D5D1D600CDC8CE00FF00FF001615
      1600928C92007B777B00CEC8CE00ACA7AC00DFD9DF00DCD6DC00D5D0D500D3CE
      D300D2CDD200D0CBD000CFCACF00CCC7CC00CBC6CB009F9B9F00D7D2D700E7E3
      E700DBD7DB00ADAAAD0068666800E2DFE200D1CED100F3F1F300F0EEF000BEBC
      BE00B7B5B700B0AEB000F1F0F100DFDEDF007D777C00D4CED300E8E3E700DAD5
      D900D9D4D800EDE9EC00DEDADD00BAB3B800A19B9F00ABA8AA00DFDCDE00ABA4
      A800A5A3A4009F999B00ADA7A9007976770098959600EAE7E800D1CECF00897C
      7F0093898B00B2ADAE00B1ACAD00ABA6A700BBB6B700AFA9AA00C3BDBE00B4AD
      AE00C2B9BA008F8C8C008683830073717100A7A5A500A2A0A0009F9D9D009391
      91008684840051505000E0DEDE00D9D7D700CDCBCB00C2C0C000BFBDBD00BCBA
      BA00B6B4B400B5B3B30056555500FFFEFE00FEFDFD00FCFBFB00F3F2F200EBEA
      EA00E6E5E500E3E2E200DEDDDD00DAD9D900D4D3D300CAC9C900C7C6C600A8A7
      A700A4A3A3009C9B9B00999898009695950091909000CC9A9900CE9D9B00CAA0
      970095817B00A2897E00F6D4BA00BA9E8700D5AE8C00FCE5D000FCEADA00EEC3
      9900C9A78600FFDDBA00FFF0E100FFDDB800FFE1C200FFE2C300FFE6CC00FFE7
      CE00FFEBD600FFECD800FFEDDA00FCF3E900FFD39F00FFDBB100FFDDB300FEDD
      B700FFE8CC00FFD9A600FFDBAE00FFE7C800FFEAC400FFFFF500737473007476
      750080838200A1A4A3005355550050525200898C8C0057595900666868006567
      6700ABADAD0066676700E8E9E900BDBEBE008B8C8C008A8B8B00868787008384
      84006F7273007F828300585A5B005557580067696A0065676800636566006062
      63007B7D7E00707273006F7172006E7071006D6F70006C6E6F006B6D6E00ABAD
      AE005F6061005E5F60007273740066676800919293008D8E8F006A6B6D009192
      9400B7B8BA00F1F2F40070707300F2F2F500BDBDC000F8F8FA00F1F1F300EAEA
      EC00E9E9EB00BBBBBD00B8B8BA00B4B4B600FCFCFD00DADADB009E9E9F009999
      9A0085858600FBFBFB00E6E6E600E1E1E100DCDCDC00D8D8D800D6D6D600D0D0
      D000CFCFCF00CDCDCD00CACACA009D9D9D009B9B9B0099999900979797009393
      93008F8F8F008C8C8C008383830081818100808080007D7D7D00797979007373
      73006868680062626200616161004F4F4F001818180014141400131313001212
      1200202020202020202020202020626220206262202020202020202020202020
      202020202062696B626262716262622020202020202020B8B8B9B42062736B6B
      6B63F5B0E3AC7862626220202020B8CC18C2A06274E07A7A7A6C21F9F6F9E9E4
      6220202020B812C40AA762E0E07A646566676A604DF9F7F8625B2020B8173AC8
      1CA462E07A706D6F4FDC727566685F5D615B20B8162715C017A7627A016EDB3D
      4C595850DDDD76785E5CB816272E15BF09C33E62623C5A5246475554575377DE
      E162B8262E2D13BE0FB8EA2334628185838251224A56E0E26220B8282D2D13BE
      02A87CAFEFF47F9E9889868A7F4E62622020B8421F2D15BD3AC57BEAEDF37F9D
      8B979B967F2020202020B8322B2407BCD4B77BEBF08094918F8D9C7F20202020
      2020B81D2A2B11BCD3A97CB1F27F8C93908E997F202020202020B8351E2910B2
      CEC5E7EE7F9F9F8C929A847F202020202020B840413F03BB0EB7E6EC7F7F7F95
      88877F20202020202020B843443133BB0EB6797EF05DF17F7F7F202020202020
      2020B837380C19BBCAB5D9E5D87DE8EDA5202020202020202020B8370D3B02BE
      3CA6A1ABC4DA4AD8C2202020202020202020B83CD948D7BAAFC6A3ADD5C7C4C8
      B8202020202020202020B8D6DF6DD1063314C9AEA2B3C1AAB820202020202020
      2020B801D6CDCB0B353639252F494BB820202020202020202020B80101CF04D0
      D2081B2C45B8B8202020202020202020202020B8B8010101051A30B8B8202020
      20202020202020202020202020B6B8B8B8B8B820202020202020202020202020
      2020}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnReimpressaoClick
  end
  object btnFiscal: TTISButton
    Left = 237
    Top = 548
    Width = 172
    Height = 52
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   Imprimir SA&T Fiscal'
    AutoSize = False
    ParentFont = False
    TabOrder = 29
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      2E170000424D2E170000000000003600000028000000410000001E0000000100
      180000000000F8160000130B0000130B00000000000000000000FDFDFDFFFFFF
      FFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFBFBFBFCFC
      FCFFFFFFFFFFFFFFFFFFFFFEFFFCFEFFFCFFFDFFFFFEFFFEFFFBFAFFFBFEFFFD
      FFFFFFFFFBFFFDFFFFFBFFFFFFFEFAFFF9FDFFF9FDFCF8FFFDFFFDFEFCFFFFFE
      FEFFFDFFFFFBFFFFFCFFFEF9FFFDF8FFFFFBFFFFFBFAFBFFFBFEFFFFFFFBFFFD
      FAFFFEFFF8FAFAFFFFF7FFFFFFFCFCFCFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFE
      FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAEDEDEDECECECF9F9F9FCFCFCFF
      FFFFFFFFFFFEFEFEFEFEFEFDFDFDFBFFFEFFFFFEFFFEFFFFFCFFFBFFFFFDFFFF
      FEFFFBFFFFFCFFFFFEF8FEFDFDFFFCFFFDF6FFFEFBFAFDFBFAFBF7F3F0EBF0F0
      EAF5F4F0FAFBF9FFFFFFFFFEFFFFFDFFFDFCFFFDFCFFFFFCFDFDFFFFFAFFFEFF
      FFFFFFFDFFFFFCFFFBFFFFF7FFFBFFFFFFFFFFFFFBFBFBFEFEFEFFFFFFFEFEFE
      FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFAFAFAA3A3A35757572A2A2A1E1E1E191919282828
      4A4A4A7D7D7DC7C7C7FFFFFFFDFDFDFFFFFFFBFFFEFFFFFEFFFEFFFFFCFFFBFF
      FFFDFFFFFEFFFBFFFFFCFFF9FFFFFBFFFBF2EEE1C7AFC9A581BE976BCC9D71D4
      9B74D7A37FD8A886D0A88BCDAF96D4C3B0EAE3D4FCFCF0FBFFF7FFFEFFFDFFFF
      FBFFFFE3E3E3D6D1D3D3CFD4CED2D3C8D2CCCDCDCDD3D3D3FEFEFEFFFFFFFFFF
      FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFFFFECECEC5757570000000101010606060000000101
      01000000010101000000070707585858D1D1D1FEFEFEFFFEFFFCFEFFFCFFFDFF
      FFFEFFFEFFFBFAFFFBFEFFFDFFFFF3F3E1C79E7EAB5F2FBB7847D4B699EEE7DE
      F7F2F1FFFDFBF8FDFCFAFBF9F9F5F0FAEFE7EDDACDD3B9A8D5B6A1EDCBB4F8F2
      EDFBFCFFFBFEFFB4B0AB07000009080A010303100C010808080A0A0ABFBFBFFE
      FEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFC8E8E8E03030301010100000000000002
      0202010101000000040404000000000000000000151515C4C4C4FFFDFEFBFEFF
      F9FEFDFFFFFAFDFCFEFDFCFFFFFCFAECD2BAA66723924900E0B993F8FCFDFDFF
      FEFFFFF9FDFFFFF8FFFCFFFFFCFFFFFCFFFFFCFFFCF9FFFCF9FFFEFCFFF6F4E0
      D3D1D5B48DE4D0BEFFFEFFEBEFF4111516000100000000010004000000000000
      747474FBFBFBFFFFFFFDFDFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5C5C5C000000000000000000
      000000000000000000000000000000020202000000010101010101272727E9E5
      E0FDFCFFFFFEFFFFFFFBFBFFFFFDFFFFE9CAB19B5519A14500E5C0A6FFFEFFFF
      FFFFFEFDFFFDFDFDFFFFFCFBFDFFFDFDFFFDFDFFFDFEFFFDFFFFFDFFFFFAFFFD
      FBFFFCFBFFFBFEF5F1DABFAADDBEA5FFF6EC545A590002000704000200060101
      01000000303030FDFDFDFBFBFBFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF6363630000000101
      010101010000000101015050508F8F8F21212101010100000000000002020200
      00005A535AFBFEFCFDFFF8F3FFFFFBFFFFEAC59FA3530C9F4001D5AF8CFFFFFB
      FFFAFFFEFFFDFBFFFFFFFBFEFFFFFEFFFEFFFFFEFFF4FFFFFFFFF7FFFEFFF6FD
      F6F4FEFFFFFFFEF3FFFBFFFBFFFFFFFFF2DCD0E4C3B3A39A9000000302000300
      0400000000000000040404C4C4C4FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE86868600
      0000000000000000020202000000818181FFFFFFC9C9C90D0D0D000000010101
      000000000000060606CDCDCDFFFFFCFBFEFFF3DFCE925320984600B9784BFBFB
      FFFCFEF8FFFFFFF6FFFFF2FDFBFFFBFFFFFBFFFFFFF9FFFEFFF8FBFFFFFFFCF3
      FBFFFFFFFEFFF9FFFFF6F7FFFDFFF6FFFFFFFFF7FFFFF7FFFFFEE2E4E5161211
      090602000003010101000000010101808080FFFFFFFFFFFFFEFEFEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFD
      C4C4C40000000505050000000101010000003C3C3CFBFBFBFBFBFB5F5F5F0000
      0000000003030300000000020075767AFFFBFCFFFDFFBB875F9C4400984704EF
      D4C0F5FDFFF6FFFBF9FFFDF3F1D9E0C698DEB595E2D2C1F6FBF2FFFDFEF8FEFF
      FFFFF7F8E8D7E1BF9BCEAD8CDEBA94DFCAAFFFF6E6F9FFF7FAFEFFFDFEFFF3FF
      FF575B5C0900010000000000000000000000002C2C2CF6F6F6FFFFFFFFFFFFFE
      FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFDFDFDF2F2F21D1D1D000000010101000000010101040404D4D4D4FFFFFF9A
      9A9A03030300000000000004040404080221252AFFFCFDFAE6E1984C11AE4F00
      B57136FFFEFDFFFDF6FFFFF8DAA5849F58189E4600AB5929E7C8AFD5C6B3FFFA
      F1F6FFFCEFC8ACA05120A348009C4503A14A0CCB9D6ECAAA97DFCCC5FFFBFBFF
      FFFBFFFFFE9DA0A4000003060201000000000000010101010101CECECEFEFEFE
      FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFEFEFEFEFE656565000000010101000000010101000000828282
      FFFFFFBFBFBF00000006060600000001010100000000070AE2E2DCDDBEA79B49
      01984300D6A577FBFBFFFBFFFED9B7A79844039949009F4701B97443FFFFF5F2
      ECDFCFBFAFFEF1DBB1733D9F4504A34E00914700BD854EFAFFF4FFFEF9EDD2C4
      D9C5B4FBF5EAFFFFFBE7E3DE0B0C0A0200060101010000000000000000008383
      83FFFFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFFFFFEFEFEBDBDBD5D5D5D5858585B5B5B5757575656
      568F8F8FFEFEFE838383010101000000000000000000040001000707A0A49ECD
      A27B9B46009A4F05E6C9AAFDFFFFFFFBF9B77346AA4600944C10AB4F02AC570F
      F6EEE1FFFBFFF6E2D7CAA4829F5105A14B05A94D06A14500B46C36FFF6FFFCFE
      FEFFFFF8F6EFDCC5B9A7F6F1E2FFFFF956515000000300000001010100000003
      0303353535FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFCFCFCFCFCFCFFFFFFFE
      FEFEFFFFFFFFFFFF7C7C7C050505000000000000020202000000040000000201
      767878CA915E9D4400A1500DF4E0CFFAFFFEF7F1F2A46319AB4E00904B06A050
      00A14C02CEB08DFFFFFBFFFFFBDCC1A7944F06994A01A24F04A04B009B4F03E5
      CBB3F6FFFEFFFDFFF8FDFBF2F2E2D9C0B0FFF8F199A3A3050000000000020202
      000000000000090909CBCBCBFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFEFEFEFFFFFFFFFFFF
      FEFEFEFFFFFFF6F6F66464640101010101010000000000000101010000000201
      0004000077727BC7864FA44500AB5111FAE7E0F4FFFBFFFAFEA5712AA04900AD
      4E04A74E009F4205B47241FDFFF3FFFFFEFBFFF7B98049A34601A14C04A34C09
      A74500B68450FFFDFFFFFBFFFFFDFFFFFDFFEDDBD4EBDBCBE8E9E0060F180000
      00000000010101000000000000818181FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFF
      FFFCFCFCFFFFFFF7F7F74E4E4E01010100000000000003030300000001010101
      0101040000000100A0A0A6D18B56994307A75406EDE2DEFFFFFBFCFEFED49360
      9D4200A14F01965003A44906A44807EBD7B8FBFFF6FDFCFFE6CCBB9C49059E50
      009C520A964B01AE5200ECE0CEFEFDF9FAFFFCFBFBFFFDFFFEE3CFBEFDFCF84F
      4C4E020202000000000000000000050505333333FFFFFFFDFDFDFEFEFEFFFFFF
      FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFBFBFBFFFFFFFF
      FFFFFFFFFFFFFFFFF9F9F9646464000000020202000000020202000000010101
      0000000202020905042E3233EFF0F4CD92649B4300A75006E7D0C0FDFFFFFDFF
      FFDCBEAD9C4703AA4F009D5105A64F00954504C58C59F8FFFFFFFBFEFFFFF0AE
      78419E4100AC5003A74B049D4500C59778FFFFF9F9FEFDFDFFFFFFFCFFF8F0E3
      F7EFE29996980000000303030000000101010000000D0D0DC5C5C5FFFFFFFFFF
      FFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FEFEFEFDFDFDFEFEFEFFFFFFA3A3A30000000101010000000000000404040000
      000404040202020000002A2625D3D6DAFFFFFFC59E78A14400A14601DDB08FF8
      FEFDF7FCFDFEF8F9B06A2EA74B009A4801A55200984B02A64E12EFE0D7FFFEFE
      FFFEFAD7BD9FA54908A84800AF4D05994B06AD5A27FFF1E0F9FEFFFBFFFFFFF8
      FEFDFFFEF6E4CDDCDBDD0C0C0C000000000000030303000000010101656565FD
      FDFDFDFDFDFDFDFDFDFDFDFFFFFFFFFFFFFDFDFDFFFFFFFCFCFCFFFFFFFFFEFE
      FEFFFFFFFBFBFBFFFFFFFFFFFFFFFFFF58585803030300000002020200000000
      00000000000000000000004E4E4EE3DFDEFBFEFFFFFFFEE2CCB3AA5101963C00
      BF7D48FFFFFBFFFFFCFFFFFFE1C09F964801A94B029E50049D4E00A34405BC7E
      58FFFFF9FFFAFFFFF3F1A66723A04900A65004954C02A24200D4AC89FBFFFEF6
      FFFFFFFEFFFBFEFFEBD0B5F9F5F4484848000000010101000000000000020202
      1D1D1DF3F3F3FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFEFEFE525252000000000000010101
      000000050505000000040404777777FBFBFBFFFFFEFAFDFFFCFBF7FCF3E9A95F
      1D9C4507A55410F1E0CDFFFFFCFCFDFFFAFEFFD2A2729C4400974706A75204A7
      48009F4806DAC6A3FFFBFFFFFCFFBC9C6BA34900A04F009B5001A14900A6662F
      FBF5E8F0FDFFFDFFFBFFFBFFDDBFA4FFFCF3A3A3A30202020000000101010101
      01000000000000B0B0B0FFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFFFDFDFDFF
      FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFEFEFEFFFFFFFFFFFF6D6D6D0000000202
      02000000010101000000010101898989FFFFFFFBFBFBFFFDFCFDFFFFFFFFFCFF
      FFFFC7976D9447089B4600CCA077FFFBFFFAFDFFF1FCFFFFFFF2B78158964200
      A54A00A651039B4700B77639F5FDF3FFFFFFE1CEC1A14600A55000A24E029D4F
      039B4804E1C2A1FBFFFFF5FEF4FFFAFFD8B699F5E9DFF8F8F820202000000000
      0000010101000000020202656565FFFFFFFBFBFBFDFDFDFFFFFFFFFFFFFFFFFF
      FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFDFDFD96969602
      0202000000020202010101000000141414F8F8F8E9E9E95C5C5C575554535654
      56555153525B5640348A4807A45000A65A1FFFEDE6FDFFFEFDFFFCFDFDFFFBEC
      E9AC784A974A059548009B4C03A44904E1C498FFFFF4FDE9E8A76C3A9F4A02A6
      4C059E4C05A24702C37F4AFFFAF2FDFFFCFFFDFFD6B08EF0E1D8FFFFFF616161
      030303000000000000000000000000252525F2F2F2FFFFFFFFFFFFFEFEFEFEFE
      FEFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFEFEFEFFFFFF
      DDDDDD0B0B0B0101010000000000000202020C0C0CE1E1E1F9F9F92929290201
      000102000400000000080400038C500EA14F00A64700C2966DF8FFFCFBFFFFFF
      FDF6FBFDFFFDF8F5D8A77BAB5D16A04502943D00A7500EE0C5B0EBD6CEE2D3C0
      B163219B40009E43009D3F009F3E00DDC0B1FFFBFEF5FEFFC89E74FFF1ECFDFD
      FDB7B7B7000000000000020202010101000000010101BCBCBCFDFDFDFFFFFFFD
      FDFDFFFFFFFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFCFC
      FCFFFFFFFCFCFC505050020202000000020202010101020202959595FFFFFF83
      8383050000000301000100020000000205626157A8794DA94300A14D05E6C6AF
      F6FCFFFAFFFEFFFFF3FFFFFCFAFDFFEDE9E8D6B49DC98D63C4783DAB6D3DD6BA
      A2FFFFF5E4CAB2C29268C7996AD2976AC0946FD8B698FFFBFDF1F0E2C09367F9
      F5FAFDFDFDE6E6E62121210101010000000000000303030000006A6A6AF9F9F9
      F9F9F9FCFCFCFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFE
      FEFEFFFFFFFEFEFEFFFFFFB6B6B6000000020202000000000000000000272727
      DADADAAAAAAA020100000100000001090406000003252924ECCFB4A55F2AA341
      009D591EF3DDC4FFFFFEFDFCFFFFF9FEFFFFF7FAFFFBFAFFFEFCFFFBFFFFFBFC
      FFFDFBFEFFFBFEFFFAF9FDFFFFFEFFFCFFFBFDFFFFFDF8FDFCFFFFFDFFE5C3A5
      6C4D342E30313131313838380B0B0B0202020202020202020000000101010A0A
      0A313131323232343434535353F8F8F8FFFFFFFDFDFDFFFFFFFFFFFFFFFDFDFD
      FFFFFFFDFDFDFFFFFFFDFDFDFDFDFDFEFEFE4343430303030000000505050000
      0000000011111115151500030000010003020607000102000303080BE1DCD3EF
      D2BDA2550C913F00A76125ECD4C8F2F8FFFFFFFEFFFFFEFFFCFCFBFFFFFAFEFF
      F6F8FFFBFEFFFFFFFCFDFDF7FDFFFEFBFEFFFFFFFAFEFFFAFFFFF7FFF7FFFFF9
      EABF8861B6AA9E0B060300000000000004040400000000000000000002020200
      0000000000030303010101000000040404CACACAFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFCCCCCC0E0E0E00000000
      0000010101000000030303000000010300000003000004050001030100000001
      C7CCCFFFFEFFDEC0A5A5551AA63E00A95219E2C3A4F3FFFDFAFFFEFBFDFFF9FD
      FFFFFCFFFFFBFEFFFEFEFFFFFCFBFFFEFBFFFFFEFDFFF6FFFCFFFDF8FFFBFFF8
      FFF6C6906FDEC3A1FCFFFA221C27010101030303000000030303000000000000
      010101000000030303000000010101000000030303888888FFFFFFFEFEFEFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFCFCFCFDFDFDC1C1C1
      2E2E2E0000000000000101010000000303030601000000040001060002000003
      00555856F0F3F7FFFEFFFFFFFCEBD9CEB371419B44029C4600C7884EF0DDC8FF
      FFF7FFFFF8FFFFF9FBFFF9FAFFFEFAFBFFFFFCFFFFFEFFFFFFFCFFFCFFFDFFFB
      E8CCC5C89269CAB288FFFDFFFBFBFF6C6E6F0000000101010000000202020000
      00020202000000030303000000000000020202010101010101383838FAFAFAFF
      FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFCFCFCFFFFFFFDFDFDFFFFFFFFFF
      FFFFFFFFEDEDED9393933A3A3A0A0A0A02020200000005000000000300000315
      1C1572776EF1F2F0FFFEFFFFFFFEFAFFFEF9FFFAF7FFF8D5BC9CB8753E943E02
      9D4908BC7C4CD1B398E6D2C0F3ECE3FBF9F9FFF9FEFFF8FAFFF4EEF3E7DDD6BB
      ADC69361C48F56E3CCACFFFCFAFFFDFFFFFFFAB8BBBF03030300000000000001
      01010202020202020000000000000000000202020000000202020000000A0A0A
      CECECEFEFEFEFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFBFBFBFF
      FFFFFCFCFCFFFFFFFFFFFFFFFFFFF9F9F9D1D1D1ADADAD9090908C8D89979496
      BAB8B8E5E9E4FDFFFEFFFDFFFFFEFFFFFFF9FFFDFFFFFCFDFFFFF7FAFFFEF7F8
      F4E7CFB9CA966DB16622A45004A8560EA95B18B0692AAF7033AD7234B27739B4
      793BC49972E6C5B5FBFFFBFFFEFFFEFFFBFFFEFAFAFFFFFFFBF8BABABAB7B7B7
      B7B7B7B6B6B6B8B8B8B2B2B2BBBBBBB6B6B6B9B9B9B1B1B1B6B6B6B9B9B9B8B8
      B8B1B1B1E4E4E4FFFFFFFFFFFFFFFDFDFDFFFFFFFDFDFDFFFFFFFFFFFFFCFCFC
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFF8FF
      FCFFFFFFFFFBFCFFFFFEFEFDFFFFFBFFFCFAFFFDFFF9FFFEFFFDFDFFFCFCFFFF
      FEFDFFFEFFF9FCFFFBFFFFFDFEF5FCEAE9EBDBCEE3D2B8E4CCB0EACDB8EED5CB
      EEE3DFFAFBF9FFFCFEFFFEFAFDFFFFEFFCFFFBFFFEF2FFFBFFFDFFFFFEFFFFFF
      FFFEFEFEFFFFFFFEFEFEFFFFFFFFFFFFFDFDFDFEFEFEFDFDFDFFFFFFFEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnFiscalClick
  end
  object btnGrava: TTISButton
    Left = 202
    Top = 487
    Width = 75
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   &Gravar'
    AutoSize = False
    ParentFont = False
    TabOrder = 30
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      12050000424D1205000000000000D20200002800000018000000180000000100
      08000000000040020000120B0000120B0000A7000000A700000000000000FFFF
      FF00FF00FF00FEDCFE00FFF8FF00FEC6FC00FECAFC00FCCAFA00FECEFC00FFEA
      FE00FECAFA00FFEDFE00FEC5F800FEC6F800FEC9F800FEC6F600FEC2F400F6CF
      F000FEC0EF00FEBCE700EAC7DE00FECAEB00FEC1E600F6C2E100FEBAE100FEBB
      E200FEB7DE00FEBBDC00FEB1D500E9AFC500EDB2C500D48B9A00E5A0AF00FC9A
      AA00FCA7B400CC889300CC879000FEB7C100D4878F00FC98A100FEADB500B691
      9300FC868600FC878700FC888800FC898900FC8A8A00FC8B8A00E37D7D00FC8C
      8C00F48888009E595900FC8F8F009E5B5A00FC909000E3838200FC919100FC92
      9200FC939300FC969500FC969600FC989700FC989800F4939300FC999900FC9A
      9A00BC757400FC9C9C00FC9D9D00FE9F9F00E5909000FC9F9F00FCA09F00FCA0
      A000FEA3A300FEA4A400FCA4A300FEA5A500FEA6A600FEA7A700BD7D7D00FEA9
      A900FEAAAA00FEABAB00F6A6A600B57A7A00FEADAD00FEAFAF00FEB0B000FEB1
      B100FEB2B200FEB4B400FEB5B400FEB5B500D4979700FEB6B600FEB7B700FEB8
      B700FEB8B800FEBABA00F6B4B400FEBBBB00FEBCBC00FEBDBC00F6B6B600FEBD
      BD00E5AAAA00FEC0C000FEC1C100FECACA00FED5D500BD9F9F00FFE2E200FFE6
      E600D4C0C000FFF2F200F7EEEE00FFF7F700FFF8F800FFFBFB00FAF6F600FCFA
      FA00FC8E8C0090535200814C4B00905554009057560088525100885352008856
      5500905F5E00B5797800FEAFAD00BD828100B57F7E00976A6900FEB4B200BD87
      86009F747300D49F9E00FEC0BF00FEC4C200FEC6C500F6C0BF00FEC7C600FEC9
      C700FEDDDC00F6D8D700B6959300FED7D500F4D3D000EADDDC00E6DAD900F3EB
      EA00F7F0EF00EBDEDC00FFF2F000F4EEED00EBDDDA00F8F3F200EDE0DD00F7F3
      F200EADCD800EADDD900EEE2DE00FFFFFE00FEFEFE0002020202020202027C7C
      7C7C7C7C7C7C02020202020202020202020202027C80868B8F91918F8B86807C
      020202020202020202027C7C898F9191919191919191936F7C7C020202020202
      027C7E6A91919191919191919191760198827C02020202027C7B3F538C919191
      919191919192010101A1827C020202027C302C3B4F6691919191919191760101
      0101987C0202027C423C2E2B394C619091919191950101010101016F7C02027F
      544B3E312A36485C8E9191919C010101010101A181027C835D564D41342A7A22
      16050D150401010101010101947C7C5E655F584F4438210518201E0A06040101
      0101A5A6727C7C68696560595145121C35828129080379789F9A9D99977C7C69
      696966625A2805268202027C1407A4A09B9EA3A2A27C7C696969696662250524
      8A0202811D0F969696969696967C7C686969696966630C1781878233131B6791
      919191918F7C7C5E6969696D7075090511231F1A10274961909191918B7C7C55
      6D7075010101010B0E050519272A2F43888E9191867C0281A101010101010177
      6B5B534A40362B2C3D848D8F8002027C6F0101010101017169665F564B41392D
      2B3A51857C0202027C9801010101016D69696960574E443A2E2A377C02020202
      7C82A101010173696969696963594F473C327B7C02020202027C829801016E69
      6969696969655A52467D7C020202020202027C7C6F746C696969696969696450
      7C7C020202020202020202027C7F555E686969685E557F7C0202020202020202
      0202020202027C7C7C7C7C7C7C7C0202020202020202}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnGravaClick
  end
  object btnImprime: TTISButton
    Left = 296
    Top = 487
    Width = 89
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Or'#231'amento'
    AutoSize = False
    ParentFont = False
    TabOrder = 31
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C
      6A6A6C6A6AFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6AFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF6C6A6AB0ADAD9692938E8A8B6C6A6A6C6A6A817E7F6C6A6ADDDCDCD0CFCF6C
      6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF6C6A6AD5D4D4C6C4C4A19F9FA19F9FA19F9F8381825C5B5BBCBC
      BCCECECECFCFCFD1D1D1D3D3D3CAC9C96C6A6A6C6A6A6C6A6AFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF6C6A6AD8D7D7E0DEDEC0BFBFA19F9FA19F9FA19F9F
      6260600000000000001616165D5D5DA9A9A9CACACACACACACACACACACACAC1C0
      C06C6A6A6C6A6A6C6A6AFF00FFFF00FF6C6A6AD3D3D3D4D3D3CFCFCF8C8A8A81
      7F7F817F7F817F7F6C6A6A1414140808080000000000000000001616165D5D5D
      A9A9A9CACACACACACAB7B6B6B7B6B66C6A6AFF00FF6C6A6ACACACACACACAC6C6
      C68E8C8CB8B5B5B6B4B4A19F9FA19F9F9F9D9D9997979390918280805250502B
      2A2A080808000000000000161616646464817E7F6C6A6AFF00FFFF00FF6C6A6A
      CACACAC5C5C58E8C8CD7D4D4F7F6F6F6F4F4F2F0F0E0DEDECAC7C7B6B5B5A5A3
      A3A19F9FA19F9F9E9A9C9390916865662322230303031919199997976C6A6AFF
      00FFFF00FF6C6A6AC5C5C58E8C8CE7E6E6F7F6F6F7F6F6F6F4F4F2F0F0EEEDED
      EAEAEAE7E6E6E3E2E2D4D3D3C2C1C1AFADADA19F9FA19F9F9997978280806C6A
      6A9F9D9D6C6A6AFF00FFFF00FF6C6A6A8E8C8CEFEEEEF7F6F6F7F6F6F7F6F6F6
      F4F4D5D3D4867B7E958B8EC1BFBFDDDCDCE0E0E0DCDCDCD8D8D8D1D1D1C2C1C1
      B2B0B0A19F9F9C99996C6A6A6C6A6AFF00FFFF00FF6C6A6ACECBCCF7F6F6F7F6
      F6F7F6F6F7F6F6CFCBCCAFACADADABAB9E989883797B75696B898081ABA5A6C7
      C6C6D5D5D5D1D1D1CECECEC9C7C7BBBABAA6A4A46C6A6AFF00FFFF00FFFF00FF
      6C6A6A6C6A6ACECBCCEDEBEBAFA4A56B5D5F766A6C83787A9C9697ACAAAAB2B0
      B0ABA7A9989192817778847A7D938C8EBFBFBFCBCBCBCACACAC0C0C06C6A6AFF
      00FFFF00FFFF00FFFF00FFFF00FF6C6A6A6C6A6ABD8281AF8A737D5E51665456
      6554576D5E626D5E62898081A09A9CAFACADB2B0B0A49FA0CAC9CACBCBCBB7B6
      B66C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FF
      D4ABFFD0A1FFCB98D5A57BA1785C7B665F6050536656596F62658E8687CECCCC
      CFCFCFA5A4A46C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFBD8281FFD9B2FFD4A9FFCFA0FFCA97FFC68EFFC186FFBF81FFC084BD
      82816C6A6A6C6A6A6C6A6A6C6A6AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFBD8281FFDDBAFFD8B1FFD3A7FFCE9EFFCA96FFC5
      8CFFC084FFC084BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFE5CBFFE1C2FFDCB8FFD7AF
      FFD3A6FFCE9DFFC995FFC48BBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281FFEAD4FF
      E5CAFFE0C0FFDAB7FFD7ADFFD1A5FFCC9CFFC792BD8281FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFBD8281FFEEDCFFE9D1FFE3C9FFE0BFFFDAB6FFD5ACFFD0A3F7C297BD8281FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFBD8281FFF7EEFFF2E3FFEDDAFFE7D0FFE3C7FFDEBDFFD9B4FFD4
      ABBD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFBD8281FFFAF3FFFAF3FFF6EDFFF0E2FFEBD9FFE7CF
      FFE2C5FFDDBCF2C7A9BD8281FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD8281BD8281BD8281BD8281FF
      F4EBFFF0E1FFEBD7FFE6CEFBDCC0BD8281FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFBD8281BD8281BD8281BD8281BD8281FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnImprimeClick
  end
  object btnRetornar: TTISButton
    Left = 406
    Top = 487
    Width = 75
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   &Sair'
    AutoSize = False
    ParentFont = False
    TabOrder = 32
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF6628006628005F25005923005320004D1E00471C00451B00
      451B00451B00451B00451B00451B00451B00451B00451B00451B00431A003C17
      003C1700FF00FFFF00FFFF00FF843400792F008935008434007E3100772E0070
      2C006A2900682800682800682800682800682800682800682800682800682800
      6A29006A29005320003616003C1700FF00FFFF00FF843400C24C00CF5100C74E
      00C04B00BB4900B64700B14500AC4300AA4200AA4200AA4200AA4200AA4200AA
      4200AA4200AA4200AA4200AF4400A03F005320003C1700FF00FFFF00FF9E3E00
      D95500D95500CF5100CA4F00C54D00C04B00B84800B44600AF4400AA4200AA42
      00AA4200AA4200AA4200AA4200AA4200AA4200AF4400AF44006A2900431A00FF
      00FFFF00FFA74100DE5700DC5600D45300CF5100C74E00C54D00BD4A00B84800
      B44600AC4300AA4200A74100A74100A74100A74100A74100A74100AA4200AA42
      006A2900451B00FF00FFFF00FFB14500E65C00E35B00DC5800D75600D15400CC
      5000C54D00C6590BC7691EC4671EC0661EBC641EB45813A74100A74100A74100
      A74100AA4200AA4200682800451B00FF00FFFF00FFB64700EB6304EB6304E35D
      03DE5A01D95700E3914DF8EBDEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE6C19FA7
      4100A74100A74100A74100AA4200AA4200682800451B00FF00FFFF00FFB64700
      EF6A0AF26B0AED6607E66004F3BD8AFEFEFEFEFEFEF8E7D7F3D7BCF2D7BCF0D7
      BCEFD5BCDDA776AF4400AA4200A74100A74100AA4200AA4200682800451B00FF
      00FFFF00FFB64700F07517F37617F06E0FF28E39FEFEFEFBF0E6E37927D75400
      D15200CC5000C74E00C04B00BB4900B84800B14500AA4200A74100AA4200AA42
      00682800451B00FF00FFFF00FFB64700F2832BF4842BF07517F7C28FFEFEFEF3
      9A4FE65C00DE5700D95500D45300CF5100CA4F00C54D00BD4A00B84800B44600
      AF4400AC4300AA4200682800451B00FF00FFFF00FFB64700F3913FF4923FF27E
      22FAD1ABFEFEFEF2822AEB5E00E95B00E15800DC5600D75400FEFEFECC5000C5
      4D00C04B00BB4900B64700B44600AF44006A2900451B00FF00FFFF00FFB64700
      F4994CF79C4EF2832BF7C08CFEFEFEF4A55FEE5F01EE5D00EB5C00E35900DE59
      01FEFEFEFEFEFECC5000C74E00C24C00BD4A00BB4900B44600732D004D1E00FF
      00FFFF00FFB64700F49F55F7A158F28831F48A36FEFBFAFCF6EEF3903DEE5F00
      EE5D00EB5C00E76306FEFEFEFEFEFEFEFEFECF5100CA4F00C24C00C24C00BB49
      00792F00572200FF00FFFF00FFB64700F4A35BF7A65EF38C37F07313F7B67BFE
      FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEE7A365
      CC5000CA4F00C24C00823300622600FF00FFFF00FFB64700F6A55FF7AA66F491
      40F07619F07A1EF49C4FFADCBFFEFBFAFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFEFEEBA465D45300D15200CA4F008B36006A2900FF00FFFF00FFB64700
      F6A964F7B06FF4994BF07B20F2842DF27E23F07516F06E0FEF6A0AEE6707EF6C
      0DFEFEFEFEFEFEFEFEFEE65C00E15800DC5600D95500D15200953A00752D00FF
      00FFFF00FFB64700F6AA66F8B579F6A45DF27E22F2842DF28026F0791CF07516
      F06F11F06C0DF06F11FEFEFEFEFEFEEE6001EE5F00E95B00E35900DE5700D955
      00A03F007E3100FF00FFFF00FFB64700F6AA66F8B87FF7B579F3913FF38C37F2
      872FF28026F07B1FF07618F07213F07618FEFEFEEE6707EE6203EE5F01EE5F00
      EB5C00E95B00E15800A54100873500FF00FFFF00FFB64700F4A35BF8B67AF7BD
      88F7B880F7B477F6AF6FF6A763F49F55F49646F38C37F28229F07618F06B0CEE
      6505EE6001EE5F00EE5D00F05E00E95B00B14500923900FF00FFFF00FFB84800
      F69849F8AB67F8B67AF8BB83F8BB83F8B87FF8B275F7AC69F7A359F69748F489
      33F37D1FF36F10F06706F06302F06000F05E00F35F00F35F00BB49009C3D00FF
      00FFFF00FFB84800DE5700F69748F4A159F6AA66F6AB69F6AA67F6A560F4A058
      F4994BF38F3CF2832CF0781BF06C0DEE6606EE6202EE5F00EE5D00F05E00E359
      00AC43009C3D00FF00FFFF00FFFF00FFB64700B64700B64700B64700B64700B6
      4700B64700B64700B64700B64700B64700B64700B64700B64700B64700B64900
      B64700B64700A74100A74100FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnRetornarClick
  end
  object btnCancelaCupom: TTISButton
    Left = 837
    Top = 36
    Width = 36
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Cancelar Cupom'
    AutoSize = False
    Visible = False
    ParentFont = False
    TabOrder = 33
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      0800000000004002000000000000000000000001000000010000FF00FF00003C
      7A00003F8000004286000043880000448A0000479000004A9600004B9800004C
      9A00004FA0000050A2000052A6000053A8000054AA000056AE000057B0000058
      B2000059B500005CBA00005DBD00005FC0000060C2000061C4000064CA000065
      CC000067D0000068D2000069D400006BD800006CDA00006DDC00006FE0000070
      E2000071E4000073E8000074EA000075ED000077F0000078F2000079F400007B
      F800007CF900007EFE000380FF000581FF000982FF000B84FF000E85FF001186
      FF001388FF001689FF00198BFF001E8EFF00218FFF002190FF002792FF002893
      FF002A94FF002D95FF003096FF003398FF00379AFF00399AFF003A9CFF003E9D
      FF00409FFF0042A0FF0046A2FF0049A3FF004BA4FF004EA6FF0053A8FF0058AA
      FF005AACFF005DADFF0060A5ED0060A8F20060ABF70060ABF80060ADFB0060AE
      FD0066B1FF0068B3FF006AB5FF006DB6FF0073B8FF0074B8FF0078BBFF007BBC
      FF007EBDFF0080BFFF0082C0FF0084C1FF008BC4FF008EC5FF009FC8F10090C7
      FF0091C8FF0095C9FF0099CCFF009DCDFE00A0CFFF00A5D1FF00ABD4FF00ADD5
      FF00B1D7FF00B4D9FF00B9DCFF00BCDDFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000C0C0A090706050505050505
      05050505050402020000001412161414120F0F0C0F0C0C0C0F0C0C0C0F0C0702
      020000142528282525231F1F1F1F1F1F1F1F1F1F1F201B070200001B2B2B2828
      252523251F1F1F1F1F1F1F1F1F201F0F0500001F2C2B2B28282525231F1F1F1F
      1F1F1F1F1F1F1F0F0400001F2F2F2B2B2828252525251F1F1F1B1F1B1F1F1F0C
      050000253334312F2C666E4E252323234C6E601F1F1F1F0F0400002338393633
      2F6E6E6E4E25254C6E6E6E1F1F1F1F0C0500002341413C3634526E6E6E4F4E6E
      6E6E4C1F1F1F1F0C04000025494941363434526E6E6E6E6E6E4E251F1F1F1F0F
      050000235656473939342F536E6E6E6E4E252525251F1F0C040000235C5C4939
      3C3433536E6E6E6E4F2828252325250F050000255E5E523D3D38536E6E6E6E6E
      6E4F28282525231209000023626253413D586E6E6E53536E6E6E4F2B28282514
      0C00002362665741476E6E6E533431536E6E6E2B2B2828160F00002565665C47
      496D6E5839383434536E522C2B2B2B180F00002365696247494944413D393938
      3431312F2C2C2B1B14000023656B69565349494741414139383331312F2F2C1B
      16000025616A6D6B6966655E585249423934332F2F312F251500002358666A6D
      6D6B6965625852473C383333313131231B0000232B5C5E656565625E58564944
      393434312F312C1F1B000000251F2325232325232325231F2523232523231B1F
      0000000000000000000000000000000000000000000000000000}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnCancelaCupomClick
  end
  object btnProdutos: TTISButton
    Left = 643
    Top = 76
    Width = 41
    Height = 26
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    AutoSize = False
    ParentFont = False
    TabOrder = 34
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FF314B62
      AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
      106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
      00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
      9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
      E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
      FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
      B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
      FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
      DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
      B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
      BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
      D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
      6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphTop
    Spacing = 1
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnProdutosClick
  end
  object dblkVendedor: TComboBox
    Left = 537
    Top = 37
    Width = 255
    Height = 26
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    TabOrder = 35
  end
  object rdgTipoPedido: TTISRadioGroup
    Left = 558
    Top = 461
    Width = 227
    Height = 42
    Hot.Font.Font.Charset = DEFAULT_CHARSET
    Hot.Font.Font.Color = clWindowText
    Hot.Font.Font.Height = -11
    Hot.Font.Font.Name = 'MS Sans Serif'
    Hot.Font.Font.Style = []
    Hot.Color.Color = clBlack
    Hot.Border.Color = clBlack
    Caption = 'Op'#231#227'o de Venda:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Transparent = True
    ParentColor = True
    ParentFont = False
    SkinLayOut = WINXP
    Items.Strings = (
      'BALC'#195'O'
      'ENTREGA')
    Columns = 2
    TopMargin = 3
    FontColor = clBlack
    BorderColor = clNavy
    ItemIndex = -1
  end
end
