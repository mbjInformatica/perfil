unit dataOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, Mask;

type
  TformDataOC = class(TForm)
    lblMensagem      : TLabel;
    mskData          : TMaskEdit;
    btnOK            : TBitBtn;
    btnCancela       : TBitBtn;
    pgrProcessamento : TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formDataOC: TformDataOC;

implementation

uses ModuloDados, DB;

{$R *.DFM}

procedure TformDataOC.FormShow(Sender: TObject);
begin
   mskData.Text              := '';
   pgrProcessamento.Position := 0;
   mskData.SetFocus;
end;

procedure TformDataOC.btnOKClick(Sender: TObject);
var
   strOrdemCompra,strCodigo,strFamilia,strCategoria,strProduto,strDescricao,strUnidade:string;
   //intQuantidade: integer;
   intQuantidade,fltValorUnit: double;
   datData: TDateTime;
begin
   datData := StrToDate(mskData.Text);
   dmBaseDados.tblNumeroOC.EmptyTable;
   dmBaseDados.tblNumeroOC.Open;
   dmBaseDados.tblRelOC.EmptyTable;
   dmBaseDados.tblRelOC.Open;
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblOrdemCompra.Open;
   dmBaseDados.tblProdutosComprados.Open;
   pgrProcessamento.Max := dmBasedados.tblOrdemCompra.RecordCount;
   while (not dmBaseDados.tblOrdemCompra.Eof) do
   begin
      if (dmBaseDados.tblOrdemCompraDataEmissao.AsDateTime = datDAta) then
      begin
         strOrdemCompra := dmBaseDados.tblOrdemCompraOrdemCompra.AsString;
         dmBaseDados.tblNumeroOC.Append;
         dmBaseDados.tblNumeroOCOrdemCompra.AsString := strOrdemCompra;
         dmBaseDados.tblNumeroOC.Post;
         while ((dmBaseDados.tblProdutosCompradosOrdemCompra.AsString =
      strOrdemCompra) and (not dmBaseDados.tblProdutosComprados. Eof)) do
         begin
            strCodigo     := dmBaseDados.tblProdutosCompradosCodigoProduto.AsString;
            strFamilia    := Copy(strCodigo,1,3);
            strCategoria  := Copy(strCodigo,4,3);
            strProduto    := Copy(strCodigo,7,6);
            strDescricao  := '';
            strUnidade    := '';
            intQuantidade := dmBaseDados.tblProdutosCompradosQuantidade.AsFloat;
            fltValorUnit  := dmBaseDados.tblProdutosCompradosValorUnitario.AsFloat;
            if (dmBaseDados.tblProdutos.FindKey([strFamilia,strCategoria,strProduto])) then
            begin
               strDescricao := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
               strUnidade   := dmBaseDados.tblProdutosUnidadeMedida.AsString;
            end;
            dmBaseDados.tblRelOC.Append;
            dmBasedados.tblRelOCOrdemCompra.AsString   := strOrdemCompra;
            dmBaseDados.tblRelOCDataEmissao.AsDAteTime := datData;
            dmBasedados.tblRelOCCdigoProduto.AsString  := strCodigo;
            dmBaseDados.tblRelOCDescricao.AsString     := strDescricao;
            dmBaseDados.tblRelOCUnidadeMedida.AsString := strUnidade;
            dmBaseDados.tblRelOCQuantidade.AsFloat   := intQuantidade;
            dmBaseDados.tblRelOCValorUnitario.AsFloat  := fltValorUnit;
            dmBaseDados.tblRelOCValorTotal.AsFloat     := intQuantidade *fltValorUnit;
            dmBaseDados.tblRelOC.Post;
            dmBasedados.tblProdutosComprados.Next;
         end;
      end;
      dmBaseDados.tblOrdemCompra.Next;
      pgrProcessamento.Position := pgrProcessamento.Position + 1;
   end;
   dmBaseDados.tblNumeroOC.Close;
   dmBaseDados.tblRelOC.Close;
   dmBasedados.tblProdutos.Close;
   dmBaseDados.tblOrdemCompra.Close;
   dmBasedados.tblProdutosComprados.Close;
end;

end.
