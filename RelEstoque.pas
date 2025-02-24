unit RelEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls;

type
  TformRelEstoque = class(TForm)
    qrpEstoque: TQuickRep;
    phbCabecario: TQRBand;
    lblMensagem: TQRLabel;
    sysData: TQRSysData;
    sysPagina: TQRSysData;
    qrlTitulo: TQRLabel;
    qrlNPedido: TQRLabel;
    qrlDescricao: TQRLabel;
    qrlValor: TQRLabel;
    qrlQuantidade: TQRLabel;
    QRBand1: TQRBand;
    qreQtde: TQRExpr;
    qrlTipo: TQRLabel;
    QRLabel1: TQRLabel;
    qrePeso: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrdDescricao: TQRDBText;
    qrdPesoTotal: TQRDBText;
    qrdEstoqueAtual: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRExpr;
    QRDBText7: TQRExpr;
    procedure QRLabel2Print(sender: TObject; var Value: String);
    procedure qrdPesoTotalPrint(sender: TObject; var Value: String);
    procedure qrePesoPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelEstoque: TformRelEstoque;

implementation

uses ModuloDados, RelSelFamilia, RelSelCategoria;

{$R *.DFM}



procedure TformRelEstoque.QRLabel2Print(sender: TObject;
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
procedure TformRelEstoque.qrdPesoTotalPrint(sender: TObject;
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

procedure TformRelEstoque.qrePesoPrint(sender: TObject; var Value: String);
begin
   Value := FloatToStrF(StrToFloat(Value),ffFixed,10,3);
end;

end.
