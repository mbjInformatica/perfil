object frmComissaoBKP: TfrmComissaoBKP
  Left = 250
  Top = 120
  Width = 297
  Height = 322
  Caption = 'Comissão BKP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 7
    Width = 70
    Height = 13
    Caption = 'Data Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 169
    Top = 7
    Width = 63
    Height = 13
    Caption = 'Data Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 112
    Top = 47
    Width = 59
    Height = 13
    Alignment = taCenter
    Caption = 'Vendedor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 4
    Top = 138
    Width = 52
    Height = 13
    Caption = 'Cliente : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 98
    Top = 138
    Width = 48
    Height = 13
    Caption = 'Familia :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 186
    Top = 138
    Width = 63
    Height = 13
    Caption = 'Categoria :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Data1: TDateTimePicker
    Left = 22
    Top = 23
    Width = 97
    Height = 21
    Hint = '|Selecione a Data Inicial do Período.'
    CalAlignment = dtaLeft
    Date = 36543.4814263889
    Time = 36543.4814263889
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 0
  end
  object Data2: TDateTimePicker
    Left = 169
    Top = 23
    Width = 97
    Height = 21
    Hint = '|Selecione a Data Final do Período.'
    CalAlignment = dtaLeft
    Date = 36543.4815128472
    Time = 36543.4815128472
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 1
  end
  object bbtVisualizar: TBitBtn
    Left = 40
    Top = 237
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = '&Visualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bbtVisualizarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
      00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
      00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
      F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
      F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
      FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
      0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
      0033333337FFFFFF773333333000000003333333377777777333}
    NumGlyphs = 2
  end
  object bbtSair: TBitBtn
    Left = 160
    Top = 237
    Width = 89
    Height = 33
    Cursor = crHandPoint
    Caption = '&Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = bbtSairClick
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
    NumGlyphs = 2
  end
  object ckbTodosVendedores: TCheckBox
    Left = 8
    Top = 168
    Width = 129
    Height = 17
    Hint = '|Clique Aqui para Tirar Listagem de Todos Vendedores.'
    Caption = 'Todos Vendedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = ckbTodosVendedoresClick
  end
  object ckbTotal: TCheckBox
    Left = 64
    Top = 192
    Width = 169
    Height = 17
    Hint = '|Clique Aqui Para Inibir os Valores das Comissões.'
    Caption = 'Sem Totais em Comissão?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object edtCliente: TEdit
    Left = 56
    Top = 138
    Width = 33
    Height = 21
    Hint = '|Digite o Código do Cliente ou '#39'0000'#39' para Todos.'
    MaxLength = 4
    TabOrder = 6
  end
  object edtFamilia: TEdit
    Left = 152
    Top = 138
    Width = 25
    Height = 21
    Hint = '|Digite o Código da Familia ou '#39'000'#39' para Todas.'
    MaxLength = 3
    TabOrder = 7
  end
  object edtCategoria: TEdit
    Left = 256
    Top = 138
    Width = 25
    Height = 21
    Hint = '|Digite o Código da Categoria (Sub-Familia) ou '#39'000'#39' para Todas.'
    CharCase = ecUpperCase
    MaxLength = 3
    TabOrder = 8
    OnChange = edtCategoriaChange
  end
  object ckbTClientes: TCheckBox
    Left = 152
    Top = 168
    Width = 129
    Height = 17
    Hint = '|Clique Aqui para Tirar Listagem de Total de Clientes.'
    Caption = 'Total de Clientes ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = ckbTClientesClick
  end
  object rbtAnalitico: TRadioButton
    Left = 8
    Top = 216
    Width = 129
    Height = 17
    Hint = '|Selecione Para Tirar Relatório Analítico.'
    Caption = 'Relatório Analítico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object rbtSintetico: TRadioButton
    Left = 160
    Top = 216
    Width = 129
    Height = 17
    Hint = '|Selecione Para Tirar Relatório Sintético.'
    Caption = 'Relatório Sintético'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object pgrProcessamento: TProgressBar
    Left = 0
    Top = 272
    Width = 289
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 12
  end
  object edtV1: TEdit
    Left = 24
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 13
  end
  object edtV2: TEdit
    Left = 48
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 14
  end
  object edtV3: TEdit
    Left = 72
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 15
  end
  object edtV4: TEdit
    Left = 96
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 16
  end
  object edtV5: TEdit
    Left = 120
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 17
  end
  object edtV6: TEdit
    Left = 144
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 18
  end
  object edtV7: TEdit
    Left = 168
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 19
  end
  object edtV8: TEdit
    Left = 192
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 20
  end
  object edtV9: TEdit
    Left = 216
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 21
  end
  object edtV10: TEdit
    Left = 240
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    TabOrder = 22
  end
  object dblkVendedor: TDBLookupComboBox
    Left = 16
    Top = 112
    Width = 257
    Height = 21
    Hint = '|Consulta de Vendedores.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    KeyField = 'NomeFuncionario'
    ListField = 'NomeFuncionario'
    ListSource = dmBaseDados.dsFuncionarios
    ParentFont = False
    TabOrder = 23
  end
  object ckbPorPedido: TCheckBox
    Left = 88
    Top = 89
    Width = 97
    Height = 17
    Caption = 'Por Pedido?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 24
  end
end
