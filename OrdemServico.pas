unit OrdemServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Grids, DBGrids, StdCtrls, DBCtrls, Mask, ComCtrls, DB;

type
  TformClientesOficina = class(TForm)
    pgFichaServicos        : TPageControl;
    tabClientesOficina     : TTabSheet;
    lblPlacaVeiculo        : TLabel;
    lblNomeCliente         : TLabel;
    lblEndereco            : TLabel;
    fldEndereco            : TDBEdit;
    lblBairro              : TLabel;
    fldBairro              : TDBEdit;
    lblCidade              : TLabel;
    fldCEP                 : TDBEdit;
    fldCidade              : TDBComboBox;
    lblCEP                 : TLabel;
    lblTelefone            : TLabel;
    fldTelefone            : TDBEdit;
    tabServicosExecultados : TTabSheet;
    grdFichaServicos       : TDBGrid;
    pnlBotoes              : TPanel;
    btnPrimeiroServico     : TSpeedButton;
    btnUltimoServico       : TSpeedButton;
    btnAdicionarServico    : TSpeedButton;
    btnGravarServico       : TSpeedButton;
    btnExcluirServico      : TSpeedButton;
    btnProximo             : TSpeedButton;
    btnPrimeiro            : TSpeedButton;
    btnAnterior            : TSpeedButton;
    btnUltimo              : TSpeedButton;
    btnGravar              : TSpeedButton;
    btnLocalizar           : TSpeedButton;
    btnExcluir             : TSpeedButton;
    btnAdicionar           : TSpeedButton;
    btnImprimir            : TSpeedButton;
    fldPlaca               : TDBEdit;
    fldNomeCliente         : TDBEdit;
    lblCarro               : TLabel;
    fldCarro               : TDBEdit;
    Label1                 : TLabel;
    fldAnoModelo           : TDBEdit;
    btnRetornar            : TSpeedButton;
    tabPecasUtilizadas     : TTabSheet;
    grdPecas               : TDBGrid;
    pnlPecas               : TPanel;
    btnAdicionar2          : TSpeedButton;
    btnGravar2             : TSpeedButton;
    btnExcluir2            : TSpeedButton;
    lblMesAniversario      : TLabel;
    fldMesAniversario      : TDBEdit;
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
    procedure btnImprimirClick(Sender: TObject);
    procedure btnPrimeiroServicoClick(Sender: TObject);
    procedure btnUltimoServicoClick(Sender: TObject);
    procedure btnAdicionarServicoClick(Sender: TObject);
    procedure btnGravarServicoClick(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnAdicionar2Click(Sender: TObject);
    procedure btnExcluir2Click(Sender: TObject);
    procedure btnGravar2Click(Sender: TObject);
    procedure fldPlacaExit(Sender: TObject);
    procedure fldNomeClienteExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formClientesOficina: TformClientesOficina;

implementation

uses ModuloDados, RotinasGerais, SeekPlaca, RelOS;

{$R *.DFM}

procedure TformClientesOficina.FormShow(Sender: TObject);
Var
   FArquivo: TextFile;
   strDados: string;
begin
   dmBaseDados.tblClientesOficina.Open;
   dmBaseDados.tblFichaServico.Open;
   dmBaseDados.tblPecasServicos.Open;
   AssignFile(FArquivo,'F:\TRAB\SGE\TABELAS\ESTADOS.TXT');
   Reset(FArquivo);
   ReadLn(FArquivo,strDados);
   while (not Eof(FArquivo)) do
   begin
      fldCidade.Items.Add(strDados);
      ReadLn(FArquivo,strDados);
   end;
   CloseFile(FArquivo);
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldCarro.SetFocus;
end;

procedure TformClientesOficina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblClientesOficina.Close;
   dmBaseDados.tblFichaServico.Close;
end;

procedure TformClientesOficina.btnPrimeiroClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.First;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnAnteriorClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Prior;
   if (dmBaseDados.tblClientesOficina.Bof) then
   begin
      InicioTabela;
      dmBaseDados.tblClientesOficina.First;
   end;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnProximoClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Next;
   if (dmBaseDados.tblClientesOficina.Eof) then
   begin
      FimTabela;
      dmBaseDados.tblClientesOficina.Last;
   end;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnUltimoClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Last;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnGravarClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Post;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnLocalizarClick(Sender: TObject);
begin
   formSeekPlaca.ShowModal;
end;

procedure TformClientesOficina.btnExcluirClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Delete;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnAdicionarClick(Sender: TObject);
{Var
   intCodigo,intTamanho: integer;
   strCodigo: String;}
begin
   dmBaseDados.tblClientesOficina.Append;
   dmBaseDados.tblclientesOficina.Post;
   pgFichaServicos.ActivePage := tabClientesOficina;
   fldPlaca.SetFocus;
end;

procedure TformClientesOficina.btnImprimirClick(Sender: TObject);
var
   strPlaca: string[8];
begin
   dmBaseDados.tblFichaservico.Open;
   dmBaseDados.tblFichaServico.Last;
   strPlaca := dmBaseDados.tblFichaServicoPlaca.AsString;
   dmBaseDados.tblClientesOficina.Filter   := 'Placa = '+#39+strplaca+ #39;
   dmBaseDados.tblClientesOficina.Filtered := True;
   formRelOS.rptOS.Preview;
   dmBaseDados.tblClientesOficina.Filter   := '';
   dmBaseDados.tblClientesOficina.Filtered := False;
end;

procedure TformClientesOficina.btnPrimeiroServicoClick(Sender: TObject);
begin
   dmBaseDados.tblFichaServico.First;
   pgFichaServicos.ActivePage := tabServicosExecultados;
   grdFichaServicos.SetFocus;
end;

procedure TformClientesOficina.btnUltimoServicoClick(Sender: TObject);
begin
   dmBaseDados.tblFichaServico.Last;
   pgFichaServicos.ActivePage := tabServicosExecultados;
   grdFichaServicos.SetFocus;
end;

procedure TformClientesOficina.btnAdicionarServicoClick(Sender: TObject);
begin
   btnPrimeiroServico.Enabled  :=False;
   btnUltimoServico.Enabled    :=False;
   btnAdicionarServico.Enabled :=False;
   btnExcluirServico.Enabled   :=False;
   dmBaseDados.tblFichaServico.Append;
   //grdFichaServicos.Columns[0].Showing;
end;

procedure TformClientesOficina.btnGravarServicoClick(Sender: TObject);
begin
   btnPrimeiroServico.Enabled  :=True;
   btnUltimoServico.Enabled    :=True;
   btnAdicionarServico.Enabled :=True;
   btnExcluirServico.Enabled   :=True;
   dmBaseDados.tblFichaServicoPlaca.AsString := dmBaseDados.tblClientesOficinaPlaca.AsString;
   dmBaseDados.tblFichaServico.Post;
   pgFichaServicos.ActivePage  := tabServicosExecultados;
   grdFichaServicos.SetFocus;
end;

procedure TformClientesOficina.btnExcluirServicoClick(Sender: TObject);
begin
   dmBaseDados.tblFichaServico.Delete;
   pgFichaServicos.ActivePage := tabServicosExecultados;
   grdFichaServicos.SetFocus;
end;

procedure TformClientesOficina.btnRetornarClick(Sender: TObject);
begin
   dmBaseDados.tblClientesOficina.Close;
   dmBaseDados.tblFichaServico.Close;
   dmBaseDados.tblPecasServicos.Close;
   Close;
end;

procedure TformClientesOficina.btnAdicionar2Click(Sender: TObject);
begin
   btnAdicionar2.Enabled :=False;
   btnExcluir2.Enabled   :=False;
   dmBaseDados.tblPecasServicos.Append;
end;

procedure TformClientesOficina.btnExcluir2Click(Sender: TObject);
begin
   dmBaseDados.tblPecasServicos.Delete;
   pgFichaServicos.ActivePage := tabPecasUtilizadas;
   grdPecas.SetFocus;
end;

procedure TformClientesOficina.btnGravar2Click(Sender: TObject);
begin
   dmBaseDados.tblPecasServicosPlaca.AsString := dmBaseDados.tblClientesOficinaPlaca.AsString;
   dmBaseDados.tblPecasServicos.Post;
   pgFichaServicos.ActivePage := tabPecasUtilizadas;
   btnAdicionar2.Enabled      :=True;
   btnExcluir2.Enabled        :=True;
   grdPecas.SetFocus;
end;

procedure TformClientesOficina.fldPlacaExit(Sender: TObject);
begin
   if (not dmBaseDados.tblClientesOficina.FindKey([fldPlaca.Text])) then
   begin
      Mensagem('Placa já Cadastrada !');
      dmBaseDados.tblClientesOficina.First;
      {dmBaseDados.tblClientesOficina.Delete;
      pgFichaServicos.ActivePage := tabClientesOficina;}
      fldPlaca.SetFocus;
   end;
end;

procedure TformClientesOficina.fldNomeClienteExit(Sender: TObject);
Var
   wPlaca,fldEndereco,fldBairro,fldCEP,fldCidade,fldTelefone: String;
   //Wrecno: Integer;
   //bmkRegistro: TBookMark;
begin
//bmkRegistro:= dmBaseDados.tblClientesOficina.GetBookMark;
//Wrecno:=dmBaseDados.tblClientesOficina.Recno;
dmBaseDados.tblClientesOficina.Post;
wPlaca:=dmBaseDados.tblClientesOficinaPlaca.Text;
dmBaseDados.tblClientesOficina.IndexName := 'IndiceNomeClienteOficina';
if (dmBaseDados.tblClientesOficina.FindKey([fldNomeCliente.Text])) then
   begin
   //dmBaseDados.tblClientesOficina.MoveBy(Wrecno);
   fldEndereco :=dmBaseDados.tblClientesOficinaEndereco.Text;
   fldBairro   :=dmBaseDados.tblClientesOficinaBairro.Text;
   fldCeP      :=dmBaseDados.tblClientesOficinaCep.Text;
   fldCidade   :=dmBaseDados.tblClientesOficinaCidade.Text;
   fldTelefone :=dmBaseDados.tblClientesOficinaFone.Text;
   dmBaseDados.tblClientesOficina.IndexName    := '';
   dmBaseDados.tblClientesOficina.FindKey([wPlaca]);
   dmBaseDados.tblClientesOficina.Edit;
   dmBaseDados.tblClientesOficinaEndereco.Text := fldEndereco;
   dmBaseDados.tblClientesOficinaBairro.Text   := fldBairro;
   dmBaseDados.tblClientesOficinaCep.Text      := fldCep;
   dmBaseDados.tblClientesOficinaCidade.Text   := fldCidade;
   dmBaseDados.tblClientesOficinaFone.Text     := fldTelefone;
   end;
   //dmBaseDados.tblClientesOficina.FreeBookMark(bmkRegistro);
   end;
end.
