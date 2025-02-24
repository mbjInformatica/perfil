object FormProdutos: TFormProdutos
  Left = 220
  Top = 18
  Align = alCustom
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produtos'
  ClientHeight = 570
  ClientWidth = 801
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgProduto: TPageControl
    Left = 9
    Top = 9
    Width = 783
    Height = 551
    ActivePage = tabIdentificacao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object tabIdentificacao: TTabSheet
      Caption = 'Identifica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object lblFamilia: TLabel
        Left = 12
        Top = 11
        Width = 108
        Height = 15
        Caption = 'Fam'#237'lia do Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCategoria: TLabel
        Left = 12
        Top = 51
        Width = 123
        Height = 15
        Caption = 'Categoria do Produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMarca: TLabel
        Left = 12
        Top = 91
        Width = 39
        Height = 15
        Caption = 'Marca:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblReferencia: TLabel
        Left = 68
        Top = 361
        Width = 145
        Height = 15
        Caption = 'Refer'#234'ncia do Fabricante:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblUnidade: TLabel
        Left = 12
        Top = 195
        Width = 93
        Height = 15
        Caption = 'Unidade Medida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLocalizacao: TLabel
        Left = 168
        Top = 195
        Width = 71
        Height = 15
        Caption = 'Localiza'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigo: TLabel
        Left = 439
        Top = 89
        Width = 137
        Height = 18
        Caption = 'C'#243'digo do produto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBeneficio: TLabel
        Left = 766
        Top = 322
        Width = 80
        Height = 15
        Caption = 'Redu'#231#227'o/RPA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 443
        Top = 425
        Width = 104
        Height = 15
        Caption = 'C'#243'digo de Barras: '
        FocusControl = fldCodigoBarra
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 68
        Top = 393
        Width = 137
        Height = 15
        Caption = 'C'#243'digo do Fornecedor 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 68
        Top = 425
        Width = 137
        Height = 15
        Caption = 'C'#243'digo do Fornecedor 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 410
        Top = 361
        Width = 137
        Height = 15
        Caption = 'C'#243'digo do Fornecedor 3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 458
        Top = 393
        Width = 85
        Height = 15
        Caption = 'C'#243'digo Interno:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricaoDetalhada: TLabel
        Left = 12
        Top = 160
        Width = 121
        Height = 15
        Caption = 'Descri'#231#227'o Detalhada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDescricaoAbreviada: TLabel
        Left = 12
        Top = 130
        Width = 121
        Height = 15
        Caption = 'Descri'#231#227'o Abreviada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorAtual: TLabel
        Left = 12
        Top = 282
        Width = 90
        Height = 15
        Caption = 'Pre'#231'o de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMargemLucro: TLabel
        Left = 478
        Top = 282
        Width = 165
        Height = 15
        Caption = 'Margem de Comercializa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblVlVenda: TLabel
        Left = 256
        Top = 282
        Width = 89
        Height = 15
        Caption = 'Valor de Venda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 542
        Top = 314
        Width = 93
        Height = 15
        Caption = 'Estoque M'#237'nimo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label15: TLabel
        Left = 267
        Top = 314
        Width = 97
        Height = 15
        Caption = 'Estoque M'#225'ximo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 20
        Top = 314
        Width = 81
        Height = 15
        Caption = 'Estoque Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fldCodFamilia: TDBText
        Left = 584
        Top = 87
        Width = 41
        Height = 24
        DataField = 'CodigoFamilia'
        DataSource = dmBaseDados.dsProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fldCodCategoria: TDBText
        Left = 631
        Top = 87
        Width = 41
        Height = 24
        DataField = 'CodigoCategoria'
        DataSource = dmBaseDados.dsProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fldCodigo: TDBText
        Left = 679
        Top = 87
        Width = 78
        Height = 24
        DataField = 'CodigoProduto'
        DataSource = dmBaseDados.dsProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNCM: TLabel
        Left = 302
        Top = 236
        Width = 70
        Height = 14
        Caption = 'C'#243'digo NCM:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 494
        Top = 236
        Width = 32
        Height = 14
        Caption = 'CFOP:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 43
        Top = 237
        Width = 32
        Height = 15
        Caption = 'ICMS:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCST: TLabel
        Left = 174
        Top = 237
        Width = 26
        Height = 15
        Caption = 'CST:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fldFamilia: TDBLookupComboBox
        Left = 140
        Top = 10
        Width = 383
        Height = 21
        DataField = 'CodigoFamilia'
        DataSource = dmBaseDados.dsProdutos
        KeyField = 'CodigoFamilia'
        ListField = 'DescricaoFamilia'
        ListSource = dmBaseDados.dsFamilias
        TabOrder = 0
      end
      object fldCategoria: TDBLookupComboBox
        Left = 139
        Top = 51
        Width = 385
        Height = 21
        DataField = 'CodigoCategoria'
        DataSource = dmBaseDados.dsProdutos
        KeyField = 'CodigoCategoria'
        ListField = 'DescricaoCategoria'
        ListSource = dmBaseDados.dsCategoria
        TabOrder = 1
      end
      object fldMarca: TDBLookupComboBox
        Left = 56
        Top = 91
        Width = 265
        Height = 21
        DataField = 'CodigoMarca'
        DataSource = dmBaseDados.dsProdutos
        KeyField = 'CodigoMarca'
        ListField = 'Marca'
        ListSource = dmBaseDados.dsMarcas
        TabOrder = 2
      end
      object fldReferencia: TDBEdit
        Left = 220
        Top = 360
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ReferenciaFabricante'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 18
      end
      object fldUnidade: TDBEdit
        Left = 110
        Top = 195
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UnidadeMedida'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 5
      end
      object fldLocalizacao: TDBEdit
        Left = 244
        Top = 195
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Localizacao'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 6
      end
      object dbcBeneficio: TDBComboBox
        Left = 762
        Top = 322
        Width = 47
        Height = 21
        DataField = 'Beneficio'
        DataSource = dmBaseDados.dsProdutos
        ItemHeight = 13
        Items.Strings = (
          'SIM'
          'NAO')
        TabOrder = 11
        Visible = False
      end
      object fldCodigoBarra: TDBEdit
        Left = 552
        Top = 424
        Width = 82
        Height = 21
        DataField = 'CodigoBarra'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 26
      end
      object FLDREFERENCIA2: TDBEdit
        Left = 219
        Top = 391
        Width = 170
        Height = 21
        DataField = 'ReferenciaFabricante2'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 19
      end
      object FLDREFERENCIA3: TDBEdit
        Left = 219
        Top = 424
        Width = 170
        Height = 21
        DataField = 'ReferenciaFabricante3'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 20
      end
      object FLDREFERENCIA4: TDBEdit
        Left = 552
        Top = 359
        Width = 170
        Height = 21
        DataField = 'ReferenciaFabricante4'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 21
      end
      object fldCodigoInterno: TDBEdit
        Left = 552
        Top = 391
        Width = 168
        Height = 21
        DataField = 'CodigoInterno'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 25
      end
      object FLDREFERENCIA5: TDBEdit
        Left = 768
        Top = 296
        Width = 169
        Height = 21
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 22
        Visible = False
      end
      object FLDREFERENCIA6: TDBEdit
        Left = 768
        Top = 320
        Width = 169
        Height = 21
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 23
        Visible = False
      end
      object FLDREFERENCIA7: TDBEdit
        Left = 800
        Top = 336
        Width = 169
        Height = 21
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 24
        Visible = False
      end
      object fldDescricaoAbreviada: TDBEdit
        Left = 142
        Top = 130
        Width = 619
        Height = 21
        DataField = 'DescricaoAbreviada'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 3
      end
      object fldDescricaoDetalhada: TDBEdit
        Left = 142
        Top = 160
        Width = 619
        Height = 21
        DataField = 'DescricaoDetalhada'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 4
      end
      object fldVlAtual: TDBEdit
        Left = 112
        Top = 282
        Width = 81
        Height = 21
        DataField = 'ValorUnitarioAtual'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 12
      end
      object fldMargemLucro: TDBEdit
        Left = 650
        Top = 282
        Width = 57
        Height = 21
        DataField = 'MargemLucro'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 14
        OnExit = fldMargemLucroExit
      end
      object fldVlVenda: TDBEdit
        Left = 354
        Top = 282
        Width = 73
        Height = 21
        DataField = 'ValorVenda'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 13
        OnExit = fldVlVendaExit
      end
      object fldEstoqueMin: TDBEdit
        Left = 662
        Top = 314
        Width = 57
        Height = 21
        DataField = 'EstoqueMinimo'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 17
      end
      object fldEstoqueMax: TDBEdit
        Left = 378
        Top = 314
        Width = 73
        Height = 21
        DataField = 'EstoqueMaximo'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 16
      end
      object fldEstoqueAt: TDBEdit
        Left = 112
        Top = 314
        Width = 97
        Height = 21
        DataField = 'EstoqueAtual'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 15
      end
      object btnPrimeiro: TTISButton
        Left = 18
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Primeiro'
        AutoSize = False
        ParentFont = False
        TabOrder = 27
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          6E040000424D6E040000000000002E0200002800000018000000180000000100
          08000000000040020000120B0000120B00007E0000007E00000000000000FFFF
          FF00FF00FF00007EFF00007CFA00007AF6000079F4000078F2000077F0000076
          EE000075EC000074EA000073E8000072E6000071E4000070E200006FE000006D
          DC00006CDA00006BD800006AD6000069D4000068D2000067D0000066CE000065
          CC000064CA000063C8000062C6000060C200005EBE00005DBC00005CBA00005B
          B800005AB6000059B4000058B2000055AC000054AA000053A8000052A6000051
          A400004FA000004D9C00004C9A00004B98000380FF000581FF000782FF000B84
          FF000D85FF000F86FF001187FF001388FF00178AFF001D8DFF001E83EA00218F
          FF001E82E8001E81E6001E80E4001E7CDC002390FF001E7BDA001E7AD8001E77
          D2002591FF002792FF002993FF002B94FF002D95FF002F96FF003197FF003599
          FF00379AFF00399BFF003B9CFF003D9DFF003F9EFF00419FFF0045A1FF0049A3
          FF004BA4FF004DA5FF004FA6FF0051A7FF0059ABFF005DADFF005FAEFF0061AF
          FF0063B0FF0065B1FF0067B2FF006BB4FF006DB5FF0073B8FF0077BAFF0079BB
          FF00B1D8FF00B5DAFF00B9DCFF00BDDEFF00C5E2FF00C9E4FF00D3E9FF00D5EA
          FF00D7EBFF00DBEDFF00DDEEFF00E1F0FF00E3F1FF00E5F2FF00FDFEFF007FBE
          FF0083C0FF0085C1FF0087C2FF0089C3FF008BC4FF008FC6FF0095C9FF009FCE
          FF00A3D0FF00A5D1FF00A7D2FF00A9D3FF0002020202020202022D2D2D2D2D2D
          2D2D02020202020202020202020202022D2D29241F1E1E1F24292D2D02020202
          020202020202292C271D17151617171615171C252D2D02020202020202292920
          1516191A1B191919191A17131F2C2D020202020229281E14191A191919191919
          1919191A131E2B2D02020202261F15191919191919191919191919191A131F2D
          0202022922171919191919191A19191919191919191914252D0202241C151514
          13180101181A191916604719191A161D2D021F20130F0D0A090F010110141811
          7801481919191916282D3F1A090604032E050101070C30640101461919191915
          232D3F1230323335363101012F546D0101014619191919161F2D3F0A44473E43
          45440101747001010101461919191A161E2D3D0354574D4C4E4D010178010101
          0101461919191A161E2D3F035C73565355550101495D6E010101471919191916
          1F2D3F085E7B72595A5A01014F484D670101481919191915232D3F1357626372
          60600101514B423E7D014A1919191917292D023B457A686378720101554D4436
          31744919191A161D2D02023F0B71676C6577715B554E44362E09131919191426
          2D0202023B377A6B6F647858534C4235030A14191913212D020202023F38447B
          696F677C5F5047373430050F13202C2502020202023F3A3976656A6A667C7761
          5D52370A202B25020202020202023F3C0A4D717962627A7559430E222A250202
          02020202020202023F1C102F3E4642320D1D2525020202020202020202020202
          02023F3F3F40413F3F3F0202020202020202}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnPrimeiroClick
      end
      object btnAnterior: TTISButton
        Left = 101
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Anterior'
        AutoSize = False
        ParentFont = False
        TabOrder = 28
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0450070450070450070450070450
          07045007045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C045007089D1509AE18
          09B31909B51909B51909B31909AD18089914045007045007FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C08650C09A51709
          B71A09B71A09B31909B31909B31909B31909B31909B31909B71A09B71A089F16
          045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F83190B83
          190FB8250CB61E09B21909B21909B21909B21909B21909B21909B21909B21909
          B21909B21909B71A09B11906760E045007FF00FFFF00FFFF00FFFF00FFFF00FF
          0F83190E832017BD3513B82D0FB4260CB31F0CB31F0CB31F09B21909B21909B2
          1909B21909B21909B21909B21909B21909B31909B31906720D045007FF00FFFF
          00FFFF00FFFF00FF0F83191DBD421ABA3C16B7340CB31F0CB31F0CB31F0CB31F
          A9E5B2FFFFFFF0FAF23EC34C0EB31F09B21909B21909B21909B21909B51909AE
          18045007FF00FFFF00FFFF00FF0F83191EAA4322C14D1DBB431DBB430CB31F0C
          B31F0CB31FADE6B7FFFFFFFFFFFFFFFFFF8ADB9410B52409B21909B21909B219
          09B21909B21909B81A089313045007FF00FFFF00FF0F831929C45B25BE5121BC
          4B29BD510CB31F0CB31FB0E7BCFFFFFFFFFFFFFDFEFDD4F2D93CC35014B62A09
          B21909B21909B21909B21909B21909B31909B219045007FF00FF09B21921A54A
          2EC66529C05829C05829C0580CB31FB4E8C2FFFFFFFFFFFFEDF9EFC0ECC841C5
          571DB93518B83009B21909B21909B21909B21909B21909B21909B81A07851104
          500709B2192DBB6231C4692DC2622DC2622DC26288DBA1FFFFFFFFFFFFFFFFFF
          91DEA24BC86526BD4321BB3C1DB93619B83015B62B12B5260FB52109B21909B2
          1909B51A089F1604500709B21936C36C38C67030C36930C3698DDDA8FFFFFFFF
          FFFFFFFFFFFFFFFFE3F6E8CAEFD2CAEFD2C9EED0C7EECEC7EECDC6EDCBC5EDCA
          C4EDC9A5E3AB09B21909B21909AE1804500709B21947C9794ACB7D35C46D35C4
          6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF09B21909B21909B31904500709B21958CE86
          62D28E3BC6713BC671DEF5E7FFFFFFFFFFFFFFFFFFFFFFFFE4F7EAF5FCF7FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FAF209B21909B21909B21904
          500709B21962D08B81DBA44DCB7E4DCB7E5CD089D3F2DFFFFFFFFFFFFFFFFFFF
          A8E5BB64D18361D07E68D28364D17D61CF785DCE745BCC6F57CC6A38C14C09B2
          1A09B31909A91804500709B2195ACA809BE2B76DD59552CD8252CD8251CD81BD
          ECCEFFFFFFFFFFFFFFFFFFBFECCD46C86D3AC46036C25932C1532DBF4D28BE45
          24BC401FBA390AB21C09B61908971404500709B21943BC639FE4BB9DE3B84FCC
          7F52CD8252CD8252CD82BDECCEFFFFFFFFFFFFFFFFFFE1F6E758CE7A3AC46121
          BC491DBB431ABA3C17B83613B62D0DB4220BB81D067B0F045007FF00FF09B219
          85DBA7BFECD188DDA943C97752CD8252CD8252CD82BDECCFFFFFFFFFFFFFFFFF
          FFA0E3B53FC66725BE5121BC4B1EBB441ABA3C16B73212B82B0EAE22045007FF
          00FFFF00FF09B21951C572B1E9C8C5EED581DAA352CD8252CD8252CD8252CD82
          92DFAFFFFFFFFFFFFF75D79644C76D28BF5925BF5321BD4A1DBA4019B93916BE
          350C851A045007FF00FFFF00FFFF00FF09B21975D598C7EFD6CAF0D98CDEAB52
          CD8252CD8252CD8252CD8251CC804ECB7C4BCB7848C9742BC15F27BF5723BD4E
          20BB471EC04415A43008650CFF00FFFF00FFFF00FFFF00FF09B2192CB34281DA
          A3C9EFD8D6F3E1ACE7C378D89D54CD8341C87538C56F35C46D35C46D37C56E3B
          C66D38C5672DC15B26C3541DB1410F821C08650CFF00FFFF00FFFF00FFFF00FF
          FF00FF09B2192BB34174D596B6EACBD6F3E1CFF1DCB4E9C897E1B482DBA477D7
          9C73D69973D6996AD49352CE8138C96B20AD480F821C0F8319FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF09B21909B2194FC56E86DCA7AFE8C6C2EED3
          C5EED5BDECCFB1E9C79FE3BA86DDA965D59242C4721F9C3E0F821C0F821CFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09B21909
          B2193FBE5C5BCA7D6CD29070D49569D29058CA7F3FBA6424A2410F821C0F8319
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF09B21909B21909B21909B21909B21909B21909B21909
          B219FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAnteriorClick
      end
      object btnProximo: TTISButton
        Left = 184
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Pr'#243'ximo'
        AutoSize = False
        ParentFont = False
        TabOrder = 29
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0450070450070450070450070450
          07045007045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C045007089D1509AE18
          09B31909B51909B51909B31909AD18089914045007045007FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08650C08650C09A51709
          B71A09B71A09B31909B31909B31909B31909B31909B31909B71A09B71A089F16
          045007045007FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0F83190B83
          190FB8250CB61E09B21909B21909B21909B21909B21909B21909B21909B21909
          B21909B21909B71A09B11906760E045007FF00FFFF00FFFF00FFFF00FFFF00FF
          0F83190E832017BD3513B82D0FB4260CB31F0CB31F0CB31F09B21909B21909B2
          1909B21909B21909B21909B21909B21909B31909B31906720D045007FF00FFFF
          00FFFF00FFFF00FF0F83191DBD421ABA3C16B7340CB31F0CB31F0CB31F0CB31F
          1BB93343C555F0FAF2FFFFFFA4E2AB09B21909B21909B21909B21909B51909AE
          18045007FF00FFFF00FFFF00FF0F83191EAA4322C14D1DBB431DBB431BBA3D1D
          BB4015B73124BC4020BA3A8EDC9AFFFFFFFFFFFFFFFFFFA2E2A809B21909B219
          09B21909B21909B81A089313045007FF00FFFF00FF0F831929C45B25BE5121BC
          4B29BE5328C05729C0582CBF5129BD4825BC4144C55AD4F2D9FDFEFDFFFFFFFF
          FFFFA2E2A809B21909B21909B21909B31909B219045007FF00FF09B21921A54A
          2EC66529C05829C05829C05824BE4F30C15A32C1552EC04F2ABE4825BD4241C5
          57BDEBC4EBF9EDFFFFFFFFFFFFA2E2A809B21909B21909B21909B81A07851104
          500709B2192DBB6231C4692DC2622DC2622DC26240C6693CC46237C35C33C156
          2FC04F2ABE4926BD4343C55A87DA95FFFFFFFFFFFFFFFFFF69D17509B21909B2
          1909B51A089F1604500709B21936C36C38C67030C36930C369BAEBCAD0F1DBCF
          F1D9CEF0D8CDF0D6CCEFD5CBEFD3CAEFD2C8EECFE1F6E4FFFFFFFFFFFFFFFFFF
          FFFFFF69D07509B21909B21909AE1804500709B21947C9794ACB7D35C46D35C4
          6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF09B21909B21909B31904500709B21958CE86
          62D28E3BC6713BC671F4FCF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF4FCF6E2F6E6FFFFFFFFFFFFFFFFFFFFFFFFD3F1D709B21909B21909B21904
          500709B21962D08B81DBA44DCB7E4DCB7E67D3917BD99E79D79B77D79874D695
          71D5906ED48C61D07E5DCF7AA0E3B0FFFFFFFFFFFFFFFFFFC7EECD29BC3F09B2
          1A09B31909A91804500709B2195ACA809BE2B76DD59552CD8252CD8251CD8150
          CD7E4DCB7A49CA7646C97142C76B46C86DBCEBC9FFFFFFFFFFFFFFFFFFAEE7B9
          24BC401FBA390AB21C09B61908971404500709B21943BC639FE4BB9DE3B84FCC
          7F52CD8252CD8252CD8250CC7E4DCB7B4ACA775FD085E1F6E7FFFFFFFFFFFFFF
          FFFFAAE5B81ABA3C17B83613B62D0DB4220BB81D067B0F045007FF00FF09B219
          85DBA7BFECD188DDA943C97752CD8252CD8252CD8250CC7F4DCB7BA3E4BAFFFF
          FFFFFFFFFFFFFFADE7BD21BC4B1EBB441ABA3C16B73212B82B0EAE22045007FF
          00FFFF00FF09B21951C572B1E9C8C5EED581DAA352CD8252CD8252CD8252CD82
          50CC7F7AD89CFFFFFFFFFFFF8ADCA428BF5925BF5321BD4A1DBA4019B93916BE
          350C851A045007FF00FFFF00FFFF00FF09B21975D598C7EFD6CAF0D98CDEAB52
          CD8252CD8252CD8252CD8251CC804ECB7C4BCB7848C9742BC15F27BF5723BD4E
          20BB471EC04415A43008650CFF00FFFF00FFFF00FFFF00FF09B2192CB34281DA
          A3C9EFD8D6F3E1ACE7C378D89D54CD8341C87538C56F35C46D35C46D37C56E3B
          C66D38C5672DC15B26C3541DB1410F821C08650CFF00FFFF00FFFF00FFFF00FF
          FF00FF09B2192BB34174D596B6EACBD6F3E1CFF1DCB4E9C897E1B482DBA477D7
          9C73D69973D6996AD49352CE8138C96B20AD480F821C0F8319FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF09B21909B2194FC56E86DCA7AFE8C6C2EED3
          C5EED5BDECCFB1E9C79FE3BA86DDA965D59242C4721F9C3E0F821C0F821CFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09B21909
          B2193FBE5C5BCA7D6CD29070D49569D29058CA7F3FBA6424A2410F821C0F8319
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF09B21909B21909B21909B21909B21909B21909B21909
          B219FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnProximoClick
      end
      object btnUltimo: TTISButton
        Left = 267
        Top = 464
        Width = 71
        Height = 49
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
        Caption = #218'ltimo'
        AutoSize = False
        ParentFont = False
        TabOrder = 30
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          DA050000424DDA050000000000009A0300002800000018000000180000000100
          08000000000040020000120B0000120B0000D9000000D900000000000000FFFF
          FF00FF00FF00FEFFFF00007EFF00007CFA000079F4000077F0000076EE000075
          EC000074EA000072E6000071E4000070E200006FE000006CDA00006BD800006B
          D700006AD600006AD5000069D4000068D2000068D1000067D0000066CF000067
          CF000066CE000066CD000065CC000064CA000063C8000062C6000060C200005E
          BE00005DBC00005CBA00005BB800005AB6000059B4000058B2000055AC000054
          AA000053A8000052A6000051A400004FA000004D9C00004C9A00004B98000176
          ED000172E4000170E2000171E200016FE0000170E000016DDC00016CD900016B
          D800016CD800016BD6000168D2000168D1000167CF000166CD000165CC00027F
          FF000279F1000276ED000274E700026DDA00037CF600037AF3000375EA00036D
          D8000369D000046BD4000469D0000581FF000577EB00056ED900067DF5000782
          FF000779ED000883FF00086ED6000A83FC000B84FF000A70D7000B79E9000B73
          DD000D85FF000D77E1000F86FF00107EEE001288FF001280F1001589FF00158B
          FF001689FF00178AFF00167FE8001A8CFF001D8DFF001E83EA00218FFF001E82
          E8001E81E6001E80E4001E7CDC002390FF002392FF001E7BDA001E7AD800238D
          F8001E77D2002591FF002692FF002792FF002893FF002993FF00288DF4002B94
          FF002B95FF002C96FF002C97FF002D95FF002E96FF002F96FF003199FF003297
          FF003398FF00399CFF003A9CFF003C9CFF003D9DFF003E9EFF0041A0FF0044A1
          FF004BA4FF004DA5FF004EA6FF004FA6FF0050A7FF0051A7FF0051A8FF0053A9
          FF0057A9FD00529FEC0059ABFF0057A8F90056A6F7005BACFF005DADFF005EAF
          FF0061AFFF0065B1FF0065B2FF0067B2FF006BB4FF006BB6FF006DB5FF0070B7
          FF0076BBFF0078BBFF0079BBFF0080BEFC0084C1FF0089C4FF008AC4FF0092C8
          FF008FC1F300A6D2FF00A9D4FF00ACD6FF00ABD3FB00AFD7FF00B1D8FF00B4DA
          FF00BDDEFF00C4E2FF00C5E2FF00C5E1FD00C9E4FF00D3E9FF00D6EBFF00D9EC
          FF00E5F2FF000172E7000571E2000772E100429FFF0044A0FF0046A1FF004BA3
          FF0058AAFF0060AEFF006CB4FF007FBEFF0081BFFF0083C0FF0085C1FF0089C3
          FF008BC4FF008FC6FF0097CAFF009FCEFF00A1CFFF00A3D0FF00A5D1FF00C2E0
          FF00D2E8FF00D4E9FF00D6EAFF00D8EBFF00DCEDFF00E0EFFF00E4F1FF000202
          0202020202023030303030303030020202020202020202020202020230302C27
          22212122272C3030020202020202020202022C2F2A2017141517171514171F28
          3030020202020202022C2C2314151C1D1E1C1C1C1C1D1710222F300202020202
          2C2B21121C1D1C1C1C1C1C1C1C1C1C1D10212E30020202022922141C1A19191A
          1B1C1C1C1C1C1C1C1D1022300202022C25171C1B1611383A143D1A1C1C1C1C1C
          1C1C1228300202271F1414393693AABD35373B3C01011C1C1C1D152030022223
          100D0B31479601AE5D4433370101541C1C1C1C152B306F1D0806054153920101
          B57843BB01014F3E1C1C1C1426306F0F515A5C606599010101D895420101BC13
          1A1C1C1522306F09777F6D767D9F0101010103A501014E37151B1D1521306C04
          8D98868587A20101010101A701015032131A1D1521306F049DC8948B8DC60101
          01BA9C61010155483A181C1522306F07A0D0C7C398A80101D3907A6E01015E52
          45191C1426306F1098B0B1C5C4A901B49188838001017C58493E1C172C30026A
          79CFD2AFA6CCD19D8EC1898501017B5B4B4015203002026F0AC5B6D5ADA39BC2
          8F8ABF847E7164574A1B1229300202026A66CFB9D6ACC8978CBE8274635F594C
          3F102430020202026F6777D0B7D7D1CEA1C081686256463410232F2802020202
          026F6968CAB2B8D4B3ABCBA49E8A6609232E28020202020202026F6B0986C5CD
          B0B0CFC99A750C252D28020202020202020202026F1F0E4D6D7D735A0B202828
          02020202020202020202020202026F6F6F70726F6F6F0202020202020202}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnUltimoClick
      end
      object btnGravar: TTISButton
        Left = 350
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Gravar'
        AutoSize = False
        ParentFont = False
        TabOrder = 31
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
        OnClick = btnGravarClick
      end
      object btnLocalizar: TTISButton
        Left = 433
        Top = 464
        Width = 71
        Height = 49
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
        Caption = '   &Localizar'
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
          00FFFF00FFFF00FF969190736E6EAF7D7EFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF9792916C6C70174B82326089AF7B7BFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8386863A79B11A81FF0D62
          BC3B5F7FB07D7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2698FF
          3DB0FF349DFF1C7EF80C62BA395E7FB07B7DFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF2996FF42ADFE349AFF1C7EF80C60B8405F7FB17D7BFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A96FE41AFFE349AFF1C7EF80C
          5FB83E5F7EB07B7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2A97
          FE41AFFE349AFF1A7BF80B5FB744627FA97A7EFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF2C98FE41ADFE349CFF197BF60C5EB62B587FFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D99FE41ADFE339CFF287FE7
          3D607BFF00FFFF00FFFF00FF996964996964996964996964996964FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2D
          9AFE4BB5FF8CBDEDAC9F966C565593665F996964DDCCABFFFFD9FFFFD9FFFFD7
          E9D5B6996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFD1ADA5B68775CCAB8CFFFFD3FFFFD3FF
          FFD0FFFFCFFFFFD0FFFFD3FFFFE2D4BAA4996964FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996B65D4AF8FFFEF
          B0FBEDB8FFFFCFFFFFCEFFFFCFFFFFD7FFFFDCFFFFEAFFFFFFD3BBB8996964FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          996964FFEAA6F2C78FFAEBB6FFFFD0FFFFCFFFFFD3FFFFE5FFFFF2FFFFFAFFFF
          FCFFFFFE996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF996964E6C9A0F6CA8BEEBA7FFBE7B4FFFFD0FFFFCFFFFFD7FFFFEB
          FFFFFEFFFFFCFFFFF2FFFFE5D8C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF996964FFEFADF0BC7DEBB075F7DDA7FEFCCBFF
          FFD1FFFFD5FFFFE6FFFFF6FFFFF6FFFFE6FFFFD7FFFFDA996964FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFF0AFEFBA7BE9A5
          6AF2C98FFCEFBCFFFFD1FFFFD3FFFFD9FFFFE1FFFFE2FFFFD9FFFFD3FFFFDA99
          6964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964
          FFF2B2F3C484E99E63EDB57AF4D79FFCF4C2FFFFD1FFFFD3FFFFD3FFFFD3FFFF
          D0FFFFCFFFFFD8996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF996964E6C9A0FCDE9EEFBA7EEEB779EFC284F6DAA1FBF2BFFFFFCF
          FFFFD1FFFFD0FFFFD0FFFFD1D9C6A5996964FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF996964FFFEC2FBEBCAF6D7ACF0C186EF
          BF82F3CC95FAE3ADFCF0BCFBF4C1FEF6C4FFFFD4996964FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF996964D7BB9EFFFF
          FFFEF7EEF6D8ACEDB474E9A76BEDB478F0C48AF6D49CFFF4B6D3B799996964FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF996964CEB6AFFFFFFFFFF4CBF6CF90F0BC7DF2BF81F7CE90FFEDA9D4B1
          93996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF996964996964E1C9A0FFF7B5FFF2AFFFF2B1
          E9CCA4996964996964FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99696499
          6964996964996964996964FF00FFFF00FFFF00FFFF00FFFF00FF}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnLocalizarClick
      end
      object btnExcluir: TTISButton
        Left = 516
        Top = 464
        Width = 71
        Height = 49
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Excluir'
        AutoSize = False
        ParentFont = False
        TabOrder = 33
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
      object btnAdicionar: TTISButton
        Left = 599
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Adicionar'
        AutoSize = False
        ParentFont = False
        TabOrder = 34
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          0A040000424D0A04000000000000CA0100002800000018000000180000000100
          08000000000040020000120B0000120B0000650000006500000000000000FFFF
          FF00FF00FF00FEFCFC0096351100FEFCFB0098441000BD580C00FEF7F200FEF8
          F300E97F1E00FEF3E900FEF4EB00FECF9F00FED9B400FEDAB600FEDDBB00FEDE
          BD00FEE6CE00FEEFE000FEF0E200FEF4EA00FEF6EE00FEF7F000FEFAF600FEFB
          F800FEFCFA00FECB9600FED3A500FED3A600FED5AA00FED7AB00FED7AC00FED7
          AD00FED9B000FED9B100FED9B200FEDAB400FEDCB800FEDEBC00FEE0BF00FEE1
          C100FEE2C400FEE3C600FEE5C900FEE6CB00FEE7CF00FEEAD400FEEAD500FEEB
          D700FEEEDD00FEF0E100FEF4E900FEEBD500FEEDD900FEEFDE00FEF3E600FEF7
          EF00FEEAD100FEEEDA00FEF2E300FEF4E700FEF8F000FEFBF700FEF6EB00FEFA
          F400FEFEFC00035A050006900E000793100007931100079211000A9714000C9C
          18000FA01D000EA01D000FA01E0011A6230014AC2A0015AC2A0018B4310018B2
          31001CBA38001CB8380021C0400020C0400024C6470028CC4E0028CC4F002CD1
          55002ED85B002FD75B002ED75B0031DA600032DC600032DA600034DE650000BD
          FF00FEFEFE00DCDCDC00FFFFFF00020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020243434343430202020202040404040404040404040404040443444444
          43040404020204403813363A2D2A110F221E1C0D43444444431B1B0402020409
          163D143B2F122B282624201D43474444431B1B04020204194117343C32352E2C
          29100E2143494845431B1B0402020404040404040404044343434343434D4C49
          434343434343046161616161616161435957565553514F4D4C49484644430461
          61616161616161435D5A5957565452504E4D4A49484304616161616161616143
          60605E5B5958565552514F4D4B430404040404040404044343434343435C5958
          4343434343430462626262626262033F09160B3343605F5C43231F0402020462
          62626262626262621A4139154360606043102504020204626262626262626262
          6205180843606060432A27040202040404040404040404040404040443606060
          4304040402020462626262626262626262626242434343434330120402020462
          626262626262626262626262621A183E0C373104020204636363636363636363
          6363636363636363636363040202040606060606060606060606060606060606
          060606040202070A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0702020207
          0707070707070707070707070707070707070702020202020202020202020202
          0202020202020202020202020202}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAdicionarClick
      end
      object btnRetornar: TTISButton
        Left = 683
        Top = 464
        Width = 71
        Height = 49
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
        Caption = 'Retornar'
        AutoSize = False
        ParentFont = False
        TabOrder = 35
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
      object btnAlterarFamCat: TTISButton
        Left = 552
        Top = 24
        Width = 192
        Height = 36
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Caption = 'Alterar Fam'#237'lia/Categoria'
        AutoSize = False
        ParentFont = False
        TabOrder = 36
        Transparent = False
        ModalResult = 0
        Layout = blGlyphLeft
        Spacing = 4
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAlterarFamCatClick
      end
      object btnAlterar: TTISButton
        Left = 640
        Top = 208
        Width = 118
        Height = 49
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Editar Dados'
        AutoSize = False
        ParentFont = False
        TabOrder = 37
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000FFFF
          FF0022212300534E5700FF00FF0041353800A4676900A5686B007A494A005A35
          35008B555500804E4E0091595900965D5D008B565600734747008C5757009560
          6000AA6E6E00A96D6D00A76C6C00A66B6B008C5B5B0091606000B77A7A00B679
          7900B87B7B00BB7E7E00BA7D7D009C696900CB8C8C00CA8B8B00C98B8B00C78A
          8A00CC8E8E00DA9A9A00D9999900C2898900D99A9A00DC9D9D00E1A1A100DA9C
          9C00E2A3A300EBAAAA00E2A4A400E1A3A300643B3A00734847007B504F005D38
          360093656000E2D0CE009566600093655F009869630084544C009F675B009E6E
          6400A3726600DDC7C200FBF7F6009D6D5F00865D51007350460062443C00A775
          68009F6F6000AC796900583F3700533C3500DDC4BC0096695A00B17E6B00FFFC
          FB00BB846E00B6816C00BCA19600DAC0B600BBA19600CB917300C58C7000C089
          6F00FCF8F600FAF6F400CF8E6800D4987500CF967400F6EEE900F8F3F000AA78
          56003C383500FEF7F200ECD5C200E1CCBB003E3935006A554200F2E2D300FAEE
          E300F4EAE100B77D460066523F0064513E0065524000EFDAC500F2E6DA00FBF2
          E900FEF7F000FDF8F300EAB2730062503D00604F3D00EED4B800F0DAC200F6E3
          CE00F0DECB00F7E6D300F4E3D000F8EEE300FBF3EA00EFA75100EDB57200EAB4
          7400F2D5B100E9CCAB00F4DEC500F4E1CA00F3E0CA00F7E7D400FAEAD700F8EA
          D900F7EADA00F8EBDC008E745100E5BC8400A4865F00B29268009E835F00E1BB
          88006C594100897253006A5841008E775900DEBB8C00AA8F6B00C6A67E007764
          4C00E1C09300C1A57F00836F5600E6C79D00C9AD89008C796000EDCEA700D9BD
          9900E6CEAF00F2DABC00EAD4B600F4DEC000AC9D8A00F6E1C600F7E5CE00F6E6
          D100F8EBDA00FAEEDE00FBF2E600E1B77900EABF7F00CCA66E00E9BD7F00E7BC
          7E00E5BB7D00DEB57900DAB17700D9B17600E3BA7D00D1AB7300C09C6900A989
          5D009A7E5500E7BC8100E1B77D00C7A36F00BC996900B2916300D1AB7500826C
          4B00987D5800DAB47F00C7A474007B664800B89A6F007E694C00766347006F5D
          4300D1AF7F009D876700F0D8B700EBD8BD00FCF6ED00FCF7F000E3BA7B00FEFB
          F600FFFAEF00FFFEFB00FFFEF700FFFFFE003A494800748686003443440000BD
          FF0000B1F2004E6C760000AAEA0000A6E600009FDE000093D100097BAB001A3E
          4D000087C4000084C100028AC4000B4159000C3C5200113B4E00008CD100036A
          9D0004689A000459830005679800064F7500182A33001B506E00315065003547
          56002A34400041485500012BA700001C9D002D4FF6005270FC00021DB100031E
          B1000420B8000725DC000F2ECC001839E3000C21BF00010D9D001322BD001624
          BF0001099700010A9700050DA50000058F00000082001F1F2100040404040404
          0404040404040404040404040404040404043506060606060606060606060606
          06060606060404040404356F9B7A9895928E8985B3A9A8A8A8A8A6A942040404
          0404355C9DC47B99969390C2BBB4AEA9A8A8A6A942040404040435679F9B9A02
          5E97C38FBEBCB8ABAAA9A6A94204040404043272A07C9C5AFFE6D0948D8887B5
          ADAEA9A942040404040434608071709EDFE2E5DECE918B86B6AFA5C842040404
          04043668A37F7DC5D9E1E4E7EA055FBFBAB7A7AC3D04040404043962A483737E
          CFE3E811120D2E66C084B1B04704040404043A57C675827372DD16221B120D2E
          65C1B9B23E04040404044158C9767583A1D31D271E1C130C096D8CBD3F040404
          04044353CD6B6975A274302C271E1C1310096E8A400404040404485301CB6A76
          61815D302A271F1A140E09644404040404044B530101495B7675835D2F2D2920
          1A140E314504040404044A53010101CB5B7661814E2F28232018150A09040404
          0404515301010101CB5B6961A24E2F28262118150A0904040404505301010101
          01496B7675814C172B2421190BEBE90404044F53010101010101CBC769A45C37
          172B2403DCD4D5DA0404563C0101010101010149C7CA4D38591725D8D1D1D5ED
          FE045552010101010101010149CC463879630FD6D1E0EDF7FBFE555201010101
          0101010101013B386C7708D7D2ECF3F2F0FB55CD010101010101010101013338
          78070404DBF6EEF4F1FD54545454545454545454545454380704040404F9EFF5
          FA040404040404040404040404040404040404040404F8FC0404}
        Layout = blGlyphLeft
        Spacing = 0
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAlterarClick
      end
      object btnBloqueia: TTISButton
        Left = 690
        Top = 420
        Width = 47
        Height = 25
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Bloqueia'
        AutoSize = False
        Visible = False
        ParentFont = False
        TabOrder = 38
        Transparent = False
        ModalResult = 0
        Layout = blGlyphTop
        Spacing = 5
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnBloqueiaClick
      end
      object dbeNCM: TDBEdit
        Left = 378
        Top = 236
        Width = 87
        Height = 21
        DataField = 'NCM'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 9
      end
      object fldCFOP: TDBEdit
        Left = 530
        Top = 236
        Width = 87
        Height = 21
        DataField = 'CFOP'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 10
      end
      object dbeIcms: TDBComboBox
        Left = 81
        Top = 237
        Width = 69
        Height = 21
        Style = csOwnerDrawFixed
        DataField = 'Icms'
        DataSource = dmBaseDados.dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 15
        Items.Strings = (
          '18'
          '0'
          '7'
          '12'
          '25')
        ParentFont = False
        TabOrder = 7
      end
      object dbeCST: TDBComboBox
        Left = 205
        Top = 237
        Width = 66
        Height = 21
        Style = csOwnerDrawFixed
        DataField = 'SituacaoTributaria'
        DataSource = dmBaseDados.dsProdutos
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 15
        Items.Strings = (
          '000'
          '010'
          '020'
          '030'
          '040'
          '041'
          '050'
          '051'
          '060'
          '070'
          '090')
        ParentFont = False
        TabOrder = 8
      end
    end
    object tabDescricao: TTabSheet
      Caption = 'Descri'#231#227'o/Caracter'#237'sticas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object lblCaracteristicas: TLabel
        Left = 0
        Top = 16
        Width = 117
        Height = 13
        Caption = 'Caracter'#237'sticas t'#233'cnicas:'
      end
      object lblQtdCaixa: TLabel
        Left = 8
        Top = 379
        Width = 108
        Height = 13
        Caption = 'Quantidade  por Caixa:'
      end
      object lblPeso: TLabel
        Left = 232
        Top = 379
        Width = 27
        Height = 13
        Caption = 'Peso:'
      end
      object fldCaracteristicas: TDBMemo
        Left = 120
        Top = 16
        Width = 649
        Height = 313
        DataField = 'Caracteristicas'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object fldQtdCaixa: TDBEdit
        Left = 120
        Top = 379
        Width = 81
        Height = 21
        DataField = 'QtdPorCaixa'
        DataSource = dmBaseDados.dsProdutos
        MaxLength = 3
        ReadOnly = True
        TabOrder = 1
      end
      object fldPeso: TDBEdit
        Left = 264
        Top = 379
        Width = 81
        Height = 21
        DataField = 'Peso'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 2
      end
    end
    object tabFoto: TTabSheet
      Caption = 'Foto do produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object scrlFoto: TScrollBox
        Left = 83
        Top = 21
        Width = 374
        Height = 340
        TabOrder = 0
        object DBImage1: TDBImage
          Left = 0
          Top = 0
          Width = 369
          Height = 335
          DataField = 'Imagem'
          DataSource = dmBaseDados.dsProdutos
          TabOrder = 0
        end
      end
    end
    object tabValor: TTabSheet
      Caption = 'Valores Custo/Venda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 3
      ParentFont = False
      object lblValorAnterior: TLabel
        Left = -1
        Top = 16
        Width = 113
        Height = 13
        Caption = 'Pre'#231'o de custo anterior:'
      end
      object lblDadaUltimaCompra: TLabel
        Left = 314
        Top = 72
        Width = 109
        Height = 13
        Caption = 'Data da '#250'ltima compra:'
      end
      object lblUltimoFor: TLabel
        Left = 507
        Top = 72
        Width = 89
        Height = 13
        Caption = #218'ltimo Fornecedor:'
      end
      object lblTaxaIpi: TLabel
        Left = -1
        Top = 128
        Width = 58
        Height = 13
        Caption = 'Taxa de IPI:'
      end
      object lblICMS: TLabel
        Left = 136
        Top = 128
        Width = 29
        Height = 13
        Caption = 'ICMS:'
      end
      object lblReducaoIcms: TLabel
        Left = 240
        Top = 128
        Width = 91
        Height = 13
        Caption = 'Redu'#231#227'o de ICMS:'
      end
      object lblSitTrib: TLabel
        Left = 432
        Top = 128
        Width = 92
        Height = 13
        Caption = 'Situa'#231#227'o Tribut'#225'ria:'
      end
      object lblComissao: TLabel
        Left = -1
        Top = 184
        Width = 48
        Height = 13
        Caption = 'Comiss'#227'o:'
      end
      object lblPremio: TLabel
        Left = 272
        Top = 184
        Width = 35
        Height = 13
        Caption = 'Pr'#234'mio:'
        Visible = False
      end
      object lblMargemMinima: TLabel
        Left = 565
        Top = 16
        Width = 135
        Height = 13
        Caption = 'Refer'#234'ncia de Contribui'#231#227'o :'
      end
      object Label1: TLabel
        Left = 152
        Top = 184
        Width = 44
        Height = 13
        Caption = 'Empresa:'
      end
      object Label4: TLabel
        Left = 170
        Top = 72
        Width = 63
        Height = 13
        Caption = 'Valor Futuro :'
      end
      object lblCustomedio: TLabel
        Left = 416
        Top = 184
        Width = 88
        Height = 13
        Caption = 'Valor Custo/M'#233'dio'
      end
      object Label17: TLabel
        Left = 359
        Top = 16
        Width = 124
        Height = 13
        Caption = 'Margem Comercializa'#231#227'o :'
      end
      object Label18: TLabel
        Left = 192
        Top = 16
        Width = 79
        Height = 13
        Caption = 'Pre'#231'o de Custo :'
      end
      object Label19: TLabel
        Left = 0
        Top = 72
        Width = 83
        Height = 13
        Caption = 'Pre'#231'o de Venda :'
      end
      object fldVlAnterior: TDBEdit
        Left = 112
        Top = 16
        Width = 65
        Height = 21
        DataField = 'ValorUnitarioAnterior'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 0
      end
      object fldDataUltimaCompra: TDBEdit
        Left = 428
        Top = 72
        Width = 73
        Height = 21
        DataField = 'DataUltimaCompra'
        DataSource = dmBaseDados.dsProdutos
        MaxLength = 10
        TabOrder = 3
      end
      object fldUltimoFor: TDBEdit
        Left = 600
        Top = 72
        Width = 153
        Height = 21
        DataField = 'UltimoFornecedor'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 4
      end
      object fldTaxaIpi: TDBEdit
        Left = 64
        Top = 128
        Width = 49
        Height = 21
        DataField = 'Taxaipi'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 5
      end
      object fldICMS: TDBEdit
        Left = 168
        Top = 128
        Width = 49
        Height = 21
        DataField = 'Icms'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 6
      end
      object fldReducaoIcms: TDBEdit
        Left = 336
        Top = 128
        Width = 65
        Height = 21
        DataField = 'ReducaoIcms'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 7
      end
      object fldSitTrib: TDBEdit
        Left = 536
        Top = 128
        Width = 49
        Height = 21
        DataField = 'SituacaoTributaria'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 8
      end
      object fldComissao: TDBEdit
        Left = 56
        Top = 184
        Width = 65
        Height = 21
        DataField = 'Comissao'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 9
      end
      object fldPremio: TDBEdit
        Left = 312
        Top = 184
        Width = 65
        Height = 21
        DataField = 'Premio'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 11
        Visible = False
      end
      object fldMargemMinima: TDBEdit
        Left = 702
        Top = 16
        Width = 57
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object fldEmpresa: TDBEdit
        Left = 204
        Top = 184
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Empresa'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 10
      end
      object fldValorFuturo: TDBEdit
        Left = 237
        Top = 72
        Width = 73
        Height = 21
        DataField = 'ValorFuturo'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 2
      end
      object edtValorCustoMedio: TDBEdit
        Left = 512
        Top = 184
        Width = 121
        Height = 21
        DataField = 'ValorCustoMedio'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 12
      end
      object DBEdit1: TDBEdit
        Left = 277
        Top = 16
        Width = 72
        Height = 21
        DataField = 'ValorUnitarioAtual'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 13
      end
      object DBEdit2: TDBEdit
        Left = 486
        Top = 16
        Width = 71
        Height = 21
        DataField = 'MargemLucro'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 14
      end
      object DBEdit3: TDBEdit
        Left = 85
        Top = 72
        Width = 72
        Height = 21
        DataField = 'ValorVenda'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 15
      end
    end
    object tabEstoque: TTabSheet
      Caption = 'Estoque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 4
      ParentFont = False
      object lblEstoqueMinimo: TLabel
        Left = 0
        Top = 16
        Width = 79
        Height = 13
        Caption = 'Estoque m'#237'nimo:'
      end
      object lblEstoqueMaximo: TLabel
        Left = 288
        Top = 16
        Width = 81
        Height = 13
        Caption = 'Estoque M'#225'ximo:'
      end
      object lblPontoReposicao: TLabel
        Left = 0
        Top = 56
        Width = 95
        Height = 13
        Caption = 'Ponto de reposi'#231#227'o:'
      end
      object lblEstoqueAtual: TLabel
        Left = 288
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Estoque Atual:'
      end
      object lblValEstoque: TLabel
        Left = 0
        Top = 96
        Width = 113
        Height = 13
        Caption = 'Valor Total em Estoque:'
      end
      object Label3: TLabel
        Left = 0
        Top = 141
        Width = 119
        Height = 13
        Caption = 'Valor Custo em Estoque :'
      end
      object Label5: TLabel
        Left = 288
        Top = 96
        Width = 78
        Height = 13
        Caption = 'Estoque Futuro :'
      end
      object Label6: TLabel
        Left = 288
        Top = 136
        Width = 93
        Height = 13
        Caption = 'Valor Custo Futuro :'
      end
      object lblEntrada: TLabel
        Left = 16
        Top = 176
        Width = 58
        Height = 13
        Caption = 'Quantidade:'
      end
      object lblNdocumento: TLabel
        Left = 16
        Top = 224
        Width = 71
        Height = 13
        Caption = 'N'#186' documento:'
      end
      object lblFornec: TLabel
        Left = 296
        Top = 176
        Width = 57
        Height = 13
        Caption = 'Fornecedor:'
        Visible = False
      end
      object lbldata: TLabel
        Left = 328
        Top = 216
        Width = 26
        Height = 13
        Caption = 'Data:'
      end
      object lblValcusto: TLabel
        Left = 16
        Top = 272
        Width = 72
        Height = 13
        Caption = 'Valor de Custo:'
      end
      object fldEstoqieMinimo: TDBEdit
        Left = 88
        Top = 16
        Width = 57
        Height = 21
        DataField = 'EstoqueMinimo'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 0
      end
      object fldEstoqueMaximo: TDBEdit
        Left = 376
        Top = 16
        Width = 57
        Height = 21
        DataField = 'EstoqueMaximo'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 1
      end
      object fldPontoReposicao: TDBEdit
        Left = 104
        Top = 56
        Width = 57
        Height = 21
        DataField = 'EstoqueReposicao'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 2
      end
      object fldEstoqueAtual: TDBEdit
        Left = 368
        Top = 56
        Width = 57
        Height = 21
        DataField = 'EstoqueAtual'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 3
      end
      object fldValEstoque: TDBEdit
        Left = 120
        Top = 96
        Width = 97
        Height = 21
        DataField = 'ValorEmEstoque'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 4
      end
      object fldVCustoEstoque: TDBEdit
        Left = 128
        Top = 136
        Width = 121
        Height = 21
        DataField = 'ValorCustoEstoque'
        DataSource = dmBaseDados.dsProdutos
        ReadOnly = True
        TabOrder = 6
      end
      object fldEstoqueFuturo: TDBEdit
        Left = 376
        Top = 96
        Width = 57
        Height = 21
        DataField = 'EstoqueFuturo'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 5
      end
      object fldValorCustoFuturo: TDBEdit
        Left = 384
        Top = 136
        Width = 97
        Height = 21
        DataField = 'ValorCustoFuturo'
        DataSource = dmBaseDados.dsProdutos
        TabOrder = 7
      end
      object fldEntrada: TEdit
        Left = 80
        Top = 176
        Width = 49
        Height = 21
        TabOrder = 8
        OnExit = fldEntradaExit
      end
      object fldValCusto: TEdit
        Left = 104
        Top = 272
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 10
      end
      object btnCalcular: TButton
        Left = 288
        Top = 240
        Width = 193
        Height = 25
        Caption = 'Confirmar movimenta'#231#227'o no estoque'
        TabOrder = 13
        OnClick = btnCalcularClick
      end
      object fldNdocumento: TEdit
        Left = 96
        Top = 224
        Width = 121
        Height = 21
        MaxLength = 8
        ReadOnly = True
        TabOrder = 9
      end
      object DateTimePicker1: TDateTimePicker
        Left = 360
        Top = 216
        Width = 129
        Height = 21
        Date = 39059.477324398110000000
        Time = 39059.477324398110000000
        TabOrder = 12
      end
      object rbEntrada: TRadioButton
        Left = 152
        Top = 168
        Width = 113
        Height = 17
        Caption = 'Entrada'
        Checked = True
        TabOrder = 14
        TabStop = True
        OnClick = rbEntradaClick
      end
      object rbSaida: TRadioButton
        Left = 152
        Top = 184
        Width = 113
        Height = 17
        Caption = 'Saida'
        TabOrder = 15
        OnClick = rbSaidaClick
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 360
        Top = 176
        Width = 177
        Height = 21
        DataField = 'ClienteFornecedor'
        DataSource = dmBaseDados.dsHistorico
        KeyField = 'CodigoFornecedor'
        ListField = 'NomeFantasia'
        ListSource = dmBaseDados.dsFornecedores
        ReadOnly = True
        TabOrder = 11
        Visible = False
      end
      object BitBtn1: TBitBtn
        Left = 288
        Top = 272
        Width = 193
        Height = 42
        Caption = 'Atualiza Valores em Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
          FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
          007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
          7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
          99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Conta Corrente Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 5
      ParentFont = False
      object grdContaCorrenteProduto: TDBGrid
        Left = 0
        Top = 0
        Width = 753
        Height = 337
        DataSource = dmBaseDados.dsHistorico
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CodigoProduto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ClienteFornecedor'
            Title.Caption = 'Cliente Fornecedor'
            Width = 284
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumeroRequisicao'
            Title.Caption = 'Documento'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Quantidade'
            Title.Caption = 'Qtde'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorLancamento'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataLancamento'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Status'
            Width = 40
            Visible = True
          end>
      end
      object Button1: TButton
        Left = 279
        Top = 345
        Width = 195
        Height = 25
        Caption = 'Atualizar Conta Corrente Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
end
