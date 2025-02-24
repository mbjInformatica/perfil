object formIndexar: TformIndexar
  Left = 269
  Top = 242
  Width = 339
  Height = 121
  BorderIcons = [biSystemMenu]
  Caption = 'Indexar Tabelas'
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
  object lblindex: TLabel
    Left = 4
    Top = 8
    Width = 322
    Height = 16
    Caption = 'Click no bot'#227'o OK para  Indexar Todas as  tabelas:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 33
    Caption = 'OK'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
end
