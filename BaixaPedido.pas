unit BaixaPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TFormBaixaPedidos = class(TForm)
    btnRetornar     : TSpeedButton;
    btnImprime      : TSpeedButton;
    gpbNumeroPedido : TGroupBox;
    edtNumeroPedido : TEdit;
    gpbMotorista    : TGroupBox;
    edtMotorista    : TEdit;
    lblDtBx         : TLabel;
    mskDtBaixa      : TMaskEdit;
    procedure btnImprimeClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBaixaPedidos: TFormBaixaPedidos;

implementation

uses ModuloDados, RelVendas, DB;

{$R *.DFM}

procedure TFormBaixaPedidos.btnImprimeClick(Sender: TObject);
var
strCodCli : string;
Dias: Real;
DiasPagamento,PriD,SegD,DtAnt:TDateTime;
Dia,Mes,Ano:Word;
begin
        dmBaseDados.tblPedidos.Filter     := '('+'NPedido = '+QuotedStr(edtNumeroPedido.Text)+')';
        dmBaseDados.tblPedidos.Filtered   := True;
        strCodCli                         := FloatToStr(dmBaseDados.tblPedidosCodigoCliente.AsFloat);
        dmBaseDados.tblRelVendas.EmptyTable;
        dmBaseDados.tblRelVendas.Open;
        dmBaseDados.tblClientes.Open;
        dmBaseDados.tblClientes.IndexName := 'IndCodCli';
        dmBaseDados.tblClientes.FindKey([strCodCli]);
        if ((dmBaseDados.tblPedidosStatus.AsString <> '1')and(dmBaseDados.tblPedidosPagamento.AsString <> 'BO')) then
                Begin
                Application.MessageBox('Pedido Estornado ou já baixado e/ou Bonificação/Troca','Atenção',MB_OK);
                edtNumeroPedido.Clear;
                dmBaseDados.tblClientes.Close;
                dmBaseDados.tblRelVendas.Close;
                end
        else
          begin
            while (not dmBaseDados.tblPedidos.Eof) do
                begin
                dmBasedados.tblRelVendas.Append;
                dmBaseDados.tblRelVendasCodigoProduto.AsString:=
                dmBaseDados.tblPedidosProduto.AsString;
                dmBaseDados.tblRelVendasDescricao.AsString:=
                dmBaseDados.tblPedidosDescricao.AsString;
                dmBaseDados.tblRelVendasUnidade.AsString:=
                dmBaseDados.tblPedidosUnidade.AsString;
                dmBaseDados.tblRelVendasQuantidade.AsFloat :=
                dmBaseDados.tblPedidosQuantidade.AsFloat;
                dmBaseDados.tblRelVendasValorUnitario.AsFloat:=
                dmBaseDados.tblPedidosUnitario.AsFloat;
                dmBaseDados.tblRelVendasValorTotal.AsFloat:=
                dmBaseDados.tblPedidosTotal.AsFloat;
                dmBaseDados.tblRelVendasPeso.AsFloat:=
                dmBaseDados.tblPedidosPeso.AsFloat;
                dmBaseDados.tblRelVendasVencimento.AsDateTime:=
                dmBaseDados.tblPedidosVencimento.AsDateTime;
                dmBaseDados.tblPedidos.Edit;
                if ((dmBaseDados.tblPedidosPagamento.AsString <> 'BO')and(dmBaseDados.tblPedidosPagamento.AsString <> 'TR')) then
                  begin
                   dmBaseDados.tblPedidosStatus.AsString:='2';
                  end;
                dmBaseDados.tblPedidosDataEmissao.AsDateTime :=StrToDate(mskDtBaixa.Text);
                dmBaseDados.tblPedidos.Post;
                dmBaseDados.tblRelVendas.Post;
                dmBaseDados.tblPedidos.Next;
            end;
            formRelVendas.rptVendas.Preview;
            dmBaseDAdos.tblRelVendas.Close;
            dmBaseDados.tblClientes.IndexName := '';
            dmBaseDados.tblPedidos.IndexName  := '';
            dmBaseDados.tblPedidos.Filter     := '';
            dmBaseDados.tblPedidos.Filtered   := False;
            dmBaseDados.tblClientes.Close;
            //dmBaseDados.tblPedidos.Close;
             dmBaseDados.tblContasReceber.Open;
             dmBaseDados.tblContasReceber.First;
               while (not dmBaseDados.tblContasReceber.Eof) do
                    begin
                      if(dmBaseDados.tblContasReceberNumeroDocumento.AsString=edtNumeroPedido.Text)then //and(dmBaseDados.tblContasReceberMotorista.AsString='000')) then
                         begin
                           PriD := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
                           SegD := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
                           DecodeDate(SegD,Ano,Mes,Dia);
                           DecodeDate(PriD,Ano,Mes,Dia);
                           DiasPagamento := PriD-SegD;
                           Dias          := DiasPagamento;
                           dmBaseDados.tblContasReceber.Edit;
                           dmBaseDados.tblContasReceberDataBaixa.AsDateTime      := StrToDate(mskDtBaixa.Text);   //Date;
                           //dmBaseDados.tblContasReceberDataVencimento.AsDateTime := StrToDate(mskDtBaixa.Text) + Int(Dias);                           dmBaseDados.tblContasReceberMotorista.AsString        := edtMotorista.Text;
                           dmBaseDados.tblContasReceberMotorista.AsString        := edtMotorista.Text;
                           dmBaseDados.tblContasReceber.Post;
                           (Application.MessageBox('Pedido BAIXADO com Sucesso!!','Pedido Baixado',MB_OKCANCEL));
                           //ShowMessage('Pedido baixado com sucesso!');
                         end;
                     dmBaseDados.tblContasReceber.Next;
            end;
            dmBaseDados.tblContasReceber.Close;
        end;
        //edtNumeroPedido.Clear;
        //edtNumeroPedido.SetFocus;
        Close;
end;

procedure TFormBaixaPedidos.btnRetornarClick(Sender: TObject);
begin
        Close;
end;

procedure TFormBaixaPedidos.FormShow(Sender: TObject);
begin
        mskDtBaixa.Text := DateToStr(Date);
        //edtMotorista.Clear;
        edtNumeroPedido.Clear;
        edtMotorista.SetFocus;
        dmBaseDados.tblPedidos.Open;
end;

end.
