unit GerenciarNFe;

interface
                                      
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TIGradient, StdCtrls, TISEdit, TISButton, Grids,
     DBGrids, ComCtrls, ACBrNFeDANFEClass, ACBrBase, ACBrDFe, ACBrNFe,
     ExtCtrls, TISImagePanel, TISDBCtrls, TILabel, TISLABELS, MidasLib,
<<<<<<< HEAD
     TISURLLabel, pcnNFeRTXT, pcnAuxiliar, RLConsts, IniFiles,  ACBrDFeSSL,
     ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFeRLClass, ACBrMail, blcksock,
     TIGradientCaption, jpeg, pcnConversao, ACBrDFe.Conversao, ACBrNFe.Classes,
     pcnConversaoNFe, db;
=======
     TISURLLabel, pcnNFeRTXT, pcnAuxiliar, RLConsts,
     pcnConversao, ACBrNFeDANFeRLClass, ACBrMail, db, blcksock, TIGradientCaption, jpeg,
     ACBrNFe.Classes, ACBrDFeSSL, ACBrDFe.Conversao,
  ACBrDFeReport, ACBrDFeDANFeReport;
>>>>>>> 88d158b68d6ce545f58ddab477608a8883bf6907

type
  TformGerenciarNFe = class(TForm)
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

var formGerenciarNFe : TformGerenciarNFe;
    NFeRTXT : TNFeRTXT;
    ArqINI : String;
    INI : TIniFile;

implementation

uses ModuloDados, CancelarNFe, Inutilizar, RotinasGerais,
     DadosProdutosNFe, ConfigEmail, ACBrNFeConfiguracoes;


{$R *.dfm}


procedure TformGerenciarNFe.FormShow(Sender: TObject);
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
dmBaseDados.tblANotaFiscal.Open;
dmBaseDados.tblANotaFiscal.Filter   := '';
dmBaseDados.tblANotaFiscal.Filtered := False;
dmBaseDados.tblANotaFiscal.Last;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblEmail.Open;
stsCancelar   := '';
stsInutilizar := '';
Data1.Date    := Date;
Data2.Date    := Date;
memoRespostas.Lines.Clear;
ACBrNFe1.Configuracoes.Geral.SSLLib        := libWinCrypt;
ACBrNFe1.Configuracoes.WebServices.SSLType := LT_TLSv1_2;


end;

procedure TformGerenciarNFe.btnPesquisarClick(Sender: TObject);
begin
dmBaseDados.tblANotaFiscal.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblANotaFiscal.Filtered := True;
dmBaseDados.tblANotaFiscal.First;
end;

procedure TformGerenciarNFe.btnNovaPesqClick(Sender: TObject);
begin
dmBaseDados.tblANotaFiscal.Filter   := '';
dmBaseDados.tblANotaFiscal.Filtered := False;
Data1.Date := Date;
Data2.Date := Date;
dmBaseDados.tblANotaFiscal.Last;
end;

procedure TformGerenciarNFe.btnImprimirClick(Sender: TObject);
var strCaminho : String;
begin
strCaminho := dmBaseDados.tblANotaFiscalCaminhoXML.AsString;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.NotasFiscais.Imprimir;
end;

procedure TformGerenciarNFe.btnCancelarClick(Sender: TObject);
var Chave, Protocolo, Justificativa,
    strConfirma, strMensagem, CNPJ, idLote : String;
    stsRetorno : Integer;
begin
formCancelarNFe.ShowModal;
CNPJ := '61429791000164';
if (stsCancelar = 'SIM') then
 Begin
  strConfirma := 'Confirma o Cancelamento da Nota Fiscal Nº "' +dmBaseDados.tblANotaFiscalNrNF.AsString+ '" ?';
  if (Application.MessageBox(pChar(strConfirma),'ATENÇÃO!',MB_YESNO) = IDYES) then
   begin
    Chave     := dmBaseDados.tblANotaFiscalChaveAcesso.AsString;
    Protocolo := dmBaseDados.tblANotaFiscalProtocolo.AsString;
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
      dmBaseDados.tblANotaFiscal.Edit;
      dmBaseDados.tblANotaFiscalStatus.AsInteger       := stsRetorno;
      dmBaseDados.tblANotaFiscalMensagem.AsString      := strMensagem;
      dmBaseDados.tblANotaFiscalCancelada.AsString     := 'S';
      dmBaseDados.tblANotaFiscalDataCanc.AsDateTime    := Date;
      dmBaseDados.tblANotaFiscalJustificativa.AsString := Justificativa;
      dmBaseDados.tblANotaFiscal.Post;
      btnDuplicDen.Click;
      btnEmail.Click;
     end
    else
     begin
      dmBaseDados.tblANotaFiscal.Edit;
      dmBaseDados.tblANotaFiscalStatus.AsInteger  := stsRetorno;
      dmBaseDados.tblANotaFiscalMensagem.AsString := strMensagem;
      dmBaseDados.tblANotaFiscal.Post;
     end;
   end;
 End;
stsCancelar := '';
end;

procedure TformGerenciarNFe.btnConsultarClick(Sender: TObject);
var vChave, statusNFe, strMsg : String;
begin
vChave := dmBaseDados.tblANotaFiscalChaveAcesso.AsString;
ACBrNFe1.WebServices.Consulta.NFeChave := vChave;
ACBrNFe1.WebServices.Consulta.Executar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ' - ' + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalStatus.AsString   := statusNFe;
dmBaseDados.tblANotaFiscalMensagem.AsString := strMsg;
dmBaseDados.tblANotaFiscal.Post;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;
                                                             
procedure TformGerenciarNFe.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformGerenciarNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblANotaFiscal.Filter   := '';
dmBaseDados.tblANotaFiscal.Filtered := False;
dmBaseDados.tblEmail.Close;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblANotaFiscal.Close;
end;

procedure TformGerenciarNFe.btnInutilizarClick(Sender: TObject);
var Modelo, Serie, sAno, NumeroInicial,
    NumeroFinal, Justificativa, CNPJ : String;    
    Ano, Mes, Dia : Word;
begin
formInutilizar.ShowModal;
if (stsInutilizar = 'SIM') then
 Begin
  SHORTDATEFORMAT := 'dd/mm/yyyy';
  DecodeDate(Date, Ano, Mes, Dia);
  CNPJ   := '61429791000164';
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

procedure TformGerenciarNFe.btnLocNFClick(Sender: TObject);
begin
if (edtNumeroNF.Text <> '') then
 Begin
  if (dmBaseDados.tblANotaFiscal.Locate('NrNF',edtNumeroNF.Text,[loCaseInsensitive]) = TRUE) then
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

procedure TformGerenciarNFe.edtNumeroNFChange(Sender: TObject);
begin
btnLocNF.Default := True;
end;

procedure TformGerenciarNFe.btnEmailClick(Sender: TObject);
var strCaminho, strSmtpHost, strSmtpPort,
    strSmtpUser, strSmtpPass, Para, NomeArq,
    strAssunto, strCliente, emailDest, emailDest2, emailDest3, NumeroNF : String;
    CC, strMensagem, AnexoCanc : Tstrings;
    strConexSegura  : Boolean;
    txtMonitor : TextFile;
begin
strCaminho := dmBaseDados.tblANotaFiscalCaminhoXML.AsString;
AnexoCanc  := TstringList.Create;
AnexoCanc.Clear;
if (dmBaseDados.tblANotaFiscalCancelada.AsString = 'S') then
 begin
  AnexoCanc.Add('F:\NFe\PathEvento\110111' + dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '01-procEventoNFe.xml');
               //F:\NFe\PathEvento\110111      35160802494541000149550010000000051762974517    01-procEventoNFe.xml
 end;
ACBrNFe1.NotasFiscais.Clear;
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
NumeroNF   := dmBaseDados.tblANotaFiscalNrNF.AsString;
strCliente := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
emailDest  := '';
emailDest2 := '';
emailDest3 := '';
dmBaseDados.tblClientes.First;
dmBaseDados.tblFornecedores.Open;
If (dmBaseDados.tblANotaFiscalEspecie.AsString <> 'D') then
  Begin
   if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
    begin
     emailDest  := dmBaseDados.tblClientesEmail.AsString;
    end;
  End
Else  // * Quando for NF-e de devolução *
  Begin
   strCliente := LRPad(dmBaseDados.tblANotaFiscalCodigoCliente.AsString,4,'0','L');
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
      ACBrMail1.FromName            := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
      strAssunto                    := 'PERFIL AUTO PEÇAS NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
      if (dmBaseDados.tblANotaFiscalCancelada.AsString = 'S') then
       begin
        ACBrMail1.FromName          := 'PERFIL AUTO PEÇAS CANCELAMENTO DE NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
        strAssunto                  := 'PERFIL AUTO PEÇAS CANCELAMENTO DE NFe Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
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

procedure TformGerenciarNFe.btnCCeClick(Sender: TObject);
var Chave, idLote, codOrgao, CNPJ,
    nSeqEvento, Correcao : String;
begin
if (dmBaseDados.tblANotaFiscalChaveAcesso.AsString = '') then
 begin
  Application.MessageBox('Nota Fiscal não gerada por este sistema!','ATENÇÃO!',MB_ICONEXCLAMATION);
  Abort;
 end;
  Chave      := dmBaseDados.tblANotaFiscalChaveAcesso.AsString;
  idLote     := '1';
  codOrgao   := Copy(Chave,1,2);       
  CNPJ       := Copy(Chave,7,14);
  nSeqEvento := '1';
  Correcao   := 'DIGITE AQUI A CORREÇÃO!';
  if not(InputQuery('WebServices Eventos: Carta de Correção', 'Correção a ser considerada', Correcao)) then
     exit;
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.EventoNFe.Evento.Clear;
  dmBaseDados.tblANotaFiscal.Edit;
  dmBaseDados.tblANotaFiscalCodContabil.AsInteger := dmBaseDados.tblANotaFiscalCodContabil.AsInteger + 1;
  dmBaseDados.tblANotaFiscal.Post;
  nSeqEvento := IntToStr(dmBaseDados.tblANotaFiscalCodContabil.AsInteger);
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

procedure TformGerenciarNFe.btnReenviarClick(Sender: TObject);
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
strCliente := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
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
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalPedido.AsString;
strCaminho   := 'F:\NFe\' + strPedidoNFe + '.txt';
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
ACBrNFe1.NotasFiscais.LoadFromFile(dmBaseDados.tblANotaFiscalCaminho2.AsString);
ACBrNFe1.NotasFiscais.GerarNFe;
ACBrNFe1.NotasFiscais.Assinar;           
ACBrNFe1.NotasFiscais.Validar;
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
try
 ACBrNFe1.WebServices.Envia(1);
except                                         
 if (pos('Duplicidade de NF-e com diferença na Chave de Acesso', ACBrNFe1.NotasFiscais.Items[0].Msg) > 0) then
  begin
   dmBaseDados.tblANotaFiscal.Edit;
   dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,pos('NFe:',ACBrNFe1.NotasFiscais.Items[0].Msg)+4,44);
   dmBaseDados.tblANotaFiscal.Post;
   btnDuplicDen.Click;
  end
else if (Copy(ACBrNFe1.NotasFiscais.Items[0].Msg,1,29) = 'Rejeição: Duplicidade de NF-e') then
  begin
   dmBaseDados.tblANotaFiscal.Edit;
   dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
   dmBaseDados.tblANotaFiscal.Post;
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
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalStatus.AsInteger     := stsRetorno;
dmBaseDados.tblANotaFiscalMensagem.AsString    := strMotivo;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
strCh := dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '-NFe.xml';
dmBaseDados.tblANotaFiscalProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalCaminho2.AsString    := 'F:\NFe\PathNfe\'+ strCh; //ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := strCh;

if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalCaminhoXML.AsString := 'F:\NFe\PathNFe\' + NomeArq;
dmBaseDados.tblANotaFiscal.Post;
                                            
// Enviando email do XML e PDF da NF-e
if (emailDest <> '') then                           
  Begin
   btnEmail.Click;
  End;
end;

procedure TformGerenciarNFe.btnDuplicDenClick(Sender: TObject);
var strCaminho, vChave, statusNFe,
    strMsg, strCh, NomeArq,                    
    Origem, Destino, OrigCanc, DestCanc, strNomeArq : String;
begin
ACBrNFe1.NotasFiscais.Clear;
strCaminho := dmBaseDados.tblANotaFiscalCaminho2.AsString;
strCh      := dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '-NFe.xml';
strCaminho := 'F:\NFe\PathNfe\'+ strCh; // Aqui pega o caminho do primeiro XML gerado, no caso o que foi enviado ao SEFAZ
ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
ACBrNFe1.Consultar;
statusNFe := IntToStr(ACBrNFe1.WebServices.Consulta.cStat);
strMsg    := statusNFe + ACBrNFe1.WebServices.Consulta.XMotivo;
Application.MessageBox(pChar(strMsg),'Retorno NF-e',MB_ICONASTERISK);
ACBrNFe1.NotasFiscais.Items[0].GravarXML;
dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalStatus.AsString    := statusNFe;
dmBaseDados.tblANotaFiscalMensagem.AsString  := strMsg;
dmBaseDados.tblANotaFiscalProtocolo.AsString := ACBrNFe1.WebServices.Consulta.Protocolo;
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
Destino := 'F:\NFe\PathNFe\' + NomeArq;
if( (statusNFe = '101')or(statusNFe = '128')or(statusNFe = '135') )then // NotaCancelada //35160702494541000149550010000000211117976467-NFeDFe.xml Quando é nf cancelada
 begin
  OrigCanc := 'F:\NFe\PathNFe\' + dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '-NFeDFe.xml';
  DestCanc := 'F:\NFe\NFeCan\' + dmBaseDados.tblANotaFiscalChaveAcesso.AsString + '-NFeCanc.xml';
  Destino  := DestCanc;
  CopyFile(PChar(OrigCanc), PChar(DestCanc), False);
 end;
dmBaseDados.tblANotaFiscalCaminhoXML.AsString := Destino;             
dmBaseDados.tblANotaFiscalCaminho2.AsString   := strCaminho;
dmBaseDados.tblANotaFiscal.Post;
if (statusNFe = '100') then
 begin
  btnImprimir.Click;          
 end;
memoRespostas.Lines.Clear;
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetWS));
memoRespostas.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.RetornoWS));
end;

procedure TformGerenciarNFe.btnSituacaoClick(Sender: TObject);
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

procedure TformGerenciarNFe.TISButton1Click(Sender: TObject);
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
strCliente := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
//Gerando Chave de Acesso:      
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '61429791000164';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;                   
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalPedido.AsString;
strCaminho   := 'F:\NFe\' + strPedidoNFe + '.txt';
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

dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalCaminhoXML.AsString := NomeArq;
dmBaseDados.tblANotaFiscal.Post;

ACBrNFe1.Configuracoes.WebServices.UF := 'SP';  
end;

procedure TformGerenciarNFe.TISButton2Click(Sender: TObject);
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
strCliente := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
dmBaseDados.tblClientes.First;
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
 begin
  emailDest := dmBaseDados.tblClientesEmail.AsString;
 end;
//Gerando Chave de Acesso:
chCodUF  := '35';
chData   := FormatDateTime('DD/MM/YY', Date);
chAnoMes := Copy(chData,7,2) + Copy(chData,4,2);
chCNPJ   := '04418512000123';
chModelo := '55';
chSerie  := '001';
chNrNFe  := LRPad(dmBaseDados.tblANotaFiscalNrNF.AsString,9,'0','L');
chFormaEmissao := '1';
Randomize;
CodigoNumerico := Random(99999999);
chCodNumerico  := IntToStr(CodigoNumerico);
ChaveAcesso    := chCodUF + chAnoMes + chCNPJ + chModelo + chSerie + chNrNFe + chFormaEmissao + chCodNumerico;
//Alterando a chave no txt
strPedidoNFe := dmBaseDados.tblANotaFiscalPedido.AsString;
strCaminho   := 'F:\NFe\' + strPedidoNFe + '.txt';
strLinha2    := 'A|3.10|NFe'  +ChaveAcesso;
AlteraLinhaTxt(strCaminho,1,strLinha2);
// Alterando linha para contingência:
SHORTDATEFORMAT := 'yyyy-mm-dd';
DataContig      := DateToStr(Date) + 'T' + TimeToStr(Time) + '-02:00' + '|ERRO 403 SEFAZ SP|';
strLinhaCont    := dmBaseDados.tblANotaFiscalLinhaConting.AsString + DataContig;
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

dmBaseDados.tblANotaFiscal.Edit;
dmBaseDados.tblANotaFiscalChaveAcesso.AsString := Copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
dmBaseDados.tblANotaFiscalProtocolo.AsString   := ACBrNFe1.WebServices.Retorno.Protocolo; //ACBrNFe1.DANFE.ProtocoloNFe;
dmBaseDados.tblANotaFiscalCaminho2.AsString    := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
NomeArq := ACBrNFe1.NotasFiscais.Items[0].NomeArq;
if pos(UpperCase('-nfe.xml'),UpperCase(NomeArq)) > 0 then
 NomeArq := StringReplace(NomeArq,'-nfe.xml','-procNfe.xml',[rfIgnoreCase]);
ACBrNFe1.NotasFiscais.Items[0].GravarXML(NomeArq);
dmBaseDados.tblANotaFiscalCaminhoXML.AsString := NomeArq;
dmBaseDados.tblANotaFiscal.Post;
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
   strAssunto      := 'Nota Fiscal JVN NF-e n. ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
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

procedure TformGerenciarNFe.btnXMLClick(Sender: TObject);
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
if (not DirectoryExists('F:\NFe\Contabilidade\' + strPasta)) then
 begin
  ForceDirectories('F:\NFe\Contabilidade\' + strPasta);
 end;
dmBaseDados.tblANotaFiscal.First;
while (not dmBaseDados.tblANotaFiscal.Eof) do
  Begin
   Origem     := dmBaseDados.tblANotaFiscalCaminhoXML.AsString;
   strNomeArq := Copy(Origem,16,56);
   Destino    := 'F:\NFe\Contabilidade\' + strPasta +'\' + strNomeArq;
   CopyFile(PChar(Origem), PChar(Destino), False);
   dmBaseDados.tblANotaFiscal.Next;
  End;                                                                  
ShowMessage('Arquivos copiados com sucesso para pasta: F:\NFe\Contabilidade\' + strPasta);
if (Application.MessageBox('Deseja compactar a pasta gerada?','ATENÇÃO!',MB_YESNO) = IDYES) then
 begin
  Temp           := ChangeFileExt('F:\NFe\Contabilidade\' + strPasta,'.rar');
  LinhadeComando := 'C:\Arquivos de programas\WinRAR\WINRAR.EXE a "'  +Temp  +'" "'  +'F:\NFe\Contabilidade\'  + strPasta  +'"';
  Try
   WinExec(Pchar(LinhadeComando),1);
  Except
  End;
 end;
end;

procedure TformGerenciarNFe.grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (dmBaseDados.tblANotaFiscalCancelada.AsString = 'S') then
 begin
  grdNotas.Canvas.Font.Color  := clRed;
  grdNotas.Canvas.Brush.Color := clWhite;             
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;                                         
if( (dmBaseDados.tblANotaFiscalStatus.AsInteger = 302)or(dmBaseDados.tblANotaFiscalStatus.AsInteger = 110) )then
 begin
  grdNotas.Canvas.Font.Color  := $000D62F0;
  grdNotas.Canvas.Brush.Color := clWhite;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
if( (dmBaseDados.tblANotaFiscalStatus.AsString = '')or(dmBaseDados.tblANotaFiscalProtocolo.AsString = '') )then
 begin
  grdNotas.Canvas.Font.Color  := clBlack;       
  grdNotas.Canvas.Brush.Color := clYellow;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
end;

procedure TformGerenciarNFe.grdNotasDblClick(Sender: TObject);
begin
formDadosProdutosNFe.ShowModal;
end;

procedure TformGerenciarNFe.TISButton3Click(Sender: TObject);
begin
formConfigEmail.ShowModal;
end;

procedure TformGerenciarNFe.TISButton4Click(Sender: TObject);
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
   strCaminho := dmBaseDados.tblANotaFiscalCaminhoXML.AsString;
   AnexoCartaCorrecao  := TstringList.Create;
   AnexoCartaCorrecao.Clear;
   AnexoCartaCorrecao.Add(OpenDialog1.FileName);
   ACBrNFe1.NotasFiscais.Clear;
   ACBrNFe1.NotasFiscais.LoadFromFile(strCaminho);
   NumeroNF   := dmBaseDados.tblANotaFiscalNrNF.AsString;
   strCliente := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
   emailDest  := '';
   emailDest2 := '';
   emailDest3 := '';
   dmBaseDados.tblClientes.First;
   dmBaseDados.tblFornecedores.Open;
   if (dmBaseDados.tblANotaFiscalEspecie.AsString <> 'D') then
     Begin
      if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]) = TRUE) then
       begin
        emailDest  := dmBaseDados.tblClientesEmail.AsString;
       end;
     End
   else  // * Quando for NF-e de devolução *
     Begin
      strCliente := LRPad(dmBaseDados.tblANotaFiscalCodigoCliente.AsString,4,'0','L');
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
         ACBrMail1.FromName := 'CARTA DE CORREÇÃO NFE AUTO PECAS GOMES E ARAUJO Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
         strAssunto         := 'CARTA DE CORREÇÃO NFE AUTO PECAS GOMES E ARAUJO Nº ' + dmBaseDados.tblANotaFiscalNrNF.AsString;
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
