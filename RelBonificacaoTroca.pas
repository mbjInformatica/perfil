unit RelBonificacaoTroca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TFormRelBonificacaoTroca = class(TForm)
    qrtRelBonificacaoTroca : TQuickRep;
    dbdCorpo               : TQRBand;
    phbCabecario           : TQRBand;
    SummaryBand1           : TQRBand;
    lblMensagem            : TQRLabel;
    sysData                : TQRSysData;
    sysPagina              : TQRSysData;
    qrlTitulo              : TQRLabel;
    qrlPeriodo             : TQRLabel;
    qrlNPedido             : TQRLabel;
    qrlVendedor            : TQRLabel;
    qrlCliente             : TQRLabel;
    qrlDataEmissao         : TQRLabel;
    qrlValor               : TQRLabel;
    qrdbDataEmissao        : TQRDBText;
    qrdbNPedido            : TQRDBText;
    qrdbVendedor           : TQRDBText;
    qrdbCliente            : TQRDBText;
    qrlTipo                : TQRLabel;
    qrdbTipo               : TQRDBText;
    qrsContador            : TQRSysData;
    qrdbValor              : TQRDBText;
    qreTotal               : TQRExpr;
    QRLabel1: TQRLabel;
    qrlVend: TQRLabel;
    QRLabel3: TQRLabel;
    qrlCli: TQRLabel;
    QRLabel5: TQRLabel;
    qrlForn: TQRLabel;
    procedure qrsContadorPrint(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure qrlTituloPrint(sender: TObject; var Value: String);
    procedure qreTotalPrint(sender: TObject; var Value: String);
    procedure qrlVendPrint(sender: TObject; var Value: String);
    procedure qrlCliPrint(sender: TObject; var Value: String);
    procedure qrlFornPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelBonificacaoTroca: TFormRelBonificacaoTroca;

implementation

uses
        BonificacaoTroca,ModuloDados;

{$R *.DFM}

procedure TFormRelBonificacaoTroca.qrsContadorPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Número de Itens : '+ Value;
end;

procedure TFormRelBonificacaoTroca.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
        Value := (DateToStr(FormBonificacaoTroca.Data1.Date))+' à '+(DateToStr(FormBonificacaoTroca.Data2.Date));
end;

procedure TFormRelBonificacaoTroca.qrlTituloPrint(sender: TObject;
  var Value: String);
begin
        if FormBonificacaoTroca.rdgSelecao.ItemIndex=0 then
                Value := 'Relatório de Bonificações'
        else
                Value := 'Relatório de Trocas';
end;

procedure TFormRelBonificacaoTroca.qreTotalPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Total do Período : '+Value;
end;

procedure TFormRelBonificacaoTroca.qrlVendPrint(sender: TObject;
  var Value: String);
begin
  if FormBonificacaoTroca.edtVendedor.Text = '000' then
   begin
     Value := 'Todos';
   end
  else
   begin
     Value := FormBonificacaoTroca.edtVendedor.Text;
   end;
end;

procedure TFormRelBonificacaoTroca.qrlCliPrint(sender: TObject;
  var Value: String);
begin
  if FormBonificacaoTroca.edtCliente.Text = '000' then
   begin
     Value := 'Todos';
   end
  else
   begin
     Value := FormBonificacaoTroca.edtCliente.Text;
   end;
end;

procedure TFormRelBonificacaoTroca.qrlFornPrint(sender: TObject;
  var Value: String);
begin
  if FormBonificacaoTroca.edtFornecedor.Text = '0000' then
   begin
     Value := 'Todos';
   end
  else
   begin
     Value := FormBonificacaoTroca.edtFornecedor.Text;
   end;
end;

end.
