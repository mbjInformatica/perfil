object formConsulta: TformConsulta
  Left = 233
  Top = 129
  Width = 443
  Height = 253
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Consulta de T'#237'tulos'
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
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Caption = 'C'#243'digo do Cliente :'
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 84
    Height = 13
    Caption = 'Nome do Cliente :'
  end
  object Label3: TLabel
    Left = 0
    Top = 88
    Width = 113
    Height = 13
    Caption = 'T'#237'tulos Pendentes :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblValorLimite: TLabel
    Left = 240
    Top = 8
    Width = 81
    Height = 16
    Caption = 'lblValorLimite'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblValorSoma: TLabel
    Left = 240
    Top = 40
    Width = 82
    Height = 16
    Caption = 'lblValorSoma'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 176
    Top = 8
    Width = 55
    Height = 16
    Caption = 'Cr'#233'dito:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 104
    Top = 40
    Width = 127
    Height = 16
    Caption = 'Contas em aberto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 104
    Width = 430
    Height = 113
    DataSource = dmBaseDados.dsContasReceber
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NumeroDocumento'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataEmissao'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataVencimento'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorDocumento'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtBranco'
        Visible = False
      end>
  end
  object dbeCodCli: TDBEdit
    Left = 8
    Top = 24
    Width = 41
    Height = 21
    DataField = 'CodCli'
    DataSource = dmBaseDados.dsContasReceber
    TabOrder = 1
  end
  object dbeCliente: TDBEdit
    Left = 8
    Top = 64
    Width = 421
    Height = 21
    DataField = 'Cliente'
    DataSource = dmBaseDados.dsContasReceber
    TabOrder = 2
  end
  object btnok: TButton
    Left = 352
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnokClick
  end
end
