unit ContasReceber;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, TISButton,
     TIGradientCaption, TISProgressBar, TIGradient;

type
  TformContasReceber = class(TForm)
    TIGradient1: TTIGradient;
    lblVendedor: TLabel;
    Label1: TLabel;
    ckbEmissao: TCheckBox;
    rdgSelecao: TRadioGroup;
    mskVendedor: TMaskEdit;
    edtCliente: TEdit;
    rdgTipoRelatorio: TRadioGroup;
    rdgDesconto: TRadioGroup;
    pgrProcessamento: TTISProgressBar;
    TIGradientCaption1: TTIGradientCaption;
    btnOK: TTISButton;
    btnImprimir: TTISButton;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    cmbFormaPg: TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbEmissaoClick(Sender: TObject);
    procedure rdgSelecaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formContasReceber : TformContasReceber;
    strVDesconto : Double;

implementation

uses ModuloDados, RelContasReceber, DB, BaixaContasReceber, SelecCliente,
  MostraConsultaPedidoComp;


{$R *.DFM}


procedure TformContasReceber.btnOKClick(Sender: TObject);
var strdescon, strCodcli, strNumeroDoc, strCliente,
    strFormaPagamento, strObservacao, strStatus : String;
    SubTotal, strDnCh, strRestante, strTotal : Double;
    strDataE, strDataV, dtant : TDateTime;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblContasReceber.MasterFields := '';
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
strVDesconto := 0;
SubTotal     := 0;
strTotal     := 0;
strDnCh      := 0;
strRestante  := 0;
if (ckbEmissao.Checked = False) then
  Begin
   dmBaseDados.tblContasReceber.IndexName  := 'Indctrdtvenc';
   formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Vencimento';
   dmBaseDados.tblContasReceber.Filter     := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('')+')';
  End
else
  Begin
   if (rdgSelecao.ItemIndex = 1) then
    begin
     formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Emissão';
     dmBaseDados.tblContasReceber.IndexName  := 'IndDataBaixa';
     dmBaseDados.tblContasReceber.Filter     := '('+'DataBaixa >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataBaixa <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Motorista <>'+QuotedStr('000')+')';
    end;
   if (rdgSelecao.ItemIndex = 2) then
    begin
     formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Pagamento';
     dmBaseDados.tblContasReceber.IndexName  := 'IndDataPagamento';
     dmBaseDados.tblContasReceber.Filter     := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')';
    end;
   if (rdgSelecao.ItemIndex = 0) then
    begin
     formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Emissão';
     dmBaseDados.tblContasReceber.IndexName  := 'Indctrdtemis';
     dmBaseDados.tblContasReceber.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('')+')';
    end;
  End;
dmBaseDados.tblContasReceber.Filtered := True;
dtant:=dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
strStatus:=dmBaseDados.tblLogMensalCodigoMovimento.AsString; //este campo é = status do ctrec "Alpha 1"
pgrProcessamento.Max := dmBaseDados.tblContasReceber.RecordCount;
while (not dmBaseDados.tblContasReceber.Eof) do
  BEGIN
   strCodcli         := dmBaseDados.tblContasReceberCodCli.AsString;
   strDataE          := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
   strDataV          := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
   strNumeroDoc      := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
   strCliente        := dmBaseDados.tblContasReceberCliente.AsString;
   strObservacao     := dmBaseDados.tblContasReceberObservacao.AsString;
   strFormaPagamento := dmBaseDados.tblContasReceberFormaPagamento.AsString;
   strDnCh           := dmBaseDados.tblContasReceberValorCheque.AsFloat+dmBaseDados.tblContasReceberValorDinheiro.AsFloat;
   strRestante       := (dmBaseDados.tblContasReceberRestante.AsFloat*(-1));
   dmBaseDados.tblClientes.FindKey([strCodcli]);
   if ((((mskVendedor.Text = '00')  or (dmBaseDados.tblClientesCodigoVendedor1.AsString = mskVendedor.Text))
   or(dmBaseDados.tblClientesCodigoVendedor2.AsString = mskVendedor.Text))
   and((edtCliente.Text  = '0000') or (edtCliente.Text = dmBaseDados.tblContasReceberCodCli.AsString))) then
    Begin
     dmBaseDados.tblLogMensal.Append;
     if (rdgTipoRelatorio.ItemIndex <> 1) then
      begin
       dmBaseDados.tblLogMensalFamilia.AsString := dmBaseDados.tblContasReceberMotorista.AsString;
       dmBaseDados.tblLogMensalCodigoProduto.AsDateTime  := strDataE;
       dmBaseDados.tblLogMensalDataLancamento.AsDateTime := strDataV;
       dmBaseDados.tblLogMensalDescricao.AsString        := ''+dmBaseDados.tblContasReceberVendedor.AsString+'     '+FloatToStr(dmBaseDados.tblContasReceberCodCli.AsFloat)+'   '+strCliente;
       dmBaseDados.tblLogMensalDocumento.AsString        := strNumeroDoc;
       dmBaseDados.tblLogMensalDiferenca.AsFloat         := ABS(dmBaseDados.tblContasReceberDiferenca.AsFloat);
       if (rdgSelecao.ItemIndex > 0) then
        strObservacao := dmBaseDados.tblContasReceberMotorista.AsString;
       dmBaseDados.tblLogMensalObservacao.AsString     := strObservacao;
       dmBaseDados.tblLogMensalValorLancamento.AsFloat := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
       dmBaseDados.tblLogMensalValorCheque.AsFloat     := dmBaseDados.tblContasReceberValorCheque.AsCurrency;
       dmBaseDados.tblLogMensalValorDinheiro.AsFloat   := dmBaseDados.tblContasReceberValorDinheiro.AsFloat;
       if( (dmBaseDados.tblContasReceberValorCheque.AsFloat = 0)and(dmBaseDados.tblContasReceberValorDinheiro.AsFloat = 0) )then
        begin
         dmBaseDados.tblLogMensalValorCobranca.AsFloat := (dmBaseDados.tblContasReceberValorDocumento.AsFloat);
        end;
       dmBaseDados.tblLogMensalUnidadeMedida.AsString  := strFormaPagamento;
       dmBaseDados.tblLogMensalTroco.AsFloat           := dmBaseDados.tblContasReceberTroco.AsFloat;
       dmBaseDados.tblLogMensalSubQtde.AsFloat         := (dmBaseDados.tblContasReceberRestante.AsFloat*(-1));
       dmBaseDados.tblLogMensalSubPeso.AsFloat         := dmBaseDados.tblContasReceberJuros.AsFloat;
       if (dmBaseDados.tblContasReceberFormaPagamento.AsString = 'CT -') then
        begin
         dmBaseDados.tblLogMensalDesconCT.AsFloat := dmBaseDados.tblContasReceberDescontoCT.AsFloat;
        end
       else
        begin
         dmBaseDados.tblLogMensalDescon.AsFloat  := dmBaseDados.tblContasReceberValorDesc.AsFloat;
        end;
       dmBaseDados.tblLogMensalQuantidade.AsFloat := dmBaseDados.tblContasReceberJurosCT.AsFloat;
       dmBaseDados.tblLogMensal.Post;
       //end;
      end;// *** end do 2º IF -->((rdgTipoRelatorio.ItemIndex <> 1)) then
     SubTotal := SubTotal+dmBaseDados.tblContasReceberValorDocumento.AsFloat;
    End;// *** end do 1º IF -->((((mskVendedor.Text = '00')  or (dmBaseDados.tblClientesCodigoVendedor1.AsString = mskVendedor.Text))...***
   dmBaseDados.tblContasReceber.Next;
   if( (dtAnt <> dmBaseDados.tblContasReceberDataVencimento.AsDateTime)or(dmBaseDados.tblContasReceber.Eof) )then
    begin
     dmBaseDados.tblLogMensal.Edit;
     dmBaseDados.tblLogMensalSubtotal.AsFloat := SubTotal;
     dmBaseDados.tblLogMensalObservacao.AsDateTime := strDataV;
     dmBaseDados.tblLogMensal.Post;
     SubTotal := 0;
     dtant    := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
    end;
   pgrProcessamento.Position := pgrProcessamento.Position+1;
  END; // *** end do WHILE ***
dmBaseDados.tblLogMensal.First;
formRelContasReceber.lblInicio.Caption := 'Período de '+DateToStr(Data1.Date)+' à '+DateToStr(Data2.Date);
if( (rdgSelecao.ItemIndex = 2)and(cmbFormaPg.ItemIndex <> 5) )then
 Begin
  if (cmbFormaPg.ItemIndex = 0) then
   begin
    dmBaseDados.tblLogMensal.Filter   := '('+'UnidadeMedida ='+ QuotedStr('CB')+')';
    dmBaseDados.tblLogMensal.Filtered := true;
   end;
  if (cmbFormaPg.ItemIndex = 1) then
   begin
    dmBaseDados.tblLogMensal.Filter   := '('+'UnidadeMedida ='+ QuotedStr('CT')+')';
    dmBaseDados.tblLogMensal.Filtered := true;
   end;
  if (cmbFormaPg.ItemIndex = 2) then
   begin
    dmBaseDados.tblLogMensal.Filter   := '('+'UnidadeMedida ='+ QuotedStr('CD')+')';
    dmBaseDados.tblLogMensal.Filtered := true;
   end;
  if (cmbFormaPg.ItemIndex = 3) then
   begin
    dmBaseDados.tblLogMensal.Filter   := '('+'UnidadeMedida ='+ QuotedStr('CH')+')';
    dmBaseDados.tblLogMensal.Filtered := true;
   end;
  if (cmbFormaPg.ItemIndex = 4) then
   begin
    dmBaseDados.tblLogMensal.Filter   := '('+'UnidadeMedida ='+ QuotedStr('DH')+')';
    dmBaseDados.tblLogMensal.Filtered := true;
   end;
 End;
dmBaseDados.tblLogMensal.First;
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
  strTotal := strTotal + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
  dmBaseDados.tblLogMensal.Next;
 end;
if (rdgDesconto.ItemIndex = 0) then
 begin
  strVDesconto := strTotal;
 end;
if (rdgDesconto.ItemIndex = 1) then
 begin
  strVDesconto := (strTotal-(strTotal * 0.05)) ;
 end;
if (rdgDesconto.ItemIndex = 2) then
 begin
  strVDesconto := (strTotal-(strTotal * 0.10)) ;
 end;
if (rdgDesconto.ItemIndex = 3) then
 begin
  strVDesconto := (strTotal-(strTotal * 0.16)) ;
 end;
formRelContasReceber.rptContasReceber.Preview;
formRelContasReceber.lblTipoRel.Caption := '';
formMostraConsultaPedidoComp.ShowModal;
dmBaseDados.tblLogMensal.Filter := '';
dmBaseDados.tblLogMensal.Filtered := false;
dmBaseDados.tblLogMensal.Close;
if (rdgSelecao.ItemIndex = 2) then
 begin
  dmBaseDados.tblContasReceber.Filter       := '';
  dmBaseDados.tblContasReceber.Filtered     := False;
  dmBaseDados.tblContasReceber.IndexName    := '';
  dmBaseDados.tblContasReceber.MasterFields := 'CodigoCliente';
  dmBaseDados.tblContasReceber.Close;
  dmBaseDados.tblClientes.IndexName := '';
  dmBaseDados.tblClientes.Close;
 end
else
 begin
  formBaixaContasReceber.ShowModal;
 end;
end;

procedure TformContasReceber.FormShow(Sender: TObject);
begin
rdgTipoRelatorio.ItemIndex := 0;
rdgDesconto.ItemIndex      := 0 ;
Screen.Cursor              := CrHourGlass;
Data1.Date                 := Date;
Data2.Date                 := Date;
Screen.Cursor              := CrDefault;
mskVendedor.Text           := '00';
edtCliente.Text            := '0000';
pgrProcessamento.Position  := 0;
ckbEmissao.Checked         := False;
rdgSelecao.ItemIndex       := 0;
rdgSelecao.Enabled         := False;
cmbFormaPg.ItemIndex       := 5;
strVDesconto               := 0;
Data1.SetFocus;
end;

procedure TformContasReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Close;
end;

procedure TformContasReceber.ckbEmissaoClick(Sender: TObject);
begin
if (ckbEmissao.Checked = True) Then
 begin
  rdgSelecao.Enabled       := True;
  rdgTipoRelatorio.Enabled := False;
 end
else
 begin
  rdgSelecao.Enabled       := False;
  rdgTipoRelatorio.Enabled := True;
 end;
end;

procedure TformContasReceber.rdgSelecaoClick(Sender: TObject);
begin
if (rdgSelecao.ItemIndex = 2) then
 begin
  cmbFormaPg.Enabled := true;
 end
else
 begin
  cmbFormaPg.Enabled := false;
 end;
end;

procedure TformContasReceber.btnImprimirClick(Sender: TObject);
begin
Close;
end;

procedure TformContasReceber.edtClienteClick(Sender: TObject);
begin
formSelecCliente.ShowModal;
edtCliente.Text := IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
edtCliente.SetFocus;
dmBaseDados.tblClientes.Close;
end;

end.
