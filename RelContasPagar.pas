unit RelContasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelContasPagar = class(TForm)
    rptContasPagar     : TQuickRep;
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
    fldCodigoProduto   : TQRDBText;
    flfDocumento       : TQRDBText;
    fldDataVencimento  : TQRDBText;
    fldUnidade         : TQRDBText;
    fldValorLancamento : TQRDBText;
    bndSumario         : TQRBand;
    lblTotalItens      : TQRLabel;
    lblValorTotal      : TQRLabel;
    exprTotalReceber   : TQRExpr;
    exprValorTotal     : TQRExpr;
    lblFim             : TQRLabel;
    lblCliente         : TQRLabel;
    flfCliente         : TQRDBText;
    lblObservacao      : TQRLabel;
    lblMensagem        : TQRLabel;
    lblTipoRel         : TQRLabel;
    qsdLogmensal       : TQRSubDetail;
    QRLabel1           : TQRLabel;
    QRExpr1: TQRExpr;
    fldObservacao: TQRDBText;
    QRDBText1: TQRDBText;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure rptContasPagarStartPage(Sender: TCustomQuickRep);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure exprValorTotalPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelContasPagar: TformRelContasPagar;
implementation

uses ModuloDados,ContasPagar;

{$R *.DFM}

procedure TformRelContasPagar.QRLabel1Print(sender: TObject;
  var Value: String);
begin
        if (dmBaseDados.tblLogMensalSubtotal.AsFloat<>0) then
           Value := 'Sub-Total: '+FloatToStrF((dmBaseDados.tblLogMensalSubtotal.AsFloat),ffCurrency,10,2)
        else
           Value := '';
end;

procedure TformRelContasPagar.rptContasPagarStartPage(
  Sender: TCustomQuickRep);
begin
   if formContasPagar.ckbEmissao.Checked=True then
      qsdLogmensal.Enabled := False
      else
      qsdLogmensal.Enabled := True;

end;

procedure TformRelContasPagar.QRExpr1Print(sender: TObject;
  var Value: String);
begin
    if formContasPagar.rdgTipoRelatorio.ItemIndex = 0 then
      begin
       Value := '';
      end;
end;

procedure TformRelContasPagar.exprValorTotalPrint(sender: TObject;
  var Value: String);
begin
    if formContasPagar.rdgTipoRelatorio.ItemIndex = 1 then
      begin
       Value := '';
      end;
end;

end.
