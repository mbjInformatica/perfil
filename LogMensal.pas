unit LogMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask;

type
  TformLogMensal = class(TForm)
    lblMesAno        : TLabel;
    mskMesAno        : TMaskEdit;
    btnOK            : TBitBtn;
    btnCancela       : TBitBtn;
    pgrProcessamento : TProgressBar;
    rdbSintetico     : TRadioButton;
    rdbAnalitico     : TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure rdbAnaliticoClick(Sender: TObject);
    procedure rdbSinteticoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogMensal: TformLogMensal;

implementation

uses ModuloDados, RelLogMensal, DB;

{$R *.DFM}

procedure TformLogMensal.FormShow(Sender: TObject);
begin
   mskMesAno.Text            := '';
   pgrProcessamento.Position := 0;
   mskMesAno.SetFocus;
end;

procedure TformLogMensal.btnOKClick(Sender: TObject);
var
   strFamilia,strCategoria,strProduto,strDescricao,strUnidade,strDocumento: string;
   dblTotal:Double;
begin
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblHistorico.Open;
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblHistorico.IndexName :='IndData';
   dmBaseDados.tblHistorico.Filter    := 'MesAno = '+ #39 + mskMesAno.Text + #39;
   dmBaseDados.tblHistorico.Filtered  := True;
   pgrProcessamento.Max := dmBaseDados.tblHistorico.RecordCount;
   while (not dmBaseDados.tblHistorico.Eof)do
   begin
   if (rdbAnalitico.Checked=True) Then
      Begin
      strFamilia   := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,1,3);
      strCategoria := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,4,3);
      strProduto   := Copy(dmBaseDados.tblHistoricoCodigoProduto.AsString,7,6);
      dmBaseDados.tblProdutos.FindKey([strFamilia,strCategoria,strProduto]);
      strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
      strUnidade   := dmBaseDados.tblProdutosUnidadeMedida.AsString;
      strDocumento := '';
      if (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'E') then
         strDocumento := dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString
      else if (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'D') then
         strDocumento := dmBaseDados.tblHistoricoControleDevolucao.AsString
      else if ((dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'V') or
      (dmBaseDados.tblHistoricoCodigoMovimento.AsString = 'P')) then
      strDocumento := dmBaseDados.tblHistoricoNumeroRequisicao.AsString;
      dmBaseDados.tblLogMensal.Append;
      dmBaseDados.tblLogMensalDataLancamento.AsDateTime :=
      dmBaseDados.tblHistoricoDataLAncamento.AsDateTime;
      dmBaseDados.tblLogMensalCodigoMovimento.AsString :=
      dmBaseDados.tblHistoricoCodigoMovimento.AsString;
      dmBaseDados.tblLogMensalCodigoProduto.AsString :=
      dmBaseDados.tblHistoricoCodigoProduto.AsString;
      dmBaseDados.tblLogMensalDescricao.AsString     := strDescricao;
      dmBaseDados.tblLogMensalUnidadeMedida.AsString := strUnidade;
      dmBaseDados.tblLogMensalDocumento.AsString     := strDocumento;
      dmBaseDados.tblLogMensalQuantidade.AsFloat   :=
      dmBaseDados.tblHistoricoQuantidade.AsFloat;
      dmBaseDados.tblLogMensalValorLancamento.AsFloat:=
      dmBaseDados.tblHistoricoValorLancamento.AsFloat;
      dmBaseDados.tblLogMensal.Post;
      dmBaseDados.tblHistorico.Next;
   end;
   if (rdbSintetico.Checked=True) Then
        Begin
                dblTotal:=0;
                strDocumento:=dmBaseDados.tblHistoricoNumeroRequisicao.AsString;
                while (dmBaseDados.tblHistoricoNumeroRequisicao.AsString=strDocumento)and(not dmBaseDados.tblHistorico.Eof) do
                begin
                dblTotal:=dblTotal+dmBaseDados.tblHistoricoValorLancamento.AsFloat;
                dmBaseDados.tblHistorico.Next;
                end;
        dmBaseDados.tblLogMensal.Append;
        dmBaseDados.tblLogMensalDataLancamento.AsDateTime :=
        dmBaseDados.tblHistoricoDataLAncamento.AsDateTime;
        dmBaseDados.tblLogMensalCodigoMovimento.AsString :=
        dmBaseDados.tblHistoricoCodigoMovimento.AsString;
        dmBaseDados.tblLogMensalDocumento.AsString:= strDocumento;
        dmBaseDados.tblLogMensalValorLancamento.AsFloat:=dblTotal;
        dmBaseDados.tblLogMensal.Post;
        end;
   pgrProcessamento.Position := pgrProcessamento.Position+1;
   end;
   dmBaseDados.tblHistorico.Filter    := '';
   dmBaseDados.tblHistorico.Filtered  := False;
   dmBaseDados.tblHistorico.Close;
   dmBaseDados.tblProdutos.Close;
   formRelLogMensal.lblMesAno.Caption := mskMesAno.Text;
   formRelLogMensal.rptLogMensal.Preview;
   dmBaseDados.tblLogMensal.Close;
end;

procedure TformLogMensal.rdbAnaliticoClick(Sender: TObject);
begin
   if rdbAnalitico.Checked=True then
    rdbSintetico.Checked := False;
end;

procedure TformLogMensal.rdbSinteticoClick(Sender: TObject);
begin
   if rdbSintetico.Checked=True then
    rdbAnalitico.Checked := False;
end;

end.
