unit Clientes;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls,
     Forms, Dialogs, Buttons, StdCtrls, DBCtrls, Mask, ComCtrls,
     Grids, DBGrids, ExtCtrls, db, TISButton, Variants;

type
  TformClientes = class(TForm)
    pgClientes           : TPageControl;
    tabFichaCliente      : TTabSheet;
    lblNomeCliente       : TLabel;
    fldNomeCliente       : TDBEdit;
    lblSituacao          : TLabel;
    fldSituacao          : TDBEdit;
    fldCIC               : TDBEdit;
    lblCIC               : TLabel;
    fldRG                : TDBEdit;
    fldDataCadastro      : TDBEdit;
    lblRG                : TLabel;
    lblDataCadastro      : TLabel;
    lblEndereco          : TLabel;
    fldEndereco          : TDBEdit;
    lblNumero            : TLabel;
    fldNumero            : TDBEdit;
    fldComplemento       : TDBEdit;
    lblComplemento       : TLabel;
    fldBairro            : TDBEdit;
    lblBairro            : TLabel;
    lblCidade            : TLabel;
    fldCidade            : TDBEdit;
    lblEstado            : TLabel;
    lblCEP               : TLabel;
    fldCEP               : TDBEdit;
    fldFax               : TDBEdit;
    lblFax               : TLabel;
    fldTelefone          : TDBEdit;
    lblTelefone          : TLabel;
    fldContado           : TDBEdit;
    lblContato           : TLabel;
    lblEmail             : TLabel;
    fldEmail             : TDBEdit;
    lblLogistica         : TLabel;
    fldLogistica         : TDBEdit;
    fldObs               : TDBMemo;
    lblObs               : TLabel;
    fldRamoAtividade     : TDBEdit;
    lblRamoAtividade     : TLabel;
    lblCobranca          : TLabel;
    fldCobranca          : TDBEdit;
    tabContasReceber     : TTabSheet;
    grdContasReceber     : TDBGrid;
    lblDtUltCompra       : TLabel;
    fldDtUltCompra       : TDBEdit;
    lblCodigoIbge        : TLabel;
    fldCodigoIbge        : TDBEdit;
    TabSheet1            : TTabSheet;
    lblDtAberturaEmpresa : TLabel;
    fldDtAbEmpresa       : TDBEdit;
    lblPredioProprio     : TLabel;
    lblOutroComercio     : TLabel;
    lblEnderecoOutroComercio : TLabel;
    fldEndOutraEmpresa   : TDBEdit;
    fldFornec1           : TDBEdit;
    lblFornec1           : TLabel;
    lblFornec2           : TLabel;
    fldFornec2           : TDBEdit;
    fldFornec3           : TDBEdit;
    lblFornec3           : TLabel;
    fldFornec4           : TDBEdit;
    lblFornec4           : TLabel;
    lblFornec5           : TLabel;
    fldFornec5           : TDBEdit;
    lblBanco1            : TLabel;
    fldBanco1            : TDBEdit;
    fldBanco2            : TDBEdit;
    lblBanco2            : TLabel;
    fldBanco3            : TDBEdit;
    lblBanco3            : TLabel;
    DbcPredioProprio     : TDBComboBox;
    DbcOutroComercio     : TDBComboBox;
    btnGravaComplemento  : TSpeedButton;
    fldEstado            : TDBEdit;
    dbtCodigoCliente     : TDBText;
    lblNire              : TLabel;
    fldNire              : TDBEdit;
    lblZona              : TLabel;
    lblTipoCliente       : TLabel;
    DBComboBox1          : TDBComboBox;
    lblChekout           : TLabel;
    fldChekout           : TDBEdit;
    Label1               : TLabel;
    fldNomeFantasia      : TDBEdit;
    Label2               : TLabel;
    DBComboBox2          : TDBComboBox;
    fldLimiteCredito     : TDBEdit;
    lbllimitecredito     : TLabel;
    btnPrimeiro          : TTISButton;
    btnAnterior          : TTISButton;
    btnProximo           : TTISButton;
    btnUltimo            : TTISButton;
    btnGravar            : TTISButton;
    btnLocalizar         : TTISButton;
    btnExcluir           : TTISButton;
    btnAdicionar         : TTISButton;
    btnAlterar           : TTISButton;
    btnImprimeCliente    : TTISButton;
    btnRetornar          : TTISButton;
    pnlBotoes            : TPanel;
    btnPrimeiroServico   : TSpeedButton;
    btnUltimoServico     : TSpeedButton;
    btnGravarServico     : TSpeedButton;
    SpeedButton3         : TSpeedButton;
    btnDesBaixa          : TSpeedButton;
    SpeedButton4         : TSpeedButton;
    btnAdicionarServico  : TSpeedButton;
    gbMedia              : TGroupBox;
    Label4               : TLabel;
    Label6               : TLabel;
    Label3               : TLabel;
    Label5               : TLabel;
    btnCalcular          : TSpeedButton;
    Label10              : TLabel;
    lblVencidos          : TLabel;
    Label11              : TLabel;
    lblAVencer           : TLabel;
    Label7               : TLabel;
    lblDevido            : TLabel;
    Label8               : TLabel;
    Label9               : TLabel;
    Label12              : TLabel;
    Label13              : TLabel;
    Label14              : TLabel;
    Label26              : TLabel;
    Button1              : TButton;
    edtNPedido           : TEdit;
    Label15              : TLabel;
    Panel1               : TPanel;
    rdbOrdemVenc         : TRadioButton;
    rdbOrdemDoc          : TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPrimeiroServicoClick(Sender: TObject);
    procedure btnUltimoServicoClick(Sender: TObject);
    procedure btnAdicionarServicoClick(Sender: TObject);
    procedure btnGravarServicoClick(Sender: TObject);
    procedure grdContasReceberTitleClick(Column: TColumn);
    procedure fldRPAContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure btnExcluirCRClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rdbOrdemDocClick(Sender: TObject);
    procedure rdbOrdemVencClick(Sender: TObject);
    procedure grdContasReceberColExit(Sender: TObject);
    procedure grdContasReceberKeyPress(Sender: TObject; var Key: Char);
    procedure grdContasReceberColEnter(Sender: TObject);
    procedure btncalculaClick(Sender: TObject);
    procedure btnImprimeClienteClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnDesBaixaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure fldEstadoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formClientes : TformClientes;
    strCNPJAnt : String;

implementation

uses ModuloDados, RotinasGerais, SeekClientes, LocalizaCliente,
     CadastroChequeDinheiro, Contadesconto, Relcadcli;


{$R *.DFM}


procedure TformClientes.FormShow(Sender: TObject);
var FArquivo : TextFile;
    strDados : String;
begin
dmBaseDados.tblClientes.Open;
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblFuncionarios.Open;
dmBaseDados.tblDataCR.Open;
dmBaseDados.tblContasReceber.IndexName := 'IndCodCli';
dmBaseDados.tblClientes.IndexName      := '';
dmBaseDados.tblContasReceberDataPagamento.EditMask := '!99/99/00;1;_';
edtNPedido.Text :='';
AssignFile(FArquivo,'C:\TEMP\ESTADOS.TXT');
Reset(FArquivo);
ReadLn(FArquivo,strDados);
while (not Eof(FArquivo)) do
 begin
  ReadLn(FArquivo,strDados);
 end;
CloseFile(FArquivo);
fldNomeCliente.ReadOnly  := True;
fldNomeFantasia.ReadOnly := True;
fldSituacao.ReadOnly     := True;
fldDataCadastro.ReadOnly := True;
fldEndereco.ReadOnly     := True;
fldNumero.ReadOnly       := True;
fldComplemento.ReadOnly  := True;
fldCidade.ReadOnly       := True;
fldBairro.ReadOnly       := True;
fldEstado.ReadOnly       := True;
fldCEP.ReadOnly          := True;
fldContado.ReadOnly      := True;
fldTelefone.ReadOnly     := True;
fldFax.ReadOnly          := True;
fldEmail.ReadOnly        := True;
fldObs.ReadOnly          := True;
pgClientes.ActivePage    := tabFichaCliente;
fldEmail.SetFocus;
if (dmBaseDados.tblClientes.RecordCount = 0) then
 begin
  dmBaseDados.tblClientes.Append;
 end;
fldEmail.SetFocus;
Label3.Caption := FloatToStrF(0,ffCurrency,10,2);
Label4.Caption := FloatToStrF(0,ffCurrency,10,2);
end;

procedure TformClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblDataCR.Close;
dmBaseDados.tblCidades.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblFuncionarios.Close;
dmBaseDados.tblContasReceber.Close;
end;

procedure TformClientes.btnPrimeiroClick(Sender: TObject);
begin
dmBaseDados.tblClientes.First;
Label3.Caption := FloatToStrF(0,ffCurrency,10,2);
Label4.Caption := FloatToStrF(0,ffCurrency,10,2);
end;

procedure TformClientes.btnAnteriorClick(Sender: TObject);
begin
dmBaseDados.tblClientes.Prior;
if (dmBaseDados.tblClientes.Bof) then
 begin
  InicioTabela;
  dmBaseDados.tblClientes.First;
 end;
Label3.Caption := FloatToStrF(0,ffCurrency,10,2);
Label4.Caption := FloatToStrF(0,ffCurrency,10,2);
end;

procedure TformClientes.btnProximoClick(Sender: TObject);
begin
dmBaseDados.tblClientes.Next;
if (dmBaseDados.tblClientes.Eof) then
 begin
  FimTabela;
  dmBaseDados.tblClientes.Last;
 end;
Label3.Caption := FloatToStrF(0,ffCurrency,10,2);
Label4.Caption := FloatToStrF(0,ffCurrency,10,2);
end;

procedure TformClientes.btnUltimoClick(Sender: TObject);
begin
dmBaseDados.tblClientes.Last;
Label3.Caption := FloatToStrF(0,ffCurrency,10,2);
Label4.Caption := FloatToStrF(0,ffCurrency,10,2);
end;

procedure TformClientes.btnGravarClick(Sender: TObject);
var  strCNPJ, strCodCli : String;
begin
strCNPJAnt := dmBaseDados.tblClientesNumeroCIC.AsString;
strCodCli  := dmBaseDados.tblClientesCodigoCliente.AsString;
dmBaseDados.tblClientes.Post;
btnGravar.Enabled := False;
strCNPJ := dmBaseDados.tblClientesNumeroCIC.AsString;
if (strCNPJ <> strCNPJAnt) then
  Begin
   dmBaseDados.tblClientes.Close;
   dmBaseDados.tblContasReceber.Close;
   dmBaseDados.tblContasReceber.Open;
   dmBaseDados.tblContasReceber.IndexName := 'indCNPJCPF';
   dmBaseDados.tblContasReceber.FindKey([strCNPJAnt]);
   while (not dmBaseDados.tblContasReceber.Eof)and(strCNPJAnt = dmBaseDados.tblContasReceberNumeroCIC.AsString) do
    begin
     dmBaseDados.tblContasReceber.Edit;
     dmBaseDados.tblContasReceberNumeroCIC.AsString := strCNPJ;
     dmBaseDados.tblContasReceber.Post;
     dmBaseDados.tblContasReceber.FindKey([strCNPJAnt]);
    end;
   dmBaseDados.tblClientes.Open;
   dmBaseDados.tblClientes.IndexName := 'IndCodCli';
   dmBaseDados.tblClientes.FindKey([strCodCli]);
  End;
end;

procedure TformClientes.btnLocalizarClick(Sender: TObject);
begin
formSeekClientes.ShowModal;
end;

procedure TformClientes.btnExcluirClick(Sender: TObject);
begin
dmBaseDados.tblClientes.Delete;
end;

procedure TformClientes.btnAdicionarClick(Sender: TObject);
begin
formLocalizaCliente.ShowModal;
fldEmail.SetFocus;
end;

procedure TformClientes.btnRetornarClick(Sender: TObject);
begin
if( (dmBaseDados.tblClientes.State = dsEdit)or(dmBaseDados.tblClientes.State = dsInsert) )then
 begin
  if (Confirma('Há dados que não foram gravados !'+#13+'Grava alterações antes de fechar?') = IDYES) then
   begin
    dmBaseDados.tblClientes.Post;
    Close;
   end;
 end
else
 Close;
end;

procedure TformClientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 1, 0);
 end;
end;

procedure TformClientes.btnPrimeiroServicoClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.First;
pgClientes.ActivePage := tabContasReceber;
grdContasReceber.SetFocus;
end;

procedure TformClientes.btnUltimoServicoClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Last;
pgClientes.ActivePage := tabContasReceber;
grdContasReceber.SetFocus;
end;

procedure TformClientes.btnAdicionarServicoClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Append;
pgClientes.ActivePage := tabContasReceber;
grdContasReceber.SetFocus;
end;

procedure TformClientes.btnGravarServicoClick(Sender: TObject);
var strNumeroDocumento, strNumeroCIC, strParcelas,
    strCliente, strFormaPgto, strLocalPgto, strObs,
    strVendedor, strMotorista, strStatus : String;
    strNF, strVDocumento, strVDinheiro, strVCheque,
    strVTotal, strDiferenca, strCodCli,strTroco,
    strDiasAtraso, strRestante, strJuros : Double;
    strDataE, strDataV, strDataBaixa, strDataPgto,
    Vencimento, Pagamento, Dias : TDateTime;
    Ano, Mes, Dia : Word;
begin
strCodCli := dmBaseDados.tblClientesCodigoCliente.AsFloat;
dmBaseDados.tblContasReceber.Edit;
if (dmBaseDados.tblContasReceberDataPagamento.Value <> Pagamento) then
 begin
  Vencimento := StrToDate(dmBaseDados.tblContasReceberDataVencimento.Text);
  DecodeDate(Vencimento, Ano, Mes, Dia);
  Pagamento  := StrToDate(dmBaseDados.tblContasReceberDataPagamento.Text);
  DecodeDate(Pagamento, Ano, Mes, Dia);
  Dias       := Pagamento - Vencimento;
  DecodeDate(Dias, Ano, Mes, Dia);
  dmBaseDados.tblContasReceberDiasAtraso.Value := Dias;
  dmBaseDados.tblContasReceberStatus.AsString  := '1';
  dmBaseDados.tblDataCR.Edit;
  dmBaseDados.tblDataCRData.AsDateTime := dmBaseDados.tblContasReceberDataPagamento.AsDateTime;
  dmBaseDados.tblDataCR.Post;
 end;
dmBaseDados.tblContasReceberCodCli.AsFloat       := dmBaseDados.tblClientesCodigoCliente.AsFloat ;
dmBaseDados.tblContasReceberDiferenca.AsCurrency := dmBaseDados.tblContasReceberValorTotal.AsCurrency - dmBaseDados.tblContasReceberValorDocumento.AsCurrency;
dmBaseDados.tblContasReceber.Post;
if (dmBaseDados.tblContasReceberDiferenca.AsCurrency < 0) then
  Begin
   if (Application.MessageBox('Gravar Restante(OK), Desconto(cancelar)?','Gravar Restante?',MB_OKCANCEL) = IDOK) then
     Begin
      grdContasReceber.Columns[17].ReadOnly := true;
      dmBaseDados.tblContasReceber.Edit;
      dmBaseDados.tblContasReceberRestante.AsCurrency := dmBaseDados.tblContasReceberDiferenca.AsCurrency;
      dmBaseDados.tblContasReceber.Post;
      strNumeroDocumento := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
      strNumeroCIC       := dmBaseDados.tblContasReceberNumeroCIC.AsString;
      strParcelas        := dmBaseDados.tblContasReceberParcelas.AsString;
      strNF              := dmBaseDados.tblContasReceberNumeroNF.AsFloat;
      strCodCli          := dmBaseDados.tblContasReceberCodCli.AsFloat;
      strCliente         := dmBaseDados.tblContasReceberCliente.AsString;
      strDataE           := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
      strDataV           := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
      // strDataBaixa       := dmBaseDados.tblContasReceberDataBaixa.AsDateTime;
      strFormaPgto       := dmBaseDados.tblContasReceberFormaPagamento.AsString;
      strVDocumento      := dmBaseDados.tblContasReceberRestante.AsFloat;
      //strVDinheiro       := dmBaseDados.tblContasReceberValorDinheiro.AsFloat;
      //strVCheque         := dmBaseDados.tblContasReceberValorCheque.AsFloat;
      //strVTotal          := dmBaseDados.tblContasReceberValorTotal.AsFloat;
      //strDiferenca       := dmBaseDados.tblContasReceberDiferenca.AsFloat;
      //strTroco           := dmBaseDados.tblContasReceberTroco.AsFloat;
      strLocalPgto       := dmBaseDados.tblContasReceberLocalPagamento.AsString;
      //strDataPgto        := dmBaseDados.tblContasReceberDataPagamento.AsDateTime;
      strDiasAtraso      := dmBaseDados.tblContasReceberDiasAtraso.AsFloat;
      strVendedor        := dmBaseDados.tblContasReceberVendedor.AsString;
      strMotorista       := dmBaseDados.tblContasReceberMotorista.AsString;
      dmBaseDados.tblContasReceber.Append;
      dmBaseDados.tblContasReceberNumeroDocumento.AsString  := 'R'+strNumeroDocumento;
      dmBaseDados.tblContasReceberNumeroCIC.AsString        := strNumeroCIC;
      dmBaseDados.tblContasReceberParcelas.AsString         := strParcelas + 'R';
      dmBaseDados.tblContasReceberNumeroNF.AsFloat          := strNF;
      dmBaseDados.tblContasReceberCodCli.AsFloat            := strCodCli;
      dmBaseDados.tblContasReceberCliente.AsString          := strCliente;
      dmBaseDados.tblContasReceberDataEmissao.AsDateTime    := strDataE;
      dmBaseDados.tblContasReceberDataVencimento.AsDateTime := strDataV;
      dmBaseDados.tblContasReceberFormaPagamento.AsString   := strFormaPgto;
      dmBaseDados.tblContasReceberValorDocumento.AsFloat    := (strVDocumento*(-1));
      dmBaseDados.tblContasReceberLocalPagamento.AsString   := strLocalPgto;
      dmBaseDados.tblContasReceberDiasAtraso.AsFloat        := strDiasAtraso;
      dmBaseDados.tblContasReceberVendedor.AsString         := strVendedor;
      dmBaseDados.tblContasReceberMotorista.AsString        := strMotorista;
      dmBaseDados.tblContasReceber.Post;
     End
   else
     Begin
      dmBaseDados.tblContasReceber.Edit;
      if (dmBaseDados.tblContasReceberFormaPagamento.AsString = 'CT -') then
       begin
        dmBaseDados.tblContasReceberDescontoCT.AsFloat := ((dmBaseDados.tblContasReceberValorDocumento.AsFloat * dmBaseDados.tblContasReceberDesconto.AsFloat)/100);
        dmBaseDados.tblContasReceberValorDesc.AsFloat  := 0;
       end
      else
       begin
        dmBaseDados.tblContasReceberValorDesc.AsFloat  := ((dmBaseDados.tblContasReceberValorDocumento.AsFloat * dmBaseDados.tblContasReceberDesconto.AsFloat)/100);
        dmBaseDados.tblContasReceberDescontoCT.AsFloat := 0;
       end;
      dmBaseDados.tblContasReceber.Post;
     End;
  End
Else
  Begin
   if (dmBaseDados.tblContasReceberDataPagamento.AsDateTime <= dmBaseDados.tblContasReceberDataVencimento.AsDateTime) then
    begin
     if (Application.MessageBox('Gravar diferença em Troco?!?!','Gravar em Troco??',MB_OKCANCEL)) = IDOK then
      begin
       dmBaseDados.tblContasReceber.Edit;
       dmBaseDados.tblContasReceberTroco.AsCurrency := dmBaseDados.tblContasReceberDiferenca.AsCurrency;
       dmBaseDados.tblContasReceber.Post;
      end;
    end;
   if (dmBaseDados.tblContasReceberDataPagamento.AsDateTime > dmBaseDados.tblContasReceberDataVencimento.AsDateTime) then
    begin
     if (Application.MessageBox('Juros em Cobrança(OK) ou Carteira(Cancelar)?!?!','Cobrança ou Carteira??',MB_OKCANCEL) = IDOK) then
      begin
       dmBaseDados.tblContasReceber.Edit;
       dmBaseDados.tblContasReceberJuros.AsCurrency := dmBaseDados.tblContasReceberDiferenca.AsCurrency;
       dmBaseDados.tblContasReceber.Post;
      end
     else
      begin
       dmBaseDados.tblContasReceber.Edit;
       dmBaseDados.tblContasReceberJurosCT.AsCurrency := dmBaseDados.tblContasReceberDiferenca.AsCurrency;
       dmBaseDados.tblContasReceber.Post;
      end;
    end;
  End;
dmBaseDados.tblContasReceber.Edit;
dmBaseDados.tblContasReceberNumeroCIC.AsString := dmBaseDados.tblClientesNumeroCIC.AsString;
dmBaseDados.tblContasReceberCliente.AsString   := dmBaseDados.tblClientesNomeCliente.AsString;
dmBaseDados.tblContasReceber.Post;
pgClientes.ActivePage := tabContasReceber;
grdContasReceber.SetFocus;
end;

procedure TformClientes.grdContasReceberTitleClick(Column: TColumn);
begin
strNPedChq := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
strParcela := dmBaseDados.tblContasReceberParcelas.AsString;
FormCadastroChequesDinheiro.ShowModal;
dmBaseDados.tblContasReceberValorTotal.AsCurrency := dmBaseDados.tblContasReceberValorCheque.AsCurrency + dmBaseDados.tblContasReceberValorDinheiro.AsCurrency;
end;

procedure TformClientes.fldRPAContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
if (dmBaseDados.tblClientesTipoCliente.AsString = 'LTDA') then
 begin
  dmBaseDados.tblClientesRPA.AsString := 'SIM';
 end;
end;

procedure TformClientes.btnExcluirCRClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Delete;
end;

procedure TformClientes.Button1Click(Sender: TObject);
begin
if (dmBaseDados.tblContasReceber.Locate('NumeroDocumento',edtNPedido.Text,[LOCASEINSENSITIVE]) = False) then
 begin
  ShowMessage('Documento Não encontrado!!!');
 end;
grdContasReceber.SetFocus;
end;

procedure TformClientes.rdbOrdemDocClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.IndexName := 'indCNPJCPF';
end;

procedure TformClientes.rdbOrdemVencClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.IndexName := 'IndOrdemVenc';
end;

procedure TformClientes.grdContasReceberColExit(Sender: TObject);
var Branco : TDateTime;
begin
Branco := dmBaseDados.tblContasReceberDtBranco.AsDateTime;
if( (dmBaseDados.tblContasReceberDataPagamento.AsDateTime <> Branco)
and (dmBaseDados.tblContasReceberStatus.AsString = '') )then
 Begin
  if( (dmBaseDados.tblContasReceberDataPagamento.AsDateTime < dmBaseDados.tblDataCRData.AsDateTime)
  and (dmBaseDados.tblContasReceberDataPagamento.AsDateTime <> Branco) )then
   begin
    ShowMessage('DATA MENOR QUE A ÚLTIMA');
    dmBaseDados.tblContasReceberDataPagamento.EditMask := '';
    dmBaseDados.tblContasReceber.Edit;
    dmBaseDados.tblContasReceberDataPagamento.AsString := '';
    dmBaseDados.tblContasReceber.Post;
    dmBaseDados.tblContasReceberDataPagamento.EditMask := '!99/99/00;1;_';
   end;
 End;
end;

procedure TformClientes.grdContasReceberKeyPress(Sender: TObject; var Key: Char);
begin
if (dmBaseDados.tblContasReceberValorDocumento.AsString = '') then
 begin
  grdContasReceber.Columns[4].ReadOnly := false;
 end
else
 begin
  grdContasReceber.Columns[4].ReadOnly := true;
 end;
if (dmBaseDados.tblContasReceberValorTotal.AsString = '') then
 begin
  grdContasReceber.Columns[11].ReadOnly := true;
 end
else
 begin
  grdContasReceber.Columns[11].ReadOnly := false;
 end;
end;

procedure TformClientes.grdContasReceberColEnter(Sender: TObject);
begin
formContadesconto.ShowModal;
end;

procedure TformClientes.btncalculaClick(Sender: TObject);
var Soma, strdiv, Resultado,
    strmesdiv, Somames, Resultado2,
    mes1, mes2, mes3, mes4, mes5, mes6,
    mes7, mes8, mes9, mes10, mes11, mes12,
    strdiv1, strdiv2, strdiv3, strdiv4,
    strdiv5, strdiv6, strdiv7, strdiv8,
    strdiv9, strdiv10, strdiv11, strdiv12,
    mediames1, mediames2, mediames3, mediames4,
    mediames5, mediames6, mediames7, mediames8,
    mediames9, mediames10, mediames11, mediames12 : Double;
begin
dmBaseDados.tblContasReceber.Refresh;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
Soma      := 0;
strdiv    := 0;
Resultado := 0;
mes1      := 0;
mes2      := 0;
mes3      := 0;
mes4      := 0;
mes5      := 0;
mes6      := 0;
mes7      := 0;
mes8      := 0;
mes9      := 0;
mes10     := 0;
mes11     := 0;
mes12     := 0;
strdiv1   := 0;
strdiv2   := 0;
strdiv3   := 0;
strdiv4   := 0;
strdiv5   := 0;
strdiv6   := 0;
strdiv7   := 0;
strdiv8   := 0;
strdiv9   := 0;
strdiv10  := 0;
strdiv11  := 0;
strdiv12  := 0;
strmesdiv := 0;
mediames1 := 0;
mediames2 := 0;
mediames3 := 0;
mediames4 := 0;
mediames5 := 0;
mediames6 := 0;
mediames7 := 0;
mediames8 := 0;
mediames9 := 0;
mediames10 := 0;
mediames11 := 0;
mediames12 := 0;
Resultado2 := 0;
dmBaseDados.tblLogMensal.Edit;
while (not dmBaseDados.tblContasReceber.Eof) do
  Begin
   // Soma por Mês
   dmBaseDados.tblLogMensalUnidadeMedida.AsString := Copy(dmBaseDados.tblContasReceberDataEmissao.AsString,4,5);
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '01') then
    begin
     mes1    := mes1 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv1 := strdiv1 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '02') then
    begin
     mes2    := mes2 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv2 := strdiv2 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '03') then
    begin
     mes3    := mes3 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv3 := strdiv3 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '04') then
    begin
     mes4    := mes4 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv4 := strdiv4 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '05') then
    begin
     mes5    := mes5 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv5 := strdiv5 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '06') then
    begin
     mes6    := mes6 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv6 := strdiv6 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '07') then
    begin
     mes7    := mes7 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv7 := strdiv7 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '08') then
    begin
     mes8    := mes8 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv8 := strdiv8 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '09') then
    begin
     mes9    := mes9 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv9 := strdiv9 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '10') then
    begin
     mes10    := mes10 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv10 := strdiv10 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '11') then
    begin
     mes11    := mes11 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv11 := strdiv11 + 1 ;
    end;
   if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '12') then
    begin
     mes12 := mes12 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv12 := strdiv12 + 1 ;
    end;
   // Soma por pedido
   if (Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,1) = '1') then
    begin
     Soma := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     strdiv := strdiv + 1;
    end
   else
    begin
     Soma := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
    end;
   dmBaseDados.tblContasReceber.Next;
  End;
//--
Resultado      := (Soma/strdiv);
Label3.Caption := FloatToStrF(Resultado,ffCurrency,10,2);
if (mes1 <> 0) then
 begin
  mediames1 := (mes1/strdiv1);
  strmesdiv := strmesdiv + 1;
 end;
if (mes2 <> 0) then
 begin
  mediames2 := (mes2/strdiv2);
  strmesdiv := strmesdiv + 1;
 end;
if (mes3 <> 0) then
 begin
  mediames3 := (mes3/strdiv3);
  strmesdiv := strmesdiv + 1;
 end;
if (mes4 <> 0) then
 begin
  mediames4 := (mes4/strdiv4);
  strmesdiv := strmesdiv + 1;
 end;
if (mes5 <> 0) then
 begin
  mediames5 := (mes5/strdiv5);
  strmesdiv := strmesdiv + 1;
 end;
if (mes6 <> 0) then
 begin
  mediames6 := (mes6/strdiv6);
  strmesdiv := strmesdiv + 1;
 end;
if (mes7 <> 0) then
 begin
  mediames7 := (mes7/strdiv7);
  strmesdiv := strmesdiv + 1;
 end;
if (mes8 <> 0) then
 begin
  mediames8 := (mes8/strdiv8);
  strmesdiv := strmesdiv + 1;
 end;
if (mes9 <> 0) then
 begin
  mediames9 := (mes9/strdiv9);
  strmesdiv := strmesdiv + 1;
 end;
if (mes10 <> 0) then
 begin
  mediames10 := (mes10/strdiv10);
  strmesdiv  := strmesdiv + 1;
 end;
if (mes11 <> 0) then
 begin
  mediames11 := (mes11/strdiv11);
  strmesdiv  := strmesdiv + 1;
 end;
if (mes12 <> 0) then
 begin
  mediames12 := (mes12/strdiv12);
  strmesdiv  := strmesdiv + 1;
 end;
//--
Somames := mediames1 + mediames2 + mediames3 + mediames4 + mediames5 + mediames6 + mediames7 + mediames8 + mediames9 + mediames10 + mediames11 + mediames12;
Resultado2 := (Somames/strmesdiv);
Label4.Caption := FloatToStrF(Resultado2,ffCurrency,10,2);
dmBaseDados.tblLogMensal.Post;
dmBaseDados.tblLogMensal.Close;
end;

procedure TformClientes.btnImprimeClienteClick(Sender: TObject);
begin
FormRelcadcli.QrCliente.Preview;
end;

procedure TformClientes.btnAlterarClick(Sender: TObject);
begin
fldNomeCliente.ReadOnly  := False;
fldNomeFantasia.ReadOnly := False;
fldSituacao.ReadOnly     := False;
fldDataCadastro.ReadOnly := False;
fldEndereco.ReadOnly     := False;
fldNumero.ReadOnly       := False;
fldComplemento.ReadOnly  := False;
fldCidade.ReadOnly       := False;
fldBairro.ReadOnly       := False;
fldEstado.ReadOnly       := False;
fldCEP.ReadOnly          := False;
fldContado.ReadOnly      := False;
fldTelefone.ReadOnly     := False;
fldFax.ReadOnly          := False;
fldEmail.ReadOnly        := False;
fldObs.ReadOnly          := False;
btnGravar.Enabled  := True;
btnExcluir.Enabled := True;

end;

procedure TformClientes.SpeedButton2Click(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Delete;
end;

procedure TformClientes.SpeedButton3Click(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Delete;
end;

procedure TformClientes.btnDesBaixaClick(Sender: TObject);
begin
if (Application.MessageBox('Desfazer Baixa?','Confirma?',MB_YESNO) = IDYES) then
 begin
  dmBaseDados.tblContasReceber.Edit;
  dmBaseDados.tblContasReceberDataPagamento.AsString := '';
  dmBaseDados.tblContasReceberStatus.AsString        := '';
  dmBaseDados.tblContasReceberValorTotal.AsString    := '';
  dmBaseDados.tblContasReceberValorDinheiro.AsString := '';
  dmBaseDados.tblContasReceberValorCheque.AsString   := '';
  dmBaseDados.tblContasReceber.Post;
 end;
end;

procedure TformClientes.SpeedButton4Click(Sender: TObject);
begin
Close;
end;

procedure TformClientes.btnCalcularClick(Sender: TObject);
var strdiv1, strdiv2, strdiv3, strdiv4,
    strdiv5, strdiv6, strdiv7, strdiv8,
    strdiv9, strdiv10, strdiv11, strdiv12,
    mes1, mes2, mes3, mes4, mes5, mes6,
    mes7, mes8, mes9, mes10, mes11, mes12,
    mediames1, mediames2, mediames3, mediames4,
    mediames5, mediames6, mediames7, mediames8,
    mediames9, mediames10, mediames11, mediames12,
    strmesdiv, Somames, Resultado2, fltTotalVencido,
    Soma, strdiv, Resultado, fltTAVencer, fltTDevido : Double;
    wrdDia, wrdMes, wrdAno : Word;
begin
DecodeDate(Date,wrdAno,WrdMes,WrdDia);
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblContasReceber.Refresh;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
fltTotalVencido := 0;
fltTAVencer := 0;
fltTDevido := 0;
Soma       := 0;
strdiv     := 0;
Resultado  := 0;
mes1       := 0;
mes2       := 0;
mes3       := 0;
mes4       := 0;
mes5       := 0;
mes6       := 0;
mes7       := 0;
mes8       := 0;
mes9       := 0;
mes10      := 0;
mes11      := 0;
mes12      := 0;
strdiv1    := 0;
strdiv2    := 0;
strdiv3    := 0;
strdiv4    := 0;
strdiv5    := 0;
strdiv6    := 0;
strdiv7    := 0;
strdiv8    := 0;
strdiv9    := 0;
strdiv10   := 0;
strdiv11   := 0;
strdiv12   := 0;
strmesdiv  := 0;
mediames1  := 0;
mediames2  := 0;
mediames3  := 0;
mediames4  := 0;
mediames5  := 0;
mediames6  := 0;
mediames7  := 0;
mediames8  := 0;
mediames9  := 0;
mediames10 := 0;
mediames11 := 0;
mediames12 := 0;
Resultado2 := 0;
dmBaseDados.tblLogMensal.Edit;
dmBaseDados.tblContasReceber.First;
while (not dmBaseDados.tblContasReceber.Eof) do
  BEGIN
   //Soma por Mês...----------------------------------------------------------------------------------------------------------------
   dmBaseDados.tblLogMensalUnidadeMedida.AsString := Copy(dmBaseDados.tblContasReceberDataEmissao.AsString,4,2);
   if (dmBaseDados.tblContasReceberDataEmissao.AsString <> '') then
    Begin
     if( (wrdMes = 1)or(wrdMes = 2)or(wrdMes = 3) )then
       Begin
        if( (StrToInt(Copy(dmBaseDados.tblContasReceberDataEmissao.AsString,7,4)) = wrdAno)
        and (dmBaseDados.tblContasReceberValorDocumento.AsFloat > 0)
        and (dmBaseDados.tblContasReceberParcelas.AsString <> '') )then
         Begin
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '01') then
           begin
            mes1    := mes1 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv1 := strdiv1 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '02') then
           begin
            mes2    := mes2 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv2 := strdiv2 + 1 ;
           end;
          //Soma por pedido...---------------------------------------------------------------------------|
          if (Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,2) = '01') then
           begin
            Soma   := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv := strdiv + 1;
           end
          else
           begin
            Soma := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
           end;
         End;
        if( (StrToInt(Copy(dmBaseDados.tblContasReceberDataEmissao.AsString,7,4)) = wrdAno-1)
        and (dmBaseDados.tblContasReceberValorDocumento.AsFloat > 0)
        and (dmBaseDados.tblContasReceberParcelas.AsString <> '') )then
         Begin
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '10') then
           begin
            mes10    := mes10 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv10 := strdiv10 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '11') then
           begin
            mes11    := mes11 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv11 := strdiv11 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '12') then
           begin
            mes12    := mes12 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv12 := strdiv12 + 1 ;
           end;
          //Soma por pedido...---------------------------------------------------------------------------|
          if (Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,2) = '01') then
           begin
            Soma   := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv := strdiv + 1;
           end
          else
           begin
            Soma := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
           end;
         End;
       End
     Else
       Begin
        if( (StrToInt(Copy(dmBaseDados.tblContasReceberDataEmissao.AsString,7,4)) = wrdAno)
        and (dmBaseDados.tblContasReceberValorDocumento.AsFloat > 0)
        and (dmBaseDados.tblContasReceberParcelas.AsString <> '') )then
         Begin
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '01') then
           begin
            mes1    := mes1 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv1 := strdiv1 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '02') then
           begin
            mes2    := mes2 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv2 := strdiv2 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '03') then
           begin
            mes3    := mes3 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv3 := strdiv3 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '04') then
           begin
            mes4    := mes4 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv4 := strdiv4 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '05') then
           begin
            mes5    := mes5 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv5 := strdiv5 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '06') then
           begin
            mes6    := mes6 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv6 := strdiv6 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '07') then
           begin
            mes7    := mes7 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv7 := strdiv7 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '08') then
           begin
            mes8    := mes8 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv8 := strdiv8 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '09') then
           begin
            mes9    := mes9 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv9 := strdiv9 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '10') then
           begin
            mes10    := mes10 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv10 := strdiv10 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '11') then
           begin
            mes11    := mes11 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv11 := strdiv11 + 1 ;
           end;
          if (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '12') then
           begin
            mes12    := mes12 + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv12 := strdiv12 + 1 ;
           end;
          //Soma por pedido...---------------------------------------------------------------------------|
          if (Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,2) = '01') then
           begin
            Soma   := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
            strdiv := strdiv + 1;
           end
          else
           begin
            Soma := Soma + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
           end;
         End;
       End;
    End;
   dmBaseDados.tblContasReceber.Next;
   //---------------------------------------------------------------------------------------------
  END;
if (strdiv > 0) then
 begin
  Resultado := (Soma/strdiv);
 end;
Label3.Caption := FloatToStrF(Resultado,ffCurrency,10,2);
if (mes1 <> 0) then
 begin
  mediames1 := (mes1/strdiv1);
  strmesdiv := strmesdiv + 1;
 end;
if (mes2 <> 0) then
 begin
  mediames2 := (mes2/strdiv2);
  strmesdiv := strmesdiv + 1;
 end;
if (mes3 <> 0) then
 begin
  mediames3 := (mes3/strdiv3);
  strmesdiv := strmesdiv + 1;
 end;
if (mes4 <> 0) then
 begin
  mediames4 := (mes4/strdiv4);
  strmesdiv := strmesdiv + 1;
 end;
if (mes5 <> 0) then
 begin
  mediames5 := (mes5/strdiv5);
  strmesdiv := strmesdiv + 1;
 end;
if (mes6 <> 0) then
 begin
  mediames6 := (mes6/strdiv6);
  strmesdiv := strmesdiv + 1;
 end;
if (mes7 <> 0) then
 begin
  mediames7 := (mes7/strdiv7);
  strmesdiv := strmesdiv + 1;
 end;
if (mes8 <> 0) then
 begin
  mediames8 := (mes8/strdiv8);
  strmesdiv := strmesdiv + 1;
 end;
if (mes9 <> 0) then
 begin
  mediames9 := (mes9/strdiv9);
  strmesdiv := strmesdiv + 1;
 end;
if (mes10 <> 0) then
 begin
  mediames10 := (mes10/strdiv10);
  strmesdiv  := strmesdiv + 1;
 end;
if (mes11 <> 0) then
 begin
  mediames11 := (mes11/strdiv11);
  strmesdiv  := strmesdiv + 1;
 end;
if (mes12 <> 0) then
 begin
  mediames12 := (mes12/strdiv12);
  strmesdiv  := strmesdiv + 1;
 end;
//Somames := mediames1 + mediames2 + mediames3 + mediames4 + mediames5 + mediames6 + mediames7 + mediames8 + mediames9 + mediames10 + mediames11 + mediames12;
Somames   := mes1 + mes2 + mes3 + mes4 + mes5 + mes6 + mes7 + mes8 + mes9 + mes10 + mes11 + mes12;
strmesdiv := 3;
//Média dos últimos 3 meses:
if (wrdMes = 1) then
 begin
  Somames := mes10 + mes11 + mes12;
 end;
if (wrdMes = 2) then
 begin
  Somames := mes11 + mes12 + mes1;
 end;
if (wrdMes = 3) then
 begin
  Somames := mes12 + mes1 + mes2;
 end;
if (wrdMes = 4) then
 begin
  Somames := mes1 + mes2 + mes3;
 end;
if (wrdMes = 5) then
 begin
  Somames := mes2 + mes3 + mes4;
 end;
if (wrdMes = 6) then
 begin
  Somames := mes3 + mes4 + mes5;
 end;
if (wrdMes = 7) then
 begin
  Somames := mes4 + mes5 + mes6;
 end;
if (wrdMes = 8) then
 begin
  Somames := mes5 + mes6 + mes7;
 end;
if (wrdMes = 9) then
 begin
  Somames := mes6 + mes7 + mes8;
 end;
if (wrdMes = 10) then
 begin
  Somames := mes7 + mes8 + mes9;
 end;
if (wrdMes = 11) then
 begin
  Somames := mes8 + mes9 + mes10;
 end;
if (wrdMes = 12) then
 begin
  Somames := mes9 + mes10 + mes11;
 end;
//Média de todos os meses:
{if (mediames1 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames2 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames3 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames4 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames5 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames6 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames7 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames8 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames9 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames10 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames11 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;
if (mediames12 > 0) then
 begin
  strmesdiv := strmesdiv +1;
 end;}
Resultado2     := (Somames/strmesdiv);
Label4.Caption := FloatToStrF(Resultado2,ffCurrency,10,2);
dmBaseDados.tblLogMensal.Post;
dmBaseDados.tblLogMensal.Close;
fltTotalVencido := 0;
fltTAVencer     := 0;
dmBaseDados.tblContasReceber.First;
while (not dmBaseDados.tblContasReceber.Eof) do
  Begin
   if( (dmBaseDados.tblContasReceberDataVencimento.AsDateTime <  Date)
   and (dmBaseDados.tblContasReceberStatus.AsString = '') )then
    begin
     fltTotalVencido := fltTotalVencido + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
    end;
   if( (dmBaseDados.tblContasReceberDataVencimento.AsDateTime >= Date)
   and (dmBaseDados.tblContasReceberStatus.AsString = '') )then
    begin
     fltTAVencer := fltTAVencer + dmBaseDados.tblContasReceberValorDocumento.AsFloat;
    end;
   dmBaseDados.tblContasReceber.Next;
  End;
fltTDevido := fltTAVencer + fltTotalVencido;
lblAVencer.Caption  := FloatToStrF(fltTAVencer,ffCurrency,10,2);
lblVencidos.Caption := FloatToStrF(fltTotalVencido,ffCurrency,10,2);
lblDevido.Caption   := FloatToStrF(fltTDevido,ffCurrency,10,2);
end;

procedure TformClientes.fldEstadoExit(Sender: TObject);
var strCidade, strEstado : String;
begin
strCidade := dmBaseDados.tblClientesCidade.AsString;
strEstado := dmBaseDados.tblClientesEstado.AsString;
dmBaseDados.tblCidades.Open;
dmBaseDados.tblCidades.First;
if (dmBaseDados.tblCidades.Locate('Cidade;Estado',VarArrayOf([strCidade,strEstado]),[loCaseInsensitive]) = True) then
 begin
  dmBaseDados.tblClientes.Edit;
  dmBaseDados.tblClientesCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
  dmBaseDados.tblClientes.Post;
 end
else
 begin
  ShowMessage('ATENÇÃO! Verifique o nome da cidade! Não digitar acentuação e não abreviar!');
  fldCidade.SetFocus;
 end;
end;

end.


