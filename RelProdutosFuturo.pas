unit RelProdutosFuturo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls;

type
  TformRelProdutosFututo = class(TForm)
    rptProdutosFuturo: TQuickRep;
    bndCabecalho: TQRBand;
    lblTitulo: TQRLabel;
    lblOrdem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    qrlEmpresa: TQRLabel;
    bndColunas: TQRBand;
    lblCodigoProduto: TQRLabel;
    lblUnidadeMedida: TQRLabel;
    lblDescricaoDetalhada: TQRLabel;
    lblMarca: TQRLabel;
    qrlPun21D: TQRLabel;
    qrlPcx21D: TQRLabel;
    qrlPun14D: TQRLabel;
    qrlPcx14D: TQRLabel;
    qrlPun7D: TQRLabel;
    qrlPcx7D: TQRLabel;
    bndProdutos: TQRBand;
    flfCodigoFamilia: TQRDBText;
    fldCodigoCategoria: TQRDBText;
    fldCodigoProduto: TQRDBText;
    fldUnidadeMedida: TQRDBText;
    fldMarca: TQRDBText;
    fldDescricaoDetalhada: TQRDBText;
    qrdbPun7D: TQRDBText;
    qrePcx7D: TQRExpr;
    qrePun14D: TQRExpr;
    qrePun21D: TQRExpr;
    qrePcx21D: TQRExpr;
    qrePcx14D: TQRExpr;
    qrlComissao: TQRLabel;
    qrbRodape: TQRBand;
    qrlSlogan: TQRLabel;
    procedure qrlComissaoPrint(sender: TObject; var Value: String);
    procedure flfCodigoFamiliaPrint(sender: TObject; var Value: String);
    procedure fldCodigoCategoriaPrint(sender: TObject; var Value: String);
    procedure fldCodigoProdutoPrint(sender: TObject; var Value: String);
    procedure fldMarcaPrint(sender: TObject; var Value: String);
    procedure fldUnidadeMedidaPrint(sender: TObject; var Value: String);
    procedure qrdbPun7DPrint(sender: TObject; var Value: String);
    procedure qrePcx7DPrint(sender: TObject; var Value: String);
    procedure qrePcx14DPrint(sender: TObject; var Value: String);
    procedure qrePun14DPrint(sender: TObject; var Value: String);
    procedure qrePcx21DPrint(sender: TObject; var Value: String);
    procedure qrePun21DPrint(sender: TObject; var Value: String);
    procedure fldDescricaoDetalhadaPrint(sender: TObject;
      var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelProdutosFututo: TformRelProdutosFututo;

implementation
uses ModuloDados;

{$R *.DFM}

procedure TformRelProdutosFututo.qrlComissaoPrint(sender: TObject;
  var Value: String);
begin
       dmBaseDados.tblProdutos.Open;
        if dmBaseDados.tblProdutosComissao.AsFloat = 0 then
         begin
           Value := '';
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 1 then
         begin
           Value := 'A';
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 2 then
         begin
           Value := 'B';
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 3 then
         begin
           Value := 'C';
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 4 then
         begin
           Value := 'D';
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 5 then
         begin
           Value := 'E'
         end;
        if dmBaseDados.tblProdutosComissao.AsFloat = 6 then
         begin
           Value := 'F';
         end;
qrlComissao.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
    qrlComissao.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.flfCodigoFamiliaPrint(sender: TObject;
  var Value: String);
begin
flfCodigoFamilia.Font.Name := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     flfCodigoFamilia.Font.Name := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.fldCodigoCategoriaPrint(sender: TObject;
  var Value: String);
begin
fldCodigoCategoria.Font.Name := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     fldCodigoCategoria.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.fldCodigoProdutoPrint(sender: TObject;
  var Value: String);
begin
fldCodigoProduto.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     fldCodigoProduto.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.fldMarcaPrint(sender: TObject;
  var Value: String);
begin
fldMarca.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     fldMarca.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.fldUnidadeMedidaPrint(sender: TObject;
  var Value: String);
begin
fldUnidadeMedida.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     fldUnidadeMedida.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrdbPun7DPrint(sender: TObject;
  var Value: String);
begin
qrdbPun7D.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     qrdbPun7D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrePcx7DPrint(sender: TObject;
  var Value: String);
begin
qrePcx7D.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     qrePcx7D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrePcx14DPrint(sender: TObject;
  var Value: String);
begin
qrePcx14D.Font.Name  := 'Arial ';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     qrePcx14D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrePun14DPrint(sender: TObject;
  var Value: String);
begin
qrePun14D.Font.Name  := 'Arial ';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     qrePun14D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrePcx21DPrint(sender: TObject;
  var Value: String);
begin
qrePcx21D.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
    qrePcx21D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.qrePun21DPrint(sender: TObject;
  var Value: String);
begin
qrePun21D.Font.Name  := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     qrePun21D.Font.Name  := 'Arial Black';
   end;
end;

procedure TformRelProdutosFututo.fldDescricaoDetalhadaPrint(
  sender: TObject; var Value: String);
begin
fldDescricaoDetalhada.Font.Name := 'Arial';
 if ((dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'CX')and(dmBaseDados.tblProdutosUnidadeMedida.AsString <> 'FD')) then
   begin
     fldDescricaoDetalhada.Font.Name := 'Arial Black';
   end;
end;

end.
