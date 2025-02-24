object formRelOC: TformRelOC
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = 'Relat'#243'rio de Ordem de Compras Emitudas'
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
  object rptOrdemCompra: TQuickRep
    Left = 8
    Top = 8
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = dmBaseDados.tblNumeroOC
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
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
    object bndCabecalho: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbPageHeader
      object lblTitulo: TQRLabel
        Left = 8
        Top = 8
        Width = 311
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          822.854166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELAT'#211'RIO DE ORDENS DE COMPRAS EMITIDAS'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object sysData: TQRSysData
        Left = 546
        Top = 8
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1444.625000000000000000
          21.166666666666700000
          177.270833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Text = 'Data:'
        Transparent = False
        FontSize = 10
      end
      object sysPagina: TQRSysData
        Left = 682
        Top = 8
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1804.458333333330000000
          21.166666666666700000
          203.729166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'P'#225'g.:'
        Transparent = False
        FontSize = 10
      end
    end
    object bndOrdemCompra: TQRBand
      Left = 38
      Top = 78
      Width = 1047
      Height = 51
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
        134.937500000000000000
        2770.187500000000000000)
      BandType = rbDetail
      object lblOrdemCompra: TQRLabel
        Left = 8
        Top = 8
        Width = 178
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          470.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N'#250'mero de Ordem de Compra:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDataEmissao: TQRLabel
        Left = 360
        Top = 8
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          21.166666666666670000
          230.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data Emiss'#227'o:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldOrdemCompra: TQRDBText
        Left = 200
        Top = 8
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          21.166666666666670000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblNumeroOC
        DataField = 'OrdemCompra'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldDataEmissao: TQRDBText
        Left = 456
        Top = 8
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          21.166666666666670000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'DataEmissao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblCodigoProduto: TQRLabel
        Left = 8
        Top = 32
        Width = 108
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666680000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo do Produto'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDescricao: TQRLabel
        Left = 168
        Top = 32
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          444.500000000000000000
          84.666666666666680000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descri'#231#227'o'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblUnidade: TQRLabel
        Left = 416
        Top = 32
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          84.666666666666680000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unid.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblQuantidade: TQRLabel
        Left = 521
        Top = 32
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1378.479166666670000000
          84.666666666666700000
          105.833333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quant.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblValorUnitario: TQRLabel
        Left = 592
        Top = 32
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1566.333333333330000000
          84.666666666666700000
          164.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Unit.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblValorTotal: TQRLabel
        Left = 672
        Top = 32
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1778.000000000000000000
          84.666666666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor Total'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object bndTotalOC: TQRBand
      Left = 38
      Top = 169
      Width = 1047
      Height = 40
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
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbGroupFooter
      object bldTotalOC: TQRLabel
        Left = 464
        Top = 16
        Width = 191
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          42.333333333333340000
          505.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ValorTotal da Ordem de Compra:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object exprValorTotal: TQRExpr
        Left = 672
        Top = 16
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1778.000000000000000000
          42.333333333333300000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Master = bndProdutos
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'SUM(tblRelOC.ValorTotal)'
        Mask = '######0.00'
        FontSize = 10
      end
    end
    object bndRodape: TQRBand
      Left = 38
      Top = 209
      Width = 1047
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      BandType = rbPageFooter
      object lblMensagem: TQRLabel
        Left = 8
        Top = 8
        Width = 231
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          611.187500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Auto Pe'#231'as e Acessorios PERFIL Ltda.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object bndProdutos: TQRSubDetail
      Left = 38
      Top = 129
      Width = 1047
      Height = 40
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
        105.833333333333300000
        2770.187500000000000000)
      Master = rptOrdemCompra
      DataSet = dmBaseDados.tblRelOC
      FooterBand = bndTotalOC
      PrintBefore = False
      PrintIfEmpty = True
      object fldCodigoProduto: TQRDBText
        Left = 8
        Top = 16
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          42.333333333333300000
          209.020833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'CdigoProduto'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldDescricao: TQRDBText
        Left = 168
        Top = 16
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          444.500000000000000000
          42.333333333333300000
          156.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'Descricao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldUnidadeMedida: TQRDBText
        Left = 416
        Top = 16
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          42.333333333333340000
          238.125000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'UnidadeMedida'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldQuantidade: TQRDBText
        Left = 512
        Top = 16
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1354.666666666670000000
          42.333333333333300000
          177.270833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'Quantidade'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldUnit: TQRDBText
        Left = 592
        Top = 16
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1566.333333333330000000
          42.333333333333300000
          171.979166666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'ValorUnitario'
        Mask = '####0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldVlTotal: TQRDBText
        Left = 672
        Top = 16
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1778.000000000000000000
          42.333333333333300000
          156.104166666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblRelOC
        DataField = 'ValorTotal'
        Mask = '#####0.00'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
