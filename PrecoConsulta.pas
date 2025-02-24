unit PrecoConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DBCtrls, Buttons, TIGradient;

type
  TformPrecoConsulta = class(TForm)
    dbgProdutos: TDBGrid;
    edtPesquisa: TEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Label1: TLabel;
    btnRetornar: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnLimpar: TButton;
    TIGradient1: TTIGradient;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure dbgProdutosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrecoConsulta: TformPrecoConsulta;

implementation
 uses ModuloDados;

{$R *.dfm}

procedure TformPrecoConsulta.FormShow(Sender: TObject);
begin
edtPesquisa.SetFocus;
edtPesquisa.Text := '';
dmBaseDados.tblProdutos.Open;
dmBaseDados.tblProdutos.IndexName := 'IndDescricao';
end;

procedure TformPrecoConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblProdutos.IndexName := '';
dmBaseDados.tblProdutos.Close;
end;

procedure TformPrecoConsulta.edtPesquisaChange(Sender: TObject);
begin
btnLimpar.Default := True;
dmBaseDados.tblProdutos.IndexName:= 'IndDescriAbreviada';
dmBaseDados.tblProdutos.FindNearest([edtPesquisa.Text]);
end;

procedure TformPrecoConsulta.btnRetornarClick(Sender: TObject);
begin
close;
end;

procedure TformPrecoConsulta.btnLimparClick(Sender: TObject);
begin
edtPesquisa.Text := '';
end;

procedure TformPrecoConsulta.dbgProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
 begin
  edtPesquisa.SetFocus;
 end;
end;

end.
