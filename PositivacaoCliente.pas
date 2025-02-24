unit PositivacaoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TformPositivacaoCliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    btnCancela: TBitBtn;
    btnOK: TBitBtn;
    edtFamilia: TEdit;
    Label5: TLabel;
    edtV1: TEdit;
    Label3: TLabel;
    pgrProcessamento: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPositivacaoCliente: TformPositivacaoCliente;

implementation
uses modulodados, RelPositivacao ;
{$R *.DFM}

procedure TformPositivacaoCliente.FormShow(Sender: TObject);
begin
Data1.Date      := Date;
Data2.Date      := Date;
edtFamilia.Text := '000';
edtV1.Text      := '000';
pgrProcessamento.Position := 0;
end;

procedure TformPositivacaoCliente.btnOKClick(Sender: TObject);
var strCodCli, strPedido, strvendedor :String;
    strData  : TDateTime;
    strValor : Double;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblClientes.Filter   := '('+'Datacadastro >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'Datacadastro <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblClientes.Filtered := True;
dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')';
dmBaseDados.tblPedidos.Filtered  := True;
dmBaseDados.tblClientes.IndexName := 'IndCodCli';
dmBaseDados.tblPedidos.First;
dmBaseDados.tblClientes.First;
   while (not dmBaseDados.tblClientes.Eof) do
      begin
        strValor := 0;
        strCodCli := dmBaseDados.tblClientesCodigoCliente.AsString;
        dmBaseDados.tblPedidos.Locate('CodigoCliente',strCodCli,[]);
       // dmBaseDados.tblClientes.FindKey([strCodcli]);
        strPedido   := dmBaseDados.tblPedidosNPedido.AsString;
        strvendedor := '';
        strData     := dmBaseDados.tblLogMensalDataLancamento.AsDateTime;
        dmBaseDados.tblLogMensal.Append;
            while (strCodCli = dmBaseDados.tblPedidosCodigoCliente.AsString)and(strPedido =  dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) do
              begin
                if(((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                and((edtV1.Text        =  '000') or (edtV1.Text        = dmBaseDados.tblPedidosCodigoVendedor.AsString)))then
                  begin
                   strValor    := strValor+dmBaseDados.tblPedidosTotal.AsFloat;
                   strvendedor := dmBaseDados.tblPedidosVendedor.AsString;
                   strData     := dmBaseDados.tblPedidosDataEmissaoOriginal.AsDateTime;
                  end;
                dmBaseDados.tblPedidos.Next;
                if dmBaseDados.tblPedidos.Eof then break;
              end;
        if strValor <> 0 then
          begin
           dmBaseDados.tblLogMensalValorLancamento.AsFloat := strValor;
           //dmBaseDados.tblClientes.Locate('CodigoCliente',strCodCli,[]);
           dmBaseDados.tblLogMensalDescricao.AsString:=
           dmBaseDados.tblClientesCodigoCliente.AsString+'  '+dmBaseDados.tblClientesNomeCliente.AsString;
           dmBaseDados.tblLogMensalDataLancamento.AsDateTime := strData;// dmBaseDados.tblPedidosDataEmissaoOriginal.AsDateTime;
           dmBaseDados.tblLogMensalCodigoMovimento.AsString  := dmBaseDados.tblClientesSituacao.AsString;
           dmBaseDados.tblLogMensalObservacao.AsString       := strvendedor;// dmBaseDados.tblPedidosVendedor.AsString;
           dmBaseDados.tblLogMensal.Post;
          end;
        pgrProcessamento.Position := pgrProcessamento.Position+1;
        dmBaseDados.tblClientes.Next;
      end;

formRelPositivacao.qrpRelpositivacao.Preview;
dmBaseDados.tblClientes.Filter   := '';
dmBaseDados.tblClientes.Filtered := False;
dmBaseDados.tblClientes.IndexName := '';
dmBaseDados.tblPedidos.Filter     := '';
dmBaseDados.tblPedidos.Filtered   := False;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblClientes.Close;
end;

end.
