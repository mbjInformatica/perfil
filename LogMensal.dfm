object formLogMensal: TformLogMensal
  Left = 230
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Log Mensal'
  ClientHeight = 138
  ClientWidth = 236
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
  object lblMesAno: TLabel
    Left = 8
    Top = 16
    Width = 138
    Height = 13
    Caption = 'Informe o m'#234's/ano desejado:'
  end
  object mskMesAno: TMaskEdit
    Left = 152
    Top = 16
    Width = 57
    Height = 21
    EditMask = '!90/0000;1; '
    MaxLength = 7
    TabOrder = 0
    Text = '  /    '
  end
  object btnOK: TBitBtn
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 112
    Width = 217
    Height = 16
    TabOrder = 3
  end
  object rdbSintetico: TRadioButton
    Left = 40
    Top = 48
    Width = 65
    Height = 17
    Caption = 'Sint'#233'tico'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnClick = rdbSinteticoClick
  end
  object rdbAnalitico: TRadioButton
    Left = 128
    Top = 48
    Width = 65
    Height = 17
    Caption = 'Anal'#237'tico'
    TabOrder = 5
    OnClick = rdbAnaliticoClick
  end
end
