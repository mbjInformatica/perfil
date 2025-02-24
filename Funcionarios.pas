unit Funcionarios;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, Buttons, DBCtrls, StdCtrls, Mask, ComCtrls, TISButton;

type
  TformFuncionarios = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    lblCEP: TLabel;
    lblMatricula: TLabel;
    fldMatricula: TDBText;
    lblNomeFuncionario: TLabel;
    lblEndereco: TLabel;
    lblNumero: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    lblEstado: TLabel;
    lblTelefone: TLabel;
    lblCelular: TLabel;
    lblCPF: TLabel;
    lblRG: TLabel;
    fldNomeFuncionario: TDBEdit;
    fldEndereco: TDBEdit;
    fldNumero: TDBEdit;
    fldBairro: TDBEdit;
    fldCidade: TDBEdit;
    fldCEP: TDBEdit;
    fldTelefone: TDBEdit;
    fldEstado: TDBComboBox;
    fldPW: TDBEdit;
    fldCelular: TDBEdit;
    fldCPF: TDBEdit;
    fldRG: TDBEdit;
    TabSheet2: TTabSheet;
    ckbClientes: TDBCheckBox;
    Label2: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label3: TLabel;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    Label4: TLabel;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBCheckBox19: TDBCheckBox;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    DBCheckBox22: TDBCheckBox;
    DBCheckBox23: TDBCheckBox;
    DBCheckBox24: TDBCheckBox;
    DBCheckBox25: TDBCheckBox;
    DBCheckBox26: TDBCheckBox;
    DBCheckBox27: TDBCheckBox;
    DBCheckBox28: TDBCheckBox;
    DBCheckBox29: TDBCheckBox;
    DBCheckBox30: TDBCheckBox;
    DBCheckBox31: TDBCheckBox;
    Label1: TLabel;
    DBCheckBox32: TDBCheckBox;
    DBCheckBox33: TDBCheckBox;
    DBCheckBox34: TDBCheckBox;
    DBCheckBox35: TDBCheckBox;
    DBCheckBox36: TDBCheckBox;
    DBCheckBox37: TDBCheckBox;
    DBCheckBox38: TDBCheckBox;
    DBCheckBox39: TDBCheckBox;
    DBCheckBox40: TDBCheckBox;
    btnPrimeiro: TTISButton;
    btnAnterior: TTISButton;
    btnProximo: TTISButton;
    btnUltimo: TTISButton;
    btnGravar: TTISButton;
    btnLocalizar: TTISButton;
    btnExcluir: TTISButton;
    btnAdicionar: TTISButton;
    btnRetornar: TTISButton;
    btnImprimeCliente: TTISButton;
    lblSenha: TLabel;
    TISButton1: TTISButton;
    DBCheckBox41: TDBCheckBox;
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
    procedure btnImprimeClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formFuncionarios: TformFuncionarios;

implementation

uses ModuloDados, RotinasGerais, SeekFuncionario, Relcadvend;


{$R *.DFM}


procedure TformFuncionarios.FormShow(Sender: TObject);
var
   FArquivo: TextFile;
   strDados: string;
begin
dmBaseDados.tblFuncionarios.Open;
AssignFile(FArquivo,'C:\TEMP\ESTADOS.TXT');
Reset(FArquivo);
ReadLn(FArquivo,strDados);
while (not Eof(FArquivo)) do
 begin
  fldEstado.Items.Add(strDados);
  ReadLn(FArquivo,strDados);
 end;
CloseFile(FArquivo);
if (dmBaseDados.tblFuncionarios.RecordCount = 0) then
 begin
  dmBaseDados.tblFuncionarios.Append;
  dmBaseDados.tblFuncionariosCodigoFuncionario.AsString := '001';
  dmBaseDados.tblFuncionariosPW.AsString                := '001';
  dmBaseDados.tblFuncionarios.Post;
 end;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblFuncionarios.Close;
end;

procedure TformFuncionarios.btnPrimeiroClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.First;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnAnteriorClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Prior;
if (dmBaseDados.tblFuncionarios.Bof) then
 begin
  InicioTabela;
  dmBaseDados.tblFuncionarios.First;
 end;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnProximoClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Next;
if (dmBaseDados.tblFuncionarios.Eof) then
 begin
  FimTabela;
  dmBaseDados.tblFuncionarios.Last;
 end;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnUltimoClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Last;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnGravarClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Post;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnLocalizarClick(Sender: TObject);
begin
formSeekFuncionario.ShowModal;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnExcluirClick(Sender: TObject);
begin
dmBaseDados.tblFuncionarios.Delete;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnAdicionarClick(Sender: TObject);
var intCodigo, intTamanho : Integer;
    strCodigo : String;
begin
dmBaseDados.tblFuncionarios.Last;
intCodigo := StrToInt(dmBaseDados.tblFuncionariosCodigoFuncionario.AsString);
Inc(intCodigo);
strCodigo  := IntToStr(intCodigo);
intTamanho := Length(strCodigo);
strCodigo  := Copy('000'+strCodigo,intTamanho+1,3);
dmBaseDados.tblFuncionarios.Append;
dmBaseDados.tblFuncionariosCodigoFuncionario.AsString := strCodigo;
dmBaseDados.tblFuncionariosPW.AsString                := strCodigo;
dmBaseDados.tblFuncionarios.Post;
if (dmBaseDados.tblFuncionariosNomeFuncionario.AsString = 'MBJ') then
 begin
  fldPW.Visible    := False;
  lblSenha.Visible := False;
 end
else
 begin
  fldPW.Visible    := True;
  lblSenha.Visible := True;
 end;
end;

procedure TformFuncionarios.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformFuncionarios.btnImprimeClienteClick(Sender: TObject);
begin
formRelcadvend.QrVenda.preview;
end;

end.
