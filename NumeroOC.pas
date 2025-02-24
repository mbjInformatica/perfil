unit NumeroOC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids, DB;

type
  TformNumeroOC = class(TForm)
    grdProdutos : TDBGrid;
    btnExluir   : TSpeedButton;
    btnOK       : TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExluirClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formNumeroOC: TformNumeroOC;

implementation

uses ModuloDados;

{$R *.DFM}

procedure TformNumeroOC.FormShow(Sender: TObject);
begin
   dmBaseDados.tblNumeroOC.EmptyTable;
   dmBaseDados.tblNumeroOC.Open;
end;

procedure TformNumeroOC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblNumeroOC.Close;
end;

procedure TformNumeroOC.btnExluirClick(Sender: TObject);
begin
   dmBaseDados.tblNumeroOC.Delete;
end;

procedure TformNumeroOC.btnOKClick(Sender: TObject);
var
   strOrdemCompra,strCodigo,strFamilia,strCategoria,strProduto,strDescricao,strUnidade:string;
  // intQuantidade: integer;
   intQuantidade,fltValorUnit: double;
   datData: TDateTime;
begin
   if ((dmBaseDados.tblNumeroOC.State = dsInsert) or (dmBaseDados.tblNumeroOC.State = dsEdit)) then
      dmBaseDados.tblNumeroOC.Post;
      dmBaseDados.tblRelOC.EmptyTable;
      dmBaseDados.tblRelOC.Open;
      dmBaseDados.tblProdutos.Open;
      dmBaseDados.tblOrdemCompra.Open;
      dmBaseDados.tblProdutosComprados.Open;
      if (dmBaseDados.tblNumeroOC.RecordCount <> 0) then
      begin
         dmBaseDados.tblNumeroOC.First;
         while (not dmBasedados.tblNumeroOC.Eof) do
         begin
            strOrdemCompra := dmBaseDados.tblNumeroOCOrdemCompra.AsString;
            if (dmBaseDados.tblOrdemCompra.FindKey([strOrdemCompra])) then
            begin
            datData := dmBaseDados.tblOrdemCompraDataEmissao.AsDAteTime;
            while ((dmBaseDados.tblProdutosCompradosOrdemCompra. AsString =
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
         dmBaseDados.tblNumeroOC.Next;
      end;
   end;
   dmBaseDados.tblRelOC.Close;
   dmBasedados.tblProdutos.Close;
   dmBaseDados.tblOrdemCompra.Close;
   dmBasedados.tblProdutosComprados.Close;
   Close;
end;

end.
