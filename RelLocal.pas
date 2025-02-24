unit RelLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelLocal = class(TForm)
    qrpLocal: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    qrdbCodigo: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    qrlCodigo: TQRLabel;
    qrlNome: TQRLabel;
    qrlLocal: TQRLabel;
    qrlTotal: TQRLabel;
    QRExpr1: TQRExpr;
    qrsDataEmissao: TQRSysData;
    QRLabel1: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrlLocalP: TQRLabel;
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelLocal: TformRelLocal;

implementation
uses Modulodados, Local;

{$R *.DFM}

procedure TformRelLocal.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
     Value := 'Período de '+DateToStr(formLocal.Data1.Date)+' à '+DateToStr(formLocal.Data2.Date);
end;

end.
