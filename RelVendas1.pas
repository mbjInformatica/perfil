unit RelVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelVendas = class(TForm)
    rptVendas: TQuickRep;
    bndCabecalho: TQRBand;
    qrlBonificacao: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    qrdbNumReq: TQRDBText;
    qrlVendedor: TQRLabel;
    qrdbCodVendedor: TQRDBText;
    qrlNomeCliente: TQRLabel;
    qrdbNomeCliente: TQRDBText;
    qrlCodigo: TQRLabel;
    qrdbCodCli: TQRDBText;
    qrlEndereco: TQRLabel;
    qrdbEndereco: TQRDBText;
    qrlNr: TQRLabel;
    qrdbNr: TQRDBText;
    qrdbBairro: TQRDBText;
    qrlBairro: TQRLabel;
    qrlCidade: TQRLabel;
    qrdbCidade: TQRDBText;
    qrdbEstado: TQRDBText;
    qrlEstado: TQRLabel;
    qrlCEP: TQRLabel;
    qrdbCEP: TQRDBText;
    qrlFone: TQRLabel;
    qrdbFone: TQRDBText;
    qrlReferencia: TQRLabel;
    qrdbReferencia: TQRDBText;
    qrlCGC: TQRLabel;
    qrdbCGC: TQRDBText;
    qrlInscEstadual: TQRLabel;
    qrdbInscEstadual: TQRDBText;
    lblMensagem: TQRLabel;
    qrlPBonificacao: TQRLabel;
    bndColunas: TQRBand;
    lblCodigoProduto: TQRLabel;
    lblDescricaoAbreviada: TQRLabel;
    lblUnidade: TQRLabel;
    lblQuantidade: TQRLabel;
    lblVlUnitario: TQRLabel;
    lblVlTotal: TQRLabel;
    bndProdutos: TQRBand;
    fldCodigoProduto: TQRDBText;
    fldDescricaoAbreviada: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldQuantidade: TQRDBText;
    fldVlUnitario: TQRDBText;
    fldVlTotal: TQRDBText;
    bndSumario: TQRBand;
    lblTotalVenda: TQRLabel;
    expTotalVendas: TQRExpr;
    qrlAviso: TQRLabel;
    qrlOBS: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRShape1: TQRShape;
    QRExpr2: TQRExpr;
    QRLabel13: TQRLabel;
    qrlClienteNome: TQRLabel;
    qrdbClienteCodigo: TQRDBText;
    qrlPedidoNum: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape2: TQRShape;
    qrlCarimbo: TQRLabel;
    QRShape3: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelVendas: TformRelVendas;

implementation

uses ModuloDados;

{$R *.DFM}

end.
