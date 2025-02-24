unit ValorProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls;

type
  TformValorproduto = class(TForm)
    edtCategoria: TEdit;
    edtMarca: TEdit;
    chkVenda: TCheckBox;
    chkCusto: TCheckBox;
    edtMargen: TEdit;
    lblFamilia: TLabel;
    lblCategoria: TLabel;
    lblMarca: TLabel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    btnOK: TButton;
    btnCancelar: TButton;
    edtFamilia1: TDBLookupComboBox;
    edtFamilia: TEdit;
    edtCategoria1: TDBLookupComboBox;
    edtMarca1: TDBLookupComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtFamilia1Click(Sender: TObject);
    procedure edtCategoria1Click(Sender: TObject);
    procedure edtMarca1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formValorproduto: TformValorproduto;

implementation
uses ModuloDados, DB;
{$R *.dfm}

procedure TformValorproduto.btnOKClick(Sender: TObject);
var  strValorCusto, strMargem,Venda,custo : Double;
begin
 Venda := 0;
 custo := 0;
  dmBaseDados.tblProdutos.Open;


//Começa o Filtro da tabela Produto....
   if edtFamilia.Text <> ' ' then
     begin
       //dmBaseDados.tblProdutos.Filtered := False;
       dmBaseDados.tblProdutos.Filter := '('+'CodigoFamilia ='+QuotedStr(edtFamilia.Text)+')';
       //dmBaseDados.tblProdutos.Filtered := True;
      end;
   if edtCategoria.Text <> '' then
     begin
       //dmBaseDados.tblProdutos.Filtered := False;
       dmBaseDados.tblProdutos.Filter := '('+'CodigoCategoria ='+QuotedStr(edtCategoria.Text)+')';
      // dmBaseDados.tblProdutos.Filtered := True;

     end;
   if edtMarca.Text <> '' then
     begin
       //dmBaseDados.tblProdutos.Filtered := False;
       dmBaseDados.tblProdutos.Filter := '('+'CodigoMarca ='+QuotedStr(edtMarca.Text)+')';
      // dmBaseDados.tblProdutos.Filtered := True;

    end;
   if ((edtFamilia.Text <> '') and (edtCategoria.Text <>'')) then
     begin

       dmBaseDados.tblProdutos.Filter := '('+'CodigoFamilia ='+QuotedStr(edtFamilia.Text)+')and('+ 'CodigoCategoria ='+QuotedStr(edtCategoria.Text)+')';

     end;
   if ((edtFamilia.Text <> '') and (edtMarca.Text <> '')) then
     begin
       dmBaseDados.tblProdutos.Filter := '('+'CodigoFamilia ='+QuotedStr(edtFamilia.Text)+')and('+ 'CodigoMarca ='+QuotedStr(edtMarca.Text)+')';

     end;
   if ((edtCategoria.Text <> '') and (edtMarca.Text <> '')) then
     begin
       dmBaseDados.tblProdutos.Filter := '('+'CodigoCategoria ='+QuotedStr(edtCategoria.Text)+')and('+ 'CodigoMarca ='+QuotedStr(edtMarca.Text)+')';


     end;
   if ((edtFamilia.Text <> '') and (edtCategoria.Text <> '') and (edtMarca.Text <> '')) then
     begin
       dmBaseDados.tblProdutos.Filter := '('+'CodigoFamilia ='+QuotedStr(edtFamilia.Text)+')and('+ 'CodigoMarca ='+QuotedStr(edtMarca.Text)+')and('+ 'CodigoCategoria ='+QuotedStr(edtCategoria.Text)+')';


     end;

  dmBaseDados.tblProdutos.Filtered := True;

//...Termina o filtro da tabela produto...
   dmBaseDados.tblProdutos.First;
     while (not dmBaseDados.tblProdutos.Eof) do
       begin
         if edtMargen.Text <> '' then
           begin
             if ((chkVenda.Checked = true) and (chkCusto.Checked = false)) then
               begin
                  Venda := dmBaseDados.tblProdutosValorVenda.AsFloat;
                  dmBaseDados.tblProdutos.Edit;
                  dmBaseDados.tblProdutosValorVenda.AsFloat := Venda+((dmBaseDados.tblProdutosValorVenda.AsFloat * StrToFloat(edtMargen.Text))/100);
                  dmBaseDados.tblProdutosMargemLucro.AsFloat := (dmBaseDados.tblProdutosValorVenda.AsFloat-dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat)*100/dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
               end;
             if ((chkCusto.Checked = True) and (chkVenda.Checked = false)) then
               begin
                  custo := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
                  dmBaseDados.tblProdutos.Edit;
                  dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat := custo + ((dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat * StrToFloat(edtMargen.Text)) / 100);
                  dmBaseDados.tblProdutosMargemLucro.AsFloat := (dmBaseDados.tblProdutosValorVenda.AsFloat-dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat)*100/dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
               end;
             if ((chkVenda.Checked = True)  and (chkCusto.Checked = True)) then
               begin
                  Venda := dmBaseDados.tblProdutosValorVenda.AsFloat;
                  custo := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;

                  dmBaseDados.tblProdutos.Edit;
                  dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat := custo + ((dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat * StrToFloat(edtMargen.Text)) / 100);
                  dmBaseDados.tblProdutosValorVenda.AsFloat := Venda + ((dmBaseDados.tblProdutosValorVenda.AsFloat * StrToFloat(edtMargen.Text))/100);
                  dmBaseDados.tblProdutosMargemLucro.AsFloat := (dmBaseDados.tblProdutosValorVenda.AsFloat-dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat)*100/dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
               end;

            // dmBaseDados.tblProdutos.Edit;
            // dmBaseDados.tblProdutosMargemLucro.AsFloat := dmBaseDados.tblProdutosMargemLucro.AsFloat + StrToFloat(edtMargen.Text);
            // strValorCusto := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
            // strMargem     := dmBaseDados.tblProdutosMargemLucro.AsFloat;
             //dmBaseDados.tblProdutos.Edit;
            // dmBaseDados.tblProdutosValorVenda.AsFloat := (strValorCusto*strMargem/100)+strValorCusto;
             dmBaseDados.tblProdutos.Post;
           end;


          dmBaseDados.tblProdutos.Next;



       end;




end;

procedure TformValorproduto.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TformValorproduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblProdutos.Filter := '';
   dmBaseDados.tblProdutos.Filtered := False;
   dmBaseDados.tblProdutos.Close;
   dmBaseDados.tblFamilias.Close;
   dmBaseDados.tblCategoria.Close;
   dmBaseDados.tblMarcas.Close;

end;

procedure TformValorproduto.FormShow(Sender: TObject);
begin
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblCategoria.Open;
dmBaseDados.tblMarcas.Open;
edtCategoria.Text  := '';
edtMarca.Text      := '';
edtFamilia.Text    := '';
//edtCategoria1.Hint := '';
//edtMarca1.Hint     := '';
//edtFamilia1.Hint   := '';
edtMargen.Text     := '';
chkVenda.Checked   := False;
chkCusto.Checked   := False;

end;

procedure TformValorproduto.edtFamilia1Click(Sender: TObject);
begin
edtFamilia.Text := dmBaseDados.tblFamiliasCodigoFamilia.AsString;
end;

procedure TformValorproduto.edtCategoria1Click(Sender: TObject);
begin
edtCategoria.Text := dmBaseDados.tblCategoriaCodigoCategoria.AsString;
end;

procedure TformValorproduto.edtMarca1Click(Sender: TObject);
begin
edtMarca.Text := dmBaseDados.tblMarcasCodigoMarca.AsString;
end;

procedure TformValorproduto.btnLimparClick(Sender: TObject);
begin
edtCategoria.Text  := '';
edtMarca.Text      := '';
edtFamilia.Text         := '';
//edtCategoria1.ListField := '';
//edtMarca1.Hint     := '';
//edtFamilia1.Hint   := '';
edtMargen.Text     := '';
chkVenda.Checked   := False;
chkCusto.Checked   := False;
end;

end.
