object formClientes: TformClientes
  Left = 248
  Top = 48
  BorderStyle = bsDialog
  Caption = 'Cadastro de Clientes'
  ClientHeight = 583
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgClientes: TPageControl
    Left = 9
    Top = 9
    Width = 719
    Height = 561
    ActivePage = tabFichaCliente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object tabFichaCliente: TTabSheet
      Caption = 'Ficha do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object lblNomeCliente: TLabel
        Left = 188
        Top = 8
        Width = 73
        Height = 14
        Caption = 'Raz'#227'o Social :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSituacao: TLabel
        Left = 624
        Top = 8
        Width = 49
        Height = 14
        Caption = 'Situa'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCIC: TLabel
        Left = 496
        Top = 208
        Width = 58
        Height = 14
        Caption = 'CNPJ/CPF.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblRG: TLabel
        Left = 304
        Top = 208
        Width = 42
        Height = 14
        Caption = 'I.E./R.G.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDataCadastro: TLabel
        Left = 512
        Top = 48
        Width = 99
        Height = 14
        Caption = 'Data do Cadastro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEndereco: TLabel
        Left = 4
        Top = 88
        Width = 55
        Height = 14
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNumero: TLabel
        Left = 368
        Top = 88
        Width = 47
        Height = 14
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblComplemento: TLabel
        Left = 480
        Top = 88
        Width = 82
        Height = 14
        Caption = 'Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBairro: TLabel
        Left = 4
        Top = 128
        Width = 36
        Height = 14
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCidade: TLabel
        Left = 392
        Top = 128
        Width = 41
        Height = 14
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEstado: TLabel
        Left = 4
        Top = 168
        Width = 40
        Height = 14
        Caption = 'Estado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCEP: TLabel
        Left = 88
        Top = 168
        Width = 27
        Height = 13
        Caption = 'CEP.:'
      end
      object lblFax: TLabel
        Left = 160
        Top = 208
        Width = 21
        Height = 14
        Caption = 'Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTelefone: TLabel
        Left = 4
        Top = 208
        Width = 30
        Height = 14
        Caption = 'Fone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContato: TLabel
        Left = 208
        Top = 168
        Width = 46
        Height = 14
        Caption = 'Contato:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEmail: TLabel
        Left = 4
        Top = 248
        Width = 35
        Height = 14
        Caption = 'E-Mail:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblLogistica: TLabel
        Left = 368
        Top = 288
        Width = 53
        Height = 14
        Caption = 'Log'#237'stica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblObs: TLabel
        Left = 0
        Top = 344
        Width = 28
        Height = 14
        Caption = 'Obs.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblRamoAtividade: TLabel
        Left = 496
        Top = 288
        Width = 105
        Height = 14
        Caption = 'Ramo de Atividade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCobranca: TLabel
        Left = 0
        Top = 288
        Width = 99
        Height = 14
        Caption = 'Tipo de Cobran'#231'a:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblDtUltCompra: TLabel
        Left = 144
        Top = 288
        Width = 110
        Height = 14
        Caption = 'Data Ultima Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigoIbge: TLabel
        Left = 472
        Top = 168
        Width = 69
        Height = 14
        Caption = 'C'#243'digo IBGE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblZona: TLabel
        Left = 352
        Top = 320
        Width = 30
        Height = 14
        Caption = 'Zona:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigoCliente: TLabel
        Left = 0
        Top = 8
        Width = 101
        Height = 14
        Caption = 'C'#243'digo do Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtCodigoCliente: TDBText
        Left = 104
        Top = 8
        Width = 73
        Height = 17
        Alignment = taCenter
        DataField = 'CodigoCliente'
        DataSource = dmBaseDados.dsClientes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNire: TLabel
        Left = 416
        Top = 248
        Width = 39
        Height = 14
        Caption = 'N'#186' Nire:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipoCliente: TLabel
        Left = 496
        Top = 312
        Width = 69
        Height = 14
        Caption = 'Tipo Cliente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblChekout: TLabel
        Left = 568
        Top = 248
        Width = 64
        Height = 14
        Caption = 'N'#186' Chekout:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label1: TLabel
        Left = 496
        Top = 336
        Width = 70
        Height = 14
        Caption = 'Cliente RPA :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 4
        Top = 48
        Width = 86
        Height = 14
        Caption = 'Nome Fantasia :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbllimitecredito: TLabel
        Left = 3
        Top = 322
        Width = 99
        Height = 14
        Caption = 'Limite de Credito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object fldNomeCliente: TDBEdit
        Left = 264
        Top = 8
        Width = 345
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomeCliente'
        DataSource = dmBaseDados.dsClientes
        MaxLength = 10000
        TabOrder = 1
      end
      object fldSituacao: TDBEdit
        Left = 677
        Top = 8
        Width = 17
        Height = 21
        Hint = 
          '|Digite '#39'A'#39' para Clientes Ativos, '#39'I'#39' para Clientes Inativos, '#39'C' +
          #39' para Clientes Cancelados ou '#39'B'#39' para Clientes Bloqueados.'
        CharCase = ecUpperCase
        DataField = 'Situacao'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 2
      end
      object fldCIC: TDBEdit
        Left = 565
        Top = 208
        Width = 129
        Height = 21
        DataField = 'NumeroCIC'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 15
      end
      object fldRG: TDBEdit
        Left = 360
        Top = 208
        Width = 121
        Height = 21
        DataField = 'NumeroRG'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 14
      end
      object fldDataCadastro: TDBEdit
        Left = 613
        Top = 48
        Width = 81
        Height = 21
        DataField = 'DataCadastro'
        DataSource = dmBaseDados.dsClientes
        MaxLength = 8
        TabOrder = 3
      end
      object fldEndereco: TDBEdit
        Left = 64
        Top = 88
        Width = 297
        Height = 21
        CharCase = ecUpperCase
        DataField = 'EnderecoResidencia'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 4
      end
      object fldNumero: TDBEdit
        Left = 421
        Top = 88
        Width = 49
        Height = 21
        DataField = 'Numero'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 5
      end
      object fldComplemento: TDBEdit
        Left = 565
        Top = 88
        Width = 129
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Complemento'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 7
      end
      object fldBairro: TDBEdit
        Left = 48
        Top = 128
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Bairro'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 6
      end
      object fldCidade: TDBEdit
        Left = 440
        Top = 128
        Width = 254
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Cidade'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 8
      end
      object fldCEP: TDBEdit
        Left = 120
        Top = 168
        Width = 73
        Height = 21
        DataField = 'CEP'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 10
      end
      object fldFax: TDBEdit
        Left = 184
        Top = 208
        Width = 113
        Height = 21
        DataField = 'Fax'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 13
      end
      object fldTelefone: TDBEdit
        Left = 40
        Top = 208
        Width = 113
        Height = 21
        DataField = 'Telefone'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 12
      end
      object fldContado: TDBEdit
        Left = 256
        Top = 168
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Contato'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 11
      end
      object fldEmail: TDBEdit
        Left = 48
        Top = 248
        Width = 361
        Height = 21
        DataField = 'E-mail'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 0
      end
      object fldLogistica: TDBEdit
        Left = 429
        Top = 288
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Logistica'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 17
      end
      object fldObs: TDBMemo
        Left = 8
        Top = 360
        Width = 681
        Height = 65
        DataField = 'Obs'
        DataSource = dmBaseDados.dsClientes
        ScrollBars = ssBoth
        TabOrder = 25
      end
      object fldRamoAtividade: TDBEdit
        Left = 605
        Top = 288
        Width = 89
        Height = 21
        DataField = 'RamoAtividade'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 19
      end
      object fldCobranca: TDBEdit
        Left = 105
        Top = 288
        Width = 25
        Height = 21
        DataField = 'Cobranca'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 21
      end
      object fldDtUltCompra: TDBEdit
        Left = 259
        Top = 288
        Width = 81
        Height = 21
        DataField = 'DataUltimaCompra'
        DataSource = dmBaseDados.dsClientes
        MaxLength = 8
        ReadOnly = True
        TabOrder = 22
      end
      object fldCodigoIbge: TDBEdit
        Left = 549
        Top = 168
        Width = 145
        Height = 21
        DataField = 'CodigoIBGE'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 16
      end
      object fldEstado: TDBEdit
        Left = 48
        Top = 168
        Width = 33
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Estado'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 9
        OnExit = fldEstadoExit
      end
      object dbZona: TDBComboBox
        Left = 392
        Top = 320
        Width = 81
        Height = 21
        DataField = 'Zona'
        DataSource = dmBaseDados.dsClientes
        ItemHeight = 13
        Items.Strings = (
          'NORTE'
          'SUL'
          'LESTE'
          'OESTE')
        TabOrder = 18
      end
      object fldNire: TDBEdit
        Left = 464
        Top = 248
        Width = 89
        Height = 21
        DataField = 'Nire'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 23
      end
      object DBComboBox1: TDBComboBox
        Left = 581
        Top = 312
        Width = 113
        Height = 21
        DataField = 'TipoCliente'
        DataSource = dmBaseDados.dsClientes
        ItemHeight = 13
        Items.Strings = (
          'EPP'
          'LTDA'
          'ME'
          'RPA'
          'CPF')
        TabOrder = 20
      end
      object fldChekout: TDBEdit
        Left = 645
        Top = 248
        Width = 33
        Height = 21
        DataField = 'NChekout'
        DataSource = dmBaseDados.dsClientes
        MaxLength = 2
        TabOrder = 24
        Visible = False
      end
      object fldNomeFantasia: TDBEdit
        Left = 96
        Top = 48
        Width = 393
        Height = 21
        CharCase = ecUpperCase
        DataField = 'NomeFantasia'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 26
      end
      object DBComboBox2: TDBComboBox
        Left = 581
        Top = 336
        Width = 57
        Height = 21
        DataField = 'RPA'
        DataSource = dmBaseDados.dsClientes
        ItemHeight = 13
        Items.Strings = (
          'SIM'
          'NAO')
        TabOrder = 27
      end
      object fldLimiteCredito: TDBEdit
        Left = 112
        Top = 320
        Width = 137
        Height = 21
        DataField = 'LimiteCredito'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 28
      end
      object btnPrimeiro: TTISButton
        Left = 0
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Primeiro'
        AutoSize = False
        ParentFont = False
        TabOrder = 29
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
        Left = 68
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Anterior'
        AutoSize = False
        ParentFont = False
        TabOrder = 30
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          2E060000424D2E06000000000000EE0300002800000018000000180000000100
          08000000000040020000120B0000120B0000EE000000EE00000000000000FFFF
          FF00FF00FF00012F0100EDF8ED00FEFFFE000144030001430300013802000136
          020001350200025604000132020002550400024E040002460400034D0500019C
          0800019C070001590500029D0A00014B04000149040001460400039E0B00039A
          0B000275070002700700026C0700026A0600014003000387090003810900025E
          050002560600037F0900037B0900037509000366070002440500035D0600023D
          0400046D0800034F07000341060003A70C0003A40C0003A10C00039E0C00039D
          0D00049F0F00049E0D0006A0120007A1110008A11100055F0C000AA314000AA3
          130012A71C001EAD29001FAF2A001FAD2A0064CB6C0095DC9A00D7F2D900049F
          110005A5120005A0140005A0120004750D0006A4150006A1140004540B000670
          0F0009A316000F921C001C9E280028A132006ECF77007ED486008ED9950092DC
          990097DD9D009ADEA000A7E3AD0007A9180007A3170007A1170008A3190009B0
          1C00055F0F000E8B1C00149C24001597240023B0320024B1340009A61D000AA4
          1F000BA521000769140007671300ACE5B400D5F2D9000CAD27000BA523000CA7
          26000CA724000A761C0019A02F001BA03100F6FCF7000CA729000DA928000FB0
          2D000EA72A000FA92B000FA62C000D80230013AB2F0014912B0019A331001A96
          30008EDA9C000DA92C000FAA2F000FAA300010A92F0011AA310014AC330015AD
          350016AD3500D7F3DD0010AA320012AD340012AB350013AC370013AC380013AB
          360016AC3A0013902F00169132001D9A390023A1400026A9430028A9460014B8
          3C0016B23D0016AD3E001CB1420013AC3E0015A63C0018B1410014AF410017B0
          460019B0450020B74C001FAF490039BF620049C16C004FC47300DCF4E30014AF
          460015B0480016AF49001AB14C001CB850001BB24C001CB24E001FB4510020B4
          510022B6530023B5540029B859002EBA5A0042C26A0052C778006BD18B00EFFB
          F300F6FCF80016AF4A0021BA560021B5530026B6570028B85A0030BC620035BC
          640037BF670039BF68003CC06B003EC06C0042C26F004DC7770050C6790076D5
          980088DCA600A1E2B800D7F3E100EAF8EF002ABF60003BC46D0043C5730049C5
          760051C77D0058CC84005ACE860059CB82005ACB83005DCB860064CF8B006FD3
          930073D498008CDCAA008EDDAB009DE1B700A4E3BC00B1E9C600C5EFD500C9EF
          D700D0F2DD00F0FBF4005CD089006CD495006DD5970076D89D0081D9A4008ADE
          AC00A7E6C000BDEDD000BDEBCF00D5F3E100E3F7EB0095E2B500B2E9C900DAF4
          E5009AE3BA00F2FBF600B5EACE00F8FCFA0002020202020202020C0C0A1E1E0A
          0C0C0202020202020202020202020202030C061D231F1F201B150A0C02020202
          020202020202020F071A192D2E2F2F2E2D30230E0A0202020202020202022B22
          312D2F303030303030302D2F2609020202020202024837554233301811121830
          3030302F2D1C090202020202295A6760573430143030303030303030302D1D0A
          020202022C747168605630365204043E30303030302F2E16020202106B917D70
          614138530101014E3030303030302D240A0202109697877243353F0101015139
          303030303030302F06020D64A599936F4A500101054F3030303030303030302D
          21080B75B4A698947A010101545F5E3D3B3B3B3B3C3A182D1A08288BC6A8AAD4
          01010101DB6EED6E6E6E6E6E6E66182D2309268DC8B6B5EB0101010101010101
          010101010105302E20172A8DDCBBB5D0B2010101E6E5A083666666664065322D
          23082579DECCA9B5CEDB0101D99D8882818180767673472D1B08025BDDC2C7B3
          ABCAC50101C4AE867D7D7C7C7B62442D1302024B9EE2C1ACA2A8C9E60101B1AF
          847D7369625846321E0202026DEAD7CFABA1A8BEE90101C388897E736A615945
          020202024D9EECD7CDACA3A8BCE4E6BF9595897F7367612702020202025CB0D8
          E3D2BDA8A7B7B5A4A69A978A85715A020202020202025DDDD8DAD6D1C0BBB8B9
          BABAAD9B92640202020202020202024C9FEAE3D8E8D5D3E0D2CBC79C63020202
          02020202020202024C78C0E0E7E7E1DFCCB98C37020202020202020202020202
          02024C6C8F8F908E77490202020202020202}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAnteriorClick
      end
      object btnProximo: TTISButton
        Left = 137
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Pr'#243'ximo'
        AutoSize = False
        ParentFont = False
        TabOrder = 31
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          1A060000424D1A06000000000000DA0300002800000018000000180000000100
          08000000000040020000120B0000120B0000E9000000E900000000000000FFFF
          FF00FF00FF00012F0100EDF8ED00FEFFFE000144030001430300013802000136
          020001350200025604000132020002550400024E040002460400034D0500019C
          0800019C070001590500029D0A00014B04000149040001460400039E0B00039A
          0B000275070002700700026C0700026A0600014003000387090003810900025E
          050002560600037F0900037B0900037509000366070002440500035D0600023D
          0400046D0800034F07000341060003A70C0003A40C0003A10C00039E0C00039D
          0D00049F0F00049E0D0006A00F0007A1130007A11100055F0C000AA313001FAD
          2A0064CB6C00049F110005A5120005A0140005A0120004750D0006A4150006A1
          140004540B0006700F000F921C001C9E280021AF2D0023B1310028A132006ECF
          770077D17F007ED4860084D78B008CD9930092DC990093DC9A0097DD9D009ADE
          A000A5E2AA00EEFAEF0007A9180007A3170007A1170008A3190009B01C00055F
          0F000E8B1C00149C24001597240023B0320024B1340026B237004AC1570009A6
          1D000AA41F000BA52100076914000767130028B43B00DEF4E100F3FBF4000CAD
          27000BA523000CA726000CA724000A761C0019A02F001BA031002DB643000DA9
          28000DA729000FB02D000EA72A000FA92B000FA62C000D80230014912B0019A3
          31001A963000CFF0D5000DA92C0010A92F0011AA310036BB5300F7FCF80012AD
          340013AC380013AC370013AB360016AC3A0013902F00169132001D9A390023A1
          400026A9430028A946002DB84D0040C05E0047C1620014B83C0016B23D0016AD
          3E0034BA5600C1EDCC0013AC3E0015A63C0018B141002DB85200E0F6E60014AF
          410017B0460019B0450020B74C001FAF490021B44C002DB8570049C16C004FC4
          7300D3F2DC00DCF4E300E6F7EB0014AF460015B0480016AF49001AB14C001CB8
          50001BB24C001CB24E001FB4510020B4510022B6530029B859002EBA5A0042C2
          6A006BD18B00D7F3E000EFFBF30016AF4A0021BA560021B5530022B5540023B6
          550026B6570028B85A0028B7590030BC620035BC640037BF670039BF68003EC0
          6C004DC6780050C6790076D5980088DCA6002ABF60003BC46D0043C5730058CC
          84005ACE860058CA810059CB82005DCB86006FD3930073D498008CDCAA009DE1
          B700A4E3BC00B1E9C600BAEACC00C5EFD500D0F2DD00E2F7EA005CD089006CD4
          95006DD5970076D89D0081D9A4008ADEAC00A1E3BB00A7E6C000BDEDD000BDEB
          CF0095E2B500B2E9C900DCF4E6009AE3BA00B5EACE00F8FCFA00F7FCFA000202
          0202020202020C0C0A1E1E0A0C0C0202020202020202020202020202030C061D
          231F1F201B150A0C02020202020202020202020F071A192D2E2F2F2E2D30230E
          0A0202020202020202022B22312D2F303030303030302D2F2609020202020202
          024237543C333018111218303030302F2D1C09020202020229596961563E3014
          3030303030303030302D1D0A020202022C76736A61553030303A040450363030
          302F2E16020202106D8F7D71623B3230304901010151363030302D240A020210
          959683743D32333330384E0101014F343030302F06020D65A99A917235303030
          3030304B0501014D3230302D21080B77B6AA999770465F66475E5D3952010101
          4C30182D1A082886C6ACAEE4E780E8E8E8E8E76853010101014A182D23092688
          C8BAB7050101010101010101010101010153302E20172A88D8C0B7D4E4E4E4E4
          E4E4A37B670101016860322D2308257ADACAADB9BCBCBCBCBC9E828C930101B4
          8E72412D1B08025AD9C5C7B5B8B7B7B7B8ACB1A20101A48D7C633E2D13020244
          A0DFC4AFA6ACB7B7B7CBB40101987F6B635740321E0202026FE5D3CDB8A5ACB7
          B7DE0101B3927D756C62583F0202020248A0E6D3CCAFA7ACB7C2D7E19F94847E
          7569622702020202025BB2D5E0CFC1ACABBBB7A8AA9B96858173590202020202
          02025CD9D5D6D2CEC3C0BDBEBFBFB09C906502020202020202020245A1E5E0D5
          E3D1D0DCCFC9C79D6402020202020202020202024579C3DCE2E2DDDBCABE8737
          0202020202020202020202020202456E8A8A8B8978430202020202020202}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnProximoClick
      end
      object btnUltimo: TTISButton
        Left = 205
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = #218'ltimo'
        AutoSize = False
        ParentFont = False
        TabOrder = 32
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
        Left = 274
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Gravar'
        AutoSize = False
        ParentFont = False
        TabOrder = 33
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
        Left = 343
        Top = 433
        Width = 67
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Localizar'
        AutoSize = False
        ParentFont = False
        TabOrder = 34
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          62060000424D6206000000000000220400002800000018000000180000000100
          08000000000040020000120B0000120B0000FB000000FB00000000000000FFFF
          FF00706C7D00FF00FF0087707800897278007A696D0093757B008A7376008F73
          7600F6F0F000FEFCFC007B585600DACAC900966A6700986D6900D5BFBD00DECF
          CE00804A440095676200AA7974009A6E69009D736E00B5969300C5AAA700F468
          55008C5E58009E6E67009C6F6900B6969200FCD9D400E94B2F00E1462D008F5C
          530099675E0093676000A1777000A5807A00F7634400F8654500F86B4D00FBA9
          980097696000B2817700A0746B00FBBDB000AD827900FBC6BC00E5593A00F769
          4600F86C4900FA6E4B0093655A00A57469009F736900A0766C00B0847A00C9AF
          A90096605100AA796B00AB7A6D00C9ACA400BA390F00E1896E00B1867900AD35
          0900894F3A006E2D1300D49C8200B85B2D00C9927700B5907D00CCB5A900BD95
          7E007B390F00CEA58C0075706D00BC4B0000B8490000A6420000883600007830
          0000BA4B0100AA470500D0A78C00CBA48A00AC673500D3B29A00D9640100EAA3
          6500DCB89800FEF0E300FEF4EB00EAAB6C00EBAF7400EBB07600BC997500CFAF
          9000FEE7D100FEEAD700F6EADE00FEF8F200FEFAF600FEFBF800EDAF6D00E9AB
          6B00EDBD8B00E7BA8900BC976F00B18E6900A1815F00EDBF8E00B18F6A00B190
          6B00E7BC8E00BC9A7600CBA78100A1866900E3BD9500A1896E00D9C1A700FEE5
          CA00FEE9D300FEEDDA00FEEEDD00FEF0E100FEF2E500FEF3E700F3EBE200EFC0
          8600AC907000FEE7CC00FEE9CF00FEE9D100FEEBD500FEEDD900FEEFDE00F0BF
          8000F0C48B00F0C99700FEEEDA00FEF7EE00F8CB8800F4C78900F4CE9800EACC
          A000DDCCB400FEF4E500F4D19900E2C79C00FBD59000F3CF9300DAC7A700E3D3
          B600FFDD9D00EFD7A700FFDE9A00FEE2A400FCE2A700F6DDA500FFE19C00F7E3
          AF00FCEBB600FFEBA700FFEDAB00F2E7C200FEEEB200FCEEB600F8EBB600FEF2
          B200FCF3C100FBF4D000F2EDCF006B695D00FEF7C500F2EDCC00FEFAC900FFFC
          C700FEFCDD00FCFAC900FFFFC500FFFFCB00FFFFCC00FFFFCE00FFFFD000FFFF
          D300FFFFD400FFFFD900FFFFE600FFFFEB00FFFFFA00E6E7E700C0D8E3001278
          B000157BB600187DB4002379AA00669FBF00BAD8E9001B7AB4001B77B0002873
          9F004588AF00EAF2F700065589001363970059B5F40045515900BDDAEE00004B
          8200055A9700085F9F00116EB50035AAFF0041AFFF0040ABFC0040ABFB004490
          C700B5CAD90033A0FB003CA7FC008BABC600175A97002F9CFF00309CFB001F5D
          9700359EFF00389FFF006EB8FC003B608200486B8B00175EA5002890FA00185A
          99002B93FE003296F8007F8489001F73CF001A5DA7002D8CF2003590EE00358A
          E7003A8EE5000C67D3001074F0001073EB001073E900558AD800B4B5C700FEFE
          FE00FCFCFC000303030303034CCF020303030303030303030303030303030303
          03030303ECEEE7040303030303030303030303030303030303030303D9D5F4DE
          05030303030303030303030303034D4D4D4D4D4DF2D8E3F5E90851504F4E4D4D
          4D4D4D4D4D034D7F5B7C636279F1D7E2F6E1097573726F6B6B6B6B6A4E034D8D
          5C7E88877A83F0D6EAF3E50782746071706D6D6C4F034D66658D7F7D8C8684EF
          DCDFEDE677122A362C1B146E50034D0B4543434343434485ADCEDD060C4799AB
          A57840344A034DF9411F26281920437B4DDA382B95B9BBB9B8B9BC3D21034DF9
          3E31271E2F30435B4D482276A4A7B7B7B6B4BCF90E034DF93F3229012D33465C
          4D2E3B9D8FA1B8B7B7B5BABD920E4DF9F9F7C8C7C4F88065521C4B9A5E9FB8B8
          B7B7B6B7AC0E4DF9E4E8E8E8E8EBBF6752135A9C5981AABAB7B7B7B6B20E4DF9
          C3E0E0E0E0C2D00B521655A3686994AEBAB8B8B8AF0E4DF9D2DBDBDBDBC1C6F9
          4D1D3CA6A28B8997A8B0B3B9980E4DF9CAD2D3D3D4CDF9F94D0D1557BE93905D
          5F8A9EB40E034DF9CBC5CCD1C9C0F9F94DFA563A1001B1968EA0A94942034DF9
          F9F9F9F9F9F9F9F94DF90A180E37619B9154352453034DF9F9F9F9F9F9F9F9F9
          4DF9F90B11170F1A232539644D034D5858585858585858585858585858585858
          585858584D034D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D03034D
          4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          030303030303}
        Layout = blGlyphTop
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnLocalizarClick
      end
      object btnExcluir: TTISButton
        Left = 420
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Excluir'
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
        Left = 491
        Top = 433
        Width = 64
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Adicionar'
        AutoSize = False
        ParentFont = False
        TabOrder = 36
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
      object btnAlterar: TTISButton
        Left = 290
        Top = 489
        Width = 149
        Height = 35
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
        Caption = 'Alterar Cadastro'
        AutoSize = False
        ParentFont = False
        TabOrder = 37
        Transparent = False
        ModalResult = 0
        Glyph.Data = {
          76060000424D7606000000000000360400002800000018000000180000000100
          08000000000040020000120B0000120B0000000100000000000000000000FFFF
          FF00383739006E697200FF00FF005B4E5200B8828500B781830093646500764E
          4E0098696900A7747400AB777700A2717100A1707000AB787800A3727200BB87
          8700B9858500BC888800AA7B7B00A3767600A77B7B00C9959500C7939300CA96
          9600B0838300D6A2A200D8A4A400D7A3A300D4A1A100D0A0A000E5B1B100E4B0
          B000E3AFAF00E2AEAE00E9B6B600E8B5B500F0BCBC00E7B5B500EFBCBC00754E
          4D007E555400754F4E008C636200946B6A0078525000A97F7A00AA807B00A97F
          7900AD837D00E9DBD9009C6F6700B3817600B2887E00E5D4D000BA8E8200B68B
          80006E564F00B1877A009D786C008C6B61007C5F560073595100E5D1CB00B389
          7B00AB837500BE928300FCF9F800FBF8F700C2968500E3CEC600CA9C8800C699
          8600CEA08900CAB5AB00FAF6F400FFFDFC00D7A78C00D2A38A00DAA48200DEAD
          8E00DAAB8D00EEDDD100F8F2EE00FDFAF800FCF9F700BC91710056524F00FEF9
          F500E8D8CA00F7EFE800FCF5EF0084705D00F2E0CE00F4E6D80058534E00F5E9
          DD00FAEFE400FBF2E900F5ECE300FAF2EA00FCF6F000FEFAF600FFFDFB00C795
          6100806D59007E6C58007F6D5A007B6A5700F2DEC800F4E3D000F3E3D200F4E5
          D500FAEFE3007C6B5700EED8BD00BEB1A100F7E6D200F7E8D600F6E7D600F7EA
          DB00F9ECDD00FAF0E400F9EFE300FCF6EF00F3BA6C00F1C58B00EFC38C00EFC4
          8D00B79D7A0086745C00D3B99600907E67009B897100A3927B00F1D9BA00E2CC
          AE00F5DFC200F4E1C700ECD9C000F7E3CA00F4E2CB00F8E8D300F9EBD900FBEF
          E000F9EDDE00FAF0E300FBF2E600FCF5EC00FDF9F400CEB08300C3A77D00BBA0
          7800EDCB9900D4B68900CBAE8300A48D6C00EBCB9C00E3C49700D4B78D00C3A8
          8200AD95730094806300E8CA9F00DCC09700B29B7A00968367008F7D6200A08B
          6E0084735B00E6CAA300BCA58500A4907400E8CEA900CFB89700ECD4B100D5BF
          A000EFDEC600F7E6CE00F0E1CC00FCF5EB00FDF8F100E8C79200E2C28F00D8B9
          8800EECC9700EDCB9600EBCA9500E6C59200E3C29000DCBD8C00EAC99500AF96
          7000E8C79500DCBD8E009A866600C8AF890089785E00B19E8100FDFAF500FFFB
          F300FEFCF800FFFEFC00FFFEF900FFFFFE00546463008D9D9D004D5E5F0000CC
          FF0000C2F50000BCEF0000B9EC0000B3E60000A9DC00009ED100019CCF0007A1
          D1001594BD0069868F0000A3DC000A84B1000B749B00185B74000C82AF000D81
          AD00106A8E001A566D00225569002E5868002C424C002F6B88004A6B7F004F62
          7100424D5A000443BA005C6370000130B1000732C2000833C2000C36C8001E47
          D800113CE4002B53EA00456AF8006D8AFD001A37CD00041CB1000316AC000515
          AC002538CC00293BCD00020EA5000E1BB80000009A0035353700040404040404
          0404040404040404040404040404040404043107070707070707070707070707
          070707070704040404042F6E8D8A88B0AEABA49E9ABBBABABABABABB41040404
          04042F5EB38B7489B1AF84A59FC2C0BBBABABABB4104040404042F708F8E8C02
          6087C7ACC5A0C3BDBCBBBABB4104040404042F5F9076B258FFE6D086ADA6A19B
          B8C0BBBB410404040404306191906F75E4E0E2E3CE85A9829CBFB7C041040404
          04043264949277B4E5DDE1E7EA055DA7A298B9BE3B0404040404365B95627A78
          CFDEE814130F2A6CA89D99974204040404043954B6657C7A71DF151C19130C2A
          6BC6C4C13C0404040404384CCA66657B7ADB1A201D17110B2973AAA33D040404
          04044345CD675C6593792D24201D171110296D833E0404040404464501CB597D
          63725A2D24211B17110D096A3F0404040404494501014D5966657B5A2C24211B
          17110D2E3A04040404044845010101CB597D63724B2C25221E18120E2B040404
          04044A5601010101CB595C63934B2C27221E18120E09040404044F5601010101
          014DC87D63724B1626231E180AECE90404044E56010101010101CB965CB55334
          16282303D9D3D4D704045244010101010101016896C9473557161FDAD1D1D4ED
          FE04515501010101010101014DCC403581692CD5D1DCEDF7F8FE515501010101
          0101010101013735807E08D6D2EBF2F0EEF851CD010101010101010101013335
          7F060404D8F6F4F1EFFC50505050505050505050505050350604040404FBF5F3
          F9040404040404040404040404040404040404040404FAFD0404}
        Layout = blGlyphLeft
        Spacing = 1
        ResHandle = 0
        MouseContinuouslyDownInterval = 100
        OnClick = btnAlterarClick
      end
      object btnImprimeCliente: TTISButton
        Left = 565
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Imprimir'
        AutoSize = False
        ParentFont = False
        TabOrder = 38
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
        OnClick = btnImprimeClienteClick
      end
      object btnRetornar: TTISButton
        Left = 635
        Top = 433
        Width = 60
        Height = 48
        HotFont.Font.Charset = DEFAULT_CHARSET
        HotFont.Font.Color = clWindowText
        HotFont.Font.Height = -11
        HotFont.Font.Name = 'MS Sans Serif'
        HotFont.Font.Style = []
        SkinLayOut = WINXP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Caption = 'Retornar'
        AutoSize = False
        ParentFont = False
        TabOrder = 39
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
    end
    object TabSheet1: TTabSheet
      Caption = 'Dados Complementares'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object lblDtAberturaEmpresa: TLabel
        Left = 8
        Top = 16
        Width = 163
        Height = 14
        Caption = 'Data de Abertura da Empresa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPredioProprio: TLabel
        Left = 280
        Top = 16
        Width = 93
        Height = 14
        Caption = 'Predio '#233' Proprio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOutroComercio: TLabel
        Left = 440
        Top = 16
        Width = 129
        Height = 14
        Caption = 'Tem Outro Com'#233'rcio ?:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblEnderecoOutroComercio: TLabel
        Left = 8
        Top = 56
        Width = 55
        Height = 14
        Caption = 'Endere'#231'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFornec1: TLabel
        Left = 8
        Top = 112
        Width = 76
        Height = 14
        Caption = 'Fornecedor 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFornec2: TLabel
        Left = 8
        Top = 144
        Width = 76
        Height = 14
        Caption = 'Fornecedor 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFornec3: TLabel
        Left = 8
        Top = 176
        Width = 76
        Height = 14
        Caption = 'Fornecedor 3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFornec4: TLabel
        Left = 8
        Top = 208
        Width = 76
        Height = 14
        Caption = 'Fornecedor 4:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFornec5: TLabel
        Left = 8
        Top = 240
        Width = 76
        Height = 14
        Caption = 'Fornecedor 5:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBanco1: TLabel
        Left = 8
        Top = 272
        Width = 45
        Height = 14
        Caption = 'Banco 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBanco2: TLabel
        Left = 8
        Top = 304
        Width = 45
        Height = 14
        Caption = 'Banco 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblBanco3: TLabel
        Left = 8
        Top = 336
        Width = 45
        Height = 14
        Caption = 'Banco 3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnGravaComplemento: TSpeedButton
        Left = 384
        Top = 316
        Width = 46
        Height = 41
        Hint = '|Grava as altera'#231#245'es efetuadas.'
        Caption = 'Gravar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGravarClick
      end
      object fldDtAbEmpresa: TDBEdit
        Left = 176
        Top = 16
        Width = 81
        Height = 21
        DataField = 'DataAberturaEmpresa'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 0
      end
      object fldEndOutraEmpresa: TDBEdit
        Left = 88
        Top = 56
        Width = 377
        Height = 21
        DataField = 'Local'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 2
      end
      object fldFornec1: TDBEdit
        Left = 88
        Top = 112
        Width = 465
        Height = 21
        DataField = 'Fornecedor1'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 3
      end
      object fldFornec2: TDBEdit
        Left = 88
        Top = 144
        Width = 465
        Height = 21
        DataField = 'Fornecedor2'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 4
      end
      object fldFornec3: TDBEdit
        Left = 88
        Top = 176
        Width = 465
        Height = 21
        DataField = 'Fornecedor3'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 5
      end
      object fldFornec4: TDBEdit
        Left = 88
        Top = 208
        Width = 465
        Height = 21
        DataField = 'Fornecedor4'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 6
      end
      object fldFornec5: TDBEdit
        Left = 88
        Top = 240
        Width = 465
        Height = 21
        DataField = 'Fornecedor5'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 7
      end
      object fldBanco1: TDBEdit
        Left = 88
        Top = 272
        Width = 289
        Height = 21
        DataField = 'Banco1'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 8
      end
      object fldBanco2: TDBEdit
        Left = 88
        Top = 304
        Width = 289
        Height = 21
        DataField = 'Banco2'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 9
      end
      object fldBanco3: TDBEdit
        Left = 88
        Top = 336
        Width = 289
        Height = 21
        DataField = 'Banco3'
        DataSource = dmBaseDados.dsClientes
        TabOrder = 10
      end
      object DbcPredioProprio: TDBComboBox
        Left = 376
        Top = 16
        Width = 41
        Height = 21
        DataField = 'PredioProprio'
        DataSource = dmBaseDados.dsClientes
        ItemHeight = 13
        Items.Strings = (
          'S'
          'N')
        TabOrder = 1
      end
      object DbcOutroComercio: TDBComboBox
        Left = 576
        Top = 16
        Width = 41
        Height = 21
        DataField = 'OutroComercio'
        DataSource = dmBaseDados.dsClientes
        ItemHeight = 13
        Items.Strings = (
          'S'
          'N')
        TabOrder = 11
      end
    end
    object tabContasReceber: TTabSheet
      Caption = 'Contas a Receber'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 2
      ParentFont = False
      object Label15: TLabel
        Left = 319
        Top = 0
        Width = 73
        Height = 14
        Caption = 'Ordenar por :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object grdContasReceber: TDBGrid
        Left = 3
        Top = 40
        Width = 706
        Height = 317
        DataSource = dmBaseDados.dsContasReceber
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = grdContasReceberColExit
        OnKeyPress = grdContasReceberKeyPress
        OnTitleClick = grdContasReceberTitleClick
        Columns = <
          item
            Color = clWhite
            Expanded = False
            FieldName = 'NumeroDocumento'
            Title.Alignment = taCenter
            Title.Caption = 'Documento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataEmissao'
            Title.Alignment = taCenter
            Title.Caption = 'Emissao'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Parcelas'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataBaixa'
            Title.Caption = 'Data da Baixa'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ValorDocumento'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Valor'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FormaPagamento'
            PickList.Strings = (
              'CB - Cobran'#231'a'
              'CT - Carteira'
              'CD - Cheque/Dinheiro'
              'CH - Cheque'
              'DH - Dinheiro')
            Title.Alignment = taCenter
            Title.Caption = 'Forma Pagto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataVencimento'
            Title.Alignment = taCenter
            Title.Caption = 'Vencimento '
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DiasAtraso'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Atraso'
            Title.Color = clRed
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 38
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorDinheiro'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Din.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorCheque'
            Title.Alignment = taCenter
            Title.Caption = 'Valor Chq.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ValorTotal'
            Title.Alignment = taCenter
            Title.Caption = 'Recebido'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataPagamento'
            Title.Alignment = taCenter
            Title.Caption = 'Data Pagto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 79
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LocalPagamento'
            PickList.Strings = (
              'AD -  Advogado'
              'BC -  Banco'
              'CR - Cart'#243'rio'
              'CT - Carteira'
              'DP- Dep'#243'sito'
              ' ')
            Title.Alignment = taCenter
            Title.Caption = 'Local'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Diferenca'
            Title.Alignment = taCenter
            Title.Caption = 'Diferen'#231'a'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Restante'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Juros'
            Title.Caption = 'Juros CB'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JurosCT'
            Title.Caption = 'Juros CT'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Desconto'
            PickList.Strings = (
              '2'
              '3'
              '5')
            Title.Caption = 'Desc'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Troco'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NumeroNF'
            Title.Alignment = taCenter
            Title.Caption = 'NF'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vendedor'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Observacao'
            PickList.Strings = (
              '')
            Title.Alignment = taCenter
            Title.Caption = 'Observa'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Motorista'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'Status'
            Title.Alignment = taCenter
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Arial'
            Title.Font.Style = [fsBold]
            Visible = True
          end>
      end
      object pnlBotoes: TPanel
        Left = 23
        Top = 370
        Width = 665
        Height = 46
        TabOrder = 1
        object btnPrimeiroServico: TSpeedButton
          Left = 8
          Top = 8
          Width = 81
          Height = 30
          Hint = '|Posiciona no primeiro registro da tabela de Contas a Receber.'
          Caption = 'Primeiro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            12030000424D1203000000000000120200002800000010000000100000000100
            08000000000000010000120B0000120B0000770000007700000000000000FFFF
            FF00FF00FF00FFFBF800FFFAF600FFF8F200FF7E0000FC7D0000FA7C0000F87B
            0000F4790000F2780000F0770000EE760000EC750000EA740000E8730000E270
            0000E06F0000DE6E0000D86B0000D66A0000D4690000D2680000CE660000CA64
            0000C8630000C6620000C4610000C2600000C05F0000BE5E0000BC5D0000BA5C
            0000B85B0000B4590000B2580000AA540000A04F00009C4D0000984B00009449
            0000904700008E4600008A440000884300007A3C000074390000723800006C35
            00006A340000663200006431000062300000602F0000502800004C260000DA6D
            0200FF810500D16A0500BE620800FF840B00FF850D00BE650E00FF881300FF8A
            1700EC811800FF8E1F00FF912500CA742000C3722200FF952D00FF983300FF9B
            3900FF9E3F00FF9F4100FFA04300C9823C00FDA75200FDA85400CE8B4900FFAC
            5B00CE8B4A00FFAD5D00CE8C4B00FDAC5D00FCB26A00FFB87300FFBF8100FFC3
            8900FFC58D00DFAF8000FFC99500FFCA9700E9B98A00EFC09200F3C49600E2BA
            9300FFD2A700FFD3A900F6CCA300FEDCBA00E8C9AA00FFDDBC00F9D9B900FFDF
            BF00FFE3C700EED5BD00EDD5BD00EDD5BE00EDD6C000FFE9D300FCEDDE00F7ED
            E300FFF6ED00FFFBF700FEFCFA00FFFEFD00FCF9F50002020202023836303035
            3702020202020202023434282220202127313102020202022F2D1E1D20222020
            1E1D2C370202022F29171A20226E015221201D2C3102022F13141920216D0154
            2121201D31022E230C141D1F216C01522121211E27362E120C13453C1F6B0152
            21463F1F24362A09080870600F68014D50766620203226443D0772015967015B
            7101611F2030264B480A557375037574015E3B1A2233264858060B4F04010101
            5F3917192533020E6353100C4E050164391518162B02020E4C6A51080D566542
            1113121C2B02020217536F5D4A433E40403A152C020202020248485C69625A57
            491212020202020202020210414744071B0202020202}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnPrimeiroServicoClick
        end
        object btnUltimoServico: TSpeedButton
          Left = 99
          Top = 8
          Width = 81
          Height = 30
          Hint = '|Posiciona no '#250'ltimo registro da tabela de Contas a Receber'
          Caption = #218'ltimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            1A030000424D1A030000000000001A0200002800000010000000100000000100
            08000000000000010000120B0000120B0000790000007900000000000000FFFF
            FF00FF00FF00FDF9F600FEF5ED00FF7E0000FC7D0000FA7C0000F87B0000F479
            0000F2780000F0770000EE760000EC750000E8730000E2700000E06F0000DE6E
            0000DA6C0000D86B0000D66A0000D4690000D2680000CE660000CA640000C863
            0000C6620000C4610000C2600000C05F0000BE5E0000BC5D0000BA5C0000B85B
            0000B4590000B2580000AA540000A04F00009C4D0000984B0000944900009047
            00008E4600008A440000884300007A3C000074390000723800006C3500006A34
            0000663200006431000062300000602F0000502800004C260000BB5D0200FF81
            0500BB5F0500FC810800FF840B00FF850D00D36F0E00FF881300FF8A1700FF8E
            1F00FC8D2000C06B1800FF912500D67B2200FF952D00FF983300FF9B3900FF9E
            3F00FF9F4100FFA04300CD843C00F09C4A00ED9B4B00E8984A00E0954A00CE8B
            4900FFAC5B00FFAD5D00D0905200D3935400D89A5D00FFB87300D69F6A00FFBF
            8100FFC58D00F5BF8900DCAD8000FFC99500FFCA9600FFCA9700DFB48A00E2B9
            9200E2BA9300FFD2A700FFD3A900E6C4A300FFDCB900E8C9AA00FEDDBD00FFDF
            BF00FEDEBE00FDDDBD00FEDFC000F9DABC00FFE3C700ECD3BA00FFE9D300F7ED
            E300FDFAF700FEFCFA00FFEFDE00FBF7F200FCF9F500FDFBF800FEFEFD000202
            02020237352F2F34360202020202020202333327211F1F202630300202020202
            2E2C1D1C1F211F1F1D1C2B360202022E2816191F21586F43201F1C2B3002022E
            1113181F5475016538201F1C30022D220B131C55030101016138201D26352D10
            0B1156727877787301603A1E23352908070704015B6D015C7101621F1F312544
            3C06745E0566014C5176671E1F2F254A4709423B066B015016453E1921322547
            59050A060668014F121216182432020D64530E0B066A014E121417152A02020D
            4B6E52070C6C014D0F11101B2A0202021653705F49413D3F3F39142B02020202
            0247475D69635A5748101002020202020202020E404644061A0202020202}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnUltimoServicoClick
        end
        object btnGravarServico: TSpeedButton
          Left = 275
          Top = 8
          Width = 81
          Height = 30
          Hint = '|Grava as altera'#231#245'es efetuadas na tabela de Contas a Receber.'
          Caption = 'Gravar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            56030000424D5603000000000000560200002800000010000000100000000100
            08000000000000010000120B0000120B0000880000008800000000000000FFFF
            FF00FF00FF00FEDDFE00FFFAFF00FECAFC00FED7FC00FEC5FA00FEC6FA00FEC7
            FA00FED4FB00FEC5F800FED8F800D19DBB00CE99B600D095B400FEBDE000CF95
            B200FEB4D700FEB6D700FEB4D500955F640095606500935B5F00935C6000915B
            5E00FC8B8F0092595C00925A5D00915A5D00FC929500FC878700FC898900D977
            7700D9787800FF8E8E00FC8C8C00FC909000FC919000874F4F007F4A4A00FC95
            9500FF999900FC989800FC999900FC9A9900D9848400FEA7A700FEACAB00FFAD
            AD00FEADAC00FEADAD00FFAFAF00FFB0AF00E59F9F00FEB2B100D9989800FFB6
            B500FEB4B400FEB5B500FEB6B500FFB8B800FEB8B800E5A6A600FFBBBB00FCBA
            BA00FFBDBD00FEBCBC00FBBABA00FEBDBD00FCBCBC00FBBBBB00FFBFBF00FEC4
            C400FFC7C700E5B5B500E6BBBB00FFE0E000D9C7C700FFEDED00FFF2F200E7DC
            DC00FEFCFC00FFFEFE00FCFBFB007F4948008A504F008A514F00804A4900814C
            4B00804B4A007F4B4A0088515000804C4B008751500088525100875251008853
            520087545300B47270008A575600FEA3A000E5AFAD00E5B0AF00FFC7C600FFC9
            C700FEC9C700FCC6C500FBC6C500FFCAC900FCC7C600FECAC900FFCFCE00FFDE
            DD00FEAFAB00FEB6B200FEC5C200E5B4B200FFCECC00FFD3D100FEDAD800DCCB
            CA00FEC7C200F7CFCC00F6CFCC00FED8D500FFDCD900FEC9C400D9C9C700F6D0
            CA00EFE3E100FFF6F400F4EBE900EDE2DE00F8F7F600EFEAE300020202020261
            595959596102020202020202025D59666E77776B755958020202020257387070
            6D6A6A684D01806402020228212A3A6A6F6A6A6A83010179550202632A1F2532
            747F7A7D0101010159025E36312C201E1009080C04010101516259473D332D12
            0F17150D030152548659594A453E300B1B020216058782858459594A45433C07
            1D02021809817B7C7859594448497E0A0E191C111339696D6C59274C50530104
            060B0B141A263776676002590101010171737265291F24355902025579010153
            4945453B2F2B23225B020202644E014F4245454840342E56020202020258594B
            414A4A463F595A02020202020202025C595959595F0202020202}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnGravarServicoClick
        end
        object SpeedButton3: TSpeedButton
          Left = 493
          Top = 8
          Width = 68
          Height = 30
          Hint = '|Excluir um registro do Contas a Receber.'
          Caption = 'Excluir'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FF0005B70005B7FF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FF0005B7
            0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005
            B70005B7FF00FFFF00FFFF00FF0005B70005B60005B70005B7FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF
            0006D70005BA0005B70005B7FF00FFFF00FFFF00FFFF00FF0005B70005B7FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B6FF
            00FF0005B60005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0005B60006C70006C70006CE0005B4FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006C100
            05C10006DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FF0005B60006D70006CE0006DA0006E9FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006E50006DA0006D3FF
            00FFFF00FF0006E50006EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF0006F80006DA0006EFFF00FFFF00FFFF00FFFF00FF0006F80006F6FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F8FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FF0006F60006F6FF00FFFF00FFFF00FFFF00FF0006F6
            0006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FF0006F6FF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F6
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton3Click
        end
        object btnDesBaixa: TSpeedButton
          Left = 364
          Top = 8
          Width = 117
          Height = 30
          Caption = 'Desfazer Baixa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnDesBaixaClick
        end
        object SpeedButton4: TSpeedButton
          Left = 576
          Top = 8
          Width = 81
          Height = 30
          Caption = 'Retornar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FF6B2A006828005C2300521F004E1E004E
            1F004E1F004E1F004E1F004F1F004F1F00401800FF00FFFF00FFFF00FF963A00
            BC4A00B54600AA4200A13F009A3D00983C00993C00993C00993C00993C009F3F
            007D3100401800FF00FFFF00FFB74800E25800D35200CA4F00C24C00B84800B0
            4500AD4400AC4300AD4300AD4300B446009F3F004F1F00FF00FFFF00FFC44D00
            E75B00D95600D15300CF6210D07A32D08241CA7F40BD6A28A64100A74100AD43
            00993C004F1F00FF00FFFF00FFCA4F00F36807E96004E98E40FEFEFEFEFEFEFE
            FEFEFEFEFEE1B288AA4200A74100AD4300993C004E1F00FF00FFFF00FFCA4F00
            F67A1CF06B0CFEFEFEF0AF75DA650ED35F0BCA5A09BF4E02B54700AB4300AD43
            00993C004E1F00FF00FFFF00FFCA4F00F7913CF07516FEFEFEEE6C0CE55900DC
            5600D45300EAB687C04B00B84800B647009D3D004F1F00FF00FFFF00FFCA4F00
            F79F54F07B1FFEFEFEF39645EE5D00E95B00DE5700FEFEFEEAB17EC44D00C14B
            00A54100582300FF00FFFF00FFCA4F00F8A760F28128F8BB82FEFEFEFAD8B7FA
            D8B7FBE6D1FEFEFEFEFEFEEFC59DCE5000B14500682800FF00FFFF00FFCA4F00
            F8AD6BF38832F07A1EF49F56F7BF8AF7BC86FAD4B1FEFEFEFEFEFEF2BF8FDA55
            00BF4A00772E00FF00FFFF00FFCA4F00FAB77BF49646F27F24F07A1EF07213EF
            6C0DEF6A0AFEFEFEF7B072E95B00E55A00CB4F00873500FF00FFFF00FFCA4F00
            FABA80F7B477F6A45CF49A4EF38F3CF2842CF07A1EF7B070EE6203EF5E00F25E
            00D95500963A00FF00FFFF00FFCB4F00FAA65DFABB82FABD87FAB77BF8AC69F7
            9D4FF6872DF47413F36604F36000FA6200E35900A14000FF00FFFF00FFFF00FF
            CF5C0AD46C1CD46E1ED46E1ED36A18D16513CF5C0ACC5504CB5101CA5000CB50
            00BA4800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          ParentFont = False
          OnClick = SpeedButton4Click
        end
        object btnAdicionarServico: TSpeedButton
          Left = 187
          Top = 8
          Width = 81
          Height = 30
          Hint = '|Adiciona um novo registro '#224' tabela de Contas a Receber.'
          Caption = 'Adicionar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            A2020000424DA202000000000000A20100002800000010000000100000000100
            08000000000000010000120B0000120B00005B0000005B00000000000000FFFF
            FF00FF00FF0096351100752E11008A3715007D3213007830120065280F008936
            15007B311300762F12006628100065281000692A11007E3313006B2D12007B34
            160099411500A6420C009844100099461100984411009A471300974513009546
            1600BD580B00BD580C00BD590C00BC580C00BB570C00BF5A0D00B8570F00FEF0
            E500E97F1E00FED4A900FED5AB00FED9B400FEF0E200FEF6EE00FEF7F000FEF8
            F200FEFCFA00FED3A500FED8B000FED9B100FEDCB700FEDDBA00FEE0BF00FEE1
            C100FEE2C500FEE6CB00FEE7CF00FEEBD700DCCFC100FEEDD900FEF3E600FEFB
            F700035A050006900E00089511000A9814000A9A17000C9D19000DA01C000EA1
            1D0010A5200011A5220011A6240013AB270014AC290017B02E0018B230001BB7
            35001CBA38001FBF3E0020C1400022C4430023C5450025C7470027CB4B0028CC
            4D0029CF52002CD355002DD4580030D95E0034DE650000BDFF00FEFEFE00DCDC
            DC00FFFFFF000202020202020202020202020202020202020202020202020202
            02020202020209060A0A0A0A0A0A0A3A3A3A3A0F05020E263533312E2C232B3A
            3C3B3A2B07020D27213734322F2D243A3F3D3A2B0B020C03030303033A3A3A3A
            44413A3A3A3A0C57575757573A4F4C4A484643403E3A0857575757573A53514E
            4B494745423A0803030303033A3A3A3A504D3A3A3A3A0C58585858583928383A
            54523A250B02085858585858582A293A56553A3004021059595959595959593A
            3A3A3A36110212151414141414141617151718190B0212222222222222222222
            222222221302021D1B1B1B1B1B1B1C1F1A1F1E20020202020202020202020202
            020202020202}
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAdicionarServicoClick
        end
      end
      object gbMedia: TGroupBox
        Left = 2
        Top = 435
        Width = 707
        Height = 85
        BiDiMode = bdLeftToRight
        Caption = 'T'#237'tulos Pendentes / M'#233'dia de Vendas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        object Label4: TLabel
          Left = 573
          Top = 38
          Width = 62
          Height = 22
          Caption = 'Label4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 518
          Top = 41
          Width = 50
          Height = 15
          Caption = 'Por M'#234's:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 572
          Top = 11
          Width = 62
          Height = 22
          Caption = 'Label3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 503
          Top = 14
          Width = 65
          Height = 15
          Caption = 'Por Pedido:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnCalcular: TSpeedButton
          Left = 9
          Top = 21
          Width = 64
          Height = 52
          Caption = '&Calcular'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Glyph.Data = {
            EA050000424DEA05000000000000AA0300002800000018000000180000000100
            08000000000040020000120B0000120B0000DD000000DD00000000000000FFFF
            FF006656890066548100664E6E00664C6700FF00FF00886A790076545D007653
            5A0088666D0088656A0088605D00885E58009A72690088584500994517009A65
            4700AD765400AD704500AD754E00AD6F4100904B1100AD672D00AD693100AD6B
            36002A241F00C1742D00AD662900FF810000E572040095500C00C16C1C00C07D
            3A00AD7B4800FFB76F00FFB87000825F3B00FFBA7500BF8C5A0082603D00FFBC
            7900DEA46A00FFBC7B00CE996400FFBD7F00AD815600FFBF8000FFBF8100EAAF
            7600AD825800916D4A00916E4B00CE9D6D00AF865E00C09368009F7B59009170
            510082664A0082674D00FFCE9D00FFCF9F002A252000FF820100FF830100FF83
            0200FF840300DE740300FF860500FF870600FF880700FF880800FF890900FF8A
            0B00E2790A00FF8B0D00FF8C0D00FF8C0F00FF8E0F00B6650B00FF8F1100FF8F
            1200EA811100FF8F1300FF90150091520C00FF911600FF921800BF6D1200FF92
            1900FF931A00BF6E1400FF951E00FF972200FF982400FF9A2800FF9A2A00CE7F
            2600915A1C00FF9F3300DE8B2D00FFA03500BF782900FFA13700FFA13800EA92
            3500EE983700FFA33C00FFA43E00FFA54100FFA64300FFA74700FFA94800FFAA
            4B00EE9F4600CE893D00FFAB4E00FFAC5200EEA14E00DE974900FFAD5500AD76
            3A00FFAF5700FFB05A00FFB05C00AF793F00BF844600FFB15E00AD794100BF87
            4A009F703E00FFB46500EEA95F00CE925400825D3500FFB66900FFB66A00AF7F
            4B00BF8A5300916A4000AD7F4F00FFC27D008263410082644400FFC48700FFCA
            9200CC760D00CB730D00CE740E00CF791000824C0D00824D0E00FF951C00FF96
            1F00824E1100BF721A00DE862000FF992500EE902500DE872300BF751F008250
            1500FF9D2D009F641D0082521800FF9E3000EE952E00EE96320082531B00DE8E
            3200CE832E00915D2200AF722C009F682800BF7E3400916028009F6C3200E9A3
            4E00825A2C0091653200FFB25900EAA6580091673700825D3300F8B56200FFBC
            6C00FFBF7500D07D1300D1801600D3831A00AD680000D5881E00D88E2400DC95
            2C00BF790E00CE881400CB861400C9831400C6811400EBA53400E9A33400DE9A
            3200E5A03400E29E3400E2991400E0981400DD961400DA931400D8911400D58F
            1400D38C1400D08A1400E79F2300D98E0000DC910300E0970E00D5DCBB004FCB
            BC0076D8CC00001EFF001F1F2100060606060606060606060606060606060606
            0606060606060606060606060606060606060606060606060606060606060606
            0606060606060606060606060606060606060606060606101010101010101010
            1010101010101010101010101006BEB1877F78716D68A55F9957504945401D1D
            1D1D1D1D1E10C229238481776F6CA9669F98544D48423F1D1D1D1D1D1D10C62D
            2CDCDCDCB673DCDCDCA0593EDCDCDCDCDCDC1A431D10C5302B348E287672B3B2
            AF9E9862A4A19A979696551D1D10C4302F2A27857A7473AEAA605D21151B4641
            201C201D1D10C33035DCDCDC8B7EDCDCDCAC0ADBDBDB1908DBDBDB201D10D330
            30383A33847B82B7B0A7690B030C4C5209050F1D1D10D23030353927877F7E86
            2168A5120313504918051C1D1D10D13037DCDCDC8F8ADCDCDCB007DBDBDB150D
            DBDBDB1C1D10D03030353B36268889257D6E680E021459511104171D1D10CF30
            303030302B24837C75706C67A29D5C564E48443F1D10CE30903D3D3D3C919190
            8DBAB9B463605D5A534B46421D10CD3037DADADADADADADADADADAD8676461A0
            9B5B94443F10CC3032D9D9D9D9D9D9D9D9D9D9D86BACADABA3A858474210D730
            3132323232322E8C228079B56D6AA65F9C9B50494510D5B83030303030303029
            23837B756F6C65A25E98544D4A1606D6D4C7C8C8CACBCBC9C1C1C0C0BFBDBCBB
            9592934F1F060606060606060606060606060606060606060606060606060606
            0606060606060606060606060606060606060606060606060606060606060606
            0606060606060606060606060606}
          Layout = blGlyphTop
          ParentFont = False
          Spacing = 0
          OnClick = btnCalcularClick
        end
        object Label10: TLabel
          Left = 77
          Top = 25
          Width = 126
          Height = 18
          Caption = 'T'#237'tulos Vencidos :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVencidos: TLabel
          Left = 207
          Top = 22
          Width = 109
          Height = 22
          Caption = 'lblVencidos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 77
          Top = 50
          Width = 123
          Height = 18
          Caption = 'T'#237'tulos a Vencer :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAVencer: TLabel
          Left = 207
          Top = 47
          Width = 101
          Height = 22
          Caption = 'lblAVencer'
          Font.Charset = ANSI_CHARSET
          Font.Color = clMaroon
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 358
          Top = 24
          Width = 99
          Height = 18
          Caption = 'Total Devido :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object lblDevido: TLabel
          Left = 363
          Top = 46
          Width = 87
          Height = 22
          Caption = 'lblDevido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 487
          Top = 8
          Width = 10
          Height = 14
          Caption = 'M'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 493
          Top = 20
          Width = 6
          Height = 14
          Caption = #201
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 497
          Top = 32
          Width = 7
          Height = 14
          Caption = 'D'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 503
          Top = 42
          Width = 3
          Height = 14
          Caption = 'I'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 506
          Top = 50
          Width = 8
          Height = 14
          Caption = 'A'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 532
          Top = 62
          Width = 140
          Height = 16
          Caption = '*** M'#233'dia/m'#234's 90 dias.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object Button1: TButton
        Left = 80
        Top = 8
        Width = 97
        Height = 25
        Caption = 'Localizar Venda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = Button1Click
      end
      object edtNPedido: TEdit
        Left = 0
        Top = 9
        Width = 73
        Height = 21
        Hint = '| Digite o n'#250'mero do pedido a localizar'
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object Panel1: TPanel
        Left = 186
        Top = 14
        Width = 367
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16744448
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object rdbOrdemVenc: TRadioButton
          Left = 13
          Top = 3
          Width = 173
          Height = 17
          Caption = 'Ordem de Data Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = rdbOrdemVencClick
        end
        object rdbOrdemDoc: TRadioButton
          Left = 206
          Top = 3
          Width = 145
          Height = 17
          Caption = 'Ordem de Documento'
          Checked = True
          Font.Charset = ANSI_CHARSET
          Font.Color = 16744448
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = True
          OnClick = rdbOrdemDocClick
        end
      end
    end
  end
end
