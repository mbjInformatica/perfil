unit Local;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons;

type
  TformLocal = class(TForm)
    lblMensagem: TLabel;
    lblDtI: TLabel;
    lblDtF: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    rdbAdvogado: TRadioButton;
    rdbBanco: TRadioButton;
    rdbCartorio: TRadioButton;
    rdbDeposito: TRadioButton;
    rdbJales: TRadioButton;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    pgrProcessamento: TProgressBar;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLocal: TformLocal;

implementation
    uses modulodados, RelLocal;
{$R *.DFM}

procedure TformLocal.btnOKClick(Sender: TObject);
var strCodcli : string;
    strvalor  : DOUBLE;
begin
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblContasReceber.IndexName := 'IndCodCli';
if rdbAdvogado.Checked = true then
  begin
     dmBaseDados.tblContasReceber.Filter   := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')and('+'LocalPagamento ='+ QuotedStr('AD')+')';
     dmBaseDados.tblContasReceber.Filtered := True;
     formRelLocal.qrlLocalP.Caption := 'Local de Pagamento : AD - Advogado';
  end;

if rdbBanco.Checked = true then
  begin
     dmBaseDados.tblContasReceber.Filter   := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')and('+'LocalPagamento ='+ QuotedStr('BC')+')';
     dmBaseDados.tblContasReceber.Filtered := True;
     formRelLocal.qrlLocalP.Caption := 'Local de Pagamento : BC - Banco';
  end;

if rdbCartorio.Checked = true then
  begin
     dmBaseDados.tblContasReceber.Filter   := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')and('+'LocalPagamento ='+ QuotedStr('CR')+')';
     dmBaseDados.tblContasReceber.Filtered := True;
     formRelLocal.qrlLocalP.Caption := 'Local de Pagamento : CR - Cartório';
  end;

if rdbJales.Checked = true then
  begin
     dmBaseDados.tblContasReceber.Filter   := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')and('+'LocalPagamento ='+ QuotedStr('CT')+')';
     dmBaseDados.tblContasReceber.Filtered := True;
     formRelLocal.qrlLocalP.Caption := 'Local de Pagamento : JL - Jales';
  end;

if rdbDeposito.Checked = true then
  begin
     dmBaseDados.tblContasReceber.Filter   := '('+'DataPagamento >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataPagamento <='+QuotedStr(DateToStr(Data2.Date))+')and('+'Status ='+QuotedStr('1')+')and('+'LocalPagamento ='+ QuotedStr('DP')+')';
     dmBaseDados.tblContasReceber.Filtered := True;
     formRelLocal.qrlLocalP.Caption := 'Local de Pagamento : DP - Depósito';
  end;
  while (not dmBaseDados.tblContasReceber.Eof) do
    begin
     strValor  := 0;
     strCodcli := dmBaseDados.tblContasReceberCodCli.AsString;
     dmBaseDados.tblLogMensal.Append;
     while strCodcli = dmBaseDados.tblContasReceberCodCli.AsString do
        begin
          strvalor := strvalor + dmBaseDados.tblContasReceberValorTotal.AsFloat ;
          dmBaseDados.tblContasReceber.Next;
          if dmBaseDados.tblContasReceber.Eof then break;
        end;
         if strValor <> 0 then
          begin
            dmBaseDados.tblLogMensalValorLancamento.AsFloat := strValor;
            dmBaseDados.tblLogMensalCodigoProduto.AsString  := dmBaseDados.tblContasReceberCodCli.AsString;
            dmBaseDados.tblLogMensalDescricao.AsString      := dmBaseDados.tblContasReceberCliente.AsString;
            dmBaseDados.tblLogMensalObservacao.AsString     := dmBaseDados.tblContasReceberLocalPagamento.AsString;
            dmBaseDados.tblLogMensal.Post;
          end;
     pgrProcessamento.Position := pgrProcessamento.Position+1;
    end;
dmBaseDados.tblLogMensal.Last;
dmBaseDados.tblLogMensal.Delete;
formRelLocal.qrplocal.Preview;
dmBaseDados.tblContasReceber.Filter   := '';
dmBaseDados.tblContasReceber.Filtered := False;
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblContasReceber.Close;

end;

procedure TformLocal.FormShow(Sender: TObject);
begin
 Data1.Date                := Date;
 Data2.Date                := Date;
 rdbAdvogado.Checked       := False;
 rdbBanco.Checked          := False;
 rdbCartorio.Checked       := False;
 rdbDeposito.Checked       := False;
 rdbJales.Checked          := False;
 pgrProcessamento.Position := 0;
end;

end.
