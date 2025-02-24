object formEditaEstado: TformEditaEstado
  Left = 231
  Top = 3
  BorderStyle = bsDialog
  Caption = 'Edição da tabela de Estados'
  ClientHeight = 538
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memEstados: TMemo
    Left = 8
    Top = 8
    Width = 393
    Height = 489
    Lines.Strings = (
      '')
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btbOK: TBitBtn
    Left = 320
    Top = 504
    Width = 81
    Height = 25
    TabOrder = 1
    OnClick = btbOKClick
    Kind = bkOK
  end
end
