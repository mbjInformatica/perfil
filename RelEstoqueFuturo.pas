unit RelEstoqueFuturo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelEstoqueFuturo = class(TForm)
    qrpEstoqueFuturo: TQuickRep;
    phbCabecario: TQRBand;
    lblMensagem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    qrlTitulo: TQRLabel;
    qrlNPedido: TQRLabel;
    qrlDescricao: TQRLabel;
    qrlValor: TQRLabel;
    qrlQuantidade: TQRLabel;
    qrlTipo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand1: TQRBand;
    qreQtde: TQRExpr;
    QRLabel1: TQRLabel;
    qrePeso: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrdDescricao: TQRDBText;
    qrdEstoqueAtual: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelEstoqueFuturo: TformRelEstoqueFuturo;

implementation
uses ModuloDados;
{$R *.DFM}

end.
