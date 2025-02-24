inherited formRelContasPagarN: TformRelContasPagarN
  Left = 0
  Top = 569
  Width = 160
  Height = 34
  HorzScrollBar.Position = 0
  Caption = 'Relatório Contas a Pagar'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited rptContasReceber: TQuickRep
    Left = -3
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited bndCabecalho: TQRBand
      Size.Values = (
        156.104166666667
        1899.70833333333)
      inherited lblTitulo: TQRLabel
        Width = 218
        Size.Values = (
          44.9791666666667
          21.1666666666667
          84.6666666666667
          576.791666666667)
        Caption = 'RELATÓRIO DE CONTAS A PAGAR'
        FontSize = 10
      end
      inherited lblInicio: TQRLabel
        Size.Values = (
          44.9791666666667
          762
          84.6666666666667
          137.583333333333)
        FontSize = 10
      end
      inherited sysData: TQRSysData
        Size.Values = (
          44.9791666666667
          1682.75
          21.1666666666667
          187.854166666667)
        FontSize = 10
      end
      inherited sysPagina: TQRSysData
        Size.Values = (
          44.9791666666667
          1682.75
          84.6666666666667
          280.458333333333)
        FontSize = 10
      end
      inherited lblFim: TQRLabel
        Size.Values = (
          44.9791666666667
          1100.66666666667
          84.6666666666667
          108.479166666667)
        FontSize = 10
      end
      inherited lblMensagem: TQRLabel
        Size.Values = (
          52.9166666666667
          21.1666666666667
          21.1666666666667
          717.020833333333)
        FontSize = 12
      end
      inherited lblTipoRel: TQRLabel
        Size.Values = (
          44.9791666666667
          931.333333333334
          21.1666666666667
          150.8125)
        FontSize = 10
      end
    end
    inherited bndColunas: TQRBand
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      inherited lblData: TQRLabel
        Size.Values = (
          44.9791666666667
          0
          10.5833333333333
          158.75)
        FontSize = 7
      end
      inherited lblDocumento: TQRLabel
        Size.Values = (
          44.9791666666667
          190.5
          10.5833333333333
          129.645833333333)
        FontSize = 7
      end
      inherited lblCodigoProduto: TQRLabel
        Size.Values = (
          44.9791666666667
          952.5
          10.5833333333333
          140.229166666667)
        FontSize = 7
      end
      inherited lblUnidade: TQRLabel
        Size.Values = (
          44.9791666666667
          1148.29166666667
          10.5833333333333
          60.8541666666667)
        FontSize = 7
      end
      inherited lblValorLancamento: TQRLabel
        Size.Values = (
          44.9791666666667
          1275.29166666667
          10.5833333333333
          58.2083333333333)
        FontSize = 7
      end
      inherited lblCliente: TQRLabel
        Size.Values = (
          44.9791666666667
          336.020833333333
          10.5833333333333
          79.375)
        FontSize = 7
      end
      inherited lblObservacao: TQRLabel
        Size.Values = (
          44.9791666666667
          1415.52083333333
          10.5833333333333
          137.583333333333)
        FontSize = 7
      end
    end
    inherited bndLogMensal: TQRBand
      Size.Values = (
        55.5625
        1899.70833333333)
      inherited fldCodigoProduto: TQRDBText
        Size.Values = (
          31.75
          0
          10.5833333333333
          171.979166666667)
        FontSize = 7
      end
      inherited flfDocumento: TQRDBText
        Size.Values = (
          31.75
          190.5
          10.5833333333333
          140.229166666667)
        FontSize = 7
      end
      inherited fldDataVencimento: TQRDBText
        Size.Values = (
          31.75
          952.5
          10.5833333333333
          150.8125)
        FontSize = 7
      end
      inherited fldUnidade: TQRDBText
        Size.Values = (
          31.75
          1145.64583333333
          10.5833333333333
          66.1458333333333)
        FontSize = 7
      end
      inherited fldValorLancamento: TQRDBText
        Size.Values = (
          31.75
          1227.66666666667
          10.5833333333333
          142.875)
        FontSize = 7
      end
      inherited flfCliente: TQRDBText
        Size.Values = (
          31.75
          336.020833333333
          10.5833333333333
          121.708333333333)
        FontSize = 7
      end
      inherited fldObservacao: TQRDBText
        Size.Values = (
          31.75
          1415.52083333333
          10.5833333333333
          142.875)
        FontSize = 7
      end
    end
    inherited bndSumario: TQRBand
      Size.Values = (
        76.7291666666667
        1899.70833333333)
      inherited lblTotalItens: TQRLabel
        Size.Values = (
          52.9166666666667
          42.3333333333333
          10.5833333333333
          272.520833333333)
        FontSize = 10
      end
      inherited lblValorTotal: TQRLabel
        Width = 125
        Size.Values = (
          52.9166666666667
          859.895833333333
          10.5833333333333
          330.729166666667)
        Caption = 'Valor total a Pagar:'
        FontSize = 10
      end
      inherited exprTotalReceber: TQRExpr
        Size.Values = (
          52.9166666666667
          550.333333333333
          10.5833333333333
          164.041666666667)
        FontSize = 10
      end
      inherited exprValorTotal: TQRExpr
        Size.Values = (
          52.9166666666667
          1441.97916666667
          10.5833333333333
          330.729166666667)
        FontSize = 10
      end
    end
    inherited qsdLogmensal: TQRSubDetail
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      inherited QRLabel1: TQRLabel
        Size.Values = (
          44.9791666666667
          1418.16666666667
          0
          166.6875)
        FontSize = 10
      end
    end
  end
end
