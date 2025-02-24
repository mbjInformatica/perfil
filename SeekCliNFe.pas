unit SeekCliNFe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, db, TIGradient,
  TISButton;

type
  TformSeekCliNFe = class(TForm)
    lblMensagem: TLabel;
    lblDigiteCpf: TLabel;
    lblCodCli: TLabel;
    Label1: TLabel;
    lblou3: TLabel;
    lblDigiteCNPJ: TLabel;
    Label3: TLabel;
    mskCliente: TMaskEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    mskCpf: TMaskEdit;
    mskCodCli: TMaskEdit;
    mskCnpj: TMaskEdit;
    dblFantasia: TDBLookupComboBox;
    dbgClientes: TDBGrid;
    edtFiltrocliente: TEdit;
    Label4: TLabel;
    TIGradient1: TTIGradient;
    btnPross: TTISButton;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btnCad: TTISButton;
    procedure btnOKClick(Sender: TObject);
    procedure dllClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFiltroclienteChange(Sender: TObject);
    procedure mskCodCliChange(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure mskClienteChange(Sender: TObject);
    procedure mskCpfChange(Sender: TObject);
    procedure mskCnpjChange(Sender: TObject);
    procedure dblFantasiaClick(Sender: TObject);
    procedure dbgClientesCellClick(Column: TColumn);
    procedure dbgClientesKeyPress(Sender: TObject; var Key: Char);
    procedure btnProssClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFiltroclienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formSeekCliNFe: TformSeekCliNFe;
    StatusCancel : String;
    //StsCad       : Integer;

implementation

uses ModuloDados, RotinasGerais, Clientes, NotaFiscal;


{$R *.DFM}


procedure TformSeekCliNFe.btnOKClick(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
if( (not dmBaseDados.tblClientes.FindKey([mskCodCli.Text]))or(mskCodCli.Text = '') )then
  begin
   dmBaseDados.tblClientes.IndexName := '';
   if( (not dmBaseDados.tblClientes.FindKey([mskCliente.Text]))or(mskCliente.Text = '') )then
     begin
      dmBaseDados.tblClientes.IndexName := 'IndCnpjCliente';
      if( (not dmBaseDados.tblClientes.FindKey([mskCpf.Text]))or(mskCpf.Text = '') )then
        begin
         if( (not dmBaseDados.tblClientes.FindKey([mskCnpj.Text]))or(mskCnpj.Text = '') )then
           begin
            Mensagem('Cliente não encontrado !');
            dmBaseDados.tblClientes.First;
            Abort;
           end;
        end;
     end;
  end;
dbgClientes.SetFocus;
dbgClientes.SelectedField  := dmBaseDados.tblClientesNomeCliente;
btnOK.Visible    := False;
btnPross.Visible := True;
dmBaseDados.tblClientes.IndexName := '';
end;

procedure TformSeekCliNFe.dllClientesClick(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName := 'IndCliente';
end;

procedure TformSeekCliNFe.FormShow(Sender: TObject);
begin
//StsCad := 0;
edtFiltrocliente.Text := '';
mskCodCli.Text   := '';
mskCliente.Text  := '';
mskCpf.Text      := '';
mskCnpj.Text     := '';
btnPross.Visible := True;
btnOK.Visible    := False;
edtFiltrocliente.SetFocus;
StatusCancel     := '';
end;

procedure TformSeekCliNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
//StsCad := 0;
end;

procedure TformSeekCliNFe.edtFiltroclienteChange(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName:= 'IndCliente';
dmBaseDados.tblClientes.FindNearest([edtFiltrocliente.Text]);
btnPross.Visible := True;
btnOK.Visible    := False;
end;

procedure TformSeekCliNFe.mskCodCliChange(Sender: TObject);
begin
mskCpf.Clear;
mskCnpj.Clear;
mskCliente.Clear;
btnOK.Visible    := True;
btnPross.Visible := False;
end;

procedure TformSeekCliNFe.btnCancelaClick(Sender: TObject);
begin
StatusCancel := '1';
Close;
end;

procedure TformSeekCliNFe.mskClienteChange(Sender: TObject);
begin
mskCpf.Clear;
mskCnpj.Clear;
mskCodCli.Clear;
btnOK.Visible    := True;
btnPross.Visible := False;
end;

procedure TformSeekCliNFe.mskCpfChange(Sender: TObject);
begin
mskCnpj.Clear;
mskCodCli.Clear;
mskCliente.Clear;
btnOK.Visible    := True;
btnPross.Visible := False;
end;

procedure TformSeekCliNFe.mskCnpjChange(Sender: TObject);
begin
mskCpf.Clear;
mskCodCli.Clear;
mskCliente.Clear;
btnOK.Visible    := True;
btnPross.Visible := False;
end;

procedure TformSeekCliNFe.dblFantasiaClick(Sender: TObject);
begin
btnOK.Visible    := True;
btnPross.Visible := False;
end;

procedure TformSeekCliNFe.dbgClientesCellClick(Column: TColumn);
begin
btnOK.Visible    := False;
btnPross.Visible := True;
end;

procedure TformSeekCliNFe.dbgClientesKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #9) then
 begin
  mskCpf.SetFocus;
 end;
if( (Key = #13)or(Key = #27) )then
 begin
  btnPross.Click;
 end;
end;

procedure TformSeekCliNFe.btnProssClick(Sender: TObject);
begin
{if( (strTipoVenda = 'PENDURA')and(dmBaseDados.tblClientesClienteCompra.AsString <> 'FATURADO') )then
 begin
  Application.MessageBox('Atenção, Cliente não compra Faturado!','ATENÇÃO!',MB_ICONEXCLAMATION);
  Abort;
 end;}
Close;
end;

procedure TformSeekCliNFe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (key = VK_F1) then
 begin
  btnPross.Visible := True;
  btnOK.Visible    := False;
  edtFiltrocliente.SetFocus;
 end;
if (key = VK_F2) then
 begin
  mskCpf.Text := '              ';
  mskCpf.SetFocus;
 end;
if (key = VK_F3) then
 begin
  mskCodCli.Text := '              ';
  mskCodCli.SetFocus;
 end;
if (key = VK_F4) then
 begin
  mskCnpj.Text := '              ';
  mskCnpj.SetFocus;
 end;
if (key = VK_F5) then
 begin
  mskCliente.Text := '              ';
  mskCliente.SetFocus;
 end;
{if (key = VK_F6) then
 begin
  btnCad.Click;
 end; }
end;

procedure TformSeekCliNFe.edtFiltroclienteKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  dbgClientes.SetFocus;
  dbgClientes.SelectedField := dmBaseDados.tblClientesNomeCliente;
 end;
if (Key = #27) then
 begin
  btnPross.Click;
 end;
end;

procedure TformSeekCliNFe.btnCadClick(Sender: TObject);
begin
//StsCad := 1;
//formClientes.ShowModal;
end;

end.
