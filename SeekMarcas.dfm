object formSeekMarca: TformSeekMarca
  Left = 259
  Top = 230
  BorderStyle = bsDialog
  Caption = 'Localização'
  ClientHeight = 130
  ClientWidth = 301
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
    Width = 167
    Height = 13
    Caption = 'Digite o código da marca desejada:'
  end
  object lblMensagem2: TLabel
    Left = 8
    Top = 56
    Width = 100
    Height = 13
    Caption = 'ou o nome da marca:'
  end
  object mskMarca: TMaskEdit
    Left = 184
    Top = 16
    Width = 25
    Height = 21
    EditMask = '000'
    MaxLength = 3
    TabOrder = 0
    Text = '   '
  end
  object btnOK: TBitBtn
    Left = 48
    Top = 96
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 152
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 3
    Kind = bkCancel
  end
  object edtNomeMarca: TEdit
    Left = 120
    Top = 56
    Width = 177
    Height = 21
    TabOrder = 1
  end
end
