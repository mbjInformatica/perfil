unit CadEntregas;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
     Controls, Dialogs, TISButton, TIGradient, Grids, DBGrids, db;

type
  TformCadEntregas = class(TForm)
    dbgEntregas: TDBGrid;
    TIGradient1: TTIGradient;
    btnPrimeiro: TTISButton;
    btnAnterior: TTISButton;
    btnProximo: TTISButton;
    btnUltimo: TTISButton;
    btnGravar: TTISButton;
    btnExcluir: TTISButton;
    btnAdicionar: TTISButton;
    btnRetornar: TTISButton;
    btnLocalizar: TTISButton;
    btnRetorno: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnRetornoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formCadEntregas: TformCadEntregas;

implementation

uses ModuloDados;


{$R *.dfm}


procedure TformCadEntregas.FormShow(Sender: TObject);
begin
dmBaseDados.tblEntregas.Open;
dmBaseDados.tblEntregas.Refresh;
dmBaseDados.tblEntregas.Last;
dbgEntregas.ReadOnly := True;
end;

procedure TformCadEntregas.btnPrimeiroClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.First;
end;

procedure TformCadEntregas.btnAnteriorClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.Prior;
end;

procedure TformCadEntregas.btnProximoClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.Next;
end;

procedure TformCadEntregas.btnUltimoClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.Last;
end;

procedure TformCadEntregas.btnGravarClick(Sender: TObject);
begin
if( (dmBaseDados.tblEntregas.State = dsEdit)or(dmBaseDados.tblEntregas.State = dsInsert) )then
 begin
  dmBaseDados.tblEntregas.Post;
  dbgEntregas.ReadOnly := True;
 end;
end;

procedure TformCadEntregas.btnLocalizarClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.Edit;
dbgEntregas.ReadOnly := False;
end;

procedure TformCadEntregas.btnExcluirClick(Sender: TObject);
begin
if (Application.MessageBox('Deseja excluir este registro?','Confirma?',MB_YESNO) = IDYES) then
 begin
  dmBaseDados.tblEntregas.Delete;
 end;
end;

procedure TformCadEntregas.btnAdicionarClick(Sender: TObject);
begin
dmBaseDados.tblEntregas.Append;
dmBaseDados.tblEntregasSaida.AsDateTime := Time;
dmBaseDados.tblEntregasData.AsDateTime  := Date;
dbgEntregas.ReadOnly := False;
dbgEntregas.SetFocus;
end;

procedure TformCadEntregas.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformCadEntregas.btnRetornoClick(Sender: TObject);
begin
if (Application.MessageBox('Deseja gravar retorno?','Confirma?',MB_YESNO) = IDYES) then
 begin
  dmBaseDados.tblEntregas.Edit;
  dmBaseDados.tblEntregasRetorno.AsDateTime := Time;
  dmBaseDados.tblEntregas.Post;
 end;
end;

end.
