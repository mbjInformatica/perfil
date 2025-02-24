object FormBonificacaoTroca: TFormBonificacaoTroca
  Left = 237
  Top = 147
  BorderStyle = bsSingle
  Caption = 'Bonifica'#231#227'o & Troca'
  ClientHeight = 247
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 4
    Top = 156
    Width = 59
    Height = 13
    Caption = 'Vendedor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDtI: TLabel
    Left = 22
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
  object lblDtF: TLabel
    Left = 186
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
  object Label2: TLabel
    Left = 96
    Top = 156
    Width = 73
    Height = 13
    Caption = 'Fornecedor :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 212
    Top = 156
    Width = 48
    Height = 13
    Caption = 'Cliente :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rdgSelecao: TRadioGroup
    Left = 16
    Top = 48
    Width = 257
    Height = 49
    BiDiMode = bdLeftToRight
    Caption = 'Selecione o Relat'#243'rio'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Bonifica'#231#227'o'
      'Troca')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object btbProsseguir: TBitBtn
    Left = 47
    Top = 184
    Width = 75
    Height = 41
    Caption = 'Prosseguir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btbProsseguirClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333333333333333333FFF333333333333000333333333
      3333777FFF3FFFFF33330B000300000333337F777F777773F333000E00BFBFB0
      3333777F773333F7F333000E0BFBF0003333777F7F3337773F33000E0FBFBFBF
      0333777F7F3333FF7FFF000E0BFBF0000003777F7F3337777773000E0FBFBFBF
      BFB0777F7F33FFFFFFF7000E0BF000000003777F7FF777777773000000BFB033
      33337777773FF733333333333300033333333333337773333333333333333333
      3333333333333333333333333333333333333333333333333333333333333333
      3333333333333333333333333333333333333333333333333333}
    Layout = blGlyphBottom
    NumGlyphs = 2
  end
  object btbSair: TBitBtn
    Left = 160
    Top = 184
    Width = 75
    Height = 41
    Caption = 'Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btbSairClick
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
    Layout = blGlyphBottom
    NumGlyphs = 2
  end
  object edtVendedor: TEdit
    Left = 64
    Top = 153
    Width = 25
    Height = 21
    Hint = '|Digite um n'#186' de um vendedor ou '#39'000'#39' para todos.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object Data1: TDateTimePicker
    Left = 14
    Top = 23
    Width = 115
    Height = 21
    Date = 38404.481426389000000000
    Time = 38404.481426389000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object Data2: TDateTimePicker
    Left = 160
    Top = 23
    Width = 113
    Height = 21
    Date = 38404.481512847000000000
    Time = 38404.481512847000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object pgrProcessamento: TProgressBar
    Left = 0
    Top = 232
    Width = 289
    Height = 16
    TabOrder = 6
  end
  object edtFornecedor: TEdit
    Left = 172
    Top = 153
    Width = 33
    Height = 21
    TabOrder = 7
  end
  object ckbTodosVendedores: TCheckBox
    Left = 4
    Top = 104
    Width = 127
    Height = 17
    Caption = 'Todos Vendedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = ckbTodosVendedoresClick
  end
  object ckbTodosFornecedores: TCheckBox
    Left = 152
    Top = 104
    Width = 137
    Height = 17
    Caption = 'Todos Fornecedores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = ckbTodosFornecedoresClick
  end
  object edtCliente: TEdit
    Left = 264
    Top = 153
    Width = 25
    Height = 21
    TabOrder = 10
    Text = '000'
  end
  object ckbTodosClientes: TCheckBox
    Left = 88
    Top = 126
    Width = 113
    Height = 17
    Caption = 'Todos Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = ckbTodosClientesClick
  end
end
