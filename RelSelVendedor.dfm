object formSelVendedor: TformSelVendedor
  Left = 321
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecionar Vendedor'
  ClientHeight = 146
  ClientWidth = 193
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
  object lblSelVendedor: TLabel
    Left = 48
    Top = 12
    Width = 63
    Height = 13
    Caption = 'Vendedor :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 120
    Height = 13
    Alignment = taCenter
    Caption = 'Situa'#231#227'o do Cliente :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object bbtSelCancelar: TBitBtn
    Left = 104
    Top = 120
    Width = 81
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 0
    OnClick = bbtSelCancelarClick
    Kind = bkCancel
  end
  object bbtSelVendedor: TBitBtn
    Left = 8
    Top = 120
    Width = 81
    Height = 25
    Caption = 'Con&firma'
    TabOrder = 1
    OnClick = bbtSelVendedorClick
    Kind = bkOK
  end
  object edtSelVendedor: TEdit
    Left = 120
    Top = 8
    Width = 20
    Height = 21
    Hint = '|Digite o C'#243'digo do Vendedor.'
    MaxLength = 2
    TabOrder = 2
  end
  object rdbAtivo: TRadioButton
    Left = 8
    Top = 48
    Width = 73
    Height = 17
    Hint = '|Selecione Para Listagem de Clientes Ativos.'
    Caption = 'Ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object rdbBloqueado: TRadioButton
    Left = 8
    Top = 72
    Width = 89
    Height = 17
    Hint = '|Selecione Para Listagem de Clientes Bloqueados.'
    Caption = 'Bloqueado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object rdbCancelado: TRadioButton
    Left = 104
    Top = 72
    Width = 81
    Height = 17
    Hint = '|Selecione Para Listagem de Clientes Cancelados.'
    Caption = 'Cancelado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object rdbInativo: TRadioButton
    Left = 104
    Top = 48
    Width = 81
    Height = 17
    Hint = '|Selecione Para Listagem de Clientes Inativos.'
    Caption = 'Inativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object ckbTodos: TCheckBox
    Left = 45
    Top = 96
    Width = 105
    Height = 17
    Hint = '|Selecione Para Listagem de Todos Clientes.'
    Caption = 'Todos Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
  end
end
