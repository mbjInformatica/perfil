object formSeekCliNFe: TformSeekCliNFe
  Left = 165
  Top = 78
  Width = 851
  Height = 565
  BorderIcons = []
  Caption = 'Localiza'#231#227'o de Cliente'
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 0
    Width = 843
    Height = 531
    Align = alClient
    Style = grPyramid
    StartColor = clWhite
    EndColor = 14187790
  end
  object lblMensagem: TLabel
    Left = 410
    Top = 128
    Width = 177
    Height = 16
    Alignment = taCenter
    Caption = 'Digite o I.E./R.G. do Cliente:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblDigiteCpf: TLabel
    Left = 55
    Top = 84
    Width = 176
    Height = 16
    Alignment = taCenter
    Caption = 'Digite o CPF do Cliente......:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblCodCli: TLabel
    Left = 55
    Top = 128
    Width = 175
    Height = 16
    Alignment = taCenter
    Caption = 'Digite o C'#243'digo do Cliente :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 40
    Top = 105
    Width = 215
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = 'ou'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblou3: TLabel
    Left = 483
    Top = 105
    Width = 16
    Height = 16
    Caption = 'ou'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblDigiteCNPJ: TLabel
    Left = 410
    Top = 84
    Width = 176
    Height = 16
    Caption = 'Digite o CNPJ do Cliente....:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 654
    Top = 36
    Width = 156
    Height = 16
    Caption = 'Digite o Nome Fantasia :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    Visible = False
  end
  object Label4: TLabel
    Left = 8
    Top = 32
    Width = 266
    Height = 16
    Caption = 'Digite o Nome do cliente a ser localizado:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 98
    Top = 4
    Width = 103
    Height = 19
    Alignment = taCenter
    Caption = '< F1 >: NOME'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label5: TLabel
    Left = 254
    Top = 4
    Width = 92
    Height = 19
    Alignment = taCenter
    Caption = '< F2 >: CPF '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 396
    Top = 4
    Width = 123
    Height = 19
    Alignment = taCenter
    Caption = '< F3 >: C'#211'DIGO '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 561
    Top = 4
    Width = 103
    Height = 19
    Alignment = taCenter
    Caption = '< F4 >: CNPJ '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 705
    Top = 4
    Width = 114
    Height = 19
    Alignment = taCenter
    Caption = '< F5 >: I.E / RG '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 3
    Top = 4
    Width = 75
    Height = 19
    Alignment = taCenter
    Caption = 'BUSCAS:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object mskCliente: TMaskEdit
    Left = 595
    Top = 128
    Width = 182
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = mskClienteChange
  end
  object btnOK: TBitBtn
    Left = 327
    Top = 160
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCancela: TBitBtn
    Left = 428
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Cancela'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = btnCancelaClick
    Kind = bkCancel
  end
  object mskCpf: TMaskEdit
    Left = 235
    Top = 84
    Width = 140
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = mskCpfChange
  end
  object mskCodCli: TMaskEdit
    Left = 235
    Top = 128
    Width = 140
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnChange = mskCodCliChange
  end
  object mskCnpj: TMaskEdit
    Left = 595
    Top = 84
    Width = 182
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnChange = mskCnpjChange
  end
  object dblFantasia: TDBLookupComboBox
    Left = 723
    Top = 36
    Width = 54
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    KeyField = 'NomeFantasia'
    ListField = 'NomeFantasia'
    ListSource = dmBaseDados.dsClientes
    ParentFont = False
    TabOrder = 6
    Visible = False
    OnClick = dblFantasiaClick
  end
  object dbgClientes: TDBGrid
    Left = 1
    Top = 192
    Width = 829
    Height = 265
    DataSource = dmBaseDados.dsClientes
    FixedColor = 16311505
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgClientesCellClick
    OnKeyPress = dbgClientesKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoCliente'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        DropDownRows = 5
        Expanded = False
        FieldName = 'NomeCliente'
        Title.Caption = 'Nome Cliente'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 211
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeFantasia'
        Title.Caption = 'Obra'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 208
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EnderecoResidencia'
        Title.Caption = 'Endere'#231'o'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 243
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ClienteCompra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Status'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 95
        Visible = True
      end>
  end
  object edtFiltrocliente: TEdit
    Left = 18
    Top = 48
    Width = 623
    Height = 23
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edtFiltroclienteChange
    OnKeyPress = edtFiltroclienteKeyPress
  end
  object btnPross: TTISButton
    Left = 340
    Top = 468
    Width = 166
    Height = 52
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Prosseguir'
    AutoSize = False
    ParentFont = False
    TabOrder = 9
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      1E050000424D1E05000000000000DE0200002800000018000000180000000100
      08000000000040020000120B0000120B0000AA000000AA00000000000000FFFF
      FF00FF00FF00FFFEFE00F6600000E95B0000BB490000B6470000B4460000B145
      0000AF440000AC430000AA420000A741000090380000893500007B300000792F
      0000772E00006C2A0000642700005F2500005D2400005B230000552100005320
      00004D1E00004B1D0000491C0000431A0000411900003C170000FF640000FB63
      0000F8620000F05E0000EE5D0000EB5C0000E65A0000E3590000E1580000DE57
      0000D9550000D9560000D7540000D4530000D1520000CF510000CC500000CA4F
      0000C74E0000C54D0000C24C0000C04B0000BD4A0000B8480000A7420000A541
      0000A3400000A03F00009E3E000087350000843400008233000080320000732D
      0000702C00006E2B000066280000572200004F1F0000471C00003A1700003816
      0000361600003515000033140000FF660100FB650100A9440100FF690300FB68
      0300ED620300AA450200AA470300FF6C0600FF6D0700AC490500FF6F0900FF72
      0C00EF6C0D00FF750F00FF761100FF791500E06C1600FF7F1C00D76B1800C462
      1600FF801E00D56B1900DE701C00CC671800C9661800C2631800BC601800B85E
      1800FF842400EF7D2300FC862700FF872800D8742300FF8E3200FC8E3300DC7A
      2C00FF903500FF923900D87F3500FF9A4600FF9D4A00FF9E4C00FFA05000CE81
      4100D7A17300FFF4EB00FFFAF600FCF7F300FFA35400FFA45600FFAA6000FFAF
      6900FFB16D00D0935E00FFB87A00D49C6A00FFBC8100FFC18A00FEC18A00D9A6
      7900FFC59100DAAB8000FFCC9D00DDB18900E0B58F00E0B69000E1B89300FED1
      A700E2BB9700FFD4AC00FEE7D300FFEBD900FAEADC00F7E9DC00FCF4ED00FAF2
      EB00FFCFA100FFD4AB00E5C2A100FFD9B500F4D7BA00FFE1C400F8E2CC00F6E0
      CA00FFE9D300FFE9D400FAE5D000FEE9D400FBEFE300FAF4EE00FEFAF600FFFB
      F60002020202020202024B4B491D1D494A4B0202020202020202020202020202
      4C4A1C423D0E0E0F1246494B02020202020202020202021B471039090A0B0B0A
      090D3E194902020202020202020245160D090B0D0D0D0D0D0D0C090B13480202
      0202020202151336070C0D0D3B3B0D0D0D0D0D0B09414802020202021E133035
      07090C3A0C0D0D0D0D0D0D0D0C094249020202021C312D3435073A0C0D839999
      90540D0D0D0C0A1A020202180E052E31360B0A0C0D8501010192540D0D0D093E
      490202452C262A31090B0B0C0D578E0101018F530D0D0C0C1C02171104272932
      070C0C0C0C0C0C890301018D4F0D0D09141F173C2024295A6368666567676169
      9C0101018B380D09101F4406550420A57CA87C7C7C7CA97DA7010101017A0D09
      3D48422C5F4D210301010101010101010101010101A70C0A0F1B112C735C2191
      A3A2A2A2A2A294A1970101017D790B093D1F40307772224E5151515151522B60
      9E01019874310809121F020B76815D282121212121046BA00101A67131350A09
      16020207628A7E502822212121707B0101966E323437070B1D0202022A868C72
      2029042121880101A4642F303236323F0202020223629A8C6F502804216C9593
      5E2A2C2E3030351B020202020231759D9B785D0424502125240526292A2D4302
      02020202020233769D9F87776D5C58595B5B562127110202020202020202022A
      6A869B9D8C868280786F5D231002020202020202020202022A2A6D808484827F
      7259341302020202020202020202020202022A2C04042205363F020202020202
      0202}
    Layout = blGlyphLeft
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnProssClick
  end
  object btnCad: TTISButton
    Left = 10
    Top = 463
    Width = 207
    Height = 54
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
    Caption = 'Cadastrar Cliente  < F6 >'
    AutoSize = False
    Visible = False
    ParentFont = False
    TabOrder = 10
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      555555FFFFFFFFFF5F5557777777777505555777777777757F55555555555555
      055555555555FF5575F555555550055030555555555775F7F7F55555550FB000
      005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
      B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
      305555577F555557F7F5550E0BFBFB003055557575F55577F7F550EEE0BFB0B0
      305557FF575F5757F7F5000EEE0BFBF03055777FF575FFF7F7F50000EEE00000
      30557777FF577777F7F500000E05555BB05577777F75555777F5500000555550
      3055577777555557F7F555000555555999555577755555577755}
    Layout = blGlyphTop
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnCadClick
  end
end
