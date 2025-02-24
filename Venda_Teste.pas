unit Venda_Teste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, DB;

type
  TformVendasBalcao = class(TForm)
    lblRequisicao: TLabel;
    fldRequisicao: TDBText;
    lblDataEmissao: TLabel;
    fldDataEmissao: TDBText;
    lblCodigoProduto: TLabel;
    fldCodigoProduto: TDBEdit;
    lblValorUnitario: TLabel;
    fldValorUnitario: TDBText;
    lblQuantidade: TLabel;
    fldQuantidade: TDBEdit;
    lblValorTotal: TLabel;
    fldValorTotal: TDBText;
    lblValorVenda: TLabel;
    lblValorTotalVenda: TLabel;
    grdProdutos: TDBGrid;
    btnNovo: TSpeedButton;
    btnProdutos: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGrava: TSpeedButton;
    btnRetornar: TSpeedButton;
    btnImprime: TSpeedButton;
    dblkVendedor: TDBLookupComboBox;
    dblkCliente: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnProdutosClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure fldCodigoProdutoExit(Sender: TObject);
    procedure fldQuantidadeExit(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formVendasBalcao: TformVendasBalcao;

implementation

uses ModuloDados, RotinasGerais, ListaProduto, RelVendas, SeekClientes;

{$R *.DFM}

procedure TformVendasBalcao.FormShow(Sender: TObject);
var
   wrdDia,wrdMes,wrdAno: word;
   intTamanho,intRequisicao: integer;
   strAno,strRequisicao: string;
begin
   dmBasedados.tblSaida.EmptyTable;
   dmBasedados.tblSaida.Open;
   dmBaseDados.tblProdutos.Open;
   dmBasedados.tblRequisicoes.Open;
   dmBaseDados.tblClientes.Open;
   dmBaseDados.tblFuncionarios.Open;
   DecodeDate(Date,wrdAno,WrdMes,WrdDia);
   intRequisicao := 0;
   strAno        := IntToStr(wrdAno);
   intTamanho    := Length(strAno);
   strAno        := copy('00'+strAno,intTamanho+1,2);
   if (dmBaseDados.tblRequisicoes.RecordCount <> 0) then
   begin
      dmBaseDados.tblRequisicoes.Last;
      intRequisicao := StrToInt(Copy(dmBaseDados.tblRequisicoesNumeroRequisicao.AsString,1,6));
      if (strAno <> Copy(dmBaseDados.tblRequisicoesNumeroRequisicao. AsString,8,2)) then
         intRequisicao := 0;
      end;
      Inc(intRequisicao);
      strRequisicao := IntToStr(intRequisicao);
      intTamanho    := Length(strRequisicao);
      strRequisicao := Copy('000000'+strRequisicao,intTamanho+1,6);
      strRequisicao := strRequisicao+'/'+strAno;
      dmBaseDados.tblRequisicoes.Append;
      dmBaseDados.tblRequisicoesNumeroRequisicao.AsString := strRequisicao;
      dmBaseDados.tblRequisicoesDataEmissao.AsDateTime    := Date;
      dmBaseDados.tblRequisicoes.Post;
      dmBaseDados.tblSaida.Append;
      dmBaseDados.tblSaidaNumeroRequisicao.AsString := strRequisicao;
      dmBaseDados.tblSaidaDataLancamento.AsDateTime := DAte;
      dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
      dmBaseDados.tblSaida.Post;
      lblValorTotal.Caption := '0';
      dblkCliente.SetFocus;
   end;

procedure TformVendasBalcao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblSaida.Close;
   dmBaseDados.tblProdutos.Close;
   dmBaseDados.tblRequisicoes.Close;
   dmBaseDados.tblFuncionarios.Close;
   dmBaseDados.tblClientes.Close;
end;

procedure TformVendasBalcao.btnProdutosClick(Sender: TObject);
begin
   formListaProdutos.ShowModal;
   fldQuantidade.SetFocus;
end;

procedure TformVendasBalcao.btnNovoClick(Sender: TObject);
begin
   dmBaseDados.tblSaida.Append;
   dmBaseDados.tblSaidaNumeroRequisicao.AsString :=
   dmBaseDados.tblRequisicoesNumeroRequisicao.AsString;
   dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
   dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
   dmBaseDados.tblSaida.Post;
end;

procedure TformVendasBalcao.btnExcluirClick(Sender: TObject);
var
   fltValor: double;
begin
   fltValor := 0;
   dmBaseDados.tblSaida.Delete;
   dmBaseDados.tblSaida.DisableControls;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
   begin
      fltValor := fltValor + dmBaseDados.tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblSaida.Next;
   end;
   dmBaseDados.tblSaida.EnableControls;
   lblValorTotalVenda.Caption := FloatToStr(fltValor);
end;

procedure TformVendasBalcao.btnCancelarClick(Sender: TObject);
begin
dmBaseDados.tblRequisicoes.Edit;
dmBaseDados.tblRequisicoesSituacao.AsString := 'C';
dmBaseDados.tblRequisicoes.Post;
Close;
end;

procedure TformVendasBalcao.btnRetornarClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strMes,strAno: string;
   intQuantidade,intTamanho: integer;
   wrdDia,wrdMes,wrdAno: word;
   fltValor: double;
begin
   if ((dmBaseDados.tblSaida.State = dsInsert) or (dmBaseDados.tblSaida.State = dsEdit)) then
   dmBaseDados.tblSaida.Post;
   dmBaseDados.tblHistorico.Open;
   dmBaseDados.tblSaida.First;
   while (not dmbaseDados.tblSaida.Eof) do
   begin
   strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
   strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
   strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
   intQuantidade   := dmBaseDados.tblSaidaQuantidade.AsInteger;
   DecodeDate(dmBaseDados.tblSaidaDataLancamento.AsDAteTime,wrdAno,wrdMes,wrdDia);
   strMes          := IntToStr(wrdMes);
   intTamanho      := Length(strMes);
   strMes          := Copy('00'+strMes,intTamanho+1,2);
   strAno          := IntToStr(wrdAno);
   intTamanho      := Length(strAno);
   strAno          := Copy('0000'+strAno,intTamanho+1,4);
   dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
   dmBaseDados.tblProdutos.Edit;
   dmBaseDados.tblProdutosEstoqueAtual.AsInteger :=
   dmBaseDados.tblProdutosEstoqueAtual.AsInteger - intQuantidade;
   dmBaseDados.tblProdutos.Post;
   fltValor := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
   dmBaseDados.tblHistorico.Append;
   dmBaseDados.tblHistoricoDataLancamento.AsDateTime :=
   dmBaseDados.tblSaidaDataLancamento.AsDateTime;
   dmBaseDados.tblHistoricoCodigoMovimento.AsString :=
   dmBaseDados.tblSaidaCodigoMovimento.AsString;
   dmBaseDados.tblHistoricoCodigoCliente.AsInteger :=
   dmBaseDados.tblClientesCodigoCliente.AsInteger;
   dmBaseDados.tblHistoricoClienteFornecedor.AsString :=
   dmBaseDados.tblClientesNomeCliente.AsString;
   dmBaseDados.tblHistoricoCodigoVendedor.AsInteger :=
   dmBaseDados.tblFuncionariosCodigoFuncionario.AsInteger;
   dmBaseDados.tblHistoricoNomeVendedor.AsString :=
   dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
   dmBaseDados.tblHistoricoCodigoProduto.AsString :=
   dmBaseDados.tblSaidaCodigoProduto.AsString;
   dmBaseDados.tblHistoricoNumeroRequisicao.AsString :=
   dmBaseDados.tblSaidaNumeroRequisicao.AsString;
   dmBaseDados.tblHistoricoQuantidade.AsInteger :=
   dmBaseDados.tblSaidaQuantidade.AsInteger;
   dmBaseDados.tblHistoricoValorLancamento.AsFloat := fltValor * intQuantidade;
   dmBaseDados.tblHistoricoMesAno.AsString         := strMes+'/'+strAno;
   dmBaseDados.tblHistorico.Post;
   dmBaseDados.tblSaida.Next;
   end;
   dmBaseDados.tblHistorico.Close;
   Close;
end;

procedure TformVendasBalcao.btnGravaClick(Sender: TObject);
var
   fltValorTotal: double;
begin
   if ((dmBaseDados.tblSaida.State = dsInsert) or (dmBaseDados.tblSaida.State = dsEdit)) then
   begin
   dmBaseDados.tblSaidaValorTotal.AsFloat :=
   dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsInteger;
   dmBaseDados.tblSaida.Post;
   fltValorTotal := StrToFloat(lblValorTotalVenda.Caption);
   fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
   lblValorTotalVenda.Caption := FloatToStr(fltValorTotal);
   end;

end;

procedure TformVendasBalcao.fldCodigoProdutoExit(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
begin
   strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
   strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
   strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
   if (dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
   begin
   dmBaseDados.tblSaida.Edit;
   dmBaseDados.tblSaidaValorUnitario.AsFloat := dmBaseDados.
   tblProdutosValorVenda.AsFloat;
   dmBaseDados.tblSaida.Post;
   fldQuantidade.SetFocus;
   end
   else
   begin
      Mensagem('Código do produto não encontrado !');
      fldCodigoProduto.SetFocus;
   end;
end;

procedure TformVendasBalcao.fldQuantidadeExit(Sender: TObject);
var
   fltValorTotal: double;
begin
   dmBaseDados.tblSaida.Edit;
   dmBaseDados.tblSaidaValorTotal.AsFloat := dmBasedados.tblSaidaValorUnitario.AsFloat
   * dmBaseDados.tblSaidaQuantidade.AsInteger;
   dmBaseDados.tblSaida.Post;
   dmBaseDados.tblSaida.DisableControls;
   dmBasedados.tblSaida.First;
   fltValorTotal := 0;
   while (not dmBaseDados.tblSaida.Eof) do
   begin
      fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblSaida.Next;
   end;
   dmBaseDados.tblSaida.EnableControls;
   lblValorTotalVenda.Caption := FloatToStr(fltValorTotal);
end;

procedure TformVendasBalcao.btnImprimeClick(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto,strDescricao,strUnidade: string;
begin
   dmBaseDados.tblRelVendas.EmptyTable;
   dmBaseDados.tblRelVendas.Open;
   dmBaseDados.tblSaida.DisableControls;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
   begin
      strCodFamilia := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
      strCodCategoria  := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
      strCodProduto    := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
      dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria, strCodProduto]);
      strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada. AsString;
      strUnidade := dmBasedados.tblProdutosUnidadeMedida.AsString;
      dmBasedados.tblRelVendas.Append;
      dmBaseDados.tblRelVendasCodigoProduto.AsString := dmBaseDados.
      tblSaidaCodigoProduto.AsString;
      dmBaseDados.tblRelVendasDescricao.AsString   := strDescricao;
      dmBaseDados.tblRelVendasUnidade.AsString     := strUnidade;
      dmBaseDados.tblRelVendasQuantidade.AsInteger := dmBaseDados.
      tblSaidaQuantidade.AsInteger;
      dmBaseDados.tblRelVendasValorUnitario.AsFloat:= dmBaseDados.
      tblSaidaValorUnitario.AsFloat;
      dmBaseDados.tblRelVendasValorTotal.AsFloat   := dmBaseDados.
      tblSaidaValorTotal.AsFloat;
      dmBaseDados.tblRelVendas.Post;
      dmBaseDados.tblSaida.Next;
   end;
   dmBaseDados.tblSaida.EnableControls;
   formRelVendas.rptVendas.Preview;
   dmBaseDAdos.tblRelVendas.Close;
end;

procedure TformVendasBalcao.btnLocalizarClick(Sender: TObject);
begin
        formSeekClientes.ShowModal;
        //fldCodigoProduto.SetFocus;
end;

end.
