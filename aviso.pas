unit aviso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFormAviso = class(TForm)
    Panel1: TPanel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAviso: TFormAviso;

implementation

{$R *.dfm}

procedure TFormAviso.FormActivate(Sender: TObject);
begin
        PANEL1.SetFocus;
end;

end.
