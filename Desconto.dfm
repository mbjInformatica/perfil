object FormDesconto: TFormDesconto
  Left = 281
  Top = 191
  Width = 226
  Height = 206
  AutoSize = True
  Caption = 'Desconto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 73
    Top = 0
    Width = 79
    Height = 16
    Caption = 'Desconto : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 105
    Top = 95
    Width = 5
    Height = 13
  end
  object Label3: TLabel
    Left = 0
    Top = 72
    Width = 5
    Height = 13
  end
  object Label4: TLabel
    Left = 40
    Top = 64
    Width = 141
    Height = 13
    Caption = 'Ou Digite o Desconto do'
  end
  object Label5: TLabel
    Left = 77
    Top = 80
    Width = 67
    Height = 13
    Caption = 'Valor Total:'
  end
  object ckb10: TCheckBox
    Left = 59
    Top = 32
    Width = 50
    Height = 17
    Caption = '10%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ckb10Click
  end
  object ckb20: TCheckBox
    Left = 171
    Top = 32
    Width = 47
    Height = 17
    Caption = '20%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = ckb20Click
  end
  object ckb15: TCheckBox
    Left = 115
    Top = 32
    Width = 50
    Height = 17
    Caption = '15%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ckb15Click
  end
  object ckb5: TCheckBox
    Left = 3
    Top = 32
    Width = 42
    Height = 17
    Caption = '5%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = ckb5Click
  end
  object btnOK: TBitBtn
    Left = 18
    Top = 147
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
  object btnCancel: TBitBtn
    Left = 121
    Top = 147
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelClick
    Kind = bkCancel
  end
  object edtDesconto: TEdit
    Left = 51
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = edtDescontoChange
    OnKeyPress = edtDescontoKeyPress
  end
end
