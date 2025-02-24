unit RelOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls;

type
  TformRelOS = class(TForm)
    rptOS: TQuickRep;
    bndColunas: TQRBand;
    bndCabecalho: TQRBand;
    bndOS: TQRBand;
    bndRodape: TQRBand;
    lblTitulo: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblPlacaVeiculo: TQRLabel;
    lblVeiculo: TQRLabel;
    lblAnoModelo: TQRLabel;
    lblCliente: TQRLabel;
    lblFone: TQRLabel;
    ChildBand1: TQRChildBand;
    lblServicoExecultado: TQRLabel;
    lblValorTotal: TQRLabel;
    fldPlaca: TQRDBText;
    fldCarro: TQRDBText;
    fldAnoModelo: TQRDBText;
    fldCliente: TQRDBText;
    fldFone: TQRDBText;
    ChildBand2: TQRChildBand;
    fldServicoExecultado: TQRDBText;
    fldValorTotal: TQRDBText;
    lblMensagem: TQRLabel;
    lblOS: TQRLabel;
    fldOS: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelOS: TformRelOS;

implementation

uses ModuloDados;

{$R *.DFM}

end.
