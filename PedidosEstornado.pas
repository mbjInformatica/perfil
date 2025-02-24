unit PedidosEstornado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask;

type
  TfrmEstornados = class(TForm)
    Data1       : TDateTimePicker;
    Data2       : TDateTimePicker;
    btGera      : TBitBtn;
    lblVendedor : TLabel;
    mskVendedor : TMaskEdit;
    lblDtF      : TLabel;
    lblDtI      : TLabel;
    procedure FormShow(Sender: TObject);
    procedure btGeraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstornados: TfrmEstornados;

implementation

uses ModuloDados, RelPedidosEstornados;

{$R *.DFM}

procedure TfrmEstornados.FormShow(Sender: TObject);
begin
Screen.Cursor    := CrHourGlass;
Data1.Date       := Date;
Data2.Date       := Date;
Screen.Cursor    := CrDefault;
mskVendedor.Text := '000';
end;

procedure TfrmEstornados.btGeraClick(Sender: TObject);
var strNPedido, strCliente, strVendedor : String;
    DataEmissao : TDateTime;
    Valor       : Double;
begin
 dmBaseDados.tblLogMensal.EmptyTable;
 dmBaseDados.tblLogMensal.Open;
 dmBaseDados.tblPedidos.Open;
  if mskVendedor.Text =  '000' then
   begin
     dmBaseDados.tblPedidos.Filter   := '('+'Pagamento='+QuotedStr('ES')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
     dmBaseDados.tblPedidos.Filtered := True;
   end;
  if mskVendedor.Text <> '000' then
   begin
     dmBaseDados.tblPedidos.Filter   := '('+'Pagamento='+QuotedStr('ES')+')and('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+') and ('+ 'CodigoVendedor ='+mskVendedor.Text+')';
     dmBaseDados.tblPedidos.Filtered := True;
  end;
 while (not dmBaseDados.tblPedidos.Eof) do
  begin
   Valor       := 0;
   strNPedido  := dmBaseDados.tblPedidosNPedido.AsString;
     while (strNPedido = dmBaseDados.tblPedidosNPedido.AsString) and (not dmBaseDados.tblPedidos.Eof) do
      begin
       Valor       := Valor+dmBaseDados.tblPedidosTotal.AsFloat;
       strCliente  := dmBaseDados.tblPedidosCodigoCliente.AsString;
       strVendedor := dmBaseDados.tblPedidosVendedor.AsString;
       DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
       dmBaseDados.tblPedidos.Next;
      end;
   dmBaseDados.tblLogMensal.Append;
   dmBaseDados.tblLogMensalDocumento.AsString        := strNPedido;
   dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCliente;
   dmBaseDados.tblLogMensalDescricao.AsString        := strVendedor;
   dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
   dmBaseDados.tblLogMensalSubtotal.AsFloat          := Valor;
   dmBaseDados.tblLogMensal.Post;
  end;
  formRelPedidosEstornados.qrlDataTitulo.Caption := 'Período de '+DateToStr(frmEstornados.Data1.Date)+' à '+DateToStr(frmEstornados.Data2.Date);
  formRelPedidosEstornados.qrpPedidosEstornados.Preview;
  dmBaseDados.tblPedidos.Filter   := '';
  dmBaseDados.tblPedidos.Filtered := False;
  dmBaseDados.tblLogMensal.Close;
  dmBaseDados.tblPedidos.Close;
end;
end.
