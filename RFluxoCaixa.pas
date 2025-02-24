unit RFluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TformRelFluxoCaixa = class(TForm)
    qrpFluxoCaixa: TQuickRep;
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    lblInicio: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lblFim: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRLabel17: TQRLabel;
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
    QRDBText8: TQRDBText;
    QRDBText5: TQRDBText;
    procedure QRLabel17Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFluxoCaixa: TformRelFluxoCaixa;

implementation

uses ModuloDados,FluxoCaixa;
{$R *.DFM}

procedure TformRelFluxoCaixa.QRLabel17Print(sender: TObject;
  var Value: String);
begin
        if (dmBaseDados.tblFluxoCaixaSubTotal.AsFloat<>0) then
            Value:='Sub-Total: '+FloatToStrF((dmBaseDados.tblFluxoCaixaSubTotal.AsFloat),ffCurrency,10,2)
        else
        Value:='';
end;

end.
