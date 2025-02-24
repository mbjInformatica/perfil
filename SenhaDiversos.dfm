object formSenhaDiversos: TformSenhaDiversos
  Left = 532
  Top = 258
  Width = 284
  Height = 168
  BorderIcons = []
  Caption = 'Senha'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 25
    Width = 268
    Height = 105
    Align = alClient
    Style = grPyramid
    StartColor = clBtnHighlight
    EndColor = clGradientInactiveCaption
    Steps = 49
  end
  object btnOK: TTISButton
    Left = 33
    Top = 76
    Width = 90
    Height = 50
    HotFont.Font.Charset = ANSI_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -12
    HotFont.Font.Name = 'Arial'
    HotFont.Font.Style = [fsBold]
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '   &Prosseguir'
    AutoSize = False
    ParentFont = False
    Default = True
    TabOrder = 1
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
      333333333333337FF3333333333333903333333333333377FF33333333333399
      03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
      99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
      99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
      03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
      33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
      33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
      3333777777333333333333333333333333333333333333333333}
    Layout = blGlyphTop
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnOKClick
  end
  object TISButton1: TTISButton
    Left = 151
    Top = 76
    Width = 90
    Height = 50
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = '&Cancelar'
    AutoSize = False
    ParentFont = False
    TabOrder = 2
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
      3333333777333777FF3333993333339993333377FF3333377FF3399993333339
      993337777FF3333377F3393999333333993337F777FF333337FF993399933333
      399377F3777FF333377F993339993333399377F33777FF33377F993333999333
      399377F333777FF3377F993333399933399377F3333777FF377F993333339993
      399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
      99333773FF3333777733339993333339933333773FFFFFF77333333999999999
      3333333777333777333333333999993333333333377777333333}
    Layout = blGlyphTop
    Spacing = 4
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = TISButton1Click
  end
  object edtSenha: TEdit
    Left = 44
    Top = 41
    Width = 185
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
  end
  object TIGradientCaption2: TTIGradientCaption
    Left = 0
    Top = 0
    Width = 268
    Height = 25
    GradientStartColor = clBackground
    GradientEndColor = clSkyBlue
    GradientStyle = grHorizontal
    LabelTop = 5
    LabelCaption = 'Digite a senha para continuar.'
    LabelFont.Charset = ANSI_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -15
    LabelFont.Name = 'Arial'
    LabelFont.Style = [fsBold]
    LabelAlignment = taCenter
    Align = alTop
    DoubleBuffered = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    TabOrder = 3
  end
end
