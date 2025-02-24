unit Integracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormIntegracao = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIntegracao: TFormIntegracao;

implementation

uses
        ModuloDados;
{$R *.DFM}

procedure TFormIntegracao.Button1Click(Sender: TObject);
var
   TotalPedido:double;
   strNPedido:String;
begin
   dmBaseDados.tblPedidos.Open;
   dmBaseDados.tblClientes.IndexName:='IndCodCli';
   dmBaseDados.tblContasReceber.Open;
   dmBaseDados.tblPedidos.First;
        while (not dmBaseDados.tblPedidos.Eof) do
                begin
                dmBaseDados.tblContasReceber.Append;
                TotalPedido:=0;
                strNPedido:=dmBaseDados.tblPedidosNPedido.AsString;
                dmBaseDados.tblClientes.FindKey([dmBaseDados.tblPedidosCodigoCliente.AsInteger]);
                dmBaseDados.tblContasReceberDataVencimento.AsDateTime:=
                dmBaseDados.tblPedidosVencimento.AsDateTime;
                dmBaseDados.tblContasReceberDataEmissao.AsDateTime:=
                dmBaseDados.tblPedidosDataEmissao.AsDateTime;
                dmBaseDados.tblContasReceberFormaPagamento.AsString:=
                dmBaseDados.tblPedidosPagamento.AsString;
                dmBaseDados.tblContasReceberNumeroCIC.AsString :=
                dmBaseDados.tblClientesNumeroCIC.AsString;
                dmBaseDados.tblContasReceberNumeroDocumento.AsString :=
                dmBaseDados.tblPedidosNPedido.AsString;
                dmBaseDados.tblContasReceberCliente.AsString :=
                dmBaseDados.tblClientesNomeCliente.AsString;
                dmBaseDados.tblContasReceberVendedor.AsString :=
                dmBaseDados.tblPedidosCodigoVendedor.AsString;
                        while  (not dmBaseDados.tblPedidos.Eof)and(strNPedido=dmBaseDados.tblPedidosNPedido.AsString) do
                                begin
                                TotalPedido:=TotalPedido+dmBaseDados.tblPedidosTotal.AsCurrency;
                                dmBaseDados.tblPedidos.Next;
                                end;
                dmBaseDados.tblContasReceberValorDocumento.AsCurrency :=TotalPedido;
                dmBaseDados.tblContasReceber.Post;
                end;
        dmBaseDados.tblClientes.IndexName:='';
        dmBaseDados.tblContasReceber.Close;
        dmBaseDados.tblPedidos.Close;

end;

procedure TFormIntegracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmBaseDados.tblClientes.Close;
end;

procedure TFormIntegracao.FormShow(Sender: TObject);
begin
        dmBaseDados.tblClientes.Open;
end;

end.
