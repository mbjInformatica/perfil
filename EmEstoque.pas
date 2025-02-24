unit EmEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEmEstoque = class(TForm)
    lblEstoque   : TLabel;
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    ckbValorFuturo: TCheckBox;
    ckbEstoqueFuturo: TCheckBox;
    ckbSemValor: TCheckBox;
    procedure bbtCancelarClick(Sender: TObject);
    procedure bbtConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEmEstoque: TformEmEstoque;

implementation

uses ModuloDados, RelProdutos, RelEstoque, RelProdutosFuturo,
  RelEstoqueFuturo;

{$R *.DFM}

procedure TformEmEstoque.bbtCancelarClick(Sender: TObject);
begin
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblMarcas.Open;
   dmBaseDados.tblMarcas.MasterSource  := dmBaseDados.dsProdutos;
   dmBaseDados.tblMarcas.MasterFields  := 'CodigoMarca';
   formRelProdutos.lblOrdem.Caption    := 'ORDEM DE CÓDIGO';
   if ckbSemValor.Checked = True then
    begin
    end;
 if ckbValorFuturo.Checked = False then
  begin
   formRelProdutos.rptProdutos.Preview;
  end
 else
  begin
   formRelProdutosFututo.lblOrdem.Caption    := 'ORDEM DE CÓDIGO';
   formRelProdutosFututo.rptProdutosFuturo.Preview;
  end;
   dmBaseDados.tblProdutos.IndexName   := '';
   dmBaseDados.tblMarcas.MasterFields  := '';
   dmBaseDados.tblMarcas.MasterSource  := nil;
   dmBaseDados.tblMarcas.Open;
   dmBaseDados.tblProdutos.Close;
end;

procedure TformEmEstoque.bbtConfirmarClick(Sender: TObject);
begin
   dmBaseDados.tblProdutos.Open;
   dmBaseDados.tblMarcas.Open;
   dmBaseDados.tblMarcas.MasterSource     := dmBaseDados.dsProdutos;
   dmBaseDados.tblMarcas.MasterFields     := 'CodigoMarca';
   formRelEstoque.qrlTipo.Caption         := 'ORDEM DE CÓDIGO';
   formRelEstoqueFuturo.qrlTipo.Caption   := 'ORDEM DE CÓDIGO';
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
   dmBaseDados.tblProdutos.IndexName  := '';
   dmBaseDados.tblMarcas.MasterFields := '';
   dmBaseDados.tblMarcas.MasterSource := nil;
   dmBaseDados.tblMarcas.Open;
   dmBaseDados.tblProdutos.Close;
end;

procedure TformEmEstoque.FormShow(Sender: TObject);
begin
ckbValorFuturo.Checked   := False;
ckbEstoqueFuturo.Checked := False;
ckbSemValor.Checked      := False;
end;

end.
