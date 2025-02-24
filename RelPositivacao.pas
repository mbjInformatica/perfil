unit RelPositivacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelPositivacao = class(TForm)
    qrpRelPositivacao: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrlVendedor_Todos: TQRLabel;
    qrlFam: TQRLabel;
    qrlFamilia: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrsDataEmissao: TQRSysData;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    procedure qrlVendedor_TodosPrint(sender: TObject; var Value: String);
    procedure qrlFamiliaPrint(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelPositivacao: TformRelPositivacao;

implementation

uses ModuloDados, PositivacaoCliente;

{$R *.DFM}

procedure TformRelPositivacao.qrlVendedor_TodosPrint(sender: TObject;
  var Value: String);
begin
        if formPositivacaoCliente.edtV1.Text = '000' then
         begin
           Value := 'TODOS VENDEDORES'
         end
        else
         begin
           Value := 'Vendedor : '+dmBaseDados.tblLogMensalObservacao.AsString;
         end;
end;

procedure TformRelPositivacao.qrlFamiliaPrint(sender: TObject;
  var Value: String);
begin
         if formPositivacaoCliente.edtFamilia.Text = '000' then
         begin
           Value := 'Todas'
         end
        else
         begin
           Value := formPositivacaoCliente.edtFamilia.Text;
         end;
end;

procedure TformRelPositivacao.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
     Value := 'Período de '+DateToStr(formPositivacaoCliente.Data1.Date)+' à '+DateToStr(formPositivacaoCliente.Data2.Date);
end;

end.
