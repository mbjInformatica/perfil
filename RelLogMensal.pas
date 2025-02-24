unit RelLogMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelLogMensal = class(TForm)
    rptLogMensal: TQuickRep;
    bndCabecalho: TQRBand;
    bndColunas: TQRBand;
    bndLogMensal: TQRBand;
    bndSumario: TQRBand;
    lblTitulo: TQRLabel;
    lblMesAno: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    lblData: TQRLabel;
    lblMovimento: TQRLabel;
    lblDocumento: TQRLabel;
    lblCodigoProduto: TQRLabel;
    lblDescricao: TQRLabel;
    lblUnidade: TQRLabel;
    lblQuantidade: TQRLabel;
    lblValorLancamento: TQRLabel;
    fldData: TQRDBText;
    fldCodigoMovimento: TQRDBText;
    flfDocumento: TQRDBText;
    fldCodigoProduto: TQRDBText;
    fldDescricao: TQRDBText;
    fldUnidade: TQRDBText;
    fldQuantidade: TQRDBText;
    fldValorLancamento: TQRDBText;
    lblTotalItens: TQRLabel;
    lblValorTotal: TQRLabel;
    exprTotalItens: TQRExpr;
    exprValorTotal: TQRExpr;
    procedure fldValorLancamentoPrint(sender: TObject; var Value: String);
    procedure exprValorTotalPrint(sender: TObject; var Value: String);
    procedure lblMesAnoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelLogMensal: TformRelLogMensal;

implementation

uses ModuloDados,LogMensal;

{$R *.DFM}

procedure TformRelLogMensal.fldValorLancamentoPrint(sender: TObject;
  var Value: String);
begin
        Value:=FloatToStrF(dmBaseDados.tblLogMensalValorLancamento.AsFloat,ffCurrency,10,2);
end;

procedure TformRelLogMensal.exprValorTotalPrint(sender: TObject;
  var Value: String);
Var
        dblTotal:Double;
begin
        dblTotal:=StrToFloat(Value);
        Value:=FloatToStrF(dblTotal,ffCurrency,10,2);
end;

procedure TformRelLogMensal.lblMesAnoPrint(sender: TObject;
  var Value: String);
begin
        if formLogMensal.rdbSintetico.Checked=True then
                Value:=Value + ' Sintético'
        else
                Value:=Value + ' Analítico';
end;

end.
