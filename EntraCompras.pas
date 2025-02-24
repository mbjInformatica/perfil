unit EntraCompras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids, DB;

type
  TformEntradaCompra = class(TForm)
    lblNotaFiscal    : TLabel;
    fldNotaFiscal    : TDBEdit;
    lblValorICMS: TLabel;
    fldValorICMS: TDBEdit;
    fldDataEmissao   : TDBEdit;
    lblFornecedor    : TLabel;
    fldFornecedor    : TDBLookupComboBox;
    Label3           : TLabel;
    lblValorTotal    : TLabel;
    fldValorTotal    : TDBEdit;
    grdProdutos      : TDBGrid;
    btnExcluiProduto : TSpeedButton;
    btnCancelaNota   : TSpeedButton;
    btnGravaNota     : TSpeedButton;
    btnImprimeCliente: TSpeedButton;
    btnLocalizar: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExcluiProdutoClick(Sender: TObject);
    procedure btnCancelaNotaClick(Sender: TObject);
    procedure btnGravaNotaClick(Sender: TObject);
    procedure fldValorTotalExit(Sender: TObject);
    procedure grdProdutosColExit(Sender: TObject);
    procedure grdProdutosColEnter(Sender: TObject);
    procedure btnImprimeClienteClick(Sender: TObject);
    procedure fldFornecedorExit(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEntradaCompra: TformEntradaCompra;

implementation

uses ModuloDados, RotinasGerais, ProcessaNota, RelEntradaNota, Math;

{$R *.DFM}

procedure TformEntradaCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblNotaFiscal.IndexName := '';
   dmBaseDados.tblNotaFiscal.Close;
   dmBaseDados.tblEntrada.Close;
   dmBaseDados.tblFornecedores.Close;
   dmBaseDados.tblProdutos.Close;
end;

procedure TformEntradaCompra.FormShow(Sender: TObject);
begin
   dmBaseDados.tblEntrada.EmptyTable;
   dmBaseDados.tblNotaFiscal.Open;
   dmBaseDados.tblNotaFiscal.IndexName := 'IndNotaFiscal';
   dmBaseDados.tblEntrada.Open;
   dmBaseDados.tblFornecedores.Open;
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblNotaFiscal.Append;
   grdProdutos.SelectedField := dmBaseDados.tblEntradaCodigoProduto;
   fldNotaFiscal.SetFocus;
end;

procedure TformEntradaCompra.btnExcluiProdutoClick(Sender: TObject);
begin
   dmBaseDados.tblEntrada.Delete;
end;

procedure TformEntradaCompra.btnCancelaNotaClick(Sender: TObject);
begin
   dmBaseDados.tblNotaFiscal.BeforeDelete := nil;
   dmBaseDados.tblNotaFiscal.Delete;
   dmBaseDados.tblNotaFiscal.BeforeDelete := dmBaseDados.tblFamiliasBeforeDelete;
   Close;
end;

procedure TformEntradaCompra.btnGravaNotaClick(Sender: TObject);
begin
   //dmBaseDados.tblEntrada.Edit;
   if (formProcessaNota.ShowModal = mrYes) then

      Close;
end;

procedure TformEntradaCompra.fldValorTotalExit(Sender: TObject);
begin
   if ((dmBaseDados.tblEntrada.State <> dsInsert) and
 (dmBaseDados.tblEntrada.State <> dsEdit)) then
 dmBaseDados.tblEntrada.Edit;
   dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
   dmBaseDados.tblEntradaCodigoMovimento.AsString  := 'E';
   dmBaseDados.tblEntrada.Post;
end;

procedure TformEntradaCompra.grdProdutosColExit(Sender: TObject);
var
   strCodFamilia,strCodCategoria,strCodProduto: string;
begin
   if (grdProdutos.SelectedField = dmBaseDados.tblEntradaCodigoProduto) then
   begin
      strCodFamilia   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,1,3);
      strCodCategoria := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,4,3);
      strCodProduto   := Copy(dmBaseDados.tblEntradaCodigoProduto.AsString,7,6);
      if (not dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto])) then
      begin
         Mensagem('Código do produto não encontrado !');
         dmBaseDados.tblEntrada.Edit;
         dmBaseDados.tblEntradaCodigoProduto.AsString := '';
         dmBaseDados.tblEntrada.Post;
      end;
      if (grdProdutos.SelectedField = dmBaseDados.tblEntradaValorUnitario) then
      begin
         if ((dmBaseDados.tblEntrada.State <> dsInsert) and
(dmBaseDados.tblEntrada.State <> dsEdit)) then
            dmBaseDados.tblEntrada.Edit;
          dmBaseDados.tblEntradaValorTotal.AsFloat :=
dmBaseDados.tblEntradaQuantidade.AsFloat * dmBaseDados.tblEntradaValorUnitario.AsFloat;

      //dmBaseDados.tblHistoricoValorLancamento.AsFloat   :=
      //dmBaseDados.tblEntradaValorTotal.AsFloat;

          dmBaseDados.tblEntrada.Post;

{          dmBaseDados.tblEntradaValorTotal.AsString := strCodigo;
   dmBaseDados.tblFornecedores.Post;
   pgFornecedor.ActivePage := tabFornecedor;
   fldNomeFantasia.SetFocus;}

      end;
   end;
end;

procedure TformEntradaCompra.grdProdutosColEnter(Sender: TObject);
begin
   if (grdProdutos.SelectedField = dmBaseDados.tblEntradaCodigoProduto) then
   begin
      if ((dmBaseDados.tblEntrada.State <> dsInsert) and
   (dmBaseDados.tblEntrada.State <> dsEdit)) then
         dmBaseDados.tblEntrada.Edit;
      dmBaseDados.tblEntradaDataLancamento.AsDateTime := Date;
      dmBaseDados.tblEntradaCodigoMovimento.AsString  := 'E';
      dmBaseDados.tblEntrada.Post;
   end;
end;

procedure TformEntradaCompra.btnImprimeClienteClick(Sender: TObject);
begin
         formEntradarel.ShowModal;
end;

procedure TformEntradaCompra.fldFornecedorExit(Sender: TObject);

begin
 {  dmBaseDados.tblHistorico.Open;
   dmBaseDados.tblHistorico.First;
     if ((dmBaseDados.tblHistorico.Locate('NumeroNotaFiscal',fldNotaFiscal.Text,[LOCASEINSENSITIVE])= true) and (dmBaseDados.tblHistorico.Locate('ClienteFornecedor',fldFornecedor.Text,[LOCASEINSENSITIVE])= true)) then
         begin
           // dmBaseDados.tblHistorico.Filter := '('+'NumeroNotaFiscal ='+ QuotedStr(dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString)+')';
           // dmBaseDados.tblHistorico.Filtered := True;
            ShowMessage('Já existe essa Nota Para esse Fornecedor!!!');
              //dmBaseDados.tblEntrada.EmptyTable;
          //    dmBaseDados.tblEntrada.Open;
              while ((not dmBaseDados.tblHistorico.Eof)and((dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString) = (dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString))) do
                  begin
                     dmBaseDados.tblEntrada.Append;
                     dmBaseDados.tblEntrada.Insert;
                     dmBaseDados.tblEntradaCodigoProduto.AsString := dmBaseDados.tblHistoricoCodigoProduto.AsString;
                     dmBaseDados.tblEntradaQuantidade.AsString := dmBaseDados.tblHistoricoQuantidade.AsString;
                     dmBaseDados.tblEntradaValorUnitario.AsFloat := (dmBaseDados.tblHistoricoValorLancamento.AsFloat / dmBaseDados.tblHistoricoQuantidade.AsFloat);
                     dmBaseDados.tblEntradaValorTotal.AsString := dmBaseDados.tblHistoricoValorLancamento.AsString;
                     dmBaseDados.tblEntrada.Post;
                     dmBaseDados.tblHistorico.Next;
                  end;
               dmBaseDados.tblEntrada.Close;
         end;
    dmBaseDados.tblHistorico.Close;
}

end;

procedure TformEntradaCompra.btnLocalizarClick(Sender: TObject);
begin
   dmBaseDados.tblHistorico.Open;
   dmBaseDados.tblEntrada.Open;
   dmBaseDados.tblHistorico.First;
 if  dmBaseDados.tblHistorico.Locate('NumeroNotaFiscal',fldNotaFiscal.Text,[loCaseInsensitive]) = True then
      begin
        If dmBaseDados.tblHistoricoClienteFornecedor.AsString = fldFornecedor.Text then
           begin
             //ShowMessage('teste1');
             while (not dmBaseDados.tblHistorico.Eof) do
                begin
                  if dmBaseDados.tblHistoricoNumeroNotaFiscal.AsString = fldNotaFiscal.Text then
                      begin
                     dmBaseDados.tblEntrada.Append;
                   //  dmBaseDados.tblEntrada.Insert;
                     dmBaseDados.tblEntradaCodigoProduto.AsString := dmBaseDados.tblHistoricoCodigoProduto.AsString;
                     dmBaseDados.tblEntradaQuantidade.AsString := dmBaseDados.tblHistoricoQuantidade.AsString;
                     dmBaseDados.tblEntradaValorUnitario.AsFloat := (dmBaseDados.tblHistoricoValorLancamento.AsFloat / dmBaseDados.tblHistoricoQuantidade.AsFloat);
                     dmBaseDados.tblEntradaValorTotal.AsString := dmBaseDados.tblHistoricoValorLancamento.AsString;
                     dmBaseDados.tblEntradaAliquotaICMS.AsFloat := dmBaseDados.tblHistoricoICMS.AsFloat;
                     dmBaseDados.tblEntradaAliquotaIPI.AsFloat := dmBaseDados.tblHistoricoIPI.AsFloat;
                     dmBaseDados.tblEntradaValorComIPI.AsFloat := dmBaseDados.tblHistoricoValorIPI.AsFloat;
                     dmBaseDados.tblEntrada.Post;
                     dmBaseDados.tblHistorico.Next;

                      end
                  else
                      begin
                       dmBaseDados.tblHistorico.Next;

                      end;

                end;

           end
        else
           begin
            ShowMessage('bla');
           end;
      end;
end;

end.
