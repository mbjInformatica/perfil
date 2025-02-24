object formEmEstoque: TformEmEstoque
  Left = 320
  Top = 228
  Width = 227
  Height = 161
  Caption = 'Em Estoque?'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblEstoque: TLabel
    Left = 21
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
    Top = 100
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
    Left = 136
    Top = 100
    Width = 57
    Height = 25
    Hint = '|Clique aqui para tirar Listagem dos Produtos. '
    Caption = 'Não'
    TabOrder = 1
    OnClick = bbtCancelarClick
    Kind = bkCancel
  end
  object ckbValorFuturo: TCheckBox
    Left = 51
    Top = 29
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
    Left = 51
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
    Left = 51
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
end
