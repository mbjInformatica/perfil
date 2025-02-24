unit RelCheckout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls;

type
  TformRelCheckout = class(TForm)
    qrpRelCheckout: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel7: TQRLabel;
    qrsDataEmissao: TQRSysData;
    qrlPeriodo: TQRLabel;
    qrsNumeroPagina: TQRSysData;
    qrlVendedor_Todos: TQRLabel;
    qrlFamilia: TQRLabel;
    qrlFam: TQRLabel;
    qrlNCheckout: TQRLabel;
    QRLabel8: TQRLabel;
    qrlquantidade: TQRLabel;
    qrdbQuantidade: TQRDBText;
    qrlTotquant: TQRLabel;
    QRExpr3: TQRExpr;
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure qrlVendedor_TodosPrint(sender: TObject; var Value: String);
    procedure qrlFamiliaPrint(sender: TObject; var Value: String);
    procedure qrlNCheckoutPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelCheckout: TformRelCheckout;

implementation

uses ModuloDados, Checkout;

{$R *.DFM}

procedure TformRelCheckout.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
     Value := 'Período de '+DateToStr(formCheckout.Data1.Date)+' à '+DateToStr(formCheckout.Data2.Date);
end;

procedure TformRelCheckout.qrlVendedor_TodosPrint(sender: TObject;
  var Value: String);
begin
        if formCheckout.edtV1.Text = '000' then
         begin
           Value := 'TODOS VENDEDORES'
         end
        else
         begin
           Value := 'Vendedor : '+dmBaseDados.tblLogMensalObservacao.AsString;
         end;
end;

procedure TformRelCheckout.qrlFamiliaPrint(sender: TObject;
  var Value: String);
begin
         if formCheckout.edtFamilia.Text = '000' then
         begin
           Value := 'Todas'
         end
        else
         begin
           Value := formCheckout.edtFamilia.Text;
         end;
end;

procedure TformRelCheckout.qrlNCheckoutPrint(sender: TObject;
  var Value: String);
begin
       if formCheckout.edtinicial.Text = '00' then
         begin
           Value := 'Todos'
         end
        else
         begin
           Value := formCheckout.edtinicial.Text +' ao '+ formCheckout.edtfinal.Text;
         end;

end;

end.
