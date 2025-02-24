object formFormaPagamento: TformFormaPagamento
  Left = 492
  Top = 73
  Width = 396
  Height = 428
  BorderIcons = []
  Caption = 'Forma de Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TIGradient1: TTIGradient
    Left = 0
    Top = 28
    Width = 380
    Height = 362
    Align = alClient
    ShowHint = False
    ParentShowHint = False
    Style = grPyramid
    StartColor = clWhite
    EndColor = 14651200
    Steps = 52
  end
  object Label2: TLabel
    Left = 91
    Top = 30
    Width = 205
    Height = 22
    Caption = 'Forma de Pagamento:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblDH: TLabel
    Left = 25
    Top = 124
    Width = 50
    Height = 15
    Caption = 'Dinheiro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblCH: TLabel
    Left = 311
    Top = 124
    Width = 46
    Height = 15
    Caption = 'Cheque:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblCL: TLabel
    Left = 51
    Top = 180
    Width = 71
    Height = 15
    Caption = 'Cr'#233'dito Loja:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblCC: TLabel
    Left = 97
    Top = 124
    Width = 85
    Height = 15
    Caption = 'Cart'#227'o Cr'#233'dito:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblCD: TLabel
    Left = 198
    Top = 124
    Width = 80
    Height = 15
    Caption = 'Cart'#227'o D'#233'bito:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblVP: TLabel
    Left = 150
    Top = 180
    Width = 82
    Height = 15
    Caption = 'Vale Presente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblOT: TLabel
    Left = 281
    Top = 180
    Width = 42
    Height = 15
    Caption = 'Outros:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblValorRestante: TLabel
    Left = 188
    Top = 300
    Width = 96
    Height = 16
    Caption = 'Valor Restante:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblVlRest: TLabel
    Left = 288
    Top = 298
    Width = 5
    Height = 23
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object lblValorTotal: TLabel
    Left = 4
    Top = 300
    Width = 72
    Height = 16
    Caption = 'Valor Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblVlTot: TLabel
    Left = 81
    Top = 298
    Width = 5
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Arial Black'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblVA: TLabel
    Left = 17
    Top = 236
    Width = 91
    Height = 15
    Caption = 'Vl. Alimenta'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblVR: TLabel
    Left = 142
    Top = 236
    Width = 80
    Height = 15
    Caption = 'Vale Refei'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object lblVC: TLabel
    Left = 257
    Top = 236
    Width = 100
    Height = 15
    Caption = 'Vale Combust'#237'vel:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Transparent = True
  end
  object Edpagamento: TComboBox
    Left = 356
    Top = 36
    Width = 21
    Height = 26
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 20
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object TIGradientCaption1: TTIGradientCaption
    Left = 0
    Top = 0
    Width = 380
    Height = 28
    GradientStartColor = clBackground
    GradientEndColor = clSkyBlue
    GradientStyle = grHorizontal
    LabelTop = 5
    LabelCaption = 'Selecione a Forma de Pagamento:'
    LabelFont.Charset = ANSI_CHARSET
    LabelFont.Color = clWhite
    LabelFont.Height = -16
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
    TabOrder = 2
  end
  object btnOK: TTISButton
    Left = 146
    Top = 347
    Width = 89
    Height = 35
    HotFont.Font.Charset = ANSI_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -12
    HotFont.Font.Name = 'Arial'
    HotFont.Font.Style = [fsBold]
    SkinLayOut = WINXP
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'OK'
    AutoSize = False
    ParentFont = False
    Default = True
    TabOrder = 3
    Transparent = False
    ModalResult = 0
    Glyph.Data = {
      76060000424D7606000000000000360400002800000018000000180000000100
      0800000000004002000000000000000000000001000000010000FF00FF00004F
      010000510100015503000257040001590400025D06000361060005620900056A
      0B00076A0E00086A0F000372080003790900047A0A00047D0A0007790E00096D
      12000A7413000C7417000A7D13000A7B14000D7618000D7818000F7E1C00058D
      0D0006900D000F831B000E841B00108B1D000790100009931300089612000A96
      15000C9717000D991B000E9A1C000F9D1F00109F1F001282210016892700178C
      2A0013982300119F2200169229001695280018952C001A9F2F001C9832001C99
      34001F9C370012A0220013A3270014A4260015A6290018AA2D001BA531001AAA
      31001CAD33001CAF35001FA139001FB43A0021A13B0022A03C0022B63E0023AA
      400027AF450028AC460027B1440028B0470025BB430025BD440027BC48002DBF
      4F002FBD54002CC14E002CC54F002DC4520035CA5F0035CC5F0035D05E0038D3
      64003BD168003CD76A003CD86A0041DC720042E2760000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000003000000000000000000000000000000000000
      0000000003030000000000000000000000000000000000000000000003030000
      0000000000000000000000000000000000000000030903000000000000000000
      0000000000000000000000000417030000000000000000000000000000000000
      00000000032F0800000000000000000301000000000000000000000004451703
      0000000000000003080300000000000000000000034A3C030000000000000003
      0D080100000000000000000003434E1603000000000000033F0D080300000000
      000000000328564208030000000000012F1E0D08030000000000000000115252
      4411070303030101321F190D090100000000000000032F5551492E1215151B2D
      0D1F19190D120100000000000000034354504D48403B373426221E19190D2903
      00000000000000033F4E504C463D3B3434221F19191A0D030000000000000000
      032742494C46403726261F1F192703000000000000000000000303172D2F2F3B
      3734221F17030000000000000000000000000003030303032236340901000000
      000000000000000000000000000000041D370303000000000000000000000000
      00000000000000041B0403000000000000000000000000000000000000000004
      0403000000000000000000000000000000000000000000030300000000000000
      0000000000000000000000000000000000000000000000000000}
    Layout = blGlyphLeft
    Spacing = 5
    ResHandle = 0
    MouseContinuouslyDownInterval = 100
    OnClick = btnOKClick
  end
  object cmbPgtoSAT: TComboBox
    Left = 68
    Top = 53
    Width = 253
    Height = 30
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 24
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      'DH - Dinheiro'
      'CH - Cheque'
      'CC - CartaodeCredito'
      'CD - CartaodeDebito'
      'PX - PIX'
      'CL - CreditoLoja'
      'VA - ValeAlimentacao'
      'VR - ValeRefeicao'
      'VP - ValePresente'
      'VC - ValeCombustivel'
      'OT - Outros')
  end
  object ckbPgMistoSAT: TTISCheckBox
    Left = 97
    Top = 93
    Width = 194
    Height = 22
    HotFont.Font.Charset = DEFAULT_CHARSET
    HotFont.Font.Color = clWindowText
    HotFont.Font.Height = -11
    HotFont.Font.Name = 'MS Sans Serif'
    HotFont.Font.Style = []
    SkinLayOut = WINXP
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Caption = 'Pagamento Misto S@T'
    AutoSize = True
    ParentFont = False
    Checked = False
    Transparent = True
    TabOrder = 4
    OnClick = ckbPgMistoSATClick
  end
  object edtDinheiro: TEdit
    Left = 17
    Top = 141
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnExit = edtDinheiroExit
  end
  object edtCheque: TEdit
    Left = 297
    Top = 141
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnExit = edtChequeExit
  end
  object edtCredLoja: TEdit
    Left = 49
    Top = 197
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnExit = edtCredLojaExit
  end
  object edtCartaoCredito: TEdit
    Left = 105
    Top = 141
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnExit = edtCartaoCreditoExit
  end
  object edtCartaoDebito: TEdit
    Left = 201
    Top = 141
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnExit = edtCartaoDebitoExit
  end
  object edtValePresente: TEdit
    Left = 153
    Top = 197
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnExit = edtValePresenteExit
  end
  object edtOutros: TEdit
    Left = 265
    Top = 197
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnExit = edtOutrosExit
  end
  object edtVlAlim: TEdit
    Left = 25
    Top = 253
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnExit = edtVlAlimExit
  end
  object edtVlRefeicao: TEdit
    Left = 145
    Top = 253
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnExit = edtVlRefeicaoExit
  end
  object edtVlComb: TEdit
    Left = 273
    Top = 253
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnExit = edtVlCombExit
  end
  object edtPIX: TEdit
    Left = 33
    Top = 349
    Width = 73
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    Visible = False
  end
end
