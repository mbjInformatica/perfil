unit NFeDevolucaoNew;

interface
      
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, Buttons, Mask, Grids, DBGrids, DBCtrls, TISButton, TIGradient,
     ExtCtrls, ACBrNFe, OleCtrls, SHDocVw, pcnConversao, ACBrUtil,
     pcnNFeRTXT, pcnAuxiliar, IniFiles, ShellAPI, Math, TILabel, TISLABELS,
     ACBrNFeDANFeRLClass, ACBrMail, ACBrBase, ACBrDFe,
     ACBrNFeDANFEClass, TISImagePanel, TISGroupBox, TISRadioGroup,

     ACBrNFeDANFeESCPOS, XMLIntf, XMLDoc, zlib, strutils, TypInfo,
     DateUtils, {ufrmStatus} synacode,  pcnConversaoNFe,
     ACBrDFeConfiguracoes, ACBrDFeSSL, RLConsts, Variants, blcksock,
     ACBrNFe.Classes, ACBrDFe.Conversao,
  ACBrDFeReport, ACBrDFeDANFeReport;

type
  TformNFeDevolucaoNew = class(TForm)
    grdProdutos: TDBGrid;
    btnImprime: TTISButton;
    btnRetornar: TTISButton;
    Label3: TLabel;
    Label4: TLabel;
    mskHoraES: TMaskEdit;
    mskDataES: TMaskEdit;
    cmbCfop: TComboBox;
    ckbAVista: TTISCheckBox;
    ckbPrazo: TTISCheckBox;
    rdgFrete: TRadioGroup;
    rdgTipoOperacao: TRadioGroup;
    Label8: TLabel;
    rdgMesmo: TTISRadioButton;
    rdgTrans: TTISRadioButton;
    Label7: TLabel;
    edtVolume: TEdit;
    edtEspecie: TEdit;
    Label9: TLabel;
    edtPesoLiq: TEdit;
    Label5: TLabel;
    edtPesoBruto: TEdit;
    Label6: TLabel;
    edtObsComp: TEdit;
    Label1: TLabel;
    lblCupom: TLabel;
    edtCupom: TEdit;
    mmEmailMsg: TMemo;
    mskNrNotaFiscal: TMaskEdit;
    Label2: TLabel;
    edtVTotalNF: TEdit;
    Label10: TLabel;
    edtTotalProd: TEdit;
    TIGradient1: TTIGradient;
    Label11: TLabel;
    edtBaseIcms: TEdit;
    Label12: TLabel;
    edtVIcms: TEdit;
    Label13: TLabel;
    edtBaseST: TEdit;
    Label14: TLabel;
    edtValorST: TEdit;
    Label15: TLabel;
    edtValorIPI: TEdit;
    edtNatureza: TEdit;
    Label16: TLabel;    
    pnlBotoes: TPanel;
    btnPrimeiroServico: TSpeedButton;
    btnUltimoServico: TSpeedButton;
    btnGravarServico: TSpeedButton;
    btnExcluirServico: TSpeedButton;
    btnAdicionarServico: TSpeedButton;
    Label17: TLabel;
    edtChaveFornec: TEdit;
    TISButton1: TTISButton;
    DBText1: TDBText;
    lblDesp: TLabel;
    edtDespAc: TEdit;
    ACBrMail1: TACBrMail;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrNFe1: TACBrNFe;
    edtChaveFornec2: TEdit;
    edtChaveFornec3: TEdit;
    edtChaveFornec4: TEdit;
    edtChaveFornec5: TEdit;
    edtChaveFornec6: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBText2: TDBText;
    rdgEntSaida: TTISRadioGroup;
    rdgFinalidade: TTISRadioGroup;
    Label24: TLabel;
    lblFrete: TLabel;
    edtFrete: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edtChaveFornec7: TEdit;
    edtChaveFornec8: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    edtChaveFornec9: TEdit;
    edtChaveFornec10: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    edtChaveFornec11: TEdit;
    edtChaveFornec12: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnPrimeiroServicoClick(Sender: TObject);
    procedure btnUltimoServicoClick(Sender: TObject);
    procedure btnAdicionarServicoClick(Sender: TObject);
    procedure btnGravarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure grdProdutosColExit(Sender: TObject);
    procedure grdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure TISButton1Click(Sender: TObject);
    procedure edtDespAcKeyPress(Sender: TObject; var Key: Char);
    procedure edtBaseIcmsKeyPress(Sender: TObject; var Key: Char);
    procedure edtVIcmsKeyPress(Sender: TObject; var Key: Char);
    procedure edtBaseSTKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorSTKeyPress(Sender: TObject; var Key: Char);
    procedure edtTotalProdKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorIPIKeyPress(Sender: TObject; var Key: Char);
    procedure edtVTotalNFKeyPress(Sender: TObject; var Key: Char);
    procedure edtDespAcExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgTransClick(Sender: TObject);
    procedure mskNrNotaFiscalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formNFeDevolucaoNew : TformNFeDevolucaoNew;
    strDoc1, strDoc2, strDoc3, strDoc4,
    strDoc5, strDoc6, strDoc7, strDoc8,
    strVenc1, strVenc2, strVenc3, strVenc4,
    strVenc5, strVenc6, strVenc7, strVenc8,
    strValor1, strValor2, strValor3, strValor4,
    strValor5, strValor6, strValor7, strValor8,
    strNFe, strCPF, strCNPJ, strCfopMudou, strPE,
    ChaveAcesso, sDataEmissao, sHoraEmissao : String;
    strCont, fltR12, fltR18, strSomaIPI, strFrete,
    strAcrescNFe, strPesoB, fltValor1, strPesoL,
    strVolume, strDespAC, fltValor1PE, strDescNFe,
    strDescRamo6, strDescRamo7, strBase060, strIcms060 : Double;
    strDataPe1, strDataPe2, strDataPe3 : TDateTime;
    strCont000, strCont070, NrNf,
    stsBoleto, intContador : Integer;
    NFeRTXT : TNFeRTXT;

implementation

uses ModuloDados, RotinasGerais, SeekClientes, db,
     SeekProduto, SeekFornecedor2, DigitaTransp;


{$R *.dfm}


procedure TformNFeDevolucaoNew.FormShow(Sender: TObject);
begin
DecimalSeparator := ',';
edtChaveFornec.Clear;
edtChaveFornec2.Clear;
edtChaveFornec3.Clear;
edtChaveFornec4.Clear;
edtChaveFornec5.Clear;
edtChaveFornec6.Clear;
edtChaveFornec7.Clear;
edtChaveFornec8.Clear;
edtChaveFornec9.Clear;
edtChaveFornec10.Clear;
edtChaveFornec11.Clear;
edtChaveFornec12.Clear;
formDigitaTransp.edtPlaca.Clear;
formDigitaTransp.edtPlacaUF.Clear;
formDigitaTransp.edtEndTrans.Clear;
formDigitaTransp.edtNomeTrans.Clear;
formDigitaTransp.edtCNPJTrans.Clear;
formDigitaTransp.edtInscTrans.Clear;
formDigitaTransp.edtCidadeTrans.Clear;
formDigitaTransp.edtEstadoTrans.Clear;
edtBaseIcms.Text   := '0';
edtVIcms.Text      := '0';
edtBaseST.Text     := '0';
edtValorST.Text    := '0';
edtValorIPI.Text   := '0';
edtTotalProd.Text  := '0';
edtVTotalNF.Text   := '0';
edtDespAc.Text     := '0';
edtFrete.Text      := '0';
edtNatureza.Text   := 'DEVOLUCAO';
sDataEmissao       := DateToStr(Date);
sHoraEmissao       := TimeToStr(Time);
mskDataES.Text     := DateToStr(Date);
mskHoraES.Text     := TimeToStr(Time);
cmbCfop.ItemIndex  := 4;
btnImprime.Enabled := False;
rdgTipoOperacao.ItemIndex := 1;
rdgMesmo.Checked          := True;
rdgFrete.ItemIndex        := 1;
rdgEntSaida.ItemIndex     := 0;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblFornecedores.Open;
//--
dmBaseDados.tblANotaFiscalNew.Open;
dmBaseDados.tblANotaFiscalNew.Last;
mskNrNotaFiscal.Text := IntToStr(dmBaseDados.tblANotaFiscalNewNrNF.AsInteger + 1);
NrNf := StrToInt(mskNrNotaFiscal.Text);
//--
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
end;

procedure TformNFeDevolucaoNew.btnAdicionarServicoClick(Sender: TObject);
begin
formSeekProduto.ShowModal;
dmBaseDados.tblLogMensal.Append;
dmBaseDados.tblLogMensalDescricao.AsString     := dmBaseDados.tblProdutosDescricaoDetalhada.AsString;
dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblProdutosReferenciaFabricante.AsString;
if (dmBaseDados.tblLogMensalCodigoProduto.AsString = '') then
 begin
  dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblProdutosCodigo.AsString;
 end;
dmBaseDados.tblLogMensalNCM.AsString           := dmBaseDados.tblProdutosNCM.AsString;
dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblProdutosUnidadeMedida.AsString;
dmBaseDados.tblLogMensalValorDinheiro.AsFloat  := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
dmBaseDados.tblLogMensalFamilia.AsString       := dmBaseDados.tblProdutosSituacaoTributaria.AsString;
grdProdutos.SelectedField := dmBaseDados.tblLogMensalFamilia;
grdProdutos.SetFocus;
end;

procedure TformNFeDevolucaoNew.btnImprimeClick(Sender: TObject);
var Natureza, NumeroNF, DataEmissao, strStatus, strPgto,
    strCodigoProduto, strCodProRef, strDescricao, strCST,
    strUnid, strNPedido, strCodVend, DataSaida, HoraSaida,
    dhCont, xJust, emailDest, emailDest2, emailDest3,
    strDataBoa, ClienteDest, EnderecoDest, NumeroDest,
    ComplDest, BairroDest, CEPDest, TelDest, IEDest,
    CodigoIBGE, CidadeDest, EstadoDest, CodigoProd,
    DescriProd, UnidadeProd, QtdeProd, VUnProd, VTotalProd,
    CFOPProd, OrigemProd, CSTProd, ModalidadeBC, UnidadeTrib,
    QtdeTrib,VTotalTrib, PercReducao, BaseICMS, ValorICMS,
    AliqICMS, ValorIPI, AliqIPI, BaseST, IcmsST, BasePIS,
    AliqPIS, ValorPIS, BaseCOF, AliqCOF, ValorCOF, strNCM,
    NCMProd, vBC, vICMS, vBCST,  vST, vProd, vFrete, vSeg,
    vDesc, vII, vIPI, vPIS, vCOFINS, vOutro, vNF, modBCST,
    strCfopMudou2, TransNome, pRedBC, pMVAST, pICMSST,
    vCredICMS, pRedBCST, vICMSST, pCredSN, vCredICMSSN,
    TransCNPJ, TransIE, TransEndereco, TransUF, TransCidade,
    TransPlaca, vPOutro, indTot, xPed, nItemPed, CRT, Especie,
    strArq, vPDesc, strMensagem6, TransUFPlaca, AliqST, PesoB,
    PesoL, strParcela, Volume, DespAC, vPFrete, strMensagem5,
    vTotTrib, vTTotTrib, strMsgTrib, strMensagem1, strMensagem2,
    strMensagem3, strMensagem4, strCPF1, strCPF2, strCPF3, strCPF4,
    strCNPJ1, strCNPJ2, strCNPJ3, strCNPJ4, strCNPJ5, strEntrSaida : String;
    //--
    strQtde, strQtdeEstoque, strVUnitario, strVTotal, strICMS, strPercReducao,
    strBaseICMS, strValorICMS, strAliqICMS, strBaseST, strIcmsST,  strVIPI,
    strAIPI, strCalcIcms, strPIS, strCOF, strTotalPIS, strTotalCOFINS,
    fltImpostos, strDescUn, strvTotTrib, strTotalST, fltIcms, fltBaseICMS,
    fltValorICMS, fltReducao, strSTCustoT, strSTIcms12, strSTIVA, strSTBase,
    strSTIcms, strSTIcmsCli, strSTTotalIcms, strSomaBaseST, strSomaIcmsST,
    strSTIcmsInt, fltBase0, fltBase7, fltBase12, fltBase18, fltBase25,
    fltVCont00, fltTotal, fltVCont0, fltVCont7, fltVCont12, fltVCont18,
    fltVCont25, fltIcms7, fltIcms12, fltIcms18, fltIcms25, fltAliqIcms,
    fltImpostoIcms, fltIsentoIcms, fltAcrescimo, fltOutrasIcms,
    fltIcmsNaFonte, fltIcmsR12, fltIcmsR18, fltBaseR12, fltBaseR18,
    fltIsentoPis, fltCodContabil, fltIsento12, fltIsentoR18, fltIsento7,
    fltIsento25, fltIsento18, fltOutras12, fltOutrasR18, fltOutras7,
    fltOutras25, fltOutras18, fltDataIntegracao, fltDesconto,
    fltValorVista, fltValorPrazo, fltContribuinte, fltTipoNota,
    fltCgc, fltContaCtblFornecedor, fltNrMunicipio, fltDMEmissao,
    strProdBase, strTotalTrib, strProdICMS, strProdBaseST,
    strProdIcmsST, strIPI, strPEDiv, strCalcST, strPFrete : Double;
    strNumeroNF, Contador, strConCR, strTem5405 : Integer;
    strVencimento, strDtSaida : TDateTime;
    strProdDesc : Currency;
    //  AcbrNFe
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser, strSmtpPass,
    Para, NomeArq, strAssunto, strMotivo, NumFatura, VFatura,
    DescFatura, VLiqFatura, IM, NVE, nFCI, EXTIPI, vICMSDeson,
    cDV, idDest, indFinal, indPres, indIEDest, finNFe, chCodUF,
    chData, chAnoMes, chCNPJ, chModelo, chSerie, chNrNFe,
    chFormaEmissao, chCodNumerico, ChaveAcesso, strCPF, strCNF : String;
    stsRetorno, strNrN, CodigoNumerico : Integer;
    ArquivoNFe, txtMonitor : TextFile;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    // Versão 4.00
    indPag, sCNPJCPF, sFrete : String;
    ok : boolean;
begin
strFrete := 0;
pCredSN  := '0';
DecimalSeparator := ',';
if (Application.MessageBox('Confirma emissão da Nota Fiscal de Devolução?','CONFIRMA?',MB_YESNO) = IDYES) then
 BEGIN
if (edtNatureza.Text = '') then
 begin
  Application.MessageBox('Informar a NATUREZA DA OPERAÇÃO','A T E N Ç Ã O!',MB_OK);
  edtNatureza.SetFocus;
  Abort;
 end;
if( (edtChaveFornec.Text = '')and(rdgFinalidade.ItemIndex = 0) )then
 begin
  Application.MessageBox('Informar a CHAVE DE ACESSO DA NOTA A SER DEVOLVIDA!','A T E N Ç Ã O!',MB_OK);
  edtChaveFornec.SetFocus;
  Abort;                                  
 end;
dmBaseDados.tblLogMensal.Last;
if( (dmBaseDados.tblLogMensalCodigoProduto.AsString = '')
and (dmBaseDados.tblLogMensalDescricao.AsString = '') )then
 begin
  dmBaseDados.tblLogMensal.Delete;
 end;
if (edtVolume.Text <> '') then
 begin
  strVolume := StrToFloat(edtVolume.Text);
 end
else
 begin
  strVolume := 0;
 end;
if (edtPesoBruto.Text <> '') then
 begin
  strPesoB := StrToFloat(edtPesoBruto.Text);
 end;
if (edtPesoLiq.Text <> '') then
 begin
  strPesoL := StrToFloat(edtPesoLiq.Text);
 end;
if (edtFrete.Text <> '') then
 begin
  strFrete := StrToFloat(edtFrete.Text);
  strFrete := Arredondar(strFrete,2);
 end;
fltTotal       := 0;
strTotalPIS    := 0;
strTotalCOFINS := 0;
strDespAC      := 0;
if (edtDespAc.Text <> '') then
 begin
  strDespAC := StrToFloat(edtDespAc.Text);
 end;
intContador := dmBaseDados.tblLogMensal.RecordCount;
dmBaseDados.tblLogMensal.First;
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
  fltTotal   := fltTotal   + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
  strTotalST := strTotalST + dmBaseDados.tblLogMensalTroco.AsFloat;
  strSomaIPI := strSomaIPI + dmBaseDados.tblLogMensalValorIPI.AsFloat;
  dmBaseDados.tblLogMensal.Edit;
  dmBaseDados.tblLogMensalEcommerce.AsFloat := strDespAC/intContador;
  dmBaseDados.tblLogMensalEcommerce.AsFloat := Arredondar(dmBaseDados.tblLogMensalEcommerce.AsFloat,2);
  dmBaseDados.tblLogMensal.Post;
  dmBaseDados.tblLogMensal.Next;
 end;                                     
dmBaseDados.tblLogMensal.First;
//--
strPFrete  := strFrete/intContador;
strCNPJ := dmBaseDados.tblFornecedoresCNPJ.AsString;
strCNPJ := BuscarETroca(strCNPJ,'-','');
strCNPJ := BuscarETroca(strCNPJ,'.','');
strCNPJ := BuscarETroca(strCNPJ,'/','');
strCNPJ := BuscarETroca(strCNPJ,'\','');
dmBaseDados.tblProdutos.Open;
//--
{dmBaseDados.tblANotaFiscalNew.Open;
dmBaseDados.tblANotaFiscalNew.Last;
mskNrNotaFiscal.Text := IntToStr(dmBaseDados.tblANotaFiscalNewNrNF.AsInteger + 1);}
//--
strNrN := StrToInt(mskNrNotaFiscal.Text);
if (not dmBaseDados.tblANotaFiscalNew.Locate('NrNF',mskNrNotaFiscal.Text,[loCaseInsensitive])and(NrNf = strNrN)) then
  Begin
   dmBaseDados.tblANotaFiscalNew.Append;
   dmBaseDados.tblANotaFiscalNewNrNF.AsInteger := StrToInt(mskNrNotaFiscal.Text);
  End
else
  Begin
   if( (strNrN > NrNf) )then
    begin
     Application.MessageBox('Número de Nota Fiscal inválido!','A T E N Ç Ã O!!',MB_ICONERROR);
     mskNrNotaFiscal.SetFocus;
     Abort;
    end;                      
   //--    
   if( (dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 100)or(dmBaseDados.tblANotaFiscalNewCancelada.AsString = 'S')
    or (dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 110) )then
    Begin
     if (dmBaseDados.tblANotaFiscalNewStatus.AsString = '100') then
      begin
       Application.MessageBox('Número de Nota Fiscal já AUTORIZADA!','A T E N Ç Ã O!!',MB_ICONERROR);
      end;
     if (dmBaseDados.tblANotaFiscalNewCancelada.AsString = 'S') then
      begin
       Application.MessageBox('Número de Nota Fiscal está CANCELADA!','A T E N Ç Ã O!!',MB_ICONERROR);
      end;
     if( (dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 110) )then
      begin
       Application.MessageBox('Número de Nota Fiscal está DENEGADA!','A T E N Ç Ã O!!',MB_ICONERROR);
      end;
     mskNrNotaFiscal.SetFocus;
     Abort;
    End;
   dmBaseDados.tblANotaFiscalNew.Edit;
  End;
//--
dmBaseDados.tblANotaFiscalNewPedido.AsString         := 'D' + mskNrNotaFiscal.Text;
dmBaseDados.tblANotaFiscalNewEspecie.AsString        := 'D';
dmBaseDados.tblANotaFiscalNewNrNF.AsString           := mskNrNotaFiscal.Text;
dmBaseDados.tblANotaFiscalNewDataEmissao.AsDateTime  := Date;
dmBaseDados.tblANotaFiscalNewCFOP.AsString           := edtNatureza.Text;
dmBaseDados.tblANotaFiscalNewCodigoCliente.AsInteger := dmBaseDados.tblFornecedoresCodigoFornecedor.AsInteger;
dmBaseDados.tblANotaFiscalNewVcont25.AsFloat         := fltVCont25;
dmBaseDados.tblANotaFiscalNewVcont18.AsFloat         := fltVCont00;
dmBaseDados.tblANotaFiscalNewVcont12.AsFloat         := fltVCont12;
dmBaseDados.tblANotaFiscalNewVcont7.AsFloat          := fltVCont7;
dmBaseDados.tblANotaFiscalNewBase25.AsFloat          := fltBase25;
dmBaseDados.tblANotaFiscalNewBase18.AsFloat          := fltBase18;
dmBaseDados.tblANotaFiscalNewBase12.AsFloat          := fltBase12;
dmBaseDados.tblANotaFiscalNewBase7.AsFloat           := fltBase7;
dmBaseDados.tblANotaFiscalNewIcms25.AsFloat          := fltIcms25;
dmBaseDados.tblANotaFiscalNewIcms18.AsFloat          := fltIcms18;
dmBaseDados.tblANotaFiscalNewIcms12.AsFloat          := fltIcms12;
dmBaseDados.tblANotaFiscalNewIcms7.AsFloat           := fltIcms7;
dmBaseDados.tblANotaFiscalNewBaseR18.AsFloat         := fltBaseR18;   
dmBaseDados.tblANotaFiscalNewBaseR12.AsFloat         := fltBaseR12;
dmBaseDados.tblANotaFiscalNewIcmsR18.AsFloat         := fltIcmsR18;
dmBaseDados.tblANotaFiscalNewIcmsR12.AsFloat         := fltIcmsR12;
dmBaseDados.tblANotaFiscalNewAliqIcms.AsFloat        := fltAliqIcms;
dmBaseDados.tblANotaFiscalNewImpostoIcms.AsFloat     := fltImpostoIcms;
dmBaseDados.tblANotaFiscalNewIsentoIcms.AsFloat      := fltIsentoIcms;
dmBaseDados.tblANotaFiscalNewOutrasIcms.AsFloat      := fltOutrasIcms;
dmBaseDados.tblANotaFiscalNewIcmsNaFonte.AsFloat     := fltIcmsNaFonte;
strDescNFe := fltTotal * (fltDesconto / 100);
strDescNFe := Arredondar(strDescNFe,2);
dmBaseDados.tblANotaFiscalNewDesconto.AsFloat        := strDescNFe;
//dmBaseDados.tblANotaFiscalNewValorVista.AsFloat      := fltTotal - strDescNFe;
dmBaseDados.tblANotaFiscalNewValorVista.AsFloat      := fltTotal - strDescNFe + strFrete;
dmBaseDados.tblANotaFiscalNewFrete.AsFloat           := strFrete;
dmBaseDados.tblANotaFiscalNewValorPrazo.AsFloat      := fltValorPrazo;
dmBaseDados.tblANotaFiscalNewContribuinte.AsFloat    := fltContribuinte;
dmBaseDados.tblANotaFiscalNewTipoNota.AsFloat        := fltTipoNota;
dmBaseDados.tblANotaFiscalNewContaCtblFornecedor.AsString := 'D'; //fltContaCtblFornecedor;
dmBaseDados.tblANotaFiscalNewNrMunicipio.AsFloat     := fltNrMunicipio;
dmBaseDados.tblANotaFiscalNewInscrEstadual.AsString  := dmBaseDados.tblFornecedoresInscricao.AsString;
dmBaseDados.tblANotaFiscalNewRazaoSocial.AsString    := dmBaseDados.tblFornecedoresRazaoSocial.AsString;
dmBaseDados.tblANotaFiscalNewUf.AsString             := dmBaseDados.tblFornecedoresEstado.AsString;
dmBaseDados.tblANotaFiscalNewIsento7.AsFloat         := fltIsento7;
dmBaseDados.tblANotaFiscalNewIsento12.AsFloat        := fltIsento12;
dmBaseDados.tblANotaFiscalNewIsento18.AsFloat        := fltIsento18+fltVCont0;
dmBaseDados.tblANotaFiscalNewIsento25.AsFloat        := fltIsento25;
dmBaseDados.tblANotaFiscalNewIsentoR18.AsFloat       := fltIsentoR18;
dmBaseDados.tblANotaFiscalNewOutras7.AsFloat         := fltOutras7;
dmBaseDados.tblANotaFiscalNewOutras12.AsFloat        := fltOutras12;
dmBaseDados.tblANotaFiscalNewOutras18.AsFloat        := fltOutras18;
dmBaseDados.tblANotaFiscalNewOutras25.AsFloat        := fltOutras25;
dmBaseDados.tblANotaFiscalNewOutrasR18.AsFloat       := fltOutrasR18;
dmBaseDados.tblANotaFiscalNewDMEmissao.AsFloat       := fltDMEmissao;
dmBaseDados.tblANotaFiscalNewValorTNF.AsFloat        := fltTotal;
dmBaseDados.tblANotaFiscalNewDespesasAc.AsFloat      := strDespAC;
dmBaseDados.tblANotaFiscalNewFrete.AsFloat           := strFrete;
dmBaseDados.tblANotaFiscalNewBaseST.AsFloat          := StrToFloat(edtBaseST.Text); //strSomaBaseST;
dmBaseDados.tblANotaFiscalNewIcmsST.AsFloat          := strTotalST;
dmBaseDados.tblANotaFiscalNewIPI.AsFloat             := strSomaIPI;
dmBaseDados.tblANotaFiscalNewVTributos.AsFloat       := strTotalTrib;
dmBaseDados.tblANotaFiscalNewBaseCalculo.AsFloat     := StrToFloat(edtBaseIcms.Text); //fltBase0 + fltBase7  + fltBase12 + fltBase18 + fltBase25  + fltBaseR12 + fltBaseR18;
dmBaseDados.tblANotaFiscalNewValorICMS.AsFloat       := StrToFloat(edtVIcms.Text);    //fltIcms7 + fltIcms12 + fltIcms18 + fltIcms25 + fltIcmsR12 + fltIcmsR18;
dmBaseDados.tblANotaFiscalNewCgc.AsString            := strCNPJ;
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
dmBaseDados.tblANotaFiscalNew.Post;
//...fim da gravação na ANotaFical.

//***-------------------------------------------------------------------------------------------------------------------------------------------------***
  //Geração do arquivo para Nota Fiscal Eletrônica...:
    dmBaseDados.tblLogMensal.First;
    strDtSaida       := StrToDate(mskDataES.Text);
    SHORTDATEFORMAT  := 'yyyy-mm-dd';
    DataEmissao      := DateToStr(Date) + 'T' + mskHoraES.Text + '-03:00';       // NFE3.00
    DataSaida        := DateToStr(strDtSaida) + 'T' + mskHoraES.Text + '-03:00'; // NFE3.00
    HoraSaida        := mskHoraES.Text;
    dhCont           := '';
    xJust            := '';
    CRT              := '1';  // 1 Simples // 3 Normal
    SHORTDATEFORMAT  := 'dd/mm/yyyy';
    DecimalSeparator := '.';
    Natureza      := edtNatureza.Text; //Copy(dmBaseDados.tblANotaFiscalNewCFOP.AsString,7,60);
    NumeroNF      := dmBaseDados.tblANotaFiscalNewNrNF.AsString;
    strNFe        := dmBaseDados.tblANotaFiscalNewNrNF.AsString;
    TransNome     := formDigitaTransp.edtNomeTrans.Text;
    TransNome     := BuscarETroca(TransNome,'Á','A');
    TransNome     := BuscarETroca(TransNome,'Ã','A');
    TransNome     := BuscarETroca(TransNome,'À','A');
    TransNome     := BuscarETroca(TransNome,'É','E');
    TransNome     := BuscarETroca(TransNome,'Ê','E');
    TransNome     := BuscarETroca(TransNome,'&','e');
    TransNome     := BuscarETroca(TransNome,'Í','I');
    TransNome     := BuscarETroca(TransNome,'Ó','O');
    TransNome     := BuscarETroca(TransNome,'Ô','O');
    TransNome     := BuscarETroca(TransNome,'Õ','O');
    TransNome     := BuscarETroca(TransNome,'Ú','U');
    TransNome     := BuscarETroca(TransNome,'Ü','U');
    TransNome     := BuscarETroca(TransNome,'Ç','C');
    TransNome     := BuscarETroca(TransNome,'€','C');
    TransNome     := BuscarETroca(TransNome,'§','');
    TransCNPJ     := formDigitaTransp.edtCNPJTrans.Text;
    TransCNPJ     := BuscarETroca(TransCNPJ,'-','');
    TransCNPJ     := BuscarETroca(TransCNPJ,'.','');
    TransCNPJ     := BuscarETroca(TransCNPJ,'/','');
    TransCNPJ     := BuscarETroca(TransCNPJ,'\','');
    TransIE       := formDigitaTransp.edtInscTrans.Text;
    TransIE       := BuscarETroca(TransIE,'-','');
    TransIE       := BuscarETroca(TransIE,'.','');
    TransIE       := BuscarETroca(TransIE,'/','');
    TransIE       := BuscarETroca(TransIE,'\','');
    TransEndereco := formDigitaTransp.edtEndTrans.Text;
    TransEndereco := BuscarETroca(TransEndereco,'Á','A');
    TransEndereco := BuscarETroca(TransEndereco,'Ã','A');
    TransEndereco := BuscarETroca(TransEndereco,'À','A');
    TransEndereco := BuscarETroca(TransEndereco,'É','E');
    TransEndereco := BuscarETroca(TransEndereco,'Ê','E');
    TransEndereco := BuscarETroca(TransEndereco,'Í','I');
    TransEndereco := BuscarETroca(TransEndereco,'Ó','O');
    TransEndereco := BuscarETroca(TransEndereco,'Ô','O');
    TransEndereco := BuscarETroca(TransEndereco,'Õ','O');
    TransEndereco := BuscarETroca(TransEndereco,'Ú','U');
    TransEndereco := BuscarETroca(TransEndereco,'Ü','U');
    TransEndereco := BuscarETroca(TransEndereco,'Ç','C');
    TransEndereco := BuscarETroca(TransEndereco,'€','C');
    TransEndereco := BuscarETroca(TransEndereco,'§','');
    TransUF       := formDigitaTransp.edtEstadoTrans.Text;
    TransCidade   := formDigitaTransp.edtCidadeTrans.Text;
    TransCidade   := BuscarETroca(TransCidade,'Á','A');
    TransCidade   := BuscarETroca(TransCidade,'Ã','A');
    TransCidade   := BuscarETroca(TransCidade,'À','A');
    TransCidade   := BuscarETroca(TransCidade,'É','E');
    TransCidade   := BuscarETroca(TransCidade,'Ê','E');
    TransCidade   := BuscarETroca(TransCidade,'Í','I');
    TransCidade   := BuscarETroca(TransCidade,'Ó','O');
    TransCidade   := BuscarETroca(TransCidade,'Ô','O');
    TransCidade   := BuscarETroca(TransCidade,'Õ','O');
    TransCidade   := BuscarETroca(TransCidade,'Ú','U');
    TransCidade   := BuscarETroca(TransCidade,'Ü','U');
    TransCidade   := BuscarETroca(TransCidade,'Ç','C');
    TransCidade   := BuscarETroca(TransCidade,'€','C');
    TransCidade   := BuscarETroca(TransCidade,'§','');
    TransPlaca    := formDigitaTransp.edtPlaca.Text;
    TransPlaca    := BuscarETroca(TransPlaca,'-','');
    TransPlaca    := BuscarETroca(TransPlaca,'.','');
    TransPlaca    := BuscarETroca(TransPlaca,'/','');
    TransPlaca    := BuscarETroca(TransPlaca,'\','');
    TransPlaca    := BuscarETroca(TransPlaca,'_','');
    TransUFPlaca  := formDigitaTransp.edtPlacaUF.Text;
    PesoB         := FormatFloat('0.000',strPesoB);
    PesoL         := FormatFloat('0.000',strPesoL);
    Volume        := FloatToStr(strVolume);
    if (strVolume = 0) then
     begin
      Volume := '';
     end;
    ClienteDest   := dmBaseDados.tblFornecedoresRazaoSocial.AsString;
    ClienteDest   := BuscarETroca(ClienteDest,'Á','A');
    ClienteDest   := BuscarETroca(ClienteDest,'Ã','A');
    ClienteDest   := BuscarETroca(ClienteDest,'À','A');
    ClienteDest   := BuscarETroca(ClienteDest,'É','E');
    ClienteDest   := BuscarETroca(ClienteDest,'Ê','E');
    ClienteDest   := BuscarETroca(ClienteDest,'&','e');
    ClienteDest   := BuscarETroca(ClienteDest,'Í','I');
    ClienteDest   := BuscarETroca(ClienteDest,'Ó','O');             
    ClienteDest   := BuscarETroca(ClienteDest,'Ô','O');
    ClienteDest   := BuscarETroca(ClienteDest,'Õ','O');
    ClienteDest   := BuscarETroca(ClienteDest,'Ú','U');
    ClienteDest   := BuscarETroca(ClienteDest,'Ü','U');
    ClienteDest   := BuscarETroca(ClienteDest,'Ç','C');
    ClienteDest   := BuscarETroca(ClienteDest,'€','C');
    ClienteDest   := BuscarETroca(ClienteDest,'§','');
    ClienteDest   := ClienteDest + ' ' + dmBaseDados.tblFornecedoresCodigoFornecedor.AsString;
    ClienteDest   := Copy(ClienteDest,1,60);
    EnderecoDest  := dmBaseDados.tblFornecedoresEndereco.AsString;
    EnderecoDest  := BuscarETroca(EnderecoDest,'Á','A');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ã','A');
    EnderecoDest  := BuscarETroca(EnderecoDest,'À','A');
    EnderecoDest  := BuscarETroca(EnderecoDest,'É','E');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ê','E');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Í','I');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ó','O');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ô','O');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Õ','O');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ú','U');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ü','U');
    EnderecoDest  := BuscarETroca(EnderecoDest,'Ç','C');
    EnderecoDest  := BuscarETroca(EnderecoDest,'€','C');
    EnderecoDest  := BuscarETroca(EnderecoDest,'§','');
    BairroDest    := dmBaseDados.tblFornecedoresBairro.AsString;
    BairroDest    := BuscarETroca(BairroDest,'Á','A');
    BairroDest    := BuscarETroca(BairroDest,'Ã','A');
    BairroDest    := BuscarETroca(BairroDest,'À','A');
    BairroDest    := BuscarETroca(BairroDest,'É','E');
    BairroDest    := BuscarETroca(BairroDest,'Ê','E');
    BairroDest    := BuscarETroca(BairroDest,'Í','I');
    BairroDest    := BuscarETroca(BairroDest,'Ó','O');
    BairroDest    := BuscarETroca(BairroDest,'Ô','O');
    BairroDest    := BuscarETroca(BairroDest,'Õ','O');
    BairroDest    := BuscarETroca(BairroDest,'Ú','U');
    BairroDest    := BuscarETroca(BairroDest,'Ü','U');
    BairroDest    := BuscarETroca(BairroDest,'Ç','C');
    BairroDest    := BuscarETroca(BairroDest,'€','C');
    BairroDest    := BuscarETroca(BairroDest,'§','');
    CidadeDest    := dmBaseDados.tblFornecedoresCidade.AsString;
    CidadeDest    := BuscarETroca(CidadeDest,'Á','A');
    CidadeDest    := BuscarETroca(CidadeDest,'Ã','A');
    CidadeDest    := BuscarETroca(CidadeDest,'À','A');
    CidadeDest    := BuscarETroca(CidadeDest,'É','E');
    CidadeDest    := BuscarETroca(CidadeDest,'Ê','E');
    CidadeDest    := BuscarETroca(CidadeDest,'Í','I');
    CidadeDest    := BuscarETroca(CidadeDest,'Ó','O');
    CidadeDest    := BuscarETroca(CidadeDest,'Ô','O');
    CidadeDest    := BuscarETroca(CidadeDest,'Õ','O');
    CidadeDest    := BuscarETroca(CidadeDest,'Ú','U');
    CidadeDest    := BuscarETroca(CidadeDest,'Ü','U');
    CidadeDest    := BuscarETroca(CidadeDest,'Ç','C');
    CidadeDest    := BuscarETroca(CidadeDest,'€','C');
    CidadeDest    := BuscarETroca(CidadeDest,'§','');
    NumeroDest    := dmBaseDados.tblFornecedoresNumero.AsString;
    ComplDest     := dmBaseDados.tblFornecedoresComplemento.AsString;
    ComplDest     := BuscarETroca(ComplDest,'Á','A');
    ComplDest     := BuscarETroca(ComplDest,'Ã','A');
    ComplDest     := BuscarETroca(ComplDest,'À','A');
    ComplDest     := BuscarETroca(ComplDest,'É','E');
    ComplDest     := BuscarETroca(ComplDest,'Ê','E');
    ComplDest     := BuscarETroca(ComplDest,'Í','I');
    ComplDest     := BuscarETroca(ComplDest,'Ó','O');
    ComplDest     := BuscarETroca(ComplDest,'Ô','O');
    ComplDest     := BuscarETroca(ComplDest,'Õ','O');
    ComplDest     := BuscarETroca(ComplDest,'Ú','U');
    ComplDest     := BuscarETroca(ComplDest,'Ü','U');
    ComplDest     := BuscarETroca(ComplDest,'Ç','C');
    ComplDest     := BuscarETroca(ComplDest,'€','C');
    ComplDest     := BuscarETroca(ComplDest,'§','');
    CEPDest       := dmBaseDados.tblFornecedoresCEP.AsString;
    CEPDest       := BuscarETroca(CEPDest,'-','');
    CEPDest       := BuscarETroca(CEPDest,'.','');
    CEPDest       := BuscarETroca(CEPDest,' ','');
    TelDest       := dmBaseDados.tblFornecedoresTelefone.AsString;
    TelDest       := BuscarETroca(TelDest,'.','');
    TelDest       := BuscarETroca(TelDest,'(','');
    TelDest       := BuscarETroca(TelDest,')','');
    TelDest       := BuscarETroca(TelDest,'-','');
    TelDest       := BuscarETroca(TelDest,' ','');
    IEDest        := dmBaseDados.tblFornecedoresInscricao.AsString;
    IEDest        := BuscarETroca(IEDest,'.','');
    IEDest        := BuscarETroca(IEDest,'-','');
    IEDest        := BuscarETroca(IEDest,' ','');
    CodigoIBGE    := dmBaseDados.tblFornecedoresCodigoIBGE.AsString;
    EstadoDest    := dmBaseDados.tblFornecedoresEstado.AsString;
    emailDest     := dmBaseDados.tblFornecedoresEmail.AsString;
    emailDest2    := ''; //dmBaseDados.tblFornecedoresEmailNFe2.AsString;
    emailDest3    := ''; //dmBaseDados.tblFornecedoresEmailNFe3.AsString;
    if( (Natureza = 'VENDA')and(EstadoDest <> 'SP') )then
     begin
      Natureza := 'VENDA PARA OUTRO ESTADO';
     end;
    //--
    // GERAÇÃO NOTA FISCAL ELETRÔNICA
    cDV      := '';
    idDest   := '1'; // 1 Operação interna;  2 Operação interestadual;  3 Operação com exterior.
    finNFe   := '4'; // 1 NF-e normal  /  2 NF-e complementar / 3 NF-e de ajuste / 4 Devolução de mercadoria.
    indFinal := '0';
    indPres  := '1'; // 0 Não se aplica (por exemplo, Nota Fiscal complementar ou de ajuste);  1 Operação presencial;  2 Operação não presencial, pela Internet;  3 Operação não presencial, Teleatendimento;  4 NFC-e em operação com entrega a domicílio;  9 Operação não presencial, outros.
    if (EstadoDest <> 'SP') then
     begin
      idDest := '2';
     end;
    if( rdgEntSaida.ItemIndex = 0 )then
     begin
      strEntrSaida := '1'; // Nota Saída
     end
    else
     begin
      strEntrSaida := '0'; // Nota Entrada
     end;
    if (rdgFinalidade.ItemIndex = 0) then
     begin
      //Writeln(ArquivoNFe, 'B|35||'  +Natureza+'|'  +'2'+'|'  +'55'+'|'  +'1'+'|'  +NumeroNF+'|'  +DataEmissao+'|'  +DataSaida+'|'  +strEntrSaida+'|'  +idDest+'|'  +'3534401'+'|'  +'1'+'|'  +'1'+'|'  +cDV+'|'  +'1'+'|'  +finNFe+'|'  +indFinal+'|'  +indPres+'|'  +'3'+'|'  +'3.10|'  +dhCont+'|'  +xJust+'|'); //Versao 3.10
     end
    else
     begin
      finNFe := '1';  // 1 NF-e normal  /  2 NF-e complementar / 3 NF-e de ajuste / 4 Devolução de mercadoria.
     end;
    //--
    if (ckbAVista.Checked = True) then
     begin
      indPag := '0';
     end
    else
     begin
      indPag := '1';
     end;
    //--
    // 4.00 Dados da Nota
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
    with (ACBrNFe1.NotasFiscais.Add.NFe) do
      BEGIN
       strCNF       := Copy(strCNPJ,13,2) + Copy(strCNPJ,6,3) + Copy(strCNPJ,2,3);
       Ide.cNF      := StrToInt(strCNF);                                        // Ide.cNF := StrToInt(NumeroNF);  dmNFe.qNFeCNF.AsInteger; //(leNumeroNFe2.Text); //Caso nÃ£o seja preenchido serÃ¡ gerado um nÃºmero aleatÃ³rio pelo componente
       Ide.natOp    := Natureza;                                                // dmNFe.qNFeNatOp.AsString; //leNaturezaOperacao.Text;
       Ide.modelo   := 55;
       Ide.serie    := 1;                                                       // dmNFe.qNFeSerie.AsInteger; //StrToInt(leSerie.Text);
       Ide.nNF      := StrToInt(NumeroNF);                                      // dmNFe.qNFeNNF.AsInteger; //StrToInt(leNumeroNFe2.Text);
       Ide.dEmi     := StrToDateTime(sDataEmissao  +' '+sHoraEmissao);          // dmNFe.qNFeDEmi.AsDateTime; //Date;
       Ide.dSaiEnt  := StrToDateTime(mskDataES.Text+' '+mskHoraES.Text);        // dmNFe.qNFeDSaiEnt.AsDateTime; //Date;
       Ide.hSaiEnt  := Time;
       if( rdgEntSaida.ItemIndex = 0 )then
        begin
         Ide.tpNF   := tnSaida;                                                 // TpcnTipoNFe(dmNFe.qNFeTpNF.AsInteger); //cbTipoDocumento.ItemIndex);
        end
       else
        begin
         Ide.tpNF   := tnEntrada;                                               // TpcnTipoNFe(dmNFe.qNFeTpNF.AsInteger); //cbTipoDocumento.ItemIndex);
        end;
       Ide.idDest   := StrToDestinoOperacao(ok,idDest);                         // TpcnDestinoOperacao(StrToInt(idDest));    // TpcnDestinoOperacao(dmNFe.qNFeIdDest.AsInteger); //cbDestinoOperacao.ItemIndex);
       Ide.tpEmis   := teNormal;                                                // TpcnTipoEmissao(Ini.ReadInteger('Geral','FormaEmissao',0));
       Ide.TpAmb    := taProducao;                                              // TpcnTipoAmbiente(Ini.ReadInteger('WebService','Ambiente',0)); //taHomologacao; //Lembre-se de trocar esta variÃ¡vel quando for para ambiente de produÃ§Ã£o    XXXXXX   AQUI
       Ide.verProc  := '1.0.0.0';                                               // Versão do seu sistema
       Ide.cUF      := 35;                                                      // UFtoCUF(Ini.ReadString('Emitente','UF',''));
       Ide.cMunFG   := 3534401;                                                 // Ini.ReadInteger('Emitente','CodCidade',0);
       Ide.finNFe   := StrToFinNFe(ok,finNFe);                                  // TpcnFinalidadeNFe(dmNFe.qNFeFinNFe.AsInteger); //cbFinalidadeEmissao.ItemIndex);
       Ide.indPres  := StrToPresencaComprador(ok,indPres);                      // TpcnPresencaComprador(dmNFe.qNFeIndPres.AsInteger); //cbTipoAtendimento.ItemIndex);
       Ide.indFinal := StrToConsumidorFinal(ok,indFinal);                       // TpcnConsumidorFinal(dmNFe.qNFeIndFinal.AsInteger); //cbConsumidorFinal.ItemIndex);
      //--
      if (edtChaveFornec.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec.Text;
       end;
      if (edtChaveFornec2.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec2.Text;
       end;
      if (edtChaveFornec3.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec3.Text;
       end;
      if (edtChaveFornec4.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec4.Text;
       end;
      if (edtChaveFornec5.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec5.Text;
       end;
      if (edtChaveFornec6.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec6.Text;
       end;
      if (edtChaveFornec7.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec7.Text;
       end;
      if (edtChaveFornec8.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec8.Text;
       end;
      if (edtChaveFornec9.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec9.Text;
       end;
      if (edtChaveFornec10.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec10.Text;
       end;
      if (edtChaveFornec11.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec11.Text;
       end;
      if (edtChaveFornec12.Text <> '') then
       begin
        Ide.NFref.Add.refNFe := edtChaveFornec12.Text;
       end;

      // 4.00 Dados Emitente
      Emit.CNPJCPF           := '40667557000103';
      Emit.IE                := '120301220112';
      Emit.xNome             := 'PERFIL AUTO PECAS LTDA';
      Emit.xFant             := '';
      Emit.EnderEmit.fone    := '';
      Emit.EnderEmit.CEP     := 06060003;
      Emit.EnderEmit.xLgr    := 'AVENIDA ANALICE SAKATAUSKAS';
      Emit.EnderEmit.nro     := '580';
      Emit.EnderEmit.xCpl    := 'SALA 02';
      Emit.EnderEmit.xBairro := 'BELA VISTA';
      Emit.EnderEmit.cMun    := 3534401;
      Emit.EnderEmit.xMun    := 'OSASCO';
      Emit.EnderEmit.UF      := 'SP';
      Emit.enderEmit.cPais   := 1058;
      Emit.enderEmit.xPais   := 'BRASIL';
      Emit.IEST              := '';
      Emit.IM                := '';                                             // Preencher no caso de existir serviços na nota
      Emit.CNAE              := '';                                             // Verifique na cidade do emissor da NFe se é permitido a inclusão de serviços na NFe
      Emit.CRT               := crtRegimeNormal;                                // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)


      if( (dmBaseDados.tblFornecedoresInscricao.AsString <> 'ISENTO')and(dmBaseDados.tblFornecedoresInscricao.AsString <> 'isento')and(dmBaseDados.tblFornecedoresInscricao.AsString <> 'Isento') )then
       begin
        indIEDest := '1';
       end
      else
       begin
        indIEDest := '2';
       end;
      //--
      sCNPJCPF := strCNPJ;
      if( (dmBaseDados.tblFornecedoresInscricao.AsString = 'ISENTO')and(dmBaseDados.tblFornecedoresInscricao.AsString = 'isento')and(dmBaseDados.tblFornecedoresInscricao.AsString = 'Isento') )then
       begin
        IEDest := '';
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
      if (CepDest <> '') then
       begin
        Dest.EnderDest.CEP   := StrToInt(CEPDest);
       end;
      Dest.EnderDest.xLgr    := EnderecoDest;
      Dest.EnderDest.nro     := NumeroDest;
      Dest.EnderDest.xCpl    := ComplDest;
      Dest.EnderDest.xBairro := BairroDest;
      if (CodigoIBGE <> '') then
       begin
        Dest.EnderDest.cMun    := StrToInt(CodigoIBGE);
       end;
      Dest.EnderDest.xMun    := CidadeDest;
      Dest.EnderDest.UF      := EstadoDest;
      Dest.EnderDest.cPais   := 1058;
      Dest.EnderDest.xPais   := 'BRASIL';
      Dest.Email             := emailDest;
      //--
      Contador := 0;
      while (not dmBaseDados.tblLogMensal.Eof) do
        Begin
         strCfopMudou2 := '0';
         strCalcST     := 0;
         Contador     := Contador + 1 ;
         CodigoProd   := dmBaseDados.tblLogMensalCodigoProduto.AsString;
         CodigoProd   := BuscarETroca(CodigoProd,'.','');
         CodigoProd   := BuscarETroca(CodigoProd,'-','');
         CodigoProd   := BuscarETroca(CodigoProd,'/','');
         CodigoProd   := BuscarETroca(CodigoProd,'\','');
         CodigoProd   := BuscarETroca(CodigoProd,',','');
         CodigoProd   := BuscarETroca(CodigoProd,'Ç','C');
         CodigoProd   := BuscarETroca(CodigoProd,'€','C');
         CodigoProd   := BuscarETroca(CodigoProd,'§','');
         CodigoProd   := BuscarETroca(CodigoProd,'&','');
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
         DescriProd   := BuscarETroca(DescriProd,'`','');
         DescriProd   := BuscarETroca(DescriProd,'´','');
         DescriProd   := BuscarETroca(DescriProd,'"','');
         DescriProd   := BuscarETroca(DescriProd,'~','');
         DescriProd   := BuscarETroca(DescriProd,'^','');
         DescriProd   := BuscarETroca(DescriProd,'»','');
         DescriProd   := BuscarETroca(DescriProd,'.','');
         DescriProd   := BuscarETroca(DescriProd,',','');
         DescriProd   := BuscarETroca(DescriProd,'º','o');
         DescriProd   := BuscarETroca(DescriProd,'ª','a');
         if (Copy(DescriProd,1,2) = 'F ') then
          begin
           DescriProd := Copy(DescriProd,3,80);
          end;
         NCMProd      := dmBaseDados.tblLogMensalNCM.AsString;
         NCMProd      := BuscarETroca(NCMProd,'.','');
         NCMProd      := BuscarETroca(NCMProd,'-','');
         NCMProd      := BuscarETroca(NCMProd,'/','');
         NCMProd      := BuscarETroca(NCMProd,',','');
         CFOPProd     := dmBaseDados.tblLogMensalDocumento.AsString; //( Copy(dmBaseDados.tblANotaFiscalNewCFOP.AsString,1,1) + Copy(dmBaseDados.tblANotaFiscalNewCFOP.AsString,3,3) );
         UnidadeProd  := dmBaseDados.tblLogMensalUnidadeMedida.AsString;
         UnidadeProd  := BuscarETroca(UnidadeProd,'€','C');
         UnidadeProd  := BuscarETroca(UnidadeProd,'§','');
         UnidadeProd  := BuscarETroca(UnidadeProd,'Ç','C');
         UnidadeTrib  := dmBaseDados.tblLogMensalUnidadeMedida.AsString;
         UnidadeTrib  := BuscarETroca(UnidadeTrib,'€','C');
         UnidadeTrib  := BuscarETroca(UnidadeTrib,'§','');
         UnidadeTrib  := BuscarETroca(UnidadeTrib,'Ç','C');
         QtdeProd     := FormatFloat('0.0000',dmBaseDados.tblLogMensalQuantidade.AsFloat);
         QtdeTrib     := FormatFloat('0.0000',dmBaseDados.tblLogMensalQuantidade.AsFloat);
         VUnProd      := FormatFloat('0.0000',dmBaseDados.tblLogMensalValorDinheiro.AsFloat);
         VTotalProd   := FormatFloat('0.00',dmBaseDados.tblLogMensalValorLancamento.AsFloat);
         VTotalTrib   := FormatFloat('0.0000',dmBaseDados.tblLogMensalValorDinheiro.AsFloat);
         PercReducao  := FormatFloat('0.00',dmBaseDados.tblLogMensalDesconCT.AsFloat);
         BaseICMS     := FormatFloat('0.00',dmBaseDados.tblLogMensalSubtotal.AsFloat);
         ValorICMS    := FormatFloat('0.00',dmBaseDados.tblLogMensalSubQtde.AsFloat);
         BaseST       := FormatFloat('0.00',dmBaseDados.tblLogMensalSubPeso.AsFloat);
         IcmsST       := FormatFloat('0.00',dmBaseDados.tblLogMensalTroco.AsFloat);
         AliqICMS     := FormatFloat('0.0000',dmBaseDados.tblLogMensalDescon.AsFloat);
         ValorIPI     := FormatFloat('0.00',dmBaseDados.tblLogMensalValorIPI.AsFloat);
         AliqIPI      := FormatFloat('0.00',dmBaseDados.tblLogMensalIPI.AsFloat);
         vTotTrib     := FormatFloat('0.00',dmBaseDados.tblLogMensalEmprestimo.AsFloat);
         vPOutro      := FormatFloat('0.00',dmBaseDados.tblLogMensalEcommerce.AsFloat);
         CSTProd      := dmBaseDados.tblLogMensalFamilia.AsString;
         OrigemProd   := '0';
         ModalidadeBC := '3';
         vPDesc       := '';
         vPFrete      := FormatFloat('0.00',strPFrete);
         if (dmBaseDados.tblLogMensalCodigoProduto.AsString <> '') then
           Begin
            //Gravando dados do produto...:
            DescriProd := Copy(DescriProd,1,42);
            if (vPOutro = '0.00') then
             begin
              vPOutro    := '';
             end;
            if (vPFrete = '0.00') then
             begin
              vPFrete   := '0';
             end;
            DespAC      := '';
            indTot      := '1';
            xPed        := '';
            nItemPed    := '';
            vCredICMS   := '0';
            vCredICMSSN := '0';
            if (Contador = 1) then
             Begin
              {if (strDespAC > 0) then
               begin
                vPOutro := FormatFloat('0.00',strDespAC);
               end;}
              {if (strFrete > 0) then
               begin
                vPFrete := FormatFloat('0.00',strFrete);
               end; }
             End;
            if (CFOPProd = '5405') then
             begin
              strTem5405 := 1;
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
               //Prod.CEST     := CEST;
               Prod.CFOP     := CFOPProd;
               Prod.uTrib    := UnidadeProd;
               Prod.qTrib    := StrToFloat(QtdeProd);
               Prod.vUnTrib  := StrToFloat(VUnProd);
               Prod.vSeg     := 0.00;
               Prod.vDesc    := StrToFloat(vPDesc);
               Prod.vFrete   := StrToFloat(vPFrete);
               if (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '789')
               or (Copy(dmBaseDados.tblLogMensalObservacao.AsString,1,3) = '790') then
                begin
                 Prod.cEAN     := dmBaseDados.tblLogMensalObservacao.AsString;
                 Prod.cEANTrib := dmBaseDados.tblLogMensalObservacao.AsString;
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


               AliqST       := AliqICMS;
               if (rdgTipoOperacao.ItemIndex = 1) then
                begin
                 AliqST := '18';
                end;
               OrigemProd := Copy(CSTProd,1,1);
               // 090
               if (Copy(CSTProd,2,2) = '90') then  // Outros
                 begin
                  //4.00
                  Imposto.ICMS.CST         := cst90;
                  Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
                  Imposto.ICMS.modBC       := StrTomodBC(ok,ModalidadeBC);
                  Imposto.ICMS.vBC         := StrToFloat(BaseICMS);
                  Imposto.ICMS.pRedBC      := 0;
                  Imposto.ICMS.pICMS       := StrToFloat(AliqICMS);
                  Imposto.ICMS.vICMS       := StrToFloat(ValorICMS);
                  Imposto.ICMS.modBCST     := StrTomodBCST(ok,ModalidadeBC);
                  Imposto.ICMS.pMVAST      := 0;
                  Imposto.ICMS.pRedBCST    := 0;
                  Imposto.ICMS.vBCST       := 0;
                  Imposto.ICMS.pICMSST     := 0;
                  Imposto.ICMS.vICMSST     := 0;
                  //Imposto.ICMS.pCredSN     := 0;
                  //Imposto.ICMS.vCredICMSSN := 0;
                 end;
               // 000 / 020
               if( (Copy(CSTProd,2,2) = '00')or(Copy(CSTProd,2,2) = '20') )then
                 begin
                  BaseICMS    := VTotalProd;
                  strCalcIcms := ( (StrToFloat(BaseICMS))*(StrToFloat(AliqICMS)/100) );
                  ValorICMS   := FormatFloat('0.00',strCalcIcms);
                  Imposto.ICMS.CST   := cst00;
                  Imposto.ICMS.orig  := oeNacional; //StrToOrig(ok,OrigemProd);
                  Imposto.ICMS.modBC := StrTomodBC(ok,ModalidadeBC);
                  Imposto.ICMS.vBC   := StrToFloat(BaseICMS);
                  Imposto.ICMS.pICMS := StrToFloat(AliqICMS);
                  Imposto.ICMS.vICMS := StrToFloat(ValorICMS);
                 end;
               // 010
               if (Copy(CSTProd,2,2) = '10') then
                 begin
                  OrigemProd   := '0';
                  ModalidadeBC := '4';
                  pMVAST       := '';
                  AliqST       := '0.00';
                  //4.00
                  Imposto.ICMS.CST       := cst10;
                  Imposto.ICMS.orig      := oeNacional; //StrToOrig(ok,OrigemProd);
                  Imposto.ICMS.modBC     := StrTomodBC(ok,ModalidadeBC);
                  Imposto.ICMS.vBC       := StrToFloat(BaseICMS);
                   Imposto.ICMS.pICMS     := StrToFloat(AliqICMS);
                  Imposto.ICMS.vICMS     := StrToFloat(ValorICMS);
                  Imposto.ICMS.modBCST   := StrTomodBCST(ok,'4');
                  Imposto.ICMS.pMVAST    := 0;
                  Imposto.ICMS.pRedBCST  := 0;
                  Imposto.ICMS.vBCST     := StrToFloat(BaseST);
                  Imposto.ICMS.pICMSST   := StrToFloat(AliqST);
                  Imposto.ICMS.vICMSST   := StrToFloat(IcmsST);

                  {// 4.00
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
                  }
                 end;
               // 040 / 041 / 050 / 051
               if (Copy(CSTProd,2,2) = '40')or(Copy(CSTProd,2,2) = '41')or(Copy(CSTProd,2,2) = '50')or(Copy(CSTProd,2,2) = '51') then
                 begin
                  Imposto.ICMS.CST  := cst40;
                  Imposto.ICMS.orig := oeNacional; //StrToOrig(ok,OrigemProd);
                  {// 4.00
                  Imposto.ICMS.CSOSN := csosn102;
                  Imposto.ICMS.orig  := oeNacional; //StrToOrig(ok,OrigemProd);}
                 end;
               // 060 / 070
               if( (Copy(CSTProd,2,2) = '60')or(Copy(CSTProd,2,2) = '70') )then
                 begin
                  ModalidadeBC := '';
                  Imposto.ICMS.CST     := cst60;
                  Imposto.ICMS.orig    := oeNacional; //StrToOrig(ok,OrigemProd);
                  Imposto.ICMS.vBCST   := StrToFloat(BaseST);
                  Imposto.ICMS.vICMSST := StrToFloat(IcmsST);
                  {// 4.00
                  Imposto.ICMS.CSOSN   := csosn500;
                  Imposto.ICMS.orig    := oeNacional; //StrToOrig(ok,OrigemProd);
                  Imposto.ICMS.modBCST := StrTomodBCST(ok,ModalidadeBC);
                  Imposto.ICMS.vBCST   := StrToFloat(BaseST);
                  Imposto.ICMS.vICMSST := StrToFloat(IcmsST);}
                  // NT 07/05/2019
                  if (indFinal <> '1') then
                   begin
                    Imposto.ICMS.vBCSTRet := 0;
                    Imposto.ICMS.pST      := 0;
                    Imposto.ICMS.vICMSSubstituto := 0;
                    Imposto.ICMS.vICMSSTRet := 0;
                   end;
                 end;

               //4.00  PIS
               Imposto.PIS.CST  := pis07;
               //4.00  PIS
               Imposto.COFINS.CST  := cof07;
              End; // Det.Add
           End;  // if codprod <> ''
         {strTotalPIS    := strTotalPIS    + strPIS;  strTotalCOFINS := strTotalCOFINS + strCOF;}
         dmBaseDados.tblLogMensal.Next;
        End; //end do WHILE
      //--
      dmBaseDados.tblANotaFiscalNew.Edit;
      dmBaseDados.tblANotaFiscalNewPIS.AsFloat    := strTotalPIS;
      dmBaseDados.tblANotaFiscalNewCOFINS.AsFloat := strTotalCOFINS;
      dmBaseDados.tblANotaFiscalNewValorVista.AsFloat := (dmBaseDados.tblANotaFiscalNewValorVista.AsFloat)-(strDescRamo6 + strDescRamo7);
      dmBaseDados.tblANotaFiscalNew.Post;
      dmBaseDados.tblANotaFiscalNew.FlushBuffers;
      vBC     := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewBaseCalculo.AsFloat);
      vICMS   := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewValorICMS.AsFloat);
      vICMSDeson := '0.00';    //Versao 3.10  Valor de ICMS desonerado
      vBCST   := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewBaseST.AsFloat);
      vST     := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewIcmsST.AsFloat);
      vProd   := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewValorTNF.AsFloat);
      vIPI    := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewIPI.AsFloat);
      vPIS    := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewPIS.AsFloat);
      vCOFINS := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewCOFINS.AsFloat);
      vFrete  := FormatFloat('0.00',strFrete);
      vSeg    := '0.00';
      vDesc   := FormatFloat('0.00', strDescNFe + strDescRamo6 + strDescRamo7);
      vII     := '0.00';
      vOutro  := FormatFloat('0.00',strDespAC);
      vTTotTrib := FormatFloat('0.00',dmBaseDados.tblANotaFiscalNewVTributos.AsFloat);
      if (strTotalST = 0) then
       begin
        vNF := FormatFloat('0.00',(dmBaseDados.tblANotaFiscalNewValorTNF.AsFloat + strDespAC + strFrete) - (strDescNFe + strDescRamo6 + strDescRamo7));
       end
      else
       begin
        vNF := FormatFloat('0.00',(dmBaseDados.tblANotaFiscalNewValorTNF.AsFloat + dmBaseDados.tblANotaFiscalNewIcmsST.AsFloat + dmBaseDados.tblANotaFiscalNewIPI.AsFloat + strDespAC + strFrete) - (strDescNFe + strDescRamo6 + strDescRamo7));
       end;
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

      // 4.00
      {Total.ICMSTot.vIPIDevol := 0; //Soma com o Total da NFe
       // Fundo combate a pobreza APENAS PARA ESTADOS QUE RECOLHEM FCP INTERNAMENTE ****
       Total.ICMSTot.vFCP      := 0;
       Total.ICMSTot.vFCPST    := 0;
       Total.ICMSTot.vFCPSTRet := 0; }

      // Lei da transparencia de impostos
      Total.ICMSTot.vTotTrib := StrToFloat(vTTotTrib);

      // NovaTag Novo Grupo 'Pag' 4.00 Informação de pagamentos OBRIGATÓRIO ****
      with (Pag.Add) do
        begin
         tPag      := fpSemPagamento;
         vPag      := 0; //StrToFloat(vNF);
         //tpIntegra := tiPagNaoIntegrado;
         //CNPJ      := ;
         //tBand     := ;
         //cAut      := ;
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
         Especie := edtEspecie.Text;
         // 4.00
         with (Vol.Add) do
          begin
           if (Volume <> '') then
            begin
             qVol  := StrToInt(Volume);
            end;
           esp   := Especie;
           //marca := 'Marca';
           //nVol  := 'Numero';
           pesoL := strPesoL;
           pesoB := strPesoB;
          end;
        end; // end with Transp
      //--

      if( (rdgTipoOperacao.ItemIndex = 0)and(ckbPrazo.Checked = True) )then
       Begin
        // Tags 'Y', ´referentes ao desdobro dos pagamentos...
        NumFatura  := NumeroNF;
        VFatura    := vNF;
        DescFatura := '';
        VLiqFatura := '';
        if (strVenc1 <> '') then
         begin
          strValor1 := FloatToStr(fltValor1);
         end;
       End;
      if (strTem5405 = 1) then
       begin
        strMensagem1 := 'CFOP 5.405 - IMPOSTO RECOLHIDO POR ST ART. 313Z13,313M,313Q,313U DEC. 54251/09(RICMS/SP). / '
       end;
      strMensagem2 := 'De acordo com a Portaria Cat 162/2008 artigo 18 Inciso I Alinea b, e permitido o cancelamento de NF-e somente em ate 24 horas apos sua emissao. / ';
      if (strDescRamo6 > 0) then
       begin
        strMensagem3 := 'DESCONTO ICMS DE ' +FormatFloat('R$ 0.00',strDescRamo6) + ' CONFORME ATR.55-PARAGRAFO 4 DO RICMS-SP. / ';
       end;
      if (strDescRamo7 > 0) then
       begin
        strMensagem4 := 'RETENCAO NA FONTE DE 5,85% (PIS/COFINS/CSLL/IR) DE ' +FormatFloat('R$ 0.00',strDescRamo7) + ' - INSTRUCAO NORMATIVA SRF539 25/04/2005. / ';
       end;
      if( (strBase060 > 0) )then
       begin
        strMensagem5 := 'De acordo com a Portaria Cat 162/2008 artigo 18. TOTAL BCST: ' +FormatFloat('R$ 0.00',strBase060) + '  TOTAL ICMS-ST: ' +FormatFloat('R$ 0.00',strIcms060) + ' / ';
       end;
      if( (Copy(cmbCfop.Text,1,5) = '5.929')or(Copy(cmbCfop.Text,1,5) = '6.929') )then
       begin
        strMensagem6 := 'Venda com imposto recolhido por ECF Nº: ' + edtCupom.Text + ' / ';
       end;
      //--
      // 4.00
      with (InfAdic) do
       begin
        infCpl     := edtObsComp.Text+ ' / De acordo com a Portaria Cat 162/2008 artigo 18 Inciso I Alinea b, e permitido o cancelamento de NF-e somente em ate 24 horas apos sua emissao. / ' +'NFe emitida por ME, optante pelo Simples Nacional. Nao gera direito a credito de IPI. '  + strMsgTrib;
        infAdFisco := '';
       end;
      DecimalSeparator := ',';
     END; // 1º with
  //...FIM da geração do arquivo para Nota Fiscal Eletrônica.
//***-------------------------------------------------------------------------------------------------------------------------------------------------***

// Carregando o arquivo TXT
{ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add;
NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);
NFeRTXT.CarregarArquivo('F:\NFeAt\' + 'D' +mskNrNotaFiscal.Text +'.txt');
if (NFeRTXT.LerTxt) then
 NFeRTXT.Free
else
 begin
  NFeRTXT.Free;
  ShowMessage('Arquivo NFe Inválido');
  Exit;
 end;       }
// Salvando e gerando o XML
//ACBrNFe1.WebServices.StatusServico.Executar;
//ShowMessage(ACBrNFe1.WebServices.StatusServico.Msg);
DecimalSeparator := ',';
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.tblANotaFiscalNew.Post;
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;                    
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.tblANotaFiscalNewEspecie.AsString     := 'D';
dmBaseDados.tblANotaFiscalNew.Post;
ACBrNFe1.WebServices.Envia(1);

//------------------------------------------------------------------------------

if (ACBrNFe1.WebServices.Retorno.cStat = 105) then // Lote em processamento
repeat
Application.MessageBox('Envio da NFE - Lote em processamento.' +#13 + 'Aguarde 2 minutos e Clique em OK !!!', 'MBJ', MB_OK);
ACBrNFe1.WebServices.Retorno.Recibo := ACBrNFe1.WebServices.Enviar.Recibo;

until ACBrNFe1.WebServices.Retorno.Executar;
dmBaseDados.tblANotaFiscalNew.Edit;
//vRecibo:= ACBrNFe1.WebServices.Retorno.Recibo;
dmBaseDados.tblANotaFiscalNewStatus.AsInteger     := ACBrNFe1.WebServices.Consulta.cStat;
dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := ACBrNFe1.WebServices.Retorno.ChaveNFe;
dmBaseDados.tblANotaFiscalNew.Post;

//------------------------------------------------------------------------------

ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;
stsRetorno := ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
strMotivo  := ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;

dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewStatus.AsInteger     := stsRetorno;
dmBaseDados.tblANotaFiscalNewMensagem.AsString    := strMotivo;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo;
if( (stsRetorno = 302)or(stsRetorno = 110) )then
 begin  dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := 'Nota DENEGADA';  dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := 'Nota DENEGADA'; end;

dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '-NFe.xml';  //ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
  NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
  ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
  dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString := 'F:\NFeAt\PathNFe\' + NomeArq;
dmBaseDados.tblANotaFiscalNew.Post;

// Enviando email do XML e PDF da NF-e
dmBaseDados.tblEmail.Open;
if (emailDest <> '') then
  Begin
    CC := TstringList.Create;
    try
      Para := emailDest;

      CC.Add(dmBaseDados.tblEmailUsuario.AsString);    //especifique um email valido

      if (emailDest2 <> '') then
       CC.Add(emailDest2);
      if (emailDest3 <> '') then
       CC.Add(emailDest3);

      ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
      ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
      ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
      ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.SetSSL   := dmBaseDados.tblEmailConexaoSegura.Value; // SSL - Conexao Segura
      ACBrMail1.SetTLS   := dmBaseDados.tblEmailConexaoSegura.Value; // Auto TLS
      ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
      ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
      ACBrMail1.FromName            := 'PERFIL AUTO PEÇAS NFe DEVOLUCAO Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
      strAssunto                    := 'PERFIL AUTO PEÇAS NFe DEVOLUCAO Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
      mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
      strMensagem     := mmEmailMsg.Lines;
      ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para,
                                                 strAssunto,
                                                 strMensagem
                                                 ,True  // Enviar PDF junto
                                                 ,CC    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                 ,nil); // Lista de anexos - TStrings    // nil
    finally
      CC.Free;
    end;
  End;
 DecimalSeparator := ',';
 END;
end;

procedure TformNFeDevolucaoNew.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformNFeDevolucaoNew.btnPrimeiroServicoClick(Sender: TObject);
begin
dmBaseDados.tblLogMensal.First;
end;

procedure TformNFeDevolucaoNew.btnUltimoServicoClick(Sender: TObject);
begin
dmBaseDados.tblLogMensal.Last;
end;

procedure TformNFeDevolucaoNew.btnGravarServicoClick(Sender: TObject);
var fltTot, vlBase, vlIcms,
    calcIcms, fltDspAc : Double;
    str090 : String;
begin
if( (dmBaseDados.tblLogMensal.State = dsEdit)or(dmBaseDados.tblLogMensal.State = dsInsert) )then
 begin
  dmBaseDados.tblLogMensal.Post;
 end;
fltTot   := 0;
vlBase   := 0;
vlIcms   := 0;
fltDspAc := 0;           
dmBaseDados.tblLogMensal.First;
while (not dmBaseDados.tblLogMensal.Eof) do
 Begin
  fltTot   := fltTot + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
  calcIcms := 0;
  str090   := Copy(dmBaseDados.tblLogMensalFamilia.AsString,2,2);
  if( (dmBaseDados.tblLogMensalDescon.AsFloat > 0)and(str090 = '90') )then
   begin
    vlBase   := vlBase + dmBaseDados.tblLogMensalValorLancamento.AsFloat;
    calcIcms := dmBaseDados.tblLogMensalValorLancamento.AsFloat * (dmBaseDados.tblLogMensalDescon.AsFloat/100);
    calcIcms := Arredondar(calcIcms,2);
    vlIcms   := vlIcms + calcIcms;
    dmBaseDados.tblLogMensal.Edit;
    dmBaseDados.tblLogMensalSubtotal.AsFloat := dmBaseDados.tblLogMensalValorLancamento.AsFloat;   //BaseIcms
    dmBaseDados.tblLogMensalSubQtde.AsFloat  := calcIcms;                                          //ValorIcms
    dmBaseDados.tblLogMensal.Post;
   end;
  dmBaseDados.tblLogMensal.Next;
 End;
edtTotalProd.Text  := FormatFloat('0.00',fltTot);
if (edtDespAc.Text <> '') then
 begin
  fltDspAc := StrToFloat(edtDespAc.Text);
  fltDspAc := Arredondar(fltDspAc,2)
 end; 
edtVTotalNF.Text   := FormatFloat('0.00',fltTot+fltDspAc);
edtBaseIcms.Text   := FormatFloat('0.00',vlBase);
edtVIcms.Text      := FormatFloat('0.00',vlIcms);
btnImprime.Enabled := True;
end;

procedure TformNFeDevolucaoNew.btnExcluirServicoClick(Sender: TObject);
begin
if (Application.MessageBox('Deseja excluir esse item ?','Tem Certeza?',MB_YESNO) = IDYES) then
 begin
  dmBaseDados.tblLogMensal.Delete;
 end;
end;

procedure TformNFeDevolucaoNew.grdProdutosColExit(Sender: TObject);
var strU, strQ : Double;           
begin
if( (dmBaseDados.tblLogMensalQuantidade.AsFloat <> strQ)
and (dmBaseDados.tblLogMensalValorDinheiro.AsFloat <> strU) )then
 begin
  dmBaseDados.tblLogMensal.Edit;
  dmBaseDados.tblLogMensalValorLancamento.AsFloat := dmBaseDados.tblLogMensalValorDinheiro.AsFloat * dmBaseDados.tblLogMensalQuantidade.AsFloat;
  dmBaseDados.tblLogMensalValorLancamento.AsFloat := Arredondar(dmBaseDados.tblLogMensalValorLancamento.AsFloat,2);
  dmBaseDados.tblLogMensal.Post;
 end;
end;

procedure TformNFeDevolucaoNew.grdProdutosKeyPress(Sender: TObject; var Key: Char);
var Sttsgrid : String;
begin
Sttsgrid := '0';
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalCodigoProduto) )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalObservacao;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalObservacao)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalDescricao;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalDescricao)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalNCM;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalNCM)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalFamilia;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalFamilia)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalDocumento;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalDocumento)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalUnidadeMedida;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalUnidadeMedida)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalQuantidade;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalQuantidade)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalValorDinheiro;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalValorDinheiro)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalValorLancamento;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalValorLancamento)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     grdProdutos.SelectedField := dmBaseDados.tblLogMensalDescon;
    end;
  End;
if( (grdProdutos.SelectedField = dmBaseDados.tblLogMensalDescon)and(Sttsgrid <> '1') )then
  Begin
   if (Key = #13) then
    begin
     Sttsgrid := '1';
     btnAdicionarServico.Click;
    end;
  End;
end;

procedure TformNFeDevolucaoNew.TISButton1Click(Sender: TObject);
begin
formSeekFornecedor2.ShowModal;
end;

procedure TformNFeDevolucaoNew.edtDespAcKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtBaseIcmsKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtVIcmsKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtBaseSTKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtValorSTKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtTotalProdKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtValorIPIKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtVTotalNFKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8),DecimalSeparator]) then Key := #0;
end;

procedure TformNFeDevolucaoNew.edtDespAcExit(Sender: TObject);
var fltDesp, fltTotNF : Double;
begin
fltDesp  := 0;
fltTotNF := 0;
if (edtDespAc.Text <> '') then
 begin
  fltDesp := StrToFloat(edtDespAc.Text);
  fltDesp := Arredondar(fltDesp,2)
 end
else
 begin
  edtDespAc.Text := '0';
 end;
fltTotNF := StrToFloat(edtVTotalNF.Text);
edtVTotalNF.Text := FormatFloat('0.00',fltDesp+fltTotNF);
end;

procedure TformNFeDevolucaoNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblANotaFiscalNew.Filter     := '';
dmBaseDados.tblANotaFiscalNew.Filtered   := False;
dmBaseDados.tblContasReceber.Filter   := '';
dmBaseDados.tblContasReceber.Filtered := False;
dmBaseDados.tblPedidos.Filter         := '';
dmBaseDados.tblPedidos.Filtered       := False;
dmBaseDados.tblPedidos.IndexName      := '';
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblSaida.Close;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblProdutos.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblANotaFiscalNew.Close;
dmBaseDados.tblFornecedores.Close;
end;

procedure TformNFeDevolucaoNew.rdgTransClick(Sender: TObject);
begin
formDigitaTransp.ShowModal;
end;

procedure TformNFeDevolucaoNew.mskNrNotaFiscalKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key := #0;
end;

end.
