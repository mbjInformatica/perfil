unit consultacliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Mask, DBCtrls;

type
  Tformemaberto = class(TForm)
    lblcodcliente: TLabel;
    lblnomecli: TLabel;
    dbecodcli: TDBEdit;
    dbecliente: TDBEdit;
    lbltitulo: TLabel;
    DBGrid1: TDBGrid;
    blbvalor: TLabel;
    lbltotal: TLabel;
    btncontinuar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formemaberto: Tformemaberto;

implementation

{$R *.DFM}

end.
