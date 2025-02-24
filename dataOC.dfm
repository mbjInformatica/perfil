object formDataOC: TformDataOC
  Left = 253
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Impress'#227'o de Ordem de Compra'
  ClientHeight = 130
  ClientWidth = 304
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
    Left = 0
    Top = 16
    Width = 185
    Height = 13
    Caption = 'Data de emiss'#227'o da Ordem de Compra:'
  end
  object mskData: TMaskEdit
    Left = 200
    Top = 16
    Width = 65
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object btnOK: TBitBtn
    Left = 64
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 96
    Width = 289
    Height = 24
    TabOrder = 3
  end
end
