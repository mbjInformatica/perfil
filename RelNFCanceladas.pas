unit RelNFCanceladas;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TformRelNFCanceladas = class(TForm)
    qrpNotasCanceladas: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlTitulo: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrsDataEmissao: TQRSysData;
    qrlPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRDBText7: TQRDBText;
    qrEmpresa: TQRLabel;
    QRLabel7: TQRLabel;
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formRelNFCanceladas: TformRelNFCanceladas;

implementation

uses ModuloDados, NotasEmitidas;


{$R *.dfm}


procedure TformRelNFCanceladas.qrlPeriodoPrint(sender: TObject; var Value: String);
begin
Value := 'Período de '+DateToStr(formNotasEmitidas.Data1.Date)+' à '+DateToStr(formNotasEmitidas.Data2.Date);
end;

end.
