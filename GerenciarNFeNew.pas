unit GerenciarNFeNew;

interface
                                      
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TIGradient, StdCtrls, TISEdit, TISButton, Grids,
     DBGrids, ComCtrls, ACBrNFeDANFEClass, ACBrBase, ACBrDFe, ACBrNFe,
     ExtCtrls, TISImagePanel, TISDBCtrls, TILabel, TISLABELS, MidasLib,
     TISURLLabel, pcnNFeRTXT, pcnAuxiliar, RLConsts, IniFiles, ACBrDFeSSL,
     pcnConversao, ACBrNFeDANFeRLClass, ACBrMail, db, blcksock, TIGradientCaption,
     jpeg, ACBrDFeReport, ACBrDFeDANFeReport, ACBrDFe.Conversao, ACBrNFe.Classes;

type
  TformGerenciarNFeNew = class(TForm)
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
    btnConsultar: TTISButton;
    memoRespostas: TMemo;
    Label2: TLabel;
    btnRetornar: TTISButton;
    btnLocNF: TTISButton;
    btnEmail: TTISButton;
    Edit1: TEdit;
    TISDBNavigator1: TTISDBNavigator;
    btnCCe: TTISButton;
    btnReenviar: TTISButton;
    mmEmailMsg: TMemo;
    btnDuplicDen: TTISButton;
    btnSituacao: TTISButton;
    ACBrMail1: TACBrMail;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    TISButton1: TTISButton;
    edtUFDisp: TEdit;
    TISButton2: TTISButton;
    ACBrNFe1: TACBrNFe;
    btnXML: TTISButton;
    TISButton3: TTISButton;
    TISButton4: TTISButton;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    TIGradientCaption3: TTIGradientCaption;
    TIGradientCaption1: TTIGradientCaption;
    TIEFECTLABEL3d1: TTIEFECTLABEL3d;
    TIGradientCaption4: TTIGradientCaption;
    TIGradientCaption2: TTIGradientCaption;
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
    procedure TISButton3Click(Sender: TObject);
    procedure TISButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formGerenciarNFeNew : TformGerenciarNFeNew;
    NFeRTXT : TNFeRTXT;
    ArqINI : String;
    INI : TIniFile;

implementation

uses ModuloDados, CancelarNFe, Inutilizar, RotinasGerais,
     DadosProdutosNFe, ConfigEmail, ACBrNFeConfiguracoes;


{$R *.dfm}


procedure TformGerenciarNFeNew.FormShow(Sender: TObject);
begin
//--
ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;
INI    := TIniFile.Create(ArqINI);
//-- Abrindo ACBrNFe
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.SSL.SSLType := LT_TLSv1_2;
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;
//ACBrNFe1.Configuracoes.Geral.VersaoQrCode  := veqr200;
ACBrNFe1.Configuracoes.Geral.IdCSC         := INI.ReadString('Certificado','IDCSC','');
ACBrNFe1.Configuracoes.Geral.CSC           := INI.ReadString('Certificado','CSC','');
ACBrNFe1.Configuracoes.Certificados.NumeroSerie := INI.ReadString('Certificado','CHAVE','');
ACBrNFe1.Configuracoes.Certificados.Senha       := INI.ReadString('Certificado','SENHA','');
//--
dmBaseDados.tblANotaFiscalNew.Open;
dmBaseDados.tblANotaFiscalNew.Filter   := '';
dmBaseDados.tblANotaFiscalNew.Filtered := False;
dmBaseDados.tblANotaFiscalNew.Last;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblEmail.Open;
stsCancelar   := '';
stsInutilizar := '';
Data1.Date    := Date;
Data2.Date    := Date;
memoRespostas.Lines.Clear;
end;

procedure TformGerenciarNFeNew.btnPesquisarClick(Sender: TObject);
begin
dmBaseDados.tblANotaFiscalNew.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblANotaFiscalNew.Filtered := True;
dmBaseDados.tblANotaFiscalNew.First;
end;

procedure TformGerenciarNFeNew.btnNovaPesqClick(Sender: TObject);
begin
dmBaseDados.tblANotaFiscalNew.Filter   := '';
dmBaseDados.tblANotaFiscalNew.Filtered := False;
Data1.Date := Date;
Data2.Date := Date;
dmBaseDados.tblANotaFiscalNew.Last;
end;

procedure TformGerenciarNFeNew.btnImprimirClick(Sender: TObject);
var strCaminho : String;
begin
strCaminho := dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TformGerenciarNFeNew.btnCancelarClick(Sender: TObject);
var Chave, Protocolo, Justificativa,
    strConfirma, strMensagem, CNPJ, idLote : String;
    stsRetorno : Integer;
begin
formCancelarNFe.ShowModal;
CNPJ := '40667557000103';
if (stsCancelar = 'SIM') then
 Begin
  strConfirma := 'Confirma o Cancelamento da Nota Fiscal Nº "' +dmBaseDados.tblANotaFiscalNewNrNF.AsString+ '" ?';
  if (Application.MessageBox(pChar(strConfirma),'ATENÇÃO!',MB_YESNO) = IDYES) then
   begin
    Chave     := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString;
    Protocolo := dmBaseDados.tblANotaFiscalNewProtocolo.AsString;
    Justificativa := formCancelarNFe.edtJustificativa.Text;
    idLote := '1';
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.EventoNFe.Evento.Clear;
    with ACBrNFe1.EventoNFe.Evento.Add do
     begin
      infEvento.chNFe    := Chave;
      infEvento.CNPJ     := CNPJ;
      infEvento.dhEvento := now;
      infEvento.tpEvento := teCancelamento;
      infEvento.detEvento.xJust := Justificativa;
      infEvento.detEvento.nProt := Protocolo;       
     end;
    ACBrNFe1.EnviarEvento(StrToInt(idLote));

    memoRespostas.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS);
    memoRespostas.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetornoWS);
    //LoadXML(MemoResp, WBResposta);
    stsRetorno  := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat; //ACBrNFe1.WebServices.EnvEvento.cStat;
    strMensagem := ACBrNFe1.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo; //ACBrNFe1.WebServices.EnvEvento.xMotivo;
    ShowMessage(IntToStr(stsRetorno) +' - '+ strMensagem);
    if( (stsRetorno = 101)or(stsRetorno = 128)or(stsRetorno = 135)or(stsRetorno = 155) )then
     begin
      dmBaseDados.tblANotaFiscalNew.Edit;
      dmBaseDados.tblANotaFiscalNewStatus.AsInteger       := stsRetorno;
      dmBaseDados.tblANotaFiscalNewMensagem.AsString      := strMensagem;
      dmBaseDados.tblANotaFiscalNewCancelada.AsString     := 'S';
      dmBaseDados.tblANotaFiscalNewDataCanc.AsDateTime    := Date;
      dmBaseDados.tblANotaFiscalNewJustificativa.AsString := Justificativa;
      dmBaseDados.tblANotaFiscalNew.Post;
      btnDuplicDen.Click;
      btnEmail.Click;
     end
    else
     begin
      dmBaseDados.tblANotaFiscalNew.Edit;
      dmBaseDados.tblANotaFiscalNewStatus.AsInteger  := stsRetorno;
      dmBaseDados.tblANotaFiscalNewMensagem.AsString := strMensagem;
      dmBaseDados.tblANotaFiscalNew.Post;
     end;
   end;
 End;
stsCancelar := '';
end;

procedure TformGerenciarNFeNew.btnConsultarClick(Sender: TObject);
var vChave, statusNFe, strMsg : String;
begin
vChave := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString;
ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
ACBrNFe1.WebServices.Consulta.Executar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ' - ' + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewStatus.AsString   := statusNFe;
dmBaseDados.tblANotaFiscalNewMensagem.AsString := strMsg;
dmBaseDados.tblANotaFiscalNew.Post;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;
                                                             
procedure TformGerenciarNFeNew.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformGerenciarNFeNew.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblANotaFiscalNew.Filter   := '';
dmBaseDados.tblANotaFiscalNew.Filtered := False;
dmBaseDados.tblEmail.Close;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblANotaFiscalNew.Close;
end;

procedure TformGerenciarNFeNew.btnInutilizarClick(Sender: TObject);
var Modelo, Serie, sAno, NumeroInicial,
    NumeroFinal, Justificativa, CNPJ : String;    
    Ano, Mes, Dia : Word;
begin
formInutilizar.ShowModal;
if (stsInutilizar = 'SIM') then
 Begin
  SHORTDATEFORMAT := 'dd/mm/yyyy';
  DecodeDate(Date, Ano, Mes, Dia);
  CNPJ   := '40667557000103';
  sAno   := IntToStr(Ano);
  Modelo := '55';
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
  dmBaseDados.tblInutilizadasJustificativa.AsString := Justificativa;
  dmBaseDados.tblInutilizadasData.AsDateTime        := Date;
  dmBaseDados.tblInutilizadas.Post;
  //LoadXML(MemoResp, WBResposta);
 End;
stsInutilizar := '';
end;

procedure TformGerenciarNFeNew.btnLocNFClick(Sender: TObject);
begin
if (edtNumeroNF.Text <> '') then
 Begin
  if (dmBaseDados.tblANotaFiscalNew.Locate('NrNF',edtNumeroNF.Text,[loCaseInsensitive]) = TRUE) then
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

procedure TformGerenciarNFeNew.edtNumeroNFChange(Sender: TObject);
begin
btnLocNF.Default := True;
end;

procedure TformGerenciarNFeNew.btnEmailClick(Sender: TObject);
var strCaminho, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, Para, NomeArq,
    strAssunto, strCliente, emailDest, emailDest2, emailDest3, NumeroNF : String;
    CC, strMensagem, AnexoCanc : Tstrings;
    strConexSegura  : Boolean;
    txtMonitor : TextFile;
begin
strCaminho := dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString;
AnexoCanc  := TstringList.Create;
AnexoCanc.Clear;
if (dmBaseDados.tblANotaFiscalNewCancelada.AsString = 'S') then
 begin
  AnexoCanc.Add('F:\NFeAt\PathEvento\110111' + dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '01-procEventoNFe.xml');
               //F:\NFeAt\PathEvento\110111      35160802494541000149550010000000051762974517    01-procEventoNFe.xml
 end;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
NumeroNF   := dmBaseDados.tblANotaFiscalNewNrNF.AsString;
strCliente := dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString;
emailDest  := '';
emailDest2 := '';
emailDest3 := '';
dmBaseDados.tblClientes.First;
dmBaseDados.tblFornecedores.Open;
If (dmBaseDados.tblANotaFiscalNewEspecie.AsString <> 'D') then
  Begin
   if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
    begin
     emailDest  := dmBaseDados.tblClientesEmail.AsString;
    end;
  End
Else  // * Quando for NF-e de devolução *
  Begin
   strCliente := LRPad(dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString,4,'0','L');
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

      CC.Add(dmBaseDados.tblEmailUsuario.AsString);    //especifique um email vÃ¡lido

      if (emailDest2 <> '') then
       CC.Add(emailDest2);
      if (emailDest3 <> '') then
       CC.Add(emailDest3);

      ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
      ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
      ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
      ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
      ACBrMail1.SetSSL   := dmBaseDados.tblEmailConexaoSegura.Value; // SSL - ConexÃ£o Segura
      ACBrMail1.SetTLS   := dmBaseDados.tblEmailConexaoSegura.Value; // Auto TLS
      ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
      ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
      ACBrMail1.FromName            := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
      strAssunto                    := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
      if (dmBaseDados.tblANotaFiscalNewCancelada.AsString = 'S') then
       begin
        ACBrMail1.FromName          := 'PERFIL AUTO PEÇAS CANCELAMENTO DE NFe Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
        strAssunto                  := 'PERFIL AUTO PEÇAS CANCELAMENTO DE NFe Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
       end;
      mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
      strMensagem     := mmEmailMsg.Lines;
      ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para,
                                                 strAssunto,
                                                 strMensagem
                                                 ,True  // Enviar PDF junto
                                                 ,CC    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                 ,AnexoCanc); // Lista de anexos - TStrings    // nil
    finally
      CC.Free;
      AnexoCanc.Free;
    end;
  End;
end;

procedure TformGerenciarNFeNew.btnCCeClick(Sender: TObject);
var Chave, idLote, codOrgao, CNPJ,
    nSeqEvento, Correcao : String;
begin
if (dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString = '') then
 begin
  Application.MessageBox('Nota Fiscal não gerada por este sistema!','ATENÇÃO!',MB_ICONEXCLAMATION);
  Abort;
 end;
  Chave      := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString;
  idLote     := '1';
  codOrgao   := Copy(Chave,1,2);       
  CNPJ       := Copy(Chave,7,14);
  nSeqEvento := '1';
  Correcao   := 'DIGITE AQUI A CORREÇÃO!';
  if not(InputQuery('WebServices Eventos: Carta de Correção', 'Correção a ser considerada', Correcao)) then
     exit;
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.EventoNFe.Evento.Clear;
  dmBaseDados.tblANotaFiscalNew.Edit;
  dmBaseDados.tblANotaFiscalNewCodContabil.AsInteger := dmBaseDados.tblANotaFiscalNewCodContabil.AsInteger + 1;
  dmBaseDados.tblANotaFiscalNew.Post;
  nSeqEvento := IntToStr(dmBaseDados.tblANotaFiscalNewCodContabil.AsInteger);
  with ACBrNFe1.EventoNFe.Evento.Add do
   begin
    infEvento.chNFe      := Chave;
    infEvento.CNPJ       := CNPJ;
    infEvento.dhEvento   := now;
    infEvento.tpEvento   := teCCe;
    infEvento.nSeqEvento := StrToInt(nSeqEvento);
    infEvento.detEvento.xCorrecao := Correcao;
   end;
ACBrNFe1.EnviarEvento(StrToInt(idLote));
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.EnvEvento.RetWS));
end;

procedure TformGerenciarNFeNew.btnReenviarClick(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2 : String;
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser,
    strSmtpPass, Para, NomeArq, strAssunto, emailDest,
    chCodUF, chData, chAnoMes, chCNPJ, chModelo, chSerie, strMotivo,
    chNrNFe, chFormaEmissao, chCodNumerico, ChaveAcesso, strCh : String;
    ArquivoNFe, txtMonitor : TextFile ;
    stsRetorno : Integer;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
 {
//Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '61429791000164';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNewNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalNewPedido.AsString;
strCaminho   := 'F:\NFeAt\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
//
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
}

ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(dmBaseDados.tblANotaFiscalNewCaminho2.AsString);
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;           
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
try
 ACBrNFe1.WebServices.Envia(1);
except                                         
 if (pos('Duplicidade de NF-e com diferença na Chave de Acesso', ACBrNFe1.NotasFiscais.Items[0].Msg) > 0) then
  begin
   dmBaseDados.tblANotaFiscalNew.Edit;
   dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,pos('NFe:',ACBrNFe1.NotasFiscais.Items[0].Msg)+4,44);
   dmBaseDados.tblANotaFiscalNew.Post;
   btnDuplicDen.Click;
  end
else if (Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,1,29) = 'Rejeição: Duplicidade de NF-e') then
  begin
   dmBaseDados.tblANotaFiscalNew.Edit;
   dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
   dmBaseDados.tblANotaFiscalNew.Post;
   btnDuplicDen.Click;
  end  
 else
  begin
   ShowMessage('Nota(s) não confirmadas:'+#13+ IntToStr(ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF) + '->' + ACBrNFe1.NotasFiscais.Items[0].Msg);
  end;
 Abort;
end;
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;

// Retorno do WebService:
stsRetorno := ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].cStat;
strMotivo  := ACBrNFe1.WebServices.Retorno.NFeRetorno.ProtDFe.Items[0].xMotivo;
dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewStatus.AsInteger     := stsRetorno;
dmBaseDados.tblANotaFiscalNewMensagem.AsString    := strMotivo;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
strCh := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '-NFe.xml';
dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := 'F:\NFeAt\PathNfe\'+ strCh; //ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := strCh;

if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString := 'F:\NFeAt\PathNFe\' + NomeArq;
dmBaseDados.tblANotaFiscalNew.Post;
                                            
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then                           
  Begin
   btnEmail.Click;
  End;
end;

procedure TformGerenciarNFeNew.btnDuplicDenClick(Sender: TObject);
var strCaminho, vChave, statusNFe,
    strMsg, strCh, NomeArq,                    
    Origem, Destino, OrigCanc, DestCanc, strNomeArq : String;
begin
ACBrNFe1.NotasFiscais.Clear;
strCaminho := dmBaseDados.tblANotaFiscalNewCaminho2.AsString;
strCh      := dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '-NFe.xml';
strCaminho := 'F:\NFeAt\PathNfe\'+ strCh; // Aqui pega o caminho do primeiro XML gerado, no caso o que foi enviado ao SEFAZ
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.Consultar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewStatus.AsString    := statusNFe;
dmBaseDados.tblANotaFiscalNewMensagem.AsString  := strMsg;
dmBaseDados.tblANotaFiscalNewProtocolo.AsString := ACBrNFe1.WebServices.Consulta.Protocolo;
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
  {if( (statusNFe = '101')or(statusNFe = '128')or(statusNFe = '135') )then  //Cancelada
   begin
    NomeArq := StringReplace(NomeArq,'-nfe.xml','-can.xml',[rfIgnoreCase]);
   end; }
 end;
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
Origem  := NomeArq;
Destino := 'F:\NFeAt\PathNFe\' + NomeArq;
if( (statusNFe = '101')or(statusNFe = '128')or(statusNFe = '135') )then // NotaCancelada //35160702494541000149550010000000211117976467-NFeDFe.xml Quando é nf cancelada
 begin
  OrigCanc := 'F:\NFeAt\PathNFe\' + dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '-NFeDFe.xml';
  DestCanc := 'F:\NFeAt\NFeCan\' + dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString + '-NFeCanc.xml';
  Destino  := DestCanc;
  CopyFile(PChar(OrigCanc), PChar(DestCanc), False);
 end;
dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString := Destino;             
dmBaseDados.tblANotaFiscalNewCaminho2.AsString   := strCaminho;
dmBaseDados.tblANotaFiscalNew.Post;
if (statusNFe = '100') then
 begin
  btnImprimir.Click;          
 end;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;

procedure TformGerenciarNFeNew.btnSituacaoClick(Sender: TObject);
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

procedure TformGerenciarNFeNew.TISButton1Click(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2 : String;
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser,
    strSmtpPass, Para, NomeArq, strAssunto, emailDest,
    chCodUF, chData, chAnoMes, chCNPJ, chModelo, chSerie,
    chNrNFe, chFormaEmissao, chCodNumerico, ChaveAcesso : String;
    ArquivoNFe, txtMonitor : TextFile ;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
//Gerando Chave de Acesso:      
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '40667557000103';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNewNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;                   
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalNewPedido.AsString;
strCaminho   := 'F:\NFeAt\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
//
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
//ACBrNFe1.WebServices.StatusServico.Executar;
//ShowMessage(ACBrNFe1.WebServices.StatusServico.Msg);
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
ACBrNFe1.WebServices.Envia(1);
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;

dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString := NomeArq;
dmBaseDados.tblANotaFiscalNew.Post;

ACBrNFe1.Configuracoes.WebServices.UF := 'SP';  
end;

procedure TformGerenciarNFeNew.TISButton2Click(Sender: TObject);
var strPedidoNFe, strCliente, strCaminho, strLinha2, strLinhaCont : String;
    AcbrNFe, strSmtpHost, strSmtpPort, strSmtpUser,
    strSmtpPass, Para, NomeArq, strAssunto, emailDest,
    chCodUF, chData, chAnoMes, chCNPJ, chModelo, chSerie,
    chNrNFe, chFormaEmissao, chCodNumerico, ChaveAcesso, DataContig : String;
    ArquivoNFe, txtMonitor : TextFile ;
    CC, strMensagem : Tstrings;
    strConexSegura : Boolean;
    CodigoNumerico : Integer;
begin
emailDest  := '';
strCliente := dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
//Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '40667557000103';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNewNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalNewPedido.AsString;
strCaminho   := 'F:\NFeAt\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
// Alterando linha para contingência:
SHORTDATEFORMAT := 'yyyy-mm-dd';
DataContig      := DateToStr(Date) + 'T' + TimeToStr(Time) + '-02:00' + '|ERRO 403 SEFAZ SP|';
strLinhaCont    := dmBaseDados.tblANotaFiscalNewLinhaConting.AsString + DataContig;
SHORTDATEFORMAT := 'dd/mm/yyyy';
AlteraLinhaTxt(strCaminho,2,strLinhaCont);
//
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
//ACBrNFe1.WebServices.StatusServico.Executar;
//ShowMessage(ACBrNFe1.WebServices.StatusServico.Msg);
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
ACBrNFe1.WebServices.Envia(1);
ACBrNFe1.NotasFiscais.Items[0].Imprimir;
ACBrNFe1.NotasFiscais.ImprimirPDF;

dmBaseDados.tblANotaFiscalNew.Edit;
dmBaseDados.tblANotaFiscalNewChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalNewProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalNewCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString := NomeArq;
dmBaseDados.tblANotaFiscalNew.Post;
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then
  Begin
  { Para := emailDest;
   CC   := TstringList.Create;
   CC.Add(dmBaseDados.tblEmailUsuario.AsString); //especifique um email válido
   //CC.Add('anfm@zipmail.com.br');    //especifique um email válido
   strSmtpHost     := dmBaseDados.tblEmailServidorSMTP.AsString;
   strSmtpPort     := dmBaseDados.tblEmailPorta.AsString;
   strSmtpUser     := dmBaseDados.tblEmailUsuario.AsString;
   strSmtpPass     := dmBaseDados.tblEmailSenha.AsString;
   strConexSegura  := dmBaseDados.tblEmailConexaoSegura.Value;
   mmEmailMsg.Text := dmBaseDados.tblEmailMensagem.AsString;
   strMensagem     := mmEmailMsg.Lines;
   strAssunto      := 'Nota Fiscal JVN NF-e n. ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
   ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(strSmtpHost
                                            , strSmtpPort
                                            , strSmtpUser
                                            , strSmtpPass
                                            , strSmtpUser
                                            , Para
                                            , strAssunto
                                            , strMensagem
                                            , strConexSegura // SSL - Conexão Segura
                                            , True           // Enviar PDF junto
                                            , CC             // Lista com emails que serão enviado cópias - TStrigns
                                            , nil            // Lista de anexos - TStrings
                                            , False          // Pede confirmação de leitura do email
                                            , False          // Aguarda Envio do Email(não usa thread)
                                            , 'JVN'      // Nome do Rementente
                                            , strConexSegura); // Auto TLS
   CC.Free;  }
  End;
end;

procedure TformGerenciarNFeNew.btnXMLClick(Sender: TObject);
var strPasta, strData1, strData2,
    Origem, Destino, strNomeArq,
    Temp, LinhadeComando, Arq, Dest : String;
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
if (not DirectoryExists('F:\NFeAt\Contabilidade\' + strPasta)) then
 begin
  ForceDirectories('F:\NFeAt\Contabilidade\' + strPasta);
 end;
dmBaseDados.tblANotaFiscalNew.First;
while (not dmBaseDados.tblANotaFiscalNew.Eof) do
  Begin
   Origem     := dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString;
   strNomeArq := Copy(Origem,18,58);
   Destino    := 'F:\NFeAt\Contabilidade\' + strPasta +'\' + strNomeArq;
   CopyFile(PChar(Origem), PChar(Destino), False);
   dmBaseDados.tblANotaFiscalNew.Next;
  End;                                                                  
ShowMessage('Arquivos copiados com sucesso para pasta: F:\NFeAt\Contabilidade\' + strPasta);
if (Application.MessageBox('Deseja compactar a pasta gerada?','ATENÇÃO!',MB_YESNO) = IDYES) then
 begin
  Temp           := ChangeFileExt('F:\NFeAt\Contabilidade\' + strPasta,'.rar');
  LinhadeComando := 'C:\Arquivos de programas\WinRAR\WINRAR.EXE a "'  +Temp  +'" "'  +'F:\NFeAt\Contabilidade\'  + strPasta  +'"';
  Try
   WinExec(Pchar(LinhadeComando),1);
  Except
  End;
 end;
end;

procedure TformGerenciarNFeNew.grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (dmBaseDados.tblANotaFiscalNewCancelada.AsString = 'S') then
 begin
  grdNotas.Canvas.Font.Color  := clRed;
  grdNotas.Canvas.Brush.Color := clWhite;             
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;                                         
if( (dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalNewStatus.AsInteger = 110) )then
 begin
  grdNotas.Canvas.Font.Color  := $000D62F0;
  grdNotas.Canvas.Brush.Color := clWhite;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
if( (dmBaseDados.tblANotaFiscalNewStatus.AsString = '')or(dmBaseDados.tblANotaFiscalNewProtocolo.AsString = '') )then
 begin
  grdNotas.Canvas.Font.Color  := clBlack;       
  grdNotas.Canvas.Brush.Color := clYellow;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
end;

procedure TformGerenciarNFeNew.grdNotasDblClick(Sender: TObject);
begin
formDadosProdutosNFe.ShowModal;
end;

procedure TformGerenciarNFeNew.TISButton3Click(Sender: TObject);
begin
formConfigEmail.ShowModal;
end;

procedure TformGerenciarNFeNew.TISButton4Click(Sender: TObject);
var strCaminho, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, Para, NomeArq,
    strAssunto, strCliente, emailDest, emailDest2, emailDest3, NumeroNF : String;
    CC, strMensagem, AnexoCartaCorrecao : Tstrings;
    strConexSegura  : Boolean;
    txtMonitor : TextFile;
begin
OpenDialog1.Title := 'Selecione o Evento';
OpenDialog1.DefaultExt := '*.XML';
OpenDialog1.Filter := 'Arquivos XML (*.XML)|*.XML|Todos os Arquivos (*.*)|*.*';
OpenDialog1.InitialDir := ACBrNFe1.Configuracoes.Arquivos.PathEvento;
if (OpenDialog1.Execute) then
  BEGIN
   ACBrNFe1.EventoNFe.Evento.Clear;
   ACBrNFe1.EventoNFe.LerXML(OpenDialog1.FileName) ;
   ACBrNFe1.ImprimirEvento;
   // Enviar EMail da Carta de Correção
   strCaminho := dmBaseDados.tblANotaFiscalNewCaminhoXML.AsString;
   AnexoCartaCorrecao  := TstringList.Create;
   AnexoCartaCorrecao.Clear;
   AnexoCartaCorrecao.Add(OpenDialog1.FileName);
   ACBrNFe1.NotasFiscais.Clear;
   ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
   NumeroNF   := dmBaseDados.tblANotaFiscalNewNrNF.AsString;
   strCliente := dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString;
   emailDest  := '';
   emailDest2 := '';
   emailDest3 := '';
   dmBaseDados.tblClientes.First;
   dmBaseDados.tblFornecedores.Open;
   if (dmBaseDados.tblANotaFiscalNewEspecie.AsString <> 'D') then
     Begin
      if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
       begin
        emailDest  := dmBaseDados.tblClientesEmail.AsString;
       end;
     End
   else  // * Quando for NF-e de devolução *
     Begin
      strCliente := LRPad(dmBaseDados.tblANotaFiscalNewCodigoCliente.AsString,4,'0','L');
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

         CC.Add(dmBaseDados.tblEmailUsuario.AsString);    //especifique um email vÃ¡lido

         if (emailDest2 <> '') then
          CC.Add(emailDest2);
         if (emailDest3 <> '') then
          CC.Add(emailDest3);

         ACBrMail1.Host     := dmBaseDados.tblEmailServidorSMTP.AsString;
         ACBrMail1.Port     := dmBaseDados.tblEmailPorta.AsString;
         ACBrMail1.Username := dmBaseDados.tblEmailUsuario.AsString;
         ACBrMail1.Password := dmBaseDados.tblEmailSenha.AsString;
         ACBrMail1.From     := dmBaseDados.tblEmailUsuario.AsString;
         ACBrMail1.SetSSL   := dmBaseDados.tblEmailConexaoSegura.Value; // SSL - ConexÃ£o Segura
         ACBrMail1.SetTLS   := dmBaseDados.tblEmailConexaoSegura.Value; // Auto TLS
         ACBrMail1.ReadingConfirmation := False;                        // Pede confirmação de leitura do email
         ACBrMail1.UseThread           := False;                        // Aguarda Envio do Email(não usa thread)
         ACBrMail1.FromName := 'CARTA DE CORREÇÃO NFE PERFIL AUTO PECAS Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
         strAssunto         := 'CARTA DE CORREÇÃO NFE PERFIL AUTO PECAS Nº ' + dmBaseDados.tblANotaFiscalNewNrNF.AsString;
         mmEmailMsg.Text    := dmBaseDados.tblEmailMensagem.AsString;
         strMensagem        := mmEmailMsg.Lines;
         ACBrNFe1.NotasFiscais.Items[0].EnviarEmail(Para,
                                                    strAssunto,
                                                    strMensagem
                                                    , True  // Enviar PDF junto
                                                    , CC    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                    , AnexoCartaCorrecao); // Lista de anexos - TStrings    // nil
       finally
         CC.Free;
         AnexoCartaCorrecao.Free;
       end;
     End;
  END;
end;

end.
