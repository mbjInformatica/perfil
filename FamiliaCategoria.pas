unit FamiliaCategoria;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, db;

type
  TformFamiliaCategoria = class(TForm)
    grpFamilias   : TGroupBox;
    grpCategorias : TGroupBox;
    grdFamilias   : TDBGrid;
    grdCategorias : TDBGrid;
    btnPrimeiro1  : TSpeedButton;
    btnAnterior1  : TSpeedButton;
    btnProximo1   : TSpeedButton;
    btnUltimo1    : TSpeedButton;
    btnLocalizar1 : TSpeedButton;
    btnExcluir1   : TSpeedButton;
    btnAdicionar1 : TSpeedButton;
    btnPrimeiro2  : TSpeedButton;
    btnAnterior2  : TSpeedButton;
    btnProximo2   : TSpeedButton;
    btnUltimo2    : TSpeedButton;
    btnLocalizar2 : TSpeedButton;
    btnExcluir2   : TSpeedButton;
    btnGravar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnAdicionar: TSpeedButton;
    btnRetornar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiro1Click(Sender: TObject);
    procedure btnAnterior1Click(Sender: TObject);
    procedure btnProximo1Click(Sender: TObject);
    procedure btnUltimo1Click(Sender: TObject);
    procedure btnLocalizar1Click(Sender: TObject);
    procedure btnExcluir1Click(Sender: TObject);
    procedure btnAdicionar1Click(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formFamiliaCategoria: TformFamiliaCategoria;

implementation

uses ModuloDados, RotinasGerais, SeekCategorias, SeekFamilia, MenuPrincipal;


{$R *.DFM}


procedure TformFamiliaCategoria.FormShow(Sender: TObject);
begin
dmBaseDados.tblFamilias.Open;
dmBaseDados.tblCategoria.Open;
dmBaseDados.tblFamilias.IndexName  := '';
dmBaseDados.tblCategoria.IndexName := 'CodigoCategoria';
end;

procedure TformFamiliaCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblFamilias.IndexName  := '';
dmBaseDados.tblCategoria.IndexName := '';
dmBaseDados.tblFamilias.Close;
dmBaseDados.tblCategoria.Close;
end;

procedure TformFamiliaCategoria.btnPrimeiro1Click(Sender: TObject);
begin
if (Sender = btnPrimeiro1) then
 begin
  dmBaseDados.tblFamilias.First;
  grdFamilias.SetFocus;
 end
else
 begin
  dmBaseDados.tblCategoria.First;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnAnterior1Click(Sender: TObject);
begin
if (Sender = btnAnterior1) then
 begin
  dmBaseDados.tblFamilias.Prior;
  if (dmBaseDados.tblFamilias.Bof) then
   begin
    InicioTabela;
    dmBaseDados.tblFamilias.First;
   end;
  grdFamilias.SetFocus;
 end
else
 begin
  dmBaseDados.tblCategoria.Prior;
  if (dmBaseDados.tblCategoria.Bof) then
   begin
    InicioTabela;
    dmBaseDados.tblCategoria.First;
   end;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnProximo1Click(Sender: TObject);
begin
if (Sender = btnProximo1) then
 begin
  dmBaseDados.tblFamilias.Next;
  if (dmBaseDados.tblFamilias.Eof) then
   begin
    FimTabela;
    dmBaseDados.tblFamilias.Last;
   end;
  grdFamilias.SetFocus;
 end
else
 begin
  dmBaseDados.tblCategoria.Next;
  if (dmBaseDados.tblCategoria.Eof) then
   begin
    FimTabela;
    dmBaseDados.tblCategoria.Last;
   end;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnUltimo1Click(Sender: TObject);
begin
if (Sender = btnUltimo1) then
 begin
  dmBaseDados.tblFamilias.Last;
  grdFamilias.SetFocus;
 end
else
 begin
  dmBaseDados.tblCategoria.Last;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnLocalizar1Click(Sender: TObject);
begin
if (Sender = btnLocalizar1) then
 begin
  formSeekFamilia.ShowModal;
  grdFamilias.SetFocus;
 end
else
 begin
  formSeekCategoria.ShowModal;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnExcluir1Click(Sender: TObject);
begin
if (Sender = btnExcluir1) then
 begin
  dmBaseDados.tblFamilias.Delete;
  grdFamilias.SetFocus;
 end
else
 begin
  dmBaseDados.tblCategoria.Delete;
  grdCategorias.SetFocus;
 end;
end;

procedure TformFamiliaCategoria.btnAdicionar1Click(Sender: TObject);
var strCodigoFamilia : Integer;
    strCodigo        : String;
begin
strCodigoFamilia := 0;
strCodigo        := '';
dmBaseDados.tblFamilias.Last;
strCodigoFamilia := (StrToInt(dmBaseDados.tblFamiliasCodigoFamilia.AsString))+1;
strCodigo        := (FormatFloat('000',strCodigoFamilia));
dmBaseDados.tblFamilias.Append;
dmBaseDados.tblFamiliasCodigoFamilia.AsString := strCodigo;
grdFamilias.SelectedField := dmBaseDados.tblFamiliasDescricaoFamilia;
end;

procedure TformFamiliaCategoria.btnRetornarClick(Sender: TObject);
begin
Close;
end;

procedure TformFamiliaCategoria.btnGravarClick(Sender: TObject);
begin
if( (dmBaseDados.tblFamilias.State = dsEdit)or(dmBaseDados.tblFamilias.State = dsInsert) )then
 begin
  dmBaseDados.tblFamilias.Post;
 end;
end;

procedure TformFamiliaCategoria.SpeedButton1Click(Sender: TObject);
begin
if( (dmBaseDados.tblCategoria.State = dsEdit)or(dmBaseDados.tblCategoria.State = dsInsert) )then
 begin
  dmBaseDados.tblCategoria.Post;
 end;
end;

procedure TformFamiliaCategoria.btnAdicionarClick(Sender: TObject);
var strCodigoCategoria : Integer;
    strCodigo        : String;
begin
strCodigoCategoria := 0;
strCodigo          := '';
dmBaseDados.tblCategoria.Last;
strCodigoCategoria := (StrToInt(dmBaseDados.tblCategoriaCodigoCategoria.AsString))+1;
strCodigo          := (FormatFloat('000',strCodigoCategoria));
dmBaseDados.tblCategoria.Append;
dmBaseDados.tblCategoriaCodigoCategoria.AsString := strCodigo;
grdCategorias.SelectedField := dmBaseDados.tblCategoriaDescricaoCategoria;
end;

end.
