unit RelComissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFrmRelComissao = class(TForm)
    qrpRelComissao          : TQuickRep;
    DetailBand1             : TQRBand;
    qrdbComissao            : TQRDBText;
    qrdbPorcentagem         : TQRDBText;
    qrdbTotal               : TQRDBText;
    qrdbVendedor            : TQRDBText;
    PageHeaderBand1         : TQRBand;
    qrlRelComissao          : TQRLabel;
    qrbTotais               : TQRBand;
    qreTotalFaturamento     : TQRExpr;
    qreTotalComissao        : TQRExpr;
    qrlPeriodo              : TQRLabel;
    qrlVendedor_Todos       : TQRLabel;
    qrlTotalGeral           : TQRLabel;
    ChildBand1              : TQRChildBand;
    qrlNPedido_CodVendedor  : TQRLabel;
    qrlNomeCliente_Vendedor : TQRLabel;
    qrlTotalVenda           : TQRLabel;
    qrlTotalComissao        : TQRLabel;
    qrsDataEmissao          : TQRSysData;
    qrsNumeroPagina         : TQRSysData;
    qrlFam                  : TQRLabel;
    qrlFamilia              : TQRLabel;
    qrlCli                  : TQRLabel;
    qrlCliente              : TQRLabel;
    QRExpr1                 : TQRExpr;
    QRLabel1                : TQRLabel;
    QRDBText1               : TQRDBText;
    QRLabel2                : TQRLabel;
    qrlTCliJales            : TQRLabel;
    qrlTCJ                  : TQRLabel;
    QRLabel3                : TQRLabel;
    qrdData                 : TQRDBText;
    qrdQtde                 : TQRDBText;
    qreVLancamento2         : TQRExpr;
    qreQtde                 : TQRExpr;
    QRLabel4                : TQRLabel;
    QRLabel5                : TQRLabel;
    QRLabel6                : TQRLabel;
    QRLabel7                : TQRLabel;
    QRLabel8                : TQRLabel;
    QRLabel9                : TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrdDescricaoDetail: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    procedure qrdbTotalPrint(sender: TObject; var Value: String);
    procedure qrdbComissaoPrint(sender: TObject; var Value: String);
    procedure qreTotalFaturamentoPrint(sender: TObject; var Value: String);
    procedure qreTotalComissaoPrint(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure qrlNPedido_CodVendedorPrint(sender: TObject;
      var Value: String);
    procedure qrlNomeCliente_VendedorPrint(sender: TObject;
      var Value: String);
    procedure qrlVendedor_TodosPrint(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure qrlTotalVendaPrint(sender: TObject; var Value: String);
    procedure qrdbVendedorPrint(sender: TObject; var Value: String);
    procedure qrdbPorcentagemPrint(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure qrlTCJPrint(sender: TObject; var Value: String);
    procedure qrlTCliJalesPrint(sender: TObject; var Value: String);
    procedure qrlTotalGeralPrint(sender: TObject; var Value: String);
    procedure qrdDataPrint(sender: TObject; var Value: String);
    procedure QRLabel3Print(sender: TObject; var Value: String);
    procedure qrdQtdePrint(sender: TObject; var Value: String);
    procedure qreVLancamento2Print(sender: TObject; var Value: String);
    procedure qrlTotalComissaoPrint(sender: TObject; var Value: String);
    procedure QRLabel4Print(sender: TObject; var Value: String);
    procedure qreQtdePrint(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel9Print(sender: TObject; var Value: String);
    procedure QRLabel10Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure qrdDescricaoDetailPrint(sender: TObject; var Value: String);
    procedure QRLabel13Print(sender: TObject; var Value: String);
    procedure qrpRelComissaoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelComissao: TFrmRelComissao;

implementation
uses
        ModuloDados,Comissao;
{$R *.DFM}

procedure TFrmRelComissao.qrdbTotalPrint(sender: TObject;
  var Value: String);
begin
  {if frmcomissao.ckbTClientes.Checked = True then
   begin
    Value := '';
   end
  else
   begin }
    Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
   //end;
end;
procedure TFrmRelComissao.qrdbComissaoPrint(sender: TObject;
  var Value: String);
begin
  if (frmcomissao.ckbTotal.Checked = True)or(FrmComissao.ckbTClientes.Checked = True)then
   begin
     Value :='';
   end
  else
   begin
     Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
   end;
end;

procedure TFrmRelComissao.qreTotalFaturamentoPrint(sender: TObject;
  var Value: String);
begin
  if FrmComissao.ckbTClientes.Checked = True then
   begin
    Value := '';
   end
  else
   begin
    Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
   end;
end;

procedure TFrmRelComissao.qreTotalComissaoPrint(sender: TObject;
  var Value: String);
begin
  if (frmcomissao.ckbTotal.Checked = True)or(FrmComissao.edtCategoria.Text <> '000') then
   begin
     Value := '';
   end
  else
   begin
     Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
   end;
end;


procedure TFrmRelComissao.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
     Value := 'Período de '+DateToStr(FrmComissao.Data1.Date)+' à '+DateToStr(FrmComissao.Data2.Date);
end;

procedure TFrmRelComissao.qrlNPedido_CodVendedorPrint(sender: TObject;
  var Value: String);
begin
        if (((FrmComissao.ckbTodosVendedores.Checked=True)or(FrmComissao.edtV2.Text <> '000'))and(FrmComissao.ckbPorPedido.Checked = False)) then
         begin
           Value := 'Código do Vendedor'
         end
        else
         begin
           Value := 'Nº do Pedido';
         end;
        if frmComissao.ckbTClientes.Checked = True then
         begin
           Value := 'Código do Cliente';
         end;
end;

procedure TFrmRelComissao.qrlNomeCliente_VendedorPrint(sender: TObject;
  var Value: String);
begin
        if (((FrmComissao.ckbTodosVendedores.Checked=True)or(FrmComissao.edtV2.Text <> '000'))and(FrmComissao.ckbPorPedido.Checked = False)) then
                Value := 'Nome do Vendedor'
        else
                Value := 'Nome do Cliente';
end;

procedure TFrmRelComissao.qrlVendedor_TodosPrint(sender: TObject;
  var Value: String);
begin
        if frmComissao.ckbTodosVendedores.Checked=True then
         begin
           Value := 'TODOS VENDEDORES'
         end
        else
         if (FrmComissao.edtV1.Text <> '000') and (FrmComissao.edtV2.Text = '000') then
         begin
           Value:='Vendedor : '+dmBaseDados.tblPedidosVendedor.AsString;
         end;
        if FrmComissao.edtV2.Text <> '000' then
         begin
          Value := '';
         end;
        if frmComissao.ckbTClientes.Checked = True then
         begin
           Value := 'TOTAL DE CLIENTES';
         end;
end;

procedure TFrmRelComissao.QRLabel1Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTodosVendedores.Checked = True then
  begin
   Value := 'Total de Vendedores :';
  end;
 if FrmComissao.ckbTClientes.Checked = True then
  begin
   Value := 'Total que compraram :'
  end;
end;


procedure TFrmRelComissao.QRDBText1Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.qrlTotalVendaPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTClientes.Checked = True then
  begin
   Value := '';
  end;
end;



procedure TFrmRelComissao.qrdbVendedorPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.rbtSintetico.Checked = True then
  begin
    Value := '';
  end;
end;

procedure TFrmRelComissao.qrdbPorcentagemPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.rbtSintetico.Checked = True then
  begin
    Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel2Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.rbtSintetico.Checked = True then
  begin
    Value := 'Relatório Sintético';
  end;
end;

procedure TFrmRelComissao.qrlTCJPrint(sender: TObject; var Value: String);
begin
 if frmcomissao.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
 {else
  begin
   dmBaseDados.tblPedidos.Open;
   dmBaseDados.tblPedidos.Last;
   Value := dmBaseDados.tblPedidosCodigoCliente.AsString;
   dmBaseDados.tblPedidos.Close;
  end;}
end;

procedure TFrmRelComissao.qrlTCliJalesPrint(sender: TObject;
  var Value: String);
begin
 if frmcomissao.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.qrlTotalGeralPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTotal.Checked = True then
  begin
   Value := '';
  end;
 if FrmComissao.edtCategoria.Text <> '000' then
  begin
   Value := ' Total de Caixas :';
  end;
end;

procedure TFrmRelComissao.qrdDataPrint(sender: TObject; var Value: String);
begin
 if ((FrmComissao.ckbTodosVendedores.Checked=True)or(FrmComissao.edtV2.Text <> '000')or (FrmComissao.ckbTClientes.Checked = True)) then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel3Print(sender: TObject;
  var Value: String);
begin
 if ((FrmComissao.ckbTodosVendedores.Checked=True) or (FrmComissao.edtV2.Text <> '000') or (FrmComissao.ckbTClientes.Checked = True)) then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.qrdQtdePrint(sender: TObject; var Value: String);
begin
 if FrmComissao.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.qreVLancamento2Print(sender: TObject; var Value: String);
begin
 if FrmComissao.edtCategoria.Text = '000' then
  begin
   Value := '';
  end
 else
  begin
   Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
  end;
end;

procedure TFrmRelComissao.qrlTotalComissaoPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTClientes.Checked = True then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel4Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.qreQtdePrint(sender: TObject; var Value: String);
begin
 if FrmComissao.edtCategoria.Text = '000' then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel5Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbTClientes.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel6Print(sender: TObject;
  var Value: String);
begin
 if ((FrmComissao.ckbTClientes.Checked = False)or(FrmComissao.edtCategoria.Text = '000')) then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel8Print(sender: TObject;
  var Value: String);
begin
 if FrmComissao.edtCategoria.Text <> '000' then
  begin
   Value := FrmComissao.edtCategoria.Text;
  end;
end;

procedure TFrmRelComissao.QRLabel9Print(sender: TObject;
  var Value: String);
begin
 if (FrmComissao.edtV1.Text <> '000')and(FrmComissao.edtCategoria.Text <> '000') then
  begin
    Value := 'Vendedor :'+FrmComissao.edtV1.Text;
  end
 else
  begin
    Value := '';
  end;   
end;

procedure TFrmRelComissao.QRLabel10Print(sender: TObject;
  var Value: String);
begin
  if (dmBaseDados.tblLogMensalValorDinheiro.AsFloat = 0) then
   begin
    Value := '';
   end;
end;

procedure TFrmRelComissao.QRLabel11Print(sender: TObject;
  var Value: String);
begin
 if (dmBaseDados.tblLogMensalValorCheque.AsFloat = 0) then
  begin
    Value := '';
  end;
end;

procedure TFrmRelComissao.QRDBText2Print(sender: TObject;
  var Value: String);
begin
if ((dmBaseDados.tblLogMensalValorCheque.AsFloat = 0)or(FrmComissao.ckbTotal.Checked = True)) then
 begin
  Value := '';
 end;
end;

procedure TFrmRelComissao.QRDBText3Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalValorCheque.AsFloat = 0 then
 begin
  Value := '';
 end;
end;

procedure TFrmRelComissao.QRLabel12Print(sender: TObject;
  var Value: String);
begin
if ((dmBaseDados.tblLogMensalObservacao.AsString = '')or(FrmComissao.ckbPorPedido.Checked = False))  then
 begin
   Value := '';
 end;
end;

procedure TFrmRelComissao.qrdDescricaoDetailPrint(sender: TObject;
  var Value: String);
begin
 if FrmComissao.ckbPorPedido.Checked = False then
  begin
   Value := '';
  end;
end;

procedure TFrmRelComissao.QRLabel13Print(sender: TObject;
  var Value: String);
begin
if FrmComissao.rdbData.ItemIndex = 1 then
 begin
  Value := 'Ordem de BAIXA';
 end;
end;

procedure TFrmRelComissao.qrpRelComissaoBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
if FrmComissao.edtCategoria.Text = '000' then
  begin
   qrdQtde.Enabled := False;
   qrdbTotal.Enabled := True;
  end
 else
  begin
   qrdQtde.Enabled := True;
   qrdbTotal.Enabled := False;
  // qrdQtde.Value := FloatToStrF(StrToFloat(Value),ffCurrency,10,2);
  end;
end;

end.
