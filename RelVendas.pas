unit RelVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelVendas = class(TForm)
    rptVendas: TQuickRep;
    bndProdutos: TQRBand;
    fldDescricaoAbreviada: TQRDBText;
    fldVlUnitario: TQRDBText;
    fldVlTotal: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel8: TQRLabel;
    fldUnidadeMedida: TQRDBText;
    bndSumario: TQRBand;
    lblTotalVenda: TQRLabel;
    expTotalVendas: TQRExpr;
    qrlAviso: TQRLabel;
    sysData: TQRSysData;
    QRLabel1: TQRLabel;
    bndCabecalho: TQRBand;
    qrlBonificacao: TQRLabel;
    qrdbNumReq: TQRDBText;
    qrlVendedor: TQRLabel;
    qrdbCodVendedor: TQRDBText;
    qrlNomeCliente: TQRLabel;
    qrdbNomeCliente: TQRDBText;
    qrlCodigo: TQRLabel;
    qrdbCodCli: TQRDBText;
    qrlFone: TQRLabel;
    qrdbFone: TQRDBText;
    lblMensagem: TQRLabel;
    qrlPBonificacao: TQRLabel;
    qrlTipoVenda: TQRLabel;
    QRLabel6: TQRLabel;
    lblVlUnitario: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText2: TQRDBText;
    procedure rptVendasBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure qrlPBonificacaoPrint(sender: TObject; var Value: String);
    procedure qrlTipoVendaPrint(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure qrlPedidoNumPrint(sender: TObject; var Value: String);
    procedure qrlData1Print(sender: TObject; var Value: String);
    procedure qrlData2Print(sender: TObject; var Value: String);
    procedure qrlData3Print(sender: TObject; var Value: String);
    procedure qrlData4Print(sender: TObject; var Value: String);
    procedure qrlBonPrint(sender: TObject; var Value: String);
    procedure qrePesoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelVendas: TformRelVendas;

implementation

uses ModuloDados,Venda,AlteraValor;

{$R *.DFM}

procedure TformRelVendas.rptVendasBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin

        if (intConfImp=1) then
                begin
                qrdbNumReq.DataSet        := dmBaseDados.tblSaida;
                qrdbNumReq.DataField      := 'NumeroRequisicao';
                qrdbCodVendedor.DataSet   := dmBaseDados.tblSaida;
                qrdbCodVendedor.DataField := 'CodVen';
              //  qrdbN_Pedido.DataSet      := dmBaseDados.tblSaida;
//                qrdbN_Pedido.DataField    := 'NumeroRequisicao';
//                qrdbCod_Ven.DataSet       := dmBaseDados.tblSaida;
                //qrdbCod_Ven2.DataSet      := dmBaseDados.tblSaida;
//                qrdbCod_Ven.DataField     := 'CodVen';
//                qrdbNum_Pedido.DataSet    := dmBaseDados.tblSaida;
//                qrdbNum_Pedido.DataField  := 'NumeroRequisicao';
                end;
end;

procedure TformRelVendas.QRDBText7Print(sender: TObject;
  var Value: String);
begin
        Value:= FloatToStr(dmBaseDados.tblClientesCodigoCliente.AsFloat)+' - '+Value;
end;

procedure TformRelVendas.qrlPBonificacaoPrint(sender: TObject;
  var Value: String);
begin
        if formVendasBalcao.cmbTPagamento.ItemIndex>4 then
            if formVendasBalcao.cmbTPagamento.ItemIndex = 5 then
                        Value := '* * * B O N I F I C A Ç Ã O * * * '
                else
                        Value := '* * * T R O C A * * *';

end;

procedure TformRelVendas.qrlTipoVendaPrint(sender: TObject;
  var Value: String);
begin
        Value := formVendasBalcao.cmbTPagamento.Text;
end;

procedure TformRelVendas.QRLabel13Print(sender: TObject;
  var Value: String);
begin
        Value := qrlBonificacao.Caption;
end;

procedure TformRelVendas.qrlPedidoNumPrint(sender: TObject;
  var Value: String);
begin
        Value := qrlBonificacao.Caption;
end;

procedure TformRelVendas.qrlData1Print(sender: TObject; var Value: String);
begin
        if FormAlterarValor.mskData2.Text<>'  /  /    ' then
                Value := '1º '+DateToStr(dmBaseDados.tblSaidaDataVencimento.AsDateTime) + '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2)
        else
                Value := '';
end;

procedure TformRelVendas.qrlData2Print(sender: TObject; var Value: String);
begin
        if FormAlterarValor.mskData3.Text<>'  /  /    ' then
                Value := '2º '+FormAlterarValor.mskData2.Text + '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2)
        else
                if FormAlterarValor.mskData2.Text='  /  /    ' then
                        Value := ''
                //else
                       // Value:= '2º '+DateToStr(dmBaseDados.tblSaidaDataVencimento.AsDateTime)+ '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2);
end;

procedure TformRelVendas.qrlData3Print(sender: TObject; var Value: String);
begin
        if FormAlterarValor.mskData3.Text<>'  /  /    ' then
                Value := '3º '+FormAlterarValor.mskData3.Text + '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2)
        else
                if FormAlterarValor.mskData3.Text='  /  /    ' then
                        Value := ''
             //   else
                        //Value := '3º '+DateToStr(dmBaseDados.tblSaidaDataVencimento.AsDateTime)+ '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2);
end;

procedure TformRelVendas.qrlData4Print(sender: TObject; var Value: String);
begin
        if FormAlterarValor.mskData4.Text<>'  /  /    ' then
                Value := '4º '+ FormAlterarValor.mskData4.Text+ '  ' + FloatToStrF(fltVParcela,ffCurrency,10,2)
        else
                Value := '';
end;

procedure TformRelVendas.qrlBonPrint(sender: TObject;
  var Value: String);
begin
        if (formVendasBalcao.cmbTPagamento.ItemIndex>4) and (formVendasBalcao.cmbTPagamento.ItemIndex = 5) then
                        Value := 'BONIFICAÇÃO'
                else
                        Value := '';

end;

procedure TformRelVendas.qrePesoPrint(sender: TObject; var Value: String);
begin
if formVendasBalcao.cmbTPagamento.ItemIndex = 6 then
 begin
  Value := '';
 end;
end;

end.
