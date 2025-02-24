unit TesteSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Menus, Mask, IniFiles, ExtCtrls, StrUtils,
  IdBaseComponent,  IdCoder , IdCoder3to4, IdCoderMIME, TISButton,
  TIGradient;

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
  TformSwedaSAT = class(TForm)
    StatusBar1: TStatusBar;
    MenuList: TPopupMenu;
    InserirItem1: TMenuItem;
    ExcluirItem1: TMenuItem;
    OpenDialog1: TOpenDialog;
    E1: TMenuItem;
    Splitter1: TSplitter;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    PageControl1: TPageControl;
    tabVenda: TTabSheet;
    tabConfiguracao: TTabSheet;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdCNPJ: TMaskEdit;
    Button4: TButton;
    EDIE: TMaskEdit;
    EDIM: TMaskEdit;
    EdCNPJAC: TMaskEdit;
    Button5: TButton;
    EdSignAC: TMaskEdit;
    Panel4: TPanel;
    Button1: TButton;
    Edit1: TEdit;
    BtExtrairLogs: TButton;
    BtConsultarSessao: TButton;
    CupomBase64: TMemo;
    XML: TMemo;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    EdCodAtivacao: TMaskEdit;
    BtFimaFim: TButton;
    BtStOperacional: TButton;
    Conteudo: TRichEdit;
    GroupBox1: TGroupBox;
    ListEnviar: TListBox;
    Panel3: TPanel;
    BtCarregaXML: TButton;
    edtRetorno: TRichEdit;
    btnEnviarVenda: TTISButton;
    btnCancelar: TTISButton;
    TIGradient1: TTIGradient;
    Label7: TLabel;
    procedure BtEnviarDadosVendaClick(Sender: TObject);
    procedure InserirItem1Click(Sender: TObject);
    procedure BtFimaFimClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EdCodAtivacaoExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExcluirItem1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure BtStOperacionalClick(Sender: TObject);
    procedure BtExtrairLogsClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtCarregaXMLClick(Sender: TObject);
    procedure BtConsultarSessaoClick(Sender: TObject);
    procedure btnEnviarVendaClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tabVendaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    procedure GravaUltimaSessao(CodSessao:string);
    Function NovaSessao:String;
    function DecodificaBase64(BString:Pchar):Pchar;

  public
    procedure TrataRetorno(Comando:Integer; RespostaSAT:String);
    { Public declarations }
  end;

var
  formSwedaSAT: TformSwedaSAT;
  Sessao:String;
  ValorCupom : Double;
  SessaoNUm, stsImp:Integer;
  CodAtivacao:AnsiString;
  XMLVenda:AnsiString;
  XMLCancelamento:AnsiString;
  fEmitente: TIniFile;
  cod64, dec64:string;
  Chave: Ansistring; // chave de consulta do CFeSAT e utilizada para cancelamento

  strCodRetorno : String;

  mensagem_operacional : Array[0..26] of String = ('Numero da Sessão','Cod. Retorno', 'Mensagem Retorno','Cod. SEFAZ','Mensagem SEFAZ','Num Série','Tipo LAN','IP','MacAddress','Máscara de Rede',
  'Gateway', 'DNS1', 'DNS2','Status Lan','Nível Bateria','Memória Total','Memória Usada','Data e Hora Atual','Versão SB','Versão Layout','Último CFe-SAT','Cfe-SAT Inicial','Cfe-SAT Final',
  'Data e Hora da última Transmissão','Data Emissão Certificado','Data Validade Certificado','Estado Operacional');

  mensagem_venda : Array[0..26] of String = ('Numero da Sessão','Cod. Retorno', 'Cod. Erro','Mensagem','Codigo SEFAZ','Mensagem SEFAZ','Arquivo Base 64','Time-stamp','Chave de Consulta','Valor Total CFe','CNPJ Value',
  'Assinatura QRCode', '', ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ', ' ',' ',' ');

  Retorno:Pchar;

implementation

uses synacode, ModuloDados, Venda, DB, FormaPagamento;

Function EnviarDadosVenda(NumeroSessao:integer; CodAtivacao:AnsiString; Venda_XML:AnsiString):Pchar; stdcall;  external 'sat.dll';
Function TesteFimAFim(NumeroSessao:Integer; CodAtivacao:AnsiString; Venda_XML:AnsiString):Pchar; stdcall; external 'sat.dll';
Function ConsultarNumeroSessao(NumeroSessao:Integer; CodAtivacao:AnsiString;cNumeroSessao:integer):Pchar; stdcall;  external 'sat.dll';
Function ConsultarStatusOperacional(NumeroSessao:Integer; CodAtivacao:AnsiString):Pchar; stdcall;  external 'sat.dll';
Function ConsultarSAT(NumeroSessao:integer):Pchar; stdcall; external 'sat.dll';
Function ExtrairLogs(NumeroSessao:Integer; CodAtivacao:AnsiString):Pchar; stdcall; external 'sat.dll';
Function CancelarUltimaVenda(NumeroSessao:integer; CodAtivacao:AnsiString; Chave:AnsiString; DadosCancelamento:AnsiString):Pchar; stdcall;  external 'sat.dll';
Function SI300_iImprimirXMLString(stringXml:AnsiString; ptAutorizacao:AnsiString; dhRecto:AnsiString; tpCupom:Integer; CIDTOKEN:AnsiString; CSC:AnsiString; viaEstabelecimento:Integer; Endereco:Boolean):Pchar; cdecl;  external 'SI300.dll';
Function SI300_iImprimirXML(pszPath:AnsiString; ptAutorizacao:AnsiString; dhRecto:AnsiString; tpCupom:Integer; CIDTOKEN:AnsiString; CSC:AnsiString; viaEstabelecimento:Integer; Endereco:Boolean):Pchar; cdecl;  external 'SI300.dll';


{$R *.dfm}


procedure TformSwedaSAT.BtEnviarDadosVendaClick(Sender: TObject);
var percorre:integer;
    XMLRecebido : String;
    ArqX : TStringList;
begin
 {       Retorno:=#0;
       { try
            Conteudo.Clear;
            for percorre:=0 to ListEnviar.Count-1 do
            begin    //
                //Conteudo.Lines.LoadFromFile(ListEnviar.Items[percorre]);
                Sessao := NovaSessao;
                StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
                XMLVenda := AnsiString(System.UTF8Encode(Conteudo.Text));

                GravaUltimaSessao(Sessao);
                //StatusBar1.Panels[3].Text:='Arq: ' +ListEnviar.Items[percorre] ;
                Retorno:=Pchar(EnviarDadosVenda(strtoint(sessao),CodAtivacao,XMLVenda));
                StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
                Conteudo.Clear;
                Conteudo.Lines.Add(Retorno);
                TrataRetorno(2,Retorno);
                XMLRecebido := DecodeBase64(CupomBase64.Text);
                //ShowMessage(XMLRecebido);
                ArqX := TStringList.Create;
                ArqX.Add(XMLRecebido);
                ArqX.SaveToFile( ExtractFilePath( Application.ExeName ) +'Venda64.xml');
                ArqX.Free;

                //SI300_iImprimirXMLString(stringXml,ptAutorizacao,dhRecto,tpCupom,CIDTOKEN,CSC,viaEstabelecimento,Endereco,)

                SI300_iImprimirXMLString(XMLRecebido,'','',0,'','',0,True);

        {    end;
        except
            StatusBar1.Panels[3].Text:='Arquivo não carregado.';
        end; }

end;

procedure TformSwedaSAT.InserirItem1Click(Sender: TObject);
var percorre:integer;
begin
      OpenDialog1.Execute;
      try
            for percorre := 0 to OpenDialog1.Files.Count-1 do
            begin
                ListEnviar.Items.Add(OpenDialog1.Files[percorre]);
            end
      except
            StatusBar1.Panels[3].Text:='Falha ao selecionar o arquivo.';
      end;

end;

procedure TformSwedaSAT.BtFimaFimClick(Sender: TObject);
begin

        OpenDialog1.Execute;

        Sessao := NovaSessao;
        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        Conteudo.Lines.LoadFromFile(OpenDialog1.FileName);
     {   if (System.WideStrUtils.IsUTF8String(Conteudo.Text)) then
        begin
            XMLVenda := AnsiString(Conteudo.Text);
        end
        else
        begin
           XMLVenda := AnsiString(System.UTF8Encode(Conteudo.Text));
        end;
              }
        XMLVenda := AnsiString(System.UTF8Encode(Conteudo.Text));

        GravaUltimaSessao(sessao);
        Retorno:=TesteFimAFim(strtoint(sessao), CodAtivacao, XMLVenda);
        StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
        TrataRetorno(0,Retorno);

end;

procedure TformSwedaSAT.Button4Click(Sender: TObject);
begin
      if not FileExists(ExtractFilePath(Application.ExeName)+'sat.ini') then
          fEmitente := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sat.ini') ;

      fEmitente.WriteString('Emitente','CNPJ',EdCNPJ.Text);
      fEmitente.WriteString('Emitente','IE',EdIE.Text);
      fEmitente.WriteString('Emitente','IM',EdIM.Text);
      fEmitente.WriteString('AC','CNPJAC',EdCNPJAC.Text);
      fEmitente.WriteString('AC','SignAC',EdSignAC.Text);
      fEmitente.WriteString('Emitente','CodAtivacao',EdCodAtivacao.Text);

      CodAtivacao:= EdCodAtivacao.Text;

end;
procedure TformSwedaSAT.Button5Click(Sender: TObject);
begin
      if FileExists(ExtractFilePath(Application.ExeName)+'sat.ini') then
      begin
          fEmitente := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sat.ini') ;

          edCNPJ.Text:= fEmitente.ReadString('Emitente','CNPJ','');
          edIE.Text  := fEmitente.ReadString('Emitente','IE','');
          edIM.Text  := fEmitente.ReadString('Emitente','IM','');
          edCNPJAC.Text:= fEmitente.ReadString('AC','CNPJAC','');
          edSignAC.Text:= fEmitente.ReadString('AC','SignAC','SGR-SAT SISTEMA DE GESTAO E RETAGUARDA DO SAT');
          EdCodAtivacao.Text:= fEmitente.ReadString('Emitente','CodAtivacao','123123123');
          CodAtivacao:= EdCodAtivacao.Text;
      end
      else StatusBar1.Panels[3].Text:='Arquivo '+ExtractFilePath(Application.ExeName)+'sat.ini' +'não existe.';

end;

procedure TformSwedaSAT.FormActivate(Sender: TObject);
begin
Button5Click(Sender);
stsImp := 0;
SetCursorPos(Round(300),Round(300));
SetCursorPos(Round(350),Round(350));
SetCursorPos(Round(400),Round(400));
formSwedaSAT.WindowState := wsNormal;
formSwedaSAT.Position    := poMainFormCenter;
end;

procedure TformSwedaSAT.GravaUltimaSessao(CodSessao:string);
begin
      if not FileExists(ExtractFilePath(Application.ExeName)+'sat.ini') then
          fEmitente := TIniFile.Create(ExtractFilePath(Application.ExeName)+'sat.ini') ;

      fEmitente.WriteString('UltimaSessao','NumeroSessao',CodSessao);
end;

Function TformSwedaSAT.NovaSessao:String;
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
procedure TformSwedaSAT.EdCodAtivacaoExit(Sender: TObject);
begin
        CodAtivacao:= EdCodAtivacao.Text;
end;

procedure TformSwedaSAT.Button1Click(Sender: TObject);
begin
      Sessao := NovaSessao;
      StatusBar1.Panels[1].Text:='Sessao: '+Sessao;

      GravaUltimaSessao(Sessao);
      Retorno:=ConsultarSAT(strtoint(sessao));
      TrataRetorno(0,Retorno);
      StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;

end;

procedure TformSwedaSAT.TrataRetorno(Comando:Integer;RespostaSAT:String);
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
      edtRetorno.Clear;

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
          edtRetorno.Refresh;
          Application.ProcessMessages;
          try
              texto := Pchar(StringReplace(Texto,copy(texto,pipe-3,4),copy(texto,pipe-3,3),[rfIgnoreCase])); // pega a sequencia de 3 bytes para não substituir texto errado
          except
          end;
          if percorre = 1 then // Codigo de retorno
              CodigoRetorno := miniconteudo;
              strCodRetorno := CodigoRetorno;
              
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


procedure TformSwedaSAT.ExcluirItem1Click(Sender: TObject);
begin

      ListEnviar.Items.Delete(ListEnviar.ItemIndex);

end;

procedure TformSwedaSAT.E1Click(Sender: TObject);
begin
        ListEnviar.Clear;
end;

procedure TformSwedaSAT.BtStOperacionalClick(Sender: TObject);
begin
        Sessao := NovaSessao;
        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        GravaUltimaSessao(sessao);
        Retorno:=ConsultarStatusOperacional(strtoint(sessao), CodAtivacao);
        StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
        TrataRetorno(1,Retorno);

end;

procedure TformSwedaSAT.BtExtrairLogsClick(Sender: TObject);
begin
        Sessao := NovaSessao;
        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        GravaUltimaSessao(sessao);
        Retorno:=ExtrairLogs(strtoint(sessao), CodAtivacao);
        StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
        edtRetorno.Clear;
        edtRetorno.Lines.Add(retorno);
//        TrataRetorno(1,Retorno);


end;

procedure TformSwedaSAT.BtCancelarClick(Sender: TObject);
var strCNPJAC, strCNPJCLi : String;
begin
strCNPJAC  := Copy(EdCNPJAC.Text,1,2)+Copy(EdCNPJAC.Text,4,3)+Copy(EdCNPJAC.Text,8,3)+Copy(EdCNPJAC.Text,12,4)+Copy(EdCNPJAC.Text,17,2);
strCNPJCli := Copy(EdCNPJ.Text,1,2)+Copy(EdCNPJ.Text,4,3)+Copy(EdCNPJ.Text,8,3)+Copy(EdCNPJ.Text,12,4)+Copy(EdCNPJ.Text,17,2);

        Retorno:=#0;
        Sessao := NovaSessao;
        Conteudo.Clear;
        Conteudo.Lines.Add('<?xml version="1.0" encoding="UTF-8"?><CFeCanc><infCFe chCanc="'+Chave+'"><ide><CNPJ>'+strCNPJAC+'</CNPJ>'+'<signAC>'+EdSignAC.text+'</signAC><numeroCaixa>233</numeroCaixa></ide><emit></emit><dest><CNPJ>'+strCNPJCli+'</CNPJ></dest><total></total><infAdic></infAdic></infCFe></CFeCanc>');

        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        XMLCancelamento := AnsiString(Conteudo.Text);

        GravaUltimaSessao(Sessao);
        StatusBar1.Panels[3].Text:='' ;

        if messagedlg('Confirmar executar o cancelamento?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
                Retorno:=CancelarUltimaVenda(strtoint(sessao),CodAtivacao, Chave, XMLCancelamento);

                StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
                Conteudo.Clear;
                Conteudo.Lines.Add(Retorno);
        end
        else
                    Conteudo.Clear;

end;

procedure TformSwedaSAT.BtCarregaXMLClick(Sender: TObject);
begin
Opendialog1.Execute;
Conteudo.Lines.LoadFromFile(OpenDialog1.FileName);
XMLVenda := AnsiString(Conteudo.Text);
end;

procedure TformSwedaSAT.BtConsultarSessaoClick(Sender: TObject);
begin
        Retorno:=#0;

        Sessao := NovaSessao;

        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        XMLCancelamento := AnsiString(Conteudo.Text);

        GravaUltimaSessao(Sessao);
        StatusBar1.Panels[3].Text:='' ;

        Retorno:=ConsultarNumeroSessao(strtoint(sessao),CodAtivacao, strtoint(Edit1.Text));

        StatusBar1.Panels[2].Text:='Retorno: ' + Retorno;
        edtRetorno.Clear;
        edtRetorno.Lines.Add(Retorno);
end;

function TformSwedaSAT.DecodificaBase64(BString:Pchar):PChar;
begin
end;

procedure TformSwedaSAT.btnEnviarVendaClick(Sender: TObject);
var percorre:integer;
    XMLRecebido : String;
    ArqX : TStringList;
begin
stsImp := 1;
if (Application.MessageBox('Confirma emissão do Cupom ?','Confirma ??',MB_YESNO) = IDYES) then
  Begin
   Retorno       := #0;
   strCodRetorno := '';
   Sessao        := NovaSessao;
   StatusBar1.Panels[1].Text := 'Sessao: '+Sessao;
   XMLVenda := AnsiString(System.UTF8Encode(Conteudo.Text));

   GravaUltimaSessao(Sessao);
   //StatusBar1.Panels[3].Text:='Arq: ' +ListEnviar.Items[percorre] ;
   Retorno:=Pchar(EnviarDadosVenda(strtoint(sessao),CodAtivacao,XMLVenda));
   StatusBar1.Panels[2].Text := 'Retorno: ' + Retorno;
   edtRetorno.Clear;
   edtRetorno.Lines.Add(Retorno);
   TrataRetorno(2,Retorno);
   XMLRecebido := DecodeBase64(CupomBase64.Text);
   //ShowMessage(XMLRecebido);

   if (strCodRetorno = '06000') then
     Begin
      ArqX := TStringList.Create;
      ArqX.Add(XMLRecebido);
      ArqX.SaveToFile('F:\CFe\Autorizados\' + Chave + '.xml');
      ArqX.Free;
      //SI300_iImprimirXMLString(stringXml,ptAutorizacao,dhRecto,tpCupom,CIDTOKEN,CSC,viaEstabelecimento,Endereco,)

      SI300_iImprimirXMLString(XMLRecebido,'','',0,'','',0,True);

      dmBaseDados.tblCupomFiscal.Open;
      dmBaseDados.tblCupomFiscal.Append;
      dmBaseDados.tblCupomFiscalNPedido.AsString    := strReqSaida;
      dmBaseDados.tblCupomFiscalCliente.AsString    := dmBaseDados.tblClientesCodigoCliente.AsString;
      dmBaseDados.tblCupomFiscalChave.AsString      := Copy(Chave,4,44);
      dmBaseDados.tblCupomFiscalCaminhoXML.AsString := 'F:\CFe\Autorizados\' + Chave + '.xml';
      dmBaseDados.tblCupomFiscalData.AsDateTime     := Date;
      dmBaseDados.tblCupomFiscalHora.AsDateTime     := Time;
      dmBaseDados.tblCupomFiscalValor.AsFloat       := ValorCupom;
      //0 mpDinheiro 1 mpCheque 2 mpCartaodeCredito 3 mpCartaodeDebito 4 mpCreditoLoja 5 mpValeAlimentacao 6 mpValeRefeicao 7 mpValePresente 8 mpValeCombustivel 9 mpOutros
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 0) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'DH';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 1) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'CH';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 2) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'CC';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 3) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'CD';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 4) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'CL';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 5) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'VA';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 6) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'VR';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 7) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'VP';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 8) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'VC';
       end;
      if (formFormaPagamento.cmbPgtoSAT.ItemIndex = 9) then
       begin
        dmBaseDados.tblCupomFiscalPagamento.AsString := 'OT';
       end;        
      dmBaseDados.tblCupomFiscal.Post;
      Close;
     End;
  END;
end;

procedure TformSwedaSAT.btnCancelarClick(Sender: TObject);
var strCNPJAC, strCNPJCLi : String;
    ArqX : TStringList;
begin
strCNPJAC  := Copy(EdCNPJAC.Text,1,2)+Copy(EdCNPJAC.Text,4,3)+Copy(EdCNPJAC.Text,8,3)+Copy(EdCNPJAC.Text,12,4)+Copy(EdCNPJAC.Text,17,2);
strCNPJCli := Copy(EdCNPJ.Text,1,2)+Copy(EdCNPJ.Text,4,3)+Copy(EdCNPJ.Text,8,3)+Copy(EdCNPJ.Text,12,4)+Copy(EdCNPJ.Text,17,2);
dmBaseDados.tblCupomFiscal.Last;

        Retorno := #0;
        Sessao  := NovaSessao;
        Chave   := dmBaseDados.tblCupomFiscalChave.AsString;
        Conteudo.Clear;
        Conteudo.Lines.Add('<?xml version="1.0" encoding="UTF-8"?><CFeCanc><infCFe chCanc="'+Chave+'"><ide><CNPJ>'+strCNPJAC+'</CNPJ>'+'<signAC>'+EdSignAC.text+'</signAC><numeroCaixa>233</numeroCaixa></ide><emit></emit><dest><CNPJ>'+strCNPJCli+'</CNPJ></dest><total></total><infAdic></infAdic></infCFe></CFeCanc>');

        StatusBar1.Panels[1].Text:='Sessao: '+Sessao;
        XMLCancelamento := AnsiString(Conteudo.Text);

        GravaUltimaSessao(Sessao);                
        StatusBar1.Panels[3].Text :='' ;

        ArqX := TStringList.Create;
        ArqX.Add(XMLCancelamento);
        ArqX.SaveToFile( ExtractFilePath( Application.ExeName ) +'Cancelado.xml');
        ArqX.Free;

        if messagedlg('Confirmar executar o cancelamento?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
         Begin
          Retorno := CancelarUltimaVenda(strtoint(sessao),CodAtivacao, Chave, XMLCancelamento);
          StatusBar1.Panels[2].Text := 'Retorno: ' + Retorno;
          edtRetorno.Clear;
          edtRetorno.Lines.Add(Retorno);
         End
        else
         Begin           
          Conteudo.Clear;
         End;
end;

procedure TformSwedaSAT.FormShow(Sender: TObject);
begin
btnEnviarVenda.SetFocus;
end;

procedure TformSwedaSAT.tabVendaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
if (stsImp = 0) then
 begin
  btnEnviarVenda.Click;
 end;
end;

end.
