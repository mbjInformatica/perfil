object formProcessaNota: TformProcessaNota
  Left = 239
  Top = 187
  BorderStyle = bsDialog
  Caption = 'Processamento de Nota Fiscal'
  ClientHeight = 119
  ClientWidth = 300
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
    Width = 272
    Height = 20
    Caption = 'Confirma a grava'#231#227'o de Dados ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btnSim: TBitBtn
    Left = 32
    Top = 56
    Width = 75
    Height = 25
    Caption = '&Sim'
    TabOrder = 0
    OnClick = btnSimClick
    Kind = bkYes
  end
  object btnNao: TBitBtn
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    Caption = '&N'#227'o'
    TabOrder = 1
    Kind = bkNo
  end
  object prgProcessamento: TProgressBar
    Left = 8
    Top = 96
    Width = 281
    Height = 16
    TabOrder = 2
  end
end
