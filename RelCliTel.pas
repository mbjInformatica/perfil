unit RelCliTel;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TformRelCliTel = class(TForm)
    qrpCliTel: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysdata: TQRSysData;
    sysPagina: TQRSysData;
    qrEmpresa: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel14: TQRLabel;
    QRShape1: TQRShape;
    bndClientes: TQRBand;
    fldNomeCliente: TQRDBText;
    fldCidade: TQRDBText;
    fldFax: TQRDBText;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;    
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formRelCliTel: TformRelCliTel;

implementation

uses ModuloDados;


{$R *.dfm}

end.
