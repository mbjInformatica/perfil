unit RelGrupoFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TformRelGrupoFamilia = class(TForm)
    rptGrupoFamilia: TQuickRep;
    bndCabecalho: TQRBand;
    bndFamilias: TQRBand;
    bndRodape: TQRBand;
    bndCategorias: TQRSubDetail;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblFamilia: TQRLabel;
    fldCodigoFamilia: TQRDBText;
    fldDescricaoFamilia: TQRDBText;
    fldCodigoCategoria: TQRDBText;
    fldDescricaoCategoria: TQRDBText;
    lblMensagem: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelGrupoFamilia: TformRelGrupoFamilia;

implementation

uses ModuloDados;

{$R *.DFM}

end.
