unit RelFornecedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelFornecedor = class(TForm)
    rptFornecedores     : TQuickRep;
    bndCabecalho        : TQRBand;
    bndColunas          : TQRBand;
    bndFornecedores     : TQRBand;
    bndRodape           : TQRBand;
    lblTitulo           : TQRLabel;
    lblOrdem            : TQRLabel;
    sysData             : TQRSysData;
    sysPagina           : TQRSysData;
    lblCodigoFornecedor : TQRLabel;
    lblRazaoSocial      : TQRLabel;
    lblCNPJ             : TQRLabel;
    lblNomeFantasia     : TQRLabel;
    lblTipo             : TQRLabel;
    lblEndereco         : TQRLabel;
    lblBairro           : TQRLabel;
    lblCidade           : TQRLabel;
    lblEstado           : TQRLabel;
    lblTelefone         : TQRLabel;
    lblFax              : TQRLabel;
    lblRepresentante    : TQRLabel;
    lblRamal            : TQRLabel;
    lblHomePage         : TQRLabel;
    lblEMail            : TQRLabel;
    lblMensagem         : TQRLabel;
    fldCodigoFornecedor : TQRDBText;
    fldRazaoSocial      : TQRDBText;
    fldCNPJ             : TQRDBText;
    fldNomeFantasia     : TQRDBText;
    fldTipoFornecedor   : TQRDBText;
    fldEndereco         : TQRDBText;
    fldNumero           : TQRDBText;
    fldBairro           : TQRDBText;
    fldCidade           : TQRDBText;
    fldEstado           : TQRDBText;
    fldTelefone         : TQRDBText;
    fldFax              : TQRDBText;
    fldRepresentante    : TQRDBText;
    fldRamal            : TQRDBText;
    fldHomePage         : TQRDBText;
    fldMail             : TQRDBText;
    QRSysData1: TQRSysData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFornecedor: TformRelFornecedor;

implementation

uses ModuloDados;

{$R *.DFM}

end.
