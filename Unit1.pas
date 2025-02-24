unit Unit1 ;

interface

uses
  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ActnList, Menus, ExtCtrls, Buttons,
  ComCtrls, Spin, ACBrSAT, ACBrSATClass, ACBrBase, OleCtrls, SHDocVw, TISButton,

  Windows, Messages, Variants, Mask, StrUtils, IniFiles,              
  IdBaseComponent,  IdCoder , IdCoder3to4, IdCoderMIME, TIGradient;


const
  cAssinatura = '9d4c4eef8c515e2c1269c2e4fff0719d526c5096422bf1defa20df50ba06469'+
                'a28adb25ba0447befbced7c0f805a5cc58496b7b23497af9a04f69c77f17c0c'+
                'e68161f8e4ca7e3a94c827b6c563ca6f47aea05fa90a8ce3e4327853bb2d664'+
                'ba226728fff1e2c6275ecc9b20129e1c1d2671a837aa1d265b36809501b519d'+
                'bc08129e1c1d2671a837aa1d265b36809501b519dbc08129e1c1d2671a837aa'+
                '1d265b36809501b519dbc08129e1c' ;


type RegStatusOperacional =  Record
  NSerie: array[0..9] of char;
  Tipo_Lan: array[0..8] of char;     // DHCP / PPPoE / IPFIX
  Lan_IP: array[0..15] of char;      // IP
  Lan_Mac: array[0..17] of char;     // MacAdress
  Lan_Mask: array[0..15] of char;    // Mascara subrede
  Lan_GW: array[0..15] of char;      // Gateway
  Lan_DNS_1: array[0..15] of char;   // DNS1
  Lan_DNS_2: array[0..15] of char;   // DNS2
  Status_Lan: array[0..16] of char;  // Conectado / Não Conectado
  Nivel_bat: array[0..8] of char;    // Nível Bateria: Baixo / Medio / Alto
  MT_Total: array[0..10] of char;     // Memória Total: 1 Gbytes
  MT_Usada: array[0..10] of char;     // Memória Total: 35 bytes
  DH_Atual: array[0..14] of char;     // Data e Hora atual
  Versao_SB: array[0..16] of char;    // Versão do Software Básico
  Versao_Layout: array[0..16] of char;   // Versão do Layout
  Ultimo_CFe_SAT: array[0..44] of char;  // Ultimo cfe-sat
  Inicial_CFe_SAT: array[0..44] of char; // No do 1o cfe-sat da memória de trabalho
  Final_CFe_SAT: array[0..44] of char;   // No do Ultimo cfe-sat da memória de trabalho
  DH_Cfe: array[0..14] of char;          // Data e Hora da transmissão do último cfe-sat
  DH_Ultima: array[0..14] of char;       // Data e Hora da última conexão com SEFAZ
  DT_Emi_Cert: array[0..8] of char;       // Data da emissão do certificado
  DT_Val_Cert: array[0..8] of char;       // Data da validade do certificado
  Estado_Operacional: array[0..1] of char; // Estado:   0=DESBLOQUEADO
                                           //           1= BLOQUEIO SEFAZ
                                           //           2= BLOQUEIO CONTRIBUINTE
                                           //           3= BLOQUEIO AUTÔNOMO
                                           //           4= BLOQUEIO PARA DESATIVAÇÃO
end; //RegStatusOperacional;


type
                                                      
  { TForm1 }

  TformSAT = class(TForm)
    miGerarXMLCancelamento: TMenuItem;
    miEnviarCancelamento: TMenuItem;
    MenuItem12: TMenuItem;
    miImprimirExtratoCancelamento: TMenuItem;
    mLimpar : TMenuItem ;
    mImprimirExtratoVendaResumido : TMenuItem ;
    mImprimirExtratoVenda : TMenuItem ;
    MainMenu1 : TMainMenu ;
    MenuItem1 : TMenuItem ;
    MenuItem2 : TMenuItem ;
    mAtivarSAT : TMenuItem ;
    mComunicarCertificado : TMenuItem ;
    mAssociarAssinatura : TMenuItem ;
    mBloquearSAT : TMenuItem ;
    MenuItem3 : TMenuItem ;
    mDesbloquearSAT : TMenuItem ;
    MenuItem4 : TMenuItem ;
    MenuItem5 : TMenuItem ;
    MenuItem6 : TMenuItem ;
    mConsultarStatusOperacional : TMenuItem ;
    mConsultarSAT : TMenuItem ;
    mConsultarNumeroSessao : TMenuItem ;
    MenuItem7 : TMenuItem;
    MenuItem8 : TMenuItem;
    mAtaulizarSoftwareSAT : TMenuItem ;
    mConfigurarInterfaceRede : TMenuItem ;
    mExtrairLogs : TMenuItem;
    mTesteFimAFim : TMenuItem;
    mEnviarVenda : TMenuItem;
    mGerarVenda : TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    LerXMLinterfaceRede1: TMenuItem;
    GerarXMLInterfaceRede1: TMenuItem;
    gerarSAT: TMenuItem;
    OpenDialog1: TOpenDialog;
    ACBrSAT1: TACBrSAT;
    PrintDialog1: TPrintDialog;
    SaveDialog1: TSaveDialog;
    PageControl3: TPageControl;
    tabSAT: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    gpOperacao: TGroupBox;
    bInicializar: TButton;
    cbxModelo: TComboBox;
    GroupBox2: TGroupBox;
    btLerParams: TButton;
    btSalvarParams: TButton;
    GroupBox1: TGroupBox;
    PageControl2: TPageControl;
    tsDadosSAT: TTabSheet;
    Label9: TLabel;
    SbArqLog: TSpeedButton;
    Label10: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    edLog: TEdit;
    edNomeDLL: TEdit;
    edtCodigoAtivacao: TEdit;
    edtCodUF: TEdit;
    seNumeroCaixa: TSpinEdit;
    cbxUTF8: TCheckBox;
    sePagCod: TSpinEdit;
    sfeVersaoEnt: TEdit;
    cbxFormatXML: TCheckBox;
    cbxAmbiente: TComboBox;
    cbxSalvarCFe: TCheckBox;
    tsDadosEmit: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edtEmitCNPJ: TEdit;
    edtEmitIE: TEdit;
    edtEmitIM: TEdit;
    cbxRegTribISSQN: TComboBox;
    cbxIndRatISSQN: TComboBox;
    cbxRegTributario: TComboBox;
    tsDadosSwHouse: TTabSheet;
    Label2: TLabel;
    Label5: TLabel;
    edtSwHCNPJ: TEdit;
    edtSwHAssinatura: TEdit;
    tsRede: TTabSheet;
    gbIPFix: TGroupBox;
    lSSID2: TLabel;
    lSSID3: TLabel;
    lSSID4: TLabel;
    lSSID5: TLabel;
    lSSID6: TLabel;
    edRedeIP: TEdit;
    edRedeMask: TEdit;
    edRedeGW: TEdit;
    edRedeDNS1: TEdit;
    edRedeDNS2: TEdit;
    gbPPPoE: TGroupBox;
    lSSID7: TLabel;
    lSSID8: TLabel;
    edRedeUsuario: TEdit;
    edRedeSenha: TEdit;
    rgRedeTipoInter: TRadioGroup;
    gbWiFi: TGroupBox;
    lSSID: TLabel;
    Label24: TLabel;
    lSSID1: TLabel;
    edRedeSSID: TEdit;
    cbxRedeSeg: TComboBox;
    edRedeCodigo: TEdit;
    rgRedeTipoLan: TRadioGroup;
    gbProxy: TGroupBox;
    lSSID9: TLabel;
    lSSID10: TLabel;
    lSSID11: TLabel;
    lSSID12: TLabel;
    cbxRedeProxy: TComboBox;
    edRedeProxyIP: TEdit;
    edRedeProxyUser: TEdit;
    edRedeProxySenha: TEdit;
    edRedeProxyPorta: TSpinEdit;
    Impressao: TTabSheet;
    GroupBox3: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    lImpressora: TLabel;
    seLargura: TSpinEdit;
    seMargemTopo: TSpinEdit;
    seMargemFundo: TSpinEdit;
    seMargemEsquerda: TSpinEdit;
    seMargemDireita: TSpinEdit;
    bImpressora: TButton;
    cbUsarFortes: TRadioButton;
    cbPreview: TCheckBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    edtPorta: TEdit;
    btSerial: TBitBtn;
    cbUsarEscPos: TRadioButton;
    StatusBar1: TStatusBar;
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
    Conteudo: TRichEdit;
    XML: TMemo;
    CupomBase64: TMemo;
    btnImpSAT: TTISButton;
    {$IFDEF DELPHI9_UP}
     procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
     procedure ACBrSAT1GetsignAC(var Chave: AnsiString);
    {$ELSE}
     procedure ACBrSAT1GetcodigoDeAtivacao(var Chave: String);
     procedure ACBrSAT1GetsignAC(var Chave: String);
	{$ENDIF}
    procedure ACBrSAT1Log(const AString: String);
    procedure bImpressoraClick(Sender: TObject);
    procedure bInicializarClick(Sender : TObject) ;
    procedure btLerParamsClick(Sender : TObject) ;
    procedure btSalvarParamsClick(Sender : TObject) ;
    procedure btSerialClick(Sender: TObject);
    procedure cbUsarEscPosClick(Sender: TObject);
    procedure cbUsarFortesClick(Sender: TObject);
    procedure cbxModeloChange(Sender : TObject) ;
    procedure cbxSalvarCFeChange(Sender: TObject);
    procedure cbxUTF8Change(Sender: TObject);
    procedure miGerarXMLCancelamentoClick(Sender: TObject);
    procedure miEnviarCancelamentoClick(Sender: TObject);
    procedure miImprimirExtratoCancelamentoClick(Sender: TObject);
    procedure mTesteFimAFimClick(Sender: TObject);
    procedure sfeVersaoEntChange(Sender: TObject);
    procedure FormCreate(Sender : TObject) ;
    procedure mAssociarAssinaturaClick(Sender : TObject) ;
    procedure mAtaulizarSoftwareSATClick(Sender : TObject) ;
    procedure mAtivarSATClick(Sender : TObject) ;
    procedure mBloquearSATClick(Sender : TObject) ;
    procedure mComunicarCertificadoClick(Sender : TObject) ;
    procedure mConfigurarInterfaceRedeClick(Sender : TObject) ;
    procedure mConsultarNumeroSessaoClick(Sender : TObject) ;
    procedure mConsultarSATClick(Sender : TObject) ;
    procedure mConsultarStatusOperacionalClick(Sender : TObject) ;
    procedure mDesbloquearSATClick(Sender : TObject) ;
    procedure MenuItem5Click(Sender : TObject) ;
    procedure mEnviarVendaClick(Sender : TObject) ;
    procedure mExtrairLogsClick(Sender : TObject) ;
    procedure mGerarVendaClick(Sender : TObject) ;
    procedure mImprimirExtratoVendaClick(Sender : TObject) ;
    procedure mImprimirExtratoVendaResumidoClick(Sender : TObject) ;
    procedure mLimparClick(Sender : TObject) ;
    procedure SbArqLogClick(Sender : TObject) ;
    procedure sePagCodChange(Sender: TObject);
    procedure rgRedeTipoInterClick(Sender: TObject);
    procedure rgRedeTipoLanClick(Sender: TObject);
    procedure cbxRedeProxyChange(Sender: TObject);
    procedure LerXMLinterfaceRede1Click(Sender: TObject);
    procedure GerarXMLInterfaceRede1Click(Sender: TObject);
    procedure ACBrSAT1GravarLog(const ALogLine: String;
      var Tratado: Boolean);
    procedure btnImpSATClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edtFocusChange(Sender: TObject);
  private
    { private declarations }

    procedure ConfiguraRedeSAT;
    procedure LeDadosRedeSAT;
    procedure PrepararImpressao;
    procedure TrataErros(Sender : TObject ; E : Exception) ;
    procedure AjustaACBrSAT ;
    procedure LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
    //Sweda
    procedure GravaUltimaSessao(CodSessao:string);

    Function NovaSessao:String;
    function DecodificaBase64(BString:Pchar):Pchar;

  public
    { public declarations }
    procedure TrataRetorno(Comando:Integer; RespostaSAT:String);
  end ;

var formSAT : TformSAT ;
    // SwedaSAT
    Sessao : String;
    SessaoNUm : Integer;
    CodAtivacao : AnsiString;
    XMLVenda : AnsiString;
    XMLCancelamento : AnsiString;
    fEmitente : TIniFile;
    cod64, dec64 : String;
    Chave : Ansistring; // chave de consulta do CFeSAT e utilizada para cancelamento

    mensagem_operacional : Array[0..26] of String = ('Numero da Sessão','Cod. Retorno', 'Mensagem Retorno','Cod. SEFAZ','Mensagem SEFAZ','Num Série','Tipo LAN','IP','MacAddress','Máscara de Rede',
    'Gateway', 'DNS1', 'DNS2','Status Lan','Nível Bateria','Memória Total','Memória Usada','Data e Hora Atual','Versão SB','Versão Layout','Último CFe-SAT','Cfe-SAT Inicial','Cfe-SAT Final',
    'Data e Hora da última Transmissão','Data Emissão Certificado','Data Validade Certificado','Estado Operacional');

    mensagem_venda : Array[0..26] of String = ('Numero da Sessão','Cod. Retorno', 'Cod. Erro','Mensagem','Codigo SEFAZ','Mensagem SEFAZ','Arquivo Base 64','Time-stamp','Chave de Consulta','Valor Total CFe','CNPJ Value',
    'Assinatura QRCode', '', ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', ' ',' ',' ');

    Retorno:Pchar;


implementation

Uses typinfo, ACBrUtil, pcnConversao, pcnRede, synacode, ConfiguraSerial,
     RLPrinters, Printers, ModuloDados, CheckCGC, TesteSat, FormaPagamento, Venda;

// Funções dll SAT padrão.
Function EnviarDadosVenda(NumeroSessao:integer; CodAtivacao:AnsiString; Venda_XML:AnsiString):Pchar; cdecl;  external 'sat.dll';   //stdcall
Function TesteFimAFim(NumeroSessao:Integer; CodAtivacao:AnsiString; Venda_XML:AnsiString):Pchar; cdecl; external 'sat.dll';
Function ConsultarNumeroSessao(NumeroSessao:Integer; CodAtivacao:AnsiString;cNumeroSessao:integer):Pchar; cdecl;  external 'sat.dll';
Function ConsultarStatusOperacional(NumeroSessao:Integer; CodAtivacao:AnsiString):Pchar; cdecl;  external 'sat.dll';
Function ConsultarSAT(NumeroSessao:integer):Pchar; cdecl; external 'sat.dll';
Function ExtrairLogs(NumeroSessao:Integer; CodAtivacao:AnsiString):Pchar; cdecl; external 'sat.dll';
Function CancelarUltimaVenda(NumeroSessao:integer; CodAtivacao:AnsiString; Chave:AnsiString; DadosCancelamento:AnsiString):Pchar; stdcall;  external 'sat.dll';
Function SI300_iImprimirXMLString(stringXml:AnsiString; ptAutorizacao:AnsiString; dhRecto:AnsiString; tpCupom:Integer; CIDTOKEN:AnsiString; CSC:AnsiString; viaEstabelecimento:Integer; Endereco:Boolean):Pchar; cdecl;  external 'SI300.dll';
Function SI300_iImprimirXML(pszPath:AnsiString; ptAutorizacao:AnsiString; dhRecto:AnsiString; tpCupom:Integer; CIDTOKEN:AnsiString; CSC:AnsiString; viaEstabelecimento:Integer; Endereco:Boolean):Pchar; cdecl;  external 'SI300.dll';


{$R *.dfm}


{ TForm1 }

procedure TformSAT.FormCreate(Sender : TObject) ;
var
  I : TACBrSATModelo ;
  J : TpcnTipoAmbiente ;
  K : TpcnRegTribISSQN ;
  L : TpcnindRatISSQN ;
  M : TpcnRegTrib ;
begin
  cbxModelo.Items.Clear ;
  For I := Low(TACBrSATModelo) to High(TACBrSATModelo) do
     cbxModelo.Items.Add( GetEnumName(TypeInfo(TACBrSATModelo), integer(I) ) ) ;

  cbxAmbiente.Items.Clear ;
  For J := Low(TpcnTipoAmbiente) to High(TpcnTipoAmbiente) do
     cbxAmbiente.Items.Add( GetEnumName(TypeInfo(TpcnTipoAmbiente), integer(J) ) ) ;

  cbxRegTribISSQN.Items.Clear ;
  For K := Low(TpcnRegTribISSQN) to High(TpcnRegTribISSQN) do
     cbxRegTribISSQN.Items.Add( GetEnumName(TypeInfo(TpcnRegTribISSQN), integer(K) ) ) ;

  cbxIndRatISSQN.Items.Clear ;
  For L := Low(TpcnindRatISSQN) to High(TpcnindRatISSQN) do
     cbxIndRatISSQN.Items.Add( GetEnumName(TypeInfo(TpcnindRatISSQN), integer(L) ) ) ;

  cbxRegTributario.Items.Clear ;
  For M := Low(TpcnRegTrib) to High(TpcnRegTrib) do
     cbxRegTributario.Items.Add( GetEnumName(TypeInfo(TpcnRegTrib), integer(M) ) ) ;

  //Application.OnException := TrataErros ;

  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;

  btLerParams.Click;
end;

procedure TformSAT.mAssociarAssinaturaClick(Sender : TObject) ;
begin
  ACBrSAT1.AssociarAssinatura( edtSwHCNPJ.Text + edtEmitCNPJ.Text, edtSwHAssinatura.Text );
end;

procedure TformSAT.mAtaulizarSoftwareSATClick(Sender : TObject) ;
begin
  ACBrSAT1.AtualizarSoftwareSAT;
end;

procedure TformSAT.TrataErros(Sender: TObject; E: Exception);
var
  Erro : String ;
begin
  Erro := Trim(E.Message) ;
  ACBrSAT1.DoLog( E.ClassName+' - '+Erro);
end ;

procedure TformSAT.AjustaACBrSAT ;
begin
  with ACBrSAT1 do
  begin
    Modelo  := TACBrSATModelo( cbxModelo.ItemIndex ) ;
    ArqLOG  := edLog.Text;
    NomeDLL := edNomeDLL.Text;
    Config.ide_numeroCaixa := seNumeroCaixa.Value;
    Config.ide_tpAmb       := TpcnTipoAmbiente( cbxAmbiente.ItemIndex );
    Config.ide_CNPJ        := edtSwHCNPJ.Text;
    Config.emit_CNPJ       := edtEmitCNPJ.Text;
    Config.emit_IE         := edtEmitIE.Text;
    Config.emit_IM         := edtEmitIM.Text;
    Config.emit_cRegTrib      := TpcnRegTrib( cbxRegTributario.ItemIndex ) ;
    Config.emit_cRegTribISSQN := TpcnRegTribISSQN( cbxRegTribISSQN.ItemIndex ) ;
    Config.emit_indRatISSQN   := TpcnindRatISSQN( cbxIndRatISSQN.ItemIndex ) ;
    Config.PaginaDeCodigo     := sePagCod.Value;
    Config.EhUTF8             := cbxUTF8.Checked;
    Config.infCFe_versaoDadosEnt := StringToFloat( sfeVersaoEnt.Text );
//    SalvarCFes := cbxSalvarCFe.Checked;
  end
end ;

{$IFDEF DELPHI9_UP}
 procedure TformSAT.ACBrSAT1GetcodigoDeAtivacao(var Chave: AnsiString);
 begin
   Chave := edtCodigoAtivacao.Text;
 end;

 procedure TformSAT.ACBrSAT1GetsignAC(var Chave: AnsiString);
 begin
   Chave := edtSwHAssinatura.Text;
 end;
{$ELSE}
 procedure TformSAT.ACBrSAT1GetcodigoDeAtivacao(var Chave: String);
 begin
   Chave := edtCodigoAtivacao.Text;
 end;

 procedure TformSAT.ACBrSAT1GetsignAC(var Chave: String);
 begin
   Chave := edtSwHAssinatura.Text;
 end;
{$ENDIF}

procedure TformSAT.ACBrSAT1Log(const AString: String);
begin
  mLog.Lines.Add(AString);
  StatusBar1.Panels[0].Text := IntToStr( ACBrSAT1.Resposta.numeroSessao );
  StatusBar1.Panels[1].Text := IntToStr( ACBrSAT1.Resposta.codigoDeRetorno );
end;

procedure TformSAT.bImpressoraClick(Sender: TObject);
begin
  if PrintDialog1.Execute then
    lImpressora.Caption := Printer.Printers[Printer.PrinterIndex] ;  
end;

procedure TformSAT.bInicializarClick(Sender : TObject) ;
begin
  AjustaACBrSAT;

  ACBrSAT1.Inicializado := not ACBrSAT1.Inicializado ;

  if ACBrSAT1.Inicializado then
    bInicializar.Caption := 'DesInicializar'
  else
    bInicializar.Caption := 'Inicializar' ;
end;

procedure TformSAT.btLerParamsClick(Sender : TObject) ;
Var
  ArqINI : String ;
  INI : TIniFile ;
begin
  ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;

  INI := TIniFile.Create(ArqINI);
  try
    cbxModelo.ItemIndex    := INI.ReadInteger('SAT','Modelo',0);
    edLog.Text             := INI.ReadString('SAT','ArqLog','ACBrSAT.log');
    edNomeDLL.Text         := INI.ReadString('SAT','NomeDLL','C:\SAT\SAT.DLL');
    edtCodigoAtivacao.Text := INI.ReadString('SAT','CodigoAtivacao','123456');
    edtCodUF.Text          := INI.ReadString('SAT','CodigoUF','35');
    seNumeroCaixa.Value    := INI.ReadInteger('SAT','NumeroCaixa',1);
    cbxAmbiente.ItemIndex  := INI.ReadInteger('SAT','Ambiente',1);
    sePagCod.Value         := INI.ReadInteger('SAT','PaginaDeCodigo',0);
    sfeVersaoEnt.Text      := FloatToString( INI.ReadFloat('SAT','versaoDadosEnt', cversaoDadosEnt) );
    cbxFormatXML.Checked   := INI.ReadBool('SAT','FormatarXML', True);
    cbxSalvarCFe.Checked   := INI.ReadBool('SAT','SalvarCFe', True);
    sePagCodChange(Sender);

//    edtPorta.Text := INI.ReadString('Extrato','Porta','COM1');
//    ACBrSATExtratoESCPOS1.Device.ParamsString := INI.ReadString('Extrato','ParamsString','');

    edtEmitCNPJ.Text := INI.ReadString('Emit','CNPJ','');
    edtEmitIE.Text   := INI.ReadString('Emit','IE','');
    edtEmitIM.Text   := INI.ReadString('Emit','IM','');
    cbxRegTributario.ItemIndex := INI.ReadInteger('Emit','RegTributario',0);
    cbxRegTribISSQN.ItemIndex  := INI.ReadInteger('Emit','RegTribISSQN',0);
    cbxIndRatISSQN.ItemIndex   := INI.ReadInteger('Emit','IndRatISSQN',0);

    edtSwHCNPJ.Text       := INI.ReadString('SwH','CNPJ','11111111111111');
    edtSwHAssinatura.Text := INI.ReadString('SwH','Assinatura',cAssinatura);

{    cbUsarFortes.Checked   := INI.ReadBool('Fortes','UsarFortes', True) ;
    cbUsarEscPos.Checked   := not cbUsarFortes.Checked;
    seLargura.Value        := INI.ReadInteger('Fortes','Largura',ACBrSATExtratoFortes1.LarguraBobina);
    seMargemTopo.Value     := INI.ReadInteger('Fortes','MargemTopo',ACBrSATExtratoFortes1.Margens.Topo);
    seMargemFundo.Value    := INI.ReadInteger('Fortes','MargemFundo',ACBrSATExtratoFortes1.Margens.Fundo);
    seMargemEsquerda.Value := INI.ReadInteger('Fortes','MargemEsquerda',ACBrSATExtratoFortes1.Margens.Esquerda);
    seMargemDireita.Value  := INI.ReadInteger('Fortes','MargemDireita',ACBrSATExtratoFortes1.Margens.Direita);
    cbPreview.Checked      := INI.ReadBool('Fortes','Preview',True);}

    lImpressora.Caption := INI.ReadString('Printer','Name','');

    rgRedeTipoInter.ItemIndex := INI.ReadInteger('Rede','tipoInter',0);
    rgRedeTipoLan.ItemIndex   := INI.ReadInteger('Rede','tipoLan',0);
    edRedeSSID.Text           := INI.ReadString('Rede','SSID','');
    cbxRedeSeg.ItemIndex      := INI.ReadInteger('Rede','seg',0);
    edRedeCodigo.Text         := INI.ReadString('Rede','codigo','');
    edRedeIP.Text             := INI.ReadString('Rede','lanIP','');
    edRedeMask.Text           := INI.ReadString('Rede','lanMask','');
    edRedeGW.Text             := INI.ReadString('Rede','lanGW','');
    edRedeDNS1.Text           := INI.ReadString('Rede','lanDNS1','');
    edRedeDNS2.Text           := INI.ReadString('Rede','lanDNS2','');
    edRedeUsuario.Text        := INI.ReadString('Rede','usuario','');
    edRedeSenha.Text          := INI.ReadString('Rede','senha','');
    cbxRedeProxy.ItemIndex    := INI.ReadInteger('Rede','proxy',0);
    edRedeProxyIP.Text        := INI.ReadString('Rede','proxy_ip','');
    edRedeProxyPorta.Value    := INI.ReadInteger('Rede','proxy_porta',0);
    edRedeProxyUser.Text      := INI.ReadString('Rede','proxy_user','');
    edRedeProxySenha.Text     := INI.ReadString('Rede','proxy_senha','');

  finally
     INI.Free ;
  end ;
end;

procedure TformSAT.btSalvarParamsClick(Sender : TObject) ;
Var
  ArqINI : String ;
  INI : TIniFile ;
begin
  ArqINI := ChangeFileExt( Application.ExeName,'.ini' ) ;

  INI := TIniFile.Create(ArqINI);
  try
    INI.WriteInteger('SAT','Modelo',cbxModelo.ItemIndex);
    INI.WriteString('SAT','ArqLog',edLog.Text);
    INI.WriteString('SAT','NomeDLL',edNomeDLL.Text);
    INI.WriteString('SAT','CodigoAtivacao',edtCodigoAtivacao.Text);
    INI.WriteString('SAT','CodigoUF',edtCodUF.Text);
    INI.WriteInteger('SAT','NumeroCaixa',seNumeroCaixa.Value);
    INI.WriteInteger('SAT','Ambiente',cbxAmbiente.ItemIndex);
    INI.WriteInteger('SAT','PaginaDeCodigo',sePagCod.Value);
    INI.WriteFloat('SAT','versaoDadosEnt', StringToFloatDef(sfeVersaoEnt.Text,cversaoDadosEnt));
    INI.WriteBool('SAT','FormatarXML', cbxFormatXML.Checked);
    INI.ReadBool('SAT','SalvarCFe', cbxSalvarCFe.Checked);

//    INI.WriteString('Extrato','Porta',edtPorta.Text);
//    INI.WriteString('Extrato','ParamsString',ACBrSATExtratoESCPOS1.Device.ParamsString);

    INI.WriteString('Emit','CNPJ',edtEmitCNPJ.Text);
    INI.WriteString('Emit','IE',edtEmitIE.Text);
    INI.WriteString('Emit','IM',edtEmitIM.Text);
    INI.WriteInteger('Emit','RegTributario',cbxRegTributario.ItemIndex);
    INI.WriteInteger('Emit','RegTribISSQN',cbxRegTribISSQN.ItemIndex);
    INI.WriteInteger('Emit','IndRatISSQN',cbxIndRatISSQN.ItemIndex);

    INI.WriteString('SwH','CNPJ',edtSwHCNPJ.Text);
    INI.WriteString('SwH','Assinatura',edtSwHAssinatura.Text);

    INI.WriteBool('Fortes','UsarFortes',cbUsarFortes.Checked) ;
    INI.WriteInteger('Fortes','Largura',seLargura.Value);
    INI.WriteInteger('Fortes','MargemTopo',seMargemTopo.Value);
    INI.WriteInteger('Fortes','MargemFundo',seMargemFundo.Value);
    INI.WriteInteger('Fortes','MargemEsquerda',seMargemEsquerda.Value);
    INI.WriteInteger('Fortes','MargemDireita',seMargemDireita.Value);
    INI.WriteBool('Fortes','Preview',cbPreview.Checked);

    INI.WriteString('Printer','Name',lImpressora.Caption);

    INI.WriteInteger('Rede','tipoInter',rgRedeTipoInter.ItemIndex);
    INI.WriteInteger('Rede','tipoLan',rgRedeTipoLan.ItemIndex);
    INI.WriteString('Rede','SSID',edRedeSSID.Text);
    INI.WriteInteger('Rede','seg',cbxRedeSeg.ItemIndex);
    INI.WriteString('Rede','codigo',edRedeCodigo.Text);
    INI.WriteString('Rede','lanIP',edRedeIP.Text);
    INI.WriteString('Rede','lanMask',edRedeMask.Text);
    INI.WriteString('Rede','lanGW',edRedeGW.Text);
    INI.WriteString('Rede','lanDNS1',edRedeDNS1.Text);
    INI.WriteString('Rede','lanDNS2',edRedeDNS2.Text);
    INI.WriteString('Rede','usuario',edRedeUsuario.Text);
    INI.WriteString('Rede','senha',edRedeSenha.Text);
    INI.WriteInteger('Rede','proxy',cbxRedeProxy.ItemIndex);
    INI.WriteString('Rede','proxy_ip',edRedeProxyIP.Text);
    INI.WriteInteger('Rede','proxy_porta',edRedeProxyPorta.Value);
    INI.WriteString('Rede','proxy_user',edRedeProxyUser.Text);
    INI.WriteString('Rede','proxy_senha',edRedeProxySenha.Text);
    
  finally
     INI.Free ;
  end ;
end;

procedure TformSAT.btSerialClick(Sender: TObject);
begin
{  frConfiguraSerial := TfrConfiguraSerial.Create(self);

  try
//    frConfiguraSerial.Device.Porta        := ACBrSATExtratoESCPOS1.Device.Porta ;
    frConfiguraSerial.cmbPortaSerial.Text := edtPorta.Text ;
//    frConfiguraSerial.Device.ParamsString := ACBrSATExtratoESCPOS1.Device.ParamsString ;

    if frConfiguraSerial.ShowModal = mrOk then
    begin
       edtPorta.Text := frConfiguraSerial.Device.Porta ;
//       ACBrSATExtratoESCPOS1.Device.ParamsString := frConfiguraSerial.Device.ParamsString ;
    end ;
  finally
     FreeAndNil( frConfiguraSerial ) ;
  end ; }
end;

procedure TformSAT.cbUsarEscPosClick(Sender: TObject);
begin
{  cbUsarFortes.Checked := False;
  ACBrSAT1.Extrato := ACBrSATExtratoESCPOS1;}
end;

procedure TformSAT.cbUsarFortesClick(Sender: TObject);
begin
{  cbUsarEscPos.Checked := False;
  ACBrSAT1.Extrato := ACBrSATExtratoFortes1}
end;

procedure TformSAT.cbxModeloChange(Sender : TObject) ;
begin
  try
    ACBrSAT1.Modelo := TACBrSATModelo( cbxModelo.ItemIndex ) ;
  except
    cbxModelo.ItemIndex := Integer( ACBrSAT1.Modelo ) ;
    raise ;
  end ;
end;

procedure TformSAT.cbxSalvarCFeChange(Sender: TObject);
begin
//  ACBrSAT1.SalvarCFes := cbxSalvarCFe.Checked;
end;

procedure TformSAT.cbxUTF8Change(Sender: TObject);
begin
  ACBrSAT1.Config.EhUTF8 := cbxUTF8.Checked;
  sePagCod.Value := ACBrSAT1.Config.PaginaDeCodigo;
end;

//------------------------
//SWEDA procedures
procedure TformSAT.TrataRetorno(Comando:Integer;RespostaSAT:String);
var inicio, pipe, percorre:integer;
    varre:integer;
    tamanho:integer;
    mensagem: Array[0..26] of string;
    CodigoRetorno:String;
    miniConteudo, TextoDecodificado, Texto:String;

begin
      if (Comando = 1) then for varre:=0 to  26 do mensagem[varre] := mensagem_Operacional[varre]
      else if (Comando = 2) then for varre:=0 to  26 do mensagem [varre]:= mensagem_Venda[varre];

      texto:=RespostaSAT;
      Conteudo.Clear;

      inicio:=1;
      miniConteudo:='';

//      for percorre:=0 to 4 do
      percorre:=0;
      pipe:= Pos('|',Texto);
      while pipe>0 do
      begin
          pipe:= Pos('|',Texto);
          miniConteudo:=Pchar(copy(Texto,inicio,pipe-inicio));
          try
              Conteudo.Lines.Add(mensagem[percorre] +': '+ miniConteudo);
          except
              Conteudo.Lines.Add(miniConteudo);
          end;
          Conteudo.Refresh;
          Application.ProcessMessages;
          try
              texto := Pchar(StringReplace(Texto,copy(texto,pipe-3,4),copy(texto,pipe-3,3),[rfIgnoreCase])); // pega a sequencia de 3 bytes para não substituir texto errado
          except
          end;
          if percorre = 1 then // Codigo de retorno
              CodigoRetorno:= miniconteudo;

          // Base 64
          if percorre = 6 then
          begin
                  if Copy(CodigoRetorno,1,2) = '06' then
                  begin

                      CupomBase64.Text:=Miniconteudo;

                      CupomBase64.Lines.SaveToFile( ExtractFilePath( Application.ExeName ) +'Base64.txt');
//                      TextoDecodificado := DecodificaBase64(MiniConteudo);
                  end
                  else if Copy(CodigoRetorno,1,2) = '10' then
                  begin
                      CupomBase64.Text:=Miniconteudo;
                  end;
          end
          else if percorre = 8 then
                chave:=MiniConteudo;

          inicio := pipe;
          inc(percorre);
      end;
//      NomeArquivo:='AB'+Copy(Chave,3,44)+'.xml';
end;

procedure TformSAT.GravaUltimaSessao(CodSessao:string);
begin
      if not FileExists(ExtractFilePath(Application.ExeName)+'sat.ini') then
          fEmitente := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sat.ini') ;

      fEmitente.WriteString('UltimaSessao','NumeroSessao',CodSessao);
end;

Function TformSAT.NovaSessao:String;
var s:String;
    ultimasessao:string;
begin
      Randomize;

      if not FileExists(ExtractFilePath(Application.ExeName)+'sat.ini') then
          fEmitente := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sat.ini') ;

      ultimaSessao:=fEmitente.ReadString('UltimaSessao','NumeroSessao','000000');

      s := Format('%6.6d',[Random(999999)]);

      if s = ultimasessao then
      begin
            s := Format('%6.6d',[strtoint(s)+1]);
      end;

      Result:=s;

end;

function TformSAT.DecodificaBase64(BString:Pchar):PChar;
begin
end;



//------------------------

procedure TformSAT.miGerarXMLCancelamentoClick(Sender: TObject);
begin
  OpenDialog1.Filter := 'Arquivo XML|*.xml';
  if OpenDialog1.Execute then
  begin
    ACBrSAT1.CFe.LoadFromFile( OpenDialog1.FileName );
    ACBrSAT1.CFe2CFeCanc;

    mCancelamentoEnviar.Lines.Text := ACBrSAT1.CFeCanc.GerarXML( True ) ;  // True = Gera apenas as TAGs da aplicação
    edChaveCancelamento.Text := ACBrSAT1.CFeCanc.infCFe.chCanc;
    PageControl1.ActivePage := tsCancelamento;
  end ;
end;

procedure TformSAT.miEnviarCancelamentoClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsLog;
  if mCancelamentoEnviar.Lines.Count < 1 then
  begin
    ACBrSAT1.CancelarUltimaVenda;
    mCancelamentoEnviar.Lines.Text := ACBrSAT1.CFeCanc.GerarXML(True);
  end
  else
  begin
    if edChaveCancelamento.Text = '' then
    begin
      ACBrSAT1.CFeCanc.AsXMLString := mCancelamentoEnviar.Lines.Text;
      edChaveCancelamento.Text := ACBrSAT1.CFeCanc.infCFe.chCanc;
    end;

    ACBrSAT1.CancelarUltimaVenda( edChaveCancelamento.Text, mCancelamentoEnviar.Lines.Text );
  end ;

  if ACBrSAT1.Resposta.codigoDeRetorno = 7000 then
  begin
    LoadXML( ACBrSAT1.CFeCanc.AsXMLString, mRecebido );
    PageControl1.ActivePage := tsRecebido;
  end;
end;

procedure TformSAT.miImprimirExtratoCancelamentoClick(Sender: TObject);
begin
{  PrepararImpressao;
  ACBrSAT1.ImprimirExtratoCancelamento;   }
end;

procedure TformSAT.mTesteFimAFimClick(Sender: TObject);
begin
  if mVendaEnviar.Text = '' then
    mGerarVenda.Click;

  PageControl1.ActivePage := tsLog;

  ACBrSAT1.TesteFimAFim( mVendaEnviar.Text );

  if ACBrSAT1.Resposta.codigoDeRetorno = 9000 then
  begin
    LoadXML( ACBrSAT1.CFe.AsXMLString,  mRecebido);
    PageControl1.ActivePage := tsRecebido;
  end;
end;

procedure TformSAT.sfeVersaoEntChange(Sender: TObject);
begin
  ACBrSAT1.Config.infCFe_versaoDadosEnt := StringToFloatDef(sfeVersaoEnt.Text,cversaoDadosEnt);
end;

procedure TformSAT.mAtivarSATClick(Sender : TObject) ;
begin
  ACBrSAT1.AtivarSAT( 1, edtEmitCNPJ.Text, StrToInt(edtCodUF.Text) );
end;

procedure TformSAT.mBloquearSATClick(Sender : TObject) ;
begin
  ACBrSAT1.BloquearSAT;
end;

procedure TformSAT.mComunicarCertificadoClick(Sender : TObject) ;
Var
  SL : TStringList;
begin
  OpenDialog1.Filter := 'Certificado|*.cer|Arquivo Texto|*.txt';
  if OpenDialog1.Execute then
  begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile( OpenDialog1.FileName );

      ACBrSAT1.ComunicarCertificadoICPBRASIL( SL.Text );
    finally
      SL.Free;
    end ;
  end ;
end;

procedure TformSAT.mConfigurarInterfaceRedeClick(Sender : TObject) ;
begin
  ConfiguraRedeSAT;
  LoadXML( ACBrSAT1.Rede.AsXMLString,  mRede );

  ACBrSAT1.ConfigurarInterfaceDeRede( );
end;

procedure TformSAT.mConsultarNumeroSessaoClick(Sender : TObject) ;
Var
  strSessao: String ;
  nSessao : Integer ;
begin
  strSessao := '';
  if not InputQuery('Consultar Número de Sessão',
                    'Entre com o Número de Sessão a ser consultada:', strSessao ) then
    Exit;

  nSessao := StrToIntDef(strSessao, 0);
  if nSessao <= 0 then
    raise Exception.Create('Numero de sessão informado é inválido') ;

  ACBrSAT1.ConsultarNumeroSessao( nSessao );
end;

procedure TformSAT.mConsultarSATClick(Sender : TObject) ;
begin
  ACBrSAT1.ConsultarSAT;
end;

procedure TformSAT.mConsultarStatusOperacionalClick(Sender : TObject) ;
begin
  ACBrSAT1.ConsultarStatusOperacional;

  with ACBrSAT1.Status do
  begin
    mLog.Lines.Add('NSERIE.........: '+NSERIE);
    mLog.Lines.Add('LAN_MAC........: '+LAN_MAC);
    mLog.Lines.Add('STATUS_LAN.....: '+StatusLanToStr(STATUS_LAN));
    mLog.Lines.Add('NIVEL_BATERIA..: '+NivelBateriaToStr(NIVEL_BATERIA));
    mLog.Lines.Add('MT_TOTAL.......: '+MT_TOTAL);
    mLog.Lines.Add('MT_USADA.......: '+MT_USADA);
    mLog.Lines.Add('DH_ATUAL.......: '+DateTimeToStr(DH_ATUAL));
    mLog.Lines.Add('VER_SB.........: '+VER_SB);
    mLog.Lines.Add('VER_LAYOUT.....: '+VER_LAYOUT);
    mLog.Lines.Add('ULTIMO_CFe.....: '+ULTIMO_CFe);
    mLog.Lines.Add('LISTA_INICIAL..: '+LISTA_INICIAL);
    mLog.Lines.Add('LISTA_FINAL....: '+LISTA_FINAL);
    mLog.Lines.Add('DH_CFe.........: '+DateTimeToStr(DH_CFe));
    mLog.Lines.Add('DH_ULTIMA......: '+DateTimeToStr(DH_CFe));
    mLog.Lines.Add('CERT_EMISSAO...: '+DateToStr(CERT_EMISSAO));
    mLog.Lines.Add('CERT_VENCIMENTO: '+DateToStr(CERT_VENCIMENTO));
    mLog.Lines.Add('ESTADO_OPERACAO: '+EstadoOperacaoToStr(ESTADO_OPERACAO));
  end;

  LeDadosRedeSAT;
end;

procedure TformSAT.mDesbloquearSATClick(Sender : TObject) ;
begin
  ACBrSAT1.DesbloquearSAT;
end;

procedure TformSAT.MenuItem5Click(Sender : TObject) ;
Var
  CodNovo, CodAtual, tipoCodigo: String;
begin
  CodNovo    := '';
  CodAtual   := edtCodigoAtivacao.Text;
  tipoCodigo := '1';

  if not InputQuery('Trocar Código de Ativação',
                    'Entre com o Código de Ativação ou de Emergência:', CodAtual ) then
    Exit;

  if not InputQuery('Trocar Código de Ativação',
                    'Qual o Tipo do Código Informado anteriormente ?'+sLineBreak+
                    '1 – Código de Ativação'+sLineBreak+
                    '2 – Código de Ativação de Emergência'+sLineBreak,
                    tipoCodigo ) then
    Exit;

  if not InputQuery('Trocar Código de Ativação',
                    'Entre com o Número do Novo Código de Ativação:', CodNovo ) then
    Exit;

  ACBrSAT1.TrocarCodigoDeAtivacao( CodAtual, StrToInt(tipoCodigo), CodNovo );

  if ACBrSAT1.Resposta.codigoDeRetorno = 1800 then
  begin
    edtCodigoAtivacao.Text := CodNovo;
    mLog.Lines.Add('Código de Ativação trocado com sucesso');
    btSalvarParams.Click;
  end ;
end;

procedure TformSAT.mEnviarVendaClick(Sender : TObject) ;
begin
 { if mVendaEnviar.Text = '' then
    mGerarVenda.Click;  }

  PageControl1.ActivePage := tsLog;

  ACBrSAT1.EnviarDadosVenda( mVendaEnviar.Text );

  if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
  begin
    LoadXML( ACBrSAT1.CFe.AsXMLString,  mRecebido);
    PageControl1.ActivePage := tsRecebido;
  end;
end;

procedure TformSAT.mExtrairLogsClick(Sender : TObject) ;
Var
  NomeArquivo: String ;
begin
  NomeArquivo := ExtractFilePath(Application.ExeName)+'SAT.LOG';
  if not InputQuery('ExtrairLogs',
                    'Informe o nome para criação do Arquivo de Log:', NomeArquivo ) then
    Exit;

  ACBrSAT1.ExtrairLogs( NomeArquivo );
end;

procedure TformSAT.mGerarVendaClick(Sender : TObject) ;
var TotalItem, strVTotal : Double;
    A, strNroItem : Integer;
begin

PageControl1.ActivePage := tsGerado;
ACBrSAT1.CFe.IdentarXML := cbxFormatXML.Checked;
ACBrSAT1.CFe.TamanhoIdentacao := 3;

mVendaEnviar.Clear;

// Trasnferindo Informações de Config para o CFe //
AjustaACBrSAT;
ACBrSAT1.InicializaCFe ;

with ACBrSAT1.CFe do
  BEGIN
   ide.numeroCaixa := 1;

   Dest.CNPJCPF    := strCPF;
   Dest.xNome      := ''; // Nome Do cliente

   Entrega.xLgr    := ''; // Dados de Entrega:
   Entrega.nro     := '';
   Entrega.xCpl    := '';
   Entrega.xBairro := '';
   Entrega.xMun    := '';
   Entrega.UF      := '';

   // Adicionando os itens da Venda:
   strNroItem := 0;
   strVTotal   := 0;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
     Begin 
      strNroItem := strNroItem + 1;
      with Det.Add do
       begin
        nItem       := strNroItem;
        Prod.cProd  := dmBaseDados.tblSaidaCodigoProduto.AsString;
        Prod.cEAN   := ''; //dmBaseDados.tblSaidaRefFabricante.AsString;
        Prod.xProd  := dmBaseDados.tblSaidaDescricaoProduto.AsString;
        prod.NCM    := '';
        Prod.CFOP   := '5120';
        Prod.uCom   := 'UN';
        Prod.qCom   := dmBaseDados.tblSaidaQuantidade.AsFloat;
        Prod.vUnCom := dmBaseDados.tblSaidaValorUnitario.AsFloat;
        Prod.indRegra := irTruncamento;
        Prod.vDesc  := 0; // desconto

        {with Prod.obsFiscoDet.Add do   // Obs do FISCO
         begin
          xCampoDet := '';
          xTextoDet := '';
         end; }

        TotalItem := (Prod.qCom * Prod.vUnCom);
        Imposto.vItem12741 := TotalItem * 0.12;

        Imposto.ICMS.orig  := oeNacional;  // Origem do produto
        {if (dmBaseDados.tblSaidaCondPg.AsFloat = 18) then
         begin
          Imposto.ICMS.CST   := cst00;       // CST
          Imposto.ICMS.pICMS := 18;
         end;
        if (dmBaseDados.tblSaidaCondPg.AsFloat = 0) then
         begin
          Imposto.ICMS.CST   := cst60;       // CST
          //Imposto.ICMS.pICMS := 18;
         end; }
        if (dmBaseDados.tblSaidaQtdeCx.AsString = '0') then
         begin
          Imposto.ICMS.CSOSN   := csosn500;       // CSosn
          //Imposto.ICMS.pICMS := 18;
         end;


        {if (CSTProd = '040') then
         begin
          Imposto.ICMS.CST   := cst40;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;

        if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;

        if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;

        if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;



                       }


      Imposto.PIS.CST := pis49;
      Imposto.PIS.vBC := 0.00;
      Imposto.PIS.pPIS := 0.00;

      Imposto.COFINS.CST := cof49;
      Imposto.COFINS.vBC := 0.00;
      Imposto.COFINS.pCOFINS := 0.00;
        //
        //Imposto.COFINSST.vBC := 87206.46;
        //Imposto.COFINSST.pCOFINS := 1.8457;

        infAdProd := 'Informacoes adicionais';
       end;
      strVTotal := strVTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblSaida.Next;
     End;

    Total.DescAcrEntr.vDescSubtot :=0;
    Total.vCFeLei12741 := 0;

    with Pagto.Add do    // Adicionar o Pagamento
     begin
      cMP := mpDinheiro;      // Tipo Pgto
      vMP := strVTotal;              // Valor Pgto
     end;

    {with Pagto.Add do  // PARA PAGAMENTO MISTO
    begin
      cMP := mpCartaodeCredito;
      vMP := 100;
    end;     }

    InfAdic.infCpl := 'informações'
  END; // end with acbrSAT

mVendaEnviar.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação
mLog.Lines.Add('Venda Gerada');

//mEnviarVenda.Click;

//mImprimirExtratoVenda.Click;

{  if mVendaEnviar.Text = '' then
    mGerarVenda.Click;

  PageControl1.ActivePage := tsLog;

  ACBrSAT1.EnviarDadosVenda( mVendaEnviar.Text );

  if ACBrSAT1.Resposta.codigoDeRetorno = 6000 then
  begin
    LoadXML( ACBrSAT1.CFe.AsXMLString,  mRecebido);
    PageControl1.ActivePage := tsRecebido;
  end;          }









 { PageControl1.ActivePage := tsGerado;

  ACBrSAT1.CFe.IdentarXML := cbxFormatXML.Checked;
  ACBrSAT1.CFe.TamanhoIdentacao := 3;

  mVendaEnviar.Clear;

  // Trasnferindo Informações de Config para o CFe //
  AjustaACBrSAT;
  
  ACBrSAT1.InicializaCFe ;

  // Montando uma Venda //
  with ACBrSAT1.CFe do
  begin
    ide.numeroCaixa := 1;

    Dest.CNPJCPF := '05481336000137';
    Dest.xNome := 'D.J. SYSTEM';

    Entrega.xLgr := 'logradouro';
    Entrega.nro := '112233';
    Entrega.xCpl := 'complemento';
    Entrega.xBairro := 'bairro';
    Entrega.xMun := 'municipio';
    Entrega.UF := 'RJ';

    For A := 0 to 0 do  // Ajuste aqui para vender mais itens
    begin
    with Det.Add do
    begin
      nItem := 1 + (A * 3);
      Prod.cProd := 'ACBR001';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'Assinatura SAC';
      prod.NCM := '99';
      Prod.CFOP := '5120';
      Prod.uCom := 'UN';
      Prod.qCom := 1;
      Prod.vUnCom := 120.00;
      Prod.indRegra := irTruncamento;
      Prod.vDesc := 1;

      with Prod.obsFiscoDet.Add do
      begin
        xCampoDet := 'campo';
        xTextoDet := 'texto';
      end;

      TotalItem := (Prod.qCom * Prod.vUnCom);
      Imposto.vItem12741 := TotalItem * 0.12;

      Imposto.ICMS.orig := oeNacional;
      Imposto.ICMS.CST := cst00;
      Imposto.ICMS.pICMS := 18;

      Imposto.PIS.CST := pis01;
      Imposto.PIS.vBC := TotalItem;
      Imposto.PIS.pPIS := 0.0065;

      Imposto.COFINS.CST := cof01;
      Imposto.COFINS.vBC := TotalItem;
      Imposto.COFINS.pCOFINS := 0.0065;
      //
      //Imposto.COFINSST.vBC := 87206.46;
      //Imposto.COFINSST.pCOFINS := 1.8457;

      infAdProd := 'Informacoes adicionais';
    end;

    with Det.Add do
    begin
      nItem := 2 + (A * 3);
      Prod.cProd := '6291041500213';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'Outro produto Qualquer, com a Descrição Grande';
      Prod.CFOP := '5529';
      Prod.uCom := 'un';
      Prod.qCom := 1.1205;
      Prod.vUnCom := 1.210;
      Prod.indRegra := irTruncamento;
      Prod.vOutro := 2;

      TotalItem := (Prod.qCom * Prod.vUnCom);
      Imposto.vItem12741 := TotalItem * 0.30;

      Imposto.ICMS.orig := oeNacional;
      Imposto.ICMS.CST := cst40;

      Imposto.PIS.CST := pis03;
      Imposto.PIS.qBCProd := TotalItem;
      Imposto.PIS.vAliqProd := 1.0223;

      Imposto.PISST.qBCProd := TotalItem;
      Imposto.PISST.vAliqProd := 1.0223;

      Imposto.COFINS.CST := cof03;
      Imposto.COFINS.qBCProd := TotalItem;
      Imposto.COFINS.vAliqProd := 1.0223;

      //Imposto.COFINSST.qBCProd := 503.6348;
      //Imposto.COFINSST.vAliqProd := 779.4577;
    end;

    with Det.Add do
    begin
      nItem := 3 + (A * 3);
      Prod.cProd := 'abc123';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'ACBrSAT rules';
      Prod.NCM := '99';
      Prod.CFOP := '5844';
      Prod.uCom := 'un';
      Prod.qCom := 1.1205;
      Prod.vUnCom := 1.210;
      Prod.indRegra := irTruncamento;

      TotalItem := (Prod.qCom * Prod.vUnCom);

      Imposto.ICMS.orig := oeEstrangeiraImportacaoDireta;
      Imposto.ICMS.CSOSN := csosn102;

      Imposto.PIS.CST := pis04;

      Imposto.PISST.qBCProd := TotalItem;
      Imposto.PISST.vAliqProd := 1.1826;

      Imposto.COFINS.CST := cof06;

      infAdProd := 'Informacoes adicionais';
    end;

    end;
    (*
    with Det.Add do
    begin
      nItem := 4;
      Prod.cProd := 'abc123';
      Prod.cEAN := '6291041500213';
      Prod.xProd := 'Nada';
      Prod.CFOP := '5025';
      Prod.uCom := 'horas';
      Prod.qCom := 1.1205;
      Prod.vUnCom := 1.210;
      Prod.vProd := 8;
      Prod.indRegra := irTruncamento;
      Prod.vOutro := 93.31;

      Imposto.ICMS.orig := oeEstrangeiraAdquiridaBrasil;
      Imposto.ICMS.CSOSN := csosn900;
      Imposto.ICMS.pICMS := 1.1234;

      Imposto.PIS.CST := pis49;

      Imposto.PISST.qBCProd := 7528.8947;
      Imposto.PISST.vAliqProd := 296.2348;

      Imposto.COFINS.CST := cof49;
    end;
    *)

    Total.DescAcrEntr.vDescSubtot := 5;
    Total.vCFeLei12741 := 1.23;

    with Pagto.Add do
    begin
      cMP := mpDinheiro;
      vMP := 50;
    end;

    with Pagto.Add do
    begin
      cMP := mpCartaodeCredito;
      vMP := 100;
    end;

    InfAdic.infCpl := 'Acesse www.projetoacbr.com.br para obter mais;informações sobre o componente ACBrSAT;'+
                      'Precisa de um PAF-ECF homologado?;Conheça o DJPDV - www.djpdv.com.br'
  end;

  mVendaEnviar.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação

  mLog.Lines.Add('Venda Gerada'); }
end;

procedure TformSAT.mImprimirExtratoVendaClick(Sender : TObject) ;
begin
{  PrepararImpressao;
  ACBrSAT1.ImprimirExtrato;}
end;

procedure TformSAT.mImprimirExtratoVendaResumidoClick(Sender : TObject) ;
begin
{PrepararImpressao;
ACBrSAT1.ImprimirExtratoResumido;}
end;

procedure TformSAT.mLimparClick(Sender : TObject) ;
begin
  mVendaEnviar.Clear;
  LoadXML('', mRecebido);
  mCancelamentoEnviar.Clear;
end;

procedure TformSAT.SbArqLogClick(Sender : TObject) ;
begin
  OpenURL( ExtractFilePath( Application.ExeName ) + edLog.Text);
end;

procedure TformSAT.sePagCodChange(Sender: TObject);
begin
  ACBrSAT1.Config.PaginaDeCodigo := sePagCod.Value;
  cbxUTF8.Checked := ACBrSAT1.Config.EhUTF8;
end;

procedure TformSAT.PrepararImpressao;
begin
{  if ACBrSAT1.Extrato = ACBrSATExtratoESCPOS1 then
  begin
    ACBrSATExtratoESCPOS1.Device.Porta := edtPorta.Text;
    ACBrSATExtratoESCPOS1.Device.Ativar;
    ACBrSATExtratoESCPOS1.ImprimeQRCode := True;
  end
  else
  begin
    ACBrSATExtratoFortes1.LarguraBobina    := seLargura.Value;
    ACBrSATExtratoFortes1.Margens.Topo     := seMargemTopo.Value ;
    ACBrSATExtratoFortes1.Margens.Fundo    := seMargemFundo.Value ;
    ACBrSATExtratoFortes1.Margens.Esquerda := seMargemEsquerda.Value ;
    ACBrSATExtratoFortes1.Margens.Direita  := seMargemDireita.Value ;
    ACBrSATExtratoFortes1.MostrarPreview   := cbPreview.Checked;

    try
      if lImpressora.Caption <> '' then
        ACBrSATExtratoFortes1.PrinterName := lImpressora.Caption;
    except
    end;
  end;   }
end;


procedure TformSAT.LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
begin
  WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml',
              AXML, False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml');
end;

procedure TformSAT.rgRedeTipoInterClick(Sender: TObject);
begin
  gbWiFi.Visible := (rgRedeTipoInter.ItemIndex = 1);
end;

procedure TformSAT.rgRedeTipoLanClick(Sender: TObject);
begin
  gbPPPoE.Visible := (rgRedeTipoLan.ItemIndex = 1);
  gbIPFix.Visible := (rgRedeTipoLan.ItemIndex = 2);
end;

procedure TformSAT.cbxRedeProxyChange(Sender: TObject);
begin
  edRedeProxyIP.Enabled    := (cbxRedeProxy.ItemIndex > 0);
  edRedeProxyPorta.Enabled := edRedeProxyIP.Enabled;
  edRedeProxyUser.Enabled  := edRedeProxyIP.Enabled;
  edRedeProxySenha.Enabled := edRedeProxyIP.Enabled;
end;

procedure TformSAT.LerXMLinterfaceRede1Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'Arquivo XML|*.xml';
  if OpenDialog1.Execute then
  begin
    ACBrSAT1.Rede.LoadFromFile( OpenDialog1.FileName );

    LeDadosRedeSAT;
    ACBrSAT1.ConfigurarInterfaceDeRede( );
  end ;
end;

procedure TformSAT.GerarXMLInterfaceRede1Click(Sender: TObject);
begin
  ConfiguraRedeSAT;
  LoadXML( ACBrSAT1.Rede.AsXMLString,  mRede );

  PageControl1.ActivePage := tsRedeXML;

  SaveDialog1.Filter   := 'Arquivo XML|*.xml';
  SaveDialog1.FileName := 'Rede.xml';
  if SaveDialog1.Execute then
  begin
     ACBrSAT1.Rede.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TformSAT.ConfiguraRedeSAT;
begin
  with ACBrSAT1.Rede do
  begin
    tipoInter   := TTipoInterface( rgRedeTipoInter.ItemIndex );
    SSID        := edRedeSSID.Text ;
    seg         := TSegSemFio( cbxRedeSeg.ItemIndex ) ;
    codigo      := edRedeCodigo.Text ;
    tipoLan     := TTipoLan( rgRedeTipoLan.ItemIndex ) ;
    lanIP       := edRedeIP.Text ;
    lanMask     := edRedeMask.Text ;
    lanGW       := edRedeGW.Text ;
    lanDNS1     := edRedeDNS1.Text ;
    lanDNS2     := edRedeDNS2.Text ;
    usuario     := edRedeUsuario.Text ;
    senha       := edRedeSenha.Text ;
    proxy       := cbxRedeProxy.ItemIndex ;
    proxy_ip    := edRedeProxyIP.Text ;
    proxy_porta := edRedeProxyPorta.Value ;
    proxy_user  := edRedeProxyUser.Text ;
    proxy_senha := edRedeProxySenha.Text ;
  end;
end;

procedure TformSAT.ACBrSAT1GravarLog(const ALogLine: String;
  var Tratado: Boolean);
begin
  mLog.Lines.Add(ALogLine);
  StatusBar1.Panels[0].Text := IntToStr( ACBrSAT1.Resposta.numeroSessao );
  StatusBar1.Panels[1].Text := IntToStr( ACBrSAT1.Resposta.codigoDeRetorno );
  Tratado := False;
end;

procedure TformSAT.LeDadosRedeSAT;
begin
  with ACBrSAT1.Rede do
  begin
    rgRedeTipoInter.ItemIndex := Integer(tipoInter);
    edRedeSSID.Text           := SSID ;
    cbxRedeSeg.ItemIndex      := Integer(seg) ;
    edRedeCodigo.Text         := codigo ;
    rgRedeTipoLan.ItemIndex   := Integer(tipoLan);
    edRedeIP.Text             := lanIP;
    edRedeMask.Text           := lanMask;
    edRedeGW.Text             := lanGW;
    edRedeDNS1.Text           := lanDNS1;
    edRedeDNS2.Text           := lanDNS2;
    edRedeUsuario.Text        := usuario;
    edRedeSenha.Text          := senha;
    cbxRedeProxy.ItemIndex    := proxy;
    edRedeProxyIP.Text        := proxy_ip;
    edRedeProxyPorta.Value    := proxy_porta;
    edRedeProxyUser.Text      := proxy_user;
    edRedeProxySenha.Text     := proxy_senha;
  end;
end;

procedure TformSAT.btnImpSATClick(Sender: TObject);
var TotalItem, strVTotal : Double;
    A, strNroItem : Integer;
    // Var SWEDA
    percorre : Integer;
    XMLRecebido : String;
    ArqX : TStringList;
begin
ValorCupom := 0;
cbxModelo.ItemIndex := 2;
bInicializar.Click;
formFormaPagamento.ShowModal;
formCNPJCPF.ShowModal;
//mGerarVenda.Click;

PageControl1.ActivePage := tsGerado;
ACBrSAT1.CFe.IdentarXML := cbxFormatXML.Checked;
ACBrSAT1.CFe.TamanhoIdentacao := 3;

mVendaEnviar.Clear;

// Trasnferindo Informações de Config para o CFe //
AjustaACBrSAT;
ACBrSAT1.InicializaCFe ;

with ACBrSAT1.CFe do
  BEGIN
   ide.numeroCaixa := 1;

   Dest.CNPJCPF    := strCPF;
   Dest.xNome      := ''; // Nome Do cliente

   Entrega.xLgr    := ''; // Dados de Entrega:
   Entrega.nro     := '';
   Entrega.xCpl    := '';
   Entrega.xBairro := '';
   Entrega.xMun    := '';
   Entrega.UF      := '';

   // Adicionando os itens da Venda:
   strNroItem := 0;
   strVTotal   := 0;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
     Begin 
      strNroItem := strNroItem + 1;
      with Det.Add do
       begin
        nItem       := strNroItem;
        Prod.cProd  := dmBaseDados.tblSaidaCodigoProduto.AsString;
        Prod.cEAN   := ''; //dmBaseDados.tblSaidaRefFabricante.AsString;
        Prod.xProd  := dmBaseDados.tblSaidaDescricaoProduto.AsString;
        prod.NCM    := '';
        //Prod.CFOP   := '5120';
        Prod.uCom   := 'UN';
        Prod.qCom   := dmBaseDados.tblSaidaQuantidade.AsFloat;
        Prod.vUnCom := dmBaseDados.tblSaidaValorUnitario.AsFloat;
        Prod.indRegra := irTruncamento;
        Prod.vDesc  := 0; // desconto

        {with Prod.obsFiscoDet.Add do   // Obs do FISCO
         begin
          xCampoDet := '';
          xTextoDet := '';
         end; }

        TotalItem := (Prod.qCom * Prod.vUnCom);
        Imposto.vItem12741 := dmBaseDados.tblSaidaPeso.AsFloat; //TotalItem * 0.12;

        Imposto.ICMS.orig  := oeNacional;  // Origem do produto
        {if (dmBaseDados.tblSaidaCondPg.AsFloat = 18) then
         begin
          Imposto.ICMS.CST   := cst00;       // CST
          Imposto.ICMS.pICMS := 18;
         end;
        if (dmBaseDados.tblSaidaCondPg.AsFloat = 0) then
         begin
          Imposto.ICMS.CST   := cst60;       // CST
          //Imposto.ICMS.pICMS := 18;
         end; }
        if (dmBaseDados.tblSaidaQtdeCx.AsString = '0') then
         begin
          Prod.CFOP   := '5405';
          Imposto.ICMS.CSOSN := csosn500;       // CSosn
          //Imposto.ICMS.pICMS := 18;
         end;

        if (dmBaseDados.tblSaidaQtdeCx.AsString = '18') then
         begin
          Prod.CFOP   := '5102';
          Imposto.ICMS.CSOSN := csosn102;       // Csosn
          //Imposto.ICMS.pICMS := 18;
         end;

        {if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;

        if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;

        if (CSTProd = '041') then
         begin
          Imposto.ICMS.CST   := cst41;       // CST
          //Imposto.ICMS.pICMS := 18;
         end;    }

      Imposto.PIS.CST := pis49;
      Imposto.PIS.vBC := 0.00;
      Imposto.PIS.pPIS := 0.00;

      Imposto.COFINS.CST := cof49;
      Imposto.COFINS.vBC := 0.00;
      Imposto.COFINS.pCOFINS := 0.00;
        //
      //Imposto.COFINSST.vBC := 87206.46;
      //Imposto.COFINSST.pCOFINS := 1.8457;

      infAdProd := '';
     end;
      strVTotal := strVTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblSaida.Next;
     End;

    Total.DescAcrEntr.vDescSubtot :=0;
    Total.vCFeLei12741 := strTotTrib;

    with Pagto.Add do    // Adicionar o Pagamento
     Begin
      //if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 0) then
      //0 mpDinheiro 1 mpCheque 2 mpCartaodeCredito 3 mpCartaodeDebito 4 mpCreditoLoja 5 mpValeAlimentacao 6 mpValeRefeicao 7 mpValePresente 8 mpValeCombustivel 9 mpOutros
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 0) then
       begin
        cMP := mpDinheiro; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 1) then
       begin
        cMP := mpCheque; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 2) then
       begin
        cMP := mpCartaodeCredito; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 3) then
       begin
        cMP := mpCartaodeDebito; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 4) then
       begin
        cMP := mpCreditoLoja; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 5) then
       begin
        cMP := mpValeAlimentacao; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 6) then
       begin
        cMP := mpValeRefeicao; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 7) then
       begin
        cMP := mpValePresente; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 8) then
       begin
        cMP := mpValeCombustivel; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 9) then
       begin
        cMP := mpOutros; // Tipo Pgto
        vMP := strVTotal;   // Valor Pgto
       end;
     End;
    {with Pagto.Add do  // PARA PAGAMENTO MISTO
    begin
      cMP := mpCartaodeCredito;
      vMP := 100;
    end;     }

    InfAdic.infCpl := 'Valor Aprox. Tributos:  (Federal: ' +FormatFloat('R$ 0.00',strTribFed) +' Estadual: ' +FormatFloat('R$ 0.00',strTribEst) +' Municipal: ' +FormatFloat('R$ 0.00',strTribMun) + ') - FONTE: IBPT';
  END; // end with acbrSAT
ValorCupom := strVTotal;
mVendaEnviar.Lines.Text := ACBrSAT1.CFe.GerarXML( True );    // True = Gera apenas as TAGs da aplicação
mLog.Lines.Add('Venda Gerada');
formSwedaSAT.Conteudo.Text := mVendaEnviar.Lines.Text;
formSAT.Close;
//-----------------------------

      {  Retorno:=#0;

                Sessao := NovaSessao;
                StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
                XMLVenda := AnsiString(System.UTF8Encode(mVendaEnviar.Text));

                GravaUltimaSessao(Sessao);

                Retorno:=Pchar(EnviarDadosVenda(strtoint(sessao),CodAtivacao,XMLVenda));
                StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
                Conteudo.Clear;
                Conteudo.Lines.Add(Retorno);
                TrataRetorno(2,Retorno);
                XMLRecebido := DecodeBase64(CupomBase64.Text);

                ArqX := TStringList.Create;
                ArqX.Add(XMLRecebido);
                ArqX.SaveToFile( ExtractFilePath( Application.ExeName ) + 'Venda64.xml');
                ArqX.Free;

                //SI300_iImprimirXMLString(stringXml,ptAutorizacao,dhRecto,tpCupom,CIDTOKEN,CSC,viaEstabelecimento,Endereco,)

                SI300_iImprimirXMLString(XMLRecebido,'','',0,'','',0,True);   }

end;

procedure TformSAT.btn1Click(Sender: TObject);
begin
btnImpSAT.Click;
end;

procedure TformSAT.FormActivate(Sender: TObject);
var pt:tpoint;
begin
{Sleep(1500);
btnImpSAT.Click;}
{Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, Pt.x, Pt.y, 0, 0);
edtFocus.SetFocus;
edtFocus.Text := 'focus';  }
//Close;                            
SetCursorPos(Round(300),Round(300));
SetCursorPos(Round(350),Round(350));
SetCursorPos(Round(400),Round(400));             
formSAT.WindowState := wsNormal;
formSAT.Position    := poMainFormCenter;
end;

procedure TformSAT.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
btnImpSAT.Click;
end;

procedure TformSAT.edtFocusChange(Sender: TObject);
begin
//btnImpSAT.CLick;
end;

end.


