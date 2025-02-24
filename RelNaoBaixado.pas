unit RelNaoBaixado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelNaoBaixado = class(TForm)
    qrpRelNaoBaixado: TQuickRep;
    DetailBand1: TQRBand;
    qrdbPorcentagem: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbVendedor: TQRDBText;
    qrdData: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlNaoBaixado: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrsDataEmissao: TQRSysData;
    qrsNumeroPagina: TQRSysData;
    ChildBand1: TQRChildBand;
    qrlNPedido_CodVendedor: TQRLabel;
    qrlNomeCliente_Vendedor: TQRLabel;
    qrlTotalVenda: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbComissao: TQRDBText;
    qrbTotais: TQRBand;
    qreVLancamento2: TQRExpr;
    QRLabel1: TQRLabel;
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelNaoBaixado: TformRelNaoBaixado;

implementation
uses ModuloDados, NaoBaixadoCR;

{$R *.DFM}

procedure TformRelNaoBaixado.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
     Value := 'Período de '+DateToStr(formNaoBaixadoCR.Data1.Date)+' à '+DateToStr(formNaoBaixadoCR.Data2.Date);
end;

end.
