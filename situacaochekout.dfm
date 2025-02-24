object formsituacaochekout: Tformsituacaochekout
  Left = 209
  Top = 173
  Width = 214
  Height = 234
  Caption = 'Situação Chekout'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 72
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
  object lblnchekout: TLabel
    Left = 66
    Top = 0
    Width = 88
    Height = 13
    Caption = 'Nº de Chekout:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblchekoutinicial: TLabel
    Left = 8
    Top = 24
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
  object lblchekoutfinal: TLabel
    Left = 120
    Top = 24
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
  object rdbAtivo: TRadioButton
    Left = 8
    Top = 96
    Width = 73
    Height = 17
    Caption = 'Ativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object rdbInativo: TRadioButton
    Left = 111
    Top = 96
    Width = 89
    Height = 17
    Caption = 'Inativo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object rdbBloqueado: TRadioButton
    Left = 8
    Top = 120
    Width = 89
    Height = 17
    Caption = 'Bloqueado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object rdbCancelado: TRadioButton
    Left = 112
    Top = 120
    Width = 89
    Height = 17
    Caption = 'Cancelado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object ckbTodos: TCheckBox
    Left = 52
    Top = 144
    Width = 105
    Height = 17
    Caption = 'Todos Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object btnOK: TBitBtn
    Left = 9
    Top = 168
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
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
    Left = 117
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 6
    Kind = bkCancel
  end
  object edtinicial: TEdit
    Left = 8
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 7
  end
  object edtfinal: TEdit
    Left = 120
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 8
  end
end
