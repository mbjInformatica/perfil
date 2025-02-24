unit SelSATCanc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TISButton, TIGradientCaption, TIGradient, Grids, DBGrids, db;

type
  TformSelSATCanc = class(TForm)
    grdNotas: TDBGrid;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    TISButton1: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSelSATCanc: TformSelSATCanc;

implementation

uses ModuloDados, TesteSat;

                                                         
{$R *.dfm} 


procedure TformSelSATCanc.FormShow(Sender: TObject);
begin
dmBaseDados.tblCupomFiscal.Open;
dmBaseDados.tblCupomFiscal.Last;
end;

procedure TformSelSATCanc.TISButton1Click(Sender: TObject);
begin
dmBaseDados.qryCupomFiscal.Open;
dmBaseDados.qryCupomFiscal.Locate('CaminhoXML', dmBaseDados.tblCupomFiscalCaminhoXML.AsString, [loCaseInsensitive]);
Close;
end;

procedure TformSelSATCanc.grdNotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (dmBaseDados.tblCupomFiscalCancelado.AsString = 'S') then
 begin
  grdNotas.Canvas.Font.Color  := clRed;
  grdNotas.Canvas.Brush.Color := clWhite;
  grdNotas.DefaultDrawDataCell(Rect, grdNotas.columns[DataCol].Field, State);
 end;
end;

end.
