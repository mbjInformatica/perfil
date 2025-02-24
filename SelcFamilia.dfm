object formSelecFamilia: TformSelecFamilia
  Left = 333
  Top = 259
  Width = 224
  Height = 123
  Caption = 'Selecione a Familia em Promoção'
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
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Confirma'
    TabOrder = 0
    OnClick = bbtConfirmarClick
    Kind = bkOK
  end
  object bbtCancelar: TBitBtn
    Left = 136
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 1
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
    TabOrder = 2
  end
  object ckbTodas: TCheckBox
    Left = 56
    Top = 32
    Width = 113
    Height = 17
    Caption = 'Todas Famílias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = ckbTodasClick
  end
end
