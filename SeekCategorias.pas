unit SeekCategorias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask;

type
  TformseekCategoria = class(TForm)
    lblMensagem  : TLabel;
    mskCategoria : TMaskEdit;
    btnOk        : TBitBtn;
    btnCancela   : TBitBtn;
    lblOu        : TLabel;
    edtFamilia   : TEdit;
    llbMensagem2 : TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formseekCategoria: TformseekCategoria;

implementation

uses ModuloDados, RotinasGerais;

{$R *.DFM}

procedure TformseekCategoria.btnOkClick(Sender: TObject);
var
   strFamilia: string[3];
begin
   //strFamilia := dmBaseDados.tblFamiliasCodigoFamilia.AsString;
   if (not dmBaseDados.tblCategoria.FindKey([mskCategoria.Text])) then
   begin
      dmBaseDados.tblCategoria.IndexName := 'IndDescricao';
      if (not dmBaseDados.tblcategoria.FindKey([edtFamilia.Text])) then
      begin
         Mensagem('Regisrtro não encontrado !');
         dmBaseDados.tblCategoria.IndexName := '';
         dmBaseDados.tblFamilias.First;
      end;
   end;
end;

procedure TformseekCategoria.FormShow(Sender: TObject);
begin
   mskCategoria.Text := '';
   edtFamilia.Text   := '';
   mskCategoria.SetFocus;
end;

end.
