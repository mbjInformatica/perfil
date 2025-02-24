object formListaProdutos: TformListaProdutos
  Left = 231
  Top = 27
  BorderStyle = bsDialog
  Caption = 'Lista de Produtos'
  ClientHeight = 613
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 0
    Width = 898
    Height = 613
    Align = alClient
    Style = grPyramid
    StartColor = 16771026
    EndColor = 14651200
    Steps = 57
  end
  object lblCodigo: TLabel
    Left = 727
    Top = 421
    Width = 77
    Height = 15
    Caption = 'C'#243'digo Barra:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldValorVenda: TDBText
    Left = 623
    Top = 468
    Width = 73
    Height = 17
    DataField = 'ValorVenda'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblVVenda: TLabel
    Left = 527
    Top = 469
    Width = 92
    Height = 15
    Caption = 'Valor de Venda :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 527
    Top = 499
    Width = 157
    Height = 15
    Caption = 'Valor com Desconto em R$:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 527
    Top = 397
    Width = 51
    Height = 15
    Caption = 'Produto :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldProduto: TDBText
    Left = 583
    Top = 396
    Width = 281
    Height = 17
    DataField = 'DescricaoAbreviada'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 536
    Top = 321
    Width = 187
    Height = 15
    Caption = 'Pesquisa pelo C'#243'digo de Barras :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 528
    Top = 341
    Width = 148
    Height = 15
    Caption = 'Refer'#234'ncia do Fabricante :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 527
    Top = 445
    Width = 52
    Height = 15
    Caption = 'Estoque :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldEstoque: TDBText
    Left = 583
    Top = 444
    Width = 65
    Height = 17
    DataField = 'EstoqueAtual'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldLocalizacao: TDBText
    Left = 806
    Top = 444
    Width = 65
    Height = 17
    DataField = 'Localizacao'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 11
    Top = 466
    Width = 91
    Height = 15
    Caption = 'Caracter'#237'sticas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 662
    Top = 445
    Width = 139
    Height = 15
    Caption = 'Localiza'#231#227'o do Produto :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 6
    Top = 74
    Width = 157
    Height = 16
    Caption = 'Pesquisar por Descri'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 527
    Top = 370
    Width = 113
    Height = 14
    Caption = 'Pelo Nome do Carro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 525
    Top = 421
    Width = 65
    Height = 14
    Caption = 'Refer'#234'ncia :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldReferencia: TDBText
    Left = 600
    Top = 421
    Width = 128
    Height = 17
    DataField = 'ReferenciaFabricante'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldCodigo: TDBText
    Left = 807
    Top = 421
    Width = 89
    Height = 17
    DataField = 'CodigoBarra'
    DataSource = dmBaseDados.dsqProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object btnCadProdutos: TSpeedButton
    Left = 400
    Top = 62
    Width = 118
    Height = 50
    Caption = 'Cadastro &Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      12060000424D1206000000000000D20300002800000018000000180000000100
      08000000000040020000120B0000120B0000E7000000E700000000000000FFFF
      FF00100F8E004543AA007673BD00150C73009995CA00766FB6008881C0007569
      A60053447B00927FC400FF00FF00C587AA00C2749900EAE1E500E27D8F00F280
      8800BD4B4C00C14E4F00B74A4B00C5515200CC575800D35C5D00DA636400E269
      6A00E96E6F0092454600EA6F7000F0757600F77A7B008A454600FF818200FC7F
      80008E41410087404000763C3C00D46D6D006E3D3D005F363600FFFCFC00FFFE
      FE00B2524C0066413F0066413D006F5147008E756C008C381600874F3500BB53
      0B00B65C2200E9CEBC00FFFCFA00CB5C0700C75B0A00C5692700FFF8F300D978
      280067493100DD6C0A00F3A96600FFF4EA00E9872800FBAF6600FECF9F00FED0
      A100FED1A300FED1A400F6CCA100816B5500FED4A90087705A007E695500FED5
      AC00A68C7200FFDAB500FFDDBA0081705F0088776700FFEBD700FFEBD800FFF0
      E100FFF3E700FFF4E900FFF7EF00FECB9600FECC9700FECC9800FECE9900FECE
      9A00FED09D00FECF9D00FED09F00E5BD9200FED3A300CCA98300FED3A400A689
      6B00FED4A50087705800FFD4A700FED3A600CCAA8600FED5AA00C4A58300806C
      5600FFD7AD009F876C00FFD9B000FED8AF00816E5A00FED9B200FEDCB700806F
      5C00FEDDB800FEDEBB00FEE0BF00FFE2C200FEE2C400FFE5C900DDC7B000FEE6
      CB00FEE7CE00FFEAD300FFEEDC00FFEFDE00806B5300806C5500FED8AC00F6D3
      AB00FEE0BD00A6958100FFE5C700FFEAD100FEE9D000FEEBD500FEEDD900FFF2
      E200FFF3E500FFF6EB00FFF8F000FFFAF400FFF7ED00FFFBF600FFFCF8004A3D
      2B00E3AF5D00FFFAF200FFFEFC00FFFEFB0060654100445F2D0084AA6F001C59
      1400559D4F00004F0000004B0000036C06003096330007861000098B12000B8B
      16000E9A1C0013A3260013A3250018AA2F001FB138001FB2390025BA43002CC1
      4E00BBD1C00032C9590039D165003ED76D0005AB7F00899F9C0006B5A50005BC
      CA0005BFDC0018ADD80000BDFF0001B5FB000995F2000F7EE300185BB5001868
      E900B8CEFA0089AAF4008BACF6009FBBF700A1BCF700A4BFF800BCD0FA00D7E3
      FC007699F200789CF3002052D5006388EF00658AF000678CF0007497F200547A
      EE00567BEE003A5FE900476CEB00486EEB003553C7005D74D7002948E3002745
      D4002745CA002F51E6003052E7004360E2001D35B5002845DE002845D9004658
      C7001625B4006672D7006E77CC00101CB100222DAF00151EA5007D81CE00282C
      A5005A5DBD001F229F003535A6003334A1004546AC000C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C2F2F
      2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F538A517C8785798475
      82724B6C496460415B595755552F2F8B52897D887B8678834E4D716E6B684442
      5C5B5756552F2F543D52517C502E2B272727272C2D484766415A5957552F2F8C
      8E538A510A27261F1B222324279197455F415B58572F2F8D548B520705251E1C
      18161312143A9C977E5D5A5B572F2F8F38548B02D90D20211D1917152A9EA19B
      96614140592F2F8F8D8C8EE3BDC80B11201E1A189AA6A49F9963605C5B2F2F34
      8F9354E2BABBC5DB10202198ABA8A5A29D7F6241402F2F28908F38E4C1BEC2C9
      D50EAFADACA9A7A3A0696443412F2F94288F8D04E0C0BCC6CCD3B9B6B4B2B1B0
      AE4A67655E2F2F0194348F3803DCBFC3CACBD0D8C4B7B5B4B3818046602F2F01
      2928908F8C06E1CFC7CDD4D7D1D2D6B8AA4B6D49642F2F010194348F38540F08
      E6DEDADDDFE5093373706F6A672F2F01010195348F93543D52517C4F7B7A7776
      744C4B6C6A2F2F929292929292929292929292929292929292929292922F2F31
      353535353535353535353535353F3E3B3F3E30CE312F2F323737373737373737
      37373737373C39363F3930CE322F0C2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F
      2F2F2F2F2F0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
      0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C}
    Layout = blGlyphTop
    ParentFont = False
    OnClick = btnCadProdutosClick
  end
  object fldValorold: TDBEdit
    Left = 735
    Top = 462
    Width = 17
    Height = 21
    TabOrder = 13
    Visible = False
  end
  object edtCodBarra: TEdit
    Left = 725
    Top = 318
    Width = 89
    Height = 21
    MaxLength = 13
    TabOrder = 0
    OnKeyPress = edtCodBarraKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 817
    Top = 317
    Width = 49
    Height = 21
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object edtRefFab: TEdit
    Left = 725
    Top = 342
    Width = 89
    Height = 21
    MaxLength = 12
    TabOrder = 2
    OnChange = edtRefFabChange
    OnKeyPress = edtRefFabKeyPress
  end
  object BitBtn2: TBitBtn
    Left = 818
    Top = 342
    Width = 47
    Height = 21
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object dbImagem: TDBImage
    Left = 536
    Top = 2
    Width = 353
    Height = 310
    DataField = 'Imagem'
    DataSource = dmBaseDados.dsProdutos
    Enabled = False
    TabOrder = 4
  end
  object fldCaracteristicasProd: TDBMemo
    Left = 8
    Top = 483
    Width = 513
    Height = 124
    DataField = 'Caracteristicas'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object Edit1: TEdit
    Left = 4
    Top = 92
    Width = 334
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = 'TESTE'
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object dbgDescricao: TDBGrid
    Left = 4
    Top = 121
    Width = 518
    Height = 312
    DataSource = dmBaseDados.dsqProdutos
    FixedColor = 16311505
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnKeyPress = dbgDescricaoKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'DescricaoAbreviada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Descri'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 352
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReferenciaFabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Refer'#234'ncia'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 118
        Visible = True
      end>
  end
  object edtMemo: TEdit
    Left = 661
    Top = 370
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 8
    OnChange = edtMemoChange
    OnKeyPress = edtMemoKeyPress
  end
  object btnOKCarro: TButton
    Left = 818
    Top = 370
    Width = 49
    Height = 22
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = btnOKCarroClick
  end
  object ckbNaoCadastrado: TCheckBox
    Left = 7
    Top = 440
    Width = 173
    Height = 17
    Caption = 'Produto n'#227'o Cadastrado'
    Color = 16311505
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
    TabOrder = 10
    OnClick = ckbNaoCadastradoClick
  end
  object dbeDescricao: TDBEdit
    Left = 187
    Top = 439
    Width = 329
    Height = 24
    DataField = 'DescricaoAbreviada'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    Visible = False
    OnChange = dbeDescricaoChange
  end
  object fldValor: TEdit
    Left = 695
    Top = 495
    Width = 89
    Height = 21
    TabOrder = 12
    OnChange = fldValorChange
    OnClick = fldValorClick
  end
  object btnOK: TBitBtn
    Left = 679
    Top = 554
    Width = 81
    Height = 37
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 14
    OnClick = btnOKClick
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      0800000000004002000000000000000000000001000000010000FF00FF00004B
      0000035E06000464080007740E00097411000C7717000E7D1A000F811C00118C
      1F000793100008961200099714000A9915000C9A18000D9E1B0010951F000FA0
      1E00138F23001196210013902400159127001398230013992500159A2700169C
      28001B9F31001C9C340014A727001AAF31001BB0330020AA3B0021B83D0023AD
      410028C048002EC152002FC9540035CF5E0036D060003BD768003FD96F0041DC
      7000000000000000000000000000000000000000000000000000000000000000
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
      0000010000000000000000000000000000000000000000000001090100000000
      0000000000000000000000000000000001120A19010000000000000000000000
      000000000000000115110D0B1801000000000000000000000000000000000108
      1D1C110E0B18010000000000000000000000000000010722201E1501190B1801
      00000000000000000000000001062524221A0100010E0D150100000000000000
      00000000012827261F0100000001040D180100000000000000000000011A2921
      01000000000000010D1001000000000000000000000123010000000000000000
      010E0B0100000000000000000000010000000000000000000001030B01000000
      0000000000000000000000000000000000000001040100000000000000000000
      0000000000000000000000000102010000000000000000000000000000000000
      0000000000000101000000000000000000000000000000000000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
  end
  object dbCaracteristica2: TDBMemo
    Left = 216
    Top = 472
    Width = 185
    Height = 6
    DataField = 'Caracteristicas'
    DataSource = dmBaseDados.dsProdutos
    TabOrder = 15
    Visible = False
  end
  object dbcFamilia: TDBLookupComboBox
    Left = 7
    Top = 8
    Width = 232
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    KeyField = 'DescricaoFamilia'
    ListField = 'DescricaoFamilia'
    ListSource = dmBaseDados.dsFamilias
    ParentFont = False
    TabOrder = 16
  end
  object Button1: TButton
    Left = 248
    Top = 8
    Width = 121
    Height = 25
    Caption = 'Pesquisar Familia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = Button1Click
  end
  object dbcCategoria: TDBLookupComboBox
    Left = 5
    Top = 40
    Width = 234
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    KeyField = 'DescricaoCategoria'
    ListField = 'DescricaoCategoria'
    ListSource = dmBaseDados.dsCategoria
    ParentFont = False
    TabOrder = 18
  end
  object btnCategoria: TButton
    Left = 248
    Top = 40
    Width = 121
    Height = 25
    Caption = 'Pesquisar Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = btnCategoriaClick
  end
  object BitBtn3: TBitBtn
    Left = 400
    Top = 6
    Width = 118
    Height = 50
    Caption = 'Nova Pesquisa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = BitBtn3Click
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FF92635DA46769A46769A46769A46769A46769A46769A46769A46769A467
      69A46769A46769A46769A46769A46769A46769A46769A46769A46769FF00FFFF
      00FFFF00FFFF00FFFF00FF93655EEFD3B4F6DAB6F3D5ADF2D1A5F0CE9EEFCB97
      EFC791EEC589EBC182EBC080EBC080EBC080EBC080EBC080EBC080EDC180EABF
      7F9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED4B8F4DABBF2D5B1F0
      D1AAEFCFA3EECB9DEDC796EDC58FEBC188EABF82E9BD7FE9BD7FE9BD7FE9BD7F
      E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF93655FEED7
      C0F6E0C1F2D9B8F2D4B1F0D1AAEFCFA4EECB9DEDC796EDC58FEBC189EABF82E9
      BD7FE9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
      FF00FF93655FEFDAC5F7E2C7F3DCBFF2D8B7F2D4B0F0D1AAEFCEA3EECB9CEDC7
      95EDC58FEBC189E9BD81E9BD7FE9BD7FE9BD7FEABF7FE7BC7E9F6F60FF00FFFF
      00FFFF00FFFF00FFFF00FF936560F0DECCF8E6CFF6E0C6F3DCBDF2D8B7F2D5B1
      F0D1AAEFCEA3EECB9CEDC796EDC590EBC189E9BF82E9BD7FE9BD7FEABF7FE7BC
      7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF956660F2E2D3FAEAD7F6E3CEF4
      DEC5F3DCBFF2D8B8F0D4B1F0D1AAEFCEA3EECB9DEDC797EDC590EBC189E9BD81
      E9BD7FEABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FFFF00FF986963F2E6
      DAFAEEDEF7E7D4F6E2CBF4E0C5F3DCBFF2D8B7F2D5B0F0D1A9EFCEA3EECB9DED
      C796EDC58FEBC189E9BD81EABF7FE7BC7E9F6F60FF00FFFF00FFFF00FFFF00FF
      FF00FF9E6E64F4EAE1FBF2E6F8EADCF7E6D3F6E2CCF4E0C6F3DCBFF2D8B7F2D5
      B0F0D1AAEFCEA4EDCB9CEDC796EBC58FEBC188EABF82E7BB7E9F6F60FF00FFFF
      00FFFF00FFFF00FFFF00FFA37266F6EEE9FCF6EDF8EFE3F7EADAF7E6D3F6E2CC
      F4DEC5F3DCBDF2D8B6F0D5B0F0D1AAEFCEA3EECA9CEDC795EBC48EEBC288E7BC
      809F6F60FF00FFFF00FFFF00FFFF00FFFF00FFA77568F8F3F0FEFBF6FBF3EBF8
      EEE3F8EBDCF7E7D3F6E2CCF4E0C5F3DCBDF2D8B7F2D4B1F0D1A9EFCEA3EDCB9C
      EDC795EDC58FE9BF879F6F62FF00FFFF00FFFF00FFFF00FFFF00FFAC7969FAF6
      F4FFFFFEFEF8F3FBF2EAF8EEE3F8EBDAF7E6D3F7E2CCF6E0C5F3DCBFF2D8B7F2
      D4B0F0D1AAEFCEA3EECB9CEEC996EAC18EA07063FF00FFFF00FFFF00FFFF00FF
      FF00FFB17E6BFAF6F4FFFFFFFFFEFBFEF7F0FBF3EAFAEFE3F8EADAF7E7D3F6E2
      CBF6E0C5F3DCBFF2D8B6F2D4B0F0D1A9EFCEA1EECB9CEBC592A07264FF00FFFF
      00FFFF00FFFF00FFFF00FFB6816CFAF6F4FFFFFFFFFFFFFFFCFBFEF7F2FBF3EB
      F8EEE3F8EBDCF7E6D3F6E3CCF6DEC5F3DCBDF3D8B6F2D4AFF0D1A9F0CFA3EDC9
      999D7065FF00FFFF00FFFF00FFFF00FFFF00FFBB846EFAF6F4FFFFFFFFFFFFFF
      FFFFFFFEFBFEF7F2FBF3EAFAEEE3F8EADAF7E6D3F6E2CBF6DEC4F3DABCF2D8B6
      F0D4AFEFD0A7CEB491896A63FF00FFFF00FFFF00FFFF00FFFF00FFC0896FFBF7
      F4FFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFEF7F2FBF2EAFAEEE2F8EBDAF7E6D3F6
      E2CBF6DEC4F3DCBDE5CEAFC4B096A1927F806762FF00FFFF00FFFF00FFFF00FF
      FF00FFC58C70FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFCF8F2FBF3
      EAF8EEE2F8EAD9F8E7D4FAE9D0E0D0BAB8AB9AA79C8BA49786846964FF00FFFF
      00FFFF00FFFF00FFFF00FFCB9173FBF7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFBFCF7F0FBF2E9FBF2E5E9D3C49E675B98665B95655B96655B9665
      5B986859FF00FFFF00FFFF00FFFF00FFFF00FFCF9674FBF7F6FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFCF7F0FFFAEFDAC0B69F675BDAA16B
      DD984FE2903AEA8923A5686BFF00FFFF00FFFF00FFFF00FFFF00FFD49875FCF8
      F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFFFEF7DD
      C4BC9F675BEAB474EFA952F6A036A5686BFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFD49875FCF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFDDC7C29F675BEAB273EFA751A5686BFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFD49875FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D0CE9F675BEDB572A5686BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD39570E6C2ACE7C6B0E7C6B0E6
      C4B0E3C2B0E1C0AFDEBDADDCBCACD8BAACD5B7ABD3B5ABC099909F675BA5686B
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Layout = blGlyphTop
  end
  object BitBtn4: TBitBtn
    Left = 342
    Top = 94
    Width = 49
    Height = 21
    Caption = '&OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = BitBtn4Click
  end
end
