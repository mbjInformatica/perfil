unit Cobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls;

type
  TformCobranca = class(TForm)
    gpbNumeroPedido: TGroupBox;
    edtNPedido: TEdit;
    btnImprime: TSpeedButton;
    rgParcela: TRadioGroup;
    btnAdicionar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formCobranca: TformCobranca;

implementation
 Uses ModuloDados, RelCobranca;

{$R *.DFM}

procedure TformCobranca.FormShow(Sender: TObject);
begin
rgParcela.ItemIndex := 0;
edtNPedido.Text     := '';
dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
end;

procedure TformCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblContasReceber.IndexName := '';
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblLogMensal.Close;
end;

procedure TformCobranca.btnAdicionarClick(Sender: TObject);
var strDataE, strCodigo, strCliente, strNPedido, strParcela : String;
    strDataV : TDateTime;
    strValor : Double;
begin
if rgParcela.ItemIndex <> 0 then
 begin
   if rgParcela.ItemIndex = 1 then
    begin
      strParcela := '1/2';
    end;
      if rgParcela.ItemIndex = 2 then
    begin
      strParcela := '2/2';
    end;
       if rgParcela.ItemIndex = 3 then
    begin
      strParcela := '1/3';
    end;
       if rgParcela.ItemIndex = 4 then
    begin
      strParcela := '2/3';
    end;
       if rgParcela.ItemIndex = 5 then
    begin
      strParcela := '3/3';
    end;
   dmBaseDados.tblContasReceber.Filter   := '('+'Parcelas = '+QuotedStr(strParcela)+')';
   dmBaseDados.tblContasReceber.Filtered := True;
 end;
dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento';
dmBaseDados.tblContasReceber.FindKey([edtNPedido.Text]);
if dmBaseDados.tblContasReceberStatus.AsString = '1' then
 begin
   ShowMessage('Pedido já BAIXADO!');
 end
else
 begin
   while ((edtNPedido.Text = dmBaseDados.tblContasReceberNumeroDocumento.AsString)and(not dmBaseDados.tblContasReceber.Eof)) do
     begin
       strCodigo  := dmBaseDados.tblContasReceberCodCli.AsString;
       strCliente := dmBaseDados.tblContasReceberCliente.AsString;
       strNPedido := dmBaseDados.tblContasReceberNumeroDocumento.AsString;
       strDataV   := dmBaseDados.tblContasReceberDataVencimento.AsDateTime;
       strDataE   := DateToStr(dmBaseDados.tblContasReceberDataEmissao.AsDateTime);
       strValor   := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
       dmBaseDados.tblLogMensal.Append;
       dmBaseDados.tblLogMensalCodigoProduto.AsString    := strCodigo;
       dmBaseDados.tblLogMensalDescricao.AsString        := strCliente;
       dmBaseDados.tblLogMensalDocumento.AsString        := strNPedido;
       dmBaseDados.tblLogMensalDataLancamento.AsDateTime := strDataV;
       dmBaseDados.tblLogMensalFamilia.AsString          := strDataE;
       dmBaseDados.tblLogMensalValorLancamento.AsFloat   := strValor;
          if dmBaseDados.tblContasReceberStatus.AsString  = '1' then
           begin
             dmBaseDados.tblLogMensalValorLancamento.AsFloat   := 0;
           end;
       dmBaseDados.tblLogMensal.Post;
       dmBaseDados.tblContasReceber.Next;
     end;
 end;
end;

procedure TformCobranca.btnImprimeClick(Sender: TObject);
begin
formRelCobranca.qrpCobranca.Preview;
dmBaseDados.tblContasReceber.Filter   := '';
dmBaseDados.tblContasReceber.Filtered := False;
Close;
end;

end.
