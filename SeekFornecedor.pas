unit SeekFornecedor;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Mask, DB, TISButton, Grids, DBGrids, TIGradient;

type
  TformSeekFornecedor = class(TForm)
    lblCodigoFornecedor : TLabel;
    lblNomeFantasia     : TLabel;
    mskCodigoFornecedor : TMaskEdit;
    mskNomeFantasia     : TMaskEdit;
    btnOK               : TBitBtn;
    btnCancela          : TBitBtn;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    edtFiltroFornec: TEdit;
    TIGradient1: TTIGradient;
    btnPross: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure edtFiltroFornecChange(Sender: TObject);
    procedure btnProssClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formSeekFornecedor: TformSeekFornecedor;

implementation

uses ModuloDados, RotinasGerais;


{$R *.DFM}


procedure TformSeekFornecedor.FormShow(Sender: TObject);
begin
edtFiltroFornec.Clear;
edtFiltroFornec.SetFocus;
end;

procedure TformSeekFornecedor.edtFiltroFornecChange(Sender: TObject);
begin
dmBaseDados.tblFornecedores.IndexName := 'IndFornecedor';
dmBaseDados.tblFornecedores.FindNearest([edtFiltroFornec.Text]);
btnPross.Default := True;
end;

procedure TformSeekFornecedor.btnProssClick(Sender: TObject);
begin
Close;
end;

end.
