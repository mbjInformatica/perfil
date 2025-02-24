unit RelCategorias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelCategoria = class(TForm)
    rptCategorias         : TQuickRep;
    bndCabecalho          : TQRBand;
    bndColunas            : TQRBand;
    bndCategorias         : TQRBand;
    bndRodape             : TQRBand;
    lblTitulo             : TQRLabel;
    lblOrdem              : TQRLabel;
    sysData               : TQRSysData;
    sysPagina             : TQRSysData;
    lblCodigoCategoria    : TQRLabel;
    lblDescricaoCategoria : TQRLabel;
    fldCodigoCategoria    : TQRDBText;
    fldDescricaoCategoria : TQRDBText;
    lblMensagem           : TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelCategoria: TformRelCategoria;

implementation

uses ModuloDados;

{$R *.DFM}

end.
