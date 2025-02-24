unit eDITAeSTADOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformEditaEstado = class(TForm)
    memEstados: TMemo;
    btbOK: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btbOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEditaEstado: TformEditaEstado;

implementation

{$R *.DFM}

procedure TformEditaEstado.FormShow(Sender: TObject);
begin
   memEstados.Lines.LoadFromFile('C:\TEMP\ESTADOS.TXT');
   memEstados.SetFocus;
end;


procedure TformEditaEstado.btbOKClick(Sender: TObject);
begin
   memEstados.Lines.SaveToFile('C:\TEMP\ESTADOS.TXT');
end;

end.
