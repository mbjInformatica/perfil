object formLocalizaCliente: TformLocalizaCliente
  Left = 493
  Top = 278
  Width = 363
  Height = 218
  Caption = 'Localiza se cliente j'#225' esta cadastrado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 25
    Width = 347
    Height = 154
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 14651200
    Steps = 54
  end
  object lblCEP: TLabel
    Left = 20
    Top = 92
    Width = 112
    Height = 18
    Caption = 'CEP do Cliente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object fldCepteste: TTISEdit
    Left = 150
    Top = 90
    Width = 83
    Height = 23
    Hint = 'Digite o CEP do cliente, sem tra'#231'os ou espa'#231'os.'
    BorderColor = clBlack
    Hot.Font.Font.Charset = DEFAULT_CHARSET
    Hot.Font.Font.Color = clWindowText
    Hot.Font.Font.Height = -11
    Hot.Font.Font.Name = 'MS Sans Serif'
    Hot.Font.Font.Style = []
    Hot.Color.Color = clBlack
    Hot.Border.Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 8
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object mskCpf: TMaskEdit
    Left = 149
    Top = 49
    Width = 142
    Height = 22
    EditMask = '!990.990.900-00;1; '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 14
    ParentFont = False
    TabOrder = 1
    Text = '   .   .   -  '
  end
  object mskCnpj: TMaskEdit
    Left = 173
    Top = 49
    Width = 145
    Height = 22
    EditMask = '!90.900.900/0000-00;1; '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    MaxLength = 18
    ParentFont = False
    TabOrder = 2
    Text = '  .   .   /    -  '
  end
  object rdCPF: TTISRadioButton
    Left = 16
    Top = 48
    Width = 51
    Height = 21
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'CPF'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 0
    OnClick = rdCPFClick
    GroupIndex = 0
  end
  object rdCNPJ: TTISRadioButton
    Left = 80
    Top = 48
    Width = 61
    Height = 21
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'CNPJ'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 4
    OnClick = rdCNPJClick
    GroupIndex = 0
  end
  object TIGradientCaption1: TTIGradientCaption
    Left = 0
    Top = 0
    Width = 347
    Height = 25
    GradientStartColor = clBackground
    GradientEndColor = clSkyBlue
    GradientStyle = grHorizontal
    LabelTop = 5
    LabelCaption = 'Digite o CNPJ ou CPF e o CEP do cliente:'
    LabelFont.Charset = ANSI_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -15
    LabelFont.Name = 'Arial'
    LabelFont.Style = [fsBold]
    LabelAlignment = taCenter
    Align = alTop
    DoubleBuffered = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    TabOrder = 5
  end
  object TISButton1: TTISButton
    Left = 132
    Top = 127
    Width = 89
    Height = 42
    HotFont.Font.Charset = ANSI_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -12
    HotFont.Font.Name = 'Arial'
    HotFont.Font.Style = [fsBold]
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    Caption = '   &OK'
    AutoSize = False
    ParentFont = False
    Default = True
    TabOrder = 6
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      0800000000004002000000000000000000000001000000010000FF00FF00004B
      0000035E06000464080007740E00097411000C7717000E7D1A00A4262600B02E
      2E00B6393900B83F3F00BA424200BC484800BF4D4D00C0515100C1555500C459
      5900C6616100C9666600CC6F6F00CC707000CE757500D17E7E000F811C00118C
      1F000793100008961200099714000A9915000C9A18000D9E1B0010951F000FA0
      1E00138F23001196210013902400159127001398230013992500159A2700169C
      28001B9F31001C9C340014A727001AAF31001BB0330020AA3B0021B83D0023AD
      410028C048002EC152002FC9540035CF5E0036D060003BD768003FD96F0041DC
      7000D3808000D4848400D6898900000000000000000000000000000000000000
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
      0000000000000000000000000000000000000001000000000000000000000000
      0000000000000000000001190100000000000000000000000000000000000000
      0001221A29010000000000000000000000000000000000000125211D1B280100
      00000000000000000000000000000001182D2C211E1B28010000000000000000
      000000000000010732302E2501291B2801000000000000000000000000010635
      34322A0100011E1D25010000000000000000000000013837362F010800000104
      1D280100000000000000000000012A3931010D1008000000011D200100000000
      000000000008013301100D0D1008000000011E1B0100000000000000080C1401
      120D08100C100800000001031B010000000000080B17161611080008100C1008
      0000000001040100000000083C3B3B1208000000080A0D0D0800000000010201
      00000008113C1308000000000000080D10080000000000010100000008160800
      00000000000000080D0D08000000000000010000000800000000000000000000
      08090D0800000000000000000000000000000000000000000000080A08000000
      0000000000000000000000000000000000000008090800000000000000000000
      0000000000000000000000000008080000000000000000000000000000000000
      0000000000000008000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    Layout = blGlyphLeft
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnOKClick
  end
  object ACBrCEP1: TACBrCEP
    ProxyPort = '8080'
    ContentsEncodingCompress = []
    NivelLog = 0
    WebService = wsViaCep
    ChaveAcesso = '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.'
    PesquisarIBGE = True
    Left = 264
    Top = 136
  end
end
