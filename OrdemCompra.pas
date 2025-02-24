unit OrdemCompra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Grids, DBGrids, DBCtrls, StdCtrls, DB;

type
  TformOrdemCompra = class(TForm)
    lblOrdemCompra : TLabel;
    fldOrdemCompra : TDBText;
    lblDataEmissao : TLabel;
    fldDataEmissao : TDBText;
    grdProdutos    : TDBGrid;
    btnNovo        : TSpeedButton;
    btnExluir      : TSpeedButton;
    btnRetornar    : TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOrdemCompra: TformOrdemCompra;

implementation

uses ModuloDados;

{$R *.DFM}

procedure TformOrdemCompra.FormShow(Sender: TObject);
Var
   wrdDia,wrdMes,wrdAno: word;
   intTamanho,intOrdemCompra: integer;
   strAno,strOrdemCompra: string;
begin
   dmBaseDados.tblOrdemCompra.Open;
   dmBaseDados.tblProdutosComprados.Open;
   DecodeDate(date,wrdAno,wrdMes,wrdDia);
   intOrdemCompra := 0;
   strAno         := IntToStr(wrdAno);
   intTamanho     := Length(strAno);
   strAno         := Copy('00'+strAno,intTamanho+1,2);
   if (dmbaseDados.tblOrdemCompra.RecordCount <> 0) then
   begin
      dmBaseDados.tblOrdemCompra.Last;
      intOrdemCompra := StrToInt(Copy(dmBaseDados.tblOrdemCompraOrdemCompra.AsString,1,5));
      if (strAno <> copy(dmBaseDados.tblOrdemCompraOrdemCompra. AsString,7,2)) then
         intOrdemCompra := 0;
      end;
      Inc(intOrdemCompra);
      strOrdemCompra := IntToStr(intOrdemCompra);
      intTamanho     := Length(strOrdemCompra);
      strOrdemCompra := Copy('00000'+strOrdemCompra,intTamanho+1,5);
      strOrdemCompra := strOrdemCompra+'/'+strAno;
      dmBaseDados.tblOrdemCompra.Append;
      dmBaseDados.tblOrdemCompraOrdemCompra.AsString   := strOrdemCompra;
      dmBaseDados.tblOrdemCompraDataEmissao.AsDateTime := Date;
      dmBaseDados.tblOrdemCompra.Post;
      dmBaseDados.tblProdutosComprados.Append;
      dmBaseDados.tblProdutosCompradosOrdemCompra.AsString := strOrdemCompra;
      dmBaseDados.tblProdutosComprados.Post;
end;

procedure TformOrdemCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmBaseDados.tblProdutosComprados.Close;
   dmBaseDados.tblOrdemCompra.Close;
end;

procedure TformOrdemCompra.btnExluirClick(Sender: TObject);
begin
   dmBaseDados.tblProdutosComprados.Delete;
end;

procedure TformOrdemCompra.btnNovoClick(Sender: TObject);
Var
   wrdDia,wrdMes,wrdAno: word;
   intTamanho,intOrdemCompra: integer;
   strAno,strOrdemCompra: string;
begin
   dmBaseDados.tblOrdemCompra.Open;
   dmBaseDados.tblProdutosComprados.Open;
   DecodeDate(date,wrdAno,wrdMes,wrdDia);
   intOrdemCompra := 0;
   strAno         := IntToStr(wrdAno);
   intTamanho     := Length(strAno);
   strAno         := Copy('00'+strAno,intTamanho+1,2);
   if (dmbaseDados.tblOrdemCompra.RecordCount <> 0) then
   begin
      dmBaseDados.tblOrdemCompra.Last;
      intOrdemCompra := StrToInt(Copy(dmBaseDados.tblOrdemCompraOrdemCompra.AsString,1,5));
      if (strAno <> copy(dmBaseDados.tblOrdemCompraOrdemCompra. AsString,7,2)) then
         intOrdemCompra := 0;
      end;
      Inc(intOrdemCompra);
      strOrdemCompra := IntToStr(intOrdemCompra);
      intTamanho     := Length(strOrdemCompra);
      strOrdemCompra := Copy('00000'+strOrdemCompra,intTamanho+1,5);
      strOrdemCompra := strOrdemCompra+'/'+strAno;
      dmBaseDados.tblOrdemCompra.Append;
      dmBaseDados.tblOrdemCompraOrdemCompra.AsString   := strOrdemCompra;
      dmBaseDados.tblOrdemCompraDataEmissao.AsDateTime := Date;
      dmBaseDados.tblOrdemCompra.Post;
      dmBaseDados.tblProdutosComprados.Append;
      dmBaseDados.tblProdutosCompradosOrdemCompra.AsString := strOrdemCompra;
      dmBaseDados.tblProdutosComprados.Post;
end;

procedure TformOrdemCompra.btnRetornarClick(Sender: TObject);
begin
   if ((dmBaseDados.tblProdutosComprados.State = dsInsert) or
   (dmBaseDados.tblProdutosComprados.State = dsEdit)) then
      dmBaseDados.tblProdutosComprados.Post;
   Close;
end;

end.
