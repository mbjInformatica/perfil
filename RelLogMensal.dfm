object formRelLogMensal: TformRelLogMensal
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  HorzScrollBar.Position = 275
  Caption = 'Relatório do Log Mensal de Movimentação'
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
  object rptLogMensal: TQuickRep
    Left = -275
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = dmBaseDados.tblLogMensal
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
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
      Width = 718
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
        105.833333333333
        1899.70833333333)
      BandType = rbPageHeader
      object lblTitulo: TQRLabel
        Left = 16
        Top = 8
        Width = 287
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          21.1666666666667
          759.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RELATÓRIO DAS MOVIMENTAÇÕES MENSAIS'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblMesAno: TQRLabel
        Left = 448
        Top = 8
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          21.1666666666667
          164.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblMesAno'
        Color = clWhite
        OnPrint = lblMesAnoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object sysData: TQRSysData
        Left = 541
        Top = 8
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1431.39583333333
          21.1666666666667
          177.270833333333)
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
        Left = 661
        Top = 8
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1748.89583333333
          21.1666666666667
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Pág.:'
        Transparent = False
        FontSize = 10
      end
    end
    object bndColunas: TQRBand
      Left = 38
      Top = 78
      Width = 718
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.4375
        1899.70833333333)
      BandType = rbColumnHeader
      object lblData: TQRLabel
        Left = 16
        Top = 4
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          10.5833333333333
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Data'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblMovimento: TQRLabel
        Left = 72
        Top = 4
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          10.5833333333333
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Mov.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDocumento: TQRLabel
        Left = 112
        Top = 4
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          296.333333333333
          10.5833333333333
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Documento'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblCodigoProduto: TQRLabel
        Left = 184
        Top = 4
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          10.5833333333333
          238.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Código Produto'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDescricao: TQRLabel
        Left = 280
        Top = 4
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          740.833333333333
          10.5833333333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Descrição'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblUnidade: TQRLabel
        Left = 562
        Top = 4
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1486.95833333333
          10.5833333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Inid.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblQuantidade: TQRLabel
        Left = 594
        Top = 4
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1571.625
          10.5833333333333
          68.7916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qtd.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblValorLancamento: TQRLabel
        Left = 634
        Top = 4
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1677.45833333333
          10.5833333333333
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' Lançamento'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object bndLogMensal: TQRBand
      Left = 38
      Top = 105
      Width = 718
      Height = 24
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
        63.5
        1899.70833333333)
      BandType = rbDetail
      object fldData: TQRDBText
        Left = 3
        Top = 4
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          10.5833333333333
          177.270833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'DataLancamento'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldCodigoMovimento: TQRDBText
        Left = 72
        Top = 4
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          10.5833333333333
          87.3125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'CodigoMovimento'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object flfDocumento: TQRDBText
        Left = 112
        Top = 4
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          296.333333333333
          10.5833333333333
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'Documento'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldCodigoProduto: TQRDBText
        Left = 184
        Top = 4
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          10.5833333333333
          248.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'CodigoProduto'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldDescricao: TQRDBText
        Left = 280
        Top = 4
        Width = 278
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          740.833333333333
          10.5833333333333
          735.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'Descricao'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldUnidade: TQRDBText
        Left = 557
        Top = 4
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1473.72916666667
          10.5833333333333
          87.3125)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'UnidadeMedida'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldQuantidade: TQRDBText
        Left = 589
        Top = 4
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1558.39583333333
          10.5833333333333
          87.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'Quantidade'
        Mask = '####0'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object fldValorLancamento: TQRDBText
        Left = 629
        Top = 4
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1664.22916666667
          10.5833333333333
          214.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = dmBaseDados.tblLogMensal
        DataField = 'ValorLancamento'
        Mask = '#####0.00'
        OnPrint = fldValorLancamentoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object bndSumario: TQRBand
      Left = 38
      Top = 129
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        1899.70833333333)
      BandType = rbSummary
      object lblTotalItens: TQRLabel
        Left = 16
        Top = 4
        Width = 170
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          10.5833333333333
          449.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total de itens movimentados:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblValorTotal: TQRLabel
        Left = 277
        Top = 4
        Width = 167
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          732.895833333333
          10.5833333333333
          441.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Valor total dos lançamentos:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object exprTotalItens: TQRExpr
        Left = 208
        Top = 4
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          550.333333333333
          10.5833333333333
          92.6041666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'Count'
        Mask = '####0'
        FontSize = 10
      end
      object exprValorTotal: TQRExpr
        Left = 460
        Top = 4
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1217.08333333333
          10.5833333333333
          235.479166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        OnPrint = exprValorTotalPrint
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(tblLogMensal.ValorLancamento)'
        Mask = '#####0.00'
        FontSize = 10
      end
    end
  end
end
