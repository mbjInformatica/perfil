unit RelContasReceber;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables;

type
  TformRelContasReceber = class(TForm)
    rptContasReceber   : TQuickRep;
    bndCabecalho       : TQRBand;
    lblTitulo          : TQRLabel;
    lblInicio          : TQRLabel;
    sysData            : TQRSysData;
    sysPagina          : TQRSysData;
    bndColunas         : TQRBand;
    lblData            : TQRLabel;
    lblDocumento       : TQRLabel;
    lblCodigoProduto   : TQRLabel;
    lblUnidade         : TQRLabel;
    bndLogMensal       : TQRBand;
    fldCodigoProduto   : TQRDBText;
    flfDocumento       : TQRDBText;
    fldUnidade         : TQRDBText;
    bndSumario         : TQRBand;
    lblTotalItens      : TQRLabel;
    exprTotalReceber   : TQRExpr;
    exprValorTotal     : TQRExpr;
    lblCliente         : TQRLabel;
    flfCliente         : TQRDBText;
    lblMensagem        : TQRLabel;
    lblTipoRel         : TQRLabel;
    qsdLogmensal       : TQRSubDetail;
    QRLabel1           : TQRLabel;
    qreTotalDinheiro   : TQRExpr;
    qreTotalcheque     : TQRExpr;
    qrlVendedor        : TQRLabel;
    qreCobranca        : TQRExpr;
    qreTroco           : TQRExpr;
    qreCheque: TQRDBText;
    qreDinheiro: TQRDBText;
    qrlCheque: TQRLabel;
    qrlDinheiro: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel2: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    qlblmot: TQRLabel;
    qedtmot: TQRDBText;
    qeDescon: TQRExpr;
    qeBancojuros: TQRExpr;
    qeBancojurosdescon: TQRExpr;
    QRExpr9: TQRExpr;
    QRLabel5: TQRLabel;
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure rptContasReceberStartPage(Sender: TCustomQuickRep);
    procedure qreTotalDinheiroPrint(sender: TObject; var Value: String);
    procedure qreTotalchequePrint(sender: TObject; var Value: String);
    procedure qreTotalDiferencaPrint(sender: TObject; var Value: String);
    procedure exprValorTotalPrint(sender: TObject; var Value: String);
    procedure qreCobrancaPrint(sender: TObject; var Value: String);
    procedure qreTrocoPrint(sender: TObject; var Value: String);
    procedure lblObservacaoPrint(sender: TObject; var Value: String);
    procedure lblTituloPrint(sender: TObject; var Value: String);
    procedure flfDocumentoPrint(sender: TObject; var Value: String);
    procedure fldCodigoProdutoPrint(sender: TObject; var Value: String);
    procedure flfClientePrint(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure fldUnidadePrint(sender: TObject; var Value: String);
    procedure qreChequePrint(sender: TObject; var Value: String);
    procedure qreDinheiroPrint(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRExpr1Print(sender: TObject; var Value: String);
    procedure QRExpr2Print(sender: TObject; var Value: String);
    procedure QRExpr3Print(sender: TObject; var Value: String);
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure QRExpr4Print(sender: TObject; var Value: String);
    procedure QRExpr5Print(sender: TObject; var Value: String);
    procedure qeDesconPrint(sender: TObject; var Value: String);
    procedure qeBancojurosPrint(sender: TObject; var Value: String);
    procedure qeBancojurosdesconPrint(sender: TObject; var Value: String);
    procedure QRExpr9Print(sender: TObject; var Value: String);
    procedure QRExpr10Print(sender: TObject; var Value: String);
    procedure QRExpr11Print(sender: TObject; var Value: String);
    procedure QRLabel5Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelContasReceber: TformRelContasReceber;
implementation

uses ModuloDados,ContasReceber;

{$R *.DFM}

procedure TformRelContasReceber.QRLabel1Print(sender: TObject;
  var Value: String);
begin
        if (dmBaseDados.tblLogMensalSubtotal.AsFloat<>0) then
          Value := 'Sub-Total: '+FloatToStrF((dmBaseDados.tblLogMensalSubtotal.AsFloat),ffCurrency,10,2)
        else
          Value := '';
end;

procedure TformRelContasReceber.rptContasReceberStartPage(
  Sender: TCustomQuickRep);
begin
   if formContasReceber.ckbEmissao.Checked=True then
      qsdLogmensal.Enabled := False
   else
      qsdLogmensal.Enabled := True;
   {if formContasReceber.rdgSelecao.ItemIndex>0 then
        if formContasReceber.rdgSelecao.ItemIndex=1 then
                lblTitulo.Caption:='Pedidos Baixados'
        else
                lblTitulo.Caption:='Relatório Caixa Diário';}
   if formContasReceber.rdgSelecao.ItemIndex=2 then
        begin
        qrlDinheiro.Enabled       := True;
        qrlCheque.Enabled         := True;
        qreDinheiro.Enabled       := True;
        qreCheque.Enabled         := True;
        qreTotalDinheiro.Enabled  := True;
        qreTotalcheque.Enabled    := True;
        //qreTotalDiferenca.Enabled := True;
        qreTroco.Enabled          := True;
        qreCobranca.Enabled       := True;
//        qlblmot.Enabled           := False;
 //       qedtmot.Enabled           := False;
        qeBancojurosdescon.Enabled  := true;
        qeDescon.Enabled            := true;
        qeBancojuros.Enabled        := true;

        end
   else
        begin
        qrlDinheiro.Enabled       := False;
        qrlCheque.Enabled         := False;
        qreDinheiro.Enabled       := False;
        qreCheque.Enabled         := False;
        qreTotalDinheiro.Enabled  := False;
        qreTotalcheque.Enabled    := False;
        //qreTotalDiferenca.Enabled := False;
        qreTroco.Enabled          := False;
        qreCobranca.Enabled       := False;
        //qlblmot.Enabled           := True;
        //qedtmot.Enabled           := true;
        qeBancojurosdescon.Enabled  :=false;
        qeDescon.Enabled            :=false;
        qeBancojuros.Enabled        :=false;
        end;
    if formContasReceber.ckbEmissao.Checked = false then
       begin
           qlblmot.Enabled           := False;
           qedtmot.Enabled           := False;
       end
   else
       begin
           qlblmot.Enabled           := True;
           qedtmot.Enabled           := True;
       end;
   if formContasReceber.rdgSelecao.ItemIndex = 1 then
      begin
           qlblmot.Enabled           := True;
           qedtmot.Enabled           := True;
      end
   else
      begin
           qlblmot.Enabled           := False;
           qedtmot.Enabled           := False;
      end;
end;

procedure TformRelContasReceber.qreTotalDinheiroPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Dinheiro : '+Value;
end;

procedure TformRelContasReceber.qreTotalchequePrint(sender: TObject;
  var Value: String);
begin
        Value := 'Cheque : '+Value;
end;

procedure TformRelContasReceber.qreTotalDiferencaPrint(sender: TObject;
  var Value: String);
begin

        Value := 'Diferença : '+ Value ;
end;

procedure TformRelContasReceber.exprValorTotalPrint(sender: TObject;
  var Value: String);
begin
   Value := 'Total Geral dos Pedidos : '+ Value ;
     if formContasReceber.rdgTipoRelatorio.ItemIndex = 1 then
      begin
       Value := '';
      end;
end;

procedure TformRelContasReceber.qreCobrancaPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Banco : '+Value;
end;

procedure TformRelContasReceber.qreTrocoPrint(sender: TObject;
  var Value: String);
begin
        Value := 'Troco : '+Value;
end;

procedure TformRelContasReceber.lblObservacaoPrint(sender: TObject;
  var Value: String);
begin
        if formContasReceber.rdgSelecao.ItemIndex=1 then
                Value := 'Motorista'
        else
                Value := 'Observação';
end;

procedure TformRelContasReceber.lblTituloPrint(sender: TObject;
  var Value: String);
begin
        if formContasReceber.rdgSelecao.ItemIndex<1 then
                Value := 'Relatório de Contas a Receber'
        else  if formContasReceber.rdgSelecao.ItemIndex=2 then
                Value := 'Caixa Diário'
              else
                Value := 'Pedidos Baixados';

end;

procedure TformRelContasReceber.flfDocumentoPrint(sender: TObject;
  var Value: String);
begin
{ formRelContasReceber.flfDocumento.Font.Color := clBlack;
 formRelContasReceber.flfDocumento.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.flfDocumento.Font.Color := clBlue;
    formRelContasReceber.flfDocumento.Font.Style := [fsUnderline];
  end; }
end;

procedure TformRelContasReceber.fldCodigoProdutoPrint(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.fldCodigoProduto.Font.Color := clBlack;
 formRelContasReceber.fldCodigoProduto.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.fldCodigoProduto.Font.Color := clBlue;
    formRelContasReceber.fldCodigoProduto.Font.Style := [fsUnderline];
  end;   }
end;

procedure TformRelContasReceber.flfClientePrint(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.flfCliente.Font.Color := clBlack;
 formRelContasReceber.flfCliente.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.flfCliente.Font.Color := clBlue;
    formRelContasReceber.flfCliente.Font.Style := [fsUnderline];
  end;  }
end;

procedure TformRelContasReceber.QRDBText2Print(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.QRDBText2.Font.Color := clBlack;
 formRelContasReceber.QRDBText2.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.QRDBText2.Font.Color := clBlue;
    formRelContasReceber.QRDBText2.Font.Style := [fsUnderline];
  end;  }
end;

procedure TformRelContasReceber.fldUnidadePrint(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.fldUnidade.Font.Color := clBlack;
 formRelContasReceber.fldUnidade.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.fldUnidade.Font.Color := clBlue;
    formRelContasReceber.fldUnidade.Font.Style := [fsUnderline];
  end;  }
end;

procedure TformRelContasReceber.qreChequePrint(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.qreCheque.Font.Color := clBlack;
 formRelContasReceber.qreCheque.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.qreCheque.Font.Color := clBlue;
    formRelContasReceber.qreCheque.Font.Style := [fsUnderline];
  end;  }
end;

procedure TformRelContasReceber.qreDinheiroPrint(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.qreDinheiro.Font.Color := clBlack;
 formRelContasReceber.qreDinheiro.Font.Style := [];
  if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.qreDinheiro.Font.Color := clBlue;
    formRelContasReceber.qreDinheiro.Font.Style := [fsUnderline];
  end;}
end;

procedure TformRelContasReceber.QRDBText1Print(sender: TObject;
  var Value: String);
begin
 {formRelContasReceber.QRDBText1.Font.Color := clBlack;
 formRelContasReceber.QRDBText1.Font.Style := [];
 if dmBaseDados.tblLogMensalDiferenca.AsFloat <> 0 then
  begin
    formRelContasReceber.QRDBText1.Font.Color := clBlue;
    formRelContasReceber.QRDBText1.Font.Style := [fsUnderline];
  end;  }
end;

procedure TformRelContasReceber.QRExpr1Print(sender: TObject;
  var Value: String);
begin
   Value := 'Total Geral : '+ Value ;
     if formContasReceber.rdgTipoRelatorio.ItemIndex = 0 then
      begin
       Value := '';
      end;
end;

procedure TformRelContasReceber.QRExpr2Print(sender: TObject;
  var Value: String);
begin
   if formContasReceber.rdgSelecao.ItemIndex <> 2 then
    begin
      Value := '';
    end
   else
    begin
      Value := 'Restante : '+Value;
    end;
end;

procedure TformRelContasReceber.QRExpr3Print(sender: TObject;
  var Value: String);
begin
   if formContasReceber.rdgSelecao.ItemIndex <> 2 then
    begin
      Value := '';
    end
   else
    begin
      Value := 'Juros CB : '+Value;
    end;
end;

procedure TformRelContasReceber.QRLabel2Print(sender: TObject;
  var Value: String);
begin
if formContasReceber.mskVendedor.Text <> '00' then
 begin
  Value := 'Vendedor : '+formContasReceber.mskVendedor.Text;
 end
else
 begin
  Value := '';
 end;
end;

procedure TformRelContasReceber.QRExpr4Print(sender: TObject;
  var Value: String);
begin
   if formContasReceber.rdgSelecao.ItemIndex <> 2 then
    begin
      Value := '';
    end
   else
    begin
      Value := 'Juros CT : '+Value;
    end;
end;

procedure TformRelContasReceber.QRExpr5Print(sender: TObject;
  var Value: String);
begin
   Value := 'Total Geral Recebido : '+ Value ;
     if formContasReceber.rdgTipoRelatorio.ItemIndex = 1 then
      begin
       Value := '';
      end;
end;

procedure TformRelContasReceber.qeDesconPrint(sender: TObject;
  var Value: String);
begin
 if ((formContasReceber.cmbFormaPg.ItemIndex = 0) or (formContasReceber.cmbFormaPg.ItemIndex = 5)) then
      begin
        Value := 'Desconto CB :' + value;
      end
  else
    begin
      value := ' ';
    end;
end;

procedure TformRelContasReceber.qeBancojurosPrint(sender: TObject;
  var Value: String);
begin
   if ((formContasReceber.rdgSelecao.ItemIndex = 2) and (formContasReceber.cmbFormaPg.ItemIndex = 5)or(formContasReceber.cmbFormaPg.ItemIndex = 0)) then
     begin
        Value :=  'BCO + JRCB:   '+ Value;
     end
   else
     begin
        value := '';
     end;
end;

procedure TformRelContasReceber.qeBancojurosdesconPrint(sender: TObject;
  var Value: String);
begin
if ((formContasReceber.rdgSelecao.ItemIndex = 2) and (formContasReceber.cmbFormaPg.ItemIndex = 5)or(formContasReceber.cmbFormaPg.ItemIndex = 0)) then
     begin
        Value :=  'BCO JRCB - DESC:   '+ Value;
     end
   else
     begin
        value := '';
     end;
end;

procedure TformRelContasReceber.QRExpr9Print(sender: TObject;
  var Value: String);
begin
   if ((formContasReceber.cmbFormaPg.ItemIndex = 1) or (formContasReceber.cmbFormaPg.ItemIndex = 5)) then
      begin
        Value := 'Desconto CT :' + value;
      end
  else
    begin
      value := ' ';
    end;
end;

procedure TformRelContasReceber.QRExpr10Print(sender: TObject;
  var Value: String);
begin
if ((formContasReceber.rdgSelecao.ItemIndex = 2) and (formContasReceber.cmbFormaPg.ItemIndex = 5)) then
     begin
        Value :=  'BancoJurosCT - DescontoCT:'+ Value;
     end
   else
     begin
        value := '';
     end;

end;

procedure TformRelContasReceber.QRExpr11Print(sender: TObject;
  var Value: String);
begin
if ((formContasReceber.rdgSelecao.ItemIndex = 2) and (formContasReceber.cmbFormaPg.ItemIndex = 5)) then
     begin
        Value :=  'Banco + JurosCT:'+ Value;
     end
   else
     begin
        value := '';
     end;
end;

procedure TformRelContasReceber.QRLabel5Print(sender: TObject;
  var Value: String);
begin
 if ((formContasReceber.rdgSelecao.ItemIndex = 0)or(formContasReceber.ckbEmissao.Checked = False)) then
  begin
   Value := 'Total com Desconto :  '+FloatToStrF((strVDesconto),ffCurrency,10,2);
  end
 else
  begin
   Value := '';
  end;
end;

end.
