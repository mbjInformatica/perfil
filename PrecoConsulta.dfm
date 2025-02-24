object formPrecoConsulta: TformPrecoConsulta
  Left = 243
  Top = 103
  Width = 738
  Height = 557
  AutoSize = True
  Caption = 'Consulta de Pre'#231'os'
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
    Width = 730
    Height = 523
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 15645565
    Steps = 38
  end
  object DBText1: TDBText
    Left = 15
    Top = 64
    Width = 555
    Height = 25
    DataField = 'DescricaoAbreviada'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object DBText2: TDBText
    Left = 609
    Top = 64
    Width = 80
    Height = 22
    Alignment = taRightJustify
    AutoSize = True
    DataField = 'ValorVenda'
    DataSource = dmBaseDados.dsProdutos
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 16
    Top = 6
    Width = 167
    Height = 16
    Caption = 'Digite o nome do Produto:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object btnRetornar: TSpeedButton
    Left = 664
    Top = 9
    Width = 57
    Height = 48
    Hint = '|Retorna ao menu principal.'
    Caption = '&Retornar'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
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
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRetornarClick
  end
  object Label2: TLabel
    Left = 327
    Top = 514
    Width = 3
    Height = 9
    AutoSize = False
  end
  object Label3: TLabel
    Left = 701
    Top = 58
    Width = 29
    Height = 9
    AutoSize = False
  end
  object Label4: TLabel
    Left = 0
    Top = 50
    Width = 29
    Height = 9
    AutoSize = False
    Transparent = True
  end
  object dbgProdutos: TDBGrid
    Left = 7
    Top = 104
    Width = 714
    Height = 409
    DataSource = dmBaseDados.dsProdutos
    FixedColor = 15658734
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = [fsBold]
    OnKeyPress = dbgProdutosKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CodigoInterno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'C'#243'digo'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoAbreviada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Descri'#231#227'o'
        Width = 486
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorVenda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Title.Caption = 'Valor Venda'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlack
        Title.Font.Height = -11
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end>
  end
  object edtPesquisa: TEdit
    Left = 15
    Top = 24
    Width = 585
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = edtPesquisaChange
  end
  object btnLimpar: TButton
    Left = 606
    Top = 26
    Width = 1
    Height = 0
    TabOrder = 1
    OnClick = btnLimparClick
  end
end
