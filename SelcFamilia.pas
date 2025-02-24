unit SelcFamilia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons;

type
  TformSelecFamilia = class(TForm)
    bbtConfirmar : TBitBtn;
    bbtCancelar  : TBitBtn;
    dbcFamilia   : TDBLookupComboBox;
    ckbTodas: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtCancelarClick(Sender: TObject);
    procedure bbtConfirmarClick(Sender: TObject);
    procedure ckbTodasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelecFamilia: TformSelecFamilia;
  fltFamilia      : String;
implementation

uses ModuloDados, RelProdutos, RelEstoque;

{$R *.DFM}

procedure TformSelecFamilia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBaseDados.tblFamilias.Close;
  Close;

end;

procedure TformSelecFamilia.FormShow(Sender: TObject);
begin
    dmBaseDados.tblFamilias.Open;
    dmBasedados.tblFamilias.First;
end;

procedure TformSelecFamilia.bbtCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TformSelecFamilia.bbtConfirmarClick(Sender: TObject);
begin
  if ckbTodas.Checked = False then
   begin
     fltFamilia :=dmBaseDados.tblFamiliasCodigoFamilia.AsString;
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
     dmBaseDados.tblProdutos.Filter    := 'CodigoFamilia = '+fltFamilia;
     dmBaseDados.tblProdutos.Filtered  := True;
     formRelEstoque.qrpEstoque.Preview;
     dmBaseDados.tblProdutos.IndexName := '';
     dmBaseDados.tblProdutos.Filter    := '';
     dmBaseDados.tblProdutos.Filtered  := False;
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblFamilias.Close;
   end
  else
   begin
     dmBaseDados.tblProdutos.Open;
     dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
     formRelEstoque.qrpEstoque.Preview;
     dmBaseDados.tblProdutos.IndexName := '';
     dmBaseDados.tblProdutos.Close;
     dmBaseDados.tblFamilias.Close;
   end;
end;
procedure TformSelecFamilia.ckbTodasClick(Sender: TObject);
begin
  if ckbTodas.Checked = True then
   begin
    dbcFamilia.Enabled := False;
   end
  else
   begin
    dbcFamilia.Enabled := True;
  end;  
   end;
end.




