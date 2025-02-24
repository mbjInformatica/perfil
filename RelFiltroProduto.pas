unit RelFiltroProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls;

type
  TformRelFiltroProduto = class(TForm)
    qrpEstoque: TQuickRep;
    phbCabecario: TQRBand;
    lblMensagem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    qrlTitulo: TQRLabel;
    qrlNPedido: TQRLabel;
    qrlDescricao: TQRLabel;
    qrlQuantidade: TQRLabel;
    qrlTipo: TQRLabel;
    QRBand2: TQRBand;
    QRDBText4: TQRDBText;
    qrdDescricao: TQRDBText;
    qrdEstoqueAtual: TQRDBText;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure qrdPesoTotalPrint(sender: TObject; var Value: String);
    procedure qrePesoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelFiltroProduto: TformRelFiltroProduto;

implementation

uses ModuloDados, RelSelFamilia, RelSelCategoria;

{$R *.DFM}



procedure TformRelFiltroProduto.QRLabel2Print(sender: TObject;
  var Value: String);
 //var strPesoTotal : Double;
begin
  { Value:='';
   dmBaseDados.tblProdutos.Open;
   strPesoTotal := (dmBaseDados.tblProdutosPeso.AsFloat*dmBaseDados.tblProdutosEstoqueAtual.AsFloat);
   dmBaseDados.tblProdutos.Edit;
   dmBaseDados.tblProdutosPesoTotal.AsFloat := strPesoTotal ;
   dmBaseDados.tblProdutos.Post;}
end;
procedure TformRelFiltroProduto.qrdPesoTotalPrint(sender: TObject;
  var Value: String);
  var strPesoTotal : Double;
begin
   dmBaseDados.tblProdutos.Open;
   strPesoTotal := (dmBaseDados.tblProdutosPeso.AsFloat*dmBaseDados.tblProdutosEstoqueAtual.AsFloat);
   dmBaseDados.tblProdutos.Edit;
   Value := FloatToStr(strPesoTotal) ;
   dmBaseDados.tblProdutosPesoTotal.AsFloat := StrToFloat(Value);
   Value := FloatToStrF(StrToFloat(Value),ffFixed,10,3);
   dmBaseDados.tblProdutos.Post;
end;

procedure TformRelFiltroProduto.qrePesoPrint(sender: TObject; var Value: String);
begin
   Value := FloatToStrF(StrToFloat(Value),ffFixed,10,3);
end;

end.
