object formTipoRelCompra: TformTipoRelCompra
  Left = 291
  Top = 243
  BorderStyle = bsDialog
  Caption = 'Relatório Necessidades'
  ClientHeight = 113
  ClientWidth = 249
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnCodigo: TRadioButton
    Left = 56
    Top = 16
    Width = 129
    Height = 17
    Caption = 'Ordem de código'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object btnDescricao: TRadioButton
    Left = 56
    Top = 48
    Width = 145
    Height = 17
    Caption = 'Ordem de descrição'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object btnOK: TBitBtn
    Left = 88
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOKClick
    Kind = bkOK
  end
end
