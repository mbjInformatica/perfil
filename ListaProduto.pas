unit ListaProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, Grids, DBGrids, Mask,ComCtrls, db, TIGradient;

type
  TformListaProdutos = class(TForm)
    lblCodigo: TLabel;
    fldValorold: TDBEdit;
    fldValorVenda: TDBText;
    lblVVenda: TLabel;
    Label1: TLabel;
    edtCodBarra: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    fldProduto: TDBText;
    Label3: TLabel;
    Label4: TLabel;
    edtRefFab: TEdit;
    BitBtn2: TBitBtn;
    dbImagem: TDBImage;
    Label5: TLabel;
    fldEstoque: TDBText;
    fldLocalizacao: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    fldCaracteristicasProd: TDBMemo;
    Edit1: TEdit;
    dbgDescricao: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    edtMemo: TEdit;
    btnOKCarro: TButton;
    Label10: TLabel;
    fldReferencia: TDBText;
    ckbNaoCadastrado: TCheckBox;
    dbeDescricao: TDBEdit;
    fldValor: TEdit;
    btnOK: TBitBtn;
    dbCaracteristica2: TDBMemo;
    fldCodigo: TDBText;
    btnCadProdutos: TSpeedButton;
    dbcFamilia: TDBLookupComboBox;
    Button1: TButton;
    dbcCategoria: TDBLookupComboBox;
    btnCategoria: TButton;
    BitBtn3: TBitBtn;
    TIGradient1: TTIGradient;
    BitBtn4: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKCarroClick(Sender: TObject);
    procedure ckbNaoCadastradoClick(Sender: TObject);
    procedure dbeDescricaoChange(Sender: TObject);
    procedure edtRefFabKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodBarraKeyPress(Sender: TObject; var Key: Char);
    procedure edtMemoKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure fldValorClick(Sender: TObject);
    procedure fldValorChange(Sender: TObject);
    procedure edtMemoChange(Sender: TObject);
    procedure btnOKCarroExit(Sender: TObject);
    procedure edtRefFabChange(Sender: TObject);
    procedure btnCadProdutosClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCategoriaClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dbgDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formListaProdutos: TformListaProdutos;
    Status, CadastroStatus : String;

implementation

uses ModuloDados, SeekProduto, Produtos;


{$R *.DFM}


procedure TformListaProdutos.FormShow(Sender: TObject);
begin
Status := '0';
edtCodBarra.Text   := '';
edtRefFab.Text     := '';
Edit1.Text         := '';
edtMemo.Text       := '';
fldValor.text      := '';
btnOK.Default      := False;
btnOKCarro.Default := False;
ckbNaoCadastrado.Checked := False;
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblFamilias.IndexName  := 'indDescricao';
dmBaseDados.tblCategoria.Open;
dmBaseDados.tblCategoria.IndexName := 'indDescricao';
{dmBaseDados.tblProdutos.Open;
dmBaseDados.tblProdutos.IndexName := 'IndDescriAbreviada';}

dmBaseDados.qryProdutos.Close;
dmBaseDados.qryProdutos.SQL.Text := 'SELECT * FROM Produtos ORDER BY DescricaoAbreviada';
dmBaseDados.qryProdutos.Open;

dmBaseDados.tblProdutos.Filter    := '';
dmBaseDados.tblProdutos.Filtered  := False;
//--
dbgDescricao.DataSource           := dmBaseDados.dsqProdutos;
dbgDescricao.Columns[0].FieldName := 'DescricaoAbreviada';
dbgDescricao.Columns[1].FieldName := 'ReferenciaFabricante';
fldProduto.DataField      := '';
fldReferencia.DataField   := '';
fldValorVenda.DataField   := '';
fldEstoque.DataField      := '';
fldLocalizacao.DataField  := '';
dbImagem.DataField        := '';
fldCaracteristicasProd.DataField := '';
fldCaracteristicasProd.DataSource := dmBaseDados.dsqProdutos;
fldCaracteristicasProd.DataField  := 'Caracteristicas';
dbImagem.DataSource       := dmBaseDados.dsqProdutos;
dbImagem.DataField        := 'Imagem';
fldProduto.DataSource     := dmBaseDados.dsqProdutos;
fldProduto.DataField      := 'DescricaoAbreviada';
fldCodigo.DataSource      := dmBaseDados.dsqProdutos;
fldCodigo.DataField       := 'CodigoBarra';
fldReferencia.DataSource  := dmBaseDados.dsqProdutos;
fldReferencia.DataField   := 'ReferenciaFabricante';
fldValorVenda.DataSource  := dmBaseDados.dsqProdutos;
fldValorVenda.DataField   := 'ValorVenda';
fldEstoque.DataSource     := dmBaseDados.dsqProdutos;
fldEstoque.DataField      := 'EstoqueAtual';
fldLocalizacao.DataSource := dmBaseDados.dsqProdutos;
fldLocalizacao.DataField  := 'Localizacao';

Edit1.SetFocus;
end;

procedure TformListaProdutos.BitBtn1Click(Sender: TObject);
begin
//dmBaseDados.qryProdutos.IndexName := 'IndCodBarra';
//if (not dmBaseDados.qryProdutos.FindKey([edtCodBarra.Text])) then
if (dmBaseDados.qryProdutos.Locate('CodigoBarra',edtCodBarra.Text,[loCaseInsensitive]) = FALSE) then
 begin
  ShowMessage('Código de Barras Inválido! Produto não Cadastrado!');
  //dmBaseDados.qryProdutos.IndexName := '';
 end;
//dmBaseDados.qryProdutos.IndexName := '';
end;

procedure TformListaProdutos.BitBtn2Click(Sender: TObject);
begin
{
 dmBaseDados.qryProdutos.IndexName := 'IndReferencia';
 if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
  begin
   dmBaseDados.qryProdutos.IndexName := 'IndRef2';
    if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
     begin
      dmBaseDados.qryProdutos.IndexName := 'IndRef3';
       if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
        begin
         dmBaseDados.qryProdutos.IndexName := 'IndRef4';
          if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
           begin
            dmBaseDados.qryProdutos.IndexName := 'IndCodInterno';
             if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
              begin
               ShowMessage('Referência do Fabricante Inválido! Produto não Cadastrado!');
               dmBaseDados.qryProdutos.IndexName := '';
              end;
           end;
        end;
     end;
  end;
dmBaseDados.qryProdutos.IndexName := '';}


if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
  begin
    if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante2',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
     begin
       if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante3',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
        begin
          if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante4',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
           begin
             if (dmBaseDados.qryProdutos.Locate('CodigoInterno',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
              begin
               ShowMessage('Referência do Fabricante Inválido! Produto não Cadastrado!');
               edtRefFab.SetFocus;
               Abort;
              end;
           end;
        end;
     end;
  end;

end;
procedure TformListaProdutos.Edit1Change(Sender: TObject);
begin
if (Status = '0') then
 begin
  //dmBaseDados.qryProdutos.IndexName := 'IndDescriAbreviada';
  //dmBaseDados.tblProdutos.FindNearest([Edit1.Text]);

  if (Edit1.Text <> '') then
   begin
    dmBaseDados.qryProdutos.Locate('DescricaoAbreviada',Edit1.Text,[loPartialKey]);
   end;
 end
else
 begin
  //dmBaseDados.tblLogMensal.IndexName := 'IndDescricao';
  //dmBaseDados.tblLogMensal.FindNearest([Edit1.Text]);
  dmBaseDados.tblLogMensal.Locate('DescricaoAbreviada',Edit1.Text,[loPartialKey]);
 end;
end;

procedure TformListaProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblFamilias.Close;
//dmBaseDados.qryProdutos.IndexName:= '';
{if dmBaseDados.tblProdutosStatus.AsString = '1'  then
 begin
   dmBaseDados.tblProdutos.Filter := '';
   dmBaseDados.tblProdutos.Filtered := False;
   dmBaseDados.tblProdutos.First;
   while (not dmBaseDados.tblProdutos.Eof) do
    begin
      dmBaseDados.tblProdutos.Edit;
      dmBaseDados.tblProdutosStatus.AsString := '' ;
      dmBaseDados.tblProdutos.Post;
      dmBaseDados.tblProdutos.Next;
    end;
   dmBaseDados.tblPedidos.IndexName := '';
 end;  }
end;

procedure TformListaProdutos.btnOKCarroClick(Sender: TObject);
var achei : Integer;
begin
Status := '1';
{dmBaseDados.tblProdutos.Filter := '';
dmBaseDados.tblProdutos.Filtered := False;
dmBaseDados.tblProdutos.First;
dmBaseDados.tblProdutos.Open;}



//dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblLogMensal.First;
WHILE (not dmBaseDados.tblLogMensal.Eof) do
 begin
   dmBaseDados.tblLogMensal.Delete;
 end;
achei := 0;
  while (not dmBaseDados.qryProdutos.Eof )  do
      begin
       achei := 0;
       achei := (pos(edtMemo.Text,formListaProdutos.dbCaracteristica2.Lines.Text));
        if (achei <> 0 ) then
          begin
            //achei:=  ;
            //ShowMessage('encontrei');
            dmBaseDados.tblLogMensal.Append;
            dmBaseDados.tblLogMensalCodigoProduto.AsString  := dmBaseDados.qryProdutosCodigoBarra.AsString;
            dmBaseDados.tblLogMensalDescricao.AsString      := dmBaseDados.qryProdutosDescricaoAbreviada.AsString;
            dmBaseDados.tblLogMensalValorLancamento.AsFloat := dmBaseDados.qryProdutosValorVenda.AsFloat;
            dmBaseDados.tblLogMensalObservacao.AsString     := dmBaseDados.qryProdutosReferenciaFabricante.AsString;
            dmBaseDados.tblLogMensalQuantidade.AsFloat      := dmBaseDados.qryProdutosEstoqueAtual.AsFloat;
            dmBaseDados.tblLogMensalDocumento.AsString      := dmBaseDados.qryProdutosLocalizacao.AsString;
            dmBaseDados.tblLogMensalImagem.AsString         := dmBaseDados.qryProdutosImagem.AsString;
            dmBaseDados.tblLogMensalCaracteristicas.AsString := dmBaseDados.qryProdutosCaracteristicas.AsString;
            dmBaseDados.tblLogMensal.Post;
            {dmBaseDados.tblProdutos.Edit;
            dmBaseDados.tblProdutosStatus.AsString := '1';
            dmBaseDados.tblProdutos.Post;}
            dmBaseDados.qryProdutos.Next;
            //close;
          end;
           if (achei = 0) then
              begin
                dmBaseDados.qryProdutos.Next;
                 //ShowMessage('não encontrei');

              end;

      end;
    dbgDescricao.DataSource := dmBaseDados.dsLogmensal;
    dbgDescricao.Columns[0].FieldName := 'Descricao';
    dbgDescricao.Columns[1].FieldName := 'Observacao';

    fldProduto.DataField      := '';
    fldCodigo.DataField       := '';
    fldReferencia.DataField   := '';
    fldValorVenda.DataField   := '';
    fldEstoque.DataField      := '';
    fldLocalizacao.DataField  := '';
    dbImagem.DataField        := '';
    fldCaracteristicasProd.DataField := '';

    fldCaracteristicasProd.DataSource := dmBaseDados.dsLogMensal;
    fldCaracteristicasProd.DataField  := 'Caracteristicas';

    dbImagem.DataSource       := dmBaseDados.dsLogMensal;
    dbImagem.DataField        := 'Imagem';

    fldProduto.DataSource     := dmBaseDados.dsLogMensal;
    fldProduto.DataField      := 'Descricao';

    fldCodigo.DataSource      := dmBaseDados.dsLogMensal;
    fldCodigo.DataField       := 'CodigoProduto';

    fldReferencia.DataSource  := dmBaseDados.dsLogMensal;
    fldReferencia.DataField   := 'Observacao';

    fldValorVenda.DataSource  := dmBaseDados.dsLogMensal;
    fldValorVenda.DataField   := 'ValorLancamento';

    fldEstoque.DataSource     := dmBaseDados.dsLogMensal;
    fldEstoque.DataField      := 'Quantidade';

    fldLocalizacao.DataSource := dmBaseDados.dsLogMensal;
    fldLocalizacao.DataField  := 'Documento';
if Edit1.Text <> '' then
begin
if Status = '0' then
 begin
  {
  dmBaseDados.qryProdutos.IndexName := 'IndDescriAbreviada';
  dmBaseDados.qryProdutos.FindNearest([Edit1.Text]);
  }
  dmBaseDados.qryProdutos.Locate('DescricaoAbreviada',Edit1.Text,[loPartialKey,loCaseInsensitive]);
 end
else
 begin
  dmBaseDados.tblLogMensal.Locate('Descricao',Edit1.Text,[loPartialKey]);
 end;

end;
end;

procedure TformListaProdutos.ckbNaoCadastradoClick(Sender: TObject);
var strCodigo : String;
begin
    strCodigo := '9999999999-9';
    if ckbNaoCadastrado.Checked = True then
      begin
        dmBaseDados.tblProdutos.Locate('Codigo',strCodigo,[LOCASEINSENSITIVE]) ;
        dmBaseDados.qryProdutos.Locate('Codigo',strCodigo,[LOCASEINSENSITIVE]) ;
        dbeDescricao.Visible  := True;
        dbeDescricao.ReadOnly := False;
        dbeDescricao.SetFocus;
      end
    else
      begin
       dbeDescricao.Visible  := False;
       dbeDescricao.ReadOnly := True;
      end;
end;

procedure TformListaProdutos.dbeDescricaoChange(Sender: TObject);
begin
if dmBaseDados.qryProdutosCodigo.AsString <> '9999999999-9' then
 begin
   dbeDescricao.Visible := False;
   dbeDescricao.ReadOnly := True;
 end;
end;

procedure TformListaProdutos.edtRefFabKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
 BEGIN
{
   dmBaseDados.qryProdutos.IndexName := 'IndReferencia';
   if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
    begin
     dmBaseDados.qryProdutos.IndexName := 'IndRef2';
      if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
       begin
        dmBaseDados.qryProdutos.IndexName := 'IndRef3';
         if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
          begin
           dmBaseDados.qryProdutos.IndexName := 'IndRef4';
            if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
             begin
              dmBaseDados.qryProdutos.IndexName := 'IndCodInterno';
               if (not dmBaseDados.qryProdutos.FindKey([edtRefFab.Text])) then
                begin
                 ShowMessage('Referência do Fabricante Inválido! Produto não Cadastrado!');
                 dmBaseDados.qryProdutos.IndexName := '';
                end;
             end;
          end;
       end;
    end;
   dmBaseDados.qryProdutos.IndexName := '';
}
  if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
   begin
    if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante2',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
     begin
       if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante3',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
        begin
          if (dmBaseDados.qryProdutos.Locate('ReferenciaFabricante4',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
           begin
             if (dmBaseDados.qryProdutos.Locate('CodigoInterno',edtRefFab.Text,[loCaseInsensitive]) = FALSE) then
              begin
               ShowMessage('Referência do Fabricante Inválido! Produto não Cadastrado!');
               edtRefFab.SetFocus;
               Abort;
              end;
           end;
        end;
     end;
  end;
 END;
end;

procedure TformListaProdutos.edtCodBarraKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  BEGIN
    {
    dmBaseDados.qryProdutos.IndexName := 'IndCodBarra';
    if (not dmBaseDados.qryProdutos.FindKey([edtCodBarra.Text]))then
    }
    if (dmBaseDados.qryProdutos.Locate('CodigoBarra',edtCodBarra.Text,[loCaseInsensitive]) = FALSE) then
      begin
       ShowMessage('Código de Barras Inválido! Produto não Cadastrado!');
       //dmBaseDados.qryProdutos.IndexName := '';
     end;
  END;
//dmBaseDados.qryProdutos.IndexName := '';
end;

procedure TformListaProdutos.edtMemoKeyPress(Sender: TObject;
  var Key: Char);
var
   achei : Integer;
begin
{if Key = #13 then
  BEGIN
dmBaseDados.tblProdutos.Filter := '';
dmBaseDados.tblProdutos.Filtered := False;
dmBaseDados.tblProdutos.First;
dmBaseDados.tblProdutos.Open;
achei := 0;
  while (not dmBaseDados.tblProdutos.Eof )  do
      begin
       achei := 0;
       achei := (pos(edtMemo.Text,formListaProdutos.fldCaracteristicasProd.Lines.Text));
           if (achei <> 0 ) then
              begin
                //achei:= ;
                //ShowMessage('encontrei');
                dmBaseDados.tblProdutos.Edit;
                dmBaseDados.tblProdutosStatus.AsString := '1';
                dmBaseDados.tblProdutos.Post;
                dmBaseDados.tblProdutos.Next;

                //close;
              end;
           if (achei = 0) then
              begin
                dmBaseDados.tblProdutos.Next;
                 //ShowMessage('naun encontrei');

              end;

      end;
    dmBaseDados.tblProdutos.Filter := '('+'Status ='+QuotedStr('1')+')';
    dmBaseDados.tblProdutos.Filtered := True;


  END;     }

end;

procedure TformListaProdutos.btnOKClick(Sender: TObject);
var strCodigo, strReferencia : String;
begin
strCodigo := dmBaseDados.qryProdutosCodigoFamilia.AsString+
dmBaseDados.qryProdutosCodigoCategoria.AsString+  dmBaseDados.qryProdutosCodigoProduto.AsString;
strReferencia := dmBaseDados.qryProdutosReferenciaFabricante.AsString;
dmBaseDados.tblSaida.Edit;
dmBaseDados.tblSaidaQtdeCx.AsFloat   := dmBaseDados.qryProdutosICMS.AsFloat;
dmBaseDados.tblSaidaUnidade.AsString := dmBaseDados.qryProdutosUnidadeMedida.AsString;
if (Status <> '1') then
  Begin
   dmBaseDados.tblSaidaRefFabricante.AsString    := strReferencia;
   dmBaseDados.tblSaidaDescricaoProduto.AsString := dmBaseDados.qryProdutosDescricaoAbreviada.AsString;
   if (ckbNaoCadastrado.Checked = False) then
    begin
     dmBaseDados.tblSaidaCodigoProduto.AsString  := strCodigo;
    end
   else
    begin
     dmBaseDados.tblSaidaCodigoProduto.AsString    := dmBaseDados.tblSaidaIDRegistro.AsString;
     dmBaseDados.tblSaidaDescricaoProduto.AsString := dbeDescricao.Text;
    end;
  End
else
  Begin
   dmBaseDados.tblSaidaCodigoProduto.AsString    := dmBaseDados.tblLogMensalCodigoProduto.AsString;
   dmBaseDados.tblSaidaRefFabricante.AsString    := dmBaseDados.tblLogMensalObservacao.AsString;
   dmBaseDados.tblSaidaDescricaoProduto.AsString := dmBaseDados.tblLogMensalDescricao.AsString;
  End;
//--
if (fldValor.Text = '') then
 Begin
  if (Status = '0') then
   begin
    dmBaseDados.tblSaidaValorUnitario.AsFloat := dmBaseDados.qryProdutosValorVenda.AsFloat;
   end
  else
   begin
    dmBaseDados.tblSaidaValorUnitario.AsFloat := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
   end;
 End
else
 Begin
  dmBaseDados.tblSaidaValorUnitario.AsFloat := StrToFloat(fldValor.Text);
 End;
//dmBasedados.qryProdutos.IndexName := '';
Close;
end;

procedure TformListaProdutos.fldValorClick(Sender: TObject);
begin
//fldValor.Text := FloatToStr(dmBaseDados.tblProdutosValorVenda.AsFloat);

end;

procedure TformListaProdutos.fldValorChange(Sender: TObject);
begin
btnOKCarro.Default := False;
btnOK.Default := True;
end;

procedure TformListaProdutos.edtMemoChange(Sender: TObject);
begin
btnOKCarro.Default := True;
end;

procedure TformListaProdutos.btnOKCarroExit(Sender: TObject);
begin
btnOKCarro.Default := false;
end;

procedure TformListaProdutos.edtRefFabChange(Sender: TObject);
begin
btnOKCarro.Default := False;
if Status = '0' then
 begin
  //dmBaseDados.qryProdutos.IndexName := 'IndDescriAbreviada';
  dmBaseDados.qryProdutos.Locate('ReferenciaFabricante',edtRefFab.Text,[loPartialKey]);
 end
else
 begin
  dmBaseDados.tblLogMensal.Locate('Observacao',edtRefFab.Text,[loPartialKey]);

 end;
end;

procedure TformListaProdutos.btnCadProdutosClick(Sender: TObject);
begin
dmBaseDados.tblProdutos.Locate('Codigo',dmBaseDados.qryProdutosCodigo.AsString,[loPartialKey]);
formprodutos.ShowModal;
dmBaseDados.qryProdutos.Close;
dmBaseDados.qryProdutos.Open;
dmBaseDados.qryProdutos.Locate('Codigo',dmBaseDados.tblProdutosCodigo.AsString,[loPartialKey]);
CadastroStatus := '1';
end;

procedure TformListaProdutos.Button1Click(Sender: TObject);
var strCodFam :String;
begin
strCodFam := dmBaseDados.tblFamiliasCodigoFamilia.AsString;
dmBaseDados.qryProdutos.Filter   := '('+'CodigoFamilia ='+QuotedStr(strCodFam)+')';
dmBaseDados.qryProdutos.Filtered := True;
end;

procedure TformListaProdutos.btnCategoriaClick(Sender: TObject);
var strCodCat :String;
begin
strCodCat := dmBaseDados.tblCategoriaCodigoCategoria.AsString;
dmBaseDados.qryProdutos.Filter   := '('+'CodigoCategoria ='+QuotedStr(strCodCat)+')';
dmBaseDados.qryProdutos.Filtered := True;
end;

procedure TformListaProdutos.BitBtn3Click(Sender: TObject);
begin
dmBaseDados.qryProdutos.Filter   := '';
dmBaseDados.qryProdutos.Filtered := False;
dmBaseDados.qryProdutos.Close;
dmBaseDados.qryProdutos.SQL.Text := 'SELECT * FROM Produtos ORDER BY DescricaoAbreviada';
dmBaseDados.qryProdutos.Open;
end;

procedure TformListaProdutos.dbgDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  btnOK.SetFocus;
 end;
end;

procedure TformListaProdutos.BitBtn4Click(Sender: TObject);
begin
if (Edit1.Text <> '') then
   begin
    dmBaseDados.qryProdutos.Close;
    dmBaseDados.qryProdutos.SQL.Text := 'SELECT * FROM Produtos WHERE (DescricaoAbreviada LIKE "%'+Edit1.Text+'%") ORDER BY DescricaoAbreviada';
    dmBaseDados.qryProdutos.Open;
   end;
end;

procedure TformListaProdutos.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
  BitBtn4.Click;
 end;
end;

end.
