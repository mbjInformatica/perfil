unit RelSelVendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Mask;

type
  TformSelVendedor = class(TForm)
    lblSelVendedor : TLabel;
    bbtSelVendedor : TBitBtn;
    bbtSelCancelar : TBitBtn;
    edtSelVendedor: TEdit;
    rdbAtivo: TRadioButton;
    rdbBloqueado: TRadioButton;
    rdbCancelado: TRadioButton;
    rdbInativo: TRadioButton;
    ckbTodos: TCheckBox;
    Label1: TLabel;
    procedure bbtSelCancelarClick(Sender: TObject);
    procedure bbtSelVendedorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelVendedor: TformSelVendedor;

implementation

uses
        ModuloDados,MenuPrincipal,Funcionarios,RotinasGerais, RelClientes;

{$R *.DFM}

procedure TformSelVendedor.bbtSelCancelarClick(Sender: TObject);
begin
        Close;
end;

procedure TformSelVendedor.bbtSelVendedorClick(Sender: TObject);
var strVendedor : String;
begin
    if rdbAtivo.Checked = True then
      begin
        strVendedor                       := edtSelVendedor.Text;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblFuncionarios.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCliente';
        formRelClientes.lblOrdem.Caption  := 'Vendedor :'+ strVendedor;
        dmBaseDados.tblClientes.Filter    := '(('+'CodigoVendedor1 = '+QuotedStr(strVendedor)+')or('+'CodigoVendedor2 = '+QuotedStr(strVendedor)+'))and('+'Situacao ='+QuotedStr('A')+')';
        dmBaseDados.tblClientes.Filtered  := True;
        formRelClientes.rptClientes.Preview;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblFuncionarios.Close;
      end;
    if rdbInativo.Checked = True then
      begin
        strVendedor                       := edtSelVendedor.Text;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblFuncionarios.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCliente';
        formRelClientes.lblOrdem.Caption  := 'Vendedor :'+ strVendedor;
        dmBaseDados.tblClientes.Filter    := '(('+'CodigoVendedor1 = '+QuotedStr(strVendedor)+')or('+'CodigoVendedor2 = '+QuotedStr(strVendedor)+'))and('+'Situacao ='+QuotedStr('I')+')';
        dmBaseDados.tblClientes.Filtered  := True;
        formRelClientes.rptClientes.Preview;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblFuncionarios.Close;
      end;
    if rdbCancelado.Checked = True then
      begin
        strVendedor                       := edtSelVendedor.Text;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblFuncionarios.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCliente';
        formRelClientes.lblOrdem.Caption  := 'Vendedor :'+ strVendedor;
        dmBaseDados.tblClientes.Filter    := '(('+'CodigoVendedor1 = '+QuotedStr(strVendedor)+')or('+'CodigoVendedor2 = '+QuotedStr(strVendedor)+'))and('+'Situacao ='+QuotedStr('C')+')';
        dmBaseDados.tblClientes.Filtered  := True;
        formRelClientes.rptClientes.Preview;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblFuncionarios.Close;
      end;
    if rdbBloqueado.Checked = True then
      begin
        strVendedor                       := edtSelVendedor.Text;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblFuncionarios.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCliente';
        formRelClientes.lblOrdem.Caption  := 'Vendedor :'+ strVendedor;
        dmBaseDados.tblClientes.Filter    := '(('+'CodigoVendedor1 = '+QuotedStr(strVendedor)+')or('+'CodigoVendedor2 = '+QuotedStr(strVendedor)+'))and('+'Situacao ='+QuotedStr('B')+')';
        dmBaseDados.tblClientes.Filtered  := True;
        formRelClientes.rptClientes.Preview;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblFuncionarios.Close;
      end;
    if ckbTodos.Checked = True then
      begin
        strVendedor                       := edtSelVendedor.Text;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblFuncionarios.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCliente';
        formRelClientes.lblOrdem.Caption  := 'Vendedor :'+ strVendedor;
        dmBaseDados.tblClientes.Filter    := '(('+'CodigoVendedor1 = '+QuotedStr(strVendedor)+')or('+'CodigoVendedor2 = '+QuotedStr(strVendedor)+'))';
        dmBaseDados.tblClientes.Filtered  := True;
        formRelClientes.rptClientes.Preview;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblFuncionarios.Close;
      end;
end;

procedure TformSelVendedor.FormShow(Sender: TObject);
begin
   rdbAtivo.Checked     := False;
   rdbInativo.Checked   := False;
   rdbBloqueado.Checked := False;
   rdbCancelado.Checked := False;
   ckbTodos.Checked     := False;
   edtSelVendedor.Text  := '00';
   edtSelVendedor.SetFocus;
end;

end.
