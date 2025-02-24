unit RelContabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TfrmRelcontabilidade = class(TForm)
    QrpContabilidade       : TQuickRep;
    QRBand1                : TQRBand;
    lblR1                  : TQRLabel;
    qrdDataEmissao         : TQRDBText;
    qrdNrNF                : TQRDBText;
    qrdContribuinte        : TQRDBText;
    qrdTipoNota            : TQRDBText;
    qrdObsLivre            : TQRDBText;
    qrdCgc                 : TQRDBText;
    qrdInscrEstadual       : TQRDBText;
    qrdRazaoSocial         : TQRDBText;
    qrdContaCtblFornecedor : TQRDBText;
    qrdNrMunicipio         : TQRDBText;
    qrdUf                  : TQRDBText;
    qrlBaseIpi             : TQRLabel;
    qrlImpostoIpi          : TQRLabel;
    qrlIsentosIpi          : TQRLabel;
    qrlOutrasIpi           : TQRLabel;
    qrlIpiNaoAproveitavel  : TQRLabel;
    qrlAliq7               : TQRLabel;
    qrlAliqt12             : TQRLabel;
    qrlAliq18              : TQRLabel;
    qrlAliq25              : TQRLabel;
    qrdCodContabil         : TQRDBText;
    qrlAliq12              : TQRLabel;
    qrdIntegracao          : TQRDBText;
    qrdAteNro              : TQRDBText;
    qrlbEspecieSerie       : TQRLabel;
    qrblbCfop              : TQRLabel;
    qreBaseCalculo         : TQRExpr;
    qreICMS7               : TQRExpr;
    qreBase7               : TQRExpr;
    qreIsento7             : TQRExpr;
    qreOutras7             : TQRExpr;
    qreBase12              : TQRExpr;
    qreICMS12              : TQRExpr;
    qreIsento12            : TQRExpr;
    qreOutras12            : TQRExpr;
    qreBase18              : TQRExpr;
    qreIcms18              : TQRExpr;
    qreIsento18            : TQRExpr;
    qreOutras18            : TQRExpr;
    qreBase25              : TQRExpr;
    qreIcms25              : TQRExpr;
    qreIsento25            : TQRExpr;
    qreOutras25            : TQRExpr;
    qreBaseR18             : TQRExpr;
    qreIcmsR18             : TQRExpr;
    qreIsentoR18           : TQRExpr;
    qreOutrasR18           : TQRExpr;
    qreIcmsNaFonte         : TQRExpr;
    qreDesconto            : TQRExpr;
    qreValorVista          : TQRExpr;
    qreValorPrazo          : TQRExpr;
    qreIsentoPis           : TQRExpr;
    qrdVago                : TQRDBText;
    qrbV                   : TQRDBText;
    procedure QrpContabilidadeAfterPreview(Sender: TObject);
    procedure qrblbCfopPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelcontabilidade: TfrmRelcontabilidade;

implementation

uses ModuloDados;

{$R *.DFM}



procedure TfrmRelcontabilidade.QrpContabilidadeAfterPreview(
  Sender: TObject);
begin
 QrpContabilidade.ExportToFilter(TQRAsciiExportFilter.Create('C:\Contabilidade.txt'));
 QrpContabilidade.ExportToFilter(TQRAsciiExportFilter.Create('C:\Contabilidade.txt'));
end;

procedure TfrmRelcontabilidade.qrblbCfopPrint(sender: TObject;
  var Value: String);
begin
Value := copy(DmBaseDados.tblAnotaFiscalCFOP.AsString,1,5);
end;

end.
