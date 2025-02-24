unit ContasPagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TformContasPagar = class(TForm)
    btnOK            : TBitBtn;
    btnCancela       : TBitBtn;
    pgrProcessamento : TProgressBar;
    lblMensagem      : TLabel;
    ckbEmissao       : TCheckBox;
    lblDtI           : TLabel;
    lblDtF           : TLabel;
    Data1            : TDateTimePicker;
    Data2            : TDateTimePicker;
    ckbBaixados      : TCheckBox;
    edtNDoc          : TEdit;
    lblNDoc          : TLabel;
    Label1           : TLabel;
    edtFornecedor    : TEdit;
    rdgTipoRelatorio : TRadioGroup;
    Label2           : TLabel;
    edtTipoForn      : TComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbEmissaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formContasPagar: TformContasPagar;

implementation

uses ModuloDados, RelContasPagar;

{$R *.DFM}

procedure TformContasPagar.btnOKClick(Sender: TObject);
var
   strTipo,strAsterisco,strNumeroDoc,strCliente,strFormaPagamento,strObservacao,strStatus: string;
   strDataE,strDataV,dtant : TDateTime;
   SubTotal : Double;
   begin
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblContasPagar.Open;
   dmBaseDados.tblContasPagar.IndexName  := 'IndVenc';
   formRelContasPagar.lblTipoRel.Caption := 'Ordem de: Vencimento';
   if ckbEmissao.Checked=False then
    begin
      if ckbBaixados.Checked = False then
       begin
        dmBaseDados.tblContasPagar.Filter  := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('')+')';
       end;
      if ckbBaixados.Checked = True then
       begin
        dmBaseDados.tblContasPagar.Filter  := '('+'DataVencimento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataVencimento <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('1')+')';
       end;
    end
   else
    begin
       formRelContasPagar.lblTipoRel.Caption := 'Ordem de: Emissão';
       dmBaseDados.tblContasPagar.IndexName  := 'IndDataEmissao';
        if ckbBaixados.Checked = False then
         begin
          dmBaseDados.tblContasPagar.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('')+')';
         end;
        if ckbBaixados.Checked = True then
         begin
          dmBaseDados.tblContasPagar.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('1')+')';
         end;
    end;
   dmBaseDados.tblContasPagar.Filtered := True;
   dtant                :=dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
   strStatus            :=dmBaseDados.tblLogMensalCodigoMovimento.AsString; //este campo é = status do ctrec "Alpha 1"
   pgrProcessamento.Max := dmBaseDados.tblContasPagar.RecordCount;
   SubTotal             :=0;
   while (not dmBaseDados.tblContasPagar.Eof ) do
   begin
    //  if dmBaseDados.tblContasPagarStatus.AsString=strStatus Then
      // begin
         strDataE          := dmBaseDados.tblContasPagarDataEmissao.AsDateTime;
         strDataV          := dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
         strTipo           := Copy(dmBaseDados.tblContasPagarNumeroDocumento.AsString,1,1);
         strNumeroDoc      := dmBaseDados.tblContasPagarNumeroDocumento.AsString;
         strCliente        := dmBaseDados.tblContasPagarFornecedor.AsString;
         strAsterisco      := dmBaseDados.tblContasPagarAsterisco.AsString;
         strObservacao     := dmBaseDados.tblContasPagarObservacao.AsString;
         strFormaPagamento := dmBaseDados.tblContasPagarFormaPagamento.AsString;
       if (((edtFornecedor.Text = '0000')or(edtFornecedor.Text = dmBaseDados.tblContasPagarCodigoFornecedor.AsString))
       and((edtNDoc.Text        = '')or(edtNDoc.Text      = dmBaseDados.tblContasPagarNumeroDocumento.AsString))
       and((edtTipoForn.Text    = '')or(edtTipoForn.Text  = strTipo)))  then
        begin
         dmBaseDados.tblLogMensal.Append;
         if ((rdgTipoRelatorio.ItemIndex <> 1)) then
         begin
           dmBaseDados.tblLogMensalCodigoProduto.AsDateTime  := strDataE;
           dmBaseDados.tblLogMensalDataLancamento.AsDateTime := strDataV;
           dmBaseDados.tblLogMensalDescricao.AsString        := (strAsterisco)+('  ')+(strCliente);
           dmBaseDados.tblLogMensalDocumento.AsString        := strNumeroDoc;
           dmBaseDados.tblLogMensalObservacao.AsString       := strObservacao;
           dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dmBaseDados.tblContasPagarValorDocumento.AsFloat;
           dmBaseDados.tblLogMensalUnidadeMedida.AsString    := strFormaPagamento;
           dmBaseDados.tblLogMensal.Post;
           end;
           SubTotal:=SubTotal+dmBaseDados.tblContasPagarValorDocumento.AsFloat;
        end;
      //end;
      dmBaseDados.tblContasPagar.Next;
      if ((dtAnt<>dmBaseDados.tblContasPagarDataVencimento.AsDateTime) or (dmBaseDados.tblContasPagar.Eof)) then
         begin
         dmBaseDados.tblLogMensal.Edit;
         dmBaseDados.tblLogMensalSubtotal.AsFloat   := SubTotal;
         dmBaseDados.tblLogMensalFamilia.AsDateTime := strDataV;
         dmBaseDados.tblLogMensal.Post;
         SubTotal:=0;
         dtant:=dmBaseDados.tblContasPagarDataVencimento.AsDateTime;
         end;
      pgrProcessamento.Position := pgrProcessamento.Position+1;
   end;
   dmBaseDados.tblLogMensal.First;
   dmBaseDados.tblContasPagar.Filter     := '';
   dmBaseDados.tblContasPagar.Filtered   := False;
   dmBaseDados.tblContasPagar.IndexName  := '';
   dmBaseDados.tblContasPagar.Close;
   formRelContasPagar.lblInicio.Caption  := (DateToStr(Data1.Date));
   formRelContasPagar.lblFim.Caption     := (DateToStr(Data2.Date));
   formRelContasPagar.rptContasPagar.Preview;
   formRelContasPagar.lblTipoRel.Caption := '';
   dmBaseDados.tblLogMensal.Close;
end;

procedure TformContasPagar.FormShow(Sender: TObject);
begin
   Screen.Cursor              := CrHourGlass;
   Data1.Date                 := Date;
   Data2.Date                 := Date;
   Screen.Cursor              := CrDefault;
   pgrProcessamento.Position  := 0;
   ckbEmissao.Checked         := False;
   ckbBaixados.Checked        := False;
   edtFornecedor.Text         := '0000';
   edtTipoForn.Text           := '';
   rdgTipoRelatorio.ItemIndex := 0;
   Data1.SetFocus;
end;



procedure TformContasPagar.ckbEmissaoClick(Sender: TObject);
begin
 if ckbEmissao.Checked = True then
  begin
   rdgTipoRelatorio.Enabled := False;
  end
 else
  begin
   rdgTipoRelatorio.Enabled := True;
  end;
end;

end.
