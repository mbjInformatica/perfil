object FormAviso: TFormAviso
  Left = 314
  Top = 182
  BorderStyle = bsDialog
  Caption = 'Aviso'
  ClientHeight = 92
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 92
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Aguarde ...'
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
end
