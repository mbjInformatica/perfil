unit RelSelFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TformSelFamilia = class(TForm)
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    dbcFamilia   : TDBLookupComboBox;
    ckbEstoque   : TCheckBox;
    ckbValorFuturo: TCheckBox;
    ckbEstoqueFuturo: TCheckBox;
    ckbSemValor: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtConfirmarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelFamilia: TformSelFamilia;

implementation

uses
        ModuloDados,MenuPrincipal,Funcionarios,RotinasGerais,RelProdutos,
  RelClientes, RelEstoque, RelProdutosFuturo, RelEstoqueFuturo;

{$R *.DFM}

procedure TformSelFamilia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        dmBaseDados.tblFamilias.Close;
end;

procedure TformSelFamilia.bbtConfirmarClick(Sender: TObject);
begin

    if ckbEstoque.Checked = False then
      begin
        fltFamilia:=dmBaseDados.tblFamiliasCodigoFamilia.AsString;
        dmBaseDados.tblProdutos.Open;
        dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
//        formRelProdutos.lblOrdem.Caption  := 'ORDEM DE FAMÍLIA';
        dmBaseDados.tblProdutos.Filter    := 'CodigoFamilia = '+fltFamilia;
        dmBaseDados.tblProdutos.Filtered  := True;
        formRelProdutos.lblOrdem.Caption  := dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
           if ckbValorFuturo.Checked = False then
              begin
                if ckbSemValor.Checked = true then
                    begin

                      formRelProdutos.qrdbPun7D.Enabled := false;
                      formRelProdutos.qrePcx7D.Enabled := false;
                      formRelProdutos.qrePcx14D.Enabled := false;
                      formRelProdutos.qrePun14D.Enabled := false;
                      formRelProdutos.qrePcx21D.Enabled := false;
                      formRelProdutos.qrePun21D.Enabled := false;
                    end;
                formRelProdutos.rptProdutos.Preview;
              end
           else
              begin
               formRelProdutosFututo.lblOrdem.Caption    := 'ORDEM DE CÓDIGO';
               if ckbSemValor.Checked = true then
                    begin

                      formRelProdutosFututo.qrdbPun7D.Enabled := false;
                      formRelProdutosFututo.qrePcx7D.Enabled := false;
                      formRelProdutosFututo.qrePcx14D.Enabled := false;
                      formRelProdutosFututo.qrePun14D.Enabled := false;
                      formRelProdutosFututo.qrePcx21D.Enabled := false;
                      formRelProdutosFututo.qrePun21D.Enabled := false;
                    end;
               formRelProdutosFututo.rptProdutosFuturo.Preview;
              end;
        dmBaseDados.tblProdutos.IndexName := '';
        dmBaseDados.tblProdutos.Filter    := '';
        dmBaseDados.tblProdutos.Filtered  := False;
        dmBaseDados.tblProdutos.Close;
        dmBaseDados.tblFamilias.Close;
      end
    else
      begin
        fltFamilia :=dmBaseDados.tblFamiliasCodigoFamilia.AsString;
        dmBaseDados.tblProdutos.Open;
        dmBaseDados.tblProdutos.IndexName    := 'IndDescricao';
        dmBaseDados.tblProdutos.Filter       := 'CodigoFamilia = '+fltFamilia;
        dmBaseDados.tblProdutos.Filtered     := True;
        formRelEstoque.qrlTipo.Caption       :=  dmBaseDados.tblFamiliasDescricaoFamilia.AsString;
        formRelEstoqueFuturo.qrlTipo.Caption :=  dmBaseDados.tblFamiliasDescricaoFamilia.AsString;

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
        dmBaseDados.tblFamilias.Close;
      end;
end;

procedure TformSelFamilia.bbtCancelarClick(Sender: TObject);
begin
        //formRelProdutos.Close;
        Close;
end;

procedure TformSelFamilia.FormShow(Sender: TObject);
begin
        dmBaseDados.tblFamilias.Open;
        dmBasedados.tblFamilias.First;
      ckbEstoque.Checked       := False;
      ckbEstoqueFuturo.Checked := False;
      ckbValorFuturo.Checked   := False;
      ckbSemValor.Checked      := False;
end;

end.
