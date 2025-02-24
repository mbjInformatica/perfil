unit RelProdutosVendidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFormRelProdutosVendidos = class(TForm)
    qrpprodutosVendidos : TQuickRep;
    QRBand2             : TQRBand;
    qrdCodProduto       : TQRDBText;
    QRDBText1           : TQRDBText;
    QRDBText2           : TQRDBText;
    qrdDescricao        : TQRDBText;
    phbCabecario        : TQRBand;
    lblMensagem         : TQRLabel;
    sysData             : TQRSysData;
    sysPagina           : TQRSysData;
    qrlTitulo           : TQRLabel;
    qrlNPedido          : TQRLabel;
    qrlDescricao        : TQRLabel;
    qrlValor            : TQRLabel;
    qrlQuantidade       : TQRLabel;
    QRSubDetail1        : TQRSubDetail;
    QRBand1             : TQRBand;
    QRLabel1            : TQRLabel;
    qrlTotal            : TQRLabel;
    qreTotal            : TQRExpr;
    qrlTipoRel          : TQRLabel;
    qrlVendedor         : TQRLabel;
    qrlCliente          : TQRLabel;
    qrlFamilia          : TQRLabel;
    qrlPromocao         : TQRLabel;
    qrlRel              : TQRLabel;
    QRLabel2            : TQRLabel;
    QRLabel3            : TQRLabel;
    QRLabel4            : TQRLabel;
    QRLabel5            : TQRLabel;
    QRLabel6            : TQRLabel;
    QRDBText4           : TQRDBText;
    QRExpr1             : TQRExpr;
    QRLabel7            : TQRLabel;
    qrlPeriodo          : TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    qrdLucro: TQRDBText;
    qrdMargem: TQRDBText;
    QRLabel11: TQRLabel;
    qreTCusto: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel14: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel17: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel18: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure qreTotalPrint(sender: TObject; var Value: String);
    procedure qrdDescricaoPrint(sender: TObject; var Value: String);
    procedure qrdCodProdutoPrint(sender: TObject; var Value: String);
    procedure qrlTipoRelPrint(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure qrlPeriodoPrint(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure qrdLucroPrint(sender: TObject; var Value: String);
    procedure qrdMargemPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRLabel16Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRLabel18Print(sender: TObject; var Value: String);
    procedure qreTCustoPrint(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure qrpprodutosVendidosAfterPreview(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelProdutosVendidos: TFormRelProdutosVendidos;
   strMargem, strLucro : Double;
   
implementation

uses ProdutosVendidos, ModuloDados;

{$R *.DFM}

procedure TFormRelProdutosVendidos.QRDBText2Print(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
      begin
        Value := '';
      end;
strMargem := dmBaseDados.tblLogMensalValorCobranca.AsFloat*100;
strLucro  := dmBaseDados.tblLogMensalValorCheque.AsFloat*100;
FormRelProdutosVendidos.QRDBText2.Font.Color := clBlack;
 if (strLucro < strMargem) then
  begin
    FormRelProdutosVendidos.QRDBText2.Font.Color := clRed;
  end;
end;

procedure TFormRelProdutosVendidos.QRLabel1Print(sender: TObject;
  var Value: String);
begin
FormRelProdutosVendidos.QRSubDetail1.Frame.DrawTop    := False;
FormRelProdutosVendidos.QRSubDetail1.Frame.DrawBottom := False;
    if (dmBaseDados.tblLogMensalSubtotal.AsFloat<>0) then
      begin
        Value := 'Sub-Total: '+FloatToStrF((dmBaseDados.tblLogMensalSubtotal.AsFloat),ffCurrency,10,2);
        if frmProdutosVendidos.rdgTipoRelatorio.ItemIndex = 0 then
         begin
          FormRelProdutosVendidos.QRSubDetail1.Frame.DrawTop := True;
         end
        else
         begin
          FormRelProdutosVendidos.QRSubDetail1.Frame.DrawTop    := False;
          FormRelProdutosVendidos.QRSubDetail1.Frame.DrawBottom := True;
         end;
      end
    else
      begin
        Value := '';
      end;
end;

procedure TFormRelProdutosVendidos.qreTotalPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
     begin
       Value := '';
     end;
end;

procedure TFormRelProdutosVendidos.qrdDescricaoPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.rdgTipoRelatorio.ItemIndex = 1 then
     begin
      Value := '';
     end;
strMargem := dmBaseDados.tblLogMensalValorCobranca.AsFloat*100;
strLucro  := dmBaseDados.tblLogMensalValorCheque.AsFloat*100;
FormRelProdutosVendidos.qrdDescricao.Font.Color := clBlack;
 if (strLucro < strMargem) then
  begin
    FormRelProdutosVendidos.qrdDescricao.Font.Color := clRed;
  end;
end;

procedure TFormRelProdutosVendidos.qrdCodProdutoPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.rdgTipoRelatorio.ItemIndex = 1 then
     begin
      Value := '';
     end;
strMargem := dmBaseDados.tblLogMensalValorCobranca.AsFloat*100;
strLucro  := dmBaseDados.tblLogMensalValorCheque.AsFloat*100;
FormRelProdutosVendidos.qrdCodProduto.Font.Color := clBlack;
 if (strLucro < strMargem) then
  begin
    FormRelProdutosVendidos.qrdCodProduto.Font.Color := clRed;
  end;
end;



procedure TFormRelProdutosVendidos.qrlTipoRelPrint(sender: TObject;
  var Value: String);
begin
 if frmProdutosVendidos.rdgTipoRelatorio.ItemIndex = 1 then
   begin
    Value := 'Sintético';
   end;
end;
procedure TFormRelProdutosVendidos.QRLabel6Print(sender: TObject;
  var Value: String);
begin
 if (dmBaseDados.tblLogMensalSubQtde.AsFloat<>0) then
  Value := 'Sub-Qtde: '+FloatToStr((dmBaseDados.tblLogMensalSubQtde.AsFloat))
 else
  Value := '';
end;

procedure TFormRelProdutosVendidos.QRDBText4Print(sender: TObject;
  var Value: String);
begin
   Value := 'Familia: '+(dmBaseDados.tblLogMensalFamilia.AsString)
end;

procedure TFormRelProdutosVendidos.qrlPeriodoPrint(sender: TObject;
  var Value: String);
begin
   Value := 'Período de '+DateToStr(frmProdutosVendidos.Data1.Date)+' à '+DateToStr(frmProdutosVendidos.Data2.Date);
end;

procedure TFormRelProdutosVendidos.QRLabel8Print(sender: TObject;
  var Value: String);
begin
 if frmProdutosVendidos.edtVendedor2.Text <> '000' then
  begin
   Value := 'Vendedor : '+dmBaseDados.tblLogMensalObservacao.AsString;
  end
 else
  begin
   Value := '';
  end;
end;

procedure TFormRelProdutosVendidos.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if (frmProdutosVendidos.edtVendedor2.Text <> '000') then
   begin
    Value := 'Vendedor : '+dmBaseDados.tblLogMensalObservacao.AsString
   end
  else
   begin
    Value := '';
   end;
end;

procedure TFormRelProdutosVendidos.QRDBText6Print(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
      begin
        Value := '';
      end;
strMargem := dmBaseDados.tblLogMensalValorCobranca.AsFloat*100;
strLucro  := dmBaseDados.tblLogMensalValorCheque.AsFloat*100;
FormRelProdutosVendidos.QRDBText6.Font.Color := clBlack;
 if (strLucro < strMargem) then
  begin
    FormRelProdutosVendidos.QRDBText6.Font.Color := clRed;
  end;
end;

procedure TFormRelProdutosVendidos.qrdLucroPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
      begin
        Value := '';
      end;
end;

procedure TFormRelProdutosVendidos.qrdMargemPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
      begin
        Value := '';
      end;
end;

procedure TFormRelProdutosVendidos.QRDBText1Print(sender: TObject;
  var Value: String);
begin
strMargem := dmBaseDados.tblLogMensalValorCobranca.AsFloat*100;
strLucro  := dmBaseDados.tblLogMensalValorCheque.AsFloat*100;
FormRelProdutosVendidos.QRDBText1.Font.Color := clBlack;
 if (strLucro < strMargem) then
  begin
    FormRelProdutosVendidos.QRDBText1.Font.Color := clRed;
  end;
end;

procedure TFormRelProdutosVendidos.QRLabel12Print(sender: TObject;
  var Value: String);
begin
 if (dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0) then
  Value := 'Sub-T.Custo: '+FloatToStrF((dmBaseDados.tblLogMensalDiferenca.AsFloat),ffCurrency,10,2)
 else
  Value := '';
end;

procedure TFormRelProdutosVendidos.QRExpr3Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalSubtotal.AsFloat = 0 then
  begin
    Value := '';
  end;
end;

procedure TFormRelProdutosVendidos.QRLabel16Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalSubtotal.AsFloat = 0 then
 begin
   Value := '';
 end;
end;

procedure TFormRelProdutosVendidos.QRDBText7Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalSubtotal.AsFloat = 0 then
 begin
   Value := '';
 end;
end;

procedure TFormRelProdutosVendidos.QRLabel18Print(sender: TObject;
  var Value: String);
begin
if dmBaseDados.tblLogMensalSubtotal.AsFloat = 0 then
 begin
   Value := '';
 end;
end;

procedure TFormRelProdutosVendidos.qreTCustoPrint(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
     begin
       Value := '';
     end;
end;

procedure TFormRelProdutosVendidos.QRExpr2Print(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
     begin
       Value := '';
     end;
end;

procedure TFormRelProdutosVendidos.QRExpr4Print(sender: TObject;
  var Value: String);
begin
    if frmProdutosVendidos.ckbValor.Checked = True then
     begin
       Value := '';
     end;
end;

procedure TFormRelProdutosVendidos.qrpprodutosVendidosAfterPreview(
  Sender: TObject);
begin
//   qrpprodutosVendidos.ExportToFilter(TQRAsciiExportFilter.Create('C:\produtovendido.doc'));
  // qrpprodutosVendidos.ExportToFilter(TQRAsciiExportFilter.Create('C:\produtovendido.doc'));
end;

end.
