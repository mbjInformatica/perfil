unit MostraConsultaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, TIGradient, TISButton, TIGradientCaption;

type
  TformMostraConsultaPedido = class(TForm)
    DBGrid1: TDBGrid;
    TIGradient1: TTIGradient;
    btnOk: TTISButton;
    TIGradientCaption1: TTIGradientCaption;
    procedure btnOkClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMostraConsultaPedido: TformMostraConsultaPedido;

implementation

uses ModuloDados, MostraPedidoPorConsulta;

{$R *.dfm}

procedure TformMostraConsultaPedido.btnOkClick(Sender: TObject);
begin
 Close;
end;

procedure TformMostraConsultaPedido.DBGrid1DblClick(Sender: TObject);
begin
 formMostraPedidoPorConsulta.ShowModal;
end;

procedure TformMostraConsultaPedido.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//dmBaseDados.tblLogMensalSubtotal.AsFloat := StrToFloat(FormatFloat('0.00',dmBaseDados.tblLogMensalSubtotal.AsFloat));
end;

end.
