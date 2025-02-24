object formPositivacaoCliente: TformPositivacaoCliente
  Left = 285
  Top = 186
  Width = 219
  Height = 171
  Caption = 'Positivação de Clientes'
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
  object Label1: TLabel
    Left = 4
    Top = 7
    Width = 70
    Height = 13
    Caption = 'Data Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 113
    Top = 7
    Width = 63
    Height = 13
    Caption = 'Data Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 121
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Familia :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 7
    Top = 56
    Width = 59
    Height = 13
    Alignment = taCenter
    Caption = 'Vendedor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Data1: TDateTimePicker
    Left = 4
    Top = 23
    Width = 97
    Height = 21
    Hint = 'Selecione a Data Inicial do Período.'
    CalAlignment = dtaLeft
    Date = 36543.4814263889
    Time = 36543.4814263889
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 0
  end
  object Data2: TDateTimePicker
    Left = 113
    Top = 23
    Width = 97
    Height = 21
    Hint = 'Selecione a Data Final do Período.'
    CalAlignment = dtaLeft
    Date = 36543.4815128472
    Time = 36543.4815128472
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object btnCancela: TBitBtn
    Left = 116
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 5
    Kind = bkCancel
  end
  object btnOK: TBitBtn
    Left = 19
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object edtFamilia: TEdit
    Left = 175
    Top = 57
    Width = 25
    Height = 21
    Hint = 'Digite o Código da Familia ou '#39'000'#39' para Todas.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object edtV1: TEdit
    Left = 72
    Top = 57
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código do Vendedor sem '#39'0'#39' a esquerda, ou '#39'000'#39' para TO' +
      'DOS.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object pgrProcessamento: TProgressBar
    Left = 0
    Top = 118
    Width = 210
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 6
  end
end
