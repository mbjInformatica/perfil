object formCaixaServico: TformCaixaServico
  Left = 235
  Top = 210
  Width = 330
  Height = 141
  Hint = '|Caixa de totalização dos serviços.'
  Caption = 'Caixa de totalização dos serviços'
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
  object lblMensagem: TLabel
    Left = 8
    Top = 16
    Width = 133
    Height = 13
    Caption = 'Informe o período desejado:'
  end
  object lblA: TLabel
    Left = 224
    Top = 24
    Width = 6
    Height = 13
    Caption = 'à'
  end
  object lblInicio: TLabel
    Left = 144
    Top = 48
    Width = 3
    Height = 13
  end
  object lblFim: TLabel
    Left = 176
    Top = 48
    Width = 3
    Height = 13
  end
  object mskInicio: TMaskEdit
    Left = 152
    Top = 16
    Width = 57
    Height = 21
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 0
    Text = '  /  /  '
  end
  object btnOK: TBitBtn
    Left = 24
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 224
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 80
    Width = 305
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object mskFim: TMaskEdit
    Left = 248
    Top = 16
    Width = 57
    Height = 21
    EditMask = '!99/99/00;1;_'
    MaxLength = 8
    TabOrder = 1
    Text = '  /  /  '
  end
end
