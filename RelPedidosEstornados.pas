unit RelPedidosEstornados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelPedidosEstornados = class(TForm)
    qrpPedidosEstornados : TQuickRep;
    phbCabecario         : TQRBand;
    lblMensagem          : TQRLabel;
    sysData              : TQRSysData;
    sysPagina            : TQRSysData;
    qrlTitulo            : TQRLabel;
    qrlNPedido           : TQRLabel;
    qrlVendedor          : TQRLabel;
    qrlCliente           : TQRLabel;
    qrlDataEmissao       : TQRLabel;
    qrlValor             : TQRLabel;
    dbdCorpo             : TQRBand;
    qrdbDataEmissao      : TQRDBText;
    qrdbNPedido          : TQRDBText;
    qrdbVendedor         : TQRDBText;
    qrdbCliente          : TQRDBText;
    qrdbValor            : TQRDBText;
    qrbTotais            : TQRBand;
    qrlDataTitulo: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    exprTotalReceber: TQRExpr;
    lblTotalItens: TQRLabel;
    exprValorTotal: TQRExpr;
    QRLabel4: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelPedidosEstornados: TformRelPedidosEstornados;

implementation

uses PedidosEstornado;

{$R *.DFM}

end.
