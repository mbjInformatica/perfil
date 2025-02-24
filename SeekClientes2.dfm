object formSeekClientes2: TformSeekClientes2
  Left = 65
  Top = 111
  Width = 713
  Height = 324
  Caption = 'Localiza'#231#227'o de Cliente'
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
  object lblMensagem: TLabel
    Left = 8
    Top = 48
    Width = 185
    Height = 13
    Caption = 'Digite o I.E./R.G. do Cliente a localizar:'
  end
  object lblOu1: TLabel
    Left = 64
    Top = 72
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object lblDigiteCpf: TLabel
    Left = 16
    Top = 96
    Width = 112
    Height = 13
    Caption = 'Digite o CPF do Cliente:'
  end
  object lblOu2: TLabel
    Left = 64
    Top = 120
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object lblDigiteNome: TLabel
    Left = 0
    Top = 192
    Width = 155
    Height = 13
    Caption = 'Digite a Raz'#227'o Social do Cliente:'
  end
  object lblCodCli: TLabel
    Left = 16
    Top = 8
    Width = 128
    Height = 13
    Caption = 'Digite o C'#243'digo do Cliente :'
  end
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object lblou3: TLabel
    Left = 64
    Top = 168
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object lblDigiteCNPJ: TLabel
    Left = 16
    Top = 144
    Width = 119
    Height = 13
    Caption = 'Digite o CNPJ do Cliente:'
  end
  object Label2: TLabel
    Left = 64
    Top = 208
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object Label3: TLabel
    Left = 16
    Top = 232
    Width = 116
    Height = 13
    Caption = 'Digite o Nome Fantasia :'
  end
  object Label4: TLabel
    Left = 376
    Top = 6
    Width = 99
    Height = 13
    Caption = 'Pesquisar Por Nome:'
  end
  object mskCliente: TMaskEdit
    Left = 216
    Top = 48
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object btnOK: TBitBtn
    Left = 72
    Top = 265
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = btnOKClick
    Kind = bkOK
  end
  object btnCancela: TBitBtn
    Left = 208
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 2
    Kind = bkCancel
  end
  object mskCpf: TMaskEdit
    Left = 216
    Top = 96
    Width = 145
    Height = 21
    EditMask = '!990.990.900-00;1; '
    MaxLength = 14
    TabOrder = 3
    Text = '   .   .   -  '
  end
  object mskCodCli: TMaskEdit
    Left = 288
    Top = 8
    Width = 73
    Height = 21
    TabOrder = 4
  end
  object mskCnpj: TMaskEdit
    Left = 216
    Top = 144
    Width = 145
    Height = 21
    EditMask = '!90.900.900/0000-00;1; '
    MaxLength = 18
    TabOrder = 5
    Text = '  .   .   /    -  '
  end
  object dblClientes: TDBLookupComboBox
    Left = 160
    Top = 187
    Width = 201
    Height = 21
    KeyField = 'NomeCliente'
    ListField = 'NomeCliente'
    ListSource = dmBaseDados.dsClientes
    TabOrder = 6
  end
  object dblFantasia: TDBLookupComboBox
    Left = 160
    Top = 232
    Width = 201
    Height = 21
    KeyField = 'NomeFantasia'
    ListField = 'NomeFantasia'
    ListSource = dmBaseDados.dsClientes
    TabOrder = 7
  end
  object BitBtn1: TBitBtn
    Left = 627
    Top = 263
    Width = 75
    Height = 25
    TabOrder = 8
    Kind = bkOK
  end
  object DBGrid1: TDBGrid
    Left = 376
    Top = 44
    Width = 321
    Height = 215
    DataSource = dmBaseDados.dsClientes
    ReadOnly = True
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        DropDownRows = 5
        Expanded = False
        FieldName = 'NomeCliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EnderecoResidencia'
        Width = 245
        Visible = True
      end>
  end
  object edtFiltrocliente: TEdit
    Left = 376
    Top = 21
    Width = 321
    Height = 21
    TabOrder = 10
    OnChange = edtFiltroclienteChange
  end
end
