unit RelClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelClientes = class(TForm)
    rptClientes      : TQuickRep;
    bndCabecalho     : TQRBand;
    lblTitulo        : TQRLabel;
    lblOrdem         : TQRLabel;
    sysdata          : TQRSysData;
    sysPagina        : TQRSysData;
    bndClientes      : TQRBand;
    fldNomeCliente   : TQRDBText;
    fldEndereco      : TQRDBText;
    fldBairro        : TQRDBText;
    fldCidade        : TQRDBText;
    fldEstado        : TQRDBText;
    fldTelefone      : TQRDBText;
    fldNumero        : TQRDBText;
    fldFax           : TQRDBText;
    fldCIC           : TQRDBText;
    fldRG            : TQRDBText;
    QRDBText1        : TQRDBText;
    QRDBText2        : TQRDBText;
    QRLabel3         : TQRLabel;
    QRLabel4         : TQRLabel;
    QRLabel5         : TQRLabel;
    QRLabel6         : TQRLabel;
    QRLabel8         : TQRLabel;
    QRLabel9         : TQRLabel;
    QRLabel10        : TQRLabel;
    QRLabel11        : TQRLabel;
    QRLabel12        : TQRLabel;
    QRLabel1         : TQRLabel;
    QRLabel13        : TQRLabel;
    qrlCEP           : TQRLabel;
    qrdbCEP          : TQRDBText;
    qrlNR            : TQRLabel;
    qrlBairro        : TQRLabel;
    qrdbSituacao     : TQRDBText;
    qrlSituacao      : TQRLabel;
    QRLabel2         : TQRLabel;
    QRDBText3        : TQRDBText;
    QRDBText4        : TQRDBText;
    qrlRamoAtividade : TQRLabel;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelClientes: TformRelClientes;

implementation

uses ModuloDados;

{$R *.DFM}

end.
