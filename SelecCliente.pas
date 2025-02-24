unit SelecCliente;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, StdCtrls, Buttons, Grids, DBGrids,
     DB, DBCtrls, TISButton, TIGradient, TIGradientCaption;

type
  TformSelecCliente = class(TForm)
    DBGrid1: TDBGrid;
    edtPesquisa: TEdit;
    DBText1: TDBText;
    TIGradient1: TTIGradient;
    bbtVisualizar: TTISButton;
    TIGradientCaption1: TTIGradientCaption;
    procedure FormShow(Sender: TObject);
    procedure bbtSairClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure bbtVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formSelecCliente: TformSelecCliente;

implementation

uses ModuloDados;


{$R *.dfm}


procedure TformSelecCliente.FormShow(Sender: TObject);
begin
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.IndexName := 'IndCliente';
edtPesquisa.Clear;
edtPesquisa.SetFocus;
end;

procedure TformSelecCliente.bbtSairClick(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName := '';
Close;
end;

procedure TformSelecCliente.edtPesquisaChange(Sender: TObject);
begin
dmBaseDados.tblClientes.Locate('NomeCliente',edtPesquisa.Text,[loPartialKey]);
end;

procedure TformSelecCliente.bbtVisualizarClick(Sender: TObject);
begin
dmBaseDados.tblClientes.IndexName := '';
Close;
end;

end.
