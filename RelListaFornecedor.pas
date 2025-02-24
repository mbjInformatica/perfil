unit RelListaFornecedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TformRelListaFornecedor = class(TForm)
    qrpRelListaFornecedor: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    lblOrdem1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelListaFornecedor: TformRelListaFornecedor;

implementation
uses ModuloDados;

{$R *.DFM}

end.
