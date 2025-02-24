unit GerarBoleto;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, gbCobranca, ExtCtrls, db, Buttons, Mask, DBCtrls, DBTables,
     Grids, DBGrids, TISButton, TIComponent, TIBalloonHint, TIGradient, jpeg;

type
  TformBoleto = class(TForm)
    pnlBoleto: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    butVisualizar: TButton;
    butImprimir: TButton;
    txtCodigoBanco: TEdit;
    txtNossoNumero: TEdit;
    txtNomeBanco: TEdit;
    txtDigitoNossoNumero: TEdit;
    gbTitulo1: TgbTitulo;
    gbCobranca1: TgbCobranca;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    lblCliente: TLabel;
    lbldatavencimento: TLabel;
    lblDataemissao: TLabel;
    lblvalordoc: TLabel;
    edtEmissao: TEdit;
    edtCliente: TEdit;
    edtVencimento: TEdit;
    dbeValor: TDBEdit;
    pnlRemessaRetorno: TPanel;
    lblNomeArquivoRemessa: TLabel;
    lblNomeArquivoRetorno: TLabel;
    txtNomeArquivoRemessa: TEdit;
    butProcurarRemessa: TButton;
    txtNomeArquivoRetorno: TEdit;
    butProcurarRetorno: TButton;
    butGerarRemessa: TButton;
    butLerRetorno: TButton;
    rdgLayoutArquivoRemessa: TRadioGroup;
    GroupBox1: TGroupBox;
    txtRelatorioRetorno: TMemo;
    btnBusca: TTISButton;
    dbgContasReceber: TDBGrid;
    btnOK: TTISButton;
    btnImprimir: TTISButton;
    btnLimpar: TTISButton;
    TISButton1: TTISButton;
    TIBalloonHint1: TTIBalloonHint;
    TIGradient1: TTIGradient;
    Label6: TLabel;
    procedure txtCodigoBancoExit(Sender: TObject);
    procedure txtNossoNumeroExit(Sender: TObject);
    procedure butVisualizarClick(Sender: TObject);
    procedure butImprimirClick(Sender: TObject);
    procedure butProcurarRemessaClick(Sender: TObject);
    procedure butGerarRemessaClick(Sender: TObject);
    procedure butProcurarRetornoClick(Sender: TObject);
    procedure butLerRetornoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnBuscaClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure txtNossoNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure dbgContasReceberCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formBoleto: TformBoleto;

implementation

uses ModuloDados, NotaFiscal, RotinasGerais;


{$R *.DFM}


procedure TformBoleto.txtCodigoBancoExit(Sender: TObject);
begin
gbTitulo1.Cedente.ContaBancaria.Banco.Codigo := txtCodigoBanco.Text;
txtNomeBanco.Text := gbTitulo1.Cedente.ContaBancaria.Banco.Nome;
end;

procedure TformBoleto.txtNossoNumeroExit(Sender: TObject);
begin
gbTitulo1.NossoNumero     := txtNossoNumero.Text +'0' +Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,1);
txtDigitoNossoNumero.Text := gbTitulo1.DigitoNossoNumero;
edtCliente.SetFocus;
end;

procedure TformBoleto.butVisualizarClick(Sender: TObject);
begin
gbTitulo1.Visualizar;
end;

procedure TformBoleto.butImprimirClick(Sender: TObject);
begin
gbTitulo1.Imprimir;
end;

procedure TformBoleto.butProcurarRemessaClick(Sender: TObject);
begin
SaveDialog1.FileName   := txtNomeArquivoRemessa.Text;
SaveDialog1.InitialDir := ExtractFilePath(txtNomeArquivoRemessa.Text);
if (SaveDialog1.Execute) then
 txtNomeArquivoRemessa.Text := SaveDialog1.FileName;
end;

procedure TformBoleto.butGerarRemessaClick(Sender: TObject);
begin
gbCobranca1.Titulos.Clear;
if trim(txtNomeArquivoRemessa.Text) = '' then
 if SaveDialog1.Execute then
  txtNomeArquivoRemessa.Text := SaveDialog1.FileName
 else
  Exit;
gbCobranca1.DataArquivo := Now();
 case rdgLayoutArquivoRemessa.ItemIndex of
  0 : gbCobranca1.LayoutArquivo := laCNAB240;
  1 : gbCobranca1.LayoutArquivo := laCNAB400
 else
  gbCobranca1.LayoutArquivo := laOutro;
 end;
gbCobranca1.NomeArquivo := txtNomeArquivoRemessa.Text;
gbCobranca1.Titulos.Add(gbTitulo1);
gbCobranca1.GerarRemessa;
txtRelatorioRetorno.Clear;
txtRelatorioRetorno.Lines.AddStrings(gbCobranca1.Relatorio);
end;

procedure TformBoleto.butProcurarRetornoClick(Sender: TObject);
begin
OpenDialog1.FileName   := txtNomeArquivoRetorno.Text;
OpenDialog1.InitialDir := ExtractFilePath(txtNomeArquivoRetorno.Text);
if OpenDialog1.Execute then
 txtNomeArquivoRetorno.Text := OpenDialog1.FileName;
end;

procedure TformBoleto.butLerRetornoClick(Sender: TObject);
begin
gbCobranca1.Titulos.Clear;
if trim(txtNomeArquivoRetorno.Text) = '' then
 if OpenDialog1.Execute then
  txtNomeArquivoRetorno.Text := OpenDialog1.FileName
 else
  Exit;
gbCobranca1.NomeArquivo := txtNomeArquivoRetorno.Text;
gbCobranca1.LerRetorno;
txtRelatorioRetorno.Clear;
txtRelatorioRetorno.Lines.AddStrings(gbCobranca1.Relatorio);
end;

procedure TformBoleto.FormShow(Sender: TObject);
begin
gbTitulo1.Cedente.ContaBancaria.Banco.Codigo := '341'; {Itaú}
btnBusca.Enabled    := True;
btnOK.Enabled       := False;
btnImprimir.Enabled := False;
if (stsBoleto = 0) then
  Begin
   edtEmissao.Clear;
   edtCliente.Clear;
   edtVencimento.Clear;
   txtNossoNumero.Clear;
   txtDigitoNossoNumero.Clear;
   dmBaseDados.tblClientes.Open;
   dmBaseDados.tblContasReceber.Open;
   dmBaseDados.tblContasReceber.MasterFields := '';
   txtCodigoBanco.Text := gbTitulo1.Cedente.ContaBancaria.Banco.Codigo;
   txtNomeBanco.Text   := gbTitulo1.Cedente.ContaBancaria.Banco.Nome;
   case gbCobranca1.LayoutArquivo of
    laCNAB240 : rdgLayoutArquivoRemessa.ItemIndex := 0;
    laCNAB400 : rdgLayoutArquivoRemessa.ItemIndex := 1
   else
    rdgLayoutArquivoRemessa.ItemIndex := 2;
   end;
   dbeValor.Visible         := False;
   dbgContasReceber.Visible := False;
   txtNossoNumero.SetFocus;
  End
else if (stsBoleto = 1) then
  Begin
   dmBaseDados.tblClientes.Open;
   dmBaseDados.tblContasReceber.Open;
   dmBaseDados.tblContasReceber.MasterFields := '';
   case gbCobranca1.LayoutArquivo of
    laCNAB240 : rdgLayoutArquivoRemessa.ItemIndex := 0;
    laCNAB400 : rdgLayoutArquivoRemessa.ItemIndex := 1
   else
    rdgLayoutArquivoRemessa.ItemIndex := 2;
   end;
   edtEmissao.Text     := DateToStr(Date);
   txtNossoNumero.Text := strNFe;
   txtNossoNumero.SetFocus;
   btnBusca.Click;
  End;
end;

procedure TformBoleto.btnCancelaClick(Sender: TObject);
begin
Close;     
end;

procedure TformBoleto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
stsBoleto := 0;
dmBaseDados.tblContasReceber.Filter       := '';
dmBaseDados.tblContasReceber.Filtered     := False;
dmBaseDados.tblContasReceber.MasterFields := 'CodigoCliente';
dmBaseDados.tblClientes.Close;
dmBaseDados.tblContasReceber.Close;
end;

procedure TformBoleto.btnImprimirClick(Sender: TObject);
var strArquivo : String;
begin
if (Application.MessageBox('Confirma emissão do BOLETO?','A T E N Ç Ã O!',MB_YESNO) = IDYES) then
  Begin
   dmBaseDados.tblContasReceber.Edit;
   dmBaseDados.tblContasReceberBoleto.AsString := 'SIM';
   dmBaseDados.tblContasReceber.Post;
   gbTitulo1.Visualizar;
   gbCobranca1.Titulos.Clear;
   {if trim(txtNomeArquivoRemessa.Text) = '' then
    if SaveDialog1.Execute then
     txtNomeArquivoRemessa.Text := SaveDialog1.FileName
    else
     Exit; }
   gbCobranca1.DataArquivo := Now();
    case rdgLayoutArquivoRemessa.ItemIndex of
     0 : gbCobranca1.LayoutArquivo := laCNAB240;
     1 : gbCobranca1.LayoutArquivo := laCNAB400
    else
     gbCobranca1.LayoutArquivo := laOutro;
    end;
   strArquivo := txtNossoNumero.Text +' '+ Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,1);
   gbCobranca1.NomeArquivo := 'C:\Remessa\' +strArquivo +'.txt';
   gbCobranca1.Titulos.Add(gbTitulo1);
   gbCobranca1.GerarRemessa;
   txtRelatorioRetorno.Clear;
   txtRelatorioRetorno.Lines.AddStrings(gbCobranca1.Relatorio);
  End;
end;

procedure TformBoleto.btnLimparClick(Sender: TObject);
begin
edtEmissao.Clear;
edtCliente.Clear;
edtVencimento.Clear;
txtNossoNumero.Clear;
txtDigitoNossoNumero.Clear;
btnBusca.Enabled    := True;
btnOK.Enabled       := False;
btnImprimir.Enabled := False;
dmBaseDados.tblContasReceber.Filter   := '';
dmBaseDados.tblContasReceber.Filtered := False;
txtNossoNumero.SetFocus;
dbeValor.Visible         := False;
dbgContasReceber.Visible := False;
end;

procedure TformBoleto.SpeedButton3Click(Sender: TObject);
begin
Close;
end;                                                                                   

procedure TformBoleto.btnOKClick(Sender: TObject);
var strCodCLi, strNumeroCIC, strCEP : String;
begin
if (dmBaseDados.tblContasReceberBoleto.AsString = 'SIM') then
 Begin
  Application.MessageBox('Boleto já emitido!','A T E N Ç Ã O!',MB_ICONINFORMATION);
  if (Application.MessageBox('Deseja emitir novamente?','A T E N Ç Ã O!',MB_YESNO) = IDNO) then
   Begin
    Abort;
   End;
 End;
dbeValor.Visible   := True;
strCodCli          := dmBaseDados.tblContasReceberCodCli.AsString;
edtVencimento.Text := dmBaseDados.tblContasReceberDataVencimento.AsString;
edtEmissao.Text    := dmBaseDados.tblContasReceberDataEmissao.AsString;
gbTitulo1.Cedente.Nome            := 'Polly Comercio de Plasticos Ltda';
gbTitulo1.Cedente.NumeroCPFCGC    := '00994799000189';
gbTitulo1.Cedente.Endereco.Rua    := 'Rua Jardim das Margaridas';
gbTitulo1.Cedente.Endereco.Numero := '331';
gbTitulo1.Cedente.Endereco.Bairro := 'Vl Buenos Aires';
gbTitulo1.Cedente.Endereco.Cidade := 'Sao Paulo';
gbTitulo1.Cedente.Endereco.Estado := 'SP';
gbTitulo1.NumeroDocumento         := txtNossoNumero.Text +' '+ dmBaseDados.tblContasReceberParcelas.AsString;
gbTitulo1.DataProcessamento       := Date;
gbTitulo1.DataDocumento           := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
gbTitulo1.DataVencimento          := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
gbTitulo1.ValorDocumento          := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
gbTitulo1.ValorAbatimento         := 0;
gbTitulo1.ValorDesconto           := 0;
gbTitulo1.ValorDespesaCobranca    := 0;
gbTitulo1.ValorIOF                := 0;
//gbTitulo1.ValorMoraJuros          := 1.89;
gbTitulo1.ValorOutrasDespesas     := 0;
gbTitulo1.ValorOutrosCreditos     := 0;
gbTitulo1.Carteira                := '109';
gbTitulo1.Cedente.ContaBancaria.Banco.Codigo  := '341';
gbTitulo1.Cedente.ContaBancaria.CodigoAgencia := '1012';
gbTitulo1.Cedente.ContaBancaria.DigitoAgencia := '';
gbTitulo1.Cedente.CodigoCedente               := '39799';
gbTitulo1.Cedente.DigitoCodigoCedente         := '6';
gbTitulo1.Cedente.ContaBancaria.NomeCliente   := '';
gbTitulo1.Cedente.ContaBancaria.NumeroConta   := '39799';
gbTitulo1.Cedente.ContaBancaria.DigitoConta   := '6';
if (dmBaseDados.tblClientes.Locate('CodigoCliente',strCodCLi,[loCaseInsensitive]) = True) then
  Begin
   edtCliente.Text       := dmBaseDados.tblClientesCodigoCliente.AsString +'  '+ dmBaseDados.tblClientesNomeCliente.AsString;
   gbTitulo1.Sacado.Nome := dmBaseDados.tblClientesCodigoCliente.AsString +'  '+ dmBaseDados.tblClientesNomeCliente.AsString;
   if (dmBaseDados.tblClientesTipoCliente.AsString = 'CPF') then
    begin
     gbTitulo1.Sacado.TipoInscricao := tiPessoaFisica;
    end
   else                       
    begin
     gbTitulo1.Sacado.TipoInscricao := tiPessoaJuridica;
    end;
   strNumeroCIC := dmBaseDados.tblClientesNumeroCIC.AsString;
   strNumeroCIC := BuscarETroca(strNumeroCIC,'.','');
   strNumeroCIC := BuscarETroca(strNumeroCIC,'-','');
   strNumeroCIC := BuscarETroca(strNumeroCIC,'/','');
   strNumeroCIC := BuscarETroca(strNumeroCIC,'\','');
   strNumeroCIC := BuscarETroca(strNumeroCIC,',','');
   strNumeroCIC := BuscarETroca(strNumeroCIC,' ','');
   strCEP := dmBaseDados.tblClientesCEPCob.AsString;
   strCEP := BuscarETroca(strCEP,'.','');
   strCEP := BuscarETroca(strCEP,'-','');
   strCEP := BuscarETroca(strCEP,'/','');
   strCEP := BuscarETroca(strCEP,'\','');
   strCEP := BuscarETroca(strCEP,',','');
   strCEP := BuscarETroca(strCEP,' ','');
   gbTitulo1.Sacado.NumeroCPFCGC     := strNumeroCIC;
   gbTitulo1.Sacado.Endereco.fRua    := dmBaseDados.tblClientesEnderecoCobranca.AsString;
   gbTitulo1.Sacado.Endereco.fBairro := dmBaseDados.tblClientesBairroCobranca.AsString;
   gbTitulo1.Sacado.Endereco.fCidade := dmBaseDados.tblClientesCidadeCobranca.AsString;
   gbTitulo1.Sacado.Endereco.fEstado := dmBaseDados.tblClientesEstadoCB.AsString;
   gbTitulo1.Sacado.Endereco.fCEP    := strCEP;
  End;
edtCliente.SetFocus;
btnImprimir.Enabled := True;
btnOK.Enabled       := False;
end;

procedure TformBoleto.btnBuscaClick(Sender: TObject);
begin
if (dmBaseDados.tblContasReceber.Locate('NumeroNF',txtNossoNumero.Text,[loCaseInsensitive]) = TRUE) then
 Begin
  dmBaseDados.tblContasReceber.Filter   := '('+'NumeroNF ='+QuotedStr(txtNossoNumero.Text)+')';
  dmBaseDados.tblContasReceber.Filtered := True;
  btnOK.Enabled    := True;
  btnBusca.Enabled := False;
  dbeValor.Visible         := True;
  dbgContasReceber.Visible := True;
 End
else
 Begin
  dbeValor.Visible         := False;
  dbgContasReceber.Visible := False;
  Application.MessageBox('Nota Fiscal não encontrada! Favor Verificar o número informado!','A T E N Ç Ã O!',MB_ICONINFORMATION);
  txtNossoNumero.SetFocus;
 End;
end;

procedure TformBoleto.TISButton1Click(Sender: TObject);
begin
Close;
end;

procedure TformBoleto.txtNossoNumeroKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 Begin
  gbTitulo1.NossoNumero     := txtNossoNumero.Text;
  txtDigitoNossoNumero.Text := gbTitulo1.DigitoNossoNumero;
  edtCliente.SetFocus;
  dbeValor.Visible         := True;
  dbgContasReceber.Visible := True;
  btnBusca.Click;
 End;
end;

procedure TformBoleto.dbgContasReceberCellClick(Column: TColumn);
begin
txtNossoNumero.Text := dmBaseDados.tblContasReceberNumeroNF.AsString;
gbTitulo1.NossoNumero     := txtNossoNumero.Text +'0' +Copy(dmBaseDados.tblContasReceberParcelas.AsString,1,1);
txtDigitoNossoNumero.Text := gbTitulo1.DigitoNossoNumero;
btnOK.Click;
end;

end.
