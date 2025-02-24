object frmProdutosVendidosBKP: TfrmProdutosVendidosBKP
  Left = 298
  Top = 156
  Width = 265
  Height = 290
  Caption = 'Produtos Vendidos BKP'
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
  object lblDtI: TLabel
    Left = 30
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
    Left = 155
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
  object Label1: TLabel
    Left = 0
    Top = 128
    Width = 44
    Height = 13
    Caption = 'Cliente:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 96
    Top = 88
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
  object Label3: TLabel
    Left = 104
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Familia:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 84
    Top = 128
    Width = 133
    Height = 13
    Caption = 'Empresa em Promoção:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TBitBtn
    Left = 25
    Top = 209
    Width = 80
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
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
    Left = 149
    Top = 209
    Width = 84
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Kind = bkCancel
  end
  object Data1: TDateTimePicker
    Left = 20
    Top = 23
    Width = 97
    Height = 21
    Hint = '|Selecione a Data Inicial do Período.'
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
    TabOrder = 2
  end
  object Data2: TDateTimePicker
    Left = 142
    Top = 23
    Width = 97
    Height = 21
    Hint = '|Selecione a Data Final do Período.'
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
    TabOrder = 3
  end
  object edtCliente: TEdit
    Left = 46
    Top = 128
    Width = 32
    Height = 21
    Hint = '|Digite o Código do Cliente ou '#39'0000'#39' para Todos.'
    MaxLength = 4
    TabOrder = 4
  end
  object edtFamilia: TEdit
    Left = 32
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Para tirar Listagem de Uma Familia, Digite o Código no Primeiro ' +
      'Campo ou '#39'000'#39' Para Todas Familias.'
    MaxLength = 3
    TabOrder = 5
  end
  object ckbValor: TCheckBox
    Left = 139
    Top = 168
    Width = 102
    Height = 17
    Hint = '|Selecione para Inibir os Valores.'
    Caption = 'Sem  Valores?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object rdgTipoRelatorio: TRadioGroup
    Left = 10
    Top = 152
    Width = 117
    Height = 49
    Caption = 'Tipo de Relatório'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Analítico'
      'Sintético')
    ParentFont = False
    TabOrder = 7
  end
  object pgrProcessamento: TProgressBar
    Left = 0
    Top = 240
    Width = 257
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 8
  end
  object edtPromocao: TEdit
    Left = 218
    Top = 128
    Width = 38
    Height = 21
    Hint = '|Digite o Código da Empresa ou '#39'00000'#39' para Todos.'
    CharCase = ecUpperCase
    MaxLength = 5
    TabOrder = 9
  end
  object edtFamilia2: TEdit
    Left = 56
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 10
  end
  object edtFamilia3: TEdit
    Left = 80
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 11
  end
  object edtFamilia4: TEdit
    Left = 104
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 12
  end
  object edtFamilia5: TEdit
    Left = 128
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 13
  end
  object edtFamilia6: TEdit
    Left = 152
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 14
  end
  object edtFamilia7: TEdit
    Left = 176
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 15
  end
  object edtFamilia8: TEdit
    Left = 200
    Top = 64
    Width = 25
    Height = 21
    Hint = 
      'Digite o Código das Familias. Para tirar Listagem de Uma Familia' +
      ', Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 16
  end
  object edtVendedor: TEdit
    Left = 8
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código no Primeiro Campo Para Um Vendedor ou '#39'000'#39' Par' +
      'a Todos Vendedores.'
    MaxLength = 3
    TabOrder = 17
  end
  object edtVendedor2: TEdit
    Left = 32
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 18
  end
  object edtVendedor3: TEdit
    Left = 56
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 19
  end
  object edtVendedor4: TEdit
    Left = 80
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 20
  end
  object edtVendedor5: TEdit
    Left = 104
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 21
  end
  object edtVendedor6: TEdit
    Left = 128
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 22
  end
  object edtVendedor7: TEdit
    Left = 152
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 23
  end
  object edtVendedor8: TEdit
    Left = 176
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 24
  end
  object edtVendedor9: TEdit
    Left = 200
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 25
  end
  object edtVendedor10: TEdit
    Left = 224
    Top = 104
    Width = 25
    Height = 21
    Hint = 
      '|Digite o Código dos Vendedores. Para tirar Listagem de Um Vende' +
      'dor Digite o Código no Primeiro Campo.'
    MaxLength = 3
    TabOrder = 26
  end
end
