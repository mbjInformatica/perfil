unit Inutilizar;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TISButton, TIGradient, TIGradientCaption, StdCtrls;

type
  TformInutilizar = class(TForm)
    TIGradientCaption1: TTIGradientCaption;
    TIGradient1: TTIGradient;
    btnCancelar: TTISButton;
    TISButton1: TTISButton;
    edtJustificativa: TEdit;
    lblDtI: TLabel;
    Label1: TLabel;
    lblDtF: TLabel;
    edtInicio: TEdit;
    edtFim: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure edtInicioKeyPress(Sender: TObject; var Key: Char);
    procedure edtFimKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formInutilizar: TformInutilizar;
    stsInutilizar : String;

implementation

uses GerenciarNFe;


{$R *.dfm}


procedure TformInutilizar.btnCancelarClick(Sender: TObject);
begin
if (edtInicio.Text = '') then
 begin
  Application.MessageBox('Número inicial não digitado! Favor Verificar!','ATENÇÃO!',MB_ICONERROR);
  edtInicio.SetFocus;
  Abort;
 end;
if (edtFim.Text = '') then
 begin
  Application.MessageBox('Número final não digitado! Favor Verificar!','ATENÇÃO!',MB_ICONERROR);
  edtFim.SetFocus;
  Abort;
 end;
if (edtJustificativa.Text = '') then
 begin
  Application.MessageBox('Justificativa não digitada! Favor Verificar!','ATENÇÃO!',MB_ICONERROR);
  edtJustificativa.SetFocus;
  Abort;
 end;
if (Copy(edtJustificativa.Text,15,1) = '') then
 begin
  Application.MessageBox('A Justificativa deve ter no mínimo 15 caracteres! Favor Verificar!','ATENÇÃO!',MB_ICONEXCLAMATION);
  edtJustificativa.SetFocus;
  Abort;
 end;
stsInutilizar := 'SIM';
Close;
end;

procedure TformInutilizar.edtInicioKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TformInutilizar.edtFimKeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TformInutilizar.FormShow(Sender: TObject);
begin
edtJustificativa.Clear;
edtInicio.Clear;
edtFim.Clear;
end;

procedure TformInutilizar.TISButton1Click(Sender: TObject);
begin
Close;
end;

end.
