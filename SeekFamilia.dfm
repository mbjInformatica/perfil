object formseekFamilia: TformseekFamilia
  Left = 231
  Top = 212
  BorderStyle = bsDialog
  Caption = 'Localização'
  ClientHeight = 135
  ClientWidth = 321
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
    Width = 169
    Height = 13
    Caption = 'Digite o código da família desejada:'
  end
  object lblOu: TLabel
    Left = 104
    Top = 40
    Width = 16
    Height = 13
    Caption = 'OU'
  end
  object llbMensagem2: TLabel
    Left = 16
    Top = 64
    Width = 89
    Height = 13
    Caption = 'O nome da família:'
  end
  object mskFamilia: TMaskEdit
    Left = 192
    Top = 8
    Width = 25
    Height = 21
    EditMask = '000;1;_'
    MaxLength = 3
    TabOrder = 0
    Text = '   '
  end
  object btnOk: TBitBtn
    Left = 72
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOkClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 168
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    Kind = bkCancel
  end
  object edtFamilia: TEdit
    Left = 112
    Top = 56
    Width = 153
    Height = 21
    TabOrder = 1
  end
end
