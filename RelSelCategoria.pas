unit RelSelCategoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls;

type
  TformSelCategoria = class(TForm)
    dbcCategoria : TDBLookupComboBox;
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    ckbEstoque   : TCheckBox;
    ckbValorFuturo: TCheckBox;
    ckbEstoqueFuturo: TCheckBox;
    ckbSemValor: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure bbtConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelCategoria: TformSelCategoria;
  fltCategoria: String;
implementation

uses ModuloDados, RelClientes, RelProdutos, RelEstoque, RelProdutosFuturo,
  RelEstoqueFuturo;

{$R *.DFM}


procedure TformSelCategoria.FormShow(Sender: TObject);
begin
      dmBaseDados.tblCategoria.Open;
      dmBaseDados.tblCategoria.First;
      ckbEstoque.Checked       := False;
      ckbEstoqueFuturo.Checked := False;
      ckbValorFuturo.Checked   := False;
      ckbSemValor.Checked      := False;
end;

procedure TformSelCategoria.bbtConfirmarClick(Sender: TObject);
begin
  if ckbEstoque.Checked = False then
    begin
      fltCategoria:=dmBaseDados.tblCategoriaCodigoCategoria.AsString;
      dmBaseDados.tblProdutos.Open;
      dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
//      formRelProdutos.lblOrdem.Caption  := 'ORDEM DE CATEGORIA';
      dmBaseDados.tblProdutos.Filter    := 'CodigoCategoria ='+fltCategoria;
      dmBaseDados.tblProdutos.Filtered  := True;
      formRelProdutos.lblOrdem.Caption  := dmBaseDados.tblCategoriaDescricaoCategoria.AsString;
        if ckbValorFuturo.Checked = False then
         begin
          formRelProdutos.rptProdutos.Preview;
         end
       else
         begin
          formRelProdutosFututo.lblOrdem.Caption    := 'ORDEM DE CÓDIGO';
          formRelProdutosFututo.rptProdutosFuturo.Preview;
         end;
      dmBaseDados.tblProdutos.IndexName := '';
      dmBaseDados.tblProdutos.Filter    := '';
      dmBaseDados.tblProdutos.Filtered  := False;
      dmBaseDados.tblProdutos.Close;
    end
  else
    begin
        fltCategoria:=dmBaseDados.tblCategoriaCodigoCategoria.AsString;
        dmBaseDados.tblProdutos.Open;
        dmBaseDados.tblProdutos.IndexName    := 'IndDescricao';
        dmBaseDados.tblProdutos.Filter       := 'CodigoCategoria ='+fltCategoria;
        dmBaseDados.tblProdutos.Filtered     := True;
        formRelEstoque.qrlTipo.Caption       := dmBaseDados.tblCategoriaDescricaoCategoria.AsString;
        formRelEstoqueFuturo.qrlTipo.Caption := dmBaseDados.tblCategoriaDescricaoCategoria.AsString;

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
        dmBaseDados.tblProdutos.Filter    := '';
        dmBaseDados.tblProdutos.Filtered  := False;
        dmBaseDados.tblProdutos.Close;

    end;
end;

procedure TformSelCategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmBaseDados.tblCategoria.Close;
end;

procedure TformSelCategoria.bbtCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
