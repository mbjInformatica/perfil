object formECF: TformECF
  Left = 192
  Top = 114
  Width = 641
  Height = 228
  Align = alCustom
  Caption = 'ECF'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object LabelPorta: TLabel
    Left = 542
    Top = 53
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object btnRetornar: TSpeedButton
    Left = 548
    Top = 57
    Width = 57
    Height = 41
    Hint = '|Retorna ao menu principal.'
    Caption = '&Retornar'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
      03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
      0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
      0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
      0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
      0333337F777FFFFF7F3333000000000003333377777777777333}
    Layout = blGlyphTop
    NumGlyphs = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = btnRetornarClick
  end
  object ProgressBar1: TProgressBar
    Left = 64
    Top = 122
    Width = 23
    Height = 17
    Align = alCustom
    Step = 1
    TabOrder = 0
    Visible = False
  end
  object Memo1: TMemo
    Left = 96
    Top = 120
    Width = 15
    Height = 25
    Align = alCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object Tempo: TMaskEdit
    Left = 112
    Top = 120
    Width = 36
    Height = 22
    TabStop = False
    EditMask = '99;0;_'
    MaxLength = 2
    TabOrder = 2
    Text = '10'
    Visible = False
  end
  object Barra: TStatusBar
    Left = 0
    Top = 175
    Width = 633
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Width = 210
      end
      item
        Width = 50
      end>
  end
  object Edpagamento: TComboBox
    Left = 29
    Top = 123
    Width = 44
    Height = 22
    ItemHeight = 14
    TabOrder = 4
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 264
    Top = 16
    Width = 249
    Height = 121
    Caption = 'Redu'#231#227'o Z'
    TabOrder = 5
    object SpeedButton2: TSpeedButton
      Left = 163
      Top = 31
      Width = 70
      Height = 50
      Caption = 'Redu'#231#227'o Z'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      Layout = blGlyphTop
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    object Label17: TLabel
      Left = 15
      Top = 27
      Width = 26
      Height = 14
      Caption = 'Data:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 13
      Top = 59
      Width = 28
      Height = 14
      Caption = 'Hora:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdHoraz: TMaskEdit
      Left = 46
      Top = 59
      Width = 107
      Height = 22
      TabOrder = 0
      Text = '9999'
    end
    object EdDataZ: TMaskEdit
      Left = 46
      Top = 27
      Width = 107
      Height = 22
      TabOrder = 1
      Text = '0'
    end
    object CB_HVerao: TCheckBox
      Left = 32
      Top = 88
      Width = 129
      Height = 17
      Caption = 'Hor'#225'rio de Ver'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 48
    Top = 16
    Width = 161
    Height = 89
    Caption = 'Leitura X'
    TabOrder = 6
    object SpeedButton1: TSpeedButton
      Left = 40
      Top = 23
      Width = 70
      Height = 50
      Caption = 'Leitura X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
        555555777777777FF5555500000000805555557777777777FF555550BBBBB008
        05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
        005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
        055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
        055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
        05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
        05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
        005555555775FFFF77F555555570000000555555555777777755}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
end
