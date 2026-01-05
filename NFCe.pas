unit NFCe;

interface        
                        
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
Forms,
     Dialogs, jpeg, ACBrSATExtratoClass, ACBrSATExtratoFortesFr, ACBrBase,
     ACBrSAT, IniFiles, TISButton, StdCtrls, ExtCtrls, OleCtrls, SHDocVw,
     ComCtrls, ACBrSATClass, pcnConversao, ACBrUtil, DB, Buttons,
     ACBrSATExtratoESCPOS, ACBrPosPrinter, blcksock,
     ACBrSATExtratoReportClass, ACBrDFeReport, ACBrNFeDANFeESCPOS,
     ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrDANFCeFortesFr, ACBrDFe,
     ACBrNFe, Mask, pcnConversaoNFe, TIGradient, ACBrNFeDANFeRLClass,
     ACBrDFe.Conversao, ACBrNFe.Classes, ACBrDFeSSL;

type
  TFormNfceAcbr = class(TForm)
    btnEnviarVenda: TTISButton;                 
    btnCancelar: TTISButton;
    btnReimprimir: TTISButton;                  
    PageControl1: TPageControl;   
    tsLog: TTabSheet;
    mLog: TMemo;
    tsGerado: TTabSheet;
    mVendaEnviar: TMemo;
    tsRecebido: TTabSheet;
    mRecebido: TWebBrowser;
    tsCancelamento: TTabSheet;
    mCancelamentoEnviar: TMemo;
    Panel2: TPanel;
    Label18: TLabel;
    edChaveCancelamento: TEdit;
    tsRedeXML: TTabSheet;
    mRede: TWebBrowser;
    BitBtn1: TBitBtn;
    TISButton1: TTISButton;
    ACBrPosPrinter1: TACBrPosPrinter;
    Timer1: TTimer;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFe1: TACBrNFe;
    mskDataES: TMaskEdit;
    mskHoraES: TMaskEdit;
    mskNrNotaFiscal: TMaskEdit;
    lblNrNF: TLabel;
    lblNumeroPedido: TLabel;
    mskNPedido: TMaskEdit;
    TIGradient1: TTIGradient;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    procedure GerarVenda;
    procedure btnEnviarVendaClick(Sender: TObject);
    procedure AjustaACBrSAT;
    procedure PrepararImpressao;
    procedure LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: String);
    procedure ACBrSAT1GetsignAC(var Chave: String);
    procedure btnReimprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var FormNfceAcbr: TFormNfceAcbr;
    PercDesc, Desconto, ValorCupom, Recebido : Double;
    ArqINI, strBotao, FormaPgto, CpfCnpj, xNome,
    xLgr, nro, xCpl, xBairro, xMun, UF : String;
    INI : TIniFile;

implementation

uses ModuloDados, ConfigAcbr, CheckCGC, SelSATCanc, pcnCFe, Venda,
     FormaPagamento, RotinasGerais, pcnCFeCanc, MenuPrincipal, pcnProcNFe;


{$R *.dfm}


procedure TFormNfceAcbr.FormShow(Sender: TObject);
var tpAmbiente : string;
begin
ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;
INI := TIniFile.Create(ArqINI);
tpAmbiente := INI.ReadString('Certificado','AMBIENTE','');

ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;

if (tpAmbiente = '1') then
 begin
  ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
 end
else                                   
 begin                              
  ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
 end;

btnEnviarVenda.Enabled := True;
mVendaEnviar.Clear;                
// --
if (strBotao = 'VENDA') then
 GerarVenda;                              

if (strBotao = 'CANCELAR') then
 btnCancelar.Click;

if (strBotao = 'REIMPRIMIR') then
 btnReimprimir.Click;
// --


end;

procedure TFormNfceAcbr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
INI.Free;
strBotao := '';
Desconto := 0;
Timer1.Enabled := False;
end;

procedure TFormNfceAcbr.AjustaACBrSAT;
begin
//--
end;

procedure TFormNfceAcbr.PrepararImpressao;
begin
  if not INI.ReadBool('Fortes','UsarFortes', True) then
   begin
    ACBrNFe1.DANFE := ACBrNFeDANFeESCPOS1;
    ACBrPosPrinter1.Desativar;
    ACBrPosPrinter1.Modelo             := TACBrPosPrinterModelo( INI.ReadInteger('PosPrinter', 'Modelo', Integer(ACBrPosPrinter1.Modelo)) );
    ACBrPosPrinter1.PaginaDeCodigo     := TACBrPosPaginaCodigo( INI.ReadInteger('PosPrinter','PaginaDeCodigo',Integer(ACBrPosPrinter1.PaginaDeCodigo)) );
    ACBrPosPrinter1.Porta              := INI.ReadString('PosPrinter','Porta',ACBrPosPrinter1.Porta);
    ACBrPosPrinter1.ColunasFonteNormal := INI.ReadInteger('PosPrinter','Colunas',ACBrPosPrinter1.ColunasFonteNormal);
    ACBrPosPrinter1.LinhasEntreCupons  := INI.ReadInteger('PosPrinter','LinhasEntreCupons',ACBrPosPrinter1.LinhasEntreCupons);
    ACBrPosPrinter1.EspacoEntreLinhas  := INI.ReadInteger('PosPrinter','EspacoLinhas',ACBrPosPrinter1.EspacoEntreLinhas);
    ACBrPosPrinter1.ConfigQRCode.LarguraModulo := INI.ReadInteger('PosPrinter','LarguraQRCode',ACBrPosPrinter1.ConfigQRCode.LarguraModulo);
    ACBrPosPrinter1.CortaPapel         := INI.ReadBool('PosPrinter','CortaPapel',ACBrPosPrinter1.CortaPapel);
    ACBrNFeDANFeESCPOS1.ImprimeQRCodeLateral := False;
    ACBrNFeDANFeESCPOS1.ImprimeEmUmaLinha    := INI.ReadBool('EscPos','ImprimirItemUmaLinha',ACBrNFeDANFeESCPOS1.ImprimeEmUmaLinha);
    ACBrPosPrinter1.Ativar;
   end
  else
   begin
    ACBrNFe1.DANFE := ACBrNFeDANFCeFortes1;
    ACBrNFeDANFCeFortes1.LarguraBobina  := INI.ReadInteger('Fortes','Largura',ACBrNFeDANFCeFortes1.LarguraBobina);
    ACBrNFeDANFCeFortes1.MargemSuperior := INI.ReadInteger('Fortes','MargemTopo',trunc(ACBrNFeDANFCeFortes1.MargemSuperior));
    ACBrNFeDANFCeFortes1.MargemInferior := INI.ReadInteger('Fortes','MargemFundo',trunc(ACBrNFeDANFCeFortes1.MargemInferior));
    ACBrNFeDANFCeFortes1.MargemEsquerda := INI.ReadInteger('Fortes','MargemEsquerda',trunc(ACBrNFeDANFCeFortes1.MargemEsquerda));
    ACBrNFeDANFCeFortes1.MargemDireita  := INI.ReadInteger('Fortes','MargemDireita',trunc(ACBrNFeDANFCeFortes1.MargemDireita));
    ACBrNFeDANFCeFortes1.MostraPreview  := INI.ReadBool('Fortes','Preview',True);
    try
      if INI.ReadString('Printer','Name','') <> '' then
        //ACBrSATExtratoFortes1.Impressora := INI.ReadString('Printer','Name','');
        ACBrNFeDANFCeFortes1.Impressora  := INI.ReadString('Printer','Name','');
    except
    end;
  end;
end;

procedure TFormNfceAcbr.LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
begin
  WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml',
              AXML, False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml');
end;

procedure TFormNfceAcbr.GerarVenda;
var TotalItem, strVTotal, vlTotalDescCalc : Double;
    A, strNroItem : Integer;
    // Var SWEDA
    percorre : Integer;
    XMLRecebido : String;
    ArqX : TStringList;
    strStatus,strPgto, strCodigoProduto, strCodProRef, strDescricao,
    strCST, strUnid, strNPedido, strCodVend, strDataBoa, strCodProd,
    Natureza, NumeroNF, DataEmissao, ClienteDest, EnderecoDest,
    NumeroDest, ComplDest, BairroDest, CEPDest, TelDest, IEDest,
    CodigoIBGE, CidadeDest, EstadoDest, CodigoProd, DescriProd,
    UnidadeProd, QtdeProd, VUnProd, VTotalProd, CFOPProd, OrigemProd,
    CSTProd, ModalidadeBC, UnidadeTrib, QtdeTrib, VTotalTrib,
    PercReducao, BaseICMS, ValorICMS, AliqICMS, ValorIPI, AliqIPI,
    BaseST, IcmsST, strNCM, NCMProd, vBC, vICMS, vBCST, vST, vProd,
    vFrete, vSeg, vDesc,  vII, vIPI, vPIS, vCOFINS, vOutro, vNF,
    strCfopMudou2, vPDesc, DataSaida, HoraSaida, dhCont, xJust,
    emailDest, emailDest2, emailDest3, vPOutro, indTot, xPed,
    nItemPed, pCredSN, vCredICMS, CRT, pMVAST, Especie, strXPed,
    TransNome, TransCNPJ, TransIE, TransEndereco, TransUF,
    TransCidade, strItemPed, strMsgTrib, TransPlaca, TransUFPlaca,
    AliqST, PesoB, PesoL,VAliq, Volume, vTotTrib, vTTotTrib, DespAC,
    vPFrete, strConting, strEntrSaida, vTribFed, vTribEst, vTribMun : String;

    // CEST FCP Partilha
    strCodAuto, strCEST, CEST, vBCUFDest, pFCPUFDest,
    pICMSUFDest, pICMSInter, pICMSInterPart, vFCPUFDest,
    vICMSUFDest, vICMSUFRemet, TipoCli, IsentoCli : String;
    fltPrtVProd, fltPrtAliqInt, fltPrtAliqDst, fltPrtIcmsOR,
    fltPrtIcmsDS, fltPrtDIFAL, fltPartilhaOR, fltPartilhaDS,
    fltFCP, fltSomaFCP, fltSomaPrDS, fltSomaPrOR, fltAliquotaFCP,
    strQtde, strQtdeEstoque, strVUnitario, strICMS,
    strPerc, strCredICMS, strPercReducao, strBaseICMS, strValorICMS,
    strAliqICMS, strBaseST, strIcmsST, fltConfDesc, difDesc, strVIPI,
    strAIPI, strCalcIcms, strPesoB, strPesoL, strvTotTrib, strPFrete,
    strPOutro, strPDespAC, strDescUn, strDifCent, fltValIcms, strPIS,
    fltVBasePisCof, strCOF, strTotalPIS, strTotalCOFINS, PercIcms : Double;
    strNumeroNF, Contador, strConCR : Integer;
    strVencimento, strDtSaida : TDateTime;
    strAcres, strProdDesc : Currency;
    // Variáveis AcbrNFe
    strSmtpHost, strSmtpPort, strSmtpUser, strSmtpPass, Para,
    NomeArq, strAssunto, strMotivo, finNFe, nrECF, nrCOO,
    BasePIS, AliqPIS, ValorPIS, BaseCOF, AliqCOF, ValorCOF : String;
    CC, strMensagem : TStrings;
    strConexSegura : Boolean;
    txtMonitor : TextFile;
    stsRetorno, sNrNF : Integer;
    ArquivoNFe : TextFile;
    // Variáveis Versão 3.10 NFe
    IM, NVE, nFCI, EXTIPI, vICMSDeson, cDV,
    idDest, indFinal, indPres, indIEDest, strNenhumCupomPulou : String;
    // Versão 4.00
    sindPag, sCNPJCPF, sFrete, sDataEmissao, sHoraEmissao : String;
    Anexos : TStrings;
    ok : boolean;
begin
vlTotalDescCalc := Desconto;

ValorCupom := 0;
mVendaEnviar.Clear;
mLog.Clear;
sDataEmissao   := DateToStr(Date);
sHoraEmissao   := TimeToStr(Time);
mskDataES.Text := DateToStr(Date);
mskHoraES.Text := TimeToStr(Time);
strDtSaida    := StrToDate(mskDataES.Text);
SHORTDATEFORMAT := 'yyyy-mm-dd';
DataEmissao   := DateToStr(Date) + 'T' + mskHoraES.Text + '-02:00';
DataSaida     := DateToStr(strDtSaida) + 'T' + mskHoraES.Text + '-03:00';
HoraSaida     := mskHoraES.Text;
dhCont        := '';
xJust         := '';
CRT           := '1';
SHORTDATEFORMAT  := 'dd/mm/yyyy';
DecimalSeparator := '.';
//-- Abrindo ACBrNFe
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.VersaoQrCode  := veqr200;
ACBrNFe1.Configuracoes.Geral.IdCSC         := INI.ReadString('Certificado','IDCSC','');
ACBrNFe1.Configuracoes.Geral.CSC           := INI.ReadString('Certificado','CSC','');          //'fbb7cda0-e629-4b63-90d1-a5cba0a63bc9';  // Filial Barueri homologação
ACBrNFe1.Configuracoes.Certificados.NumeroSerie := INI.ReadString('Certificado','CHAVE','');  //
ACBrNFe1.Configuracoes.Certificados.Senha       := INI.ReadString('Certificado','SENHA','');

//--
NumeroNF := '1';

dmBaseDados.tblCupomFiscal.Close;
dmBaseDados.tblCupomFiscal.Open;
dmBaseDados.tblCupomFiscal.Refresh;
dmBaseDados.tblCupomFiscal.Last;

dmBaseDados.qryCupomFiscal.Close;
dmBaseDados.qryCupomFiscal.SQL.Text := 'SELECT * FROM cupomfiscal.db WHERE (Data = :DataI)';
dmBaseDados.qryCupomFiscal.ParamByName('DataI').AsDate := Date;
dmBaseDados.qryCupomFiscal.Open;

strNenhumCupomPulou := '';
while (not dmBaseDados.qryCupomFiscal.Eof) do
 begin

  if( ((dmBaseDados.qryCupomFiscalStatus.AsString = '')or(dmBaseDados.qryCupomFiscalProtocolo.AsString = ''))AND(dmBaseDados.qryCupomFiscalChave.AsString <> '') )then
   begin
    ACBrNFe1.Configuracoes.WebServices.UF := 'SP';
    ACBrNFe1.WebServices.Consulta.NFeChave := dmBaseDados.qryCupomFiscalChave.AsString;
    ACBrNFe1.WebServices.Consulta.Executar;
    if (IntToStr(ACBrNFe1.WebServices.Consulta.cStat) = '217') then
     begin
      if (Application.MessageBox(PChar('O Nº' +dmBaseDados.qryCupomFiscalNrNF.AsString+ ' pulou, deseja utilizar essa numeração?'),'ATENÇÃO!',MB_YESNO) = IDYES) then
       begin
        strNenhumCupomPulou := 'PULOU';
        dmBaseDados.tblCupomFiscal.Locate('NrNF', dmBaseDados.qryCupomFiscalNrNF.AsString, [loCaseInsensitive]);
        mskNrNotaFiscal.Text := dmBaseDados.tblCupomFiscalNrNF.AsString;
        dmBaseDados.tblCupomFiscal.Edit;
        Break;
       end;
     end;
   end;
  dmBaseDados.qryCupomFiscal.Next;
 end;


sNrNF := 0;
if (strNenhumCupomPulou = '') then
 begin
  dmBaseDados.tblGeraNrNFCe.Open;
  dmBaseDados.tblGeraNrNFCe.Last;
  sNrNF := dmBaseDados.tblGeraNrNFCeNrNF.AsInteger + 1;
  dmBaseDados.tblGeraNrNFCe.Append;
  dmBaseDados.tblGeraNrNFCeNrNF.AsInteger    := sNrNF;
  dmBaseDados.tblGeraNrNFCeDataEm.AsDateTime := Date;
  dmBaseDados.tblGeraNrNFCe.Post;
  dmBaseDados.tblGeraNrNFCe.Close;
  mskNrNotaFiscal.Text := IntToStr(sNrNF);
  dmBaseDados.tblCupomFiscal.Append;
  dmBaseDados.tblCupomFiscalNrNF.AsInteger := StrToInt(mskNrNotaFiscal.Text);
 end;

dmBaseDados.tblCupomFiscalNrNF.AsInteger   := StrToInt(mskNrNotaFiscal.Text);
dmBaseDados.tblCupomFiscalNPedido.AsString := strReqSaida;
dmBaseDados.tblCupomFiscal.Post;
NumeroNF := mskNrNotaFiscal.Text;
with (ACBrNFe1.NotasFiscais.Add.NFe) do
  BEGIN
   Ide.cNF      := StrToInt(strReqSaida);
   Ide.natOp    := 'VENDA';
   Ide.modelo   := 65;
   Ide.serie    := 1;
   Ide.nNF      := StrToInt(NumeroNF);
   Ide.dEmi     := StrToDateTime(sDataEmissao  +' '+sHoraEmissao);
   Ide.dSaiEnt  := StrToDateTime(mskDataES.Text+' '+mskHoraES.Text);
   Ide.hSaiEnt  := Time;
   Ide.tpNF     := tnSaida;
   Ide.idDest   := doInterna;                                                   // StrToDestinoOperacao(ok,idDest);
   Ide.tpEmis   := teNormal;
   Ide.TpAmb    := taProducao;                                                  // taProducao;
   Ide.verProc  := '1.0.0.0';
   Ide.cUF      := 35;
   Ide.cMunFG   := 3534401;
   Ide.finNFe   := fnNormal;                                                    // StrToFinNFe(ok,finNFe);
   Ide.indPres  := pcPresencial;                                                // StrToPresencaComprador(ok,indPres);
   Ide.indFinal := cfConsumidorFinal;                                           // StrToConsumidorFinal(ok,indFinal);
   //--
   // * Dados Emitente *

   Emit.CNPJCPF           := INI.ReadString('Emit','CNPJ','');
   Emit.IE                := INI.ReadString('Emit','IE','');
   Emit.xNome             := INI.ReadString('Emit','RAZAO','');
   Emit.xFant             := '';
   Emit.EnderEmit.fone    := INI.ReadString('Emit','FONE','');
   Emit.EnderEmit.CEP     := INI.ReadInteger('Emit','CEP',Emit.EnderEmit.CEP);
   Emit.EnderEmit.xLgr    := INI.ReadString('Emit','ENDERECO','');
   Emit.EnderEmit.nro     := INI.ReadString('Emit','NUMERO','');
   Emit.EnderEmit.xCpl    := INI.ReadString('Emit','COMPLEMENTO','');
   Emit.EnderEmit.xBairro := INI.ReadString('Emit','BAIRRO','');
   Emit.EnderEmit.cMun    := INI.ReadInteger('Emit','CODIBGE',Emit.EnderEmit.cMun);
   Emit.EnderEmit.xMun    := INI.ReadString('Emit','CIDADE','');
   Emit.EnderEmit.UF      := INI.ReadString('Emit','UF','');
   Emit.enderEmit.cPais   := 1058;      
   Emit.enderEmit.xPais   := 'BRASIL';
   Emit.IEST              := '';
   Emit.IM                := '';
   Emit.CNAE              := '';
   Emit.CRT               := StrToCRT(ok,INI.ReadString('Emit','RegTributario','')); //crtSimplesNacional;  // (1-crtSimplesNacional, 2-crtSimplesExcessoReceita, 3-crtRegimeNormal)
   //--
   if (CpfCnpj <> '') then
    begin
     Dest.CNPJCPF   := CpfCnpj;  //strCPF;
     Dest.indIEDest := inNaoContribuinte;
    end;
   //--
   // Adicionando os itens da Venda:
   strNroItem := 0;
   strVTotal  := 0;
   fltDH := 0;
   fltCH := 0;
   fltCL := 0;
   fltCC := 0;
   fltCD := 0;                
   fltVP := 0;
   fltOT := 0;
   fltVA := 0;
   fltVR := 0;
   fltVC := 0;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
     Begin
      dmBaseDados.qryProdutos.Close;
      dmBaseDados.qryProdutos.SQL.Text := 'SELECT * FROM produtos.db WHERE (Codigo = "'+dmBaseDados.tblSaidaCodigoProduto.AsString+'")';
      dmBaseDados.qryProdutos.Open;
      CodigoProd   := dmBaseDados.tblSaidaCodigoProduto.AsString;
      DescriProd   := dmBaseDados.tblSaidaDescricaoProduto.AsString;
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
      NCMProd      := dmBaseDados.qryProdutosNCM.AsString;
      NCMProd      := BuscarETroca(NCMProd,'.','');
      NCMProd      := BuscarETroca(NCMProd,'-','');
      NCMProd      := BuscarETroca(NCMProd,'/','');
      NCMProd      := BuscarETroca(NCMProd,',','');
      CFOPProd     := dmBaseDados.qryProdutosCFOP.AsString;
      UnidadeProd  := dmBaseDados.tblSaidaUnidade.AsString;
      UnidadeProd  := BuscarETroca(UnidadeProd,'€','C');
      UnidadeProd  := BuscarETroca(UnidadeProd,'§','');
      UnidadeTrib  := dmBaseDados.tblSaidaUnidade.AsString;
      UnidadeTrib  := BuscarETroca(UnidadeTrib,'€','C');
      UnidadeTrib  := BuscarETroca(UnidadeTrib,'§','');               
      QtdeProd     := FormatFloat('0.0000',dmBaseDados.tblSaidaQuantidade.AsFloat);
      QtdeTrib     := FormatFloat('0.0000',dmBaseDados.tblSaidaQuantidade.AsFloat);
      VUnProd      := FormatFloat('0.0000',dmBaseDados.tblSaidaValorUnitario.AsFloat);
      VTotalProd   := FormatFloat('0.00',dmBaseDados.tblSaidaValorTotal.AsFloat);
      VTotalTrib   := FormatFloat('0.0000',dmBaseDados.tblSaidaValorUnitario.AsFloat);
      //PercReducao  := FormatFloat('0.00',dmBaseDados.tblSaidaDesconCT.AsFloat);
      //BaseICMS     := FormatFloat('0.00',dmBaseDados.tblSaidaValorTotal.AsFloat);
      //ValorICMS    := FormatFloat('0.00',dmBaseDados.tblSaidaSubQtde.AsFloat);
      BaseST       := '0.00'; //FormatFloat('0.00',dmBaseDados.tblSaidaSubPeso.AsFloat);
      IcmsST       := '0.00'; //FormatFloat('0.00',dmBaseDados.tblSaidaTroco.AsFloat);
      AliqICMS     := FormatFloat('0.00',dmBaseDados.tblSaidaQtdeCx.AsFloat);
      vTotTrib     := FormatFloat('0.00',dmBaseDados.tblSaidaPeso.AsFloat);
      CSTProd      := dmBaseDados.qryProdutosSituacaoTributaria.AsString;
      CEST         := dmBaseDados.qryProdutosCEST.AsString;
      OrigemProd   := '0';
      ModalidadeBC := '3';
      strPerc      := 0; //PercIcms;                      
      pCredSN      := FormatFloat('0.00',strPerc);
      vCredICMS    := FormatFloat('0.00',dmBaseDados.tblSaidaValorTotal.AsFloat*(strPerc/100));
      vPFrete      := FormatFloat('0.00',strPFrete);
      vPOutro      := FormatFloat('0.00',strPDespAC);
      PercDesc     := 0;
      if (Desconto > 0) then
       begin
        PercDesc := (Desconto/Recebido)*100;
        PercDesc := PercDesc;
       end;
      vPDesc       := FormatFloat('0.00',(dmBaseDados.tblSaidaValorTotal.AsFloat*PercDesc)/100);
      vlTotalDescCalc := vlTotalDescCalc - StrToFloat(vPDesc);

      strNroItem := strNroItem + 1;
      if (dmBaseDados.tblSaida.RecordCount = strNroItem) then
       begin
        if (vlTotalDescCalc <> 0) then
         begin
          vPDesc       := FormatFloat('0.00', StrToFloat(vPDesc) + vlTotalDescCalc);
         end;
       end;

      //xPed         := dmBaseDados.tblSaidaPedCompra.AsString;
      //nItemPed     := dmBaseDados.tblSaidaItemCompra.AsString;
      if (NCMProd = '') then
       begin
        NCMProd := '00000000';
       end;
      // 4.00 Dados Item
      with Det.Add do
        Begin
         Prod.nItem    := strNroItem;
         Prod.cProd    := CodigoProd;
         Prod.xProd    := DescriProd;
         Prod.NCM      := NCMProd;
         Prod.uCom     := UnidadeProd;
         Prod.qCom     := StrToFloat(QtdeProd);
         Prod.vUnCom   := StrToFloat(VUnProd);
         Prod.vProd    := StrToFloat(VTotalProd);
         Prod.EXTIPI   := '';
         Prod.CEST     := CEST;
         if (Copy(CEST,7,1) = '') then                                           // CEST tem que ter 7 dígitos
          begin
           Prod.CEST   := '0000000';
          end;
         Prod.CFOP     := CFOPProd;
         Prod.uTrib    := UnidadeProd;
         Prod.qTrib    := StrToFloat(QtdeProd);
         Prod.vUnTrib  := StrToFloat(VUnProd);
         Prod.vSeg     := 0.00;
         Prod.vDesc    := StrToFloat(vPDesc);
         //Prod.vFrete   := StrToFloat(vPFrete);
         if (Copy(dmBaseDados.qryProdutosCodigoBarra.AsString,1,3) = '789')
         or (Copy(dmBaseDados.qryProdutosCodigoBarra.AsString,1,3) = '790') then
          begin
           Prod.cEAN     := dmBaseDados.qryProdutosCodigoBarra.AsString;
           Prod.cEANTrib := dmBaseDados.qryProdutosCodigoBarra.AsString;
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
         Imposto.vTotTrib := StrToFloat(vTotTrib);
         //--
         OrigemProd := Copy(CSTProd,1,1);
         {if (dmBaseDados.qryProdutosCFOP.AsString = '5405')or(dmBaseDados.qryProdutosSituacaoTributaria.AsString = '060')or(dmBaseDados.qryProdutosSituacaoTributaria.AsString = '500') then
          begin
           CSTProd    := '060';
           OrigemProd := '0';
          end
         else
          begin
           CSTProd    := '040';
           OrigemProd := '0';
          end; }
         if( (StrToFloat(OrigemProd) > 1)and(OrigemProd <> '5')and(CSTProd <> '202') )then
          begin
           OrigemProd := Copy(CSTProd,1,1);
          end
         else
          begin
           OrigemProd := '0';
          end;
         if (dmBaseDados.qryProdutosCFOP.AsString = '5102') then
          begin
           CSTProd := '000';
          end
         else
          begin
           CSTProd := '041';        //aqui
          end;
         if (CFOPProd = '5405') then
          begin
           CSTProd := '060';
          end;
         if (CFOPProd = '')or(CSTProd = '') then
          begin
           CSTProd  := '060';
           CFOPProd := '5405';
          end;
         // Gravando Impostos CSOSNs
         // 000 / 020
         if( (Copy(CSTProd,2,2) = '00')or(Copy(CSTProd,2,2) = '20') )then
           Begin
            if (pCredSN <> '0.00') then
             begin
              Imposto.ICMS.CSOSN       := csosn101;
              Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
              Imposto.ICMS.pCredSN     := StrToFloat(pCredSN);
              Imposto.ICMS.vCredICMSSN := StrToFloat(vCredICMS);
             end
            else
             begin
              Imposto.ICMS.CSOSN       := csosn102;
              Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
             end;
           End;
         // 010
         if (Copy(CSTProd,2,2) = '10') then
           begin
            OrigemProd   := '0';
            ModalidadeBC := '4';
            pMVAST       := '';
            AliqST       := '0.00';
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
            Imposto.ICMS.CSOSN       := csosn102;
            Imposto.ICMS.orig        := oeNacional; //StrToOrig(ok,OrigemProd);
           end;
         // 060 / 070
         if( (Copy(CSTProd,2,2) = '60')or(Copy(CSTProd,2,2) = '70') )then
           begin
            ModalidadeBC := '';
            Imposto.ICMS.CSOSN   := csosn500;
            Imposto.ICMS.orig    := oeNacional; //StrToOrig(ok,OrigemProd);
            Imposto.ICMS.modBCST := StrTomodBCST(ok,ModalidadeBC);
            Imposto.ICMS.vBCST   := StrToFloat(BaseST);
            Imposto.ICMS.vICMSST := StrToFloat(IcmsST);
            // NT 07/05/2019
            if (indFinal <> '1') then
             begin
              Imposto.ICMS.vBCSTRet := 0;
              Imposto.ICMS.pST      := 0;
              Imposto.ICMS.vICMSSubstituto := 0;
              Imposto.ICMS.vICMSSTRet := 0;
             end;
           end;
         // PIS
         Imposto.PIS.CST    := pis49;
         // COFINS
         Imposto.COFINS.CST := cof49;
        End; // end do with dos produtos
      //-- Total
      strVTotal := strVTotal + Arredondar(dmBaseDados.tblSaidaQuantidade.AsFloat * Arredondar(dmBaseDados.tblSaidaValorUnitario.AsFloat,2),2);
      dmBaseDados.tblSaida.Next;
     End;
   //-- Totais:
   VAliq   := FormatFloat('0.00',PercIcms);                                     // vIPI:= FormatFloat('0.00',dmBaseDados.tblANotaFiscalIPI.AsFloat); //vFrete  := FormatFloat('0.00',strFrete);
   vBC     := '0.00';
   vICMS   := '0.00'; 
   vICMSDeson := '0.00';
   vBCST   := '0.00';
   vST     := '0.00';
   vProd   := FormatFloat('0.00',strVTotal);
   vSeg    := '0.00';
   vDesc   := FormatFloat('0.00', Desconto);
   vII     := '0.00';
   vPIS    := '0.00';
   vCOFINS := '0.00';
   vOutro  := '0.00';
   vTTotTrib := FormatFloat('0.00',strTotTrib);
   vTribFed  := FormatFloat('R$ 0.00',strTribFed);
   vTribEst  := FormatFloat('R$ 0.00',strTribEst);
   vTribMun  := FormatFloat('R$ 0.00',strTribMun);
   vNF       := FormatFloat('0.00',strVTotal - Desconto);
   // Totais e Total FCP 4.00
   Total.ICMSTot.vBC     := StrToFloat(vBC);
   Total.ICMSTot.vICMS   := StrToFloat(vICMS);       
   Total.ICMSTot.vProd   := StrToFloat(vProd);
   Total.ICMSTot.vSeg    := StrToFloat(vSeg);
   Total.ICMSTot.vDesc   := StrToFloat(vDesc);
   Total.ICMSTot.vPIS    := StrToFloat(vPIS);
   Total.ICMSTot.vCOFINS := StrToFloat(vCOFINS);
   Total.ICMSTot.vOutro  := StrToFloat(vOutro);
   Total.ICMSTot.vNF     := StrToFloat(vNF);
   Total.ICMSTot.vTotTrib := StrToFloat(vTTotTrib);
   //--
   strVTotal := strVTotal - Desconto;
   if (formFormaPagamento.ckbPgMistoSAT.Checked = False) then
     BEGIN
      with Pag.New do    // Adicionar o Pagamento
       Begin
        //0 mpDinheiro 1 mpCheque 2 mpCartaodeCredito 3 mpCartaodeDebito 4 mpCreditoLoja 5 mpValeAlimentacao 6 mpValeRefeicao 7 mpValePresente 8 mpValeCombustivel 9 mpOutros
        if (FormaPgto = 'DH') then
         begin
          tPag := fpDinheiro; // Tipo Pgto
          vPag := StrToFloat(vNF);  // Valor Pgto
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'CH') then
         begin
          tPag := fpCheque;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'CC') then
         begin
          tPag := fpCartaoCredito;
          vPag := StrToFloat(vNF);
          tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'CD') then
         begin
          tPag := fpCartaoDebito;
          vPag := StrToFloat(vNF);
          tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'CL') then
         begin
          tPag := fpCreditoLoja;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'VA') then
         begin
          tPag := fpValeAlimentacao;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'VR') then
         begin
          tPag := fpValeRefeicao;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'VP') then
         begin
          tPag := fpValePresente;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if (FormaPgto = 'VC') then
         begin
          tPag := fpValeCombustivel;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
         end;
        if( (FormaPgto = 'OT')or(FormaPgto = 'PX') )then
         begin
          tPag := fpOutro;
          vPag := StrToFloat(vNF);
          //tpIntegra := tiPagNaoIntegrado;
          xPag := 'OUTROS';
         end;
       End;
     END  // Caso for Pagamento Misto
   Else
     BEGIN
      fltDH := StrToFloat(StringReplace(formFormaPagamento.edtDinheiro.Text, ',', '.', [rfReplaceAll]));
      fltCH := StrToFloat(StringReplace(formFormaPagamento.edtCheque.Text, ',', '.', [rfReplaceAll]));
      fltCL := StrToFloat(StringReplace(formFormaPagamento.edtCredLoja.Text, ',', '.', [rfReplaceAll]));
      fltCC := StrToFloat(StringReplace(formFormaPagamento.edtCartaoCredito.Text, ',', '.', [rfReplaceAll]));
      fltCD := StrToFloat(StringReplace(formFormaPagamento.edtCartaoDebito.Text, ',', '.', [rfReplaceAll]));
      fltVP := StrToFloat(StringReplace(formFormaPagamento.edtValePresente.Text, ',', '.', [rfReplaceAll]));
      fltOT := StrToFloat(StringReplace(formFormaPagamento.edtOutros.Text, ',', '.', [rfReplaceAll]));
      fltVA := StrToFloat(StringReplace(formFormaPagamento.edtVlAlim.Text, ',', '.', [rfReplaceAll]));
      fltVR := StrToFloat(StringReplace(formFormaPagamento.edtVlRefeicao.Text, ',', '.', [rfReplaceAll]));
      fltVC := StrToFloat(StringReplace(formFormaPagamento.edtVlComb.Text, ',', '.', [rfReplaceAll]));
      if (fltDH > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpDinheiro; // Tipo Pgto
          vPag := fltDH;   // Valor Pgto
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltCH > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpCheque;
          vPag := fltCH;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltCC > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpCartaoCredito;
          vPag := fltCC;
          tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltCD > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpCartaoDebito;
          vPag := fltCD;
          tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltCL > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpCreditoLoja;
          vPag := fltCL;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltVA > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpValeAlimentacao;
          vPag := fltVA;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltVR > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpValeRefeicao;
          vPag := fltVR;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltVP > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpValePresente;
          vPag := fltVP;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltVC > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpValeCombustivel;
          vPag := fltVC;
          //tpIntegra := tiPagNaoIntegrado;
         end;
       end;
      if (fltOT > 0) then
       begin
        with Pag.New do    // Adicionar o Pagamento
         Begin
          tPag := fpOutro;
          vPag := fltOT;
          xPag := 'OUTROS';
         end;
       end;
     END;
   ValorCupom := StrToFloat(vNF);
   // 4.00
   with (Transp) do
    begin
     modFrete  := mfSemFrete;
    end;
   with (InfAdic) do
    begin
     infCpl     := 'Valor Aprox. Tributos:  (Federal: ' +FormatFloat('R$ 0.00',strTribFed) +' Estadual: ' +FormatFloat('R$ 0.00',strTribEst) +' Municipal: ' +FormatFloat('R$ 0.00',strTribMun) + ') - FONTE: IBPT';
     infAdFisco := '';
    end;
  END; // end with acbrNFe
//--
DecimalSeparator := ',';
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
btnEnviarVenda.Click;
end;

procedure TFormNfceAcbr.btnEnviarVendaClick(Sender: TObject);
var strEAnterior, strEPosterior, strEstoqueAtual : Double;
    stsRetorno : Integer;
    strMotivo, strCh, NomeArq : String;
begin
dmBaseDados.qryCupomFiscal.Close;
dmBaseDados.qryCupomFiscal.SQL.Text := 'SELECT * FROM cupomfiscal.db WHERE (NrNF = "'+mskNrNotaFiscal.Text+'")';
dmBaseDados.qryCupomFiscal.Open;
//--
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalChave.AsString      := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.qryCupomFiscalCaminho2.AsString   := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.qryCupomFiscalNPedido.AsString    := strReqSaida;
dmBaseDados.qryCupomFiscalCliente.AsString    := dmBaseDados.tblClientesCodigoCliente.AsString;
if (dmBaseDados.qryCupomFiscalCliente.AsString = '') then
 begin
  dmBaseDados.qryCupomFiscalCliente.AsString := '52';
 end;
dmBaseDados.qryCupomFiscalData.AsDateTime    := Date;
dmBaseDados.qryCupomFiscalHora.AsDateTime    := Time;
dmBaseDados.qryCupomFiscalValor.AsFloat      := ValorCupom;
dmBaseDados.qryCupomFiscalPagamento.AsString := FormaPgto;
if (formFormaPagamento.ckbPgMistoSAT.Checked = True) then
 begin
  dmBaseDados.qryCupomFiscalPagamento.AsString  := 'PM';
 end;
dmBaseDados.qryCupomFiscalDH.AsFloat := fltDH;
dmBaseDados.qryCupomFiscalCC.AsFloat := fltCC;
dmBaseDados.qryCupomFiscalCD.AsFloat := fltCD;
dmBaseDados.qryCupomFiscalCH.AsFloat := fltCH;
dmBaseDados.qryCupomFiscalCL.AsFloat := fltCL;
dmBaseDados.qryCupomFiscalVP.AsFloat := fltVP;
dmBaseDados.qryCupomFiscalOT.AsFloat := fltOT;
dmBaseDados.qryCupomFiscalVA.AsFloat := fltVA;
dmBaseDados.qryCupomFiscalVR.AsFloat := fltVR;
dmBaseDados.qryCupomFiscalVC.AsFloat := fltVC;
dmBaseDados.qryCupomFiscalCpfCnpj.AsString := CpfCnpj;
if (CpfCnpj = '') then
 begin
  dmBaseDados.qryCupomFiscalCpfCnpj.AsString := 'NÃO IDENTIFICADO';
 end;
//dmBaseDados.qryCupomFiscalEmpresa.AsString := Empresa;
dmBaseDados.qryCupomFiscal.Post;
//--
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML();
//--
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalChave.AsString      := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);  //-ACBrSAT1.CFe.infCFe.ID;
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
dmBaseDados.qryCupomFiscalData.AsDateTime     := Date;
dmBaseDados.qryCupomFiscalHora.AsDateTime     := Time;
dmBaseDados.qryCupomFiscalValor.AsFloat       := ValorCupom;
dmBaseDados.qryCupomFiscalPagamento.AsString  := FormaPgto;
dmBaseDados.qryCupomFiscal.Post;
//--
PageControl1.ActivePage := tsLog;
PrepararImpressao;
//--
try
 ACBrNFe1.WebServices.Envia(1,True,True);
 //ACBrNFe1.Enviar(1, True, True)
except
 If (pos('Duplicidade de NF-e com diferença na Chave de Acesso', ACBrNFe1.NotasFiscais.Items[0].Msg) > 0) then
   Begin
    //btnDuplicDen.Click;
   End
 Else if (Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,1,29) = 'Rejeição: Duplicidade de NF-e') then
   Begin
    //btnDuplicDen.Click;
   End
 Else
   Begin
    ACBrNFe1.WebServices.Envia(1, True, True);
    ShowMessage('Nota não confirmada:'+#13+ IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF) + '->' + ACBrNFe1.NotasFiscais.Items[0].Msg);
   End;
 Abort;
End; // end do try
//--
// Verificando Retorno da NFC-e
if (ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat = 105) then // Lote em processamento       //ACBrNFe1.WebServices.Retorno.cStat
 repeat
  Application.MessageBox('Envio da NFE - Lote em processamento.' +#13 + 'Aguarde 2 minutos e Clique em OK !!!', 'MBJ', MB_OK);
  ACBrNFe1.WebServices.Retorno.Recibo := ACBrNFe1.WebServices.Enviar.Recibo;
 until ACBrNFe1.WebServices.Retorno.Executar;
//--
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalStatus.AsInteger   := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat;; //ACBrNFe1.WebServices.Consulta.cStat;
dmBaseDados.qryCupomFiscalProtocolo.AsString := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt; //ACBrNFe1.WebServices.Retorno.Protocolo;
dmBaseDados.qryCupomFiscal.Post;
//--
stsRetorno := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat;                 //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
strMotivo  := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo;               //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
if (stsRetorno = 100) then
 begin
  //strEmitiu := 'SIM';
  dmBaseDados.qryCupomFiscal.Edit;
  strCh := dmBaseDados.qryCupomFiscalChave.AsString + '-NFe.xml';
  NomeArq := strCh;
  //--
  if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
   NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
  ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
  dmBaseDados.qryCupomFiscalCaminhoXML.AsString := 'F:\NFCe\PathNFCe\' + NomeArq;
  dmBaseDados.qryCupomFiscal.Post;
  PrepararImpressao;
  ACBrNFe1.NotasFiscais.Items[0].Imprimir;
  //ACBrNFe1.NotasFiscais.ImprimirPDF;
 end;
Timer1.Enabled := True;
btnEnviarVenda.Enabled := False;
Close;
end;

procedure TFormNfceAcbr.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
begin
Chave := INI.ReadString('SAT','CodigoAtivacao','12345678');
end;

procedure TFormNfceAcbr.ACBrSAT1GetsignAC(var Chave: AnsiString);
begin
Chave := INI.ReadString('SwH','Assinatura',cAssinatura);
end;

procedure TFormNfceAcbr.btnReimprimirClick(Sender: TObject);
begin
//--
end;

procedure TFormNfceAcbr.btnCancelarClick(Sender: TObject);
var strCancelado : String;
begin
//--
end;

procedure TFormNfceAcbr.TISButton1Click(Sender: TObject);
begin
Close;
end;

procedure TFormNfceAcbr.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (key = VK_F4) then
 begin
  btnEnviarVenda.Enabled := True;
  ShowMessage('Iniciado com sucesso!');
 end;

if (key = VK_F5) then
 begin
  mVendaEnviar.Clear;
  GerarVenda;
  ShowMessage('Atualizado com sucesso!');
 end;
end;

procedure TFormNfceAcbr.Timer1Timer(Sender: TObject);
begin
Close;
end;

end.
