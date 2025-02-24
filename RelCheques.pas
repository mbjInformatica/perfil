unit RelCheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls;

type
  TFormRelCheques = class(TForm)
    qrpCheques       : TQuickRep;
    qrbEmpresa       : TQRBand;
    lblMensagem      : TQRLabel;
    sysData          : TQRSysData;
    sysPagina        : TQRSysData;
    qrdbNumReq       : TQRDBText;
    qrlBonificacao   : TQRLabel;
    qrdbNomeCliente  : TQRDBText;
    qrlNomeCliente   : TQRLabel;
    QRBand1          : TQRBand;
    qrdbBanco        : TQRDBText;
    ardbAgencia      : TQRDBText;
    qrdbCC           : TQRDBText;
    qrdbNumCheque    : TQRDBText;
    qrdbValor        : TQRDBText;
    qrdbDataVen      : TQRDBText;
    QRBand2          : TQRBand;
    qreTotal         : TQRExpr;
    ChildBand1       : TQRChildBand;
    qrlVencimento    : TQRLabel;
    qrlBanco         : TQRLabel;
    qrlAgencia       : TQRLabel;
    qrlCC            : TQRLabel;
    arlNumero        : TQRLabel;
    qrlValor         : TQRLabel;
    ChildBand2       : TQRChildBand;
    qrlOrcamento2    : TQRLabel;
    qrdbNumReq2      : TQRDBText;
    qrlNomeCliente2  : TQRLabel;
    qrdbNomeCliente2 : TQRDBText;
    qrlOrdem: TQRLabel;
    qrlVendedor: TQRLabel;
    qrlTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    procedure qreTotalPrint(sender: TObject; var Value: String);
    procedure qrlVendedorPrint(sender: TObject; var Value: String);
    procedure qrlOrdemPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelCheques: TFormRelCheques;

implementation

uses
        ModuloDados,Clientes,CadastroChequeDinheiro,Cheques;

{$R *.DFM}

procedure TFormRelCheques.qreTotalPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Total '+ FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
end;

procedure TFormRelCheques.qrlVendedorPrint(sender: TObject;
  var Value: String);
begin
 if FormCheques.edtCliente.Text <> '0000' then
  begin
   Value := FormCheques.edtCliente.Text;
  end;
end;

procedure TFormRelCheques.qrlOrdemPrint(sender: TObject;
  var Value: String);
begin
 if FormCheques.ckbEmissao.Checked = True then
  begin
   Value := 'Emissão';
  end;
end;

end.
