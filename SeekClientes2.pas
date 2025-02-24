unit SeekClientes2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask, Grids, DBGrids, db;

type
  TformSeekClientes2 = class(TForm)
    lblMensagem: TLabel;
    lblOu1: TLabel;
    lblDigiteCpf: TLabel;
    lblOu2: TLabel;
    lblDigiteNome: TLabel;
    lblCodCli: TLabel;
    Label1: TLabel;
    lblou3: TLabel;
    lblDigiteCNPJ: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mskCliente: TMaskEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    mskCpf: TMaskEdit;
    mskCodCli: TMaskEdit;
    mskCnpj: TMaskEdit;
    dblClientes: TDBLookupComboBox;
    dblFantasia: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    edtFiltrocliente: TEdit;
    Label4: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure dllClientesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFiltroclienteChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekClientes2: TformSeekClientes2;

implementation
uses ModuloDados, RotinasGerais ,Clientes, Consulta;

{$R *.DFM}

procedure TformSeekClientes2.btnOKClick(Sender: TObject);
begin
   dmBaseDados.tblClientes.IndexName := 'IndCodCli';
   if (not dmBaseDados.tblClientes.FindKey([mskCodCli.Text])) then
      begin
      dmBaseDados.tblClientes.IndexName := '';
      if (not dmBaseDados.tblClientes.FindKey([mskCliente.Text])) then
         begin
         dmBaseDados.tblClientes.IndexName := 'IndCnpjCliente';
         if (not dmBaseDados.tblClientes.FindKey([mskCpf.Text])) then
            begin
            if (not dmBaseDados.tblClientes.FindKey([mskCnpj.Text])) then
               begin
               dmBaseDados.tblClientes.IndexName := 'IndCliente';
               if (not dmBaseDados.tblClientes.FindKey([dblClientes.Text])) then
                  begin
                 if (not dmBaseDados.tblClientes.FindKey([dblFantasia.Text])) then
                  begin
                  Mensagem('Cliente não encontrado !');
                  dmBaseDados.tblClientes.First;
               end;
            end;
         end;
      end;
    end;
  end;
   dmBaseDados.tblClientes.IndexName := '';
end;

procedure TformSeekClientes2.dllClientesClick(Sender: TObject);
begin
  dmBaseDados.tblClientes.IndexName := 'IndCliente';
end;

procedure TformSeekClientes2.FormShow(Sender: TObject);
begin
   edtFiltrocliente.Text := '';
   mskCodCli.Text   := '';
   mskCliente.Text  := '';
   mskCpf.Text      := '';
   mskCnpj.Text     := '';
  // dmBaseDados.tblContasReceber.Open;
   mskCodCli.SetFocus;
end;

procedure TformSeekClientes2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblClientes.IndexName := '';
formConsulta.ShowModal;

//dmBaseDados.tblContasReceber.Close;
end;

procedure TformSeekClientes2.edtFiltroclienteChange(Sender: TObject);
begin
   // dmBaseDados.tblClientes.Locate('NomeCliente',edtFiltrocliente.Text,[LOCASEINSENSITIVE]);
//           dmBaseDados.tblClientes.Filter := '('+'NomeCliente >='+ QuotedStr(edtFiltrocliente.Text)+')';
//           dmBaseDados.tblClientes.Filtered := true;

//.Filtered := False;
//dmBaseDados.tblClientes.Filter := '( NomeCliente = ' + QuotedStr(edtFiltrocliente.Text + '%') + ')';
//dmBaseDados.tblClientes.Filtered := True;

dmBaseDados.tblClientes.IndexName:= 'IndCliente';
dmBaseDados.tblClientes.FindNearest([edtFiltrocliente.Text]);

end;

end.
