object frmNotaECF: TfrmNotaECF
  Left = 293
  Top = 242
  Width = 206
  Height = 147
  Caption = 'Nota ECF'
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
  object lblPedido: TLabel
    Left = 27
    Top = 16
    Width = 152
    Height = 16
    Caption = 'Digite o N'#186' do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtPedido: TEdit
    Left = 32
    Top = 40
    Width = 121
    Height = 21
    MaxLength = 8
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 56
    Top = 72
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnOKClick
  end
end
