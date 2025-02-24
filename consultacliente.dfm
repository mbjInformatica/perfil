object formemaberto: Tformemaberto
  Left = 205
  Top = 125
  Width = 489
  Height = 349
  Caption = 'Em Aberto'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblcodcliente: TLabel
    Left = 16
    Top = 8
    Width = 83
    Height = 13
    Caption = 'Código do Cliente'
  end
  object lblnomecli: TLabel
    Left = 16
    Top = 48
    Width = 78
    Height = 13
    Caption = 'Nome do Cliente'
  end
  object lbltitulo: TLabel
    Left = 16
    Top = 96
    Width = 85
    Height = 13
    Caption = 'Título Pendentes:'
  end
  object blbvalor: TLabel
    Left = 16
    Top = 280
    Width = 80
    Height = 13
    Caption = 'Valor a Receber:'
  end
  object lbltotal: TLabel
    Left = 112
    Top = 280
    Width = 30
    Height = 13
    Caption = 'lbltotal'
  end
  object dbecodcli: TDBEdit
    Left = 16
    Top = 24
    Width = 41
    Height = 21
    DataField = 'CodCli'
    DataSource = dmBaseDados.dsContasReceber
    TabOrder = 0
  end
  object dbecliente: TDBEdit
    Left = 16
    Top = 64
    Width = 121
    Height = 21
    DataField = 'Cliente'
    DataSource = dmBaseDados.dsContasReceber
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 112
    Width = 465
    Height = 153
    DataSource = dmBaseDados.dsContasReceber
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumeroDocumento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEmissao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataVencimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDocumento'
        Visible = True
      end>
  end
  object btncontinuar: TButton
    Left = 272
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Continuar'
    TabOrder = 3
  end
end
