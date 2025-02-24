unit ContasPagarN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ContasReceber, StdCtrls, ComCtrls, Buttons, Mask, ContasPagar, ExtCtrls;

type
  TformContasPagarN = class(TformContasReceber)
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formContasPagarN: TformContasPagarN;

implementation

uses ModuloDados, RelContasPagarN, RelContasReceber;

{$R *.DFM}

procedure TformContasPagarN.btnOKClick(Sender: TObject);
var
   strDataE,strDataV,strNumeroDoc,strCliente,strFormaPagamento,strObservacao,strStatus: string;
   dtant : TDateTime;
   SubTotal : Double;
begin
  inherited;
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblContasPagar.Open;
   dmBaseDados.tblContasPagar.IndexName := 'IndDataVencimento';
   formRelContasPagarN.lblTipoRel.Caption := 'Ordem de: Vencimento';
   if ckbEmissao.Checked=False then
      dmBaseDados.tblContasPagar.Filter := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')'
   else
   begin
        formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Emissão';
        dmBaseDados.tblContasPagar.IndexName := 'IndDataEmissao';
        dmBaseDados.tblContasPagar.Filter := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
   end;
   dmBaseDados.tblContasPagar.Filtered := True;
   dtant:=dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
   strStatus:=dmBaseDados.tblLogMensalCodigoMovimento.AsString; //este campo é = status do ctrec "Alpha 1"
   pgrProcessamento.Max := dmBaseDados.tblContasPagar.RecordCount;
   SubTotal:=0;
   while (not dmBaseDados.tblContasPagar.Eof ) do
   begin
      if dmBaseDados.tblContasPagarStatus.AsString=strStatus Then
      begin
         strDataE         := DateToStr(dmBaseDados.tblContasPagarDataEmissao.AsDateTime);
         strDataV         := DateToStr(dmBaseDados.tblContasPagarDataVencimento.AsDateTime);
         strNumeroDoc     := dmBaseDados.tblContasPagarNumeroDocumento.AsString;
         strCliente       := dmBaseDados.tblContasPagarFornecedor.AsString;
         strObservacao    := dmBaseDados.tblContasPagarObservacao.AsString;
         strFormaPagamento:= dmBaseDados.tblContasPagarFormaPagamento.AsString;
         dmBaseDados.tblLogMensal.Append;
         dmBaseDados.tblLogMensalCodigoProduto.AsString    := strDataE;
         dmBaseDados.tblLogMensalDataLancamento.AsDateTime := StrToDate(strDataV);
         dmBaseDados.tblLogMensalDescricao.AsString     := strCliente;
         dmBaseDados.tblLogMensalDocumento.AsString     := strNumeroDoc;
         dmBaseDados.tblLogMensalObservacao.AsString     := strObservacao;
         dmBaseDados.tblLogMensalValorLancamento.AsFloat:= dmBaseDados.tblContasPagarValorDocumento.AsFloat;
         dmBaseDados.tblLogMensalUnidadeMedida.AsString := strFormaPagamento;
         dmBaseDados.tblLogMensal.Post;
         SubTotal:=SubTotal+dmBaseDados.tblContasPagarValorDocumento.AsFloat;
      end;
      dmBaseDados.tblContasPagar.Next;
      if ((dtAnt<>dmBaseDados.tblContasPagarDataVencimento.AsDateTime) or (dmBaseDados.tblContasPagar.Eof)) then
         begin
         dmBaseDados.tblLogMensal.Edit;
         dmBaseDados.tblLogMensalSubtotal.AsFloat:=SubTotal;
         dmBaseDados.tblLogMensal.Post;
         SubTotal:=0;
         dtant:=dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
         end;
      pgrProcessamento.Position := pgrProcessamento.Position+1;
   end;
   dmBaseDados.tblLogMensal.First;
   dmBaseDados.tblContasPagar.Filter   := '';
   dmBaseDados.tblContasPagar.Filtered := False;
   dmBaseDados.tblContasPagar.IndexName := '';
   dmBaseDados.tblContasPagar.Close;
   formRelContasPagarN.lblInicio.Caption := 'Período de '+DateToStr(Data1.Date)+' à '+DateToStr(Data2.Date);
//   formRelContasPagarN.lblFim.Caption := (DateToStr(Data2.Date));
   formRelContasPagarN.rptContasReceber.Preview;
   formRelContasPagarN.lblTipoRel.Caption := '';
   dmBaseDados.tblLogMensal.Close;
end;

end.
