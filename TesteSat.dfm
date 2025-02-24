object formSwedaSAT: TformSwedaSAT
  Left = 324
  Top = 29
  Width = 688
  Height = 618
  Caption = 'SwedaSAT'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 3
    Top = 0
    Width = 677
    Height = 551
    Align = alClient
    Style = grPyramid
    StartColor = 16771026
    EndColor = 14651200
    Steps = 57
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Height = 551
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 551
    Width = 680
    Height = 33
    Panels = <
      item
        Width = 50
      end
      item
        Width = 100
      end
      item
        Width = 350
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 6
    Top = 8
    Width = 671
    Height = 536
    ActivePage = tabVenda
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object tabVenda: TTabSheet
      Caption = 'SAT Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnMouseMove = tabVendaMouseMove
      object Label7: TLabel
        Left = 221
        Top = 240
        Width = 105
        Height = 16
        Caption = 'Retornos SEFAZ:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Conteudo: TRichEdit
        Left = 25
        Top = 337
        Width = 616
        Height = 160
        Align = alCustom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 25
        Top = 19
        Width = 608
        Height = 139
        Align = alCustom
        Caption = 'Enviar Dados da Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object ListEnviar: TListBox
          Left = 15
          Top = 104
          Width = 570
          Height = 25
          Align = alCustom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          MultiSelect = True
          ParentFont = False
          PopupMenu = MenuList
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 7
          Top = 16
          Width = 586
          Height = 82
          Align = alCustom
          TabOrder = 1
          object BtCarregaXML: TButton
            Left = 439
            Top = 20
            Width = 136
            Height = 41
            Caption = 'Carregar Arquivos &XML'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BtCarregaXMLClick
          end
          object btnEnviarVenda: TTISButton
            Left = 19
            Top = 15
            Width = 166
            Height = 49
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
            Caption = 'Enviar Venda'
            AutoSize = False
            ParentFont = False
            TabOrder = 0
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
            Layout = blGlyphLeft
            Spacing = 4
            ResHandle = 0
            MouseContinuouslyDownInterval = 100
            OnClick = btnEnviarVendaClick
          end
          object btnCancelar: TTISButton
            Left = 227
            Top = 15
            Width = 166
            Height = 49
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
            Caption = 'Cancelar CF-e SAT'
            AutoSize = False
            ParentFont = False
            TabOrder = 2
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
            Layout = blGlyphLeft
            Spacing = 4
            ResHandle = 0
            MouseContinuouslyDownInterval = 100
            OnClick = btnCancelarClick
          end
        end
      end
      object edtRetorno: TRichEdit
        Left = 360
        Top = 184
        Width = 281
        Height = 137
        Align = alCustom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 2
      end
    end
    object tabConfiguracao: TTabSheet
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Panel1: TPanel
        Left = 7
        Top = 96
        Width = 546
        Height = 257
        Align = alCustom
        Caption = 'Panel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 1
          Top = 9
          Width = 536
          Height = 160
          Align = alCustom
          Caption = 'Emitente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 24
            Width = 31
            Height = 14
            Caption = 'CNPJ:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 16
            Top = 48
            Width = 12
            Height = 14
            Caption = 'IE:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 16
            Top = 72
            Width = 16
            Height = 14
            Caption = 'IM:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 16
            Top = 104
            Width = 50
            Height = 14
            Caption = 'CNPJ AC:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label6: TLabel
            Left = 16
            Top = 125
            Width = 47
            Height = 14
            Caption = 'SIGN AC:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdCNPJ: TMaskEdit
            Left = 56
            Top = 24
            Width = 137
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object Button4: TButton
            Left = 208
            Top = 16
            Width = 97
            Height = 41
            Caption = '&Salvar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = Button4Click
          end
          object EDIE: TMaskEdit
            Left = 56
            Top = 48
            Width = 137
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EDIM: TMaskEdit
            Left = 56
            Top = 72
            Width = 137
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EdCNPJAC: TMaskEdit
            Left = 72
            Top = 96
            Width = 353
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object Button5: TButton
            Left = 320
            Top = 16
            Width = 97
            Height = 41
            Caption = '&Carregar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = Button5Click
          end
          object EdSignAC: TMaskEdit
            Left = 72
            Top = 121
            Width = 353
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Text = 'SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT'
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 169
          Width = 536
          Height = 80
          Align = alCustom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Button1: TButton
            Left = 16
            Top = 8
            Width = 89
            Height = 25
            Caption = 'ConsultarSAT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnClick = Button1Click
          end
          object Edit1: TEdit
            Left = 208
            Top = 40
            Width = 193
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object BtExtrairLogs: TButton
            Left = 112
            Top = 8
            Width = 89
            Height = 25
            Caption = 'ExtrairLogs'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BtExtrairLogsClick
          end
          object BtConsultarSessao: TButton
            Left = 16
            Top = 40
            Width = 184
            Height = 23
            Caption = 'Consultar Numero Sess'#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = BtConsultarSessaoClick
          end
        end
        object CupomBase64: TMemo
          Left = 16
          Top = 384
          Width = 65
          Height = 49
          TabOrder = 2
          Visible = False
        end
        object XML: TMemo
          Left = 88
          Top = 360
          Width = 329
          Height = 49
          Lines.Strings = (
            'XML')
          TabOrder = 3
          Visible = False
        end
      end
      object Panel2: TPanel
        Left = 2
        Top = 8
        Width = 552
        Height = 81
        Align = alCustom
        Caption = 'Panel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object GroupBox2: TGroupBox
          Left = 8
          Top = 1
          Width = 539
          Height = 64
          Align = alCustom
          Caption = 'C'#243'digo de Ativa'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 24
            Width = 111
            Height = 15
            Caption = 'C'#243'digo de Ativa'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object EdCodAtivacao: TMaskEdit
            Left = 124
            Top = 24
            Width = 137
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'EdCodAtivacao'
            OnExit = EdCodAtivacaoExit
          end
          object BtFimaFim: TButton
            Left = 268
            Top = 16
            Width = 97
            Height = 41
            Caption = 'Teste &Fim a Fim'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BtFimaFimClick
          end
          object BtStOperacional: TButton
            Left = 370
            Top = 15
            Width = 162
            Height = 41
            Caption = 'Consulta Status Operacional'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = BtStOperacionalClick
          end
        end
      end
    end
  end
  object MenuList: TPopupMenu
    Left = 648
    Top = 56
    object InserirItem1: TMenuItem
      Caption = 'Inserir Item'
      OnClick = InserirItem1Click
    end
    object ExcluirItem1: TMenuItem
      Caption = 'Excluir Item'
      OnClick = ExcluirItem1Click
    end
    object E1: TMenuItem
      Caption = 'Excluir TODOS'
      OnClick = E1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 648
    Top = 24
  end
  object IdEncoderMIME1: TIdEncoderMIME
    FillChar = '='
    Left = 649
    Top = 137
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 649
    Top = 97
  end
end
