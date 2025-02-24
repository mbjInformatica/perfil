object formsituacaonchekout: Tformsituacaonchekout
  Left = 274
  Top = 194
  Width = 231
  Height = 252
  Caption = 'Ordem Alfabetica'
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
    Left = 37
    Top = 89
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
    Left = 52
    Top = 5
    Width = 117
    Height = 13
    Caption = 'Numero de Chekout:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblinicial: TLabel
    Left = 8
    Top = 33
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
    Left = 128
    Top = 33
    Width = 80
    Height = 13
    Caption = 'Chekout final:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rdbAtivo: TRadioButton
    Left = 21
    Top = 113
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
    Left = 116
    Top = 113
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
    Left = 21
    Top = 137
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
    Left = 116
    Top = 137
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
    Left = 58
    Top = 161
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
    Left = 22
    Top = 192
    Width = 75
    Height = 18
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
    Left = 124
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Cancela'
    TabOrder = 6
    Kind = bkCancel
  end
  object edtinicial: TEdit
    Left = 23
    Top = 49
    Width = 57
    Height = 21
    TabOrder = 7
  end
  object edtfinal: TEdit
    Left = 138
    Top = 49
    Width = 57
    Height = 21
    TabOrder = 8
  end
end
