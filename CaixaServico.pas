unit CaixaServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask;

type
  TformCaixaServico = class(TForm)
    mskInicio        : TMaskEdit;
    btnOK            : TBitBtn;
    btnCancela       : TBitBtn;
    pgrProcessamento : TProgressBar;
    lblA             : TLabel;
    mskFim           : TMaskEdit;
    lblInicio        : TLabel;
    lblFim           : TLabel;
    lblMensagem      : TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCaixaServico: TformCaixaServico;

implementation

uses ModuloDados, RelLogMensal, RelCaixaServico;

{$R *.DFM}

procedure TformCaixaServico.btnOKClick(Sender: TObject);
Var
   strPlaca,strData,strNumeroOS,strServico,strValorTotal,strFormaPagamento: string;
begin
   dmBaseDados.tblLogMensal.EmptyTable;
   dmBaseDados.tblLogMensal.Open;
   dmBaseDados.tblFichaServico.Open;
   dmBaseDados.tblFichaServico.Filter   := 'Data = '+#39+mskInicio.Text+ #39;
   // and 'Data <= '+#39+mskFim.Text+ #39;
   dmBaseDados.tblFichaServico.Filtered := True;
   pgrProcessamento.Max := dmBaseDados.tblFichaServico.RecordCount;
   while (not dmBaseDados.tblFichaServico.Eof ) do
   begin
      //if dmBaseDados.tblFichaServicoData>=mskInicio and dmBaseDados.tblFichaServicoData<=mskFim then
      //begin
         strPlaca         := dmBaseDados.tblFichaServicoPlaca.AsString;
         strData          := dmBaseDados.tblFichaServicoData.AsString;
         strNumeroOS      := dmBaseDados.tblFichaServicoNumeroOS.AsString;
         strServico       := dmBaseDados.tblFichaServicoServico.AsString;
         strValorTotal    := dmBaseDados.tblFichaServicoValorTotal.AsString;
         strFormaPagamento:= dmBaseDados.tblFichaServicoFormaPagamento.AsString;
         dmBaseDados.tblLogMensal.Append;
         dmBaseDados.tblLogMensalCodigoProduto.AsString := strPlaca;
         dmBaseDados.tblLogMensalDataLancamento.AsDateTime :=
         dmBaseDados.tblFichaServicoData.AsDateTime;
         dmBaseDados.tblLogMensalDescricao.AsString     := strServico;
         dmBaseDados.tblLogMensalDocumento.AsString     := strNumeroOS;
         dmBaseDados.tblLogMensalValorLancamento.AsFloat:=
         dmBaseDados.tblFichaServicoValorTotal.AsFloat;
         dmBaseDados.tblLogMensalUnidadeMedida.AsString := strFormaPagamento;
         dmBaseDados.tblLogMensal.Post;
         dmBaseDados.tblFichaServico.Next;
         pgrProcessamento.Position := pgrProcessamento.Position+1;
      //end;
   end;
   dmBaseDados.tblFichaServico.Filter    := '';
   dmBaseDados.tblFichaServico.Filtered  := False;
   dmBaseDados.tblFichaServico.Close;
   formRelCaixaServico.lblInicio.Caption := mskInicio.Text;
   formRelCaixaServico.lblFim.Caption    := mskFim.Text;
   formRelCaixaServico.rptCaixaServico.Preview;
   dmBaseDados.tblLogMensal.Close;
end;

procedure TformCaixaServico.FormShow(Sender: TObject);
begin
   pgrProcessamento.Position := 0;
   mskInicio.Text            := '';
   mskFim.Text               := '';
   mskInicio.SetFocus;
end;

end.
