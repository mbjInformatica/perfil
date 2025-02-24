unit RelFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TformRelFluxoCaixa = class(TForm)
    qrpFluxoCaixa: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblInicio: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblFim: TQRLabel;
    lblMensagem: TQRLabel;
    bndColunas: TQRBand;
    lblData: TQRLabel;
    lblDocumento: TQRLabel;
    lblCodigoProduto: TQRLabel;
    lblUnidade: TQRLabel;
    lblValorLancamento: TQRLabel;
    lblCliente: TQRLabel;
    lblObservacao: TQRLabel;
    bndLogMensal: TQRBand;
    fldCodigoProduto: TQRDBText;
    flfDocumento: TQRDBText;
    fldDataVencimento: TQRDBText;
    fldUnidade: TQRDBText;
    fldValorLancamento: TQRDBText;
    flfCliente: TQRDBText;
    fldObservacao: TQRDBText;
    qrbEmpresa: TQRDBText;
    bndSumario: TQRBand;
    lblTotalItens: TQRLabel;
    lblValorTotal: TQRLabel;
    exprTotalReceber: TQRExpr;
    exprValorTotal: TQRExpr;
    qrePagar: TQRExpr;
    qreReceber: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    qsdLogmensal: TQRSubDetail;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFluxoCaixa: TformRelFluxoCaixa;

implementation

{$R *.DFM}

end.
