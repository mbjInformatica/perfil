unit ProcessaNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TformProcessaNota = class(TForm)
    lblMensagem      : TLabel;
    btnSim           : TBitBtn;
    btnNao           : TBitBtn;
    prgProcessamento : TProgressBar;
    procedure btnSimClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formProcessaNota: TformProcessaNota;

implementation

uses ModuloDados, EntraCompras, DB;

{$R *.DFM}

procedure TformProcessaNota.btnSimClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strMes,strAno: string;
   intTamanho: integer;
   intQuantidade,ValorIPI : Double;
   wrdDia,wrdMes,wrdAno: word;
begin
   prgProcessamento.Max := dmBaseDados.tblEntrada.RecordCount;
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblHistorico.Open;
   dmBaseDados.tblEntrada.First;
   while (not dmBaseDados.tblEntrada.Eof) do
   begin
      strCodfamilia   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,1,3);
      strCodCategoria := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,4,3);
      strCodProduto   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,7,6);
      intQuantidade   := dmBaseDados.tblEntradaQuantidade.AsFloat;
      DecodeDate(dmBaseDados.tblEntradaDataLancamento.AsDateTime,wrdAno,wrdMes,wrdDia);
      strMes          := IntToStr(wrdMes);
      intTamanho      := Length(strMes);
      strMes          := Copy('00'+strMes,intTamanho+1,2);
      strAno          := IntToStr(wrdAno);
      intTamanho      := Length(strAno);
      strAno          := Copy('0000'+strAno,intTamanho+1,4);
      dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
      dmBaseDados.tblProdutos.Edit;
      dmBaseDados.tblProdutosEstoqueAtual.AsFloat :=
      dmBaseDados.tblProdutosEstoqueAtual.AsFloat + intQuantidade;
      dmBaseDados.tblProdutosValorUnitarioAnterior.AsFloat :=
      dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
      dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat :=
      dmBaseDados.tblEntradaValorUnitario.AsFloat;
      dmBaseDados.tblProdutosDataUltimaCompra.AsDateTime :=
      dmBaseDados.tblEntradaDataLancamento.AsDateTime;
      dmBaseDados.tblProdutos.Post;
      dmBaseDados.tblHistorico.Append;
      dmBaseDados.tblHistoricoDataLancamento.AsDateTime :=
      dmBaseDados.tblEntradaDataLancamento.AsDateTime;
      dmBaseDados.tblHistoricoCodigoMovimento.AsString  :=
      dmBaseDados.tblEntradaCodigoMovimento.AsString;
      dmBaseDados.tblHistoricoCodigoProduto.AsString    :=
      dmBaseDados.tblEntradaCodigoProduto.AsString;
      dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString :=
      dmBaseDados.tblEntradaNumeroNotaFiscal.AsString;
      dmBaseDados.tblHistoricoQuantidade.AsFloat      :=
      dmBaseDados.tblEntradaQuantidade.AsFloat;
      dmBaseDados.tblHistoricoValorLancamento.AsFloat   :=
      dmBaseDados.tblHistoricoQuantidade.AsFloat * dmBaseDados.tblEntradaValorUnitario.AsFloat;
      //dmBaseDados.tblEntradaValorTotal.AsFloat;
      dmBaseDados.tblHistoricoClienteFornecedor.AsString := formEntradaCompra.fldFornecedor.Text;
      dmBaseDados.tblHistoricoMesAno.AsString           := strMes+'/'+strAno;
      dmBaseDados.tblHistoricoStatus.AsString := 'E';
      dmBaseDados.tblHistoricoNumeroRequisicao.AsString := formEntradaCompra.fldNotaFiscal.Text;
      dmBaseDados.tblHistoricoICMS.AsFloat := dmBaseDados.tblEntradaAliquotaICMS.AsFloat;
      dmBaseDados.tblHistoricoIPI.AsFloat  := dmBaseDados.tblEntradaAliquotaIPI.AsFloat;
      dmBaseDados.tblHistoricoValorIPI.AsFloat := dmBaseDados.tblEntradaValorComIPI.AsFloat;
      dmBaseDados.tblHistorico.Post;
      dmBaseDados.tblEntrada.Next;
      prgProcessamento.Position := prgProcessamento.Position + 1;
   end;
  
dmBaseDados.tblHistorico.Close;
dmBaseDados.tblProdutos.Close;
end;

procedure TformProcessaNota.FormShow(Sender: TObject);
begin
prgProcessamento.Position := 0;
end;

end.
