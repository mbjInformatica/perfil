{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
unit NotaFiscal;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls,
     Forms, Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids,
     DB, TISButton, TIGradient, DBCtrls, ExtCtrls, OleCtrls,
     SHDocVw, IniFiles, ShellAPI, MidasLib, Math, TILabel, TISLABELS,

     ACBrNFe, pcnConversao, ACBrUtil, ACBrNFeDANFEClass, ACBrNFeDANFeESCPOS,
     ACBrBase, ACBrDFe, XMLIntf, XMLDoc, zlib, ACBrMail, ACBrNFeDANFeRLClass,
     strutils, TypInfo, DateUtils, {ufrmStatus} synacode, 
     pcnConversaoNFe, ACBrDFeConfiguracoes, pcnAuxiliar, ACBrDFeSSL, pcnNFeRTXT,
     RLConsts, Variants, TISImagePanel, TISGroupBox, TISRadioGroup, blcksock,
     ACBrDFeReport, ACBrDFeDANFeReport, ACBrDFe.Conversao, ACBrNFe.Classes;


type
  TFrmEmissaoNF = class(TForm)
    lblNumeroPedido : TLabel;
    mskNPedido      : TMaskEdit;
    lblNrNF         : TLabel;
    mskNrNotaFiscal : TMaskEdit;
    cmbCfop         : TComboBox;
    lblCfop         : TLabel;
    lblcodprocalc   : TLabel;
    edtPlaca: TEdit;
    lblTransportadora: TLabel;
    lblPlaca: TLabel;
    lblObs: TLabel;
    edtObs: TEdit;
    edtMotivo: TEdit;
    lblMotivo: TLabel;
    edtnomerg: TEdit;
    lblnomerg: TLabel;
    ckbAVista: TTISCheckBox;
    ckbPrazo: TTISCheckBox;
    TIGradient1: TTIGradient;
    Label1: TLabel;
    edtObsComp: TEdit;
    lblNomeTrans: TLabel;
    edtNomeTrans: TEdit;
    edtCNPJTrans: TEdit;
    lblCNPJ: TLabel;
    edtInscTrans: TEdit;
    lblIE: TLabel;
    lblEnd: TLabel;
    edtEndTrans: TEdit;
    lblUF: TLabel;
    edtEstadoTrans: TEdit;
    lblCidade: TLabel;
    edtCidadeTrans: TEdit;
    edtPlacaUF: TEdit;
    lblPlacaUF: TLabel;
    cmbTransportadora: TDBLookupComboBox;
    Label8: TLabel;
    rdgMesmo: TTISRadioButton;
    rdgTrans: TTISRadioButton;
    rdgTipoOperacao: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtPesoBruto: TEdit;
    edtPesoLiq: TEdit;
    Label6: TLabel;
    mskDataES: TMaskEdit;
    mskHoraES: TMaskEdit;
    Label7: TLabel;
    ACBrMail1: TACBrMail;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFe1: TACBrNFe;
    Label10: TLabel;
    Label11: TLabel;
    edtVolume: TEdit;
    edtEspecie: TEdit;
    btnGrava: TTISButton;
    btnImprime: TTISButton;
    btnRetornar: TTISButton;
    mmEmailMsg: TMemo;
    Label5: TLabel;
    edtAliquota: TEdit;
    Label9: TLabel;
    edtDespAc: TEdit;
    lblFrete: TLabel;
    edtFrete: TEdit;
    Label12: TLabel;
    edtDesconto: TEdit;
    Label13: TLabel;
    edtNPedCompra: TEdit;
    rdgFrete: TTISRadioGroup;
    lblChave: TLabel;
    edtChaveFornec: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskNrNotaFiscalExit(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure ckbAVistaClick(Sender: TObject);
    procedure ckbPrazoClick(Sender: TObject);
    procedure mskNPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTransportadoraClick(Sender: TObject);
    procedure rdgTransClick(Sender: TObject);
    procedure rdgMesmoClick(Sender: TObject);
    procedure edtPesoBrutoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesoLiqKeyPress(Sender: TObject; var Key: Char);
    procedure mskNPedidoExit(Sender: TObject);
    procedure edtDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure edtDespAcKeyPress(Sender: TObject; var Key: Char);
    procedure cmbCfopClick(Sender: TObject);
    procedure edtChaveFornecKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FrmEmissaoNF : TFrmEmissaoNF;
    strCPF, strCNPJ, strCfopMudou,
    strDoc1, strDoc2, strDoc3, strDoc4,
    strDoc5, strDoc6, strDoc7, strDoc8,
    strVenc1, strVenc2, strVenc3, strVenc4,
    strVenc5, strVenc6, strVenc7, strVenc8,
    strValor1, strValor2, strValor3, strValor4,
    strValor5, strValor6, strValor7, strValor8,
    sDataEmissao, sHoraEmissao, ChaveAcesso, strCliFinal, formaPgto : String;
    strCont000, strCont070, intContador, NrNf, intParcelas : Integer;
    strCont, fltR12, fltR18,  strSomaIPI,
    Item000, Item030, PercIcms, strSTIVA, strVolume,
    strFrete, strDespAC, strDescon, fltVParcela, PercDesc : Double;
    NFeRTXT : TNFeRTXT;
    ArqINI : String;
    INI : TIniFile;


implementation

uses ModuloDados, RelNotaFiscal, RotinasGerais,
     AlteraValor, MenuPrincipal, SeekCliNFe, PgtoNFe, pcnProcNFe;


{$R *.DFM}


procedure TFrmEmissaoNF.FormShow(Sender: TObject);
begin
//--
ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;
INI    := TIniFile.Create(ArqINI);
//-- Abrindo ACBrNFe
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.VersaoQrCode  := veqr200;
ACBrNFe1.Configuracoes.Geral.IdCSC         := INI.ReadString('Certificado','IDCSC','');
ACBrNFe1.Configuracoes.Geral.CSC           := INI.ReadString('Certificado','CSC','');
ACBrNFe1.Configuracoes.Certificados.NumeroSerie := INI.ReadString('Certificado','CHAVE','');
ACBrNFe1.Configuracoes.Certificados.Senha       := INI.ReadString('Certificado','SENHA','');
//--
formaPgto   := '01';
ChaveAcesso := '';
strCliFinal := '';
intParcelas := 1;
fltVParcela := 0;
PercDesc    := 0;
edtFrete.Clear;
edtDespAc.Clear;
edtDesconto.Clear;
edtNPedCompra.Clear;
sDataEmissao   := DateToStr(Date);
sHoraEmissao   := TimeToStr(Time);
mskDataES.Text := DateToStr(Date);
mskHoraES.Text := TimeToStr(Time);
rdgTipoOperacao.ItemIndex := 0;
lblTransportadora.Visible := False;
lblNomeTrans.Visible   := False;
lblCNPJ.Visible        := False;
lblIE.Visible          := False;
lblEnd.Visible         := False;
lblCidade.Visible      := False;
lblUF.Visible          := False;
lblPlaca.Visible       := False;
lblPlacaUF.Visible     := False;
cmbTransportadora.Visible := False;
edtNomeTrans.Visible   := False;
edtCNPJTrans.Visible   := False;
edtInscTrans.Visible   := False;
edtEndTrans.Visible    := False;
edtCidadeTrans.Visible := False;
edtEstadoTrans.Visible := False;
edtPlaca.Visible       := False;
edtPlacaUF.Visible     := False;
lblChave.Visible       := False;
edtChaveFornec.Visible := False;
edtObsComp.Clear;                
ckbAVista.Checked := True;
ckbPrazo.Checked  := False;
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblANotaFiscal.Open;
dmBaseDados.tblTransportadora.Open;
dmBaseDados.tblANotaFiscal.Last;
if (stsNotaE = '1') then
 begin
  mskNrNotaFiscal.Text := IntToStr(dmBaseDados.tblANotaFiscalNrNF.AsInteger + 1);
  dmBaseDados.tblANotaFiscal.Append;
  dmBaseDados.tblANotaFiscalNrNF.AsInteger := StrToInt(mskNrNotaFiscal.Text);
  dmBaseDados.tblANotaFiscal.Post;
  mskNrNotaFiscal.ReadOnly := True;
  mskNrNotaFiscal.Enabled  := False;
 end
else
 begin
  mskNrNotaFiscal.Text := IntToStr(dmBaseDados.tblANotaFiscalNrNF.AsInteger + 1);
  mskNrNotaFiscal.ReadOnly := False;
  mskNrNotaFiscal.Enabled  := True;
  mskNrNotaFiscal.SetFocus;
 end;
mskNPedido.Clear;
edtPesoLiq.Clear;
edtPesoBruto.Clear;
cmbCfop.ItemIndex       := 0;
btnGrava.Enabled        := False;
btnImprime.Enabled      := False;
mskNPedido.Enabled      := True;
mskNrNotaFiscal.Enabled := True;
cmbCfop.Enabled         := True;
edtPlaca.Text           := '';
edtMotivo.Text          := '';
edtObs.Text             := '';
edtnomerg.Text          := '';
edtObs.Visible          := False;
lblObs.Visible          := False;
lblPlaca.Visible        := False;
lblMotivo.Visible       := False;
edtMotivo.Visible       := False;
lblnomerg.Visible       := False;
edtnomerg.Visible       := False;
rdgMesmo.Checked        := True;
rdgFrete.ItemIndex      := 0;
NrNf := StrToInt(mskNrNotaFiscal.Text);

ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
if (stsNotaE = '1') then
 begin
  mskNPedido.SetFocus;
 end
else
 begin
  ShowMessage('Digite o número de nota que deseja emitir!');
  mskNrNotaFiscal.SetFocus;
 end;
end;

procedure TFrmEmissaoNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
stsNotaE := '';
dmBaseDados.tblANotaFiscal.Filter      := '';
dmBaseDados.tblANotaFiscal.Filtered    := False;
dmBaseDados.tblContasReceber.Filter    := '';
dmBaseDados.tblContasReceber.Filtered  := False;
dmBaseDados.tblPedidos.Filter          := '';
dmBaseDados.tblPedidos.Filtered        := False;
dmBaseDados.tblPedidos.IndexName       := '';
dmBaseDados.tblClientes.IndexName      := '';
dmBaseDados.tblANotaFiscal.IndexName   := '';
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblContasReceber.MasterFields := 'CodigoCliente';
dmBaseDados.tblFCP.Close;
dmBaseDados.tblSaida.Close;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblProdutos.Close;
dmBaseDados.tblAliquotas.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblANotaFiscal.Close;
dmBaseDados.tblContasReceber.Close;
end;

procedure TFrmEmissaoNF.mskNrNotaFiscalExit(Sender: TObject);
var strNrN : Integer;
    msgConfirma : String;
begin
strNrN := StrToInt(mskNrNotaFiscal.Text);
if( (stsNotaE = '0')and((strNrN = NrNf)or(strNrN > NrNf)) )then
 begin
  Application.MessageBox('Número de Nota Fiscal inválido!','A T E N Ç Ã O!!',MB_ICONERROR);
  mskNrNotaFiscal.SetFocus;
  Close;
 end;
dmBaseDados.tblANotaFiscal.First;
if (dmBaseDados.tblANotaFiscal.FindKey([mskNrNotaFiscal.Text])) then
 BEGIN
  If( (dmBaseDados.tblANotaFiscalStatus.AsInteger = 100)or(dmBaseDados.tblANotaFiscalCancelada.AsString = 'S')
   or (dmBaseDados.tblANotaFiscalStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalStatus.AsInteger = 110) )then
   Begin
    if (dmBaseDados.tblANotaFiscalStatus.AsString = '100') then
     begin
      Application.MessageBox('Número de Nota Fiscal já AUTORIZADA!','A T E N Ç Ã O!!',MB_ICONERROR);
     end;
    if (dmBaseDados.tblANotaFiscalCancelada.AsString = 'S') then
     begin
      Application.MessageBox('Número de Nota Fiscal está CANCELADA!','A T E N Ç Ã O!!',MB_ICONERROR);
     end;
    if( (dmBaseDados.tblANotaFiscalStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalStatus.AsInteger = 110) )then
     begin
      Application.MessageBox('Número de Nota Fiscal está DENEGADA!','A T E N Ç Ã O!!',MB_ICONERROR);
     end;
    mskNrNotaFiscal.SetFocus;
    Close;
   End
  Else
   Begin
    msgConfirma := 'Deseja voltar a NF-e Nº " ' +mskNrNotaFiscal.Text+ ' " ?';
    if (Application.MessageBox(pChar(msgConfirma),'C O N F I R M A?',MB_YESNO) = IDYES) then
     begin
      dmBaseDados.tblANotaFiscal.Edit;
      dmBaseDados.tblANotaFiscal.Delete;
     end
    else
     begin
      mskNrNotaFiscal.SetFocus;
     end;
   End;
 END;
end;

procedure TFrmEmissaoNF.mskNPedidoExit(Sender: TObject);
var str0NPed, strCdCli, msgConfirma, msgDesAc : String;
    fltVTot : Double;
begin
dmBaseDados.tblANotaFiscal.IndexName := 'IndPedidoNF';
if( (mskNPedido.Text <> '') )then
  BEGIN
   btnGrava.Enabled := True;
   dmBaseDados.tblPedidos.IndexName := 'IndNroPedido';
   If (not dmBaseDados.tblPedidos.FindKey([mskNPedido.Text])) then
    BEGIN
     Application.MessageBox('Pedido não encontrado! Favor Verificar!','ATENÇÃO!',MB_ICONINFORMATION);
     dmBaseDados.tblANotaFiscal.IndexName := '';
     mskNPedido.SetFocus;
     Abort;
    END
   Else
    BEGIN
     msgDesAc := '';
     if (dmBaseDados.tblPedidosDesconto.AsFloat > 0) then
      begin
       edtDesconto.Text := FormatFloat('0.00',dmBaseDados.tblPedidosDesconto.AsFloat);
       msgDesAc         := 'Desconto:  R$ ' + edtDesconto.Text;
      end;
     if (dmBaseDados.tblPedidosDesconto.AsFloat < 0) then
      begin
       edtDespAc.Text := FormatFloat('0.00',dmBaseDados.tblPedidosDesconto.AsFloat*-1);
       msgDesAc       := 'Acréscimo:  R$ ' + edtDespAc.Text;
      end;
     If (dmBaseDados.tblPedidosStatus.AsString = '4') then
      Begin
       strCdCli := dmBaseDados.tblPedidosCodigoCliente.AsString;
       dmBaseDados.tblClientes.First;
       dmBaseDados.tblClientes.Locate('CodigoCliente',strCdCli,[loCaseInsensitive]);
       fltVTot := 0;
       while( (dmBaseDados.tblPedidosNPedido.AsString = mskNPedido.Text)and(not dmBaseDados.tblPedidos.Eof) ) do
        begin
         fltVTot := fltVTot + dmBaseDados.tblPedidosTotal.AsFloat;
         dmBaseDados.tblPedidos.Next;
        end;
       msgConfirma := 'Nº do Pedido:  " ' + mskNPedido.Text + ' "  |  Cliente:  " ' + strCdCli + ' ' + dmBaseDados.tblClientesNomeCliente.AsString + ' "  |  Valor do Pedido:  " ' + FormatFloat('R$ 0.00', fltVTot) + ' " '; // + #13 +msgDesAc;
       if (dmBaseDados.tblClientesNomeCliente.AsString = 'CONSUMIDOR FINAL') then
        begin
         formSeekCliNFe.ShowModal;
         strCliFinal := dmBaseDados.tblClientesCodigoCliente.AsString;
         msgConfirma := 'Nº do Pedido:  " ' + mskNPedido.Text + ' "  |  Cliente:  " ' + strCliFinal + ' ' + dmBaseDados.tblClientesNomeCliente.AsString + ' "  |  Valor do Pedido:  " ' + FormatFloat('R$ 0.00', fltVTot) + ' " '; // + #13 +msgDesAc;
        end;
       Application.MessageBox(pChar(msgConfirma),'CONFIRA O PEDIDO!',MB_ICONINFORMATION);
      End
     Else   // Quando for orçamento, ou baixa de pindura, para somar o valor do pedido.
      Begin
       fltVTot := 0;
       while( (dmBaseDados.tblPedidosNPedido.AsString = mskNPedido.Text)and(not dmBaseDados.tblPedidos.Eof) ) do
        begin
         fltVTot := fltVTot + dmBaseDados.tblPedidosTotal.AsFloat;
         dmBaseDados.tblPedidos.Next;
        end;
       dmBaseDados.tblPedidos.FindKey([mskNPedido.Text]);
       strCdCli := dmBaseDados.tblPedidosCodigoCliente.AsString;
       dmBaseDados.tblClientes.First;
       dmBaseDados.tblClientes.Locate('CodigoCliente',strCdCli,[loCaseInsensitive]);
       msgConfirma := 'Nº do Pedido:  " ' + mskNPedido.Text + ' "  |  Cliente:  " ' + strCdCli + ' ' + dmBaseDados.tblClientesNomeCliente.AsString + ' "  |  Valor do Pedido:  " ' + FormatFloat('R$ 0.00', fltVTot) + ' " '; // + #13 +msgDesAc;
       if (dmBaseDados.tblClientesNomeCliente.AsString = 'CONSUMIDOR FINAL') then
        begin
         formSeekCliNFe.ShowModal;                  
         strCliFinal := dmBaseDados.tblClientesCodigoCliente.AsString;
         msgConfirma := 'Nº do Pedido:  " ' + mskNPedido.Text + ' "  |  Cliente:  " ' + strCliFinal + ' ' + dmBaseDados.tblClientesNomeCliente.AsString + ' "  |  Valor do Pedido:  " ' + FormatFloat('R$ 0.00', fltVTot) + ' " '; // + #13 +msgDesAc;
        end;
       Application.MessageBox(pChar(msgConfirma),'CONFIRA O PEDIDO!',MB_ICONINFORMATION);
      End; // End do Status = '4'
    END;
  END
else
  BEGIN
   mskNPedido.SetFocus;
  END;
//---------------------
if (dmBaseDados.tblANotaFiscal.Locate('Pedido',mskNPedido.Text,[loCaseInsensitive]) = True) then
  begin
   if (dmBaseDados.tblANotaFiscalStatus.AsString = '100') then
    begin
     Application.MessageBox('Pedido com Nota Fiscal já AUTORIZADA!','A T E N Ç Ã O!!',MB_ICONERROR);
     mskNPedido.SetFocus;
     Close;
    end;
  end;
edtObsComp.Text := 'Nº do Pedido: ' + mskNPedido.Text;
dmBaseDados.tblANotaFiscal.IndexName := '';
end;

procedure TFrmEmissaoNF.btnGravaClick(Sender: TObject);
var strCPF1, strCPF2, strCPF3, strCPF4, strNrNF, strColuna2,
    strColuna3, strCNPJ1, strCNPJ2, strCNPJ3, strCNPJ4, strCNPJ5,
    strINSC, strINSC1, strINSC2, strINSC3, strINSC4, strEspecie,
    strSerie, strObsLivre, strInscrEstadual, strRazaoSocial,
    strUf, strCodFamilia, strCodCategoria, strCodProduto, strVendedor,
    strComp1, strComp2, Natureza, NumeroNF, Dat, ClienteDest,
    EnderecoDest, NumeroDest, ComplDest, BairroDest, CodigoIBGE,
    CidadeDest, EstadoDest, chCodUF, chData, chAnoMes, chCNPJ,
    chModelo, chSerie, chNrNFe, chFormaEmissao, chCodNumerico, strTPgto : String;
    strSTCustoT,strSTIcms12, strSTBase, strSTIcms, strSTIcmsCli,
    strSTTotalIcms, strSomaBaseST, strSomaIcmsST, strBase060,
    strIcms060, strSTIcmsInt, fltIcms, fltBaseICMS, fltValorICMS,
    fltReducao, fltBase7, fltBase12, fltBase18, fltBase25, fltVCont00,
    fltTotal, fltVCont0, fltVCont7, fltVCont12, fltVCont18, fltVCont25,
    fltIcms7, fltIcms12, fltIcms18, fltIcms25, fltAliqIcms, fltImpostoIcms,
    fltIsentoIcms, fltOutrasIcms, fltIcmsNaFonte, fltIcmsR12, fltIcmsR18,
    fltBaseR12, fltBaseR18, fltIsentoPis, fltCodContabil, fltIsento12,
    fltIsentoR18, fltIsento7, fltIsento25, fltIsento18, fltOutras12,
    fltOutrasR18, fltOutras7, fltOutras25, fltOutras18, fltDataIntegracao,
    fltDesconto, fltValorVista, fltValorPrazo, fltContribuinte, fltTipoNota,
    fltCgc, fltContaCtblFornecedor, fltNrMunicipio,fltDMEmissao, strProdBase,
    strProdICMS, strProdBaseST, strProdIcmsST, strPercReducao, strIPI,
    strTotalTrib, strTribFeder, strTribEstad, strTribMunic : Double;
    dtdDataVencimento : TDateTime;
    CodigoNumerico : Integer;
    ArquivoNFe : TextFile;
begin
if( ((edtPesoBruto.Text <> '')and(edtPesoLiq.Text = ''))
  or((edtPesoBruto.Text  = '')and(edtPesoLiq.Text <> '')))then
 begin
  ShowMessage('Campos obrigatórios! Favor preencher os dois campos de peso!');
  Abort;
 end;
if( (edtChaveFornec.Text = '')and((Copy(cmbCfop.Text,1,5) = '1.202')or(Copy(cmbCfop.Text,1,5) = '5.202')or(Copy(cmbCfop.Text,1,5) = '6.202')) )then
 begin
  ShowMessage('Campo obrigatório! Favor preencher a chave de acesso!');
  Abort;
 end;
strDespAC              := 0;
strDescon              := 0;
strFrete               := 0;
strCont                := 0;
strCont000             := 0;
strCont070             := 0;
fltR12                 := 0;
fltR18                 := 0;
fltIcms                := 0;
fltBaseICMS            := 0;
fltValorICMS           := 0;
fltReducao             := 0;
fltBase7               := 0;
fltBase12              := 0;
fltBase18              := 0;
fltBase25              := 0;
fltVcont0              := 0;
fltVCont7              := 0;
fltVCont12             := 0;
fltVCont18             := 0;
fltVCont00             := 0;
fltVCont25             := 0;
fltIcms7               := 0;
fltIcms12              := 0;
fltIcms18              := 0;
fltIcms25              := 0;
fltIcmsR12             := 0;
fltIcmsR18             := 0;
fltBaseR12             := 0;     
fltBaseR18             := 0;
fltValorIcms           := 0;
fltBaseIcms            := 0;
fltAliqIcms            := 0;
fltImpostoIcms         := 0;
fltIsentoIcms          := 0;
fltOutrasIcms          := 0;
fltIcmsNaFonte         := 0;
fltDataIntegracao      := 0;
fltDesconto            := 0;
fltValorVista          := 0;
fltValorPrazo          := 0;
fltContribuinte        := 0;
fltTipoNota            := 0;
fltCgc                 := 0;
fltContaCtblFornecedor := 0;
fltNrMunicipio         := 0;
fltIsento12            := 0;
fltIsentoR18           := 0;
fltIsento7             := 0;
fltIsento25            := 0;
fltIsento18            := 0;
fltOutras12            := 0;
fltOutrasR18           := 0;
fltOutras7             := 0;
fltOutras25            := 0;
fltOutras18            := 0;
fltDMEmissao           := 0;
strSTIVA               := 0;
strSTCustoT            := 0;
strSTIcms12            := 0;
strSTBase              := 0;
strSTIcmsCli           := 0;
strSTIcms              := 0;
strSTIcmsInt           := 0;
strSomaBaseST          := 0;
strSomaIcmsST          := 0;
strIPI                 := 0;
strSomaIPI             := 0;
strVenc1               := '';
strVenc2               := '';
strVenc3               := '';
strVenc4               := '';
strVenc5               := '';
strVenc6               := '';
strVenc7               := '';
strVenc8               := '';
strDoc1                := '';
strDoc2                := '';
strDoc3                := '';
strDoc4                := '';
strDoc5                := '';
strDoc6                := '';
strDoc7                := '';
strDoc8                := '';
strValor1              := '0';
strValor2              := '0';
strValor3              := '0';
strValor4              := '0';
strValor5              := '0';
strValor6              := '0';
strValor7              := '0';
strValor8              := '0';
intContador            := 0;
Item000                := 0;
strTotalTrib           := 0;
strTribFeder           := 0;
strTribEstad           := 0;
strTribMunic           := 0;
if (edtAliquota.Text <> '') then
 begin
  PercIcms := StrToFloat(edtAliquota.Text);
 end;
if (edtDespAc.Text <> '') then
 begin
  strDespAC := StrToFloat(edtDespAc.Text);
  strDespAC := Arredondar(strDespAC,2)
 end;
if (edtDesconto.Text <> '') then                         
 begin
  strDescon := StrToFloat(edtDesconto.Text);
  strDescon := Arredondar(strDescon,2);
 end;
if (edtFrete.Text <> '') then
 begin
  strFrete := StrToFloat(edtFrete.Text);
  strFrete := Arredondar(strFrete,2);
 end;
dmBaseDados.tblSaida.Close;
dmBaseDados.tblPedidos.IndexName  := 'IndNroPedido';
if (dmBaseDados.tblPedidos.FindKey([mskNPedido.Text])= False) then
 begin
  ShowMessage('Pedido não encontrado!');
  Abort;
 end
else
dmBaseDados.tblSaida.EmptyTable;             
dmBaseDados.tblSaida.Open;
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
if (strCliFinal = '') then
 begin
  dmBaseDados.tblClientes.FindKey([dmBaseDados.tblPedidosCodigoCliente.AsInteger]);
 end
else
 begin
  dmBaseDados.tblClientes.FindKey([strCliFinal]);
 end;
dmBaseDados.tblContasReceber.MasterFields := '';
dmBaseDados.tblContasReceber.First;                 
while( (dmBaseDados.tblPedidosNPedido.AsString = mskNPedido.Text)and(not dmBaseDados.tblPedidos.Eof) )do
 begin
  strTPgto := Copy(dmBaseDados.tblPedidosPagamento.AsString,1,2);
  dmBasedados.tblSaida.Append;
  dmBaseDados.tblSaidaNumeroRequisicao.AsString := dmBaseDados.tblPedidosNPedido.AsString;
  dmBaseDados.tblSaidaDataLancamento.AsDateTime := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
  dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
  dmBaseDados.tblSaidaUnidade.AsString          := dmBaseDados.tblPedidosUnidade.AsString;
  dmBaseDados.tblSaidaQtdeCx.AsFloat            := dmBaseDados.tblPedidosICMS.AsFloat;
  dmBaseDados.tblSaidaDataVencimento.AsDateTime := dmBaseDados.tblPedidosVencimento.AsDateTime;
  dmBaseDados.tblSaidaCodVen.AsFloat            := dmBaseDados.tblPedidosCodigoVendedor.AsFloat;
  dmBaseDados.tblSaidaVendedor.AsString         := dmBaseDados.tblPedidosVendedor.AsString;
  dmBaseDados.tblSaidaCodigoProduto.AsString    := dmBaseDados.tblPedidosProduto.AsString;
  dmBaseDados.tblSaidaRefFabricante.AsString    := dmBaseDados.tblPedidosCodigoReferencia.AsString;
  dmBaseDados.tblSaidaDescricaoProduto.AsString := dmBaseDados.tblPedidosDescricao.AsString;
  dmBaseDados.tblSaidaQuantidade.AsFloat        := dmBaseDados.tblPedidosQuantidade.AsFloat;
  dmBaseDados.tblSaidaValorUnitario.AsFloat     := dmBaseDados.tblPedidosUnitario.AsFloat;
  dmBaseDados.tblSaidaValorTotal.AsFloat        := dmBaseDados.tblPedidosTotal.AsFloat;
  dmBaseDados.tblSaidaValorUnitario.AsFloat     := dmBaseDados.tblPedidosUnitario.AsFloat;
  dmBaseDados.tblSaidaCondPg.AsString           := dmBaseDados.tblPedidosPagamento.AsString;
  dmBaseDados.tblSaidaPeso.AsFloat              := dmBaseDados.tblPedidosPeso.AsFloat;
  dmBaseDados.tblSaidaDataVencimento.AsString   := dmBaseDados.tblPedidosVencimento.AsString;
  dmBaseDados.tblSaidaDesconto.AsFloat          := dmBaseDados.tblPedidosDesconto.AsFloat;
  dmBaseDados.tblSaidaComissao.AsFloat          := dmBaseDados.tblPedidosComissao.AsFloat;
  dmBaseDados.tblSaida.Post;
  dmBaseDados.tblPedidos.Next;
 end;                                                         
dmBaseDados.tblPedidos.FindKey([mskNPedido.Text]);
//Gerando o Contas a Receber...:
{dmBaseDados.tblContasReceber.First;
if (dmBaseDados.tblContasReceber.Locate('NumeroDocumento',mskNPedido.Text,[LOCASEINSENSITIVE]) = True) then
 begin
  while( (dmBaseDados.tblContasReceberNumeroDocumento.AsString = mskNPedido.Text)and(not dmBaseDados.tblContasReceber.Eof) )do
   begin
    dmBaseDados.tblContasReceber.Delete;
   end;
 end;}
if (ckbAVista.Checked = False) then
 BEGIN
 { FormAlterarValor.ShowModal;
  intContador := intParcelas;
  while (intContador > 0) do
    Begin
     Case intContador of
      8: dtdDataVencimento := StrToDate(FormAlterarValor.mskData8.Text);
      7: dtdDataVencimento := StrToDate(FormAlterarValor.mskData7.Text);
      6: dtdDataVencimento := StrToDate(FormAlterarValor.mskData6.Text);
      5: dtdDataVencimento := StrToDate(FormAlterarValor.mskData5.Text);
      4: dtdDataVencimento := StrToDate(FormAlterarValor.mskData4.Text);
      3: dtdDataVencimento := StrToDate(FormAlterarValor.mskData3.Text);
      2: dtdDataVencimento := StrToDate(FormAlterarValor.mskData2.Text);
      1: dtdDataVencimento := StrToDate(FormAlterarValor.mskData1.Text);
     end;
     if( (intContador = 1)and(FormAlterarValor.mskData1.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor1.Text);
     if( (intContador = 2)and(FormAlterarValor.mskData2.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor2.Text);
     if( (intContador = 3)and(FormAlterarValor.mskData3.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor3.Text);
     if( (intContador = 4)and(FormAlterarValor.mskData4.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor4.Text);
     if( (intContador = 5)and(FormAlterarValor.mskData5.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor5.Text);
     if( (intContador = 6)and(FormAlterarValor.mskData6.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor6.Text);
     if( (intContador = 7)and(FormAlterarValor.mskData7.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor7.Text);
     if( (intContador = 8)and(FormAlterarValor.mskData8.Text<>'  /  /  ') )then
      fltVParcela := StrToFloat(FormAlterarValor.edtValor8.Text);
     dmBaseDados.tblContasReceber.Append;
     dmBaseDados.tblContasReceberDataVencimento.AsDateTime := dtdDataVencimento;
     dmBaseDados.tblContasReceberFormaPagamento.AsString   := 'BO    - BOLETO';
     dmBaseDados.tblContasReceberCodCli.AsInteger          := dmBaseDados.tblClientesCodigoCliente.AsInteger;
     dmBaseDados.tblContasReceberNumeroCIC.AsString        := dmBaseDados.tblClientesNumeroCIC.AsString;
     dmBaseDados.tblContasReceberNumeroDocumento.AsString  := mskNPedido.Text;
     dmBaseDados.tblContasReceberNumeroNF.AsString         := mskNrNotaFiscal.Text;
     dmBaseDados.tblContasReceberCliente.AsString          := dmBaseDados.tblClientesNomeCliente.AsString;
     dmBaseDados.tblContasReceberDataEmissao.AsDateTime    := Date;
     dmBaseDados.tblContasReceberVendedor.AsString         := strVendedor;
     dmBaseDados.tblContasReceberParcelas.AsString         := IntToStr(intContador)+'/'+IntToStr(intParcelas);
     dmBaseDados.tblContasReceberValorDocumento.AsFloat    := fltVParcela;
     dmBaseDados.tblContasReceberMotorista.AsString        := '000';
     dmBaseDados.tblContasReceber.Post;
     intContador := intContador - 1;
    End; }
  dmBaseDados.tblContasReceber.IndexName := '';
  dmBaseDados.tblContasReceber.First;
  dmBaseDados.tblContasReceber.Locate('NumeroDocumento',mskNPedido.Text,[loCaseInsensitive]);
  //SHORTDATEFORMAT  := 'yyyy-mm-dd';
  DecimalSeparator := '.';                               
  while( (dmBaseDados.tblContasReceberNumeroDocumento.AsString = mskNPedido.Text)and(not dmBaseDados.tblContasReceber.Eof) )do
    Begin
     intContador := intContador + 1;               
     if (intContador = 1) then           
       begin
        strVenc1  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc1   := '001'; //mskNrNotaFiscal.Text + '/1';
        strValor1 :=  FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 2) then
       begin
        strVenc2  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc2   := '002'; //mskNrNotaFiscal.Text + '/2';
        strValor2 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 3) then
       begin
        strVenc3  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc3   := '003'; //mskNrNotaFiscal.Text + '/3';
        strValor3 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 4) then
       begin
        strVenc4  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc4   := '004'; //mskNrNotaFiscal.Text + '/4';
        strValor4 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 5) then
       begin
        strVenc5  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc5   := '005'; //mskNrNotaFiscal.Text + '/5';
        strValor5 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 6) then
       begin
        strVenc6  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc6   := '006'; //mskNrNotaFiscal.Text + '/6';
        strValor6 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;                         
     if (intContador = 7) then
       begin
        strVenc7  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc7   := '007'; //mskNrNotaFiscal.Text + '/7';
        strValor7 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     if (intContador = 8) then
       begin
        strVenc8  := DateToStr(dmBaseDados.tblContasReceberDataVencimento.AsDateTime);
        strDoc8   := '008'; //mskNrNotaFiscal.Text + '/8';
        strValor8 := FormatCurr('0.00',dmBaseDados.tblContasReceberValorDocumento.AsCurrency);
       end;
     dmBaseDados.tblContasReceber.Next;
    End;//end do While do ContasReceber
 END; //end do if AVista
dmBaseDados.tblSaida.Close;
dmBaseDados.tblProdutos.IndexName := '';
SHORTDATEFORMAT  := 'dd/mm/yyyy';
DecimalSeparator := ',';
//ShowMessage('Numero de parcelas é de '+IntToStr(intContador));
strComp1 := dmBaseDados.tblPedidosNPedido.AsString;
strComp2 := mskNPedido.Text;
     WHILE( (not dmBaseDados.tblPedidos.Eof)and(strComp1 = strComp2) )do
       BEGIN
        strSTIVA      := 0;
        strSTCustoT   := 0;
        strSTIcms12   := 0;
        strSTBase     := 0;
        strSTIcmsCli  := 0;
        strSTIcms     := 0;          
        strProdBase   := 0;
        strProdICMS   := 0;
        strProdBaseST := 0;
        strProdIcmsST := 0;
        strCfopMudou  := '0';
        if ((dmBaseDados.tblPedidosCST.AsString = '000') or (dmBaseDados.tblPedidosCST.AsString = '020') or (dmBaseDados.tblPedidosCST.AsString = '060')or (dmBaseDados.tblPedidosCST.AsString = '260')) then
         begin
          strCont000 := strCont000 + 1 ;
         end;
        if (dmBaseDados.tblPedidosCST.AsString = '070') then
         begin
          strCont070 := strCont070 + 1 ;
         end;
        if( (dmBaseDados.tblPedidosCST.AsString = '000')or(dmBaseDados.tblPedidosCST.AsString = '100')or(dmBaseDados.tblPedidosCST.AsString = '200') )then
         begin
          Item000 := Item000 + dmBaseDados.tblPedidosTotal.AsFloat;
         end;
        //Tabela Pedidos
        strCodFamilia   := Copy(dmBaseDados.tblPedidosProduto.AsString,1,3);
        strCodCategoria := Copy(dmBaseDados.tblPedidosProduto.AsString,4,3);
        strCodProduto   := Copy(dmBaseDados.tblPedidosProduto.AsString,7,6);
        //Tabela de Clientes
        strColuna2   := Copy(dmBaseDados.tblClientesNumeroRG.AsString,2,1);
        strColuna3   := Copy(dmBaseDados.tblClientesNumeroRG.AsString,3,1);
        if (strColuna3 = '.') then
          begin
           strINSC1 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,1,2);
           strINSC2 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,4,3);
           strINSC3 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,8,3);
           strINSC4 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,12,3);
           strINSC  := strINSC1+strINSC2+strINSC3+strINSC4;
          end;
        if( (strColuna3 = '0')or(strColuna3 = '1')or(strColuna3 = '2')or(strColuna3 = '3')or(strColuna3 = '4')
         or (strColuna3 = '5')or(strColuna3 = '6')or(strColuna3 = '7')or(strColuna3 = '8')or(strColuna3 = '9') )then
          begin
           strINSC1 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,1,3);
           strINSC2 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,5,3);
           strINSC3 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,9,3);
           strINSC4 := Copy(dmBaseDados.tblClientesNumeroRG.AsString,13,3);
           strINSC  := strINSC1+strINSC2+strINSC3+strINSC4;
          end;
        if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
          begin
           strCPF1  := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,1,3);
           strCPF2  := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,5,3);
           strCPF3  := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,9,3);
           strCPF4  := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,13,2);
           strCPF   := strCPF1+strCPF2+strCPF3+strCPF4;
          end
        else
          begin
           strCNPJ1 := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,1,2);
           strCNPJ2 := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,4,3);
           strCNPJ3 := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,8,3);
           strCNPJ4 := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,12,4);
           strCNPJ5 := Copy(dmBaseDados.tblClientesNumeroCIC.AsString,17,2);
           strCNPJ  := strCNPJ1+strCNPJ2+strCNPJ3+strCNPJ4+strCNPJ5;
          end;
        //dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
        dmBaseDados.tblProdutos.Locate('Codigo',dmBaseDados.tblPedidosProduto.AsString,[loCaseInsensitive]);
        strPercReducao := dmBaseDados.tblProdutosReducaoIcms.AsFloat;

       {
        // Se o item for 060 e for nota de devolução ou Garantia...:
        if( (dmBaseDados.tblPedidosCST.AsString = '060')and(rdgTipoOperacao.ItemIndex = 1) )then
         begin
          dmBaseDados.tblPedidos.Edit;
          dmBaseDados.tblPedidosCST.AsString := '010';
          dmBaseDados.tblPedidos.Post;
         end;

        // Caso produto for 060, e for para esses estados, ele calculará igual os itens '010' sem 'IPI'...
        if( (dmBaseDados.tblPedidosCST.AsString = '060')and
          (  (dmBaseDados.tblClientesEstado.AsString = 'AL')
          or (dmBaseDados.tblClientesEstado.AsString = 'AM')
          or (dmBaseDados.tblClientesEstado.AsString = 'AP')
          or (dmBaseDados.tblClientesEstado.AsString = 'BA')
          or (dmBaseDados.tblClientesEstado.AsString = 'MA')
          or (dmBaseDados.tblClientesEstado.AsString = 'MG')
          or (dmBaseDados.tblClientesEstado.AsString = 'MT')
          or (dmBaseDados.tblClientesEstado.AsString = 'PA')
          or (dmBaseDados.tblClientesEstado.AsString = 'PR')
          or (dmBaseDados.tblClientesEstado.AsString = 'PI')
          or (dmBaseDados.tblClientesEstado.AsString = 'RJ')
          or (dmBaseDados.tblClientesEstado.AsString = 'RS')
          or (dmBaseDados.tblClientesEstado.AsString = 'SC')
          or (dmBaseDados.tblClientesEstado.AsString = 'ES')) )then
           begin
            dmBaseDados.tblPedidos.Edit;
            dmBaseDados.tblPedidosCST.AsString := '010';
            dmBaseDados.tblPedidos.Post;
            strCfopMudou := '1';
           end;

        if( ((dmBaseDados.tblPedidosCST.AsString = '060'))and
           ( (dmBaseDados.tblClientesEstado.AsString <> 'AL')
         and (dmBaseDados.tblClientesEstado.AsString <> 'SP')
         and (dmBaseDados.tblClientesEstado.AsString <> 'AM')
         and (dmBaseDados.tblClientesEstado.AsString <> 'AP')
         and (dmBaseDados.tblClientesEstado.AsString <> 'BA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MG')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MT')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PR')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PI')
         and (dmBaseDados.tblClientesEstado.AsString <> 'RJ')
         and (dmBaseDados.tblClientesEstado.AsString <> 'RS')
         and (dmBaseDados.tblClientesEstado.AsString <> 'SC')
         and (dmBaseDados.tblClientesEstado.AsString <> 'ES')) )then
           begin
            dmBaseDados.tblPedidos.Edit;
            dmBaseDados.tblPedidosCST.AsString := '000';
            dmBaseDados.tblPedidos.Post;
            strCfopMudou := '1';
           end;

        if( ((dmBaseDados.tblPedidosCST.AsString = '260'))and
          (  (dmBaseDados.tblClientesEstado.AsString = 'AL')
          or (dmBaseDados.tblClientesEstado.AsString = 'AM')
          or (dmBaseDados.tblClientesEstado.AsString = 'AP')
          or (dmBaseDados.tblClientesEstado.AsString = 'BA')
          or (dmBaseDados.tblClientesEstado.AsString = 'MA')
          or (dmBaseDados.tblClientesEstado.AsString = 'MG')
          or (dmBaseDados.tblClientesEstado.AsString = 'MT')
          or (dmBaseDados.tblClientesEstado.AsString = 'PA')
          or (dmBaseDados.tblClientesEstado.AsString = 'PR')
          or (dmBaseDados.tblClientesEstado.AsString = 'PI')
          or (dmBaseDados.tblClientesEstado.AsString = 'RJ')
          or (dmBaseDados.tblClientesEstado.AsString = 'RS')
          or (dmBaseDados.tblClientesEstado.AsString = 'SC')
          or (dmBaseDados.tblClientesEstado.AsString = 'ES')) )then
           begin
            dmBaseDados.tblPedidos.Edit;
            dmBaseDados.tblPedidosCST.AsString := '210';
            dmBaseDados.tblPedidos.Post;
            strCfopMudou := '1';
           end;

        if( ((dmBaseDados.tblPedidosCST.AsString = '260'))and
           ( (dmBaseDados.tblClientesEstado.AsString <> 'AL')
         and (dmBaseDados.tblClientesEstado.AsString <> 'SP')
         and (dmBaseDados.tblClientesEstado.AsString <> 'AM')
         and (dmBaseDados.tblClientesEstado.AsString <> 'AP')
         and (dmBaseDados.tblClientesEstado.AsString <> 'BA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MG')
         and (dmBaseDados.tblClientesEstado.AsString <> 'MT')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PA')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PR')
         and (dmBaseDados.tblClientesEstado.AsString <> 'PI')
         and (dmBaseDados.tblClientesEstado.AsString <> 'RJ')
         and (dmBaseDados.tblClientesEstado.AsString <> 'RS')
         and (dmBaseDados.tblClientesEstado.AsString <> 'SC')
         and (dmBaseDados.tblClientesEstado.AsString <> 'ES')) )then
           begin
            dmBaseDados.tblPedidos.Edit;
            dmBaseDados.tblPedidosCST.AsString := '000';
            dmBaseDados.tblPedidos.Post;
            strCfopMudou := '1';
           end;
        }
        // Calculo da Subst. Trib., CST = 010...
        if( (dmBaseDados.tblPedidosCST.AsString = '010')or(dmBaseDados.tblPedidosCST.AsString = '210') )then
          begin
           strSTIVA := dmBaseDados.tblProdutosIVA.AsFloat/100;
           IF (dmBaseDados.tblClientesEstado.AsString = 'SP') then
            BEGIN
             if (rdgTipoOperacao.ItemIndex = 1) then strSTIVA := 0.40;
             strSTCustoT   := (dmBaseDados.tblPedidosTotal.AsFloat + dmBaseDados.tblPedidosValorIPI.AsFloat);
             if dmBaseDados.tblProdutosIcms.AsFloat = 7 then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
              end;
             if dmBaseDados.tblProdutosIcms.AsFloat = 12 then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.12;
              end;
             if (dmBaseDados.tblProdutosReducaoIcms.AsFloat = 1) or (dmBaseDados.tblProdutosReducaoIcms.AsFloat = 0) or (dmBaseDados.tblProdutosIcms.AsFloat = 18)then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.18;
              end;
             if dmBaseDados.tblProdutosReducaoIcms.AsString = '61,11' then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
              end;
             strSTBase := strSTCustoT + (strSTCustoT * strSTIVA);
             fltBase18 := fltBase18   + dmBaseDados.tblPedidosTotal.AsFloat;
             fltIcms18 := fltIcms18   + (dmBaseDados.tblPedidosTotal.AsFloat * 0.18);
             if dmBaseDados.tblProdutosReducaoIcms.AsString = '61,11' then
              begin
               strSTIcmsCli  := strSTBase * 0.07;
              end
             else
              begin
               strSTIcmsCli  := strSTBase * 0.18;
              end;
            END
           ELSE {fora de SP}
            BEGIN
             if (strCfopMudou = '0') then
              begin
               strSTCustoT := (dmBaseDados.tblPedidosTotal.AsFloat + dmBaseDados.tblPedidosValorIPI.AsFloat);
              end;
             if (strCfopMudou = '1') then
              begin
               strSTCustoT := (dmBaseDados.tblPedidosTotal.AsFloat);
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'MG')
              or (dmBaseDados.tblClientesEstado.AsString = 'PR')
              or (dmBaseDados.tblClientesEstado.AsString = 'RS')
              or (dmBaseDados.tblClientesEstado.AsString = 'RJ')
              or (dmBaseDados.tblClientesEstado.AsString = 'SC') )then
              begin
               strSTIcms12 := dmBaseDados.tblPedidosTotal.AsFloat * 0.12;
               fltBase12   := fltBase12 + dmBaseDados.tblPedidosTotal.AsFloat;
               fltIcms12   := fltIcms12 + (dmBaseDados.tblPedidosTotal.AsFloat * 0.12);
              end
             else
              begin
               if (rdgTipoOperacao.ItemIndex = 0) then
                begin
                 strSTIcms12 := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
                 fltBase7    := fltBase7 + dmBaseDados.tblPedidosTotal.AsFloat;
                 fltIcms7    := fltIcms7 + (dmBaseDados.tblPedidosTotal.AsFloat * 0.07);
                end;
               if (rdgTipoOperacao.ItemIndex = 1) then
                begin
                 strSTIcms12 := dmBaseDados.tblPedidosTotal.AsFloat * 0.12;
                 fltBase12   := fltBase12 + dmBaseDados.tblPedidosTotal.AsFloat;
                 fltIcms12   := fltIcms12 + (dmBaseDados.tblPedidosTotal.AsFloat * 0.12);
                end;
              end;
             strSTIVA     := 1.5687;
             strSTIcmsInt := 0.17;
             if( (dmBaseDados.tblClientesEstado.AsString = 'ES')or(dmBaseDados.tblClientesEstado.AsString = 'GO') )then
              begin
               strSTIVA := 0;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'MG')or(dmBaseDados.tblClientesEstado.AsString = 'PR') )then
              begin
               strSTIVA     := 1.5024;
               strSTIcmsInt := 0.18;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'RS')or(dmBaseDados.tblClientesEstado.AsString = 'SC') )then
              begin
               strSTIVA := 1.4843;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'RJ') )then
              begin
               strSTIVA     := 1.521;
               strSTIcmsInt := 0.19;
              end;
            if (rdgTipoOperacao.ItemIndex = 1) then
              begin
               strSTIVA     := 1.5024;
               strSTIcmsInt := 0.18;
              end;
             strSTBase    := strSTCustoT * strSTIVA;
             strSTIcmsCli := strSTBase * strSTIcmsInt;
             {ShowMessage(FloatToStr(strSTIVA));
             ShowMessage( dmBaseDados.tblPedidosCodigoReferencia.AsString +' Produto+IPI '+FloatToStr(strSTCustoT))  ;
             ShowMessage( dmBaseDados.tblPedidosCodigoReferencia.AsString +' ICMS 12 strSTIcms12 : '+FloatToStr(strSTIcms12));
             ShowMessage( dmBaseDados.tblPedidosCodigoReferencia.AsString +' Produto+IPI * IVA '+FloatToStr(strSTBase))  ;
             ShowMessage( dmBaseDados.tblPedidosCodigoReferencia.AsString +' Total * ICMS : '+FloatToStr(strSTIcms12));}
            END;
           //strSTBase     := strSTIcmsCli;
           strSTIcms     := strSTIcmsCli - strSTIcms12;
           strSomaBaseST := strSomaBaseST + strSTBase;
           strSomaIcmsST := strSomaIcmsST + strSTIcms;
           //strTotalST    := strTotalST + strSomaIcmsST;
          end; // end do if cálculo da Sub.Trib. CST 010
        //--
        // Calculo da Subst. Trib. antecipada, CST = 060...
        if( (dmBaseDados.tblPedidosCST.AsString = '060')or(dmBaseDados.tblPedidosCST.AsString = '260') )then
          begin
           IF (dmBaseDados.tblClientesEstado.AsString = 'SP') then
            BEGIN
             strSTCustoT   := (dmBaseDados.tblPedidosTotal.AsFloat);
             if dmBaseDados.tblProdutosIcms.AsFloat = 7 then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
              end;
             if dmBaseDados.tblProdutosIcms.AsFloat = 12 then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.12;
              end;
             if (dmBaseDados.tblProdutosReducaoIcms.AsFloat = 1) or (dmBaseDados.tblProdutosReducaoIcms.AsFloat = 0) or (dmBaseDados.tblProdutosIcms.AsFloat = 18)then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.18;
              end;
             if dmBaseDados.tblProdutosReducaoIcms.AsString = '61,11' then
              begin
               strSTIcms12   := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
              end;
             strSTBase     := strSTCustoT +(strSTCustoT * 0.40);
             if dmBaseDados.tblProdutosReducaoIcms.AsString = '61,11' then
              begin
               strSTIcmsCli := strSTBase * 0.07;
              end
             else
              begin
               strSTIcmsCli := strSTBase * 0.18;
              end;
            END
           ELSE  {fora de SP}
            BEGIN
             strSTCustoT   := (dmBaseDados.tblPedidosTotal.AsFloat);
             if( (dmBaseDados.tblClientesEstado.AsString = 'MG')
              or (dmBaseDados.tblClientesEstado.AsString = 'PR')
              or (dmBaseDados.tblClientesEstado.AsString = 'RS')
              or (dmBaseDados.tblClientesEstado.AsString = 'RJ')
              or (dmBaseDados.tblClientesEstado.AsString = 'SC') )then
              begin
               strSTIcms12 := dmBaseDados.tblPedidosTotal.AsFloat * 0.12;
              end
             else
              begin
               strSTIcms12 := dmBaseDados.tblPedidosTotal.AsFloat * 0.07;
              end;
             strSTIVA     := 0.5687;
             strSTIcmsInt := 0.17;
             if( (dmBaseDados.tblClientesEstado.AsString = 'ES')or(dmBaseDados.tblClientesEstado.AsString = 'GO') ) then
              begin
               strSTIVA := 0;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'MG')or(dmBaseDados.tblClientesEstado.AsString = 'PR') ) then
              begin
               strSTIVA     := 0.5024;
               strSTIcmsInt := 0.18;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'RS')or(dmBaseDados.tblClientesEstado.AsString = 'SC') ) then
              begin
               strSTIVA := 0.4843;
              end;
             if( (dmBaseDados.tblClientesEstado.AsString = 'RJ') ) then
              begin
               strSTIVA     := 0.5210;
               strSTIcmsInt := 0.19;
              end;
             strSTBase    := strSTCustoT +(strSTCustoT * strSTIVA);
             strSTIcmsCli := strSTBase * strSTIcmsInt;
            END;
           strSTBase  := strSTIcmsCli;
           strSTIcms  := strSTIcmsCli - strSTIcms12;
           //strBase060 := strSomaBaseST + strSTBase;
           //strIcms060 := strSomaIcmsST + strSTIcms;
          end; // end do if cálculo da Sub.Trib. CST 060



        fltTotal   := fltTotal+dmBaseDados.tblPedidosTotal.AsFloat;
        //* CALCULO ICMS TRIBUTADO INTEGRALMENTE*//
        IF (dmBaseDados.tblPedidosCST.AsString = '000') then
          BEGIN
           fltIcms    := dmBaseDados.tblPedidosICMS.AsFloat;
           if dmBaseDados.tblProdutosReducaoIcms.AsFloat > 1 then
            fltReducao := dmBaseDados.tblProdutosReducaoIcms.AsFloat/100
           else fltReducao := dmBaseDados.tblProdutosReducaoIcms.AsFloat;
           //Quando ICMS = 25%
           if (fltIcms = 25) then
             begin
              fltVCont25  := fltVCont25+dmBaseDados.tblPedidosTotal.AsFloat;
              fltBase25   := fltVCont25;
              fltIcms25   := fltIcms25+(dmBaseDados.tblPedidosTotal.AsFloat*0.25);
              strProdBase := dmBaseDados.tblPedidosTotal.AsFloat;
              strProdICMS := dmBaseDados.tblPedidosTotal.AsFloat*0.25;
             end;
           //Quando ICMS = 18% com Redução
           if( (fltIcms=18)and(fltReducao<1)and(fltReducao<>0) )then
             begin
              fltVCont00   := fltVCont00+dmBaseDados.tblPedidosTotal.AsFloat;
              fltR18       := fltR18+dmBaseDados.tblPedidosTotal.AsFloat;
              fltBaseR18   := fltBaseR18+(dmBaseDados.tblPedidosTotal.AsFloat*(1-fltReducao));
              fltIcmsR18   := fltIcmsR18+(dmBaseDados.tblPedidosTotal.AsFloat*(1-fltReducao)*0.18);
              fltIsentoR18 := fltR18-fltBaseR18;
              strProdBase  := dmBaseDados.tblPedidosTotal.AsFloat*(1-fltReducao);
              strProdICMS  := dmBaseDados.tblPedidosTotal.AsFloat*(1-fltReducao)*0.18;
              strPercReducao := dmBaseDados.tblProdutosReducaoIcms.AsFloat;
             end;
           //Quando ICMS = 18% sem redução. Aqui verifica se Cliente tem benefício ou não.
           if( (fltIcms = 18)and((fltReducao=1)or(fltReducao=0)) )then
             begin
              fltVCont18 := dmBaseDados.tblPedidosTotal.AsFloat;
              fltVCont00 := fltVCont00 + dmBaseDados.tblPedidosTotal.AsFloat;
              if( (dmBaseDados.tblClientesRPA.AsString = 'SIM')and(dmBaseDados.tblProdutosBeneficio.AsString = 'SIM') )then
                begin
                 fltIcms18   := fltIcms18+(((dmBaseDados.tblPedidosTotal.AsFloat)/3)*2)*0.18;
                 fltBase18   := fltBase18+(((fltVCont18)/3)*2);
                 fltIsento18 := (fltVCont00-fltBase18);
                 strProdBase := (((dmBaseDados.tblPedidosTotal.AsFloat)/3)*2)*0.18;
                 strProdICMS := (((fltVCont18)/3)*2);
                end;
              if( ((dmBaseDados.tblClientesRPA.AsString  = 'NAO')and(dmBaseDados.tblProdutosBeneficio.AsString = 'NAO')) OR
                  ((dmBaseDados.tblClientesRPA.AsString  = 'NAO')and(dmBaseDados.tblProdutosBeneficio.AsString = 'SIM')) OR
                  ((dmBaseDados.tblClientesRPA.AsString  = '')   and(dmBaseDados.tblProdutosBeneficio.AsString = 'NAO')) OR
                  ((dmBaseDados.tblClientesRPA.AsString  = '')   and(dmBaseDados.tblProdutosBeneficio.AsString = 'SIM')) OR
                  ((dmBaseDados.tblClientesRPA.AsString  = '')   and(dmBaseDados.tblProdutosBeneficio.AsString = '')   ) OR
                  ((dmBaseDados.tblClientesRPA.AsString  = 'SIM')and(dmBaseDados.tblProdutosBeneficio.AsString = 'NAO')) )then
                begin
                 fltIcms18   := fltIcms18+(dmBaseDados.tblPedidosTotal.AsFloat*0.18);
                 fltBase18   := fltBase18+fltVCont18;
                 strProdBase := dmBaseDados.tblPedidosTotal.AsFloat;
                 strProdICMS := dmBaseDados.tblPedidosTotal.AsFloat*0.18;
                 dmBaseDados.tblPedidos.Edit;
                 dmBaseDados.tblPedidosCST.AsString := '000';
                 dmBaseDados.tblPedidos.Post;
                end;
             end;
           //Quando ICMS = 12% com Redução
           {if( (fltIcms = 12)and(fltReducao < 1)and(fltReducao <> 0) )then
             begin
              fltVCont12  := fltVCont12+dmBaseDados.tblPedidosTotal.AsFloat;
              fltR12      := fltR12+dmBaseDados.tblPedidosTotal.AsFloat;
              fltBaseR12  := fltBaseR12+(dmBaseDados.tblPedidosTotal.AsFloat*fltReducao);
              fltIcmsR12  := fltIcmsR12+(dmBaseDados.tblPedidosTotal.AsFloat*fltReducao*0.12);
              fltIsento12 := (fltR12-fltBaseR12);
              strProdBase := dmBaseDados.tblPedidosTotal.AsFloat*fltReducao;
              strProdICMS := dmBaseDados.tblPedidosTotal.AsFloat*fltReducao*0.12;
             end;           }
           //Quando ICMS = 12% sem Redução
           {if( (fltIcms = 12)and((fltReducao = 1)or(fltReducao = 0)) ) then
             begin
              fltVCont12  := fltVCont12+dmBaseDados.tblPedidosTotal.AsFloat;
              fltBase12   := fltVCont12;
              fltIcms12   := fltIcms12+(dmBaseDados.tblPedidosTotal.AsFloat*0.12);
              strProdBase := dmBaseDados.tblPedidosTotal.AsFloat;
              strProdICMS := dmBaseDados.tblPedidosTotal.AsFloat*0.12;
             end;}
           //Quando ICMS = 12%
           if (fltIcms = 12) then
             begin
              fltVCont12   := fltVCont12 + dmBaseDados.tblPedidosTotal.AsFloat;
              fltBase12    := fltBase12  + dmBaseDados.tblPedidosTotal.AsFloat;
              fltIcms12    := fltIcms12  + (dmBaseDados.tblPedidosTotal.AsFloat*0.12);
              strProdBase  := dmBaseDados.tblPedidosTotal.AsFloat;
              strProdICMS  := dmBaseDados.tblPedidosTotal.AsFloat*0.12;
             end;
           if (fltIcms = 7) then
             begin
              fltVCont7   := fltVCont7+dmBaseDados.tblPedidosTotal.AsFloat;
              fltBase7    := fltBase7  + dmBaseDados.tblPedidosTotal.AsFloat;
              fltIcms7    := fltIcms7+(dmBaseDados.tblPedidosTotal.AsFloat*0.07);
              strProdBase := dmBaseDados.tblPedidosTotal.AsFloat;
              strProdICMS := dmBaseDados.tblPedidosTotal.AsFloat*0.07;
             end;
           //Quando ICMS = 0
           if (fltIcms = 0) then
             begin
              fltVCont0   := fltVCont0+dmBaseDados.tblPedidosTotal.AsFloat;
              strProdBase := dmBaseDados.tblPedidosTotal.AsFloat;
              strProdICMS := 0;
             end;
          END; // end do if cálculo do ICMS tributado normalmente...
        dmBaseDados.tblPedidos.Edit;
        dmBaseDados.tblPedidosBaseICMS.AsFloat    := strProdBase;
        dmBaseDados.tblPedidosValorICMS.AsFloat   := strProdICMS;
        dmBaseDados.tblPedidosBaseST.AsFloat      := strSTBase;
        dmBaseDados.tblPedidosIcmsST.AsFloat      := strSTIcms;
        dmBaseDados.tblPedidosPercReducao.AsFloat := strPercReducao;
        //dmBaseDados.tblPedidosBaseST.AsFloat:=strSomaBaseST;
        //dmBaseDados.tblPedidosIcmsST.AsFloat:=strSomaIcmsST;
        dmBaseDados.tblPedidos.Post;
        dmBaseDados.tblPedidos.FlushBuffers;
        if (strCfopMudou = '0') then
         begin
          strSomaIPI := strSomaIPI + dmBaseDados.tblPedidosValorIPI.AsFloat;
         end;
        strTotalTrib := strTotalTrib + dmBaseDados.tblPedidosVTributos.AsFloat;
        strTribFeder := strTribFeder + dmBaseDados.tblPedidosTribFed.AsFloat;
        strTribEstad := strTribEstad + dmBaseDados.tblPedidosTribEst.AsFloat;
        strTribMunic := strTribMunic + dmBaseDados.tblPedidosTribMun.AsFloat;        
        dmBaseDados.tblPedidos.Next;
        strComp1:=dmBaseDados.tblPedidosNPedido.AsString;
        dmBaseDados.tblProdutos.IndexName := '';
       END;// end do WHILE tblPedidos

// Gravando na tblANotaFiscal...:

if (stsNotaE = '1') then
 begin
  dmBaseDados.tblANotaFiscal.FindKey([mskNrNotaFiscal.Text]);
  dmBaseDados.tblANotaFiscal.Edit;
 end
else
 begin
  dmBaseDados.tblANotaFiscal.Append;
 end;
 dmBaseDados.tblANotaFiscalPedido.AsString         := mskNPedido.Text;
 dmBaseDados.tblANotaFiscalNrNF.AsString           := mskNrNotaFiscal.Text;
 dmBaseDados.tblANotaFiscalDataEmissao.AsDateTime  := Date;
 dmBaseDados.tblANotaFiscalCFOP.AsString           := cmbCfop.Text;
 dmBaseDados.tblANotaFiscalCodigoCliente.AsInteger := dmBaseDados.tblClientesCodigoCliente.AsInteger;
 dmBaseDados.tblANotaFiscalVcont25.AsFloat         := fltVCont25;
 dmBaseDados.tblANotaFiscalVcont18.AsFloat         := fltVCont00;
 dmBaseDados.tblANotaFiscalVcont12.AsFloat         := fltVCont12;
 dmBaseDados.tblANotaFiscalVcont7.AsFloat          := fltVCont7;
 dmBaseDados.tblANotaFiscalBase25.AsFloat          := fltBase25;
 dmBaseDados.tblANotaFiscalBase18.AsFloat          := fltBase18;
 dmBaseDados.tblANotaFiscalBase12.AsFloat          := fltBase12;
 dmBaseDados.tblANotaFiscalBase7.AsFloat           := fltBase7;
 dmBaseDados.tblANotaFiscalIcms25.AsFloat          := fltIcms25;
 dmBaseDados.tblANotaFiscalIcms18.AsFloat          := fltIcms18;
 dmBaseDados.tblANotaFiscalIcms12.AsFloat          := fltIcms12;
 dmBaseDados.tblANotaFiscalIcms7.AsFloat           := fltIcms7;
 dmBaseDados.tblANotaFiscalBaseR18.AsFloat         := fltBaseR18;
 dmBaseDados.tblANotaFiscalBaseR12.AsFloat         := fltBaseR12;
 dmBaseDados.tblANotaFiscalIcmsR18.AsFloat         := fltIcmsR18;
 dmBaseDados.tblANotaFiscalIcmsR12.AsFloat         := fltIcmsR12;
 dmBaseDados.tblANotaFiscalAliqIcms.AsFloat        := fltAliqIcms;
 dmBaseDados.tblANotaFiscalImpostoIcms.AsFloat     := fltImpostoIcms;
 dmBaseDados.tblANotaFiscalIsentoIcms.AsFloat      := fltIsentoIcms;
 dmBaseDados.tblANotaFiscalOutrasIcms.AsFloat      := fltOutrasIcms;
 dmBaseDados.tblANotaFiscalIcmsNaFonte.AsFloat     := fltIcmsNaFonte;
 dmBaseDados.tblANotaFiscalValorPrazo.AsFloat      := fltValorPrazo;
 dmBaseDados.tblANotaFiscalContribuinte.AsFloat    := fltContribuinte;
 dmBaseDados.tblANotaFiscalTipoNota.AsFloat        := fltTipoNota;
 dmBaseDados.tblANotaFiscalContaCtblFornecedor.AsString := ''; //fltContaCtblFornecedor;
 dmBaseDados.tblANotaFiscalNrMunicipio.AsFloat     := fltNrMunicipio;
 dmBaseDados.tblANotaFiscalInscrEstadual.AsString  := dmBaseDados.tblClientesNumeroRG.AsString;
 dmBaseDados.tblANotaFiscalRazaoSocial.AsString    := dmBaseDados.tblClientesNomeCliente.AsString;
 dmBaseDados.tblANotaFiscalUf.AsString             := dmBaseDados.tblClientesEstado.AsString;
 dmBaseDados.tblANotaFiscalIsento7.AsFloat         := fltIsento7;
 dmBaseDados.tblANotaFiscalIsento12.AsFloat        := fltIsento12;
 dmBaseDados.tblANotaFiscalIsento18.AsFloat        := fltIsento18+fltVCont0;
 dmBaseDados.tblANotaFiscalIsento25.AsFloat        := fltIsento25;
 dmBaseDados.tblANotaFiscalIsentoR18.AsFloat       := fltIsentoR18;
 dmBaseDados.tblANotaFiscalOutras7.AsFloat         := fltOutras7;
 dmBaseDados.tblANotaFiscalOutras12.AsFloat        := fltOutras12;
 dmBaseDados.tblANotaFiscalOutras18.AsFloat        := fltOutras18;
 dmBaseDados.tblANotaFiscalOutras25.AsFloat        := fltOutras25;
 dmBaseDados.tblANotaFiscalOutrasR18.AsFloat       := fltOutrasR18;
 dmBaseDados.tblANotaFiscalDMEmissao.AsFloat       := fltDMEmissao;
 dmBaseDados.tblANotaFiscalValorTNF.AsFloat        := fltTotal;
 dmBaseDados.tblANotaFiscalDesconto.AsFloat        := strDescon;
 dmBaseDados.tblANotaFiscalDespesasAC.AsFloat      := strDespAC;
 dmBaseDados.tblANotaFiscalValorVista.AsFloat      := fltTotal + strDespAC + strFrete - strDescon;
 dmBaseDados.tblANotaFiscalFrete.AsFloat           := strFrete;
 dmBaseDados.tblANotaFiscalBaseST.AsFloat          := strSomaBaseST;
 dmBaseDados.tblANotaFiscalIcmsST.AsFloat          := strSomaIcmsST;
 dmBaseDados.tblANotaFiscalIPI.AsFloat             := strSomaIPI;
 dmBaseDados.tblANotaFiscalVTributos.AsFloat       := strTotalTrib;
 dmBaseDados.tblANotaFiscalTribFed.AsFloat         := strTribFeder;
 dmBaseDados.tblANotaFiscalTribEst.AsFloat         := strTribEstad;
 dmBaseDados.tblANotaFiscalTribMun.AsFloat         := strTribMunic;
 dmBaseDados.tblANotaFiscalBaseCalculo.AsFloat     := fltBase7+fltBase12+fltBase18+fltBase25+fltBaseR12+fltBaseR18;
 dmBaseDados.tblANotaFiscalValorICMS.AsFloat       := (Item000 * (PercIcms/100)); //fltIcms7+fltIcms12+fltIcms18+fltIcms25+fltIcmsR12+fltIcmsR18;
 if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
  begin
   dmBaseDados.tblANotaFiscalCgc.AsString         := strCPF;
  end
 else
  begin
   dmBaseDados.tblANotaFiscalCgc.AsString         := strCNPJ;
  end;
 dmBaseDados.tblANotaFiscal.Post;
//...fim da gravação na ANotaFical.

if (edtDesconto.Text <> '') then
 begin
  PercDesc    := (strDescon/fltTotal)*100;
  PercDesc    := Arredondar(PercDesc,3);
 end;

// Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '61429791000164';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(mskNrNotaFiscal.Text,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
// Chave:
ChaveAcesso := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;

btnGrava.Enabled        := False;
btnImprime.Enabled      := True;           
mskNPedido.Enabled      := False;
mskNrNotaFiscal.Enabled := False;
cmbCfop.Enabled         := False;
{if (strDoc1 = '') then
 begin
  formPgtoNFe.ShowModal;
 end; }
//-- 
if (strDoc1 = '') then
  Begin
    // DH - Dinheiro 01 / CT - Cartao / CV - Cheque a Vista 02 / CP - Cheque a Prazo 02 / EC - Ecommerce 99  /  VL - Vale 15
   if( (strTPgto <> 'DH')and(strTPgto <> 'CV')and(strTPgto <> 'CP')and(strTPgto <> 'EC')and(strTPgto <> 'VL') )then
    Begin
     formPgtoNFe.ShowModal;
    End
   else
    Begin
     if (strTPgto = 'DH') then
      begin
       formaPgto := '01';
      end;
     if( (strTPgto = 'CV')or(strTPgto = 'CP') )then
      begin
       formaPgto := '02';
      end;
     if (strTPgto = 'EC') then
      begin
       formaPgto := '99';
      end;
     if (strTPgto = 'VL') then
      begin
       formaPgto := '15';
      end;
    End;
 End;
end;

procedure TFrmEmissaoNF.btnRetornarClick(Sender: TObject);
begin
if (stsNotaE = '1') then
  Begin
   if (Application.MessageBox('FALHA AO EMITIR NF-e!   O NÚMERO DE NOTA FOI REGISTRADO.'
                   +#13 +#13 +'Encerrando o processo, você deverá VOLTAR a numeração da NF-e para alterar e/ou reimprimir.'
                   +#13 +#13 +'Deseja encerrar a emissão da nota?','A T E N Ç Ã O!',MB_YESNO) = IDYES) then
    begin
     Close;
    end;
  End
else
  Begin
   Close;
  End;
end;

procedure TFrmEmissaoNF.btnImprimeClick(Sender: TObject);
var strStatus, strPgto, strCodigoProduto, strCodProRef, strDescricao,
    strCST, strUnid, strNPedido, strCodVend, strDataBoa, strCodProd,
    Natureza, NumeroNF, DataEmissao, ClienteDest, EnderecoDest, NumeroDest,
    ComplDest, BairroDest, CEPDest, TelDest, IEDest, CodigoIBGE, CidadeDest,
    EstadoDest, CodigoProd, DescriProd, UnidadeProd, QtdeProd, VUnProd,
    VTotalProd, CFOPProd, OrigemProd, CSTProd, ModalidadeBC, UnidadeTrib,
    QtdeTrib, VTotalTrib, PercReducao, BaseICMS, ValorICMS, AliqICMS, ValorIPI,
    AliqIPI, BaseST, IcmsST, strNCM, NCMProd, vBC, vICMS, vBCST, vST, vProd,
    vFrete, vSeg, vDesc,  vII, vIPI, vPIS, vCOFINS, vOutro, vNF, strCfopMudou2,
    vPDesc, DataSaida, HoraSaida, dhCont, xJust, emailDest, emailDest2,
    emailDest3, vPOutro, indTot, xPed, nItemPed, pCredSN, vCredICMS, CRT,
    pMVAST, Especie, TransNome, TransCNPJ, TransIE, TransEndereco,
    TransUF, TransCidade, strMsgTrib, TransPlaca, TransUFPlaca, AliqST,
    PesoB, PesoL,VAliq, Volume, vTotTrib, vTTotTrib, DespAC,
    vPFrete, strConting, strEntrSaida, vTribFed, vTribEst, vTribMun : String;
    //--
    // CEST FCP Partilha
    strCodAuto, strCEST, CEST, vBCUFDest, pFCPUFDest,
    pICMSUFDest, pICMSInter, pICMSInterPart, vFCPUFDest,
    vICMSUFDest, vICMSUFRemet, TipoCli, IsentoCli : String;
    fltPrtVProd, fltPrtAliqInt, fltPrtAliqDst, fltPrtIcmsOR,
    fltPrtIcmsDS, fltPrtDIFAL, fltPartilhaOR, fltPartilhaDS, fltFCP,
    fltSomaFCP, fltSomaPrDS, fltSomaPrOR, fltAliquotaFCP : Double;
    //--
    strQtde, strQtdeEstoque, strVUnitario, strVTotal, strICMS, strPerc,
    strCredICMS, strDifCent, strPercReducao, strBaseICMS, strValorICMS,
    strAliqICMS, strBaseST, strIcmsST, fltConfDesc, difDesc, strVIPI,
    strAIPI, strCalcIcms, strPesoB, strPesoL, strvTotTrib,
    strPFrete, strPOutro, strPDespAC, strDescUn : Double;
    strNumeroNF, Contador, strConCR : Integer;
    strVencimento, strDtSaida : TDateTime;
    strAcres, strProdDesc : Currency;
    ArquivoNFe : TextFile;
    // Variáveis AcbrNFe
    strSmtpHost, strSmtpPort, strSmtpUser, strSmtpPass,
    Para, NomeArq, strAssunto, strMotivo, finNFe : String;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    txtMonitor : TextFile;
    stsRetorno : Integer;
    // Variáveis Versão 3.10 NFe
    IM, NVE, nFCI, EXTIPI, vICMSDeson, cDV,
    idDest, indFinal, indPres, indIEDest : String;
    // Versão 4.00
    sindPag, sCNPJCPF, sFrete : String;
    sDataNT : TDateTime;
    ok : boolean;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblSaida.EmptyTable;
dmBaseDados.tblSaida.Open;
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblAliquotas.Open;
dmBaseDados.tblFCP.Open;
dmBaseDados.tblPedidos.Filter   := '';
dmBaseDados.tblPedidos.Filtered := False;
dmBaseDados.tblPedidos.FindKey([mskNPedido.Text]);
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
if (strCliFinal = '') then
 begin
  dmBaseDados.tblClientes.FindKey([dmBaseDados.tblPedidosCodigoCliente.AsInteger]);
 end
else
 begin
  dmBaseDados.tblClientes.FindKey([strCliFinal]);
 end;
TipoCli   := dmBaseDados.tblClientesTipoCliente.AsString;
IsentoCli := dmBaseDados.tblClientesNumeroRG.AsString;
strPesoB    := 0;
strPesoL    := 0;
Contador    := 0;
strVolume   := 1;
strvTotTrib := 0;
strAcres    := 0;
strDifCent  := 0;
if (edtVolume.Text <> '') then
 begin                                                  
  strVolume := StrToFloat(edtVolume.Text);
 end;
if (edtPesoBruto.Text <> '') then
 begin
  strPesoB := StrToFloat(edtPesoBruto.Text);
 end;
if (edtPesoLiq.Text <> '') then
 begin
  strPesoL := StrToFloat(edtPesoLiq.Text);
 end;
while( (mskNPedido.Text = dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) )do
  Begin
   strCodigoProduto := dmBaseDados.tblPedidosCodigoReferencia.AsString;
   if (strCodigoProduto = '') then
    begin
     strCodigoProduto := dmBaseDados.tblPedidosProduto.AsString;
    end;
   strCodProd       := dmBaseDados.tblPedidosProduto.AsString;
   strDescricao     := dmBaseDados.tblPedidosDescricao.AsString;
   strPgto          := dmBaseDados.tblPedidosPagamento.AsString;
   strCST           := dmBaseDados.tblPedidosCST.AsString;
   strUnid          := dmBaseDados.tblPedidosUnidade.AsString;
   strQtde          := dmBaseDados.tblPedidosQuantidade.AsFloat;
   strVUnitario     := dmBaseDados.tblPedidosTotal.AsFloat/dmBaseDados.tblPedidosQuantidade.AsFloat;
   strVTotal        := dmBaseDados.tblPedidosTotal.AsFloat;
   strICMS          := dmBaseDados.tblPedidosICMS.AsFloat;
   strNPedido       := dmBaseDados.tblPedidosNPedido.AsString;
   strCodVend       := dmBaseDados.tblPedidosCodigoVendedor.AsString;
   strVencimento    := dmBaseDados.tblPedidosVencimento.AsDateTime;
   strStatus        := dmBaseDados.tblPedidosStatus.AsString;
   strPercReducao   := dmBaseDados.tblPedidosPercReducao.AsFloat;
   strBaseICMS      := dmBaseDados.tblPedidosBaseICMS.AsFloat;
   strValorICMS     := dmBaseDados.tblPedidosValorICMS.AsFloat;
   strAliqICMS      := dmBaseDados.tblPedidosICMS.AsFloat;
   strBaseST        := dmBaseDados.tblPedidosBaseST.AsFloat;
   strIcmsST        := dmBaseDados.tblPedidosIcmsST.AsFloat;
   strVIPI          := dmBaseDados.tblPedidosValorIPI.AsFloat;
   strAIPI          := dmBaseDados.tblPedidosIPI.AsFloat;
   strNCM           := dmBaseDados.tblPedidosNCM.AsString;
   strCEST          := dmBaseDados.tblPedidosCEST.AsString;
   strvTotTrib      := dmBaseDados.tblPedidosVTributos.AsFloat;
   {strDescon        := dmBaseDados.tblPedidosDesconto.AsCurrency;
   strDescUn        := dmBaseDados.tblPedidosDescProp.AsFloat;
   strDescon        := Arredondar(strDescon,2);
   if (strDescon < 0) then
    begin
     strAcres  := strDescon * -1;
     strDescon := 0;
    end;}
   dmBaseDados.tblPedidos.Next;
   dmBaseDados.tblLogMensal.Append;
   dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodProd;
   dmBaseDados.tblLogMensalNCM.AsString              := strNCM;
   dmBaseDados.tblLogMensalCEST.AsString             := strCEST;
   dmBaseDados.tblLogMensalDescricao.AsString        := strDescricao;
   dmBaseDados.tblLogMensalFamilia.AsString          := strCST;
   dmBaseDados.tblLogMensalUnidadeMedida.AsString    := strUnid;
   dmBaseDados.tblLogMensalQuantidade.AsFloat        := strQtde;
   dmBaseDados.tblLogMensalValorDinheiro.AsFloat     := strVUnitario;
   dmBaseDados.tblLogMensalValorLancamento.AsFloat   := strVTotal;
   dmBaseDados.tblLogMensalDiferenca.AsFloat         := strICMS;           
   dmBaseDados.tblLogMensalSubtotal.AsFloat          := strBaseICMS;
   dmBaseDados.tblLogMensalSubQtde.AsFloat           := strValorICMS;
   dmBaseDados.tblLogMensalSubPeso.AsFloat           := strBaseST;
   dmBaseDados.tblLogMensalTroco.AsFloat             := strIcmsST;
   dmBaseDados.tblLogMensalIPI.AsFloat               := strAIPI;
   dmBaseDados.tblLogMensalValorIPI.AsFloat          := strVIPI;
   dmBaseDados.tblLogMensalDesconCT.AsFloat          := strPercReducao;
   dmBaseDados.tblLogMensalDescon.AsFloat            := strAliqICMS;
   dmBaseDados.tblLogMensalEmprestimo.AsFloat        := strvTotTrib;
   dmBaseDados.tblLogMensalEcommerce.AsFloat         := (strVTotal * PercDesc)/100;
   dmBaseDados.tblLogMensalEcommerce.AsFloat         := Arredondar(dmBaseDados.tblLogMensalEcommerce.AsFloat,2);
   dmBaseDados.tblLogMensalDocumento.AsString        := strNPedido;
   dmBaseDados.tblLogMensalObservacao.AsString       := strCodigoProduto;
   dmBaseDados.tblLogMensalDataLancamento.AsDateTime := strVencimento;
   dmBaseDados.tblLogMensal.Post;
   Contador    := Contador + 1;
  End; //end do while
// Confere diferença do desconto (Caso ocorra diferença de R$0,01)
fltConfDesc := 0;
difDesc     := 0;
dmBaseDados.tblLogMensal.First;
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
   fltConfDesc := fltConfDesc + dmBaseDados.tblLogMensalEcommerce.AsFloat;
   dmBaseDados.tblLogMensal.Next;
 end;
fltConfDesc := Arredondar(fltConfDesc,2);
if (fltConfDesc > strDescon) then
 begin
  difDesc := fltConfDesc - strDescon;
  dmBaseDados.tblLogMensal.Last;
  dmBaseDados.tblLogMensal.Edit;
  dmBaseDados.tblLogMensalEcommerce.AsFloat :=  dmBaseDados.tblLogMensalEcommerce.AsFloat - difDesc;
  dmBaseDados.tblLogMensal.Post;
 end;
if (fltConfDesc < strDescon) then
 begin
  difDesc := strDescon - fltConfDesc;
  dmBaseDados.tblLogMensal.Last;
  dmBaseDados.tblLogMensal.Edit;
  dmBaseDados.tblLogMensalEcommerce.AsFloat :=  dmBaseDados.tblLogMensalEcommerce.AsFloat + difDesc;
  dmBaseDados.tblLogMensal.Post;
 end;
//--
strPFrete  := strFrete/Contador;
strPDespAC := strDespAC/Contador;
//--
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblContasReceber.IndexName := 'IndCodCli';
{dmBaseDados.tblContasReceber.Filter    := 'NumeroDocumento = '+mskNPedido.Text;
dmBaseDados.tblContasReceber.Filtered  := True;}
strNumeroNF := StrToInt(mskNrNotaFiscal.Text);
strConCR    := 0;
dmBaseDados.tblContasReceber.First;
if (dmBaseDados.tblContasReceber.Locate('NumeroDocumento',mskNPedido.Text,[loCaseInsensitive]) = True) then
 BEGIN
  while( (dmBaseDados.tblContasReceberNumeroDocumento.AsString = mskNPedido.Text)and(not dmBaseDados.tblContasReceber.Eof) )do
    Begin
     strConCR := strConCR + 1;
     dmBaseDados.tblContasReceber.Edit;
     dmBaseDados.tblContasReceberNumeroNF.AsInteger := strNumeroNF;
     if (strConCR = 1) then
      Begin
       dmBaseDados.tblContasReceberValorDocumento.AsFloat := dmBaseDados.tblContasReceberValorDocumento.AsFloat + strFrete;
       if( (strFrete > 0) ) then
        begin
         dmBaseDados.tblContasReceberObservacao.AsString := 'Valor do Frete: ' +FormatFloat('R$ 0.00',strFrete);
        end;
       {if( (strFrete = 0)and(strDespAC > 0) ) then
        begin
         dmBaseDados.tblContasReceberObservacao.AsString := 'Valor das Despesas Ac.: ' +FormatFloat('R$ 0.00',strDespAC);
        end;
       if( (strFrete > 0)and(strDespAC > 0) ) then
        begin
         dmBaseDados.tblContasReceberObservacao.AsString := 'Valor do Frete: ' +FormatFloat('R$ 0.00',strFrete) + '  /  Valor das Despesas Ac.: ' +FormatFloat('R$ 0.00',strDespAC);
        end; }
      End;
     dmBaseDados.tblContasReceber.Post;
     dmBaseDados.tblContasReceber.Next;
    End;
 END;
//--
dmBaseDados.tblANotaFiscal.First;
dmBaseDados.tblANotaFiscal.Locate('NrNF',mskNrNotaFiscal.Text,[loCaseInsensitive]);
if( (strStatus <> '0')or(strPgto = 'DV')or(strPgto = 'BO') )then
  Begin
   FrmNotaFiscal.qrtNotaFiscal.Preview;
//***-------------------------------------------------------------------------------------------------------------------------------------------------***
  //Geração do arquivo para Nota Fiscal Eletrônica...:
    dmBaseDados.tblLogMensal.First;
    strDtSaida       := StrToDate(mskDataES.Text);
    SHORTDATEFORMAT  := 'yyyy-mm-dd';
    //DataEmissao      := DateToStr(Date);
    //DataSaida        := DateToStr(strDtSaida);
    DataEmissao      := DateToStr(Date) + 'T' + mskHoraES.Text + '-02:00';
    DataSaida        := DateToStr(strDtSaida) + 'T' + mskHoraES.Text + '-02:00';
    HoraSaida        := mskHoraES.Text;
    dhCont           := '';
    xJust            := '';
    CRT              := '1';
    SHORTDATEFORMAT  := 'dd/mm/yyyy';
    DecimalSeparator := '.';
    Natureza         := Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,7,30);
    NumeroNF         := dmBaseDados.tblANotaFiscalNrNF.AsString;
    TransNome        := edtNomeTrans.Text;
    TransNome        := BuscarETroca(TransNome,'Á','A');
    TransNome        := BuscarETroca(TransNome,'Ã','A');
    TransNome        := BuscarETroca(TransNome,'À','A');
    TransNome        := BuscarETroca(TransNome,'É','E');
    TransNome        := BuscarETroca(TransNome,'Ê','E');
    TransNome        := BuscarETroca(TransNome,'Í','I');
    TransNome        := BuscarETroca(TransNome,'Ó','O');
    TransNome        := BuscarETroca(TransNome,'Ô','O');
    TransNome        := BuscarETroca(TransNome,'Õ','O');
    TransNome        := BuscarETroca(TransNome,'Ú','U');
    TransNome        := BuscarETroca(TransNome,'Ü','U');
    TransNome        := BuscarETroca(TransNome,'Ç','C');
    TransNome        := BuscarETroca(TransNome,'€','C');
    TransNome        := BuscarETroca(TransNome,'§','');
    TransCNPJ        := edtCNPJTrans.Text;
    TransCNPJ        := BuscarETroca(TransCNPJ,'-','');
    TransCNPJ        := BuscarETroca(TransCNPJ,'.','');
    TransCNPJ        := BuscarETroca(TransCNPJ,'/','');
    TransCNPJ        := BuscarETroca(TransCNPJ,'\','');
    TransIE          := edtInscTrans.Text;
    TransIE          := BuscarETroca(TransIE,'-','');
    TransIE          := BuscarETroca(TransIE,'.','');
    TransIE          := BuscarETroca(TransIE,'/','');
    TransIE          := BuscarETroca(TransIE,'\','');
    TransEndereco    := edtEndTrans.Text;
    TransEndereco    := BuscarETroca(TransEndereco,'Á','A');
    TransEndereco    := BuscarETroca(TransEndereco,'Ã','A');
    TransEndereco    := BuscarETroca(TransEndereco,'À','A');
    TransEndereco    := BuscarETroca(TransEndereco,'É','E');
    TransEndereco    := BuscarETroca(TransEndereco,'Ê','E');
    TransEndereco    := BuscarETroca(TransEndereco,'Í','I');
    TransEndereco    := BuscarETroca(TransEndereco,'Ó','O');
    TransEndereco    := BuscarETroca(TransEndereco,'Ô','O');
    TransEndereco    := BuscarETroca(TransEndereco,'Õ','O');
    TransEndereco    := BuscarETroca(TransEndereco,'Ú','U');
    TransEndereco    := BuscarETroca(TransEndereco,'Ü','U');
    TransEndereco    := BuscarETroca(TransEndereco,'Ç','C');
    TransEndereco    := BuscarETroca(TransEndereco,'€','C');
    TransEndereco    := BuscarETroca(TransEndereco,'§','');
    TransUF          := edtEstadoTrans.Text;      
    TransCidade      := edtCidadeTrans.Text;
    TransCidade      := BuscarETroca(TransCidade,'Á','A');
    TransCidade      := BuscarETroca(TransCidade,'Ã','A');
    TransCidade      := BuscarETroca(TransCidade,'À','A');
    TransCidade      := BuscarETroca(TransCidade,'É','E');
    TransCidade      := BuscarETroca(TransCidade,'Ê','E');
    TransCidade      := BuscarETroca(TransCidade,'Í','I');
    TransCidade      := BuscarETroca(TransCidade,'Ó','O');
    TransCidade      := BuscarETroca(TransCidade,'Ô','O');
    TransCidade      := BuscarETroca(TransCidade,'Õ','O');
    TransCidade      := BuscarETroca(TransCidade,'Ú','U');
    TransCidade      := BuscarETroca(TransCidade,'Ü','U');
    TransCidade      := BuscarETroca(TransCidade,'Ç','C');
    TransCidade      := BuscarETroca(TransCidade,'€','C');
    TransCidade      := BuscarETroca(TransCidade,'§','');
    TransPlaca       := edtPlaca.Text;
    TransPlaca       := BuscarETroca(TransPlaca,'-','');
    TransPlaca       := BuscarETroca(TransPlaca,'.','');
    TransPlaca       := BuscarETroca(TransPlaca,'/','');
    TransPlaca       := BuscarETroca(TransPlaca,'\','');
    TransPlaca       := BuscarETroca(TransPlaca,'_','');
    TransUFPlaca     := edtPlacaUF.Text;
    PesoB            := FormatFloat('0.000',strPesoB);
    PesoL            := FormatFloat('0.000',strPesoL);
    Volume           := FloatToStr(strVolume);
    ClienteDest      := dmBaseDados.tblClientesNomeCliente.AsString +'   '+ dmBaseDados.tblClientesCodigoCliente.AsString ;
    ClienteDest      := BuscarETroca(ClienteDest,'Á','A');
    ClienteDest      := BuscarETroca(ClienteDest,'Ã','A');
    ClienteDest      := BuscarETroca(ClienteDest,'À','A');
    ClienteDest      := BuscarETroca(ClienteDest,'É','E');
    ClienteDest      := BuscarETroca(ClienteDest,'Ê','E');
    ClienteDest      := BuscarETroca(ClienteDest,'Í','I');
    ClienteDest      := BuscarETroca(ClienteDest,'Ó','O');
    ClienteDest      := BuscarETroca(ClienteDest,'Ô','O');
    ClienteDest      := BuscarETroca(ClienteDest,'Õ','O');
    ClienteDest      := BuscarETroca(ClienteDest,'Ú','U');
    ClienteDest      := BuscarETroca(ClienteDest,'Ü','U');
    ClienteDest      := BuscarETroca(ClienteDest,'Ç','C');
    ClienteDest      := BuscarETroca(ClienteDest,'€','C');
    ClienteDest      := BuscarETroca(ClienteDest,'§','');
    EnderecoDest     := dmBaseDados.tblClientesEnderecoResidencia.AsString;
    EnderecoDest     := BuscarETroca(EnderecoDest,'Á','A');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ã','A');
    EnderecoDest     := BuscarETroca(EnderecoDest,'À','A');
    EnderecoDest     := BuscarETroca(EnderecoDest,'É','E');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ê','E');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Í','I');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ó','O');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ô','O');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Õ','O');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ú','U');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ü','U');
    EnderecoDest     := BuscarETroca(EnderecoDest,'Ç','C');
    EnderecoDest     := BuscarETroca(EnderecoDest,'€','C');
    EnderecoDest     := BuscarETroca(EnderecoDest,'§','');
    BairroDest       := dmBaseDados.tblClientesBairro.AsString;
    BairroDest       := BuscarETroca(BairroDest,'Á','A');
    BairroDest       := BuscarETroca(BairroDest,'Ã','A');
    BairroDest       := BuscarETroca(BairroDest,'À','A');
    BairroDest       := BuscarETroca(BairroDest,'É','E');
    BairroDest       := BuscarETroca(BairroDest,'Ê','E');
    BairroDest       := BuscarETroca(BairroDest,'Í','I');
    BairroDest       := BuscarETroca(BairroDest,'Ó','O');
    BairroDest       := BuscarETroca(BairroDest,'Ô','O');
    BairroDest       := BuscarETroca(BairroDest,'Õ','O');
    BairroDest       := BuscarETroca(BairroDest,'Ú','U');
    BairroDest       := BuscarETroca(BairroDest,'Ü','U');
    BairroDest       := BuscarETroca(BairroDest,'Ç','C');
    BairroDest       := BuscarETroca(BairroDest,'€','C');
    BairroDest       := BuscarETroca(BairroDest,'§','');
    CidadeDest       := dmBaseDados.tblClientesCidade.AsString;
    CidadeDest       := BuscarETroca(CidadeDest,'Á','A');
    CidadeDest       := BuscarETroca(CidadeDest,'Ã','A');
    CidadeDest       := BuscarETroca(CidadeDest,'À','A');
    CidadeDest       := BuscarETroca(CidadeDest,'É','E');
    CidadeDest       := BuscarETroca(CidadeDest,'Ê','E');
    CidadeDest       := BuscarETroca(CidadeDest,'Í','I');
    CidadeDest       := BuscarETroca(CidadeDest,'Ó','O');
    CidadeDest       := BuscarETroca(CidadeDest,'Ô','O');
    CidadeDest       := BuscarETroca(CidadeDest,'Õ','O');
    CidadeDest       := BuscarETroca(CidadeDest,'Ú','U');
    CidadeDest       := BuscarETroca(CidadeDest,'Ü','U');
    CidadeDest       := BuscarETroca(CidadeDest,'Ç','C');
    CidadeDest       := BuscarETroca(CidadeDest,'€','C');
    CidadeDest       := BuscarETroca(CidadeDest,'§','');
    NumeroDest       := dmBaseDados.tblClientesNumero.AsString;
    if( (NumeroDest = '')or(NumeroDest = '0') )then
     begin
      NumeroDest := 'S/N';
     end;
    ComplDest        := dmBaseDados.tblClientesComplemento.AsString;
    ComplDest        := BuscarETroca(ComplDest,'Á','A');
    ComplDest        := BuscarETroca(ComplDest,'Ã','A');
    ComplDest        := BuscarETroca(ComplDest,'À','A');
    ComplDest        := BuscarETroca(ComplDest,'É','E');
    ComplDest        := BuscarETroca(ComplDest,'Ê','E');
    ComplDest        := BuscarETroca(ComplDest,'Í','I');
    ComplDest        := BuscarETroca(ComplDest,'Ó','O');
    ComplDest        := BuscarETroca(ComplDest,'Ô','O');
    ComplDest        := BuscarETroca(ComplDest,'Õ','O');
    ComplDest        := BuscarETroca(ComplDest,'Ú','U');
    ComplDest        := BuscarETroca(ComplDest,'Ü','U');
    ComplDest        := BuscarETroca(ComplDest,'Ç','C');
    ComplDest        := BuscarETroca(ComplDest,'€','C');
    ComplDest        := BuscarETroca(ComplDest,'§','');
    CEPDest          := dmBaseDados.tblClientesCEP.AsString;
    CEPDest          := BuscarETroca(CEPDest,'-','');
    CEPDest          := BuscarETroca(CEPDest,'.','');
    CEPDest          := BuscarETroca(CEPDest,' ','');
    TelDest          := dmBaseDados.tblClientesTelefone.AsString;
    TelDest          := BuscarETroca(TelDest,'.','');
    TelDest          := BuscarETroca(TelDest,'(','');
    TelDest          := BuscarETroca(TelDest,')','');
    TelDest          := BuscarETroca(TelDest,'-','');
    TelDest          := BuscarETroca(TelDest,' ','');
    IEDest           := dmBaseDados.tblClientesNumeroRG.AsString;
    IEDest           := BuscarETroca(IEDest,'.','');
    IEDest           := BuscarETroca(IEDest,'-','');
    IEDest           := BuscarETroca(IEDest,' ','');
    CodigoIBGE       := dmBaseDados.tblClientesCodigoIBGE.AsString;
    EstadoDest       := dmBaseDados.tblClientesEstado.AsString;
    emailDest        := dmBaseDados.tblClientesEmail.AsString;
    //vPDesc           := FormatFloat('0.00',strProdDesc);
    //AssignFile(ArquivoNFe, 'F:\NFe\'+strNPedido+'.txt');
    //Rewrite(ArquivoNFe);

      cDV      := '';
      idDest   := '1'; // 1 Operação interna;  2 Operação interestadual;  3 Operação com exterior.
      finNFe   := '1'; // 1 NF-e normal  /  2 NF-e complementar / 3 NF-e de ajuste / 4 Devolução de mercadoria.
      indFinal := '0';
      if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
       begin
        indFinal := '1';
       end;
      if( (dmBaseDados.tblClientesNumeroRG.AsString = 'ISENTO')
      and((EstadoDest = 'AM')or(EstadoDest = 'BA')or(EstadoDest = 'CE')
       or (EstadoDest = 'GO')or(EstadoDest = 'MG')or(EstadoDest = 'MS')
       or (EstadoDest = 'MT')or(EstadoDest = 'PE')or(EstadoDest = 'RN')or(EstadoDest = 'SE')) )then
       begin
        indFinal := '1';
       end;
      indPres  := '9'; // 0 Não se aplica (por exemplo, Nota Fiscal complementar ou de ajuste);  1 Operação presencial;  2 Operação não presencial, pela Internet;  3 Operação não presencial, Teleatendimento;  4 NFC-e em operação com entrega a domicílio;  9 Operação não presencial, outros.
      if (EstadoDest <> 'SP') then
       begin
        idDest := '2';
       end;
      strEntrSaida := '1'; // Nota Saída
      if( (Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,1,5) = '1.202') )then
       begin
        strEntrSaida := '0'; // Nota Entrada
        finNFe       := '4';
       end;
      if( (Copy(cmbCfop.Text,1,5) = '5.202')or(Copy(cmbCfop.Text,1,5) = '6.202') )then
       begin
        finNFe       := '4';
       end;
     //--
      if (ckbAVista.Checked = True) then
       begin
        sindPag := '0';
       end
      else
       begin
        sindPag := '1';
       end;
    //--
    // 4.00 Dados da Nota
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
    with (ACBrNFe1.NotasFiscais.Add.NFe) do
      BEGIN
       Ide.cNF      := StrToInt(mskNPedido.Text);                               // dmNFe.qNFeCNF.AsInteger; //(leNumeroNFe2.Text); //Caso nÃ£o seja preenchido serÃ¡ gerado um nÃºmero aleatÃ³rio pelo componente
       Ide.natOp    := Natureza;                                                // dmNFe.qNFeNatOp.AsString; //leNaturezaOperacao.Text;
       Ide.modelo   := 55;
       Ide.serie    := 1;                                                       // dmNFe.qNFeSerie.AsInteger; //StrToInt(leSerie.Text);
       Ide.nNF      := StrToInt(NumeroNF);                                      // dmNFe.qNFeNNF.AsInteger; //StrToInt(leNumeroNFe2.Text);
       Ide.dEmi     := StrToDateTime(sDataEmissao  +' '+sHoraEmissao);          // dmNFe.qNFeDEmi.AsDateTime; //Date;
       Ide.dSaiEnt  := StrToDateTime(mskDataES.Text+' '+mskHoraES.Text);        // dmNFe.qNFeDSaiEnt.AsDateTime; //Date;
       Ide.hSaiEnt  := Time;
       Ide.tpNF     := tnSaida;                                                 // TpcnTipoNFe(dmNFe.qNFeTpNF.AsInteger); //cbTipoDocumento.ItemIndex);
       Ide.idDest   := StrToDestinoOperacao(ok,idDest);                         // TpcnDestinoOperacao(StrToInt(idDest));    // TpcnDestinoOperacao(dmNFe.qNFeIdDest.AsInteger); //cbDestinoOperacao.ItemIndex);
       Ide.tpEmis   := teNormal;                                                // TpcnTipoEmissao(Ini.ReadInteger('Geral','FormaEmissao',0));
       Ide.TpAmb    := taProducao;                                              // TpcnTipoAmbiente(Ini.ReadInteger('WebService','Ambiente',0)); //taHomologacao; //Lembre-se de trocar esta variÃ¡vel quando for para ambiente de produÃ§Ã£o    XXXXXX   AQUI
       Ide.verProc  := '1.0.0.0';                                               // Versão do seu sistema
       Ide.cUF      := 35;                                                      // UFtoCUF(Ini.ReadString('Emitente','UF',''));
       Ide.cMunFG   := 3534401;                                                 // Ini.ReadInteger('Emitente','CodCidade',0);
       Ide.finNFe   := StrToFinNFe(ok,finNFe);                                  // TpcnFinalidadeNFe(dmNFe.qNFeFinNFe.AsInteger); //cbFinalidadeEmissao.ItemIndex);
       Ide.indPres  := StrToPresencaComprador(ok,indPres);                      // TpcnPresencaComprador(dmNFe.qNFeIndPres.AsInteger); //cbTipoAtendimento.ItemIndex);
       Ide.indFinal := StrToConsumidorFinal(ok,indFinal);                       // TpcnConsumidorFinal(dmNFe.qNFeIndFinal.AsInteger); //cbConsumidorFinal.ItemIndex);

      if( (Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,1,5) = '1.202')
       or (Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,1,5) = '5.202')
       or (Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,1,5) = '6.202') )then
        begin
         Ide.NFref.Add.refNFe := edtChaveFornec.Text;
        end;

       // 4.00 Dados Emitente
       Emit.CNPJCPF           := '61429791000164';
       Emit.IE                := '492200974112';
       Emit.xNome             := 'AUTO PECAS E ACESSORIOS PERFIL LTDA - ME';
       Emit.xFant             := '';

       Emit.EnderEmit.fone    := '';                       
       Emit.EnderEmit.CEP     := 06060003;
       Emit.EnderEmit.xLgr    := 'AVENIDA ANALICE SAKATAUSKAS';
       Emit.EnderEmit.nro     := '580';
       Emit.EnderEmit.xCpl    := '';
       Emit.EnderEmit.xBairro := 'V N OSASCO';
       Emit.EnderEmit.cMun    := 3534401;
       Emit.EnderEmit.xMun    := 'OSASCO';
       Emit.EnderEmit.UF      := 'SP';
       Emit.enderEmit.cPais   := 1058;
       Emit.enderEmit.xPais   := 'BRASIL';

       Emit.IEST              := '';
       Emit.IM                := '';                 // Preencher no caso de existir serviços na nota
       Emit.CNAE              := '';                 // Verifique na cidade do emissor da NFe se é permitido a inclusão de serviços na NFe
       Emit.CRT               := crtSimplesNacional; // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)


      if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
       begin
        indIEDest := '9';
       end
      else
       begin
        if( (dmBaseDados.tblClientesNumeroRG.AsString <> 'ISENTO')and(dmBaseDados.tblClientesNumeroRG.AsString <> 'ISENTA')
         and(dmBaseDados.tblClientesNumeroRG.AsString <> 'isento')and(dmBaseDados.tblClientesNumeroRG.AsString <> 'isenta')
         and(dmBaseDados.tblClientesNumeroRG.AsString <> 'Isento')and(dmBaseDados.tblClientesNumeroRG.AsString <> 'Isenta')  )then
         begin
          indIEDest := '1';
         end
        else
         begin
          indIEDest := '2';
          if (indFinal = '1') then
           begin
            indIEDest := '9';
           end;
         end;
       end;

      //--
       if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
        begin
         sCNPJCPF := strCPF;
         IEDest   := '';
        end
       else
        begin
         sCNPJCPF := strCNPJ;
         if (dmBaseDados.tblClientesNumeroRG.AsString = 'ISENTO') then
          begin
           IEDest := '';
          end;
        end;
       if (CEPDest = '') then
        begin
         CEPDest := '0';
        end;
       if (CodigoIBGE = '') then
        begin
         CodigoIBGE := '0';
        end;
       //--
       // 4.00 Dados Cliente Destinatário
       Dest.CNPJCPF           := sCNPJCPF;
       Dest.IE                := IEDest;
       Dest.ISUF              := '';
       Dest.xNome             := ClienteDest;
       // alterar
       if (indIEDest = '1') then
        begin
         Dest.indIEDest       := inContribuinte; //TpcnindIEDest(StrToInt(indIEDest));
        end;
       if (indIEDest = '2') then
        begin
         Dest.indIEDest       := inIsento;
        end;
       if (indIEDest = '9') then
        begin
         Dest.indIEDest       := inNaoContribuinte;
        end;
       //--
       Dest.EnderDest.Fone    := TelDest;
       Dest.EnderDest.CEP     := StrToInt(CEPDest);
       Dest.EnderDest.xLgr    := EnderecoDest;
       Dest.EnderDest.nro     := NumeroDest;
       Dest.EnderDest.xCpl    := ComplDest;
       Dest.EnderDest.xBairro := BairroDest;
       Dest.EnderDest.cMun    := StrToInt(CodigoIBGE);
       Dest.EnderDest.xMun    := CidadeDest;
       Dest.EnderDest.UF      := EstadoDest;
       Dest.EnderDest.cPais   := 1058;
       Dest.EnderDest.xPais   := 'BRASIL';
       Dest.Email             := emailDest;

      Contador    := 0;
      fltConfDesc := 0;
      while (not dmBaseDados.tblLogMensal.Eof) do
        Begin
         strCfopMudou2 := '0';
         Contador     := Contador + 1 ;
         CodigoProd   := dmBaseDados.tblLogMensalObservacao.AsString; // cod referencia
         DescriProd   := dmBaseDados.tblLogMensalDescricao.AsString;
         DescriProd   := BuscarETroca(DescriProd,'Á','A');
         DescriProd   := BuscarETroca(DescriProd,'Ã','A');
         DescriProd   := BuscarETroca(DescriProd,'À','A');
         DescriProd   := BuscarETroca(DescriProd,'É','E');
         DescriProd   := BuscarETroca(DescriProd,'Ê','E');
         DescriProd   := BuscarETroca(DescriProd,'Í','I');
         DescriProd   := BuscarETroca(DescriProd,'Ó','O');
         DescriProd   := BuscarETroca(DescriProd,'Ô','O');
         DescriProd   := BuscarETroca(DescriProd,'Õ','O');
         DescriProd   := BuscarETroca(DescriProd,'Ú','U');
         DescriProd   := BuscarETroca(DescriProd,'Ü','U');
         DescriProd   := BuscarETroca(DescriProd,'Ç','C');
         DescriProd   := BuscarETroca(DescriProd,'€','C');
         DescriProd   := BuscarETroca(DescriProd,'§','');
         DescriProd   := BuscarETroca(DescriProd,'º','.');
         DescriProd   := BuscarETroca(DescriProd,'ª','.');
         NCMProd      := dmBaseDados.tblLogMensalNCM.AsString;
         NCMProd      := BuscarETroca(NCMProd,'.','');
         NCMProd      := BuscarETroca(NCMProd,'-','');
         NCMProd      := BuscarETroca(NCMProd,'/','');
         NCMProd      := BuscarETroca(NCMProd,',','');
         CFOPProd     := ( Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,1,1) + Copy(dmBaseDados.tblANotaFiscalCFOP.AsString,3,3) );
         UnidadeProd  := dmBaseDados.tblLogMensalUnidadeMedida.AsString;
         UnidadeProd  := BuscarETroca(UnidadeProd,'€','C');
         UnidadeProd  := BuscarETroca(UnidadeProd,'§','');
         UnidadeTrib  := dmBaseDados.tblLogMensalUnidadeMedida.AsString;
         UnidadeTrib  := BuscarETroca(UnidadeTrib,'€','C');
         UnidadeTrib  := BuscarETroca(UnidadeTrib,'§','');
         QtdeProd     := FormatFloat('0.0000',dmBaseDados.tblLogMensalQuantidade.AsFloat);
         QtdeTrib     := FormatFloat('0.0000',dmBaseDados.tblLogMensalQuantidade.AsFloat);
         VUnProd      := FormatFloat('0.0000',dmBaseDados.tblLogMensalValorDinheiro.AsFloat);
         VTotalProd   := FormatFloat('0.00',dmBaseDados.tblLogMensalValorLancamento.AsFloat);
         VTotalTrib   := FormatFloat('0.0000',dmBaseDados.tblLogMensalValorDinheiro.AsFloat);
         PercReducao  := FormatFloat('0.00',dmBaseDados.tblLogMensalDesconCT.AsFloat);
         BaseICMS     := FormatFloat('0.00',dmBaseDados.tblLogMensalSubtotal.AsFloat);
         ValorICMS    := FormatFloat('0.00',dmBaseDados.tblLogMensalSubQtde.AsFloat);
         BaseST       := '0.00'; //FormatFloat('0.00',dmBaseDados.tblLogMensalSubPeso.AsFloat);
         IcmsST       := '0.00'; //FormatFloat('0.00',dmBaseDados.tblLogMensalTroco.AsFloat);
         AliqICMS     := FormatFloat('0.00',dmBaseDados.tblLogMensalDescon.AsFloat);
         ValorIPI     := FormatFloat('0.00',dmBaseDados.tblLogMensalValorIPI.AsFloat);
         AliqIPI      := FormatFloat('0.00',dmBaseDados.tblLogMensalIPI.AsFloat);
         vTotTrib     := FormatFloat('0.00',dmBaseDados.tblLogMensalEmprestimo.AsFloat);
         CSTProd      := dmBaseDados.tblLogMensalFamilia.AsString;
         CEST         := dmBaseDados.tblLogMensalCEST.AsString;
         OrigemProd   := '0';
         ModalidadeBC := '3';
         strPerc      := PercIcms;                                                     
         pCredSN      := FormatFloat('0.00',strPerc);
         vCredICMS    := FormatFloat('0.00',dmBaseDados.tblLogMensalValorLancamento.AsFloat*(strPerc/100));
         vPFrete      := FormatFloat('0.00',strPFrete);
         vPOutro      := FormatFloat('0.00',strPDespAC);
         vPDesc       := FormatFloat('0.00',dmBaseDados.tblLogMensalEcommerce.AsFloat);
         {if (strAcres > 0) then
          begin
           //vPOutro    := FormatFloat('0.00',strPDespAC + dmBaseDados.tblLogMensalEcommerce.AsFloat);
           vPOutro    := FormatFloat('0.00',strPDespAC);
          end;
         if (strDescon > 0) then
          begin
           vPDesc     := FormatFloat('0.00',dmBaseDados.tblLogMensalEcommerce.AsFloat);
          end; }
         if (vPDesc = '0.00') then
          begin
           vPDesc := '';
          end;
         if (vPOutro = '0.00') then
          begin
           vPOutro := '';
          end;
         if (dmBaseDados.tblLogMensalCodigoProduto.AsString <> '') then
           begin
            //Gravando dados do produto...:
            dmBaseDados.tblProdutos.First;
            if (dmBaseDados.tblProdutos.Locate('Codigo',dmBaseDados.tblLogMensalCodigoProduto.AsString,[loCaseInsensitive]) = TRUE) then
             Begin
              if( (CSTProd = '010')and(dmBaseDados.tblProdutosSituacaoTributaria.AsString = '060') ) then
               begin
                strCfopMudou2 := '1';
               end;
              if( (CSTProd = '210')and(dmBaseDados.tblProdutosSituacaoTributaria.AsString = '260') ) then
               begin
                strCfopMudou2 := '1';
               end;
              if( (CFOPProd <> '5202')and(CFOPProd <> '6202')and(CFOPProd <> '5915')
              and (CFOPProd <> '6915')and(CFOPProd <> '5949')and(CFOPProd <> '6949')and(CFOPProd <> '1202') )then
               begin
                CFOPProd := dmBaseDados.tblProdutosCFOP.AsString;
                if (EstadoDest <> 'SP') then
                 begin
                  CFOPProd := '6'+ Copy(dmBaseDados.tblProdutosCFOP.AsString,2,3);
                 end;
               end;
              if( (CFOPProd = '5202')and((CSTProd = '060')or(CSTProd = '260')) )then
               begin
                CFOPProd := '5411';
                if (EstadoDest <> 'SP') then
                 begin
                  CFOPProd := '6411';
                 end;
               end;
             End; // if do fim da gravação dos CFOPs.
            if (CFOPProd = '6405') then
             begin
              CFOPProd := '6404';
             end;
            if (EstadoDest <> 'SP') then
             begin
              CFOPProd := '6'+ Copy(CFOPProd,2,3);
             end;
            DescriProd := Copy(DescriProd,1,42);
            //vPOutro    := '';
            //vPFrete    := '';
            DespAC     := '';
            indTot     := '1';
            xPed       := edtNPedCompra.Text;
            nItemPed   := '';
            {if( (strDespAC > 0)or(strAcres > 0) )then
             begin
              vPOutro := FormatFloat('0.00',strPOutro);
             end;
            if (strFrete > 0) then
             begin
              vPFrete := FormatFloat('0.00',strPFrete);
             end; }
            AliqST := AliqICMS;
            if( (CEST <> '') and ((Copy(CSTProd,2,2) = '10')or(Copy(CSTProd,2,2) = '30')or(Copy(CSTProd,2,2) = '60')or(Copy(CSTProd,2,2) = '70')or(Copy(CSTProd,2,2) = '90')) )then
             begin
              Writeln(ArquivoNFe, 'I05c|'  +CEST+'|');
             end;

            //--
            if (vPDesc = '') then
             begin
              vPDesc := '0';
             end;
            if (vPOutro = '') then
             begin
              vPOutro := '0';
             end;
            if (vPFrete = '') then
             begin
              vPFrete    := '0';
             end;
            //--
             // 4.00 Dados Item
             with Det.Add do
              Begin
               Prod.nItem    := Contador;
               Prod.cProd    := CodigoProd;

               Prod.xProd    := DescriProd;
               Prod.NCM      := NCMProd;
               Prod.uCom     := UnidadeProd;
               Prod.qCom     := StrToFloat(QtdeProd);
               Prod.vUnCom   := StrToFloat(VUnProd);
               Prod.vProd    := StrToFloat(VTotalProd);
               Prod.EXTIPI   := '';
               Prod.CEST     := CEST;
               Prod.CFOP     := CFOPProd;
               Prod.uTrib    := UnidadeProd;
               Prod.qTrib    := StrToFloat(QtdeProd);
               Prod.vUnTrib  := StrToFloat(VUnProd);
               Prod.vSeg     := 0.00;
               Prod.vDesc    := StrToFloat(vPDesc);
               Prod.vFrete   := StrToFloat(vPFrete);

               if (Copy(dmBaseDados.tblProdutosCodigoBarra.AsString,1,3) = '789')
               or (Copy(dmBaseDados.tblProdutosCodigoBarra.AsString,1,3) = '790') then
                begin
                 Prod.cEAN     := dmBaseDados.tblProdutosCodigoBarra.AsString;
                 Prod.cEANTrib := dmBaseDados.tblProdutosCodigoBarra.AsString;
                end
               else
                begin
                 Prod.cEAN     := 'SEM GTIN';
                 Prod.cEANTrib := 'SEM GTIN';
                end;

               Prod.vOutro   := StrToFloat(vPOutro);

               Prod.xPed     := xPed;
               Prod.nItemPed := nItemPed;

               Prod.nFCI     := nFCI;

               // NovaTag 4.00 ****
               //--
               //Prod.indEscala := 'S'; // Indicador de Produção em escala relevante, conforme Cláusula 23 do Convenio ICMS 52/2017: S - Produzido em Escala Relevante; N – Produzido em Escala NÃO Relevante. Nota: preenchimento obrigatório para produtos com NCM relacionado no Anexo XXVII do Convenio 52/2017
               //Prod.CNPJFab   := '';  // CNPJ do Fabricante da Mercadoria, obrigatório para produto em escala NÃO relevante.
               // Quando for informar IPI devolução ****
               //pDevol    := percDevol;
               //vIPIDevol := valorIPIDevol;
               // --


               // 4.00
               Imposto.vTotTrib := StrToFloat(vTotTrib);

               {
               Imposto.ICMS.CSOSN   := csosn101;
               Imposto.ICMS.orig    := oeNacional;
               Imposto.ICMS.modBC   := dbiValorOperacao;
               Imposto.ICMS.vBC     := 100;
               Imposto.ICMS.pICMS   := 18;
               Imposto.ICMS.vICMS   := 18;
               Imposto.ICMS.modBCST := dbisMargemValorAgregado;
               Imposto.ICMS.pMVAST  := 0;
               Imposto.ICMS.pRedBCST:= 0;
               Imposto.ICMS.vBCST   := 0;
               Imposto.ICMS.pICMSST := 0;
               Imposto.ICMS.vICMSST := 0;
               Imposto.ICMS.pRedBC  := 0;

               // NovaTag  Versão 4.00  ****
               //--
               Imposto.ICMS.vBCFCP := 0;       // Base Cálculo FCP
               Imposto.ICMS.pFCP   := 0;       // Percentual FCP(máx 2%(1,00 / 1,5 / 2,00))
               Imposto.ICMS.vFCP   := 0;       // Valor do FCP
               // FCP - ST
               Imposto.ICMS.vBCFCPST := 0;     // Base Cálculo FCP - ST
               Imposto.ICMS.pFCPST   := 0;     // Percentual FCP - ST(máx 2%(1,00 / 1,5 / 2,00))
               Imposto.ICMS.vFCPST   := 0;     // Valor do FCP - ST
               // FCP - ST Retido Anteriormente
               Imposto.ICMS.vBCFCPSTRet := 0;  // Base Cálculo FCP - ST Retido Anteriormente
               Imposto.ICMS.pFCPSTRet   := 0;  // Percentual FCP - ST Ret. Ant.(máx 2%(1,00 / 1,5 / 2,00))
               Imposto.ICMS.vFCPSTRet   := 0;  // Valor do FCP - ST Retido Anteriormente
               //--
               }

            OrigemProd := Copy(CSTProd,1,1);
            // Não tributada, pois é simples nacional :
            // 000 / 020
            if( (Copy(CSTProd,2,2) = '00')or(Copy(CSTProd,2,2) = '20') )then
             Begin
              if (TipoCli <> 'CPF') then
               Begin
                //4.00
                Imposto.ICMS.CSOSN       := csosn101;
                Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
                Imposto.ICMS.pCredSN     := StrToFloat(pCredSN);
                Imposto.ICMS.vCredICMSSN := StrToFloat(vCredICMS);
               End
              else
               Begin
                //4.00
                Imposto.ICMS.CSOSN       := csosn102;
                Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
               End;
             End;
            // 010
            if (Copy(CSTProd,2,2) = '10') then
              begin
               OrigemProd   := '0';
               ModalidadeBC := '4';
               pMVAST       := '';
               AliqST       := '0.00';
               //4.00
               Imposto.ICMS.CSOSN       := csosn201;
               Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
               Imposto.ICMS.modBCST     := StrTomodBCST(ok,ModalidadeBC);
               Imposto.ICMS.pMVAST      := 0;
               Imposto.ICMS.pRedBCST    := 0;
               Imposto.ICMS.vBCST       := 0;
               Imposto.ICMS.pICMSST     := 0;
               Imposto.ICMS.vICMSST     := 0;
               Imposto.ICMS.pRedBC      := 0;
               Imposto.ICMS.pCredSN     := StrToFloat(pCredSN);
               Imposto.ICMS.vCredICMSSN := StrToFloat(vCredICMS);
              end;
            // 040 / 041 / 050 / 051
            if (Copy(CSTProd,2,2) = '40')or(Copy(CSTProd,2,2) = '41')or(Copy(CSTProd,2,2) = '50')or(Copy(CSTProd,2,2) = '51') then
              begin
               //4.00
               Imposto.ICMS.CSOSN       := csosn102;
               Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
              end;
            // 060 / 070
            if( (Copy(CSTProd,2,2) = '60')or(Copy(CSTProd,2,2) = '70') )then
              begin
               ModalidadeBC := '';
               //4.00
               Imposto.ICMS.CSOSN   := csosn500;
               Imposto.ICMS.orig    := oeNacional; //StrToOrig(ok,OrigemProd);
               Imposto.ICMS.modBCST := StrTomodBCST(ok,ModalidadeBC);
               Imposto.ICMS.vBCST   := StrToFloat(BaseST);
               Imposto.ICMS.vICMSST := StrToFloat(IcmsST);
              end;

            //4.00  PIS
            Imposto.PIS.CST  := pis07;

            //4.00  COFINS
            Imposto.COFINS.CST  := cof07;


            // PARTILHA ICMS LEI 2016 CEST
            if( (EstadoDest <> 'SP')and((TipoCli = 'CPF')or(IsentoCli = 'ISENTO')) )then
              Begin
               dmBaseDados.tblAliquotas.First;
               dmBaseDados.tblAliquotas.Locate('Estado',EstadoDest,[loCaseInsensitive]);
               fltAliquotaFCP := 0;
               if (dmBaseDados.tblFCP.Locate('Auto;UF',VarArrayOf([dmBaseDados.tblLogMensalCodigoProduto.AsString,EstadoDest]),[loCaseInsensitive]) = TRUE) then
                begin
                 fltAliquotaFCP := dmBaseDados.tblFCPAliquotaFCP.AsFloat;
                end;

               fltPrtVProd   := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
               fltPrtAliqInt := dmBaseDados.tblAliquotasAliqInterE.AsFloat/100;  // Alíquota InterEstadual
               fltPrtAliqDst := dmBaseDados.tblAliquotasInterna.AsFloat/100;     // Alíquota Interna do Destino
               fltPrtIcmsOR  := fltPrtVProd * fltPrtAliqInt;
               fltPrtIcmsDS  := fltPrtVProd * fltPrtAliqDst;
               fltPrtDIFAL   := fltPrtIcmsDS - fltPrtIcmsOR;
               fltPartilhaOR := fltPrtDIFAL * 0.60;
               fltPartilhaDS := fltPrtDIFAL * 0.40;
               fltFCP        := fltPrtVProd * (fltAliquotaFCP/100);

               fltPrtIcmsOR  := Arredondar(fltPrtIcmsOR,2);
               fltPrtIcmsDS  := Arredondar(fltPrtIcmsDS,2);
               fltPrtDIFAL   := Arredondar(fltPrtDIFAL,2);
               fltPartilhaOR := Arredondar(fltPartilhaOR,2);
               fltPartilhaDS := Arredondar(fltPartilhaDS,2);
               fltFCP        := Arredondar(fltFCP,2);


               vBCUFDest      := FormatFloat('0.00',fltPrtVProd);
               pFCPUFDest     := FormatFloat('0.00',fltAliquotaFCP); //*/****
               pICMSUFDest    := FormatFloat('0.00',dmBaseDados.tblAliquotasInterna.AsFloat);
               pICMSInter     := FormatFloat('0.00',dmBaseDados.tblAliquotasAliqInterE.AsFloat);
               pICMSInterPart := '40.00';
               vFCPUFDest     := FormatFloat('0.00',fltFCP);;
               vICMSUFDest    := FormatFloat('0.00',fltPartilhaDS);
               vICMSUFRemet   := FormatFloat('0.00',fltPartilhaOR);

               fltSomaFCP     := fltSomaFCP  + fltFCP;
               fltSomaPrDS    := fltSomaPrDS + fltPartilhaDS;
               fltSomaPrOR    := fltSomaPrOR + fltPartilhaOR;

               // 4.00 partilha do ICMS e fundo de probreza
               Imposto.ICMSUFDest.vBCUFDest      := StrToFloat(vBCUFDest);
               Imposto.ICMSUFDest.pFCPUFDest     := StrToFloat(pFCPUFDest);
               Imposto.ICMSUFDest.pICMSUFDest    := StrToFloat(pICMSUFDest);
               Imposto.ICMSUFDest.pICMSInter     := StrToFloat(pICMSInter);
               Imposto.ICMSUFDest.pICMSInterPart := StrToFloat(pICMSInterPart);
               Imposto.ICMSUFDest.vFCPUFDest     := StrToFloat(vFCPUFDest);
               Imposto.ICMSUFDest.vICMSUFDest    := StrToFloat(vICMSUFDest);
               Imposto.ICMSUFDest.vICMSUFRemet   := StrToFloat(vICMSUFRemet);
               // NovaTag 4.00 vBCFCPUFDest Base de Calculo do FCP ****
               Imposto.ICMSUFDest.vBCFCPUFDest   := fltPrtVProd;
              End;
             End; //with  dados produtos / impostos with Det.Add do
            //--
           end;  // end do if
         dmBaseDados.tblLogMensal.Next;
        End; //end do WHILE
      VAliq   := FormatFloat('0.00',PercIcms);
      vBC     := '0.00'; //FormatFloat('0.00',dmBaseDados.tblANotaFiscalBaseCalculo.AsFloat);
      vICMS   := '0.00'; //FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorICMS.AsFloat);
      vICMSDeson := '0.00';    //Versao 3.10  Valor de ICMS desonerado
      vBCST   := '0.00'; //FormatFloat('0.00',dmBaseDados.tblANotaFiscalBaseST.AsFloat);
      vST     := '0.00'; //FormatFloat('0.00',dmBaseDados.tblANotaFiscalIcmsST.AsFloat);
      vProd   := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorTNF.AsFloat);
      vIPI    := FormatFloat('0.00',dmBaseDados.tblANotaFiscalIPI.AsFloat);
      vFrete  := FormatFloat('0.00',strFrete);
      vSeg    := '0.00';
      vDesc   := FormatFloat('0.00', dmBaseDados.tblANotaFiscalDesconto.AsFloat);
      vII     := '0.00';
      vPIS    := '0.00';
      vCOFINS := '0.00';                                                                         //vOutro  := FormatFloat('0.00',strDespAC + strAcres);
      vOutro  := FormatFloat('0.00',strDespAC);
      vTTotTrib := FormatFloat('0.00',dmBaseDados.tblANotaFiscalVTributos.AsFloat);              //vNF     := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorTNF.AsFloat - strDescon + strFrete + strDespAC + strAcres);
      vTribFed  := FormatFloat('R$ 0.00',dmBaseDados.tblANotaFiscalTribFed.AsFloat);
      vTribEst  := FormatFloat('R$ 0.00',dmBaseDados.tblANotaFiscalTribEst.AsFloat);
      vTribMun  := FormatFloat('R$ 0.00',dmBaseDados.tblANotaFiscalTribMun.AsFloat);
      vNF     := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorTNF.AsFloat - strDescon + strFrete + strDespAC);


      {if (strTotalST = 0) then
        begin
         vNF  := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorTNF.AsFloat);
        end
      else
        begin
         vNF  := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorTNF.AsFloat + dmBaseDados.tblANotaFiscalIcmsST.AsFloat + dmBaseDados.tblANotaFiscalIPI.AsFloat);
        end; }

      strMsgTrib := 'Valor Aprox. Tributos R$ ' + vTTotTrib +' ('+ FormatFloat('0.00',(dmBaseDados.tblANotaFiscalVTributos.AsFloat/dmBaseDados.tblANotaFiscalValorTNF.AsFloat)*100) +'%)(Federal: ' + vTribFed +' / Estadual: ' +vTribEst  +' / Municipal: ' +vTribMun +') Fonte: IBPT.  ';

      // CEST FCP Partilha
      if( (EstadoDest <> 'SP')and((TipoCli = 'CPF')or(IsentoCli = 'ISENTO')) )then
       Begin
        vFCPUFDest   := FormatFloat('0.00',fltSomaFCP);
        vICMSUFDest  := FormatFloat('0.00',fltSomaPrDS);
        vICMSUFRemet := FormatFloat('0.00',fltSomaPrOR);

        dmBaseDados.tblANotaFiscal.Edit;
        dmBaseDados.tblANotaFiscalFCP.AsFloat        := fltSomaFCP;
        dmBaseDados.tblANotaFiscalPartilhaDS.AsFloat := fltSomaPrDS;
        dmBaseDados.tblANotaFiscalPartilhaOR.AsFloat := fltSomaPrOR;
        dmBaseDados.tblANotaFiscal.Post;
       End;


       // Totais e Total FCP 4.00
       Total.ICMSTot.vBC     := StrToFloat(vBC);
       Total.ICMSTot.vICMS   := StrToFloat(vICMS);
       Total.ICMSTot.vBCST   := StrToFloat(vBCST);
       Total.ICMSTot.vST     := StrToFloat(vST);
       Total.ICMSTot.vProd   := StrToFloat(vProd);
       Total.ICMSTot.vFrete  := StrToFloat(vFrete);
       Total.ICMSTot.vSeg    := StrToFloat(vSeg);
       Total.ICMSTot.vDesc   := StrToFloat(vDesc);
       Total.ICMSTot.vII     := StrToFloat(vII);
       Total.ICMSTot.vIPI    := StrToFloat(vIPI);
       Total.ICMSTot.vPIS    := StrToFloat(vPIS);
       Total.ICMSTot.vCOFINS := StrToFloat(vCOFINS);
       Total.ICMSTot.vOutro  := StrToFloat(vOutro);
       Total.ICMSTot.vNF     := StrToFloat(vNF);

       // NovaTag 4.00
       {
       Total.ICMSTot.vIPIDevol := 0; //Soma com o Total da NFe
       // Fundo combate a pobreza APENAS PARA ESTADOS QUE RECOLHEM FCP INTERNAMENTE ****
       Total.ICMSTot.vFCP      := 0;
       Total.ICMSTot.vFCPST    := 0;
       Total.ICMSTot.vFCPSTRet := 0;
       }

                         
       // Lei da transparencia de impostos
       Total.ICMSTot.vTotTrib := StrToFloat(vTTotTrib);

       // Partilha do Icms e FCP fundo de probreza DIFAL
      // CEST FCP Partilha
      if( (EstadoDest <> 'SP')and((TipoCli = 'CPF')or(IsentoCli = 'ISENTO')) )then
       Begin
        Total.ICMSTot.vFCPUFDest   := StrToFloat(vFCPUFDest);
        Total.ICMSTot.vICMSUFDest  := StrToFloat(vICMSUFDest);
        Total.ICMSTot.vICMSUFRemet := StrToFloat(vICMSUFRemet);
       End;

       // NovaTag Novo Grupo 'Pag' 4.00 Informação de pagamentos OBRIGATÓRIO ****
       with (Pag.Add) do
        begin
         if (strDoc1 <> '' ) then
          begin
           tPag      := fpBoletoBancario;
           vPag      := StrToFloat(vNF);
           indPag    := StrToIndpag(ok,sindPag);
           tpIntegra := tiPagNaoIntegrado;
          end
         else
          begin
           tPag      := StrToFormaPagamento(ok,formaPgto); //fpDinheiro;
           vPag      := StrToFloat(vNF);
           indPag    := StrToIndpag(ok,sindPag);
           tpIntegra := tiPagNaoIntegrado;
           //CNPJ      := ;
           //tBand     := ;
           //cAut      := ;
          end;
         if (finNFe = '4') then
          begin
           tPag    := fpSemPagamento;
           vPag    := 0;
          end;
        end;

       //--
       if (rdgFrete.ItemIndex = 0) then
        begin
         sFrete := '0';
        end
       else
        begin
         sFrete := '1';
        end;
       //--
       // 4.00
       with (Transp) do
        begin
         modFrete            := StrTomodFrete(ok,sFrete);
         if (rdgTrans.Checked = True) then
          begin
           Transporta.CNPJCPF  := TransCNPJ;                        
           Transporta.xNome    := TransNome;
           Transporta.IE       := TransIE;
           Transporta.xEnder   := TransEndereco;
           Transporta.xMun     := TransCidade;
           Transporta.UF       := TransUF;
          end;



      if (PesoB <> '0.000') then
       begin
        Especie := edtEspecie.Text;
        // 4.00
        with (Vol.Add) do
         begin
          qVol  := StrToInt(Volume);
          esp   := Especie;
          //marca := 'Marca';
          //nVol  := 'Numero';
          pesoL := strPesoL;
          pesoB := strPesoB;
         end;
       end;

      if( (edtVolume.Text <> '')and(PesoB = '0.000') )then
       begin
        Especie := edtEspecie.Text;
        // 4.00
        with (Vol.Add) do
         begin
          qVol  := StrToInt(Volume);
          esp   := Especie;
          //marca := 'Marca';
          //nVol  := 'Numero';
          //pesoL := strPesoL;
          //pesoB := strPesoB;
         end;
       end;
      end; // end with Transp

      if (strDoc1 <> '') then
       Begin
        strDifCent := StrtoFloat(vNF) - (StrToFloat(strValor1)+StrToFloat(strValor2)+StrToFloat(strValor3)+StrToFloat(strValor4)+StrToFloat(strValor5)+StrToFloat(strValor6)+StrToFloat(strValor7)+StrToFloat(strValor8));
        strDifCent := Arredondar(strDifCent,2);
        // 4.00
        with (Cobr.Fat) do
         begin
          nFat  := NumeroNF;
          vOrig := StrToFloat(strValor1)+StrToFloat(strValor2)+StrToFloat(strValor3)+StrToFloat(strValor4)+StrToFloat(strValor5)+StrToFloat(strValor6)+StrToFloat(strValor7)+StrToFloat(strValor8)+strDifCent;  //StrToFloat(VFatura);
          vDesc := 0; //StrToFloat(vDesc);
          vLiq  := StrToFloat(strValor1)+StrToFloat(strValor2)+StrToFloat(strValor3)+StrToFloat(strValor4)+StrToFloat(strValor5)+StrToFloat(strValor6)+StrToFloat(strValor7)+StrToFloat(strValor8)+strDifCent;  //StrToFloat(vNF)-StrToFloat(vDesc);
         end;
        //--
        if (strVenc1 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc1;
            dVenc := StrToDate(strVenc1);
            vDup  := StrToFloat(strValor1)+strDifCent;
           end;
          end;
        if (strVenc2 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc2;
            dVenc := StrToDate(strVenc2);
            vDup  := StrToFloat(strValor2);
           end;
         end;
        if (strVenc3 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc3;
            dVenc := StrToDate(strVenc3);
            vDup  := StrToFloat(strValor3);
           end;
         end;
        if (strVenc4 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc4;
            dVenc := StrToDate(strVenc4);
            vDup  := StrToFloat(strValor4);
           end;
         end;
        if (strVenc5 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc5;
            dVenc := StrToDate(strVenc5);
            vDup  := StrToFloat(strValor5);
           end;
         end;
        if (strVenc6 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc6;
            dVenc := StrToDate(strVenc6);
            vDup  := StrToFloat(strValor6);
           end;
         end;
        if (strVenc7 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc7;
            dVenc := StrToDate(strVenc7);
            vDup  := StrToFloat(strValor7);
           end;
         end;
        if (strVenc8 <> '') then
         begin
          // 4.00
          with (Cobr.Dup.Add) do
           begin
            nDup  := strDoc8;
            dVenc := StrToDate(strVenc8);
            vDup  := StrToFloat(strValor8);
           end;
         end;
       End;    // end dos vencimentos vindos do ContasReceber


      if (dmBaseDados.tblANotaFiscalValorICMS.AsFloat > 0) then
       begin
        vICMS := FormatFloat('0.00',dmBaseDados.tblANotaFiscalValorICMS.AsFloat);
        // 4.00
        with (InfAdic) do
         begin
          infCpl     := edtObsComp.Text+ ' / De acordo com a Portaria Cat 162/2008 artigo 18 Inciso I Alinea b, e permitido o cancelamento de NF-e somente em ate 24 horas apos sua emissao. / ' +'PERMITE O APROVEITAMENTO DO CREDITO DE ICMS NO VALOR DE R$ '+ VIcms +'  CORRESPONDENTE A ALIQUOTA DE '+ VAliq +' , NOS TERMOS DO ART. 23 DA LC 123/2006.  NFe emitida por ME, optante pelo Simples Nacional. Nao gera direito a credito de IPI. '  + strMsgTrib;
          infAdFisco := '';
         end;
       end
      else
       begin
        // 4.00
        with (InfAdic) do
         begin
          infCpl     := edtObsComp.Text+ ' / De acordo com a Portaria Cat 162/2008 artigo 18 Inciso I Alinea b, e permitido o cancelamento de NF-e somente em ate 24 horas apos sua emissao. / ' +'NFe emitida por ME, optante pelo Simples Nacional. Nao gera direito a credito de IPI. '  + strMsgTrib;
          infAdFisco := '';
         end;
       end;
      DecimalSeparator := ',';
     END; // 1º with
  End
else
  Begin
   Application.MessageBox('Pedido Estornado e/ou Excluido','Atenção',MB_OK);
  End;
  //...FIM da geração do arquivo para Nota Fiscal Eletrônica.
//***-------------------------------------------------------------------------------------------------------------------------------------------------***
// Carregando o arquivo TXT
{
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add;
NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);
NFeRTXT.CarregarArquivo('F:\NFe\' +strNPedido +'.txt');
if (NFeRTXT.LerTxt) then
 NFeRTXT.Free
else
 begin
  NFeRTXT.Free;
  ShowMessage('Arquivo NFe Inválido');
  Exit;
 end;
}
//--
// Salvando e gerando o XML
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.tblANotaFiscal.Post;
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString  := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalCaminho2.AsString     := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.tblANotaFiscalLinhaConting.AsString := strConting;
dmBaseDados.tblANotaFiscal.Post;
ACBrNFe1.WebServices.Envia(1,True,True); // ACBrNFe1.WebServices.Envia(1);
//------------------------------------------------------------------------------

if (ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat = 105) then // Lote em processamento
repeat
Application.MessageBox('Envio da NFE - Lote em processamento.' +#13 + 'Aguarde 2 minutos e Clique em OK !!!', 'MBJ', MB_OK);
ACBrNFe1.WebServices.Retorno.Recibo := ACBrNFe1.WebServices.Enviar.Recibo;

until ACBrNFe1.WebServices.Retorno.Executar;
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalStatus.AsInteger     := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat;        //ACBrNFe1.WebServices.Consulta.cStat;
dmBaseDados.tblANotaFiscalProtocolo.AsString   := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt;        //ACBrNFe1.WebServices.Retorno.Protocolo;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44); //ACBrNFe1.WebServices.Retorno.ChaveNFe;
dmBaseDados.tblANotaFiscal.Post;

//------------------------------------------------------------------------------

stsRetorno := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat;    //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
strMotivo  := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo;  //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
if (stsRetorno = 100) then
 begin
  ACBrNFe1.NotasFiscais.Items[0].Imprimir;  
  ACBrNFe1.NotasFiscais.ImprimirPDF;
 end;
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalStatus.AsInteger     := stsRetorno;
dmBaseDados.tblANotaFiscalMensagem.AsString    := strMotivo;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalProtocolo.AsString   := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt; //ACBrNFe1.WebServices.Retorno.Protocolo;
if( (stsRetorno = 302)or(stsRetorno = 110) )then
 begin  dmBaseDados.tblANotaFiscalChaveAcesso.AsString := 'Nota DENEGADA';  dmBaseDados.tblANotaFiscalProtocolo.AsString   := 'Nota DENEGADA'; end;
dmBaseDados.tblANotaFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '-NFe.xml';  //ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
  NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
  ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq); //ACBrNFe1.NotasFiscais.Items[0].SaveToFile(NomeArq);
  dmBaseDados.tblANotaFiscalCaminhoXML.AsString := 'F:\NFe\PathNFe\' + NomeArq;
  dmBaseDados.tblANotaFiscal.Post;
dmBaseDados.tblEmail.Open;
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then
   Begin
    CC   := TstringList.Create;
    try
     Para := emailDest;
     CC.Add(dmBaseDados.tblEmailUsuario.AsString);    // Especifique um email válido

     if (emailDest2 <> '') then
      CC.Add(emailDest2);
     if (emailDest3 <> '') then
      CC.Add(emailDest3);

     ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
     ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
     ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
     ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
     ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
     ACBrMail1.SetSSL   := dmBaseDados.tblEmailConexaoSegura.Value; // SSL - Conexão Segura
     ACBrMail1.SetTLS   := dmBaseDados.tblEmailConexaoSegura.Value; // Auto TLS
     ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
     ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
     ACBrMail1.FromName            := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
     mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
     strMensagem     := mmEmailMsg.Lines;
     strAssunto      := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
     ACBrNFe1.NotasFiscais.Items[0].EnviarEmail( Para
                                               , strAssunto
                                               , strMensagem
                                               , True  // Enviar PDF junto
                                               , CC    // Lista com emails que serão enviado cópias - TStrings
                                               , nil); // Lista de anexos - TStrings
    finally
     CC.Free;
    end;
   End;

dmBaseDados.tblANotaFiscal.Filter      := '';
dmBaseDados.tblANotaFiscal.Filtered    := False;
dmBaseDados.tblContasReceber.Filter    := '';
dmBaseDados.tblContasReceber.Filtered  := False;
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblPedidos.Filter          := '';
dmBaseDados.tblPedidos.Filtered        := False;
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblSaida.Close;
dmBaseDados.tblEmail.Close;
btnImprime.Enabled      := False;
btnGrava.Enabled        := False;
mskNPedido.Enabled      := True;       
mskNrNotaFiscal.Enabled := True;
cmbCfop.Enabled         := True;
dmBaseDados.tblProdutos.Close;
Close;
end;

procedure TFrmEmissaoNF.ckbAVistaClick(Sender: TObject);
begin
if (ckbAVista.Checked = True) then
 begin
  ckbPrazo.Checked  := False;
 end
else
 begin
  ckbAVista.Checked := False;
 end;
end;

procedure TFrmEmissaoNF.ckbPrazoClick(Sender: TObject);
begin
if (ckbPrazo.Checked = True) then
 begin
  ckbAVista.Checked  := False;
 end
else
 begin
  ckbPrazo.Checked := False;
 end;
end;

procedure TFrmEmissaoNF.mskNPedidoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  cmbCfop.SetFocus;
 end;
end;

procedure TFrmEmissaoNF.cmbTransportadoraClick(Sender: TObject);
begin
dmBaseDados.tblTransportadora.First;
if (dmBaseDados.tblTransportadora.Locate('NomeFantasia',cmbTransportadora.Text,[loCaseInsensitive]) = TRUE) then
 begin
  edtNomeTrans.Text   := dmBaseDados.tblTransportadoraRazaoSocial.AsString;
  edtCNPJTrans.Text   := dmBaseDados.tblTransportadoraCNPJ.AsString;
  edtInscTrans.Text   := dmBaseDados.tblTransportadoraInscricao.AsString;
  edtEndTrans.Text    := dmBaseDados.tblTransportadoraEndereco.AsString+', '+ dmBaseDados.tblTransportadoraNumero.AsString;
  edtCidadeTrans.Text := dmBaseDados.tblTransportadoraCidade.AsString;
  edtEstadoTrans.Text := dmBaseDados.tblTransportadoraEstado.AsString;
 end;
end;

procedure TFrmEmissaoNF.rdgTransClick(Sender: TObject);
begin
if (rdgTrans.Checked = True) then
 begin
  lblTransportadora.Visible := True;
  lblNomeTrans.Visible   := True;
  lblCNPJ.Visible        := True;
  lblIE.Visible          := True;
  lblEnd.Visible         := True;
  lblCidade.Visible      := True;
  lblUF.Visible          := True;
  lblPlaca.Visible       := True;
  lblPlacaUF.Visible     := True;
  cmbTransportadora.Visible := True;
  edtNomeTrans.Visible   := True;
  edtCNPJTrans.Visible   := True;
  edtInscTrans.Visible   := True;
  edtEndTrans.Visible    := True;
  edtCidadeTrans.Visible := True;
  edtEstadoTrans.Visible := True;
  edtPlaca.Visible       := True;
  edtPlacaUF.Visible     := True;
 end;
end;

procedure TFrmEmissaoNF.rdgMesmoClick(Sender: TObject);
begin
if (rdgMesmo.Checked = True) then
 begin
  lblTransportadora.Visible := False;
  lblNomeTrans.Visible   := False;
  lblCNPJ.Visible        := False;
  lblIE.Visible          := False;
  lblEnd.Visible         := False;
  lblCidade.Visible      := False;
  lblUF.Visible          := False;
  lblPlaca.Visible       := False;
  lblPlacaUF.Visible     := False;
  cmbTransportadora.Visible := False;
  edtNomeTrans.Visible   := False;
  edtCNPJTrans.Visible   := False;
  edtInscTrans.Visible   := False;
  edtEndTrans.Visible    := False;
  edtCidadeTrans.Visible := False;
  edtEstadoTrans.Visible := False;
  edtPlaca.Visible       := False;
  edtPlacaUF.Visible     := False;
 end;
end;

procedure TFrmEmissaoNF.edtPesoBrutoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key:= #0;
end;

procedure TFrmEmissaoNF.edtPesoLiqKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key:= #0;
end;

procedure TFrmEmissaoNF.edtDescontoKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TFrmEmissaoNF.edtDespAcKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TFrmEmissaoNF.cmbCfopClick(Sender: TObject);
begin
if( (Copy(cmbCfop.Text,1,5) = '1.202')or(Copy(cmbCfop.Text,1,5) = '5.202')or(Copy(cmbCfop.Text,1,5) = '6.202') )then
 begin
  lblChave.Visible       := True;
  edtChaveFornec.Visible := True;
 end
else
 begin
  lblChave.Visible       := False;
  edtChaveFornec.Visible := False;
 end;
end;

procedure TFrmEmissaoNF.edtChaveFornecKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key := #0;
end;

end.
