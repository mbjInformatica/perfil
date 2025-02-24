object formEstornoPedido: TformEstornoPedido
  Left = 302
  Top = 91
  Align = alClient
  BorderStyle = bsDialog
  Caption = 'Estorno de Pedido'
  ClientHeight = 548
  ClientWidth = 875
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblRequisicao: TLabel
    Left = 8
    Top = 16
    Width = 111
    Height = 13
    Caption = 'N'#250'mero da Requisi'#231#227'o:'
  end
  object lblDataEmissao: TLabel
    Left = 600
    Top = 16
    Width = 68
    Height = 13
    Caption = 'Data Emiss'#227'o:'
  end
  object dbtDataEmissao: TDBText
    Left = 685
    Top = 16
    Width = 81
    Height = 17
    DataField = 'DataEmissao'
    DataSource = dmBaseDados.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblQuantidade: TLabel
    Left = 600
    Top = 48
    Width = 58
    Height = 13
    Caption = 'Quantidade:'
  end
  object btnRetornar: TSpeedButton
    Left = 728
    Top = 495
    Width = 46
    Height = 41
    Hint = '|Retorna ao menu principal.'
    Caption = '&Retornar'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRetornarClick
  end
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 35
    Height = 13
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 376
    Top = 48
    Width = 49
    Height = 13
    Caption = 'Vendedor:'
  end
  object lblNumerodoPedido: TLabel
    Left = 132
    Top = 16
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtNumeroPedido: TDBText
    Left = 141
    Top = 16
    Width = 101
    Height = 13
    AutoSize = True
    DataField = 'NPedido'
    DataSource = dmBaseDados.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtNomeCliente: TDBText
    Left = 53
    Top = 48
    Width = 90
    Height = 13
    AutoSize = True
    DataField = 'NomeCliente'
    DataSource = dmBaseDados.dsClientes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbtNomeVendedor: TDBText
    Left = 437
    Top = 48
    Width = 105
    Height = 13
    AutoSize = True
    DataField = 'Vendedor'
    DataSource = dmBaseDados.dsPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grdProdutos: TDBGrid
    Left = 10
    Top = 80
    Width = 781
    Height = 409
    DataSource = dmBaseDados.dsqPedidos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = grdProdutosCellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Unitario'
        Title.Caption = 'Unit'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Visible = True
      end>
  end
  object ckbTotalParcial: TCheckBox
    Left = 288
    Top = 16
    Width = 97
    Height = 17
    Caption = '&Exclus'#227'o Total'
    TabOrder = 1
    OnClick = ckbTotalParcialClick
  end
  object edtQuantidade: TEdit
    Left = 680
    Top = 48
    Width = 41
    Height = 21
    TabOrder = 2
    OnExit = edtQuantidadeExit
  end
  object ckbAproveitarpedido: TCheckBox
    Left = 408
    Top = 16
    Width = 129
    Height = 17
    Caption = 'Aproveitar o pedido.'
    TabOrder = 3
  end
  object qryUtil: TQuery
    AutoRefresh = True
    DatabaseName = 'SistemaGestaoEstoque'
    RequestLive = True
    Left = 196
    Top = 48
  end
end
