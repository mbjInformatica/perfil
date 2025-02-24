object formSelSATCanc: TformSelSATCanc
  Left = 344
  Top = 54
  Width = 660
  Height = 571
  Caption = 'Cancelar S@T'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 28
    Width = 644
    Height = 505
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = 15645565
    EndColor = clWhite
    Steps = 52
  end
  object grdNotas: TDBGrid
    Left = 7
    Top = 36
    Width = 636
    Height = 433
    DataSource = dmBaseDados.dsCupomFiscal
    FixedColor = 16311505
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = grdNotasDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'NPedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Title.Caption = 'Chave de Acesso'
        Width = 287
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Data'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Hora'
        Title.Alignment = taCenter
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Pagamento'
        Title.Alignment = taCenter
        Title.Caption = 'Pgto.'
        Width = 29
        Visible = True
      end>
  end
  object TIGradientCaption1: TTIGradientCaption
    Left = 0
    Top = 0
    Width = 644
    Height = 28
    GradientStartColor = clBackground
    GradientEndColor = clSkyBlue
    GradientStyle = grHorizontal
    LabelTop = 5
    LabelCaption = 'Selecione o Cupom a ser cancelado:'
    LabelFont.Charset = ANSI_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -16
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
    TabOrder = 1
  end
  object TISButton1: TTISButton
    Left = 220
    Top = 481
    Width = 209
    Height = 44
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Prosseguir'
    AutoSize = False
    ParentFont = False
    TabOrder = 2
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
    Layout = blGlyphLeft
    Spacing = 10
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = TISButton1Click
  end
end
