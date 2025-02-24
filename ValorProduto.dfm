object formValorproduto: TformValorproduto
  Left = 114
  Top = 179
  Width = 576
  Height = 224
  Caption = 'Valor do Produto'
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
  object lblFamilia: TLabel
    Left = 42
    Top = 15
    Width = 52
    Height = 16
    Caption = 'Familia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCategoria: TLabel
    Left = 184
    Top = 16
    Width = 69
    Height = 16
    Caption = 'Categoria'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblMarca: TLabel
    Left = 48
    Top = 64
    Width = 44
    Height = 16
    Caption = 'Marca'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 184
    Top = 64
    Width = 93
    Height = 16
    Caption = 'Porcentagem'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtCategoria: TEdit
    Left = 312
    Top = 163
    Width = 121
    Height = 21
    MaxLength = 3
    TabOrder = 8
    Visible = False
  end
  object edtMarca: TEdit
    Left = 438
    Top = 162
    Width = 121
    Height = 21
    MaxLength = 3
    TabOrder = 9
    Visible = False
  end
  object chkVenda: TCheckBox
    Left = 24
    Top = 112
    Width = 115
    Height = 17
    Caption = 'Valor de Venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object chkCusto: TCheckBox
    Left = 175
    Top = 112
    Width = 115
    Height = 17
    Caption = 'Valor de Custo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object edtMargen: TEdit
    Left = 179
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object DBGrid1: TDBGrid
    Left = 312
    Top = 32
    Width = 248
    Height = 120
    DataSource = dmBaseDados.dsProdutos
    ReadOnly = True
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorVenda'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MargemLucro'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object btnOK: TButton
    Left = 72
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancelar: TButton
    Left = 168
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object edtFamilia1: TDBLookupComboBox
    Left = 38
    Top = 33
    Width = 129
    Height = 21
    KeyField = 'CodigoFamilia'
    ListField = 'DescricaoFamilia'
    ListSource = dmBaseDados.dsFamilias
    TabOrder = 0
    OnClick = edtFamilia1Click
  end
  object edtFamilia: TEdit
    Left = 184
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object edtCategoria1: TDBLookupComboBox
    Left = 176
    Top = 32
    Width = 121
    Height = 21
    KeyField = 'CodigoCategoria'
    ListField = 'DescricaoCategoria'
    ListSource = dmBaseDados.dsCategoria
    TabOrder = 1
    OnClick = edtCategoria1Click
  end
  object edtMarca1: TDBLookupComboBox
    Left = 32
    Top = 80
    Width = 129
    Height = 21
    KeyField = 'CodigoMarca'
    ListField = 'Marca'
    ListSource = dmBaseDados.dsMarcas
    TabOrder = 2
    OnClick = edtMarca1Click
  end
end
