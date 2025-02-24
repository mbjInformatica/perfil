unit Comissaocliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TformComissaocliente = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    rdbData: TRadioGroup;
    Label3: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    bbtVisualizar: TBitBtn;
    bbtSair: TBitBtn;
    pgrProcessamento: TProgressBar;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure bbtVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formComissaocliente: TformComissaocliente;

implementation

uses ModuloDados;

{$R *.DFM}

procedure TformComissaocliente.bbtVisualizarClick(Sender: TObject);
var strquantidade,strtotal:DOUBLE;
begin
{strtotal      := 0;
strquantidade := 0;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblClientes.open;
if rdbData.ItemIndex = 1 then
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')'
        dmBaseDados.tblPedidos.Filtered  := true;
       end
     else
       begin
        dmBaseDados.tblPedidos.Filter    := '('+'DataEmissaoOriginal >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')'
        dmBaseDados.tblPedidos.Filtered  := true;
       end;

//Filtrar vendedor...
   if rdbData.ItemIndex = 1 then
       begin
         dmBaseDados.tblPedidos.Filter    := '(('+'CodigoVendedor = '+QuotedStr(strV1)+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')';
         dmBaseDados.tblPedidos.Filtered  := true;
       end
      else
       begin
         dmBaseDados.tblPedidos.Filter    := '(('+'CodigoVendedor = '+QuotedStr(strV1)+')and('+ 'DataEmissaoOriginal <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status <>'+QuotedStr('0')+')';
         dmBaseDados.tblPedidos.Filtered  := true;
       end;
//Filtrar famila e categoria...
      while (not dmBaseDados.tblPedidos.Eof) do
         begin
            dmBaseDados.tblClientesCodigoCliente.FindKey([dmBaseDados.tblPedidosCodigoCliente.AsString]);
                    while (dmBaseDados.tblClientesCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString) do
                      begin
                        if(((edtFamilia.Text   =  '000') or (edtFamilia.Text   = Copy(dmBaseDados.tblPedidosProduto.AsString,1,3)))
                           and((edtCategoria.Text =  '000') or (edtCategoria.Text = Copy(dmBaseDados.tblPedidosProduto.AsString,4,3))) then
                             begin
                               dmBaseDados.tblLogMensal.Append;
                               strquantidade := dmBaseDados.tblPedidosQuantidade.AsInteger + strquantidade;
                               strtotal      := dmBaseDados.tblPedidosTotal.AsInteger + strtotal;
                               dmBaseDados.tblLogMensalDescricao.AsString := dmBaseDados.tblClientesNomeCliente.asstring;
                               dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosProduto.AsString;
                               dmBaseDados.tblLogMensalQuantidade.AsFloat := strquantidade;
                               dmBaseDados.tblLogMensalValorLancamento.AsFloat := strtotal;
                               dmBaseDados.tblLogMensal.Post;
                             end
                        else
                             begin
                                dmBaseDados.tblPedidos.Next;
                                pgrProcessamento.Position := pgrProcessamento.Position+1;
                             end;
                      end;
         end;
dmBaseDados.tblPedidos.Filter := '';
dmBaseDados.tblPedidos.Filtered:= false;
dmBaseDados.tblPedidos.close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblClientes.close;
 }

end;

end.
