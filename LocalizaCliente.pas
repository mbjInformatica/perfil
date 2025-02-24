unit LocalizaCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, TISEdit, TIGradient, TISButton, TIGradientCaption, db,
  ACBrBase, ACBrSocket, ACBrCEP;

type
  TformLocalizaCliente = class(TForm)
    lblCEP      : TLabel;
    fldCepteste: TTISEdit;
    mskCpf: TMaskEdit;
    mskCnpj: TMaskEdit;
    rdCPF: TTISRadioButton;
    rdCNPJ: TTISRadioButton;
    TIGradientCaption1: TTIGradientCaption;
    TISButton1: TTISButton;
    TIGradient1: TTIGradient;
    ACBrCEP1: TACBrCEP;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdCPFClick(Sender: TObject);
    procedure rdCNPJClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formLocalizaCliente: TformLocalizaCliente;

implementation

uses ModuloDados, RotinasGerais, clientes;


{$R *.DFM}


procedure TformLocalizaCliente.btnOKClick(Sender: TObject);
Var wCep, fldEndereco, fldBairro, fldCidade,
    fldEstado,fldCep, fldIBGE, strCGC: String;
begin
if (fldCepteste.Text = '') then
 begin
  ShowMessage('Campo Obrigatório: Preencha o CEP do cliente!');
  fldCepteste.SetFocus;
  Abort;
 end;
if( (rdCPF.Checked = True)and(mskCpf.Text = '   .   .   -  ') )then
 begin
  ShowMessage('Campo Obrigatório: Preencha o CPF/CNPJ do cliente!');
  Abort;
 end;
if( (rdCNPJ.Checked = True)and(mskCnpj.Text = '  .   .   /    -  ') )then
 begin
  ShowMessage('Campo Obrigatório: Preencha o CPF/CNPJ do cliente!');
  Abort;
 end;
dmBaseDados.tblClientes.IndexName := 'IndCNPJCliente';
if (rdCPF.Checked = True) then
 begin
  strCGC := mskCPF.Text;
 end;
if (rdCNPJ.Checked = True) then
 begin
  strCGC := mskCNPJ.text;
 end;
if( (not dmBaseDados.tblClientes.FindKey([strCGC])) )then
  begin
   dmBaseDados.tblClientes.Append;
   if (rdCPF.Checked = True) then
    begin
     dmBaseDados.tblClientesNumeroCIC.AsString := mskCPF.text;
    end;
   if (rdCNPJ.Checked = True) then
    begin
     dmBaseDados.tblClientesNumeroCIC.Text     := mskCNPJ.text;
    end;
   dmBaseDados.tblClientesDataUltimaCompra.AsDateTime := Date;
   //--
   wCep := fldCepteste.Text;
   ACBrCEP1.BuscarPorCEP(wCep);

   //if (dmBaseDados.tblCeplog.FindKey([wCep])) then
   if (ACBrCEP1.Enderecos.Count > 0) then
    Begin
     {fldEndereco := dmBaseDados.tblCeplogTipo.Text+' '+dmBaseDados.tblCeplogTitulo.Text+' '+
     dmBaseDados.tblCeplogPreposicao.Text+' '+dmBaseDados.tblCeplogNome.Text;
     fldBairro   := dmBaseDados.tblCeplogBairro1.Text;
     fldEstado   := dmBasedados.tblCeplogUF.Text;
     fldCidade   := dmBaseDados.tblCepcidCidade.Text;
     fldCep      := fldCepteste.Text;}

     with ACBrCEP1.Enderecos[0] do
      begin
       fldEndereco := Tipo_Logradouro+ '' +Logradouro;
       fldBairro   := Bairro;
       fldEstado   := UF;
       fldCidade   := Municipio;
       fldCep      := CEP;
       fldIBGE     := IBGE_Municipio;
      end;

     if fldCidade = 'S PAULO' then
      begin
       fldCidade := 'SAO PAULO';
      end;
     dmBaseDados.tblClientesEnderecoResidencia.Text := fldEndereco;
     dmBaseDados.tblClientesBairro.Text             := fldBairro;
     dmBaseDados.tblClientesCidade.Text             := fldCidade;
     dmBaseDados.tblClientesEstado.Text             := fldEstado;
     dmBaseDados.tblClientesCep.Text                := fldCep; //Copy(fldCep,1,5)+'-'+Copy(fldCep,6,3);
     dmBaseDados.tblClientesCodigoIBGE.AsString     := fldIBGE;
     {
     if (dmBaseDados.tblCidades.Locate('Cidade',fldCidade,[loCaseInsensitive])= TRUE) then
      begin
       dmBaseDados.tblClientesCodigoIBGE.AsString := dmBaseDados.tblCidadesCodigo.AsString;
      end;
      }
     formClientes.btnAlterar.Click; 
     Close;
    end
   else
    begin
     ShowMessage('O CEP não é válido! Redigite!');
     Abort;
    end;
  end
else
  begin
   Mensagem('Cliente já cadastrado! CNPJ/CPF já existente!');
   Close;
  end;
end;

procedure TformLocalizaCliente.FormShow(Sender: TObject);
begin
mskCpf.Clear;
mskCnpj.Clear;
fldCepteste.text := '';
rdCPF.Checked    := True;
mskCpf.Visible   := True;
mskCnpj.Visible  := False;
dmBaseDados.tblCeplog.Open;
dmBaseDados.tblCepcid.Open;
dmBaseDados.tblCidades.Open;
end;

procedure TformLocalizaCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblCeplog.Close;
dmBaseDados.tblCepcid.Close;
dmBaseDados.tblCidades.Close;
formClientes.btnGravar.Enabled        := True;
formClientes.btnExcluir.Enabled       := True;
formClientes.fldNomeCliente.ReadOnly  := False;
formClientes.fldNomeFantasia.ReadOnly := False;
formClientes.fldSituacao.ReadOnly     := False;
formClientes.fldDataCadastro.ReadOnly := False;
formClientes.fldEndereco.ReadOnly     := False;
formClientes.fldNumero.ReadOnly       := False;
formClientes.fldComplemento.ReadOnly  := False;
formClientes.fldCidade.ReadOnly       := False;
formClientes.fldBairro.ReadOnly       := False;
formClientes.fldEstado.ReadOnly       := False;
formClientes.fldCEP.ReadOnly          := False;
formClientes.fldContado.ReadOnly      := False;
formClientes.fldTelefone.ReadOnly     := False;
formClientes.fldFax.ReadOnly          := False;
formClientes.fldEmail.ReadOnly        := False;
formClientes.fldObs.ReadOnly          := False;
end;

procedure TformLocalizaCliente.rdCPFClick(Sender: TObject);
begin
mskCpf.Visible  := True;
mskCnpj.Visible := False;
end;

procedure TformLocalizaCliente.rdCNPJClick(Sender: TObject);
begin
mskCnpj.Visible := True;
mskCpf.Visible  := False;
end;

end.

