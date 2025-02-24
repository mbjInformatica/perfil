unit Fornecedor;

interface

uses Windows, Messages, SysUtils, Classes, Graphics,
     Controls, Forms, Dialogs, Buttons, ExtCtrls, Grids,
     DBGrids, StdCtrls, DBCtrls, Mask, ComCtrls, db, TISButton;

type
  TformFornecedores = class(TForm)
    pgFornecedor        : TPageControl;
    tabFornecedor       : TTabSheet;
    lblCodigoFornecedor : TLabel;
    fldNomeFantasia     : TDBEdit;
    fldRazaoSocial      : TDBEdit;
    fldCodigoFornecedor : TDBText;
    lblNomeFantasia     : TLabel;
    lblRasaoSocial      : TLabel;
    lblCNPJ             : TLabel;
    fldCNPJ             : TDBEdit;
    lblTipoFornecedor   : TLabel;
    fldTipoFornecedor   : TDBComboBox;
    lblEndereco         : TLabel;
    fldEndereco         : TDBEdit;
    fldNumero           : TDBEdit;
    lblNumero           : TLabel;
    lblBairro           : TLabel;
    fldBairro           : TDBEdit;
    fldCidade           : TDBEdit;
    lblCidade           : TLabel;
    lblEstado           : TLabel;
    fldCEP              : TDBEdit;
    fldEstado           : TDBComboBox;
    lblCEP              : TLabel;
    lblTelefone         : TLabel;
    fldTelefone         : TDBEdit;
    fldFax              : TDBEdit;
    lblFAX              : TLabel;
    lblRepresentante    : TLabel;
    fldRepresentante    : TDBEdit;
    fldRamal            : TDBEdit;
    lblRamal            : TLabel;
    lblHomePage         : TLabel;
    fldHomePage         : TDBEdit;
    fldMail             : TDBEdit;
    lblMail             : TLabel;
    tabProdutos         : TTabSheet;
    grdProdutos         : TDBGrid;
    pnlBotoes           : TPanel;
    btnPrimeiroProduto  : TSpeedButton;
    btnUltimaProduto    : TSpeedButton;
    btnAdicionarProduto : TSpeedButton;
    btnGravarProduto    : TSpeedButton;
    btnExcluirProduto   : TSpeedButton;
    tabContasPagar      : TTabSheet;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    grdContasPagar: TDBGrid;
    edtNDocumento: TEdit;
    btnPesquisar: TButton;
    Panel2: TPanel;
    RadioButton1: TRadioButton;
    rdbordemvenc: TRadioButton;
    rdbordemdoc: TRadioButton;
    btnPrimeiro: TTISButton;
    btnAnterior: TTISButton;
    btnProximo: TTISButton;
    btnUltimo: TTISButton;
    btnGravar: TTISButton;
    btnLocalizar: TTISButton;
    btnExcluir: TTISButton;
    btnAdicionar: TTISButton;
    btnRetornar: TTISButton;
    Label2: TLabel;
    fldIE: TDBEdit;
    Panel1: TPanel;
    fldObs: TDBMemo;
    lblObs: TLabel;
    btnPrimeiraCtpg: TTISButton;
    btnUltimaCtpg: TTISButton;
    btnGravarCtpg: TTISButton;
    btnAdicionarCtpg: TTISButton;
    btnExcluirCtpg: TTISButton;
    btnFechar: TTISButton;
    lblIbge: TLabel;
    fldCodIBG: TDBEdit;
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
    procedure btnPrimeiroProdutoClick(Sender: TObject);
    procedure btnUltimaProdutoClick(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnGravarProdutoClick(Sender: TObject);
    procedure btnExcluirProdutoClick(Sender: TObject);
    procedure btnAdicionarCtpgClick(Sender: TObject);
    procedure btnPrimeiraCtpgClick(Sender: TObject);
    procedure btnUltimaCtpgClick(Sender: TObject);
    procedure btnGravarCtpgClick(Sender: TObject);
    procedure btnExcluirCtpgClick(Sender: TObject);
    procedure tabFornecedorShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure rdbordemdocClick(Sender: TObject);
    procedure rdbordemvencClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure fldCodIBGExit(Sender: TObject);
    procedure fldEstadoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formFornecedores: TformFornecedores;

implementation

uses ModuloDados, SeekFornecedor, RotinasGerais;


{$R *.DFM}


procedure TformFornecedores.FormShow(Sender: TObject);
var FArquivo : TextFile;
    strDados : String;
begin
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblContasPagar.Open;
dmBaseDados.tblProdutosFornecidos.Open;
AssignFile(FArquivo,'C:\TEMP\ESTADOS.TXT');
Reset(FArquivo);
ReadLn(FArquivo,strDados);
while (not Eof(FArquivo)) do
 begin
  fldEstado.Items.Add(strDados);
  ReadLn(FArquivo,strDados);
 end;
CloseFile(FArquivo);
if (dmBaseDados.tblFornecedores.RecordCount = 0) then
 begin
  dmBaseDados.tblFornecedores.Append;
  dmBaseDados.tblFornecedoresCodigoFornecedor.AsString := '0001';
  dmBaseDados.tblFornecedores.Post;
 end;
pgFornecedor.ActivePage := tabFornecedor;
fldRamal.SetFocus;
end;

procedure TformFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblContasPagar.IndexName := '';
dmBaseDados.tblFornecedores.Close;
dmBaseDados.tblProdutosFornecidos.Close;
end;

procedure TformFornecedores.btnPrimeiroClick(Sender: TObject);
begin
dmBaseDados.tblFornecedores.First;
pgFornecedor.ActivePage := tabFornecedor;
fldRamal.SetFocus;
end;

procedure TformFornecedores.btnAnteriorClick(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Prior;
if (dmBaseDados.tblFornecedores.Bof) then
 begin
  InicioTabela;
  dmBaseDados.tblFornecedores.First;
 end;
pgFornecedor.ActivePage := tabFornecedor;
fldRamal.SetFocus;
end;

procedure TformFornecedores.btnProximoClick(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Next;
if (dmBaseDados.tblFornecedores.Eof) then
 begin
  FimTabela;
  dmBaseDados.tblFornecedores.Last;
 end;
pgFornecedor.ActivePage := tabFornecedor;
fldRamal.SetFocus;
end;

procedure TformFornecedores.btnUltimoClick(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Last;
pgFornecedor.ActivePage := tabFornecedor;
fldRamal.SetFocus;
end;

procedure TformFornecedores.btnGravarClick(Sender: TObject);
begin
if( (dmBaseDados.tblFornecedores.State = dsEdit)
 or (dmBaseDados.tblFornecedores.State = dsInsert) )then
  begin
   dmBaseDados.tblFornecedores.Post;
   pgFornecedor.ActivePage := tabFornecedor;
   fldHomePage.SetFocus;
  end;
end;

procedure TformFornecedores.btnLocalizarClick(Sender: TObject);
begin
formSeekFornecedor.ShowModal;
end;

procedure TformFornecedores.btnExcluirClick(Sender: TObject);
begin
dmBaseDados.tblFornecedores.Delete;
pgFornecedor.ActivePage := tabFornecedor;
fldHomePage.SetFocus;
end;

procedure TformFornecedores.btnAdicionarClick(Sender: TObject);
var intCodigo, intTamanho : Integer;
    strCodigo : String;
begin
dmBaseDados.tblFornecedores.IndexName := '';
dmBaseDados.tblFornecedores.Last;
intCodigo  := StrToInt(dmBaseDados.tblFornecedoresCodigoFornecedor.AsString);
Inc(intCodigo);
strCodigo  := IntToStr(intCodigo);
intTamanho := Length(strCodigo);
strCodigo  := Copy('0000'+strCodigo,intTamanho+1,4);
dmBaseDados.tblFornecedores.Append;
dmBaseDados.tblFornecedoresCodigoFornecedor.AsString := strCodigo;
dmBaseDados.tblFornecedores.Post;
pgFornecedor.ActivePage := tabFornecedor;
fldNomeFantasia.SetFocus;
end;

procedure TformFornecedores.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformFornecedores.btnPrimeiroProdutoClick(Sender: TObject);
begin
dmBaseDados.tblProdutosFornecidos.First;
pgFornecedor.ActivePage := tabProdutos;
grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnUltimaProdutoClick(Sender: TObject);
begin
dmBaseDados.tblProdutosFornecidos.Last;
pgFornecedor.ActivePage := tabProdutos;
grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnAdicionarProdutoClick(Sender: TObject);
begin
dmBaseDados.tblProdutosFornecidos.Append;
end;

procedure TformFornecedores.btnGravarProdutoClick(Sender: TObject);
begin
dmBaseDados.tblProdutosFornecidos.Post;
pgFornecedor.ActivePage := tabProdutos;
grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnExcluirProdutoClick(Sender: TObject);
begin
dmBaseDados.tblProdutosFornecidos.Delete;
pgFornecedor.ActivePage := tabProdutos;
grdProdutos.SetFocus;
end;

procedure TformFornecedores.btnAdicionarCtpgClick(Sender: TObject);
begin
dmBaseDados.tblContasPagar.Append;
dmBaseDados.tblContasPagarCodigoFornecedor.AsString := dmBaseDados.tblFornecedoresCodigoFornecedor.AsString;
dmBaseDados.tblContasPagarFornecedor.AsString       := dmBaseDados.tblFornecedoresRazaoSocial.AsString;
dmBaseDados.tblContasPagarDataEmissao.AsDateTime    := Date;
pgFornecedor.ActivePage := tabContasPagar;
grdContasPagar.SetFocus;
grdContasPagar.SelectedField := dmBaseDados.tblContasPagarNumeroDocumento;
end;

procedure TformFornecedores.btnPrimeiraCtpgClick(Sender: TObject);
begin
dmBaseDados.tblContasPagar.First;
pgFornecedor.ActivePage := tabContasPagar;
grdContasPagar.SetFocus;
end;

procedure TformFornecedores.btnUltimaCtpgClick(Sender: TObject);
begin
dmBaseDados.tblContasPagar.Last;
pgFornecedor.ActivePage := tabContasPagar;
grdContasPagar.SetFocus;
end;

procedure TformFornecedores.btnGravarCtpgClick(Sender: TObject);
var Vencimento, Pagamento,
    Emissao, Dias : TDateTime;
    Ano, Mes, Dia : Word;
begin
Pagamento := dmBaseDados.tblContasPagarDataEmissao.Value;
if (dmBaseDados.tblContasPagarBaixado.AsString = 'SIM') then
  Begin
   if (dmBaseDados.tblContasPagarDataPagamento.Value <> Pagamento) then
    begin
     Vencimento := StrToDate(dmBaseDados.tblContasPagarDataVencimento.Text);
     DecodeDate(Vencimento, Ano, Mes, Dia);
     Pagamento := StrToDate(dmBaseDados.tblContasPagarDataPagamento.Text);
     DecodeDate(Pagamento, Ano, Mes, Dia);
     Dias := Pagamento - Vencimento;
     DecodeDate(Dias, Ano, Mes, Dia);
     dmBaseDados.tblContasPagar.Edit;
     dmBaseDados.tblContasPagarDiasAtraso.Value := Dias;
     dmBaseDados.tblContasPagarStatus.AsString  := '1';
     dmBaseDados.tblContasPagar.Post;
    end;
  End;
if (dmBaseDados.tblContasPagarDataVencimento.AsString <> '') then
 begin
  Vencimento := StrToDate(dmBaseDados.tblContasPagarDataVencimento.Text);
  DecodeDate(Vencimento, Ano, Mes, Dia);
  Emissao    := StrToDate(dmBaseDados.tblContasPagarDataEmissao.Text);
  DecodeDate(Emissao, Ano, Mes, Dia);
  Dias       := Vencimento - Emissao;
  DecodeDate(Dias, Ano, Mes, Dia);
 end;
dmBaseDados.tblContasPagar.Edit;
dmBaseDados.tblContasPagarPrazo.Value               := Dias;
dmBaseDados.tblContasPagarCodigoFornecedor.AsString := dmBaseDados.tblFornecedoresCodigoFornecedor.AsString;
dmBaseDados.tblContasPagarFornecedor.AsString       := dmBaseDados.tblFornecedoresRazaoSocial.AsString;
dmBaseDados.tblContasPagarDiferenca.AsFloat         := dmBaseDados.tblContasPagarValorPago.AsFloat - dmBaseDados.tblContasPagarValorDocumento.AsFloat;
dmBaseDados.tblContasPagar.Post;
pgFornecedor.ActivePage := tabContasPagar;
grdContasPagar.SetFocus;
end;

procedure TformFornecedores.btnExcluirCtpgClick(Sender: TObject);
begin
if (Application.MessageBox('Deseja Excluir ?','Confirma ??',MB_YESNO) = IDYES) then
 begin
  dmBaseDados.tblContasPagar.Delete;
  pgFornecedor.ActivePage := tabContasPagar;
  grdContasPagar.SetFocus;
 end;
end;

procedure TformFornecedores.tabFornecedorShow(Sender: TObject);
begin
fldRamal.SetFocus;
end;

procedure TformFornecedores.btnPesquisarClick(Sender: TObject);
begin
if (dmBaseDados.tblContasPagar.Locate('NumeroDocumento',edtNDocumento.Text,[LOCASEINSENSITIVE]) = False) then
 begin
  ShowMessage('Documento Não encontrado!!!');
 end;
grdContasPagar.SetFocus;
end;

procedure TformFornecedores.rdbordemdocClick(Sender: TObject);
begin
dmBaseDados.tblContasPagar.IndexName := 'IndNDocumento';
end;

procedure TformFornecedores.rdbordemvencClick(Sender: TObject);
begin
dmBaseDados.tblContasPagar.IndexName := 'IndDataVencimento';
end;

procedure TformFornecedores.RadioButton1Click(Sender: TObject);
begin
dmBaseDados.tblContasPagar.IndexName := 'IndDataEmissao';
end;

procedure TformFornecedores.btnFecharClick(Sender: TObject);
begin
Close;
end;

procedure TformFornecedores.fldCodIBGExit(Sender: TObject);
var strEstado : String;
begin
strEstado := Copy(dmBaseDados.tblFornecedoresEstado.AsString,0,2);
dmBaseDados.tblCidades.Open;
dmBaseDados.tblCidades.Filter   := '('+'Estado ='+QuotedStr(strEstado)+')';
dmBaseDados.tblCidades.Filtered := True;
if (dmBaseDados.tblCidades.Locate('Cidade',dmBaseDados.tblFornecedoresCidade.AsString,[loCaseInsensitive]) = True) then
 begin
  dmBaseDados.tblFornecedores.Edit;
  dmBaseDados.tblFornecedoresCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
  dmBaseDados.tblFornecedores.Post;
 end
else
 begin
  ShowMessage('ATENÇÃO! Verifique o nome da cidade! Não digitar acentuação e não abreviar!');
  fldCidade.SetFocus;
 end;
dmBaseDados.tblCidades.Filter   := '';
dmBaseDados.tblCidades.Filtered := False;
end;

procedure TformFornecedores.fldEstadoExit(Sender: TObject);
var strEstado : String;
begin
strEstado := Copy(dmBaseDados.tblFornecedoresEstado.AsString,0,2);
dmBaseDados.tblCidades.Open;
dmBaseDados.tblCidades.Filter   := '('+'Estado ='+QuotedStr(strEstado)+')';
dmBaseDados.tblCidades.Filtered := True;
if (dmBaseDados.tblCidades.Locate('Cidade',dmBaseDados.tblFornecedoresCidade.AsString,[loCaseInsensitive]) = True) then
 begin
  dmBaseDados.tblFornecedores.Edit;
  dmBaseDados.tblFornecedoresCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
  dmBaseDados.tblFornecedores.Post;
 end
else
 begin
  ShowMessage('ATENÇÃO! Verifique o nome da cidade! Não digitar acentuação e não abreviar!');
  fldCidade.SetFocus;
 end;
dmBaseDados.tblCidades.Filter   := '';
dmBaseDados.tblCidades.Filtered := False;
end;

end.
