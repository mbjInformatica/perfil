unit CONSULTACODIGO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, db, TIGradient, TIGradientCaption;

type
    TformConsultaCodigo = class(TForm)
    lblMensagem : TLabel;
    mskPlaca    : TMaskEdit;
    btnOk       : TBitBtn;
    btnCancela  : TBitBtn;
    edtCodBarra: TEdit;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formConsultaCodigo : TformConsultaCodigo;

implementation

uses ModuloDados, RotinasGerais, Produtos;


{$R *.DFM}


procedure TformConsultaCodigo.btnOkClick(Sender: TObject);
var strProduto : String;
begin
strProduto := edtCodBarra.Text;
if( ((dmBaseDados.tblProdutos.Locate('CodigoBarra',strProduto,[LOCASEINSENSITIVE]) = False))
 and (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante',strProduto,[LOCASEINSENSITIVE])  = False)
 and (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante2',strProduto,[LOCASEINSENSITIVE]) = False)
 and (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante3',strProduto,[LOCASEINSENSITIVE]) = False)
 and (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante4',strProduto,[LOCASEINSENSITIVE]) = False)
 and (dmBaseDados.tblProdutos.Locate('CodigoInterno',strProduto,[LOCASEINSENSITIVE]) = False)
 and (dmBaseDados.tblProdutos.Locate('CodigoBarra',strProduto,[LOCASEINSENSITIVE]) = False) )then
  Begin
   FormProdutos.btnAlterar.Click;
   FormProdutos.fldFamilia.Enabled   := True;
   FormProdutos.fldCategoria.Enabled := True;
   dmBaseDados.tblProdutos.IndexName := '';
   dmBaseDados.tblProdutos.Append;
   dmBaseDados.tblProdutosCodigoCategoria.AsString := '001';
   FormProdutos.fldReferencia.Text   := edtCodBarra.Text;
   FormProdutos.fldReducaoIcms.Text  := '1';
  End
else
  Begin
   ShowMessage('Produto já Cadastrado! Verifique o Produto!');
   Close;
  End;
end;

procedure TformConsultaCodigo.FormShow(Sender: TObject);
begin
edtCodBarra.Text := '';
edtCodBarra.SetFocus;
end;

end.
