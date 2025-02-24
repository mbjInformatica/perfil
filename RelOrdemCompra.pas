unit RelOrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelOC = class(TForm)
    rptOrdemCompra: TQuickRep;
    bndCabecalho: TQRBand;
    bndOrdemCompra: TQRBand;
    bndTotalOC: TQRBand;
    bndRodape: TQRBand;
    bndProdutos: TQRSubDetail;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblOrdemCompra: TQRLabel;
    lblDataEmissao: TQRLabel;
    fldOrdemCompra: TQRDBText;
    fldDataEmissao: TQRDBText;
    lblCodigoProduto: TQRLabel;
    lblDescricao: TQRLabel;
    lblUnidade: TQRLabel;
    lblQuantidade: TQRLabel;
    lblValorUnitario: TQRLabel;
    lblValorTotal: TQRLabel;
    fldCodigoProduto: TQRDBText;
    fldDescricao: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldQuantidade: TQRDBText;
    fldUnit: TQRDBText;
    fldVlTotal: TQRDBText;
    bldTotalOC: TQRLabel;
    exprValorTotal: TQRExpr;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelOC: TformRelOC;

implementation

uses ModuloDados;

{$R *.DFM}

end.
