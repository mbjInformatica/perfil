unit MarcasProdutos;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, Buttons,DBCtrls, Grids, DBGrids, db;

type
  TformMarcas = class(TForm)
    grdMarcas    : TDBGrid;
    btnPrimeiro  : TSpeedButton;
    btnAnterior  : TSpeedButton;
    btnProximo   : TSpeedButton;
    btnUltimo    : TSpeedButton;
    btnLocalizar : TSpeedButton;
    btnExcluir   : TSpeedButton;
    btnAdicionar : TSpeedButton;
    btnRetornar  : TSpeedButton;
    btnGravar: TSpeedButton;
    //procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formMarcas: TformMarcas;

implementation

uses ModuloDados, SeekMarcas, RotinasGerais;


{$R *.DFM}


procedure TformMarcas.FormShow(Sender: TObject);
begin
dmBaseDados.tblMarcas.Open;
dmBaseDados.tblMarcas.IndexName := 'IndCodMarca';
end;

procedure TformMarcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblMarcas.Close;
end;

procedure TformMarcas.btnPrimeiroClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.First;
end;

procedure TformMarcas.btnAnteriorClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.Prior;
if (dmBaseDados.tblMarcas.Bof) then
 begin
  InicioTabela;
  dmBaseDados.tblMarcas.First;
 end;
end;

procedure TformMarcas.btnProximoClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.Next;
if (dmBaseDados.tblMarcas.Eof) then
 begin
  FimTabela;
  dmBaseDados.tblMarcas.Last;
 end;
end;

procedure TformMarcas.btnUltimoClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.Last;
end;

procedure TformMarcas.btnLocalizarClick(Sender: TObject);
begin
formSeekMarca.ShowModal;
end;

procedure TformMarcas.btnExcluirClick(Sender: TObject);
begin
dmBaseDados.tblMarcas.Delete;
end;

procedure TformMarcas.btnAdicionarClick(Sender: TObject);
var strCodigoMarca : Integer;
    strCodigo      : String;
begin
strCodigoMarca := 0;
strCodigo      := '';
dmBaseDados.tblMarcas.Last;
strCodigoMarca := (StrToInt(dmBaseDados.tblMarcasCodigoMarca.AsString))+1;
strCodigo      := (FormatFloat('000',strCodigoMarca));
dmBaseDados.tblMarcas.Append;
dmBaseDados.tblMarcasCodigoMarca.AsString := strCodigo;
grdMarcas.SelectedField := dmBaseDados.tblMarcasMarca;
end;

procedure TformMarcas.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformMarcas.btnGravarClick(Sender: TObject);
begin
if( (dmBaseDados.tblMarcas.State = dsEdit)or(dmBaseDados.tblMarcas.State = dsInsert) )then
 begin
  dmBaseDados.tblMarcas.Post;
 end;
end;

end.
