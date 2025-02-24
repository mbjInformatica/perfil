object formContadesconto: TformContadesconto
  Left = 267
  Top = 211
  Width = 252
  Height = 135
  Caption = 'Desconto'
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
  object lblDesconto: TLabel
    Left = 8
    Top = 8
    Width = 235
    Height = 16
    Caption = 'Digiteo o percentual do desconto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblperc: TLabel
    Left = 160
    Top = 32
    Width = 17
    Height = 24
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtdesconto: TEdit
    Left = 80
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCanleca: TBitBtn
    Left = 143
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = btnCanlecaClick
    Kind = bkCancel
  end
end
