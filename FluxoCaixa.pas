unit FluxoCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TformFluxoCaixa = class(TForm)
    lblDtI: TLabel;
    lblDtF: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFluxoCaixa: TformFluxoCaixa;

implementation

uses ModuloDados, RFluxoCaixa;

{$R *.DFM}

procedure TformFluxoCaixa.btnOKClick(Sender: TObject);
var strDataE,strDataV,strNumeroDoc,strCliente,strFormaPagamento,strObservacao,strStatus: string;
    dtant, dtantP, dtantR : TDateTime;
    SubTotal : Double;
begin
 dmBaseDados.tblFluxoCaixa.EmptyTable;
 dmBaseDados.tblFluxoCaixa.Open;
 dmBaseDados.tblContasPagar.Open;
 dmBaseDados.tblContasReceber.Open;
 dmBaseDados.tblContasReceber.Filter   := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')';
 dmBaseDados.tblContasPagar.Filter     := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')';
 dmBaseDados.tblContasReceber.Filtered := True;
 dmBaseDados.tblContasPagar.Filtered   := True;
 dtantR     := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
 dtantP     := dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
 dtant      := dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime;
 strStatus  := dmBaseDados.tblFluxoCaixaStatus.AsString;
 SubTotal   := 0;
  while (not dmBaseDados.tblContasReceber.Eof ) do
   begin
        if (dmBaseDados.tblContasReceberStatus.AsString=strStatus) then
                begin
                strDataE         := dmBaseDados.tblContasReceberDataEmissao.AsString;
                strDataV         := dmBaseDados.tblContasReceberDataVencimento.AsString;
                strNumeroDoc     := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
                strCliente       := dmBaseDados.tblContasReceberCliente.AsString;
                strObservacao    := dmBaseDados.tblContasReceberObservacao.AsString;
                strFormaPagamento:= dmBaseDados.tblContasReceberFormaPagamento.AsString;
                dmBaseDados.tblFluxoCaixa.Append;
                dmBaseDados.tblFluxoCaixaDataEmissao.AsDateTime    := dmBaseDados.tblContasReceberDataEmissao.AsDateTime;
                dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
                dmBaseDados.tblFluxoCaixaDescricao.AsString        :='    '+dmBaseDados.tblContasReceberVendedor.AsString+'           '+FloatToStr(dmBaseDados.tblContasReceberCodCli.AsFloat);
                dmBaseDados.tblFluxoCaixaNumeroDoc.AsString        := strNumeroDoc;
                dmBaseDados.tblFluxoCaixaObs.AsString              := strObservacao;
                dmBaseDados.tblFluxoCaixaValorLancamento.AsFloat   := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
                dmBaseDados.tblFluxoCaixaTotalReceber.AsFloat      := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
                dmBaseDados.tblFluxoCaixa.Post;
                end;
        dmBaseDados.tblContasReceber.Next;
        end;
 while (not dmBaseDados.tblContasPagar.Eof ) do
   begin
      if dmBaseDados.tblContasPagarStatus.AsString=strStatus Then
      begin
         strDataE          := DateToStr(dmBaseDados.tblContasPagarDataEmissao.AsDateTime);
         strDataV          := DateToStr(dmBaseDados.tblContasPagarDataVencimento.AsDateTime);
         strNumeroDoc      := dmBaseDados.tblContasPagarNumeroDocumento.AsString;
         strCliente        := dmBaseDados.tblContasPagarFornecedor.AsString;
         strObservacao     := dmBaseDados.tblContasPagarObservacao.AsString;
         strFormaPagamento := dmBaseDados.tblContasPagarFormaPagamento.AsString;
         dmBaseDados.tblFluxoCaixa.Append;
         dmBaseDados.tblFluxoCaixaDataEmissao.AsDateTime    :=dmBaseDados.tblContasPagarDataEmissao.AsDateTime;
         dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime :=dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
         dmBaseDados.tblFluxoCaixaDescricao.AsString        := strCliente;
         dmBaseDados.tblFluxoCaixaNumeroDoc.AsString        := strNumeroDoc;
         dmBaseDados.tblFluxoCaixaObs.AsString              := strObservacao;
         dmBaseDados.tblFluxoCaixaValorLancamento.AsFloat   := (dmBaseDados.tblContasPagarValorDocumento.AsFloat)*(-1);
         dmBaseDados.tblFluxoCaixaTotalPagar.AsFloat        := (dmBaseDados.tblContasPagarValorDocumento.AsFloat)*(-1);
         dmBaseDados.tblFluxoCaixaStatus.AsString           := dmBaseDados.tblContasPagarAsterisco.AsString;
         dmBaseDados.tblFluxoCaixa.Post;
      end;
      dmBaseDados.tblContasPagar.Next;
   end;
 dmBaseDados.tblFluxoCaixa.First;
 dtant  := dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime;
 while (not dmBaseDados.tblFluxoCaixa.Eof) do
   begin
     if ((dtant<>dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime) or (dmBaseDados.tblFluxoCaixa.Eof)) then
         begin
          dmBaseDados.tblFluxoCaixa.Prior;
          dmBaseDados.tblFluxoCaixa.Edit;
          dmBaseDados.tblFluxoCaixaSubTotal.AsFloat := SubTotal;
          dmBaseDados.tblFluxoCaixa.Post;
          SubTotal := 0;
          dmBaseDados.tblFluxoCaixa.Next;
          dtant    := dmBaseDados.tblFluxoCaixaDataVencimento.AsDateTime;
         end;
     SubTotal := SubTotal+dmBaseDados.tblFluxoCaixaValorLancamento.AsFloat;
     dmBaseDados.tblFluxoCaixa.Next;
   end;
 dmBaseDados.tblFluxoCaixa.Edit;
 dmBaseDados.tblFluxoCaixaSubTotal.AsFloat := SubTotal;
 dmBaseDados.tblFluxoCaixa.Post;
 dmBaseDados.tblFluxoCaixa.First;
 dmBaseDados.tblContasReceber.Filter      := '';
 dmBaseDados.tblContasReceber.Filtered    := False;
 dmBaseDados.tblContasPagar.Filtered      := False;
 dmBaseDados.tblContasReceber.IndexName   := '';
 dmBaseDados.tblFluxoCaixa.IndexName      := '';
 formRelFluxoCaixa.lblInicio.Caption      := (DateToStr(Data1.Date));
 formRelFluxoCaixa.lblFim.Caption         := (DateToStr(Data2.Date));
 formRelFluxoCaixa.qrpFluxoCaixa.Preview;
 dmBaseDados.tblContasReceber.Close;
 dmBaseDados.tblContasPagar.Close;
 dmBaseDados.tblFluxoCaixa.Close;
 end;

procedure TformFluxoCaixa.FormShow(Sender: TObject);
begin
   Data1.SetFocus;
   Screen.Cursor := CrHourGlass;
   Data1.Date    := Date;
   Data2.Date    := Date;
   Screen.Cursor := CrDefault;
end;

end.
