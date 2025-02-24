unit Checkout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TformCheckout = class(TForm)
    lblinicial: TLabel;
    lblfinal: TLabel;
    edtfinal: TEdit;
    edtinicial: TEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    Label5: TLabel;
    Label3: TLabel;
    edtFamilia: TEdit;
    edtV1: TEdit;
    pgrProcessamento: TProgressBar;
    Label4: TLabel;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    rdbBloqueado: TRadioButton;
    rdbCancelado: TRadioButton;
    ckbTodos: TCheckBox;
    edtCategoria: TEdit;
    lblcategoria: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbTodosClick(Sender: TObject);
    procedure rdbAtivoClick(Sender: TObject);
    procedure rdbBloqueadoClick(Sender: TObject);
    procedure rdbInativoClick(Sender: TObject);
    procedure rdbCanceladoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCheckout: TformCheckout;

implementation

uses ModuloDados, RelCheckout;

{$R *.DFM}

procedure TformCheckout.btnOKClick(Sender: TObject);
var
strCodCli,strDescricao, strNCheckout,strSituacao,strvendedor : String;
strquantidade,strValor : Double;
Arqtxt : TextFile;
begin
strvendedor := '';
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblFuncionarios.Open;
dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')';
dmBaseDados.tblPedidos.Filtered  := True;
 while (not dmBaseDados.tblPedidos.Eof) do
    begin
     strquantidade := 0;
     strValor  := 0;
     strCodCli := dmBaseDados.tblPedidosCodigoCliente.AsString;
     dmBaseDados.tblLogMensal.Append;
     while (strCodCli = dmBaseDados.tblPedidosCodigoCliente.AsString) do
        begin
           if(((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
            and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3)))
           and((edtV1.Text        =  '000') or (edtV1.Text        = dmBaseDados.tblPedidosCodigoVendedor.AsString)))then
             begin
               strValor := strValor+dmBaseDados.tblPedidosTotal.AsFloat;
               strquantidade := strquantidade+dmBaseDados.tblPedidosQuantidade.AsFloat;
               strvendedor := dmBaseDados.tblPedidosVendedor.AsString;
             end;

           dmBaseDados.tblPedidos.Next;
           if dmBaseDados.tblPedidos.Eof then break;
        end;
         if strValor <> 0 then
          begin
            dmBaseDados.tblLogMensalValorLancamento.AsFloat := strValor;
            dmBaseDados.tblLogMensalTroco.AsFloat           := strquantidade;
            dmBaseDados.tblLogMensalObservacao.AsString      := strvendedor;
            dmBaseDados.tblClientes.Locate('CodigoCliente',strCodCli,[]);
            dmBaseDados.tblLogMensalDescricao.AsString:=
            dmBaseDados.tblClientesCodigoCliente.AsString+'   '+dmBaseDados.tblClientesNomeCliente.AsString;
            dmBaseDados.tblLogMensalQuantidade.AsFloat       := dmBaseDados.tblClientesNChekout.AsFloat;
            dmBaseDados.tblLogMensalCodigoMovimento.AsString := dmBaseDados.tblClientesSituacao.AsString;
      //     dmBaseDados.tblLogMensalObservacao.AsString      := dmBaseDados.tblPedidosVendedor.AsString;
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
if ((edtinicial.Text <> '00')and(strSituacao <> ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'Quantidade >='+QuotedStr(edtinicial.Text)+')and('+'Quantidade<='+QuotedStr(edtfinal.Text)+')and('+'CodigoMovimento ='+QuotedStr(strSituacao)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
 if ((edtinicial.Text <> '00')and(strSituacao = ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'Quantidade >='+QuotedStr(edtinicial.Text)+')and('+'Quantidade<='+QuotedStr(edtfinal.Text)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
 if ((edtinicial.Text = '00')and(strSituacao <> ''))  then
 begin
  dmBaseDados.tblLogMensal.Filter   := '('+'CodigoMovimento ='+QuotedStr(strSituacao)+')';
  dmBaseDados.tblLogMensal.Filtered := True;
 end;
{AssignFile(Arqtxt,'Checkout.doc');
Rewrite(Arqtxt);
while (not dmBaseDados.tblLogMensal.Eof) do
 begin
   Writeln(Arqtxt,dmBaseDados.tblLogMensalDescricao.Text+'      '+dmBaseDados.tblLogMensalQuantidade.Text+'       '+dmBaseDados.tblLogMensalCodigoMovimento.Text+'        '+dmBaseDados.tblLogMensalValorLancamento.Text);
   dmBaseDados.tblLogMensal.Next;
 end;
CloseFile(Arqtxt);}
formRelCheckout.qrpRelCheckout.Preview;
dmBaseDados.tblPedidos.Filter     := '';
dmBaseDados.tblPedidos.Filtered   := False;
dmBaseDados.tblLogMensal.Filter   := '';
dmBaseDados.tblLogMensal.Filtered := False;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblFuncionarios.Close;
end;

procedure TformCheckout.FormShow(Sender: TObject);
begin
Data1.Date       := Date;
Data2.Date       := Date;
Data1.SetFocus;
edtV1.Text       := '000';
edtfinal.Text    := '00';
edtinicial.Text  := '00';
edtFamilia.Text  := '000';
edtCategoria.Text:= '000';
ckbTodos.Checked := True;
pgrProcessamento.Position := 0;
end;

procedure TformCheckout.ckbTodosClick(Sender: TObject);
begin
if ckbTodos.Checked = True then
 begin
  rdbAtivo.Checked     := False;
  rdbInativo.Checked   := False;
  rdbBloqueado.Checked := False;
  rdbCancelado.Checked := False;
 end;
end;

procedure TformCheckout.rdbAtivoClick(Sender: TObject);
begin
if rdbAtivo.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformCheckout.rdbBloqueadoClick(Sender: TObject);
begin
if rdbBloqueado.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformCheckout.rdbInativoClick(Sender: TObject);
begin
if rdbInativo.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

procedure TformCheckout.rdbCanceladoClick(Sender: TObject);
begin
if rdbCancelado.Checked = True then
 begin
  ckbTodos.Checked   := False;
 end;
end;

end.
