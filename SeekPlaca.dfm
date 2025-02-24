object formseekPlaca: TformseekPlaca
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Localização'
  ClientHeight = 88
  ClientWidth = 231
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
  object lblMensagem: TLabel
    Left = 16
    Top = 16
    Width = 122
    Height = 13
    Caption = 'Digite a placa do veículo:'
  end
  object mskPlaca: TMaskEdit
    Left = 144
    Top = 8
    Width = 65
    Height = 21
    CharCase = ecUpperCase
    EditMask = 'AAA-9999;1;_'
    MaxLength = 8
    TabOrder = 0
    Text = '   -    '
  end
  object btnOk: TBitBtn
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 120
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
end
