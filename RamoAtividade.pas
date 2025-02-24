unit RamoAtividade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TformRamoAtividade = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    btnCancela: TBitBtn;
    btnOK: TBitBtn;
    edtFamilia: TEdit;
    edtRamo: TEdit;
    pgrProcessamento: TProgressBar;
    Label4: TLabel;
    edtV1: TEdit;
    Label6: TLabel;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    rdbCancelado: TRadioButton;
    rdbBloqueado: TRadioButton;
    ckbTodos: TCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdbCanceladoClick(Sender: TObject);
    procedure rdbInativoClick(Sender: TObject);
    procedure rdbBloqueadoClick(Sender: TObject);
    procedure rdbAtivoClick(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRamoAtividade: TformRamoAtividade;

implementation

uses ModuloDados, RelCheckout, RelRamoAtividade;

{$R *.DFM}

procedure TformRamoAtividade.btnOKClick(Sender: TObject);
var
strCodCli,strDescricao, strNCheckout,strSituacao : String;
strValor : Double;
Arqtxt   : TextFile;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')';
dmBaseDados.tblPedidos.Filtered  := True;
 while (not dmBaseDados.tblPedidos.Eof) do
    begin
     strValor  := 0;
     strCodCli := dmBaseDados.tblPedidosCodigoCliente.AsString;
     dmBaseDados.tblLogMensal.Append;
     while (strCodCli = dmBaseDados.tblPedidosCodigoCliente.AsString) do
        begin
           if(((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
           and((edtV1.Text        =  '000') or (edtV1.Text        = dmBaseDados.tblPedidosCodigoVendedor.AsString)))then
             begin
               strValor := strValor+dmBaseDados.tblPedidosTotal.AsFloat;
             end;
           dmBaseDados.tblPedidos.Next;
           if dmBaseDados.tblPedidos.Eof then break;
         end;
         if strValor <> 0 then
          begin
            dmBaseDados.tblLogMensalValorLancamento.AsFloat := strValor;
            dmBaseDados.tblClientes.Locate('CodigoCliente',strCodCli,[]);
            dmBaseDados.tblLogMensalDescricao.AsString:=
            dmBaseDados.tblClientesCodigoCliente.AsString+'   '+dmBaseDados.tblClientesNomeCliente.AsString;
            dmBaseDados.tblLogMensalCodigoProduto.AsString   := dmBaseDados.tblClientesRamoAtividade.AsString;
            dmBaseDados.tblLogMensalCodigoMovimento.AsString := dmBaseDados.tblClientesSituacao.AsString;
            dmBaseDados.tblLogMensalObservacao.AsString      := dmBaseDados.tblPedidosVendedor.AsString;
            dmBaseDados.tblLogMensal.Post;
          end;
          pgrProcessamento.Position := pgrProcessamento.Position+1;
     //dmBaseDados.tblPedidos.Next;
    end;

dmBaseDados.tblLogMensal.First;
if rdbAtivo.Checked     = True then
 begin
  strSituacao := 'A';
 end;
if rdbInativo.Checked   = True then
 begin
  strSituacao := 'I';
 end;
if rdbBloqueado.Checked = True then
 begin
  strSituacao := 'B';
 end;
if rdbCancelado.Checked = True then
 begin
  strSituacao := 'C';
 end;
if ((edtRamo.Text <> '00')and(strSituacao <> ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'CodigoProduto ='+QuotedStr(edtRamo.Text)+')and('+'CodigoMovimento ='+QuotedStr(strSituacao)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
 if ((edtRamo.Text <> '00')and(strSituacao = ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'CodigoProduto ='+QuotedStr(edtRamo.Text)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
 if ((edtRamo.Text = '00')and(strSituacao <> ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'CodigoMovimento ='+QuotedStr(strSituacao)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
{AssignFile(Arqtxt,'RamoAtv.doc');
Rewrite(Arqtxt);
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
   Writeln(Arqtxt,dmBaseDados.tblLogMensalDescricao.Text+'      '+dmBaseDados.tblLogMensalQuantidade.Text+'       '+dmBaseDados.tblLogMensalCodigoMovimento.Text+'        '+dmBaseDados.tblLogMensalValorLancamento.Text);
   dmBaseDados.tblLogMensal.Next;
 end;
CloseFile(Arqtxt);}


formRelRamo.qrpRelRamo.Preview;
dmBaseDados.tblLogMensal.Filter   := '';
dmBaseDados.tblLogMensal.Filtered := False;
dmBaseDados.tblPedidos.Filter     := '';
dmBaseDados.tblPedidos.Filtered   := False;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblClientes.Close;
end;

procedure TformRamoAtividade.FormShow(Sender: TObject);
begin
Data1.Date      := Date;
Data2.Date      := Date;
Data1.SetFocus;
edtRamo.Text    := '00';
edtFamilia.Text := '000';
edtV1.Text      := '000';
ckbTodos.Checked := True;
pgrProcessamento.Position := 0;
end;

procedure TformRamoAtividade.rdbCanceladoClick(Sender: TObject);
begin
if rdbCancelado.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformRamoAtividade.rdbInativoClick(Sender: TObject);
begin
if rdbInativo.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformRamoAtividade.rdbBloqueadoClick(Sender: TObject);
begin
if rdbBloqueado.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformRamoAtividade.rdbAtivoClick(Sender: TObject);
begin
if rdbAtivo.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformRamoAtividade.ckbTodosClick(Sender: TObject);
begin
if ckbTodos.Checked = True then
 begin
  rdbAtivo.Checked     := False;
  rdbInativo.Checked   := False;
  rdbBloqueado.Checked := False;
  rdbCancelado.Checked := False;
 end;
end;

end.
