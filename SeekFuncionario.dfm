object formSeekFuncionario: TformSeekFuncionario
  Left = 237
  Top = 234
  BorderStyle = bsDialog
  Caption = 'Localização de funcionários'
  ClientHeight = 94
  ClientWidth = 303
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
    Left = 8
    Top = 16
    Width = 206
    Height = 13
    Caption = 'Digite a matrícula do funcionário a localizar:'
  end
  object mskFuncionario: TMaskEdit
    Left = 224
    Top = 16
    Width = 49
    Height = 21
    EditMask = '0000'
    MaxLength = 4
    TabOrder = 0
    Text = '    '
  end
  object btnOK: TBitBtn
    Left = 56
    Top = 48
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 184
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
end
