object formSeekFornecedor: TformSeekFornecedor
  Left = 297
  Top = 171
  Width = 643
  Height = 432
  Caption = 'Localiza'#231#227'o de fornecedor'
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
    Top = 0
    Width = 635
    Height = 398
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clInactiveCaptionText
    EndColor = clWhite
    Steps = 52
  end
  object lblCodigoFornecedor: TLabel
    Left = 376
    Top = 448
    Width = 143
    Height = 13
    Caption = 'Digite o c'#243'digo do fornecedor:'
    Visible = False
  end
  object lblNomeFantasia: TLabel
    Left = 376
    Top = 480
    Width = 95
    Height = 13
    Caption = 'Ou o nome fantasia:'
    Visible = False
  end
  object Label4: TLabel
    Left = 8
    Top = 6
    Width = 120
    Height = 15
    Caption = 'Pesquisar Por Nome:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object mskCodigoFornecedor: TMaskEdit
    Left = 536
    Top = 448
    Width = 33
    Height = 21
    TabOrder = 0
    Visible = False
  end
  object mskNomeFantasia: TMaskEdit
    Left = 480
    Top = 480
    Width = 145
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object btnOK: TBitBtn
    Left = 384
    Top = 520
    Width = 75
    Height = 25
    TabOrder = 2
    Visible = False
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 504
    Top = 520
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    Visible = False
    Kind = bkCancel
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 44
    Width = 617
    Height = 293
    DataSource = dmBaseDados.dsFornecedores
    FixedColor = clInactiveCaptionText
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        DropDownRows = 5
        Expanded = False
        FieldName = 'NomeFantasia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Nome Fantasia'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 305
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RazaoSocial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Raz'#227'o Social'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 245
        Visible = True
      end>
  end
  object edtFiltroFornec: TEdit
    Left = 8
    Top = 20
    Width = 617
    Height = 21
    TabOrder = 5
    OnChange = edtFiltroFornecChange
  end
  object btnPross: TTISButton
    Left = 236
    Top = 347
    Width = 161
    Height = 41
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Prosseguir'
    AutoSize = False
    ParentFont = False
    Default = True
    TabOrder = 6
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
end
