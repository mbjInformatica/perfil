unit EmEstoqueDesc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEmEstoqueDesc = class(TForm)
    lblEstoque   : TLabel;
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    ckbValorFuturo: TCheckBox;
    ckbEstoqueFuturo: TCheckBox;
    ckbSemValor: TCheckBox;
    rbdICMS: TRadioButton;
    rbdSemICMS: TRadioButton;
    rbdTodos: TRadioButton;
    procedure bbtConfirmarClick(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbdICMSClick(Sender: TObject);
    procedure rbdSemICMSClick(Sender: TObject);
    procedure rbdTodosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEmEstoqueDesc: TformEmEstoqueDesc;

implementation

uses ModuloDados, RelEstoque, RelProdutos, RelProdutosFuturo,
  RelEstoqueFuturo;

{$R *.DFM}

procedure TformEmEstoqueDesc.bbtConfirmarClick(Sender: TObject);
begin
    dmBaseDados .tblProdutos.Open;
    dmBaseDados.tblProdutos.IndexName    := 'IndDescricao';
    formRelEstoque.qrlTipo.Caption       := 'ORDEM DE DESCRI플O';
    formRelEstoqueFuturo.qrlTipo.Caption := 'ORDEM DE DESCRI플O';
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
       if rbdICMS.Checked = true then
         begin
            dmBaseDados.tblProdutos.Filter := '('+'Icms >'+ QuotedStr('0')+')';
            dmBaseDados.tblProdutos.Filtered := true;
         end;
       if rbdSemICMS.Checked = true then
         begin
           dmBaseDados.tblProdutos.Filter := '('+'Icms <='+ QuotedStr('0')+')';
           dmBaseDados.tblProdutos.Filtered := true;
         end;
      formRelEstoque.qrpEstoque.Preview;
      dmBaseDados.tblProdutos.Filter := '';
      dmBaseDados.tblProdutos.Filtered := False;
    end
   else
    begin
       if rbdICMS.Checked = true then
         begin
            dmBaseDados.tblProdutos.Filter := '('+'Icms >'+ QuotedStr('0')+')';
            dmBaseDados.tblProdutos.Filtered := true;
         end;
       if rbdSemICMS.Checked = true then
         begin
           dmBaseDados.tblProdutos.Filter := '('+'Icms <='+ QuotedStr('0')+')';
           dmBaseDados.tblProdutos.Filtered := true;
         end;
      formRelEstoqueFuturo.qrpEstoqueFuturo.Preview;
      dmBaseDados.tblProdutos.Filter := '';
      dmBaseDados.tblProdutos.Filtered := False;
    end;
    dmBaseDados.tblProdutos.IndexName := '';
    dmBaseDados.tblProdutos.Close;
    dmBaseDados.tblFamilias.Close;
end;

procedure TformEmEstoqueDesc.bbtCancelarClick(Sender: TObject);
begin
    dmBaseDados.tblProdutos.Open;
    dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
    formRelProdutos.lblOrdem.Caption  := 'ORDEM DE DESCRI플O';
if ckbValorFuturo.Checked = False then
  begin
       if rbdICMS.Checked = true then
         begin
            dmBaseDados.tblProdutos.Filter := '('+'Icms >'+ QuotedStr('0')+')';
            dmBaseDados.tblProdutos.Filtered := true;
         end;
       if rbdSemICMS.Checked = true then
         begin
           dmBaseDados.tblProdutos.Filter := '('+'Icms <='+ QuotedStr('0')+')';
           dmBaseDados.tblProdutos.Filtered := true;
         end;
   formRelProdutos.rptProdutos.Preview;
   dmBaseDados.tblProdutos.Filter := '';
   dmBaseDados.tblProdutos.Filtered := False;
  end
else
  begin
  formRelProdutosFututo.lblOrdem.Caption  := 'ORDEM DE DESCRI플O';
       if rbdICMS.Checked = true then
         begin
            dmBaseDados.tblProdutos.Filter := '('+'Icms >'+ QuotedStr('0')+')';
            dmBaseDados.tblProdutos.Filtered := true;
         end;
       if rbdSemICMS.Checked = true then
         begin
           dmBaseDados.tblProdutos.Filter := '('+'Icms <='+ QuotedStr('0')+')';
           dmBaseDados.tblProdutos.Filtered := true;
         end;
  formRelProdutosFututo.rptProdutosFuturo.Preview;
  dmBaseDados.tblProdutos.Filter := '';
  dmBaseDados.tblProdutos.Filtered := False;
  end;
    dmBaseDados.tblProdutos.IndexName := '';
    dmBaseDados.tblProdutos.Close;
    dmBaseDados.tblFamilias.Close;
end;

procedure TformEmEstoqueDesc.FormShow(Sender: TObject);
begin
ckbValorFuturo.Checked   := False;
ckbEstoqueFuturo.Checked := False;
ckbSemValor.Checked      := False;

end;

procedure TformEmEstoqueDesc.rbdICMSClick(Sender: TObject);
begin
rbdSemICMS.Checked := False;
rbdTodos.Checked   := False;
end;

procedure TformEmEstoqueDesc.rbdSemICMSClick(Sender: TObject);
begin
rbdICMS.Checked := False;
rbdTodos.Checked:= False;
end;

procedure TformEmEstoqueDesc.rbdTodosClick(Sender: TObject);
begin
rbdICMS.Checked    := False;
rbdSemICMS.Checked := False;
end;

procedure TformEmEstoqueDesc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
rbdTodos.Checked := true;
rbdICMS.Checked := False;
rbdSemICMS.Checked := False;
end;

end.
