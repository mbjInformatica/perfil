object formMostraConsultaPedido: TformMostraConsultaPedido
  Left = 232
  Top = 126
  Width = 978
  Height = 520
  Caption = 'Consulta Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 37
    Width = 970
    Height = 449
    Cursor = crAppStart
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 14651200
    Steps = 54
  end
  object DBGrid1: TDBGrid
    Left = 3
    Top = 42
    Width = 944
    Height = 377
    DataSource = dmBaseDados.dsLogMensal
    FixedColor = 16311505
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DataLancamento'
        Title.Caption = 'Data Emiss'#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Documento'
        Title.Caption = 'N'#186' Pedido'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 421
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CodigoProduto'
        Title.Caption = 'Vendedor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 146
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnidadeMedida'
        Title.Caption = 'Pgto.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Subtotal'
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Arial'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end>
  end
  object btnOk: TTISButton
    Left = 429
    Top = 423
    Width = 90
    Height = 50
    Cursor = crAppStart
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'OK'
    AutoSize = False
    ParentFont = False
    Default = True
    TabOrder = 1
    Transparent = False
    ModalResult = 0
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
    Layout = blGlyphTop
    Spacing = 0
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnOkClick
  end
  object TIGradientCaption1: TTIGradientCaption
    Left = 0
    Top = 0
    Width = 970
    Height = 37
    Cursor = crAppStart
    GradientStartColor = clBackground
    GradientEndColor = clSkyBlue
    GradientStyle = grHorizontal
    LabelTop = 5
    LabelCaption = 'D'#234' um duplo clique para verificar o Pedido:'
    LabelFont.Charset = ANSI_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -21
    LabelFont.Name = 'Arial'
    LabelFont.Style = [fsBold]
    LabelAlignment = taCenter
    Align = alTop
    DoubleBuffered = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    TabOrder = 2
  end
end
