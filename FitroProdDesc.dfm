object formFiltroProdDesc: TformFiltroProdDesc
  Left = 501
  Top = 278
  Width = 310
  Height = 173
  Caption = 'Filtro por Descri'#231#227'o'
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
  object TIGradient1: TTIGradient
    Left = 0
    Top = 0
    Width = 294
    Height = 135
    Align = alClient
    Style = grPyramid
    StartColor = clSkyBlue
    EndColor = clWhite
    Steps = 20
  end
  object Label1: TLabel
    Left = 25
    Top = 20
    Width = 251
    Height = 16
    Caption = 'INSIRA A DESCRI'#199#195'O A SER FILTRADA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object edtDescricao: TEdit
    Left = 64
    Top = 40
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object bbtConfirmar: TBitBtn
    Left = 37
    Top = 86
    Width = 75
    Height = 25
    Caption = '&Confirma'
    TabOrder = 1
    OnClick = bbtConfirmarClick
    Kind = bkOK
  end
  object bbtCancelar: TBitBtn
    Left = 174
    Top = 86
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    OnClick = bbtCancelarClick
    Kind = bkCancel
  end
end
