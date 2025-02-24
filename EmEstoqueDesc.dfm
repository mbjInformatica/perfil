object formEmEstoqueDesc: TformEmEstoqueDesc
  Left = 277
  Top = 229
  Width = 234
  Height = 194
  Caption = 'Em Estoque?'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblEstoque: TLabel
    Left = 24
    Top = 8
    Width = 176
    Height = 19
    Alignment = taCenter
    Caption = 'Produtos em Estoque?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbtConfirmar: TBitBtn
    Left = 29
    Top = 127
    Width = 60
    Height = 25
    Hint = 
      '|Clique aqui para tirar Listagem da Quantidade de Produtos em Es' +
      'toque.'
    Caption = 'Sim       '
    TabOrder = 0
    OnClick = bbtConfirmarClick
    Kind = bkOK
  end
  object bbtCancelar: TBitBtn
    Left = 126
    Top = 127
    Width = 67
    Height = 25
    Hint = '|Clique aqui para tirar Listagem dos Produtos.'
    Caption = 'Não'
    TabOrder = 1
    OnClick = bbtCancelarClick
    Kind = bkCancel
  end
  object ckbValorFuturo: TCheckBox
    Left = 59
    Top = 32
    Width = 121
    Height = 17
    Caption = 'Valores Futuros?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object ckbEstoqueFuturo: TCheckBox
    Left = 59
    Top = 53
    Width = 121
    Height = 17
    Caption = 'Estoque Futuro?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ckbSemValor: TCheckBox
    Left = 59
    Top = 77
    Width = 97
    Height = 17
    Caption = 'Sem Valores?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object rbdICMS: TRadioButton
    Left = 8
    Top = 104
    Width = 57
    Height = 17
    Caption = 'ICMS'
    TabOrder = 5
    OnClick = rbdICMSClick
  end
  object rbdSemICMS: TRadioButton
    Left = 80
    Top = 104
    Width = 73
    Height = 17
    Caption = 'Sem ICMS'
    TabOrder = 6
    OnClick = rbdSemICMSClick
  end
  object rbdTodos: TRadioButton
    Left = 160
    Top = 104
    Width = 57
    Height = 17
    Caption = 'Todos'
    Checked = True
    TabOrder = 7
    TabStop = True
    OnClick = rbdTodosClick
  end
end
