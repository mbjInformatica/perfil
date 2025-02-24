object formCheckout: TformCheckout
  Left = 315
  Top = 174
  Width = 222
  Height = 310
  Caption = 'Relatório de Checkout'
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
  object lblinicial: TLabel
    Left = 8
    Top = 48
    Width = 90
    Height = 13
    Caption = 'Chekout Inicial:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblfinal: TLabel
    Left = 121
    Top = 48
    Width = 83
    Height = 13
    Caption = 'Chekout Final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 14
    Top = 4
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
    Left = 126
    Top = 4
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
    Top = 93
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
    Top = 93
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
  object Label4: TLabel
    Left = 29
    Top = 145
    Width = 149
    Height = 13
    Caption = 'Cliente em qual Situação?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblcategoria: TLabel
    Left = 40
    Top = 120
    Width = 59
    Height = 13
    Caption = 'Categoria:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtfinal: TEdit
    Left = 145
    Top = 64
    Width = 34
    Height = 21
    Hint = 'Digite o número final ou '#39'00'#39' para TODOS.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object edtinicial: TEdit
    Left = 31
    Top = 64
    Width = 34
    Height = 21
    Hint = 'Digite o número inicial ou '#39'00'#39' para TODOS.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnOK: TBitBtn
    Left = 19
    Top = 230
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 12
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
  object btnCancela: TBitBtn
    Left = 116
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 13
    Kind = bkCancel
  end
  object Data1: TDateTimePicker
    Left = 4
    Top = 20
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Data2: TDateTimePicker
    Left = 113
    Top = 20
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
  object edtFamilia: TEdit
    Left = 175
    Top = 94
    Width = 25
    Height = 21
    Hint = 'Digite o Código da Familia ou '#39'000'#39' para Todas.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object edtV1: TEdit
    Left = 72
    Top = 94
    Width = 25
    Height = 21
    Hint = 
      'Digite o código do Vendedor "SEM '#39'0'#39' a esquerda"  ou '#39'000'#39' para ' +
      'todos.'
    MaxLength = 3
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object pgrProcessamento: TProgressBar
    Left = -1
    Top = 257
    Width = 215
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 14
  end
  object rdbAtivo: TRadioButton
    Left = 13
    Top = 162
    Width = 73
    Height = 17
    Hint = 'Selecione essa opção para clientes ATIVOS.'
    Caption = 'Ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = rdbAtivoClick
  end
  object rdbInativo: TRadioButton
    Left = 108
    Top = 162
    Width = 89
    Height = 17
    Hint = 'Selecione essa opção para clientes INATIVOS.'
    Caption = 'Inativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = rdbInativoClick
  end
  object rdbBloqueado: TRadioButton
    Left = 13
    Top = 186
    Width = 89
    Height = 17
    Hint = 'Selecione essa opção para clientes BLOQUEADOS.'
    Caption = 'Bloqueado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = rdbBloqueadoClick
  end
  object rdbCancelado: TRadioButton
    Left = 108
    Top = 186
    Width = 89
    Height = 17
    Hint = 'Selecione essa opção para clientes CANCELADOS.'
    Caption = 'Cancelado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = rdbCanceladoClick
  end
  object ckbTodos: TCheckBox
    Left = 50
    Top = 207
    Width = 105
    Height = 17
    Hint = 'Selecione essa opção para  TODOS clientes .'
    Caption = 'Todos Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = ckbTodosClick
  end
  object edtCategoria: TEdit
    Left = 104
    Top = 120
    Width = 25
    Height = 21
    TabOrder = 6
  end
end
