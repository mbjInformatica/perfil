unit DadosProdutosNFe;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, Grids, DBGrids, TIGradient, StdCtrls, Buttons,
  TISButton;

type
  TformDadosProdutosNFe = class(TForm)
    TIGradient1: TTIGradient;
    DBGrid1: TDBGrid;
    btnGrava: TTISButton;
    btnRetornar: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravaClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formDadosProdutosNFe: TformDadosProdutosNFe;

implementation

uses ModuloDados;


{$R *.dfm}


procedure TformDadosProdutosNFe.FormShow(Sender: TObject);
begin
dmBaseDados.qryPedidos.Close;
dmBaseDados.qryPedidos.SQL.Text := 'SELECT * FROM Pedidos WHERE NPedido = "'+dmBaseDados.tblANotaFiscalPedido.AsString+'"';
dmBaseDados.qryPedidos.Open;
end;

procedure TformDadosProdutosNFe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.qryPedidos.Close;
end;

procedure TformDadosProdutosNFe.btnGravaClick(Sender: TObject);
begin
dmBaseDados.qryPedidos.Post;
Close;
end;

procedure TformDadosProdutosNFe.btnRetornarClick(Sender: TObject);
begin
Close;
end;

end.
