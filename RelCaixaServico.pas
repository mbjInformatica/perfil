unit RelCaixaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelCaixaServico = class(TForm)
    rptCaixaServico    : TQuickRep;
    bndCabecalho       : TQRBand;
    lblTitulo          : TQRLabel;
    lblInicio          : TQRLabel;
    sysData            : TQRSysData;
    sysPagina          : TQRSysData;
    bndColunas         : TQRBand;
    lblData            : TQRLabel;
    lblDocumento       : TQRLabel;
    lblCodigoProduto   : TQRLabel;
    lblUnidade         : TQRLabel;
    lblValorLancamento : TQRLabel;
    bndLogMensal       : TQRBand;
    fldData            : TQRDBText;
    flfDocumento       : TQRDBText;
    fldCodigoProduto   : TQRDBText;
    fldUnidade         : TQRDBText;
    fldValorLancamento : TQRDBText;
    bndSumario         : TQRBand;
    lblTotalItens      : TQRLabel;
    lblValorTotal      : TQRLabel;
    exprTotalItens     : TQRExpr;
    exprValorTotal     : TQRExpr;
    bndRodape          : TQRBand;
    lblMensagem        : TQRLabel;
    lblFim             : TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelCaixaServico: TformRelCaixaServico;

implementation

uses ModuloDados;

{$R *.DFM}

end.
