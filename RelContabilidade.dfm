object frmRelcontabilidade: TfrmRelcontabilidade
  Left = 202
  Top = 119
  Width = 602
  Height = 388
  Caption = 'Arquivo Texto da Contabilidade'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QrpContabilidade: TQuickRep
    Left = 0
    Top = 0
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = QrpContabilidadeAfterPreview
    AfterPreview = QrpContabilidadeAfterPreview
    DataSet = dmBaseDados.tblECF
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = QrpContabilidadeAfterPreview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 740
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1957.916666666667000000)
      BandType = rbDetail
      object lblR1: TQRLabel
        Left = -35
        Top = 15
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          -92.604166666666700000
          39.687500000000000000
          44.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'R1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdDataEmissao: TQRDBText
        Left = -13
        Top = 15
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          -34.395833333333340000
          39.687500000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'DataEmissao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdNrNF: TQRDBText
        Left = 110
        Top = 15
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          291.041666666666700000
          39.687500000000000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'NrNF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdContribuinte: TQRDBText
        Left = 3398
        Top = 15
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          8990.541666666670000000
          39.687500000000000000
          185.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'Contribuinte'
        Mask = '0'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdTipoNota: TQRDBText
        Left = 3408
        Top = 15
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          9017.000000000000000000
          39.687500000000000000
          137.583333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'TipoNota'
        Mask = '00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdObsLivre: TQRDBText
        Left = 3436
        Top = 15
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          9091.083333333330000000
          39.687500000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'ObsLivre'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdCgc: TQRDBText
        Left = 3545
        Top = 15
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          9379.479166666670000000
          39.687500000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'Cgc'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdInscrEstadual: TQRDBText
        Left = 3655
        Top = 15
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          9670.520833333330000000
          39.687500000000000000
          211.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'InscrEstadual'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdRazaoSocial: TQRDBText
        Left = 3783
        Top = 15
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          10009.187500000000000000
          39.687500000000000000
          195.791666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'RazaoSocial'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdContaCtblFornecedor: TQRDBText
        Left = 4058
        Top = 15
        Width = 123
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          10736.791666666700000000
          39.687500000000000000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'ContaCtblFornecedor'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdNrMunicipio: TQRDBText
        Left = 4214
        Top = 15
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          11149.541666666700000000
          39.687500000000000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'NrMunicipio'
        Mask = '0000'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdUf: TQRDBText
        Left = 4197
        Top = 15
        Width = 13
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          11104.562500000000000000
          39.687500000000000000
          34.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'Uf'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlBaseIpi: TQRLabel
        Left = 2457
        Top = 15
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          6500.812500000000000000
          39.687500000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlImpostoIpi: TQRLabel
        Left = 2548
        Top = 15
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          6741.583333333330000000
          39.687500000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlIsentosIpi: TQRLabel
        Left = 2648
        Top = 15
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          7006.166666666670000000
          39.687500000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlOutrasIpi: TQRLabel
        Left = 2742
        Top = 15
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          7254.875000000000000000
          39.687500000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlIpiNaoAproveitavel: TQRLabel
        Left = 2836
        Top = 15
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          7503.583333333330000000
          39.687500000000000000
          224.895833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '000000000000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlAliq7: TQRLabel
        Left = 430
        Top = 15
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          39.687500000000000000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '070000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlAliqt12: TQRLabel
        Left = 860
        Top = 15
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2275.416666666670000000
          39.687500000000000000
          113.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '120000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlAliq18: TQRLabel
        Left = 1280
        Top = 15
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          3386.666666666670000000
          39.687500000000000000
          113.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '180000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlAliq25: TQRLabel
        Left = 1702
        Top = 15
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          4503.208333333330000000
          39.687500000000000000
          113.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '180000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdCodContabil: TQRDBText
        Left = 3421
        Top = 15
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          9051.395833333330000000
          39.687500000000000000
          187.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'CodContabil'
        Mask = '00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlAliq12: TQRLabel
        Left = 2127
        Top = 15
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          5627.687500000000000000
          39.687500000000000000
          113.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '120000'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdIntegracao: TQRDBText
        Left = 20
        Top = 15
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          52.916666666666660000
          39.687500000000000000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'DataEmissao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdAteNro: TQRDBText
        Left = 161
        Top = 15
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          425.979166666666700000
          39.687500000000000000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'NrNF'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlbEspecieSerie: TQRLabel
        Left = 65
        Top = 15
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          171.979166666666700000
          39.687500000000000000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NF 1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrblbCfop: TQRLabel
        Left = 205
        Top = 15
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          542.395833333333400000
          39.687500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrblbCfop'
        Color = clWhite
        OnPrint = qrblbCfopPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qreBaseCalculo: TQRExpr
        Left = 245
        Top = 15
        Width = 170
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          648.229166666666700000
          39.687500000000000000
          449.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.ValorTNF*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreICMS7: TQRExpr
        Left = 479
        Top = 15
        Width = 151
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1267.354166666667000000
          39.687500000000000000
          399.520833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Icms7*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreBase7: TQRExpr
        Left = 338
        Top = 15
        Width = 153
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          894.291666666666700000
          39.687500000000000000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Base7*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsento7: TQRExpr
        Left = 571
        Top = 15
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1510.770833333330000000
          39.687500000000000000
          418.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Isento7*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreOutras7: TQRExpr
        Left = 670
        Top = 15
        Width = 162
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1772.708333333330000000
          39.687500000000000000
          428.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Outras7*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreBase12: TQRExpr
        Left = 763
        Top = 15
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2018.770833333330000000
          39.687500000000000000
          423.333333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Base12*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreICMS12: TQRExpr
        Left = 901
        Top = 15
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2383.895833333330000000
          39.687500000000000000
          418.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Icms12*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsento12: TQRExpr
        Left = 995
        Top = 15
        Width = 165
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2632.604166666670000000
          39.687500000000000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Isento12*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreOutras12: TQRExpr
        Left = 1090
        Top = 15
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2883.958333333330000000
          39.687500000000000000
          447.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Outras12*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreBase18: TQRExpr
        Left = 1187
        Top = 15
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          3140.604166666670000000
          39.687500000000000000
          423.333333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Base18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIcms18: TQRExpr
        Left = 1326
        Top = 15
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          3508.375000000000000000
          39.687500000000000000
          418.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Icms18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsento18: TQRExpr
        Left = 1422
        Top = 15
        Width = 165
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          3762.375000000000000000
          39.687500000000000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Isento18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreOutras18: TQRExpr
        Left = 1518
        Top = 15
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          4016.375000000000000000
          39.687500000000000000
          447.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Outras18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreBase25: TQRExpr
        Left = 1606
        Top = 15
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          4249.208333333330000000
          39.687500000000000000
          423.333333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Base25*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIcms25: TQRExpr
        Left = 1751
        Top = 15
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          4632.854166666670000000
          39.687500000000000000
          418.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Icms25*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsento25: TQRExpr
        Left = 1847
        Top = 15
        Width = 165
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          4886.854166666670000000
          39.687500000000000000
          436.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Isento25*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreOutras25: TQRExpr
        Left = 1937
        Top = 15
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          5124.979166666670000000
          39.687500000000000000
          447.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Outras25*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreBaseR18: TQRExpr
        Left = 2035
        Top = 15
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          5384.270833333330000000
          39.687500000000000000
          447.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.BaseR18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIcmsR18: TQRExpr
        Left = 2172
        Top = 15
        Width = 167
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          5746.750000000000000000
          39.687500000000000000
          441.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.IcmsR18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsentoR18: TQRExpr
        Left = 2272
        Top = 15
        Width = 174
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          6011.333333333330000000
          39.687500000000000000
          460.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.IsentoR18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreOutrasR18: TQRExpr
        Left = 2365
        Top = 15
        Width = 178
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          6257.395833333330000000
          39.687500000000000000
          470.958333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.OutrasR18*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIcmsNaFonte: TQRExpr
        Left = 2925
        Top = 15
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          7739.062500000000000000
          39.687500000000000000
          510.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.IcmsNaFonte*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreDesconto: TQRExpr
        Left = 3023
        Top = 15
        Width = 171
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          7998.354166666670000000
          39.687500000000000000
          452.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.Desconto*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreValorVista: TQRExpr
        Left = 3119
        Top = 15
        Width = 176
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          8252.354166666670000000
          39.687500000000000000
          465.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.ValorVista*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreValorPrazo: TQRExpr
        Left = 3210
        Top = 15
        Width = 180
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          8493.125000000000000000
          39.687500000000000000
          476.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.ValorPrazo*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qreIsentoPis: TQRExpr
        Left = 3303
        Top = 15
        Width = 170
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          8739.187500000000000000
          39.687500000000000000
          449.791666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'tblANotaFiscal.IsentoPis*100'
        Mask = '000000000000'
        FontSize = 10
      end
      object qrdVago: TQRDBText
        Left = 4245
        Top = 15
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          11231.562500000000000000
          39.687500000000000000
          82.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'Vago'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrbV: TQRDBText
        Left = 4629
        Top = 15
        Width = 10
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          12247.562500000000000000
          39.687500000000000000
          26.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblANotaFiscal
        DataField = 'V'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
