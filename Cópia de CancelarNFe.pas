unit CancelarNFe;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TISButton, TIGradientCaption, TIGradient, StdCtrls;

type
  TformCancelarNFe = class(TForm)
    edtJustificativa: TEdit;
    TIGradientCaption1: TTIGradientCaption;
    btnCancelar: TTISButton;
    TISButton1: TTISButton;
    TIGradient1: TTIGradient;
    procedure btnCancelarClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formCancelarNFe: TformCancelarNFe;

implementation

uses GerenciarNFe, ModuloDados, DB;


{$R *.dfm}


procedure TformCancelarNFe.btnCancelarClick(Sender: TObject);
begin
if (Copy(edtJustificativa.Text,15,1) = '') then
 begin
  Application.MessageBox('A Justificativa deve ter no mínimo 15 caracteres! Favor Verificar!','ATENÇÃO!',MB_ICONEXCLAMATION);
  edtJustificativa.SetFocus;
  Abort;
 end;
stsCancelar := 'SIM';
Close;
end;

procedure TformCancelarNFe.TISButton1Click(Sender: TObject);
begin
stsCancelar := '';
Close;
end;

procedure TformCancelarNFe.FormShow(Sender: TObject);
begin
edtJustificativa.Clear;
end;

end.
