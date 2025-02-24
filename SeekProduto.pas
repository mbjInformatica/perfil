unit SeekProduto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DB, DBCtrls, Grids, DBGrids, DBTables;

type
  TformSeekProduto = class(TForm)
    lblMensagem  : TLabel;
    mskCodigo    : TMaskEdit;
    btnOK        : TBitBtn;
    btnCancela   : TBitBtn;
    edtCodBarra: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    edtMemo: TEdit;
    Button1: TButton;
    txtRefFabricante: TDBText;
    Label5: TLabel;
    txtCodigoBarra: TDBText;
    Label7: TLabel;
    edtReferencia: TEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisaExit(Sender: TObject);
    procedure btnOKExit(Sender: TObject);
    procedure edtCodBarraChange(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure mskCodigoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSeekProduto: TformSeekProduto;

implementation

uses RotinasGerais, ModuloDados, Produtos;

{$R *.DFM}

procedure TformSeekProduto.btnOKClick(Sender: TObject);
Var
   strProduto, strCodFamilia,strCodCategoria,strCodProduto,
   strRef1,strRef2,strRef3,strRef4,strCodInterno: string;
   bmkRegistro: TBookMark;
begin
dmBaseDados.tblProdutos.Open;
bmkRegistro     := dmBaseDados.tblProdutos.GetBookMark;
strCodFamilia   := Copy(mskCodigo.Text,1,3);
strCodCategoria := Copy(mskCodigo.Text,4,3);
strCodProduto   := Copy(mskCodigo.Text,7,6);
strProduto      := strCodFamilia+strCodCategoria+strCodProduto;
StrRef1         := edtReferencia.Text;
strRef2         := edtReferencia.Text;
strRef3         := edtReferencia.Text;
strRef4         := edtReferencia.Text;
strCodInterno   := edtReferencia.Text;
if (dmBaseDados.tblProdutos.Locate('Codigo',strProduto,[LOCASEINSENSITIVE])=False) then
  begin
   if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante',strRef1,[LOCASEINSENSITIVE])=False) then
    begin
      if ((dmBaseDados.tblProdutos.Locate('CodigoBarra',edtCodBarra.Text,[LOCASEINSENSITIVE])=False)or(dmBaseDados.tblProdutosCodigoBarra.AsString = '')) then
       begin
         if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante2',strRef2,[LOCASEINSENSITIVE])=False) then
          begin
            if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante3',strRef3,[LOCASEINSENSITIVE])=False) then
             begin
               if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante4',strRef4,[LOCASEINSENSITIVE])=False) then
                begin
                 { if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante5',strRef4,[LOCASEINSENSITIVE])=False) then
                   begin
                     if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante6',strRef4,[LOCASEINSENSITIVE])=False) then
                      begin
                        if (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante7',strRef4,[LOCASEINSENSITIVE])=False) then
                         begin }
                           if (dmBaseDados.tblProdutos.Locate('CodigoInterno',strCodInterno,[LOCASEINSENSITIVE])=False) then
                            begin
                             Mensagem('Produto não cadastrado !');
                             dmBaseDados.tblProdutos.IndexName := '';
                            end;
                         end;
                      end;
                   end;
                end;
             end;
          end;
end;

procedure TformSeekProduto.FormShow(Sender: TObject);
begin
   edtPesquisa.Text := '';
   mskCodigo.text   := '';
   edtCodBarra.Text := '';
   edtReferencia.Text := '';
   edtReferencia.SetFocus;
end;

procedure TformSeekProduto.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TformSeekProduto.edtPesquisaChange(Sender: TObject);
begin
dmBaseDados.tblProdutos.IndexName:= 'IndDescriAbreviada';
dmBaseDados.tblProdutos.FindNearest([edtPesquisa.Text]);
btnOK.Default   := False;
BitBtn1.Default := True;
end;

procedure TformSeekProduto.Button1Click(Sender: TObject);
var
 achei : Integer;
begin
dmBaseDados.tblProdutos.First;
dmBaseDados.tblProdutos.Open;
achei := 0;
//achei := (pos(edtMemo.Text,FormProdutos.fldCaracteristicas.Lines.Text));
//Show
  while ((not dmBaseDados.tblProdutos.Eof ) and (achei = 0)) do
      begin
       achei := (pos(edtMemo.Text,FormProdutos.fldCaracteristicas.Lines.Text));
           if (achei <> 0 ) then
              begin
                achei:= 1;
                ShowMessage('encontrei');
                close;
              end;
           if (achei = 0) then
              begin
                dmBaseDados.tblProdutos.Next;
                 //ShowMessage('naun encontrei');

              end;



      end;



end;

procedure TformSeekProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblProdutos.IndexName:= '';

end;

procedure TformSeekProduto.edtPesquisaExit(Sender: TObject);
begin
dmBaseDados.tblProdutos.IndexName:= '';
end;

procedure TformSeekProduto.btnOKExit(Sender: TObject);
begin
//dmBaseDados.tblProdutos.IndexName:= '';
end;

procedure TformSeekProduto.edtCodBarraChange(Sender: TObject);
begin
btnOK.Default   := True;
BitBtn1.Default := False;
end;

procedure TformSeekProduto.edtReferenciaChange(Sender: TObject);
begin
btnOK.Default   := True;
BitBtn1.Default := False;
end;

procedure TformSeekProduto.mskCodigoChange(Sender: TObject);
begin
btnOK.Default   := True;
BitBtn1.Default := False;
end;

end.
