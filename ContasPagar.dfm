object formContasPagar: TformContasPagar
  Left = 305
  Top = 178
  Width = 209
  Height = 263
  Hint = '|Relatório de Contas a Receber.'
  Caption = 'Contas a Pagar'
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
  object lblMensagem: TLabel
    Left = 24
    Top = 3
    Width = 161
    Height = 13
    Caption = 'Informe o período desejado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDtI: TLabel
    Left = 18
    Top = 18
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
    Left = 114
    Top = 18
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
  object lblNDoc: TLabel
    Left = 5
    Top = 93
    Width = 120
    Height = 13
    Caption = 'Número Documento :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 5
    Top = 63
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
  object Label2: TLabel
    Left = 126
    Top = 64
    Width = 34
    Height = 13
    Caption = 'Tipo :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 8
    Top = 180
    Width = 81
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 8
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
    Left = 112
    Top = 180
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Kind = bkCancel
  end
  object pgrProcessamento: TProgressBar
    Left = 0
    Top = 212
    Width = 201
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 10
  end
  object ckbEmissao: TCheckBox
    Left = 3
    Top = 118
    Width = 110
    Height = 17
    Hint = 'Selecionar por data de emissão'
    Caption = 'Por Emissão ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ckbEmissaoClick
  end
  object Data1: TDateTimePicker
    Left = 6
    Top = 34
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 38404.481426389
    Time = 38404.481426389
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
    Left = 104
    Top = 34
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 38404.481512847
    Time = 38404.481512847
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
    TabOrder = 1
  end
  object ckbBaixados: TCheckBox
    Left = 112
    Top = 118
    Width = 81
    Height = 17
    Caption = 'Baixados ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object edtNDoc: TEdit
    Left = 128
    Top = 91
    Width = 73
    Height = 21
    TabOrder = 4
  end
  object edtFornecedor: TEdit
    Left = 79
    Top = 62
    Width = 39
    Height = 21
    MaxLength = 4
    TabOrder = 2
  end
  object rdgTipoRelatorio: TRadioGroup
    Left = 14
    Top = 140
    Width = 177
    Height = 33
    Caption = 'Relatório'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Items.Strings = (
      'Analítico'
      'Sintético')
    ParentFont = False
    TabOrder = 7
  end
  object edtTipoForn: TComboBox
    Left = 160
    Top = 64
    Width = 41
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      'F'
      'R'
      'D'
      'C')
  end
end
