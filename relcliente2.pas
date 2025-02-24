unit relcliente2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  Tformrelclientes2 = class(TForm)
    qrpcli: TQuickRep;
    qrbtitulo: TQRBand;
    qrbdetali: TQRBand;
    qrbroda: TQRBand;
    lblMensagem: TQRLabel;
    QRLabel5: TQRLabel;
    qrlForn: TQRLabel;
    qrlTitulo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formrelclientes2: Tformrelclientes2;

implementation
uses modulodados;

{$R *.DFM}

end.
