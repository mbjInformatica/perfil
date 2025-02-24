unit ContasPagarBKP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TformContasPagarBKP = class(TForm)
    lblMensagem: TLabel;
    lblDtI: TLabel;
    lblDtF: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    ckbEmissao: TCheckBox;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formContasPagarBKP: TformContasPagarBKP;

implementation

uses ModuloDados, RelContasPagar;

{$R *.DFM}

procedure TformContasPagarBKP.FormShow(Sender: TObject);
begin
   Screen.Cursor             := CrHourGlass;
   Data1.Date                := Date;
   Data2.Date                := Date;
   Screen.Cursor             := CrDefault;
   pgrProcessamento.Position := 0;
   ckbEmissao.Checked        := False;
   Data1.SetFocus;
end;

procedure TformContasPagarBKP.btnOKClick(Sender: TObject);
var
   strDataE,strDataV,strNumeroDoc,strCliente,strFormaPagamento,strObservacao,strStatus: string;
   dtant : TDateTime;
   SubTotal : Double;
   begin
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblContasPgBKP.Open;
   dmBaseDados.tblContasPgBKP.IndexName  := 'IndDataVencimento';
   formRelContasPagar.lblTipoRel.Caption := 'Ordem de: Vencimento';
   if ckbEmissao.Checked=False then
      dmBaseDados.tblContasPgBKP.Filter  := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')'
   else
   begin
        formRelContasPagar.lblTipoRel.Caption := 'Ordem de: Emissão';
        dmBaseDados.tblContasPgBKP.IndexName  := 'IndDataEmissao';
        dmBaseDados.tblContasPgBKP.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
   end;
   dmBaseDados.tblContasPgBKP.Filtered := True;
   dtant                :=dmBaseDados.tblContasPgBKPDataVencimento.AsDateTime;
   strStatus            :=dmBaseDados.tblLogMensalCodigoMovimento.AsString; //este campo é = status do ctrec "Alpha 1"
   pgrProcessamento.Max := dmBaseDados.tblContasPgBKP.RecordCount;
   SubTotal             :=0;
   while (not dmBaseDados.tblContasPgBKP.Eof ) do
   begin
      //if dmBaseDados.tblContasPgBKPStatus.AsString=strStatus Then
      //begin
         strDataE          := DateToStr(dmBaseDados.tblContasPgBKPDataEmissao.AsDateTime);
         strDataV          := DateToStr(dmBaseDados.tblContasPgBKPDataVencimento.AsDateTime);
         strNumeroDoc      := dmBaseDados.tblContasPgBKPNumeroDocumento.AsString;
         strCliente        := dmBaseDados.tblContasPgBKPFornecedor.AsString;
         strObservacao     := dmBaseDados.tblContasPgBKPObservacao.AsString;
         strFormaPagamento := dmBaseDados.tblContasPgBKPFormaPagamento.AsString;
         dmBaseDados.tblLogMensal.Append;
         dmBaseDados.tblLogMensalCodigoProduto.AsString    := strDataE;
         dmBaseDados.tblLogMensalDataLancamento.AsDateTime := StrToDate(strDataV);
         dmBaseDados.tblLogMensalDescricao.AsString        := strCliente;
         dmBaseDados.tblLogMensalDocumento.AsString        := strNumeroDoc;
         dmBaseDados.tblLogMensalObservacao.AsString       := strObservacao;
         dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dmBaseDados.tblContasPgBKPValorDocumento.AsFloat;
         dmBaseDados.tblLogMensalUnidadeMedida.AsString    := strFormaPagamento;
         dmBaseDados.tblLogMensal.Post;
         SubTotal:=SubTotal+dmBaseDados.tblContasPgBKPValorDocumento.AsFloat;
      //end;
      dmBaseDados.tblContasPgBKP.Next;
      if ((dtAnt<>dmBaseDados.tblContasPgBKPDataVencimento.AsDateTime) or (dmBaseDados.tblContasPgBKP.Eof)) then
         begin
         dmBaseDados.tblLogMensal.Edit;
         dmBaseDados.tblLogMensalSubtotal.AsFloat:=SubTotal;
         dmBaseDados.tblLogMensal.Post;
         SubTotal:=0;
         dtant:=dmBaseDados.tblContasPgBKPDataVencimento.AsDateTime;
         end;
      pgrProcessamento.Position := pgrProcessamento.Position+1;
   end;
   dmBaseDados.tblLogMensal.First;
   dmBaseDados.tblContasPgBKP.Filter     := '';
   dmBaseDados.tblContasPgBKP.Filtered   := False;
   dmBaseDados.tblContasPgBKP.IndexName  := '';
   dmBaseDados.tblContasPgBKP.Close;
   formRelContasPagar.lblInicio.Caption  := (DateToStr(Data1.Date));
   formRelContasPagar.lblFim.Caption     := (DateToStr(Data2.Date));
   formRelContasPagar.rptContasPagar.Preview;
   formRelContasPagar.lblTipoRel.Caption := '';
   dmBaseDados.tblLogMensal.Close;
end;

end.
