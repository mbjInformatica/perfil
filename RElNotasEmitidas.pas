unit RElNotasEmitidas;

interface                

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TformRelNotasEmitidas = class(TForm)
    qrpNotasEmitidas: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    qrdData: TQRDBText;
    qrdNota: TQRDBText;
    qrdCodCli: TQRDBText;
    qrdCliente: TQRDBText;
    qrdValor: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCliente: TQRLabel;
    QRLabel5: TQRLabel;
    lblTotDev: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    qrlTitulo: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrsDataEmissao: TQRSysData;
    qrlPeriodo: TQRLabel;
    QRLabel9: TQRLabel;
    qrdPedido: TQRDBText;
    QRShape4: TQRShape;
    qrdObs: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel12: TQRLabel;
    lblVend: TQRLabel;
    lblCanc: TQRLabel;
    lblTotCanc: TQRExpr;
    lblTotVend: TQRExpr;
    lblDevl: TQRLabel;
    lblTotDevl: TQRExpr;
    QRShape1: TQRShape;
    lblDeng: TQRLabel;
    lblTotDeng: TQRExpr;
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure qrdObsPrint(sender: TObject; var Value: String);
    procedure qrdValorPrint(sender: TObject; var Value: String);
    procedure qrdNotaPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formRelNotasEmitidas: TformRelNotasEmitidas;

implementation

uses ModuloDados, NotasEmitidas;


{$R *.dfm}


procedure TformRelNotasEmitidas.qrlPeriodoPrint(sender: TObject; var Value: String);
begin
Value := 'Período de '+DateToStr(formNotasEmitidas.Data1.Date)+' à '+DateToStr(formNotasEmitidas.Data2.Date);
end;

procedure TformRelNotasEmitidas.qrdObsPrint(sender: TObject; var Value: String);
begin
if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '100') then
 begin
  Value := Copy(Value,5,30);
  qrdObs.Font.Color  := clBlue;
  qrdNota.Font.Color := clBlack;
 end
else
 begin
  Value := Copy(Value,5,30);
  qrdObs.Font.Color  := clRed;
  qrdNota.Font.Color := clRed;
 end;
if (Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) = 'D') then
 begin
  qrdObs.Font.Color  := clTeal;
  qrdNota.Font.Color := clTeal;
 end;
if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '110') then
 begin
  qrdObs.Font.Color  := $000D62F0;
  qrdNota.Font.Color := $000D62F0;
 end;
end;

procedure TformRelNotasEmitidas.qrdValorPrint(sender: TObject; var Value: String);
begin
if (dmBaseDados.tblLogMensalValorCheque.AsFloat > 0) then
 begin
  qrdValor.Font.Color := clRed;
 end
else
 begin
  qrdValor.Font.Color := clBlue;
 end;
if (Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) = 'D') then
 begin
  qrdValor.Font.Color := clTeal;
 end;
if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '110') then
 begin
  qrdValor.Font.Color  := $000D62F0;
 end;
end;

procedure TformRelNotasEmitidas.qrdNotaPrint(sender: TObject; var Value: String);
begin
if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '100') then
 begin
  qrdObs.Font.Color  := clBlue;
  qrdNota.Font.Color := clBlack;
 end
else                                 
 begin
  qrdObs.Font.Color  := clRed;
  qrdNota.Font.Color := clRed;
 end;
if (Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) = 'D') then
 begin
  qrdObs.Font.Color  := clTeal;
  qrdNota.Font.Color := clTeal;
 end;
if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '110') then
 begin
  qrdObs.Font.Color  := $000D62F0;
  qrdNota.Font.Color := $000D62F0;
 end;
end;

end.
