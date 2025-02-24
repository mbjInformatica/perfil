unit EmEstoqueRefFab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEmEstoqueRefFab = class(TForm)
    lblEstoque   : TLabel;
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    ckbValorFuturo: TCheckBox;
    ckbEstoqueFuturo: TCheckBox;
    ckbSemValor: TCheckBox;
    procedure bbtConfirmarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEmEstoqueRefFab: TformEmEstoqueRefFab;

implementation

uses ModuloDados, RelEstoque, RelProdutos, RelProdutosFuturo,
  RelEstoqueFuturo;

{$R *.DFM}

procedure TformEmEstoqueRefFab.bbtConfirmarClick(Sender: TObject);
begin
   dmBaseDados .tblProdutos.Open;
   dmBaseDados.tblProdutos.IndexName    := 'IndReferencia';
   formRelEstoque.qrlTipo.Caption       := 'ORDEM DE REFERÊNCIA DE FABRICANTE';
   formRelEstoqueFuturo.qrlTipo.Caption := 'ORDEM DE REFERÊNCIA DE FABRICANTE';
   formRelEstoque.QRDBText2.Enabled       := True;
   formRelEstoque.QRDBText5.Enabled       := True;
   formRelEstoque.QRDBText6.Enabled       := True;
   formRelEstoque.QRDBText7.Enabled       := True;
   formRelEstoque.QRExpr2.Enabled         := True;
   formRelEstoque.QRExpr1.Enabled         := True;
   formRelEstoqueFuturo.QRDBText2.Enabled := True;
   formRelEstoqueFuturo.QRDBText5.Enabled := True;
   formRelEstoqueFuturo.QRExpr1.Enabled   := True;
   formRelEstoqueFuturo.QRExpr2.Enabled   := True;
   formRelEstoqueFuturo.QRExpr3.Enabled   := True;
   formRelEstoqueFuturo.QRExpr4.Enabled   := True;
  if ckbSemValor.Checked = True then
    begin
      formRelEstoque.QRDBText2.Enabled       := False;
      formRelEstoque.QRDBText5.Enabled       := False;
      formRelEstoque.QRDBText6.Enabled       := False;
      formRelEstoque.QRDBText7.Enabled       := False;
      formRelEstoque.QRExpr2.Enabled         := False;
      formRelEstoque.QRExpr1.Enabled         := False;
      formRelEstoqueFuturo.QRDBText2.Enabled := False;
      formRelEstoqueFuturo.QRDBText5.Enabled := False;
      formRelEstoqueFuturo.QRExpr1.Enabled   := False;
      formRelEstoqueFuturo.QRExpr2.Enabled   := False;
      formRelEstoqueFuturo.QRExpr3.Enabled   := False;
      formRelEstoqueFuturo.QRExpr4.Enabled   := False;
    end;
   if ckbEstoqueFuturo.Checked = False then
    begin
      formRelEstoque.qrpEstoque.Preview;
    end
   else
    begin
      formRelEstoqueFuturo.qrpEstoqueFuturo.Preview;
    end;
   dmBaseDados.tblProdutos.IndexName := '';
   dmBaseDados.tblProdutos.Close;
   dmBaseDados.tblFamilias.Close;
end;

procedure TformEmEstoqueRefFab.bbtCancelarClick(Sender: TObject);
begin
   dmBaseDados .tblProdutos.Open;
   dmBaseDados.tblProdutos.IndexName := 'IndReferencia';
   formRelProdutos.lblOrdem.Caption  := 'ORDEM DE REFERÊNCIA DE FABRICANTE';
if ckbValorFuturo.Checked = False then
  begin
   formRelProdutos.rptProdutos.Preview;
  end
else
  begin
  formRelProdutosFututo.lblOrdem.Caption  := 'ORDEM DE REFERÊNCIA DE FABRICANTE';
  formRelProdutosFututo.rptProdutosFuturo.Preview;
  end;
   dmBaseDados.tblProdutos.IndexName := '';
   dmBaseDados.tblProdutos.Close;
   dmBaseDados.tblFamilias.Close;
end;

procedure TformEmEstoqueRefFab.FormShow(Sender: TObject);
begin
ckbValorFuturo.Checked   := False;
ckbEstoqueFuturo.Checked := False;
ckbSemValor.Checked      := False;
end;

end.
