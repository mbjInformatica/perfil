unit GerenciarNFCe;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, TIGradient, StdCtrls, TISEdit,
     TISButton, Grids, DBGrids, ComCtrls, ACBrNFeDANFEClass,
     ACBrBase, ACBrDFe, ACBrNFe, ExtCtrls, TISImagePanel,
     TISDBCtrls, TILabel, TISLABELS, RLConsts, TISURLLabel,
     pcnNFeRTXT, pcnAuxiliar, db, pcnConversao, pcnConversaoNFe,
     ACBrNFeDANFeRLClass, ACBrMail, blcksock, ACBrDFeSSL,
     ACBrDFeReport, ACBrDFeDANFeReport, Buttons, jpeg,
     ACBrPosPrinter, ACBrNFeDANFeESCPOS, ACBrDANFCeFortesFr,
     ACBrDFe.Conversao, ACBrNFe.Classes, IniFiles;

type
  TformGerenciarNFCe = class(TForm)
    grdNotas: TDBGrid;
    TIGradient1: TTIGradient;
    lblDtI: TLabel;                              
    lblDtF: TLabel;                          
    Data2: TDateTimePicker;
    Data1: TDateTimePicker;
    btnPesquisar: TTISButton;
    btnNovaPesq: TTISButton;
    edtNumeroNF: TEdit;
    Label1: TLabel;
    btnImprimir: TTISButton;
    btnCancelar: TTISButton;
    btnInutilizar: TTISButton;
    Image1: TImage;
    btnConsultar: TTISButton;
    memoRespostas: TMemo;
    Label2: TLabel;
    btnRetornar: TTISButton;
    btnLocNF: TTISButton;
    btnEmail: TTISButton;
    Edit1: TEdit;
    TISDBNavigator1: TTISDBNavigator;           
    TIEFECTLABEL3d1: TTIEFECTLABEL3d;
    btnCCe: TTISButton;
    btnReenviar: TTISButton;
    mmEmailMsg: TMemo;
    btnDuplicDen: TTISButton;
    btnSituacao: TTISButton;
    ACBrMail1: TACBrMail;
    TISButton1: TTISButton;
    edtUFDisp: TEdit;
    TISButton2: TTISButton;
    ACBrNFe1: TACBrNFe;
    btnXML: TTISButton;
    TISButton4: TTISButton;
    OpenDialog1: TOpenDialog;
    btnMailtest: TBitBtn;
    mBody: TMemo;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrPosPrinter1: TACBrPosPrinter;
    Button1: TButton;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    memoXML: TMemo;
    procedure AtualizarHoraXML;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovaPesqClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnInutilizarClick(Sender: TObject);
    procedure btnLocNFClick(Sender: TObject);
    procedure edtNumeroNFChange(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
    procedure btnCCeClick(Sender: TObject);
    procedure btnReenviarClick(Sender: TObject);
    procedure btnDuplicDenClick(Sender: TObject);
    procedure btnSituacaoClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure TISButton2Click(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure grdNotasDblClick(Sender: TObject);
    procedure TISButton4Click(Sender: TObject);
    procedure btnMailtestClick(Sender: TObject);
    procedure PrepararImpressao;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formGerenciarNFCe : TformGerenciarNFCe;
    stsFortes :  String;
    NFeRTXT : TNFeRTXT;
    ArqINI : String;
    INI    : TIniFile;

implementation

uses ModuloDados, CancelarNFe, Inutilizar, RotinasGerais,
     DadosProdutosNFe, ConfigAcbr, pcnProcNFe;


{$R *.dfm}


procedure TformGerenciarNFCe.FormShow(Sender: TObject);
var tpAmbiente : string;
begin
ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;
INI    := TIniFile.Create(ArqINI);

ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.VersaoQrCode  := veqr200;
ACBrNFe1.Configuracoes.Geral.IdCSC         := INI.ReadString('Certificado','IDCSC','');
ACBrNFe1.Configuracoes.Geral.CSC           := INI.ReadString('Certificado','CSC','');          //'fbb7cda0-e629-4b63-90d1-a5cba0a63bc9';  // Filial Barueri homologação
ACBrNFe1.Configuracoes.Certificados.NumeroSerie := INI.ReadString('Certificado','CHAVE','');  //
ACBrNFe1.Configuracoes.Certificados.Senha       := INI.ReadString('Certificado','SENHA','');

dmBaseDados.qryCupomFiscal.Close;
dmBaseDados.qryCupomFiscal.Open;
//dmBaseDados.qryCupomFiscal.Filter   := '';
//dmBaseDados.qryCupomFiscal.Filtered := False;
dmBaseDados.qryCupomFiscal.Last;

dmBaseDados.tblClientes.Open;
dmBaseDados.tblEmail.Open;
stsCancelar   := '';
stsInutilizar := '';
Data1.Date    := Date;
Data2.Date    := Date;
memoRespostas.Lines.Clear;

tpAmbiente    := INI.ReadString('Certificado','AMBIENTE','');
if (tpAmbiente = '1') then
 begin
  ACBrNFe1.Configuracoes.WebServices.Ambiente := taProducao;
 end
else
 begin
  ACBrNFe1.Configuracoes.WebServices.Ambiente := taHomologacao;
 end;
end;

procedure TformGerenciarNFCe.btnPesquisarClick(Sender: TObject);
begin
{dmBaseDados.qryCupomFiscal.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.qryCupomFiscal.Filtered := True;
dmBaseDados.qryCupomFiscal.First; }
dmBaseDados.qryCupomFiscal.Close;
dmBaseDados.qryCupomFiscal.SQL.Clear;
dmBaseDados.qryCupomFiscal.SQL.Text  := 'SELECT * FROM cupomfiscal.db WHERE Data Between :DataI and :DataF';
dmBaseDados.qryCupomFiscal.ParamByName('DataI').AsDate := Data1.Date;
dmBaseDados.qryCupomFiscal.ParamByName('DataF').AsDate := Data2.Date;
dmBaseDados.qryCupomFiscal.Open;
dmBaseDados.qryCupomFiscal.First;
end;

procedure TformGerenciarNFCe.btnNovaPesqClick(Sender: TObject);
begin
dmBaseDados.qryCupomFiscal.Filter   := '';
dmBaseDados.qryCupomFiscal.Filtered := False;
Data1.Date := Date;
Data2.Date := Date;
dmBaseDados.qryCupomFiscal.Last;
end;

procedure TformGerenciarNFCe.btnImprimirClick(Sender: TObject);
var strCaminho : String;
begin
strCaminho := dmBaseDados.qryCupomFiscalCaminhoXML.AsString;
PrepararImpressao;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.NotasFiscais.Imprimir;
//ACBrNFe1.NotasFiscais.ImprimirPDF;
end;

procedure TformGerenciarNFCe.btnCancelarClick(Sender: TObject);
var Chave, Protocolo, Justificativa, idLote,
    strConfirma, strMensagem, CNPJ : String;
    stsRetorno : Integer;
begin
  formCancelarNFe.ShowModal;
CNPJ := INI.ReadString('Emit','CNPJ','');
if (stsCancelar = 'SIM') then
 Begin
  strConfirma := 'Confirma o Cancelamento da Nota Fiscal Consumidor Nº "' +dmBaseDados.qryCupomFiscalNrNF.AsString+ '" ?';
  if (Application.MessageBox(pChar(strConfirma),'ATENÇÃO!',MB_YESNO) = IDYES) then
   begin
    Chave     := dmBaseDados.qryCupomFiscalChave.AsString;
    Protocolo := dmBaseDados.qryCupomFiscalProtocolo.AsString;
    Justificativa := formCancelarNFe.edtJustificativa.Text;
    idLote := '1';
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.EventoNFe.Evento.Clear;
    with (ACBrNFe1.EventoNFe.Evento.New) do
     begin
      infEvento.chNFe    := Chave;
      infEvento.CNPJ     := CNPJ;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := Justificativa;
      infEvento.detEvento.nProt := Protocolo;
     end;
    ACBrNFe1.EnviarEvento(StrToInt(idLote));
    //--
    memoRespostas.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS);
    memoRespostas.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetornoWS);
    stsRetorno  := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat; //ACBrNFe1.WebServices.EnvEvento.cStat;
    strMensagem := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo; //ACBrNFe1.WebServices.EnvEvento.xMotivo;
    ShowMessage(IntToStr(stsRetorno) +' - '+ strMensagem);
    if( (stsRetorno = 101)or(stsRetorno = 128)
    or  (stsRetorno = 135)or(stsRetorno = 155) )then
     begin
      dmBaseDados.qryCupomFiscal.Edit;
      dmBaseDados.qryCupomFiscalStatus.AsInteger       := stsRetorno;
      dmBaseDados.qryCupomFiscalMensagem.AsString      := strMensagem;
      dmBaseDados.qryCupomFiscalCancelado.AsString     := 'S';
      dmBaseDados.qryCupomFiscalDataCanc.AsDateTime    := Date;
      dmBaseDados.qryCupomFiscalJustificativa.AsString := Justificativa;
      dmBaseDados.qryCupomFiscal.Post;
      btnDuplicDen.Click;
      btnEmail.Click;
     end
    else
     begin
      dmBaseDados.qryCupomFiscal.Edit;
      dmBaseDados.qryCupomFiscalStatus.AsInteger  := stsRetorno;
      dmBaseDados.qryCupomFiscalMensagem.AsString := strMensagem;
      dmBaseDados.qryCupomFiscal.Post;
     end;
   end;
 End;
stsCancelar := '';
end;

procedure TformGerenciarNFCe.btnConsultarClick(Sender: TObject);
var vChave, statusNFe, strMsg : String;
begin
vChave := dmBaseDados.qryCupomFiscalChave.AsString;
ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
ACBrNFe1.WebServices.Consulta.Executar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ' - ' + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalStatus.AsString   := statusNFe;
dmBaseDados.qryCupomFiscalMensagem.AsString := strMsg;
dmBaseDados.qryCupomFiscal.Post;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;
                                                             
procedure TformGerenciarNFCe.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformGerenciarNFCe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//dmBaseDados.qryCupomFiscal.Filter   := '';
//dmBaseDados.qryCupomFiscal.Filtered := False;
dmBaseDados.qryCupomFiscal.SQL.Clear;
dmBaseDados.qryCupomFiscal.SQL.Text  := 'SELECT * FROM CupomFiscal.db';
dmBaseDados.tblEmail.Close;
dmBaseDados.tblClientes.Open;
dmBaseDados.qryCupomFiscal.Open;
end;

procedure TformGerenciarNFCe.btnInutilizarClick(Sender: TObject);
var Modelo, Serie, sAno, NumeroInicial,
    NumeroFinal, Justificativa, CNPJ : String;    
    Ano, Mes, Dia : Word;
begin
formInutilizar.ShowModal;
if (Application.MessageBox(PChar('Confirma Inutilização do NFCe: Nº'+ dmBaseDados.qryCupomFiscalNrNF.AsString +'?'),'Excluir!',MB_YESNO)) = IDNO then
 begin
  Abort;
 end;
if (stsInutilizar = 'SIM') then
  Begin
   SHORTDATEFORMAT := 'dd/mm/yyyy';
   DecodeDate(Date, Ano, Mes, Dia);
   CNPJ   := INI.ReadString('Emit','CNPJ','');
   sAno   := IntToStr(Ano);
   Modelo := '65';
   Serie  := '1';
   NumeroInicial := formInutilizar.edtInicio.Text;
   NumeroFinal   := formInutilizar.edtFim.Text;
   Justificativa := formInutilizar.edtJustificativa.Text;
   ACBrNFe1.WebServices.Inutiliza(CNPJ, Justificativa, StrToInt(sAno), StrToInt(Modelo), StrToInt(Serie), StrToInt(NumeroInicial), StrToInt(NumeroFinal));
   memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Inutilizacao.RetWS));
   memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Inutilizacao.RetornoWS));
   dmBaseDados.tblInutilizadas.Open;
   dmBaseDados.tblInutilizadas.Append;
   dmBaseDados.tblInutilizadasInicio.AsInteger       := StrToInt(NumeroInicial);
   dmBaseDados.tblInutilizadasFim.AsInteger          := StrToInt(NumeroFinal);
   dmBaseDados.tblInutilizadasJustificativa.AsString := 'NFCe: ' + Justificativa;
   dmBaseDados.tblInutilizadasData.AsDateTime        := Date;
   dmBaseDados.tblInutilizadas.Post;

   dmBaseDados.qryCupomFiscal.Edit;
   dmBaseDados.qryCupomFiscalNPedido.AsString     := 'INUT';
   //dmBaseDados.qryCupomFiscalNomeCliente.AsString := 'INUT';
   dmBaseDados.qryCupomFiscal.Post;

   ShowMessage('Finalizado com sucesso!');

  End;
stsInutilizar := '';
end;

procedure TformGerenciarNFCe.btnLocNFClick(Sender: TObject);
begin
if (edtNumeroNF.Text <> '') then
 Begin
  if (dmBaseDados.qryCupomFiscal.Locate('NrNF',edtNumeroNF.Text,[loCaseInsensitive]) = TRUE) then
   begin
    grdNotas.SetFocus;
   end
  else
   begin
    Application.MessageBox('Nota Fiscal não encontrada! Favor verificar o nº digitado!','ATENÇÃO!',MB_ICONEXCLAMATION);
    edtNumeroNF.SetFocus;
   end;
 End;
btnLocNF.Default := False;
end;

procedure TformGerenciarNFCe.edtNumeroNFChange(Sender: TObject);
begin
btnLocNF.Default := True;
end;

procedure TformGerenciarNFCe.btnEmailClick(Sender: TObject);
var strCaminho, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, Para, NomeArq,
    strAssunto, strCliente, emailDest, Dir,
    emailDest2, emailDest3, NumeroNF : String;
    CC, strMensagem, AnexoCanc : TStrings;
    strConexSegura : Boolean;
    txtMonitor : TextFile;        
begin
strCaminho := dmBaseDados.qryCupomFiscalCaminhoXML.AsString;
AnexoCanc  := TstringList.Create;
AnexoCanc.Clear;
if (dmBaseDados.qryCupomFiscalCancelado.AsString = 'S') then
 begin
  AnexoCanc.Add('F:\NFCe\PathEvento\110111' + dmBaseDados.qryCupomFiscalChave.AsString + '01-procEventoNFe.xml');
               //F:\NFCe\PathEvento\110111      35160802494541000149550010000000051762974517    01-procEventoNFe.xml
 end;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
NumeroNF   := dmBaseDados.qryCupomFiscalNrNF.AsString;
strCliente := dmBaseDados.qryCupomFiscalCliente.AsString;
emailDest  := '';
emailDest2 := '';
emailDest3 := '';
dmBaseDados.tblClientes.First;
dmBaseDados.tblFornecedores.Open;
If (dmBaseDados.qryCupomFiscalEspecie.AsString <> 'D') then
  Begin
   if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
    begin
     emailDest  := dmBaseDados.tblClientesEmail.AsString;
    end;
  End
Else  // * Quando for NF-e de devolução *
  Begin
   strCliente := LRPad(dmBaseDados.qryCupomFiscalCliente.AsString,4,'0','L');
   dmBaseDados.tblFornecedores.First;
   if (dmBaseDados.tblFornecedores.Locate('CodigoFornecedor',strCliente,[loCaseInsensitive]) = TRUE) then
    begin
     emailDest  := dmBaseDados.tblFornecedoresEmail.AsString;
    end;
  End;
dmBaseDados.tblFornecedores.Close;
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then
  Begin
    CC := TstringList.Create;
    try
      Para := emailDest;
      CC.Add(dmBaseDados.tblEmailUsuario.AsString);    //especifique um email valido
      //--
      if (emailDest2 <> '') then
       CC.Add(emailDest2);
      if (emailDest3 <> '') then
       CC.Add(emailDest3);
      //--             
      ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
      ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
      ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
      ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.SetSSL   := StrToBool(dmBaseDados.tblEmailConexaoSegura.AsString); // SSL - Conexao Segura
      ACBrMail1.SetTLS   := StrToBool(dmBaseDados.tblEmailConexaoSegura.AsString); // Auto TLS
      ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
      ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
      ACBrMail1.FromName            := 'ARQUIVO XML E DANFE NFe  Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
      strAssunto                    := 'ARQUIVO XML E DANFE NFe  Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
      mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
      btnMailtest.Click;
      //strMensagem     := mBody.Lines; //mmEmailMsg.Lines;
      if (dmBaseDados.qryCupomFiscalCancelado.AsString = 'S') then
       begin
        ACBrMail1.FromName          := 'CANCELAMENTO DE NFC-e Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
        strAssunto                  := 'CANCELAMENTO DE NFC-e Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
        strMensagem                 := mmEmailMsg.Lines;
       end
      else       
       begin
        Dir := ExtractFilePath(ParamStr(0));         
        ACBrMail1.IsHTML := True;
        ACBrMail1.Body.Assign(mBody.Lines);       
        if Pos('cid:Logo', ACBrMail1.Body.Text) > 0 then
         ACBrMail1.AddAttachment(Dir + 'logo.png', 'Logo');
        strMensagem := mBody.Lines;
        AnexoCanc.Add('Logo=F:\SGE\Logo.PNG');  // alterar ACBrDFe nos fontes do acbr arquivo leia-me: AlteracaoFormACBrDFe.txt
       end;
      ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para,
                                                 strAssunto,
                                                 strMensagem
                                                 , True        // Enviar PDF junto
                                                 , CC          // Lista com emails que serao enviado copias - TStrings
                                                 , AnexoCanc); // Lista de anexos - TStrings    // nil
    finally
      CC.Free;
      AnexoCanc.Free;
    end;
  End;
end;

procedure TformGerenciarNFCe.btnCCeClick(Sender: TObject);
var Chave, idLote, codOrgao, CNPJ,
    nSeqEvento, Correcao : String;
begin
if (dmBaseDados.qryCupomFiscalChave.AsString = '') then
 begin
  Application.MessageBox('Nota Fiscal não gerada por este sistema!','ATENÇÃO!',MB_ICONEXCLAMATION);
  Abort;
 end;
Chave      := dmBaseDados.qryCupomFiscalChave.AsString;
idLote     := '1';
codOrgao   := Copy(Chave,1,2);
CNPJ       := Copy(Chave,7,14);        
nSeqEvento := '1';
if not(InputQuery('Nº Sequencia do evento', 'Informe o Numero de sequencia do evento:', nSeqEvento)) then
 exit;
Correcao   := '';
if not(InputQuery('WebServices Eventos: Carta de Correção', 'Correção a ser considerada', Correcao)) then
 exit;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.EventoNFe.Evento.Clear;
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalCodContabil.AsInteger := dmBaseDados.qryCupomFiscalCodContabil.AsInteger + 1;
dmBaseDados.qryCupomFiscal.Post;
nSeqEvento := IntToStr(dmBaseDados.qryCupomFiscalCodContabil.AsInteger);
with (ACBrNFe1.EventoNFe.Evento.New) do
 begin
  infEvento.chNFe      := Chave;
  infEvento.CNPJ       := CNPJ;
  infEvento.dhEvento   := now;
  infEvento.tpEvento   := teCCe;
  infEvento.nSeqEvento := StrToInt(nSeqEvento);
  infEvento.detEvento.xCorrecao := Correcao;
 end;
ACBrNFe1.EnviarEvento(StrToInt(idLote));
ACBrNFe1.ImprimirEventoPDF;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS));
end;

procedure TformGerenciarNFCe.btnReenviarClick(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2,
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser,
    strSmtpPass, Para, NomeArq, strAssunto, emailDest,
    chCodUF, chData, chAnoMes, chCNPJ, chModelo,
    chSerie, strMotivo, chNrNFe, chFormaEmissao, strMsg,
    chCodNumerico, ChaveAcesso, strCh, vChave, statusNFe : String;
    ArquivoNFe, txtMonitor : TextFile;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
    stsRetorno : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.qryCupomFiscalCliente.AsString;
dmBaseDados.tblClientes.First;
if (strCliente <> '') then
 begin
  if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
   begin
    emailDest := dmBaseDados.tblClientesEmail.AsString;
   end; 
 end;
// Salvando e gerando o XML
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
// Atualizar hora xml e data:
if (dmBaseDados.qryCupomFiscalStatus.AsString <> '100')and(dmBaseDados.qryCupomFiscalStatus.AsString <> '101') then
  Begin
   vChave := dmBaseDados.qryCupomFiscalChave.AsString;
   ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
   ACBrNFe1.WebServices.Consulta.Executar;
   statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
   strMsg    := statusNFe + ' - ' + ACBrNFe1.WebServices.Consulta.XMotivo;      //Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
   dmBaseDados.qryCupomFiscal.Edit;
   dmBaseDados.qryCupomFiscalStatus.AsString   := statusNFe;
   dmBaseDados.qryCupomFiscalMensagem.AsString := strMsg;
   dmBaseDados.qryCupomFiscal.Post;
   if (dmBaseDados.qryCupomFiscalStatus.AsString <> '100') then
    begin
     AtualizarHoraXML;
    end;
  End
else
  Begin
   Abort;
  End;
//--

if (dmBaseDados.qryCupomFiscalCaminhoXML.AsString <> '') then
 begin
  ACBrNFe1.NotasFiscais.LoadFromFile(dmBaseDados.qryCupomFiscalCaminhoXML.AsString);
 end
else
 begin
  ACBrNFe1.NotasFiscais.LoadFromFile(dmBaseDados.qryCupomFiscalCaminho2.AsString);
 end;
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
try
 ACBrNFe1.WebServices.Envia(1,True,True);
 //ACBrNFe1.WebServices.Envia(1);
except
 on E : Exception do
  begin
   if (pos('Duplicidade de NF-e com diferença na Chave de Acesso', ACBrNFe1.NotasFiscais.Items[0].Msg) > 0) then
    begin
     dmBaseDados.qryCupomFiscal.Edit;
     dmBaseDados.qryCupomFiscalChave.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,pos('NFe:',ACBrNFe1.NotasFiscais.Items[0].Msg)+4,44);
     dmBaseDados.qryCupomFiscal.Post;
     btnDuplicDen.Click;
    end
   else if (Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,1,29) = 'Rejeição: Duplicidade de NF-e') then
    begin
     dmBaseDados.qryCupomFiscal.Edit;
     dmBaseDados.qryCupomFiscalChave.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
     dmBaseDados.qryCupomFiscal.Post;
     btnDuplicDen.Click;
    end
   else
    begin
     //ShowMessage('Nota(s) não confirmadas:'+#13+ IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF) + '->' + ACBrNFe1.NotasFiscais.Items[0].Msg);
     ShowMessage('Exception class name: '+E.ClassName +#13#13+ 'Exception message: '+E.Message);
    end;
   Abort;
  end;
end;
PrepararImpressao;
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
//ACBrNFe1.NotasFiscais.ImprimirPDF;
//--
// Retorno do WebService:
stsRetorno := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.cStat;                 //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
strMotivo  := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.xMotivo;               //ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalStatus.AsInteger     := stsRetorno;
dmBaseDados.qryCupomFiscalMensagem.AsString    := strMotivo;
dmBaseDados.qryCupomFiscalChave.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
strCh := dmBaseDados.qryCupomFiscalChave.AsString + '-NFe.xml';
dmBaseDados.qryCupomFiscalProtocolo.AsString   := ACBrNFe1.NotasFiscais.Items[0].NFe.procNFe.nProt;   //ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.qryCupomFiscalCaminho2.AsString    := 'F:\NFCe\PathNFCe\'+ strCh;                         //ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := strCh;
//--
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := 'F:\NFCe\PathNFCe\' + NomeArq;
dmBaseDados.qryCupomFiscal.Post;
//--
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then
 begin
  btnEmail.Click;
 end;
end;

procedure TformGerenciarNFCe.btnDuplicDenClick(Sender: TObject);
var strCaminho, vChave, statusNFe, strMsg,
    strCh, NomeArq, Origem, Destino,
    OrigCanc, DestCanc, strNomeArq : String;
begin
ACBrNFe1.NotasFiscais.Clear;
strCaminho := dmBaseDados.qryCupomFiscalCaminho2.AsString;
strCh      := dmBaseDados.qryCupomFiscalChave.AsString + '-NFe.xml';
strCaminho := 'F:\NFCe\PathNFCe\'+ strCh; // Aqui pega o caminho do primeiro XML gerado, no caso o que foi enviado ao SEFAZ
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.Consultar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalStatus.AsString    := statusNFe;
dmBaseDados.qryCupomFiscalMensagem.AsString  := strMsg;
dmBaseDados.qryCupomFiscalProtocolo.AsString := ACBrNFe1.WebServices.Consulta.Protocolo;
NomeArq := strCh;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 begin
  if (statusNFe = '100') then // Autorizada
   begin
    NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
   end;
  if (statusNFe = '110')or(statusNFe = '302') then  //Denegada
   begin
    NomeArq := StringReplace(NomeArq,'-nfe.xml','-den.xml',[rfIgnoreCase]);
   end;
  if (statusNFe = '102') then // Inutilizada
   begin
    NomeArq := StringReplace(NomeArq,'-nfe.xml','-procInutNFe.xml',[rfIgnoreCase]);
   end;
 end;
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
Origem  := NomeArq;
Destino := 'F:\NFCe\PathNFCe\' + NomeArq;
if( (statusNFe = '101')or(statusNFe = '128')or(statusNFe = '135') )then // NotaCancelada //35160702494541000149550010000000211117976467-NFeDFe.xml Quando é nf cancelada
 begin
  OrigCanc := 'F:\NFCe\PathNFCe\' + dmBaseDados.qryCupomFiscalChave.AsString + '-NFeDFe.xml';
  DestCanc := 'F:\NFCe\NFeCan\' + dmBaseDados.qryCupomFiscalChave.AsString + '-NFeCanc.xml';
  Destino  := DestCanc;
  CopyFile(PChar(OrigCanc), PChar(DestCanc), False);
 end;
if( (statusNFe = '102') )then // NotaInutilizada //35251420329000026665001000000012000000012-procInutNFe.xml quando é nf inutilizada
 begin
  Destino  := 'F:\NFCe\NFeInu\' + dmBaseDados.qryCupomFiscalChave.AsString + '-procInutNFe.xml';;
 end;
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := Destino;
dmBaseDados.qryCupomFiscalCaminho2.AsString   := strCaminho;
dmBaseDados.qryCupomFiscal.Post;
if (statusNFe = '100') then
 begin
  btnImprimir.Click;          
 end;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;

procedure TformGerenciarNFCe.btnSituacaoClick(Sender: TObject);
begin
ACBrNFe1.SSL.SSLType := LT_TLSv1_2;            
ACBrNFe1.WebServices.StatusServico.Executar;
memoRespostas.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetWS);
memoRespostas.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.StatusServico.RetornoWS);
memoRespostas.Lines.Clear;                                                                
memoRespostas.Lines.Add('Status Serviço');              
memoRespostas.Lines.Add('tpAmb: '    +TpAmbToStr(ACBrNFe1.WebServices.StatusServico.tpAmb));
memoRespostas.Lines.Add('verAplic: ' +ACBrNFe1.WebServices.StatusServico.verAplic);
memoRespostas.Lines.Add('cStat: '    +IntToStr(ACBrNFe1.WebServices.StatusServico.cStat));
memoRespostas.Lines.Add('xMotivo: '  +ACBrNFe1.WebServices.StatusServico.xMotivo);
memoRespostas.Lines.Add('cUF: '      +IntToStr(ACBrNFe1.WebServices.StatusServico.cUF));
memoRespostas.Lines.Add('dhRecbto: ' +DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRecbto));
memoRespostas.Lines.Add('tMed: '     +IntToStr(ACBrNFe1.WebServices.StatusServico.TMed));
memoRespostas.Lines.Add('dhRetorno: '+DateTimeToStr(ACBrNFe1.WebServices.StatusServico.dhRetorno));
memoRespostas.Lines.Add('xObs: '     +ACBrNFe1.WebServices.StatusServico.xObs);
end;

procedure TformGerenciarNFCe.TISButton1Click(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2,
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser,
    strSmtpPass, Para, NomeArq, strAssunto, emailDest,
    chCodUF, chData, chAnoMes, chCNPJ, chModelo, chSerie,
    chNrNFe, chFormaEmissao, chCodNumerico, ChaveAcesso : String;
    ArquivoNFe, txtMonitor : TextFile;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.qryCupomFiscalCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
// Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := INI.ReadString('Emit','CNPJ','');
chModelo := '65';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.qryCupomFiscalNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
// Alterando a chave no txt
strPedidoNFe := dmBaseDados.qryCupomFiscalNPedido.AsString;
strCaminho   := 'F:\NFCe\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
//--
// Carregando o arquivo TXT
ACBrNFe1.Configuracoes.WebServices.UF := edtUFDisp.Text;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add;
NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);
NFeRTXT.CarregarArquivo(strCaminho);
if (NFeRTXT.LerTxt) then
 NFeRTXT.Free
else
 begin
  NFeRTXT.Free;
  ShowMessage('Arquivo NFe Inválido');
  Exit;
 end;
// Salvando e gerando o XML
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
//ACBrNFe1.WebServices.Envia(1);
ACBrNFe1.WebServices.Envia(1,True,True);
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;
//--
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalChave.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.qryCupomFiscalProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.qryCupomFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := NomeArq;
dmBaseDados.qryCupomFiscal.Post;
ACBrNFe1.Configuracoes.WebServices.UF := 'SP';  
end;

procedure TformGerenciarNFCe.TISButton2Click(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2,
    strLinhaCont, AcbrNFe, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, Para, NomeArq, strAssunto,
    emailDest, chCodUF, chData, chAnoMes, chCNPJ,
    chModelo, chSerie, chNrNFe, chFormaEmissao,
    chCodNumerico, ChaveAcesso, DataContig : String;
    ArquivoNFe, txtMonitor : TextFile;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.qryCupomFiscalCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
{
 // Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := INI.ReadString('Emit','CNPJ','');
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.qryCupomFiscalNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
// Alterando a chave no txt
strPedidoNFe := dmBaseDados.qryCupomFiscalNPedido.AsString;
strCaminho   := 'F:\NFCe\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
// Alterando linha para contingência:
SHORTDATEFORMAT := 'yyyy-mm-dd';
DataContig      := DateToStr(Date) + 'T' + TimeToStr(Time) + '-02:00' + '|ERRO 403 SEFAZ SP|';
strLinhaCont    := dmBaseDados.qryCupomFiscalLinhaConting.AsString + DataContig;
SHORTDATEFORMAT := 'dd/mm/yyyy';
AlteraLinhaTxt(strCaminho,2,strLinhaCont);
}
//--
// Carregando o arquivo TXT
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.Add;
NFeRTXT := TNFeRTXT.Create(ACBrNFe1.NotasFiscais.Items[0].NFe);
NFeRTXT.CarregarArquivo(strCaminho);
if (NFeRTXT.LerTxt) then
 NFeRTXT.Free
else
 begin
  NFeRTXT.Free;
  ShowMessage('Arquivo NFe Inválido');
  Exit;
 end;
// Salvando e gerando o XML
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
//ACBrNFe1.WebServices.Envia(1);
ACBrNFe1.WebServices.Envia(1,True,True);
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;
//--
dmBaseDados.qryCupomFiscal.Edit;
dmBaseDados.qryCupomFiscalChave.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.qryCupomFiscalProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.qryCupomFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.qryCupomFiscalCaminhoXML.AsString := NomeArq;
dmBaseDados.qryCupomFiscal.Post;
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then
 begin
 btnEmail.Click;
 end;
end;

procedure TformGerenciarNFCe.btnXMLClick(Sender: TObject);
var strPasta, strData1, strData2, Origem, Destino,
    strNomeArq, Temp, LinhadeComando, Arq, Dest : String;
begin
if (Application.MessageBox('ATENÇÃO! Certifique-se que o período foi selecionado e filtrado!','ATENÇÃO!',MB_OKCANCEL) = IDCANCEL) then
 begin
  Abort;
 end;
SHORTDATEFORMAT := 'dd-mm-yyyy';
strData1 := DateToStr(Data1.Date);
strData2 := DateToStr(Data2.Date);
strPasta := strData1 +'a'+ strData2;
SHORTDATEFORMAT := 'dd/mm/yyyy';
if (not DirectoryExists('F:\NFCe\Contabilidade\' + strPasta)) then
 begin
  ForceDirectories('F:\NFCe\Contabilidade\' + strPasta);
 end;
dmBaseDados.qryCupomFiscal.First;
while (not dmBaseDados.qryCupomFiscal.Eof) do
  Begin
   Origem     := dmBaseDados.qryCupomFiscalCaminhoXML.AsString;
   //strNomeArq := Copy(Origem,18,56);
   strNomeArq := ExtractFileName(Origem);
   Destino    := 'F:\NFCe\Contabilidade\' + strPasta +'\' + strNomeArq;
   CopyFile(PChar(Origem), PChar(Destino), False);
   dmBaseDados.qryCupomFiscal.Next;
  End;                                                                  
ShowMessage('Arquivos copiados com sucesso para pasta: F:\NFCe\Contabilidade\' + strPasta);
if (Application.MessageBox('Deseja compactar a pasta gerada?','ATENÇÃO!',MB_YESNO) = IDYES) then
 begin
  Temp           := ChangeFileExt('F:\NFCe\Contabilidade\' + strPasta,'.rar');
  LinhadeComando := 'C:\Arquivos de programas\WinRAR\WINRAR.EXE a "'  +Temp  +'" "'  +'F:\NFCe\Contabilidade\'  + strPasta  +'"';
  Try
   WinExec(Pchar(LinhadeComando),1);
  Except
  End;
 end;
end;

procedure TformGerenciarNFCe.grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (dmBaseDados.qryCupomFiscalCancelado.AsString = 'S') then
 begin
  grdNotas.Canvas.Font.Color  := clRed;
  grdNotas.Canvas.Brush.Color := clWhite;             
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;                                         
if( (dmBaseDados.qryCupomFiscalStatus.AsInteger = 302)or(dmBaseDados.qryCupomFiscalStatus.AsInteger = 110) )then
 begin
  grdNotas.Canvas.Font.Color  := $000D62F0;
  grdNotas.Canvas.Brush.Color := clWhite;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
if( (dmBaseDados.qryCupomFiscalStatus.AsString = '')or(dmBaseDados.qryCupomFiscalProtocolo.AsString = '') )then
 begin
  grdNotas.Canvas.Font.Color  := clBlack;       
  grdNotas.Canvas.Brush.Color := clYellow;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
end;

procedure TformGerenciarNFCe.grdNotasDblClick(Sender: TObject);
begin
formDadosProdutosNFe.ShowModal;
end;

procedure TformGerenciarNFCe.TISButton4Click(Sender: TObject);
var strCaminho, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, strAssunto,
    Para, NomeArq, strCliente, emailDest,
    emailDest2, emailDest3, NumeroNF : String;
    CC, strMensagem, AnexoCartaCorrecao : TStrings;
    strConexSegura : Boolean;
    txtMonitor : TextFile;
begin
OpenDialog1.Title      := 'Selecione o Evento';
OpenDialog1.DefaultExt := '*.XML';
OpenDialog1.Filter     := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
OpenDialog1.InitialDir := ACBrNFe1.Configuracoes.Arquivos.PathEvento;
if OpenDialog1.Execute then
 begin
  ACBrNFe1.EventoNFe.Evento.Clear;
  ACBrNFe1.EventoNFe.LerXML(OpenDialog1.FileName) ;
  ACBrNFe1.ImprimirEvento;

  // Enviar EMail da Carta de Correção

  strCaminho := dmBaseDados.qryCupomFiscalCaminhoXML.AsString;
  AnexoCartaCorrecao := TstringList.Create;
  AnexoCartaCorrecao.Clear;
  AnexoCartaCorrecao.Add(OpenDialog1.FileName);
  //AnexoCartaCorrecao.Add('F:\NFCe\PathEvento\110111' + dmBaseDados.qryCupomFiscalChave.AsString + '01-procEventoNFe.xml');
  AnexoCartaCorrecao.Add('F:\NFCe\PathEvento\' + ExtractFileName(OpenDialog1.FileName));

  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
  NumeroNF   := dmBaseDados.qryCupomFiscalNrNF.AsString;
  strCliente := dmBaseDados.qryCupomFiscalCliente.AsString;
  emailDest  := '';
  emailDest2 := '';
  emailDest3 := '';
  dmBaseDados.tblClientes.First;
  dmBaseDados.tblFornecedores.Open;
  If (dmBaseDados.qryCupomFiscalEspecie.AsString <> 'D') then
    Begin
     if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
      begin
       emailDest  := dmBaseDados.tblClientesEmail.AsString;
      end;
    End
  Else  // * Quando for NF-e de devolução *
    Begin
     strCliente := LRPad(dmBaseDados.qryCupomFiscalCliente.AsString,4,'0','L');
     dmBaseDados.tblFornecedores.First;
     if (dmBaseDados.tblFornecedores.Locate('CodigoFornecedor',strCliente,[loCaseInsensitive]) = TRUE) then
      begin
       emailDest := dmBaseDados.tblFornecedoresEmail.AsString;
      end;
    End;
  dmBaseDados.tblFornecedores.Close;
  // Enviando email do XML e PDF da NF-e
  if (emailDest <> '') then
    Begin
      CC := TstringList.Create;
      try
        Para := emailDest;

        CC.Add(dmBaseDados.tblEmailUsuario.AsString);    // Especifique um email valido

        if (emailDest2 <> '') then
         CC.Add(emailDest2);
        if (emailDest3 <> '') then
         CC.Add(emailDest3);

        ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
        ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
        ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
        ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
        ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
        ACBrMail1.SetSSL   := StrToBool(dmBaseDados.tblEmailConexaoSegura.AsString); // SSL - Conexao Segura
        ACBrMail1.SetTLS   := StrToBool(dmBaseDados.tblEmailConexaoSegura.AsString); // Auto TLS
        ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
        ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
        ACBrMail1.FromName            := 'CARTA DE CORREÇÃO NFC-e CHICAO EMB. Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
        strAssunto                    := 'CARTA DE CORREÇÃO NFC-e CHICAO EMB . Nº ' + dmBaseDados.qryCupomFiscalNrNF.AsString;
        mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
        strMensagem     := mmEmailMsg.Lines;
        ACBrNFe1.EnviarEmailEvento(Para
                             , strAssunto
                             , strMensagem
                             , CC    // Lista com emails que serão enviado cópias - TStrings
                             , AnexoCartaCorrecao // Lista de anexos - TStrings
                             , nil);
{
        ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para,
                                                   strAssunto,
                                                   strMensagem
                                                   , True                 // Enviar PDF junto
                                                   , CC                   // Lista com emails que serao enviado copias - TStrings
                                                   , AnexoCartaCorrecao); // Lista de anexos - TStrings    // nil
}
      finally
        CC.Free;
        AnexoCartaCorrecao.Free;
      end;
    End;
 end;
end;

procedure TformGerenciarNFCe.btnMailtestClick(Sender: TObject);
var strHTML, strNFe, strChNFe, strVenc, strCodBoleto,
    strEmitente, strCliente, strNrBoleto, strValorBO,
    strChaveNFe, Dir, msgConfirma, sDiaSemana, strPDF, strDataEmis : String;
begin
strEmitente := 'CHICAO EMBALAGENS';
strCliente  := dmBaseDados.tblClientesNomeCliente.AsString + ' (' + dmBaseDados.tblClientesNumeroCIC.AsString + ')';
strValorBO  := FormatFloat('R$ 0.00',dmBaseDados.qryCupomFiscalValor.AsFloat);
strNFe      := dmBaseDados.qryCupomFiscalNrNF.AsString;
strChaveNFe := dmBaseDados.qryCupomFiscalChave.AsString;
strDataEmis := dmBaseDados.qryCupomFiscalData.AsString;
mBody.Clear;                                          
mBody.Lines.Text :=                      
'<table class="m_6102797054956253739wrapper" style="border-collapse:collapse;border-spacing:0;background-color:#F0FFF0;width:100%;min-width:620px;table-layout:fixed">' +
#13+#10+	'<tbody>' +
		'<tr>' + #13+#10+
			'<td style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top">' +#13+#10+
			'<center>' +
			'<table style="border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto">' +#13+#10+
				'<tbody>' +#13+#10+
					'<tr class="m_6102797054956253739border" style="font-size:1px;line-height:1px;background-color:#e3e3e3;height:1px">' +#13+#10+
						'<td colspan="3" style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top;line-height:1px">&nbsp;</td>' +#13+#10+
					'</tr>' +#13+#10+
					'<tr>' +#13+#10+
						'<td class="m_6102797054956253739border" style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top;font-size:1px;line-height:1px;background-color:#e3e3e3;width:1px">&nbsp;</td>' +#13+#10+
						'<td style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top">' +#13+#10+
						'<table class="m_6102797054956253739one-col" style="border-collapse:collapse;border-spacing:0;Margin-left:auto;Margin-right:auto;width:600px;background-color:#ffffff">' +#13+#10+
							'<tbody>' +#13+#10+
								'<tr>' +#13+#10+
									'<td class="m_6102797054956253739column" style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top;text-align:left">' +#13+#10+
									'<table class="m_6102797054956253739contents" style="border-collapse:collapse;border-spacing:0;width:100%">' +#13+#10+
										'<tbody>' +#13+#10+
											'<tr>' +#13+#10+
												'<td class="m_6102797054956253739preheader" colspan="1" style="padding-top:26px;padding-bottom:26px;padding-left:50px;padding-right:50px;vertical-align:top;font-size:11px;line-height:17px;text-align:left;width:280px;font-family:sans-serif">' +#13+#10+
												'<div class="m_6102797054956253739spacer" style="font-size:150px;line-height:125px">'+#13+#10+
                        '<img style="max-width:550px;max-height:350px" src="cid:Logo" class="CToWUd"></div>' +#13+#10+
                        '</td>' +#13+#10+
											'</tr>' +#13+#10+
											'<tr>' +#13+#10+
												'<td class="m_6102797054956253739padded" colspan="2" style="padding-top:0;padding-bottom:0;padding-left:50px;padding-right:50px;vertical-align:top">' +#13+#10+
												'<p style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:15px;line-height:24px">&nbsp;</p>' +#13+#10+

												'<p style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:15px;line-height:24px">' +#13+#10+
                        'Prezado cliente, ' +dmBaseDados.tblClientesNomeCliente.AsString+ '.<br>' +#13+#10+
												'<br>' +#13+#10+
												'Este e-mail é um comprovante da emissão da Nota Fiscal Eletrônica (NF-e) nº ' +strNFe+  '.</p>' +#13+#10+

												'<table style="border-collapse:collapse;border-spacing:0;width:100%;table-layout:fixed">' +#13+#10+
													'<tbody>' +#13+#10+
														'<tr>' +#13+#10+
															'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:11pt;line-height:24px"><strong style="font-weight:bold">Dados da Nota Fiscal Eletrônica:</strong></span></td>' +#13+#10+
														'</tr>' +#13+#10+
														'<tr>' +#13+#10+
															'<td>' +#13+#10+
															'<table style="border-collapse:collapse;border-spacing:0;width:100%;table-layout:fixed">' +#13+#10+
																'<tbody>' +#13+#10+
																	'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Emitido por: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">' +strEmitente+ '</span></td>' +#13+#10+
																	'</tr>' +#13+#10+
																	'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Emitido para: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">' +strCliente+ '</span></td>' +#13+#10+
																	'</tr>' +#13+#10+
																	{'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Vencimento: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">' +strVenc+ '</span></td>' +#13+#10+
																	'</tr>' +#13+#10+ }
																	'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Número da NF-e: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">' +strNFe+ '</span></td>' +#13+#10+
																	'</tr>' +#13+#10+
																	'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Data de Emissão: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px"><strong style="font-weight:bold">' +strDataEmis +#13+#10+
																	'</tr>' +#13+#10+
																	'<tr>' +#13+#10+
																		'<td width="120"><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">Valor da NF-e: </span></td>' +#13+#10+
																		'<td><span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:10pt;line-height:24px">' +strValorBO+ '</span></td>' +#13+#10+
																	'</tr>' +#13+#10+
																'</tbody>' +#13+#10+
															'</table>' +#13+#10+
															'</td>' +#13+#10+
														'</tr>' +#13+#10+
													'</tbody>' +#13+#10+
												'</table>' +#13+#10+
												'&nbsp;' +#13+#10+

												'<p style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:15px;line-height:24px"><strong style="font-weight:bold">' +#13+#10+
                        '<span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:11pt;line-height:24px">Como consultar esta Nota Fiscal Eletrônica?</span></strong><br>' +#13+#10+
												'<br>' +#13+#10+
												'<span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:11pt;line-height:24px"><strong style="font-weight:bold">Chave de Acesso da NF-e:</strong><br>' +#13+#10
												+ strChaveNFe+ '<wbr>' +'' +'</span><br>' +#13+#10+
												'<br>' +#13+#10+
                         '<span style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:'+#13+#10+
                          '8pt;line-height:24px">Para consultar a nota, acesse o Portal da NF-e do Ministério da Fazenda em: '+#13+#10+
                            '<a '+'href="http://www.nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=">'+#13+#10+
                            ' Consultar NF-e Completa</a>.</span></p>'+#13+#10+
                            '&nbsp;'+#13+#10+
												 '<p style="Margin-top:0;font-family:sans-serif;color:#60666d;Margin-bottom:24px;font-size:15px;line-height:24px">'+#13+#10+
                         'Segue em anexo o documento digital assinado(XML) e o Documento Auxiliar da Nota Fiscal Eletrônica (DANFE).<br>' +#13+#10+
												'<br>' +#13+#10+
												'Atenciosamente,<br>' +#13+#10+
												'<br>' +#13+#10+
												'CHICAO</p>' +#13+#10+

												'<p>&nbsp;</p>' +#13+#10+
												'</td>' +#13+#10+
											'</tr>' +#13+#10+
										'</tbody>' +#13+#10+
									'</table>' +#13+#10+

									'<div class="m_6102797054956253739column-bottom" style="font-size:26px;line-height:26px">&nbsp;</div>' +#13+#10+
									'</td>' +#13+#10+
								'</tr>' +#13+#10+
							'</tbody>' +#13+#10+
						'</table>' +#13+#10+
						'</td>' +#13+#10+
						'<td class="m_6102797054956253739border" style="padding-top:0;padding-bottom:0;padding-left:0;padding-right:0;vertical-align:top;font-size:1px;line-height:1px;background-color:#e3e3e3;width:1px">&nbsp;</td>' +#13+#10+
					'</tr>' +#13+#10+
				'</tbody>' +#13+#10+
			'</table>' +#13+#10+
			'</center>' +#13+#10+
			'</td>' +#13+#10+
		'</tr>' +#13+#10+
	'</tbody>' +#13+#10+
'</table>';
//--
Dir := ExtractFilePath(ParamStr(0));
ACBrMail1.IsHTML := True;
ACBrMail1.Body.Assign(mBody.Lines);
if Pos('cid:Logo', ACBrMail1.Body.Text) > 0 then
 ACBrMail1.AddAttachment(Dir + 'logo.png', 'Logo');
end;

procedure TFormGerenciarNFCe.PrepararImpressao;
begin
  if not INI.ReadBool('Fortes','UsarFortes', True) then
   begin
    ACBrNFe1.DANFE := ACBrNFeDANFeESCPOS1;
    stsFortes := 'N';
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
    stsFortes := 'S';
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

procedure TformGerenciarNFCe.Button1Click(Sender: TObject);
begin
formConfigAcbr.ShowModal;
end;

procedure TformGerenciarNFCe.AtualizarHoraXML;
var Line, strDataHoraAnt, strDataHoraAtual,
    sCaminhoXml, strHoraAt : String;
    Arquivo : TextFile;
    i : Integer;
begin
MemoXML.Clear;
//AssignFile(Arquivo,dmBaseDados.qryCupomFiscalCaminhoXML.AsString);
if (dmBaseDados.qryCupomFiscalCaminhoXML.AsString <> '')and((dmBaseDados.qryCupomFiscalCaminhoXML.AsString <> null)) then
 begin
  sCaminhoXml := dmBaseDados.qryCupomFiscalCaminhoXML.AsString;
 end
else
 begin
  sCaminhoXml := dmBaseDados.qryCupomFiscalCaminho2.AsString;
 end;
AssignFile(Arquivo,sCaminhoXml);
Reset(Arquivo);
//--
while not EOF(Arquivo) do
  Begin
   ReadLn(Arquivo, Line);
   if Pos('<dhEmi>',Line)>0 then
    begin
     //<dhEmi>2025-04-04T17:47:04-03:00</dhEmi>
    strDataHoraAnt := Copy(Line,Pos('<dhEmi>',Line),32);
    strDataHoraAnt := Copy(strDataHoraAnt,8,25);
    strHoraAt := TimeToStr(Time);
    SHORTDATEFORMAT  := 'yyyy-mm-dd';
    strDataHoraAtual := DateToStr(Date) + 'T' + strHoraAt + '-03:00';
    SHORTDATEFORMAT  := 'dd/mm/yyyy';
    Line := StringReplace(Line, strDataHoraAnt, strDataHoraAtual,[]);
    end;
   MemoXML.Lines.add( Line );
  End;
CloseFile(Arquivo);
MemoXML.Lines.SaveToFile(dmBaseDados.qryCupomFiscalCaminhoXML.AsString);
end;

end.
