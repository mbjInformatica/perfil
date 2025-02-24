object formNecessidades: TformNecessidades
  Left = 200
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Processar Necessidades'
  ClientHeight = 212
  ClientWidth = 366
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
  object lblMensagem1: TLabel
    Left = 16
    Top = 16
    Width = 337
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Clique no bot'#227'o OK para rodar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMensagem2: TLabel
    Left = 32
    Top = 56
    Width = 313
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'as necessidades de compra.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bkOK: TBitBtn
    Left = 56
    Top = 112
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = bkOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 232
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 1
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 8
    Top = 160
    Width = 345
    Height = 25
    TabOrder = 2
  end
end
