unit RelComissaoBKP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls;

type
  TfrmRelComissaoBKP = class(TForm)
    qrpRelComissaoBKP: TQuickRep;
    DetailBand1: TQRBand;
    qrdbComissao: TQRDBText;
    qrdbPorcentagem: TQRDBText;
    qrdbTotal: TQRDBText;
    qrdbVendedor: TQRDBText;
    QRDBText1: TQRDBText;
    qrdData: TQRDBText;
    qrdQtde: TQRDBText;
    PageHeaderBand1: TQRBand;
    qrlRelComissao: TQRLabel;
    qrlPeriodo: TQRLabel;
    qrlVendedor_Todos: TQRLabel;
    qrsDataEmissao: TQRSysData;
    qrsNumeroPagina: TQRSysData;
    qrlFam: TQRLabel;
    qrlFamilia: TQRLabel;
    qrlCli: TQRLabel;
    qrlCliente: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrbTotais: TQRBand;
    qreTotalFaturamento: TQRExpr;
    qreTotalComissao: TQRExpr;
    qrlTotalGeral: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel1: TQRLabel;
    qrlTCliJales: TQRLabel;
    qrlTCJ: TQRLabel;
    qreVLancamento2: TQRExpr;
    qreQtde: TQRExpr;
    QRLabel4: TQRLabel;
    ChildBand1: TQRChildBand;
    qrlNPedido_CodVendedor: TQRLabel;
    qrlNomeCliente_Vendedor: TQRLabel;
    qrlTotalVenda: TQRLabel;
    qrlTotalComissao: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdDescricaoDetail: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel10: TQRLabel;
    procedure qrlNPedido_CodVendedorPrint(sender: TObject;
      var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure qrlNomeCliente_VendedorPrint(sender: TObject;
      var Value: String);
    procedure qrlTotalVendaPrint(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure qrdbVendedorPrint(sender: TObject; var Value: String);
    procedure qrdDataPrint(sender: TObject; var Value: String);
    procedure qrdbPorcentagemPrint(sender: TObject; var Value: String);
    procedure qrdQtdePrint(sender: TObject; var Value: String);
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure qreQtdePrint(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure qreTotalFaturamentoPrint(sender: TObject; var Value: String);
    procedure qrlTotalGeralPrint(sender: TObject; var Value: String);
    procedure qrlTCliJalesPrint(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure qrlTCJPrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure qrdDescricaoDetailPrint(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelComissaoBKP: TfrmRelComissaoBKP;

implementation
uses
        ModuloDados,ComissaoBKP;

{$R *.DFM}

procedure TfrmRelComissaoBKP.qrlNPedido_CodVendedorPrint(sender: TObject;
  var Value: String);
begin
        if (((FrmComissaoBKP.ckbTodosVendedores.Checked=True)or(FrmComissaoBKP.edtV2.Text <> '000'))and(FrmComissaoBKP.ckbPorPedido.Checked = False)) then
         begin
           Value := 'Código do Vendedor'
         end
        else
         begin
           Value := 'Nº do Pedido';
         end;
        if FrmComissaoBKP.ckbTClientes.Checked = True then
         begin
           Value := 'Código do Cliente';
         end;
end;

procedure TfrmRelComissaoBKP.QRLabel3Print(sender: TObject;
  var Value: String);
begin
 if ((FrmComissaoBKP.ckbTodosVendedores.Checked=True) or (FrmComissaoBKP.edtV2.Text <> '000') or (FrmComissaoBKP.ckbTClientes.Checked = True)) then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrlNomeCliente_VendedorPrint(sender: TObject;
  var Value: String);
begin
        if (((FrmComissaoBKP.ckbTodosVendedores.Checked=True)or(FrmComissaoBKP.edtV2.Text <> '000'))and(FrmComissaoBKP.ckbPorPedido.Checked = False)) then
                Value := 'Nome do Vendedor'
        else
                Value := 'Nome do Cliente';
end;

procedure TfrmRelComissaoBKP.qrlTotalVendaPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTClientes.Checked = True then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRLabel6Print(sender: TObject;
  var Value: String);
begin
 if ((FrmComissaoBKP.ckbTClientes.Checked = False)or(FrmComissaoBKP.edtCategoria.Text = '000')) then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRLabel5Print(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrdbVendedorPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.rbtSintetico.Checked = True then
  begin
    Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrdDataPrint(sender: TObject;
  var Value: String);
begin
 if ((FrmComissaoBKP.ckbTodosVendedores.Checked=True)or(FrmComissaoBKP.edtV2.Text <> '000')or (FrmComissaoBKP.ckbTClientes.Checked = True)) then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrdbPorcentagemPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.rbtSintetico.Checked = True then
  begin
    Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrdQtdePrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrdbTotalPrint(sender: TObject;
  var Value: String);
begin
Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
end;

procedure TfrmRelComissaoBKP.QRDBText1Print(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qreQtdePrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRLabel4Print(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qreTotalFaturamentoPrint(sender: TObject;
  var Value: String);
begin
  if FrmComissaoBKP.ckbTClientes.Checked = True then
   begin
    Value := '';
   end
  else
   begin
    Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
   end;
end;

procedure TfrmRelComissaoBKP.qrlTotalGeralPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTotal.Checked = True then
  begin
   Value := '';
  end;
 if FrmComissaoBKP.edtCategoria.Text <> '000' then
  begin
   Value := ' Total de Caixas :';
  end;
end;

procedure TfrmRelComissaoBKP.qrlTCliJalesPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRLabel1Print(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTodosVendedores.Checked = True then
  begin
   Value := 'Total de Vendedores :';
  end;
 if FrmComissaoBKP.ckbTClientes.Checked = True then
  begin
   Value := 'Total que compraram :'
  end;
end;

procedure TfrmRelComissaoBKP.qrlTCJPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRDBText2Print(sender: TObject;
  var Value: String);
begin
if ((dmBaseDados.tblLogMensalValorCheque.AsFloat = 0)or(FrmComissaoBKP.ckbTotal.Checked = True)) then
 begin
  Value := '';
 end;
end;

procedure TfrmRelComissaoBKP.QRLabel11Print(sender: TObject;
  var Value: String);
begin
 if (dmBaseDados.tblLogMensalValorCheque.AsFloat = 0) then
  begin
    Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRDBText3Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalValorCheque.AsFloat = 0 then
 begin
  Value := '';
 end;
end;

procedure TfrmRelComissaoBKP.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if (dmBaseDados.tblLogMensalValorDinheiro.AsFloat = 0) then
   begin
    Value := '';
   end;
end;

procedure TfrmRelComissaoBKP.qrdDescricaoDetailPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.ckbPorPedido.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.QRLabel12Print(sender: TObject;
  var Value: String);
begin
if ((dmBaseDados.tblLogMensalObservacao.AsString = '')or(FrmComissaoBKP.ckbPorPedido.Checked = False))  then
 begin
   Value := '';
 end;
end;

procedure TfrmRelComissaoBKP.QRLabel9Print(sender: TObject;
  var Value: String);
begin
 if (FrmComissaoBKP.edtV1.Text <> '000')and(FrmComissaoBKP.edtCategoria.Text <> '000') then
  begin
    Value := 'Vendedor :'+FrmComissaoBKP.edtV1.Text;
  end
 else
  begin
    Value := '';
  end;
end;

procedure TfrmRelComissaoBKP.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
 Value := 'Período de '+DateToStr(FrmComissaoBKP.Data1.Date)+' à '+DateToStr(FrmComissaoBKP.Data2.Date);
end;

procedure TfrmRelComissaoBKP.QRLabel2Print(sender: TObject;
  var Value: String);
begin
 if FrmComissaoBKP.rbtSintetico.Checked = True then
  begin
    Value := 'Relatório Sintético';
  end;
end;

end.
