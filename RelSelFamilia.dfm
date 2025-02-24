object formSelFamilia: TformSelFamilia
  Left = 291
  Top = 225
  BorderStyle = bsDialog
  Caption = 'Selecionar Família'
  ClientHeight = 129
  ClientWidth = 217
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
  object bbtConfirmar: TBitBtn
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Confirma'
    TabOrder = 1
    OnClick = bbtConfirmarClick
    Kind = bkOK
  end
  object bbtCancelar: TBitBtn
    Left = 136
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = bbtCancelarClick
    Kind = bkCancel
  end
  object dbcFamilia: TDBLookupComboBox
    Left = 7
    Top = 8
    Width = 202
    Height = 21
    KeyField = 'DescricaoFamilia'
    ListField = 'DescricaoFamilia'
    ListSource = dmBaseDados.dsFamilias
    TabOrder = 0
  end
  object ckbEstoque: TCheckBox
    Left = 8
    Top = 34
    Width = 89
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
    Left = 43
    Top = 56
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
    Top = 34
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
    Left = 43
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
