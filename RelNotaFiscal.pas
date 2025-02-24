unit RelNotaFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TFrmNotaFiscal = class(TForm)
    qrtNotaFiscal    : TQuickRep;
    qrbInicio        : TQRBand;
    qrdbNumeroNota   : TQRDBText;
    qrdbRazao        : TQRDBText;
    qrdbCnpj         : TQRDBText;
    qrdbEndereco     : TQRDBText;
    qrdbBairro       : TQRDBText;
    qrdbCep          : TQRDBText;
    qrdbMunicipio    : TQRDBText;
    qrdbFone         : TQRDBText;
    qrdbUf           : TQRDBText;
    qrdbInscEst      : TQRDBText;
    qrbMeio          : TQRBand;
    qrdbDescricao    : TQRDBText;
    qrdbCST          : TQRDBText;
    qrdbUnidade      : TQRDBText;
    qrdbQuantidade   : TQRDBText;
    qrdbUnitario     : TQRDBText;
    qrdbTotal        : TQRDBText;
    qrdbIcms         : TQRDBText;
    qrbFooter        : TQRBand;
    qrdbValorIcms    : TQRDBText;
    qrdbEstado       : TQRDBText;
    qrdbNPedido      : TQRDBText;
    qrdbVendedor     : TQRDBText;
    qrdbCondPag      : TQRDBText;
    qrdbNnota        : TQRDBText;
    QRSysData1       : TQRSysData;
    qrdbBaseIcms     : TQRDBText;
    qrlNossoCarro    : TQRLabel;
    qrlFrete         : TQRLabel;
    qreTotalProdutos : TQRExpr;
    qreTotalNota     : TQRExpr;
    QRExpr1          : TQRExpr;
    qrlSaida         : TQRLabel;
    qrlEntrada       : TQRLabel;
    qrlCFOP          : TQRLabel;
    qrlNatOp         : TQRLabel;
    qreQuantidade    : TQRExpr;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlPlaca: TQRLabel;
    qrlObs: TQRLabel;
    qrlObsIsento: TQRLabel;
    qrlnomerg: TQRLabel;
    qrdbRazSoc: TQRDBText;
    procedure qreTotalProdutosPrint(sender: TObject; var Value: String);
    procedure qreTotalNotaPrint(sender: TObject; var Value: String);
    procedure qrdbCfopPrint(sender: TObject; var Value: String);
    procedure qrdbNatOpPrint(sender: TObject; var Value: String);
    procedure qrlNatOpPrint(sender: TObject; var Value: String);
    procedure qrlCFOPPrint(sender: TObject; var Value: String);
    procedure qrdbBaseIcmsPrint(sender: TObject; var Value: String);
    procedure qrdbValorIcmsPrint(sender: TObject; var Value: String);
    procedure qrbMeioAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure qrdbDescricaoPrint(sender: TObject; var Value: String);
    procedure qrbMeioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlPlacaPrint(sender: TObject; var Value: String);
    procedure qrlObsPrint(sender: TObject; var Value: String);
    procedure qrdbUnitarioPrint(sender: TObject; var Value: String);
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure qrtNotaFiscalBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmNotaFiscal: TFrmNotaFiscal;
  

implementation

Uses
        ModuloDados,NotaFiscal;
{$R *.DFM}

procedure TFrmNotaFiscal.qreTotalProdutosPrint(sender: TObject;
  var Value: String);
var
        dblTotal:Double;
begin
        dblTotal := StrToFloat(Value);
        Value    := FloatToStrF(dblTotal,ffCurrency,10,2);
end;

procedure TFrmNotaFiscal.qreTotalNotaPrint(sender: TObject;
  var Value: String);
var
        dblTotal:Double;
begin
        dblTotal := StrToFloat(Value);
        Value    := FloatToStrF(dblTotal,ffCurrency,10,2);
end;

procedure TFrmNotaFiscal.qrdbCfopPrint(sender: TObject; var Value: String);
var
strCfop:String;
begin
        strCfop := dmBaseDados.tblANotaFiscalCFOP.AsString;
        Value   := Copy(strCfop,1,5);
end;

procedure TFrmNotaFiscal.qrdbNatOpPrint(sender: TObject;
  var Value: String);
var
strCfop:String;
begin
        strCfop := dmBaseDados.tblANotaFiscalCFOP.AsString;
        Value   := Copy(strCfop,10,12);
end;

procedure TFrmNotaFiscal.qrlNatOpPrint(sender: TObject; var Value: String);
Var
strNatOP:String;
begin
        strNatOP := dmBaseDados.tblANotaFiscalCFOP.AsString;
        Value    := Copy(strNatOP,7,30);
        
end;

procedure TFrmNotaFiscal.qrlCFOPPrint(sender: TObject; var Value: String);
var
strCfop:String;
begin
        strCfop := dmBaseDados.tblANotaFiscalCFOP.AsString;
        Value   := Copy(strCfop,1,5);
end;

procedure TFrmNotaFiscal.qrdbBaseIcmsPrint(sender: TObject;
  var Value: String);
begin
        Value := FloatToStrF(dmBaseDados.tblANotaFiscalBaseCalculo.AsFloat,ffCurrency,10,2);
end;

procedure TFrmNotaFiscal.qrdbValorIcmsPrint(sender: TObject;
  var Value: String);
begin
        Value:=FloatToStrF(dmBaseDados.tblANotaFiscalValorICMS.AsFloat,ffCurrency,10,2);
end;

procedure TFrmNotaFiscal.qrbMeioAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
{

  if strCont > 23 then
     begin
     strCont :=0;

     end;    }
end;

procedure TFrmNotaFiscal.qrdbDescricaoPrint(sender: TObject;
  var Value: String);
begin
qrdbCST.Enabled        := True;
qrdbUnidade.Enabled    := True;
qrdbQuantidade.Enabled := True;
qrdbUnitario.Enabled   := True;
qrdbTotal.Enabled      := True;
qrdbIcms.Enabled       := True;
 if (dmBaseDados.tblLogMensalCodigoProduto.AsString = '') then
  begin
   qrdbCST.Enabled        := False;
   qrdbUnidade.Enabled    := False;
   qrdbQuantidade.Enabled := False;
   qrdbUnitario.Enabled   := False;
   qrdbTotal.Enabled      := False;
   qrdbIcms.Enabled       := False;
 end;
{qrbMeio.ForceNewPage := False;
qrbFooter.Enabled := true;
if strCont >23  then
 begin
  qrbMeio.ForceNewPage := True;
  qrbFooter.Enabled := false;

 end;   }
end;

procedure TFrmNotaFiscal.qrbMeioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 // strCont := strCont+1;
end;

procedure TFrmNotaFiscal.qrlPlacaPrint(sender: TObject; var Value: String);
begin
if FrmEmissaoNF.cmbCfop.ItemIndex = 1 then
 begin
  Value := FrmEmissaoNF.edtPlaca.Text;
 end
else
 begin
  Value := '';
 end;
end;

procedure TFrmNotaFiscal.qrlObsPrint(sender: TObject; var Value: String);
begin
if ((FrmEmissaoNF.cmbCfop.ItemIndex = 1)or(FrmEmissaoNF.cmbCfop.ItemIndex = 5)) then
 begin
  Value := FrmEmissaoNF.edtObs.Text;
 end ;
{else
 begin
  Value := '';
 end;   }
end;

procedure TFrmNotaFiscal.qrdbUnitarioPrint(sender: TObject;
  var Value: String);
begin
qrdbUnitario.Font.Color := clBlack;
if dmBaseDados.tblLogMensalValorDinheiro.AsString = '' then
 begin
qrdbUnitario.Font.Color := clWhite;
 end;
end;

procedure TFrmNotaFiscal.qrdbTotalPrint(sender: TObject;
  var Value: String);
begin
qrdbTotal.Font.Color := clBlack;
if dmBaseDados.tblLogMensalValorLancamento.AsString = '' then
 begin
qrdbTotal.Font.Color := clWhite;
 end;
end;

procedure TFrmNotaFiscal.qrtNotaFiscalBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if FrmEmissaoNF.edtnomerg.Text <> '' then
    begin
      qrdbRazSoc.Enabled     := False;
      qrlnomerg.Enabled      := True;
    end
  else
    begin
      qrdbRazSoc.Enabled     := True;
      qrlnomerg.Enabled      := False;
    end;

end;

end.
