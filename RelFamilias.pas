unit RelFamilias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelFamilia = class(TForm)
    rptFamilias         : TQuickRep;
    bndCabecalho        : TQRBand;
    lblTitulo           : TQRLabel;
    lblOrdem            : TQRLabel;
    sysData             : TQRSysData;
    sysPagina           : TQRSysData;
    bndColunas          : TQRBand;
    bndRodape           : TQRBand;
    lblCodigoFamilia    : TQRLabel;
    lblDescricaoFamilia : TQRLabel;
    lblMensagem         : TQRLabel;
    QRBand1             : TQRBand;
    QRDBText8           : TQRDBText;
    QRDBText9           : TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFamilia: TformRelFamilia;

implementation

uses ModuloDados;

{$R *.DFM}

end.
