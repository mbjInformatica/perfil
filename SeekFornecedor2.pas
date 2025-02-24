unit SeekFornecedor2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Grids, DBGrids, DBCtrls, TISButton,
  TIGradient;

type
  TformSeekFornecedor2 = class(TForm)
    DBGrid1: TDBGrid;
    Label4: TLabel;
    edtFiltroFornec: TEdit;
    btnOK: TTISButton;
    btnCancelar: TTISButton;
    TIGradient1: TTIGradient;
    procedure FormShow(Sender: TObject);
    procedure edtFiltroFornecChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  formSeekFornecedor2: TformSeekFornecedor2;

implementation

uses ModuloDados, db, Fornecedor,RotinasGerais;


{$R *.dfm}


procedure TformSeekFornecedor2.FormShow(Sender: TObject);
begin
edtFiltroFornec.Text := '';
edtFiltroFornec.SetFocus;
end;

procedure TformSeekFornecedor2.edtFiltroFornecChange(Sender: TObject);
begin
dmBaseDados.tblFornecedores.IndexName:= 'IndFornecedor';
dmBaseDados.tblFornecedores.FindNearest([edtFiltroFornec.Text]);
end;

end.
