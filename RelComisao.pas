unit RelComisao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrmRelComisao = class(TForm)
    qrpRelComissao: TQuickRep;
    DetailBand1: TQRBand;
    qrdbComissao: TQRDBText;
    qrdbPorcentagem: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbVendedor: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure qrdbComissaoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelComisao: TFrmRelComisao;

implementation
uses
        ModuloDados;
{$R *.DFM}

procedure TFrmRelComisao.qrdbTotalPrint(sender: TObject;
  var Value: String);
begin
        Value:=FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
end;

procedure TFrmRelComisao.qrdbComissaoPrint(sender: TObject;
  var Value: String);
begin
        Value:=FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
end;

end.
