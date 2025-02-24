unit SATFiscal;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, ACBrSATExtratoFortes, ACBrSATExtratoFortesFr,
      ACBrSATExtratoClass, ACBrSATExtratoESCPOS, ACBrBase, ACBrSAT, ExtCtrls,
      OleCtrls, SHDocVw, StdCtrls, Buttons, Spin, ComCtrls, TISButton,
      TISPageControl, TISTabControl, ACBrSATClass;

{  Classes, SysUtils, Forms,
  Controls, Graphics, Dialogs, StdCtrls, ActnList, Menus, ExtCtrls, Buttons,
  ComCtrls, Spin, ACBrSAT, ACBrSATClass, ACBrSATExtratoESCPOS,
  ACBrSATExtratoFortesFr, ACBrBase, ACBrSATExtratoClass, OleCtrls, SHDocVw,
  TISButton, ACBrSATExtratoFortes;}


type
  TformSATFiscal = class(TForm)
    ACBrSAT1: TACBrSAT;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrSATExtratoFortes1: TACBrSATExtratoFortes;
    PrintDialog1: TPrintDialog;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    tabSAT: TTISTabSheet;
    TISPageControl1: TTISPageControl;
    ISTabSheet2: TTISTabSheet;
    btnImpSAT: TTISButton;
    gpOperacao: TGroupBox;
    bInicializar: TButton;
    cbxModelo: TComboBox;
    GroupBox2: TGroupBox;
    btLerParams: TButton;
    btSalvarParams: TButton;
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
    procedure btnImpSATClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConfiguraRedeSAT;
    procedure LeDadosRedeSAT;
    procedure PrepararImpressao;
    procedure TrataErros(Sender : TObject ; E : Exception) ;
    procedure AjustaACBrSAT ;
    procedure LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
  public
    { Public declarations }
  end;

var formSATFiscal: TformSATFiscal;

implementation

Uses typinfo, ACBrUtil, pcnConversao, pcnRede, synacode, IniFiles, ConfiguraSerial,
     RLPrinters, Printers, ModuloDados, CheckCGC;


{$R *.dfm}

procedure TformSATFiscal.ConfiguraRedeSAT;
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

procedure TformSATFiscal.LeDadosRedeSAT;
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

procedure TformSATFiscal.PrepararImpressao;
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

procedure TformSATFiscal.TrataErros(Sender: TObject; E: Exception);
var Erro : String ;
begin
  Erro := Trim(E.Message) ;
  ACBrSAT1.DoLog( E.ClassName+' - '+Erro);
end ;

procedure TformSATFiscal.AjustaACBrSAT ;
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

procedure TformSATFiscal.LoadXML(AXML: String; MyWebBrowser: TWebBrowser);
begin
  WriteToTXT( PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml',
              AXML, False, False);
  MyWebBrowser.Navigate(PathWithDelim(ExtractFileDir(application.ExeName))+MyWebBrowser.Name+'-temp.xml');
end;




procedure TformSATFiscal.btnImpSATClick(Sender: TObject);
var TotalItem, strTotal : Double;
    A, strNroItem : Integer;
begin
cbxModelo.ItemIndex := 2;
formCNPJCPF.ShowModal;
bInicializar.Click;
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
   strTotal   := 0;
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
      strTotal := strTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblSaida.Next;
     End;

    Total.DescAcrEntr.vDescSubtot :=0;
    Total.vCFeLei12741 := 0;

    with Pagto.Add do    // Adicionar o Pagamento
     begin
      cMP := mpDinheiro; // Tipo Pgto
      vMP := strTotal;   // Valor Pgto
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
end;

end.
 