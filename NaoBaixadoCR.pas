unit NaoBaixadoCR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls,db;

type
  TformNaoBaixadoCR = class(TForm)
    lblDtI: TLabel;
    lblDtF: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNaoBaixadoCR: TformNaoBaixadoCR;

implementation

uses ModuloDados, RelNaoBaixado;

{$R *.DFM}

procedure TformNaoBaixadoCR.FormShow(Sender: TObject);
begin
Data1.DateTime            := Date;
Data2.DateTime            := Date;
pgrProcessamento.Position :=  0;
end;

procedure TformNaoBaixadoCR.btnOKClick(Sender: TObject);
var
 strValor, strVContasRec : Double;
 strNPedido, strCodCli, strDescricao, strDataEmissao : String;
 strDtBranco,DataEmissao : TDateTime;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblClientes.IndexName      := 'IndCodCli';
dmBaseDados.tblPedidos.Filter          := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')';
dmBaseDados.tblPedidos.Filtered        := True;
pgrProcessamento.Max                   := dmBaseDados.tblPedidos.RecordCount;
strDtBranco := dmBaseDados.tblContasReceberDtBranco.AsDateTime;
 while (not dmBaseDados.tblPedidos.Eof) do
  begin
     strValor    := 0;
     strNPedido  := dmBaseDados.tblPedidosNPedido.AsString;
     strCodCli   := dmBaseDados.tblPedidosCodigoCliente.AsString;
     DataEmissao := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
        while (strNPedido = dmBaseDados.tblPedidosNPedido.AsString)and(not dmBaseDados.tblPedidos.Eof) do
           begin
            strValor := strValor + dmBaseDados.tblPedidosTotal.AsFloat;
            dmBaseDados.tblPedidos.Next;
            pgrProcessamento.Position := pgrProcessamento.Position+1;
           end;
        if (strValor <> 0) then
          begin
            dmBaseDados.tblLogMensal.Append;
            dmBaseDados.tblLogMensalDataLancamento.AsDateTime := DataEmissao;
            dmBaseDados.tblLogMensalValorLancamento.AsFloat   := strValor;
            dmBaseDados.tblLogMensalCodigoProduto.AsString    := strNPedido;
            dmBaseDados.tblClientes.FindKey([strCodCli]);
            dmBaseDados.tblLogMensalDescricao.AsString:=
            strCodCli+'  '+dmBaseDados.tblClientesNomeCliente.AsString;
//            dmBaseDados.tblContasReceber.FindKey([dmBaseDados.tblLogMensalCodigoProduto.AsString]);

dmBaseDados.tblContasReceber.Locate('NumeroDocumento',strNPedido,[LOCASEINSENSITIVE]) ;

             if dmBaseDados.tblContasReceberDataBaixa.AsDateTime = strDtBranco then
               begin
                 dmBaseDados.tblLogMensalUnidadeMedida.AsString := '';
               end
             else
               begin
                 dmBaseDados.tblLogMensalUnidadeMedida.AsString := 'OK';
               end;
            dmBaseDados.tblLogMensal.Post;
          end;
     //dmBaseDados.tblPedidos.Next;
  end;
formRelNaoBaixado.qrpRelNaoBaixado.Preview;
dmBaseDados.tblPedidos.Filter          := '';
dmBaseDados.tblPedidos.Filtered        := False;
dmBaseDados.tblClientes.IndexName      := '';
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblContasReceber.Close;
end;

end.
