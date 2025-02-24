object formSelCategoria: TformSelCategoria
  Left = 290
  Top = 225
  Width = 230
  Height = 166
  Caption = 'Selecionar Categoria'
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
  object dbcCategoria: TDBLookupComboBox
    Left = 5
    Top = 8
    Width = 212
    Height = 21
    KeyField = 'DescricaoCategoria'
    ListField = 'DescricaoCategoria'
    ListSource = dmBaseDados.dsCategoria
    TabOrder = 0
  end
  object bbtConfirmar: TBitBtn
    Left = 5
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Confirma'
    TabOrder = 1
    OnClick = bbtConfirmarClick
    Kind = bkOK
  end
  object bbtCancelar: TBitBtn
    Left = 142
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = bbtCancelarClick
    Kind = bkCancel
  end
  object ckbEstoque: TCheckBox
    Left = 3
    Top = 35
    Width = 99
    Height = 17
    Caption = 'Em Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ckbValorFuturo: TCheckBox
    Left = 50
    Top = 58
    Width = 121
    Height = 17
    Caption = 'Valores Futuros?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object ckbEstoqueFuturo: TCheckBox
    Left = 107
    Top = 35
    Width = 105
    Height = 17
    Caption = 'Estoque Futuro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object ckbSemValor: TCheckBox
    Left = 51
    Top = 80
    Width = 97
    Height = 17
    Caption = 'Sem Valores?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
end
