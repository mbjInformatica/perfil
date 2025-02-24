object formNFeDevolucao: TformNFeDevolucao
  Left = 136
  Top = 0
  Width = 1119
  Height = 693
  Caption = 'NF-e Devolu'#231#227'o'
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
    Width = 1103
    Height = 655
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 14651200
    Steps = 38
  end
  object Label3: TLabel
    Left = 94
    Top = 9
    Width = 128
    Height = 15
    Caption = 'Data da Sa'#237'da/Entrada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 230
    Top = 9
    Width = 129
    Height = 15
    Caption = 'Hora da Sa'#237'da/Entrada:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 431
    Top = 8
    Width = 109
    Height = 15
    Caption = 'Tipo de Transporte:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 66
    Top = 464
    Width = 75
    Height = 15
    Caption = 'Qtde/Volume:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 290
    Top = 464
    Width = 48
    Height = 15
    Caption = 'Esp'#233'cie:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 683
    Top = 464
    Width = 102
    Height = 15
    Caption = 'Peso L'#237'quido(Kg) :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 483
    Top = 464
    Width = 92
    Height = 15
    Caption = 'Peso Bruto(Kg) :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 63
    Top = 494
    Width = 186
    Height = 15
    Caption = 'Dados Adicionais / Observa'#231#245'es:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblCupom: TLabel
    Left = 1117
    Top = 551
    Width = 156
    Height = 15
    Caption = 'Digite o N'#186' do Cupom Fiscal:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label2: TLabel
    Left = 826
    Top = 388
    Width = 126
    Height = 15
    Caption = 'Vl. Total dos Produtos:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 842
    Top = 426
    Width = 108
    Height = 15
    Caption = 'Valor Total da Nota:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 438
    Top = 391
    Width = 64
    Height = 15
    Caption = 'Base ICMS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 634
    Top = 391
    Width = 64
    Height = 15
    Caption = 'Valor ICMS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label13: TLabel
    Left = 954
    Top = 334
    Width = 81
    Height = 15
    Caption = 'Base ICMS ST:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label14: TLabel
    Left = 816
    Top = 334
    Width = 81
    Height = 15
    Caption = 'Valor ICMS ST:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label15: TLabel
    Left = 648
    Top = 426
    Width = 49
    Height = 15
    Caption = 'Valor IPI:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label16: TLabel
    Left = 26
    Top = 426
    Width = 130
    Height = 15
    Caption = 'Natureza da Opera'#231#227'o:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label17: TLabel
    Left = 406
    Top = 526
    Width = 284
    Height = 16
    Caption = 'Chaves de Acesso da NF-e do FORNECEDOR:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object DBText1: TDBText
    Left = 798
    Top = 10
    Width = 285
    Height = 16
    DataField = 'RazaoSocial'
    DataSource = dmBaseDados.dsFornecedores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblDesp: TLabel
    Left = 401
    Top = 426
    Width = 102
    Height = 15
    Caption = 'Desp. acess'#243'rias:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 12
    Top = 550
    Width = 48
    Height = 15
    Caption = 'Chave 1:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label19: TLabel
    Left = 12
    Top = 574
    Width = 48
    Height = 15
    Caption = 'Chave 2:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label20: TLabel
    Left = 364
    Top = 550
    Width = 48
    Height = 15
    Caption = 'Chave 3:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label21: TLabel
    Left = 364
    Top = 574
    Width = 48
    Height = 15
    Caption = 'Chave 4:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label22: TLabel
    Left = 725
    Top = 550
    Width = 48
    Height = 15
    Caption = 'Chave 5:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Label23: TLabel
    Left = 725
    Top = 574
    Width = 48
    Height = 15
    Caption = 'Chave 6:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object DBText2: TDBText
    Left = 798
    Top = 32
    Width = 285
    Height = 16
    DataField = 'NomeFantasia'
    DataSource = dmBaseDados.dsFornecedores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label24: TLabel
    Left = 94
    Top = 619
    Width = 152
    Height = 18
    AutoSize = False
    Caption = 'N'#250'mero Nota Fiscal:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'Arial Black'
    Font.Style = [fsBold, fsItalic, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object grdProdutos: TDBGrid
    Left = 5
    Top = 53
    Width = 1087
    Height = 274
    DataSource = dmBaseDados.dsLogMensal
    FixedColor = 16311505
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
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
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Observacao'
        Title.Caption = 'C'#243'digo de Barras'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o do Produto'
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCM'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Familia'
        Title.Alignment = taCenter
        Title.Caption = 'CST'
        Width = 45
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Documento'
        Title.Alignment = taCenter
        Title.Caption = 'CFOP'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnidadeMedida'
        Title.Alignment = taCenter
        Title.Caption = 'Unid.'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDinheiro'
        Title.Alignment = taCenter
        Title.Caption = 'V. Unitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorLancamento'
        Title.Alignment = taCenter
        Title.Caption = 'V.Total'
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descon'
        Title.Alignment = taCenter
        Title.Caption = '% ICMS'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ecommerce'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '--'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'IPI'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '--'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ValorIPI'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '--'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Troco'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = '--'
        Visible = False
      end>
  end
  object btnImprime: TTISButton
    Left = 394
    Top = 612
    Width = 120
    Height = 38
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Imprimir'
    AutoSize = False
    ParentFont = False
    TabOrder = 36
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
    Layout = blGlyphLeft
    Spacing = 5
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnImprimeClick
  end
  object btnRetornar: TTISButton
    Left = 581
    Top = 612
    Width = 120
    Height = 38
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Sair'
    AutoSize = False
    ParentFont = False
    TabOrder = 1
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
    Layout = blGlyphLeft
    Spacing = 5
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnRetornarClick
  end
  object mskHoraES: TMaskEdit
    Left = 234
    Top = 25
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
    TabOrder = 2
    Text = '  :  :  '
  end
  object mskDataES: TMaskEdit
    Left = 98
    Top = 25
    Width = 118
    Height = 26
    EditMask = '!99/99/0000;1;_'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 3
    Text = '  /  /    '
  end
  object cmbCfop: TComboBox
    Left = 1093
    Top = 454
    Width = 97
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
    TabOrder = 4
    Visible = False
    Items.Strings = (
      '5.102 VENDA'
      '6.102 VENDA'
      '5.152 TRANSFERENCIA DE MERCADORIA'
      '1.202 DEVOLUCAO'
      '5.202 DEVOLUCAO'
      '5.202 REMESSA PARA GARANTIA'
      '5.202 REMESSA PARA CONSERTO'
      '6.202 DEVOLUCAO DE MERCADORIA'
      '6.202 REMESSA PARA GARANTIA'
      '6.202 REMESSA PARA CONSERTO'
      '5.915 REMESSA DE MERCADORIA'
      '6.915 REMESSA PARA CONSERTO'
      '5.949 REMESSA PARA ANALISE'
      '5.949 REMESSA PARA TROCA'
      '6.949 REMESSA PARA ANALISE'
      '6.949 REMESSA PARA TROCA'
      '5.929 VENDA COM IMPOSTO RECOLHIDO POR CUPOM FISCAL PARA SP '
      '6.929 VENDA COM IMPOSTO RECOLHIDO POR CUPOM FISCAL OUTRO ESTADO'
      '5.405 VNV MER.ABQ.REC.TER.OP.MER.SJ.RG.SU'
      '5.910 BONIFICACAO'
      '5.551 VENDA DE ATIVO IMOBILIZADO')
  end
  object ckbAVista: TTISCheckBox
    Left = 1099
    Top = 479
    Width = 80
    Height = 17
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Caption = #192' Vista'
    AutoSize = False
    Visible = False
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 5
  end
  object ckbPrazo: TTISCheckBox
    Left = 1107
    Top = 495
    Width = 80
    Height = 17
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -15
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    Caption = 'A Prazo'
    AutoSize = False
    Visible = False
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 6
  end
  object rdgFrete: TRadioGroup
    Left = 1123
    Top = 587
    Width = 99
    Height = 33
    Color = clInactiveCaptionText
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio')
    ParentColor = False
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object rdgTipoOperacao: TRadioGroup
    Left = 1092
    Top = 519
    Width = 106
    Height = 45
    Caption = 'Tipo Opera'#231#227'o:'
    Color = clInactiveCaptionText
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
    TabOrder = 8
    Visible = False
  end
  object rdgMesmo: TTISRadioButton
    Left = 377
    Top = 31
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
    TabOrder = 9
    GroupIndex = 0
  end
  object rdgTrans: TTISRadioButton
    Left = 465
    Top = 31
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
    TabOrder = 10
    OnClick = rdgTransClick
    GroupIndex = 0
  end
  object edtVolume: TEdit
    Left = 146
    Top = 464
    Width = 113
    Height = 21
    TabOrder = 24
  end
  object edtEspecie: TEdit
    Left = 346
    Top = 464
    Width = 121
    Height = 21
    TabOrder = 26
  end
  object edtPesoLiq: TEdit
    Left = 791
    Top = 464
    Width = 81
    Height = 21
    TabOrder = 28
  end
  object edtPesoBruto: TEdit
    Left = 583
    Top = 464
    Width = 81
    Height = 21
    TabOrder = 27
  end
  object edtObsComp: TEdit
    Left = 254
    Top = 494
    Width = 779
    Height = 21
    TabOrder = 29
  end
  object edtCupom: TEdit
    Left = 1000
    Top = 460
    Width = 65
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    Visible = False
  end
  object mmEmailMsg: TMemo
    Left = 1149
    Top = 547
    Width = 49
    Height = 49
    Lines.Strings = (
      'Sistema '
      'de '
      'emiss'#227'o '
      'de NFe '
      'desenvol'
      'vido por:'
      'MBJ '
      'Inform'#225'ti'
      'ca e '
      'Consulto'
      'ria '
      'Tel:(11)3'
      '683-307'
      '8')
    TabOrder = 12
    Visible = False
  end
  object mskNrNotaFiscal: TMaskEdit
    Left = 248
    Top = 616
    Width = 73
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnKeyPress = mskNrNotaFiscalKeyPress
  end
  object edtVTotalNF: TEdit
    Left = 957
    Top = 423
    Width = 89
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 22
    OnKeyPress = edtVTotalNFKeyPress
  end
  object edtTotalProd: TEdit
    Left = 957
    Top = 388
    Width = 89
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnKeyPress = edtTotalProdKeyPress
  end
  object edtBaseIcms: TEdit
    Left = 506
    Top = 388
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnKeyPress = edtBaseIcmsKeyPress
  end
  object edtVIcms: TEdit
    Left = 702
    Top = 388
    Width = 90
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnKeyPress = edtVIcmsKeyPress
  end
  object edtBaseST: TEdit
    Left = 1037
    Top = 342
    Width = 28
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    Visible = False
    OnKeyPress = edtBaseSTKeyPress
  end
  object edtValorST: TEdit
    Left = 901
    Top = 334
    Width = 36
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    Visible = False
    OnKeyPress = edtValorSTKeyPress
  end
  object edtValorIPI: TEdit
    Left = 702
    Top = 423
    Width = 90
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    Visible = False
    OnKeyPress = edtValorIPIKeyPress
  end
  object edtNatureza: TEdit
    Left = 161
    Top = 426
    Width = 232
    Height = 21
    TabOrder = 19
  end
  object pnlBotoes: TPanel
    Left = 281
    Top = 329
    Width = 530
    Height = 42
    TabOrder = 23
    object btnPrimeiroServico: TSpeedButton
      Left = 10
      Top = 6
      Width = 85
      Height = 30
      Hint = '|Posiciona no primeiro registro da tabela de Contas a Receber.'
      Caption = 'Primeiro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      Left = 115
      Top = 6
      Width = 85
      Height = 30
      Hint = '|Posiciona no '#250'ltimo registro da tabela de Contas a Receber'
      Caption = #218'ltimo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
      Left = 430
      Top = 6
      Width = 85
      Height = 30
      Hint = '|Grava as altera'#231#245'es efetuadas na tabela de Contas a Receber.'
      Caption = 'Gravar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
    object btnExcluirServico: TSpeedButton
      Left = 325
      Top = 6
      Width = 85
      Height = 30
      Hint = '|Excluir um registro do Contas a Receber.'
      Caption = 'Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
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
      OnClick = btnExcluirServicoClick
    end
    object btnAdicionarServico: TSpeedButton
      Left = 220
      Top = 6
      Width = 85
      Height = 30
      Hint = '|Adiciona um novo registro '#224' tabela de Contas a Receber.'
      Caption = 'Adicionar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
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
  object edtChaveFornec: TEdit
    Left = 63
    Top = 549
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 30
  end
  object TISButton1: TTISButton
    Left = 640
    Top = 7
    Width = 144
    Height = 41
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
    Caption = 'Fornecedor'
    AutoSize = False
    ParentFont = False
    TabOrder = 25
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      5A060000424D5A060000000000001A0400002800000018000000180000000100
      08000000000040020000120B0000120B0000F9000000F900000000000000FFFF
      FF008A869500FF00FF009E8A9100A08B910093838700A98E9400A18C8F00A58C
      8F00F8F4F400FEFDFD0094737100DFCDCC00AB848100C5ABA900D2BCBA00E3D6
      D500E6DAD90098655F00AA817C00BC928D00AD878300B18C8800C6ABA800A379
      7300A9817B00AF888300FDE2DE00F7827000AE817900B2888100B0898300B590
      8A00B8989300E8614600A5776E00FCBBAD00AC837B00C3999000B48D8500BF9A
      9200FCD3CB00EE664800F97D5F00FA7F6000FA856800A97F7500B88D8300B38C
      8300B48F8600C19C9300FCCCC100D5C0BB00EB745400F9836100BD938700FA86
      6400FB886600AB7B6C00BC928500C29D9200D5BEB700E8A08800A06A5400C953
      1E00BF4E140088452400DEB09A00D5A89000C5A69500D8C5BB00C8764600CCAA
      9600D9B8A300DBBAA300D7B7A100DDC3AF008E8A870094531E00BE814E00CB66
      0000C8640000B95D00009F50000091490000C9660300C9660400BC620D00EFB6
      7F00E4C8AD00DAC0A600FEEDDC00FEEFE000F8EFE600FEF7F000FEFBF800FEFC
      FA00EFBD8600F0C08D00F0C18F00CBAC8900C2A48300B5997A00B59D8300E2CF
      BA00FEEBD600FEEEDD00FEF1E300FEF2E500FEF4E900FEF5EB00FEF6ED00E27E
      0300F1C08700EEBD8500F1CCA200EDC9A000F1CDA400C2A58400C2A68500EDCB
      A400CBAF8F00D7BA9900EACCAA00BEA68A00B5A08800FEEDD800FEF0DF00FEF3
      E600FEF7EF00FEF8F100F6F0E900F4CD9800F3CE9D00F4D1A200F4D5AC00FEEE
      DA00FEF2E300FEFAF500F7D4A000F7D9AD00FEF9F200FAD79F00EFD8B400E5D8
      C400F6DAA900F7DCAE00E9D4B000E3D4BA00EADDC600FEF7EB00FCDFA600FFE5
      B100F3E0BA00FFE6AF00FFE8B000FEE9B700FDE9BA00F8E5B800F9EAC000FDF0
      C600FFF0BA00FFF1BD00F5EDD000FEF2C300FDF2C600FAF0C600FEF5C300FDF6
      CF00FCF7DB00F5F1DA0085837800F5F1D800FEF9D200FEFBD500FDFBD500FFFD
      D400FEFDE500FFFFD200FFFFD700FFFFD900FFFFDB00FFFFDD00FFFFDE00FFFF
      E200FFFFEB00FEFEEC00FFFFF000FFFFFB00ECEDED002391C1002794C6002C95
      C40000669A001070A0002F93C4002F90C1003A92BC00408CB30080B3CD00CEE1
      EA000E75AC00137AB300247DAC00609FC000C9E1EE002188C5004EBCFF005CC0
      FF0074C5F7004CB4FC0056BAFD005ABDFD005FA6D400606C7400CCE3F200C5D6
      E200EFF5F9002A75AC0048B0FF0049B0FC004EB2FF003578AC002A79B8003FA6
      FB002C75AE0043A9FE004BABFA0052B3FF0088C8FD00557B9A006385A200A2BD
      D300979CA0001981DD00208CF000208CEE00348CDA002E78BA0046A3F5004FA6
      F2004FA1ED0054A4EB00208DF40070A1E100C4C5D400FEFEFE00FDFDFD000303
      030303034ED702030303030303030303030303030303030303030303EAEFE004
      0303030303030303030303030303030303030303D6D0F4DB0503030303030303
      030303030303515151515151F3D5E5ECE2085554535251515151515151035170
      6E6D5D5C6AF2D5DEEDDF09687A797675757575745203518E826F816C6B7FF1D1
      E3EBE7077D7B7A7877666665530351608B83706E8A8089F0D4DCEEE87E132631
      281F15675403510B484343434343445CACD2E9060C4696AAA4693D2F4F0351F7
      422B2C2E1D23436C51D9332794B7B9B7B6B7BB3E240351F741372D1C2A36436E
      51471E7CA3A6B5B5B4B3BAF70E0351F73F392501343A455F51293C9D8CA0B6B5
      B5B4B8BC910E51F7F7F5C5C4C6F6848B57204A99639FB6B6B5B5B4B5AB0E51F7
      E6E1E1E1E1E4BE6157145A9B5986A9B8B5B5B5B4B20E51F7C1DDDDDDDDC0D80B
      56174CA2727393AEB8B6B6B6AD0E51F7CAD3D3D3D3BFCEF7511838A5A1888592
      A7AFB0B7950E51F7CDCACBCBCFCCF7F751111B4DBD978D6264879EB30E0351F7
      DAC8C3C2C7C9F7F751F8503B0D01B1988F9CA849400351F7F7F7F7F7F7F7F7F7
      51F70A100E325B9A904B3021580351F7F7F7F7F7F7F7F7F751F7F70B120F1619
      1A22355E51035171717171717171717171717171717171717171717151035151
      5151515151515151515151515151515151515151510303515151515151515151
      5151515151515151515151510303030303030303030303030303030303030303
      030303030303030303030303030303030303030303030303030303030303}
    Layout = blGlyphLeft
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = TISButton1Click
  end
  object edtDespAc: TEdit
    Left = 506
    Top = 423
    Width = 97
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnExit = edtDespAcExit
    OnKeyPress = edtDespAcKeyPress
  end
  object edtChaveFornec2: TEdit
    Left = 63
    Top = 573
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 31
  end
  object edtChaveFornec3: TEdit
    Left = 415
    Top = 549
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 32
  end
  object edtChaveFornec4: TEdit
    Left = 415
    Top = 573
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 33
  end
  object edtChaveFornec5: TEdit
    Left = 775
    Top = 549
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 34
  end
  object edtChaveFornec6: TEdit
    Left = 775
    Top = 573
    Width = 288
    Height = 21
    MaxLength = 44
    TabOrder = 35
  end
  object rdgEntSaida: TTISRadioGroup
    Left = 20
    Top = 331
    Width = 193
    Height = 40
    Hot.Font.Font.Charset = DEFAULT_CHARSET
    Hot.Font.Font.Color = clWindowText
    Hot.Font.Font.Height = -11
    Hot.Font.Font.Name = 'MS Sans Serif'
    Hot.Font.Font.Style = []
    Hot.Color.Color = clBlack
    Hot.Border.Color = clBlack
    Caption = 'Tipo de Opera'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Transparent = True
    ParentColor = True
    ParentFont = False
    SkinLayOut = WINXP
    Items.Strings = (
      'Sa'#237'da'
      'Entrada')
    Columns = 2
    TopMargin = 4
    FontColor = clBlack
    BorderColor = clBlack
    ItemIndex = -1
  end
  object rdgFinalidade: TTISRadioGroup
    Left = 20
    Top = 376
    Width = 285
    Height = 41
    Hot.Font.Font.Charset = DEFAULT_CHARSET
    Hot.Font.Font.Color = clWindowText
    Hot.Font.Font.Height = -11
    Hot.Font.Font.Name = 'MS Sans Serif'
    Hot.Font.Font.Style = []
    Hot.Color.Color = clBlack
    Hot.Border.Color = clBlack
    Caption = 'Finalidade da Opera'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Transparent = True
    ParentColor = True
    ParentFont = False
    SkinLayOut = WINXP
    Items.Strings = (
      'Devolu'#231#227'o'
      'Troca\Remessa')
    Columns = 2
    TopMargin = 2
    FontColor = clNavy
    BorderColor = clBlack
    ItemIndex = -1
  end
  object ACBrMail1: TACBrMail
    Host = '127.0.0.1'
    Port = '25'
    SetSSL = False
    SetTLS = False
    Attempts = 3
    DefaultCharset = UTF_8
    IDECharset = CP1252
    Left = 1044
    Top = 13
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    ACBrNFe = ACBrNFe1
    Logo = 'Logo.jpg'
    PathPDF = 'F:\NFe\PDF\'
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = True
    FormularioContinuo = False
    ExpandirLogoMarca = True
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    ImprimeDescAcrescItem = False
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    ImprimirUnQtVlComercial = iuComercial
    ImprimirDadosDocReferenciados = True
    Left = 999
    Top = 11
  end
  object ACBrNFe1: TACBrNFe
    MAIL = ACBrMail1
    Configuracoes.Geral.SSLLib = libCustom
    Configuracoes.Geral.SSLCryptLib = cryWinCrypt
    Configuracoes.Geral.SSLHttpLib = httpWinHttp
    Configuracoes.Geral.SSLXmlSignLib = xsMsXml
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.ValidarDigest = False
    Configuracoes.Geral.VersaoDF = ve400
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
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
    Configuracoes.WebServices.SSLType = LT_TLSv1_2
    Configuracoes.Certificados.NumeroSerie = '339288FCDF75345C6A882F5EB349A477'
    Configuracoes.Certificados.Senha = '36814459'
    DANFE = ACBrNFeDANFeRL1
    Left = 961
    Top = 11
  end
end
