unit ContasReceberBKP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, ExtCtrls, Buttons;

type
  TformContasReceberBKP = class(TForm)
    lblMensagem: TLabel;
    lblVendedor: TLabel;
    lblDtI: TLabel;
    lblDtF: TLabel;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    ckbEmissao: TCheckBox;
    rdgSelecao: TRadioGroup;
    mskVendedor: TMaskEdit;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    edtCliente: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ckbEmissaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formContasReceberBKP: TformContasReceberBKP;

implementation

uses ModuloDados, RelContasReceber, ContasReceber;

{$R *.DFM}

procedure TformContasReceberBKP.btnOKClick(Sender: TObject);
var
   strDataE,strDataV,strNumeroDoc,strCliente,strFormaPagamento,strObservacao,strStatus: string;
   dtant : TDateTime;
   SubTotal, strDnCh : Double;
   begin
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblContasRecBKP.Open;
   if ckbEmissao.Checked=False then
        begin
         dmBaseDados.tblContasRecBKP.IndexName  := 'Indctrdtvenc';
         formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Vencimento';
         dmBaseDados.tblContasRecBKP.Filter     := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')';
        end
   else
        if rdgSelecao.ItemIndex=1 then
                begin
                 formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Emissão';
                 dmBaseDados.tblContasRecBKP.IndexName  := 'IndDataBaixa';
                 dmBaseDados.tblContasRecBKP.Filter     := '('+'DataBaixa >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataBaixa <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Motorista <>'+QuotedStr('000')+')';
                end
        else
                if rdgSelecao.ItemIndex=2 then
                        begin
                         formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Pagamento';
                         dmBaseDados.tblContasRecBKP.IndexName  := 'IndDataPagamento';
                         dmBaseDados.tblContasRecBKP.Filter     := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')';
                        end
                else
                        begin
                         formRelContasReceber.lblTipoRel.Caption := 'Ordem de: Emissão';
                         dmBaseDados.tblContasRecBKP.IndexName  := 'Indctrdtemis';
                         dmBaseDados.tblContasRecBKP.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
                        end;
   dmBaseDados.tblContasRecBKP.Filtered := True;
   dtant:=dmBaseDados.tblContasRecBKPDataVencimento.AsDateTime;
   strStatus:=dmBaseDados.tblLogMensalCodigoMovimento.AsString; //este campo é = status do ctrec "Alpha 1"
   pgrProcessamento.Max := dmBaseDados.tblContasRecBKP.RecordCount;
   SubTotal:=0;
   while (not dmBaseDados.tblContasRecBKP.Eof ) do
   begin
        if (dmBaseDados.tblContasRecBKPStatus.AsString=strStatus) or (rdgSelecao.ItemIndex>0) then
                begin
                 strDataE          := dmBaseDados.tblContasRecBKPDataEmissao.AsString;
                 strDataV          := dmBaseDados.tblContasRecBKPDataVencimento.AsString;
                 strNumeroDoc      := dmBaseDados.tblContasRecBKPNumeroDocumento.AsString;
                 strCliente        := dmBaseDados.tblContasRecBKPCliente.AsString;
                 strObservacao     := dmBaseDados.tblContasRecBKPObservacao.AsString;
                 strFormaPagamento := dmBaseDados.tblContasRecBKPFormaPagamento.AsString;
                 strDnCh           := dmBaseDados.tblContasRecBKPValorCheque.AsFloat+dmBaseDados.tblContasRecBKPValorDinheiro.AsFloat;
                if (((formContasReceber.mskVendedor.Text = '000') or (dmBaseDados.tblContasRecBKPVendedor.AsString=formContasReceber.mskVendedor.Text))
                 and((edtCliente.Text = '0000') or (edtCliente.Text = dmBaseDados.tblContasRecBKPCodCli.AsString))) then
                  begin
                    dmBaseDados.tblLogMensal.Append;
                    dmBaseDados.tblLogMensalCodigoProduto.AsString    := strDataE;
                    dmBaseDados.tblLogMensalDataLancamento.AsDateTime := StrToDate(strDataV);
                    dmBaseDados.tblLogMensalDescricao.AsString        := ''+dmBaseDados.tblContasRecBKPVendedor.AsString+'     '+IntToStr(dmBaseDados.tblContasRecBKPCodCli.AsInteger)+'   '+strCliente;
                    dmBaseDados.tblLogMensalDocumento.AsString        := strNumeroDoc;
                    dmBaseDados.tblLogMensalDiferenca.AsFloat:=ABS(dmBaseDados.tblContasRecBKPDiferenca.AsFloat);
                    if rdgSelecao.ItemIndex>0 then
                     strObservacao := dmBaseDados.tblContasRecBKPMotorista.AsString;
                     dmBaseDados.tblLogMensalObservacao.AsString     := strObservacao;
                     dmBaseDados.tblLogMensalValorLancamento.AsFloat := dmBaseDados.tblContasRecBKPValorDocumento.AsFloat;
                     dmBaseDados.tblLogMensalValorCheque.AsFloat     := dmBaseDados.tblContasRecBKPValorCheque.AsCurrency;
                     dmBaseDados.tblLogMensalValorDinheiro.AsFloat   := dmBaseDados.tblContasRecBKPValorDinheiro.AsFloat;
                     dmBaseDados.tblLogMensalValorCobranca.AsFloat   := (dmBaseDados.tblContasRecBKPValorDocumento.AsFloat)-(strDnCh);
                     dmBaseDados.tblLogMensalUnidadeMedida.AsString  := strFormaPagamento;
                     dmBaseDados.tblLogMensal.Post;
                     SubTotal := SubTotal+dmBaseDados.tblContasRecBKPValorDocumento.AsFloat;
                  end;
        end;
        dmBaseDados.tblContasRecBKP.Next;
        if ((dtAnt<>dmBaseDados.tblContasRecBKPDataVencimento.AsDateTime) or (dmBaseDados.tblContasRecBKP.Eof)) then
                begin
                 dmBaseDados.tblLogMensal.Edit;
                 dmBaseDados.tblLogMensalSubtotal.AsFloat := SubTotal;
                 dmBaseDados.tblLogMensal.Post;
                 SubTotal := 0;
                 dtant    := dmBaseDados.tblContasRecBKPDataVencimento.AsDateTime;
                end;
        pgrProcessamento.Position := pgrProcessamento.Position+1;
        end;
   dmBaseDados.tblLogMensal.First;
   dmBaseDados.tblContasRecBKP.Filter     := '';
   dmBaseDados.tblContasRecBKP.Filtered   := False;
   dmBaseDados.tblContasRecBKP.IndexName  := '';
   dmBaseDados.tblContasRecBKP.Close;
   formRelContasReceber.lblInicio.Caption  := (DateToStr(Data1.Date));
   formRelContasReceber.lblFim.Caption     := (DateToStr(Data2.Date));
   formRelContasReceber.rptContasReceber.Preview;
   formRelContasReceber.lblTipoRel.Caption := '';
   dmBaseDados.tblLogMensal.Close;
end;


procedure TformContasReceberBKP.FormShow(Sender: TObject);
begin
   Screen.Cursor             := CrHourGlass;
   Data1.Date                := Date;
   Data2.Date                := Date;
   Screen.Cursor             := CrDefault;
   mskVendedor.Text          := '000';
   edtCliente.Text           := '0000';
   pgrProcessamento.Position := 0;
   ckbEmissao.Checked        := False;
   rdgSelecao.ItemIndex      := 0;
   rdgSelecao.Enabled        := False;
   Data1.SetFocus;
end;

procedure TformContasReceberBKP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Close;
end;

procedure TformContasReceberBKP.ckbEmissaoClick(Sender: TObject);
begin
        if ckbEmissao.Checked=True Then
          rdgSelecao.Enabled := True
        else
          rdgSelecao.Enabled := False;
end;

end.
