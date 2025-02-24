unit SeekClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, DBCGrids, Grids, DBGrids, ComCtrls;

type
  TformSeekClientes = class(TForm)
    lblMensagem   : TLabel;
    mskCliente    : TMaskEdit;
    btnOK         : TBitBtn;
    btnCancela    : TBitBtn;
    lblOu1        : TLabel;
    lblDigiteCpf  : TLabel;
    lblOu2        : TLabel;
    lblDigiteNome : TLabel;
    mskCpf        : TMaskEdit;
    lblCodCli     : TLabel;
    mskCodCli     : TMaskEdit;
    Label1        : TLabel;
    lblou3        : TLabel;
    lblDigiteCNPJ : TLabel;
    mskCnpj       : TMaskEdit;
    dblClientes: TDBLookupComboBox;
    dblFantasia: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    edtLocalizaNome: TEdit;
    lblPesquisarNome: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure dllClientesClick(Sender: TObject);
    procedure edtLocalizaNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekClientes: TformSeekClientes;

implementation

uses ModuloDados, RotinasGerais ,Clientes;

{$R *.DFM}

procedure TformSeekClientes.FormShow(Sender: TObject);
begin
   mskCodCli.Text   := '';
   mskCliente.Text  := '';
   mskCpf.Text      := '';
   mskCnpj.Text     := '';
   mskCodCli.SetFocus;
end;

procedure TformSeekClientes.btnOKClick(Sender: TObject);
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

procedure TformSeekClientes.dllClientesClick(Sender: TObject);
begin
  dmBaseDados.tblClientes.IndexName := 'IndCliente';
end;

procedure TformSeekClientes.edtLocalizaNomeChange(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName := 'IndCliente';
dmBaseDados.tblClientes.FindNearest([edtLocalizaNome.Text]);
end;

end.
