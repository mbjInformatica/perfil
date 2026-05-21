object FrmEmissaoNF: TFrmEmissaoNF
  Left = 483
  Top = 8
  Width = 436
  Height = 692
  Caption = 'Emiss'#227'o de Nota Fiscal'
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
  object TIGradient1: TTIGradient
    Left = 0
    Top = 0
    Width = 420
    Height = 654
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 15645565
    Steps = 38
  end
  object lblNumeroPedido: TLabel
    Left = 16
    Top = 35
    Width = 110
    Height = 15
    Caption = 'N'#250'mero do Pedido :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblNrNF: TLabel
    Left = 18
    Top = 3
    Width = 90
    Height = 15
    Caption = 'N'#250'mero da N.F. :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object TLabel
    Left = 290
    Top = 3
    Width = 3
    Height = 13
    Transparent = True
  end
  object lblCfop: TLabel
    Left = 18
    Top = 67
    Width = 34
    Height = 15
    Caption = 'CFOP:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblcodprocalc: TLabel
    Left = 290
    Top = 11
    Width = 3
    Height = 13
    Transparent = True
  end
  object lblTransportadora: TLabel
    Left = 18
    Top = 293
    Width = 94
    Height = 15
    Caption = 'Transportadora :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblPlaca: TLabel
    Left = 20
    Top = 426
    Width = 38
    Height = 15
    Caption = 'Placa :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblObs: TLabel
    Left = 338
    Top = 14
    Width = 31
    Height = 13
    Caption = 'Obs.:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMotivo: TLabel
    Left = 350
    Top = 19
    Width = 47
    Height = 13
    Caption = 'Motivo :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblnomerg: TLabel
    Left = 344
    Top = 22
    Width = 70
    Height = 13
    Caption = 'Nome e RG:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 10
    Top = 520
    Width = 96
    Height = 15
    Caption = 'Obs/Dados Adic.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblNomeTrans: TLabel
    Left = 18
    Top = 325
    Width = 130
    Height = 15
    Caption = 'Nome Transportadora :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCNPJ: TLabel
    Left = 18
    Top = 351
    Width = 37
    Height = 15
    Caption = 'CNPJ :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblIE: TLabel
    Left = 202
    Top = 351
    Width = 85
    Height = 15
    Caption = 'Insc. Estadual :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblEnd: TLabel
    Left = 18
    Top = 377
    Width = 60
    Height = 15
    Caption = 'Endere'#231'o :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblUF: TLabel
    Left = 362
    Top = 401
    Width = 17
    Height = 15
    Caption = 'UF:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCidade: TLabel
    Left = 18
    Top = 401
    Width = 57
    Height = 15
    Caption = 'Cidade.....:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblPlacaUF: TLabel
    Left = 140
    Top = 426
    Width = 72
    Height = 15
    Caption = 'UF da Placa :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 18
    Top = 264
    Width = 112
    Height = 15
    Caption = 'Tipo de Transporte :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 64
    Top = 231
    Width = 106
    Height = 15
    Caption = 'Frete por conta do:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 20
    Top = 488
    Width = 92
    Height = 15
    Caption = 'Peso Bruto(Kg) :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 228
    Top = 488
    Width = 102
    Height = 15
    Caption = 'Peso L'#237'quido(Kg) :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 62
    Top = 127
    Width = 128
    Height = 15
    Caption = 'Data da Sa'#237'da/Entrada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 217
    Top = 127
    Width = 129
    Height = 15
    Caption = 'Hora da Sa'#237'da/Entrada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 18
    Top = 462
    Width = 75
    Height = 15
    Caption = 'Qtde/Volume:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 234
    Top = 462
    Width = 48
    Height = 15
    Caption = 'Esp'#233'cie:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 16
    Top = 186
    Width = 81
    Height = 15
    Caption = 'Al'#237'quota ICMS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 192
    Top = 98
    Width = 141
    Height = 16
    Caption = 'Acr'#233'scimo / Desp. Ac.:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblFrete: TLabel
    Left = 252
    Top = 427
    Width = 81
    Height = 15
    Alignment = taCenter
    Caption = 'Valor do Frete:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 12
    Top = 98
    Width = 62
    Height = 16
    Caption = 'Desconto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label13: TLabel
    Left = 365
    Top = 136
    Width = 105
    Height = 15
    Alignment = taCenter
    Caption = 'N'#186' Pedido Compra:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object lblChave: TLabel
    Left = 88
    Top = 548
    Width = 261
    Height = 15
    Caption = 'Chave de Acesso da NF-e Entrada / Devolu'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object mskNPedido: TMaskEdit
    Left = 138
    Top = 35
    Width = 81
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnExit = mskNPedidoExit
    OnKeyPress = mskNPedidoKeyPress
  end
  object mskNrNotaFiscal: TMaskEdit
    Left = 138
    Top = 3
    Width = 81
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = mskNrNotaFiscalExit
  end
  object cmbCfop: TComboBox
    Left = 66
    Top = 67
    Width = 329
    Height = 23
    Style = csDropDownList
    BiDiMode = bdRightToLeft
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 15
    MaxLength = 20
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
    OnClick = cmbCfopClick
    Items.Strings = (
      '5.102 VENDA'
      '6.102 VENDA'
      '5.202 DEVOLUCAO'
      '6.202 DEVOLUCAO'
      '1.202 ENTRADA DE MERCADORIA'
      '5.915 REMESSA DE MERCADORIA'
      '6.915 REMESSA DE MERCADORIA'
      '5.949 REMESSA EM GARANTIA'
      '6.949 REMESSA EM GARANTIA'
      '5.405 VNV MER.ABQ.REC.TER.OP.MER.SJ.RG.SU'
      '5.910 BONIFICACAO'
      '5.551 VENDA DE ATIVO IMOBILIZADO')
  end
  object edtPlaca: TEdit
    Left = 63
    Top = 426
    Width = 60
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 21
  end
  object edtObs: TEdit
    Left = 346
    Top = 14
    Width = 25
    Height = 21
    TabOrder = 30
  end
  object edtMotivo: TEdit
    Left = 379
    Top = 22
    Width = 7
    Height = 21
    TabOrder = 31
  end
  object edtnomerg: TEdit
    Left = 378
    Top = 16
    Width = 25
    Height = 21
    TabOrder = 32
  end
  object ckbAVista: TTISCheckBox
    Left = 197
    Top = 183
    Width = 98
    Height = 25
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Caption = #192' Vista'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 8
    OnClick = ckbAVistaClick
  end
  object ckbPrazo: TTISCheckBox
    Left = 317
    Top = 183
    Width = 103
    Height = 25
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Caption = 'A Prazo'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 9
    OnClick = ckbPrazoClick
  end
  object edtObsComp: TEdit
    Left = 111
    Top = 520
    Width = 303
    Height = 21
    TabOrder = 27
  end
  object edtNomeTrans: TEdit
    Left = 162
    Top = 325
    Width = 249
    Height = 21
    TabOrder = 15
  end
  object edtCNPJTrans: TEdit
    Left = 60
    Top = 351
    Width = 134
    Height = 21
    TabOrder = 16
  end
  object edtInscTrans: TEdit
    Left = 292
    Top = 351
    Width = 119
    Height = 21
    TabOrder = 17
  end
  object edtEndTrans: TEdit
    Left = 84
    Top = 377
    Width = 327
    Height = 21
    TabOrder = 18
  end
  object edtEstadoTrans: TEdit
    Left = 380
    Top = 401
    Width = 31
    Height = 21
    TabOrder = 20
  end
  object edtCidadeTrans: TEdit
    Left = 84
    Top = 401
    Width = 271
    Height = 21
    TabOrder = 19
  end
  object edtPlacaUF: TEdit
    Left = 215
    Top = 426
    Width = 34
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 8
    TabOrder = 22
  end
  object cmbTransportadora: TDBLookupComboBox
    Left = 123
    Top = 292
    Width = 288
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    KeyField = 'NomeFantasia'
    ListField = 'NomeFantasia'
    ParentFont = False
    TabOrder = 14
    OnClick = cmbTransportadoraClick
  end
  object rdgMesmo: TTISRadioButton
    Left = 136
    Top = 264
    Width = 82
    Height = 18
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
    Caption = 'O Mesmo'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 12
    OnClick = rdgMesmoClick
    GroupIndex = 0
  end
  object rdgTrans: TTISRadioButton
    Left = 232
    Top = 264
    Width = 150
    Height = 18
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
    Caption = 'Por Transportadora'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 13
    OnClick = rdgTransClick
    GroupIndex = 0
  end
  object rdgTipoOperacao: TRadioGroup
    Left = 287
    Top = 2
    Width = 106
    Height = 23
    Caption = 'Tipo Opera'#231#227'o:'
    Color = 16311505
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'VENDA'
      'DEVOLU'#199#195'O/GARANTIA')
    ParentColor = False
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object edtPesoBruto: TEdit
    Left = 120
    Top = 488
    Width = 81
    Height = 21
    TabOrder = 25
    OnKeyPress = edtPesoBrutoKeyPress
  end
  object edtPesoLiq: TEdit
    Left = 336
    Top = 488
    Width = 81
    Height = 21
    TabOrder = 26
    OnKeyPress = edtPesoLiqKeyPress
  end
  object mskDataES: TMaskEdit
    Left = 69
    Top = 144
    Width = 115
    Height = 26
    EditMask = '!99/99/0000;1;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 5
    Text = '  /  /    '
  end
  object mskHoraES: TMaskEdit
    Left = 221
    Top = 144
    Width = 116
    Height = 26
    EditMask = '!90:00:00>;1;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentFont = False
    TabOrder = 6
    Text = '  :  :  '
  end
  object edtVolume: TEdit
    Left = 98
    Top = 462
    Width = 113
    Height = 21
    TabOrder = 23
  end
  object edtEspecie: TEdit
    Left = 290
    Top = 462
    Width = 121
    Height = 21
    TabOrder = 24
  end
  object btnGrava: TTISButton
    Left = 68
    Top = 599
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
    Caption = 'Gravar'
    AutoSize = False
    ParentFont = False
    TabOrder = 28
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
    Spacing = 0
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnGravaClick
  end
  object btnImprime: TTISButton
    Left = 179
    Top = 599
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
    Caption = 'Imprimir'
    AutoSize = False
    ParentFont = False
    TabOrder = 29
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
    Spacing = 0
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnImprimeClick
  end
  object btnRetornar: TTISButton
    Left = 290
    Top = 599
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
    Caption = 'Sair'
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
    Spacing = 0
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnRetornarClick
  end
  object mmEmailMsg: TMemo
    Left = 232
    Top = 34
    Width = 25
    Height = 25
    TabOrder = 34
    Visible = False
  end
  object edtAliquota: TEdit
    Left = 104
    Top = 185
    Width = 73
    Height = 22
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object edtDespAc: TEdit
    Left = 334
    Top = 97
    Width = 77
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnKeyPress = edtDespAcKeyPress
  end
  object edtFrete: TEdit
    Left = 339
    Top = 426
    Width = 81
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object edtDesconto: TEdit
    Left = 79
    Top = 97
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnKeyPress = edtDescontoKeyPress
  end
  object edtNPedCompra: TEdit
    Left = 371
    Top = 150
    Width = 30
    Height = 21
    TabOrder = 35
    Visible = False
  end
  object rdgFrete: TTISRadioGroup
    Left = 176
    Top = 215
    Width = 201
    Height = 41
    Hot.Font.Font.Charset = DEFAULT_CHARSET
    Hot.Font.Font.Color = clWindowText
    Hot.Font.Font.Height = -11
    Hot.Font.Font.Name = 'MS Sans Serif'
    Hot.Font.Font.Style = []
    Hot.Color.Color = clBlack
    Hot.Border.Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Transparent = True
    ParentColor = True
    ParentFont = False
    SkinLayOut = WINXP
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio')
    Columns = 2
    TopMargin = 4
    FontColor = clBlack
    BorderColor = clNavy
    ItemIndex = -1
  end
  object edtChaveFornec: TEdit
    Left = 67
    Top = 565
    Width = 305
    Height = 21
    MaxLength = 44
    TabOrder = 37
    OnKeyPress = edtChaveFornecKeyPress
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 276
    Top = 32
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    PathPDF = 'F:\NFe\PDF\'
    Sistema = 'Projeto ACBr - www.projetoacbr.com.br'
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    ExpandeLogoMarcaConfig.Altura = 0
    ExpandeLogoMarcaConfig.Esquerda = 0
    ExpandeLogoMarcaConfig.Topo = 0
    ExpandeLogoMarcaConfig.Largura = 0
    ExpandeLogoMarcaConfig.Dimensionar = False
    ExpandeLogoMarcaConfig.Esticar = True
    CasasDecimais.Formato = tdetInteger
    CasasDecimais.qCom = 2
    CasasDecimais.vUnCom = 2
    CasasDecimais.MaskqCom = ',0.00'
    CasasDecimais.MaskvUnCom = ',0.00'
    CasasDecimais.Aliquota = 2
    CasasDecimais.MaskAliquota = ',0.00'
    ACBrNFe = ACBrNFe1
    ExibeCampoFatura = False
    Left = 351
    Top = 32
  end
  object ACBrNFe1: TACBrNFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Geral.ForcarGerarTagRejeicao938 = fgtSomenteProducao
    Configuracoes.Arquivos.PathSalvar = 'F:\NFe\XML\'
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.Arquivos.SalvarEvento = True
    Configuracoes.Arquivos.PathNFe = 'F:\NFe\PathNFe'
    Configuracoes.Arquivos.PathInu = 'F:\NFe\NFeInu'
    Configuracoes.Arquivos.PathEvento = 'F:\NFe\PathEvento'
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.Ambiente = taProducao
    Configuracoes.WebServices.AguardarConsultaRet = 0
    Configuracoes.WebServices.QuebradeLinha = '|'
    Configuracoes.Certificados.NumeroSerie = '5422231219456ED2'
    Configuracoes.Certificados.Senha = 'CARLOS1964'
    Configuracoes.RespTec.IdCSRT = 0
    DANFE = ACBrNFeDANFeRL1
    Left = 313
    Top = 32
  end
end
