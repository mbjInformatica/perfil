unit PerguntaNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TISButton, TIGradient, TIGradientCaption;

type
  TformPerguntaNFe = class(TForm) 
    TIGradient1: TTIGradient;                  
    btnNova: TTISButton;
    btnAlterar: TTISButton;
    TIGradientCaption1: TTIGradientCaption;
    btnRetornar: TTISButton;
    btnDevolucao: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure btnNovaClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDevolucaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formPerguntaNFe: TformPerguntaNFe;

implementation

uses MenuPrincipal;                      


{$R *.dfm}


procedure TformPerguntaNFe.FormShow(Sender: TObject);
begin
btnRetornar.SetFocus;
end;

procedure TformPerguntaNFe.btnNovaClick(Sender: TObject);
begin
if (Application.MessageBox('Confirma a emissão de um "NOVA" NF-e?','CONFIRMA?', MB_YESNO) = IDYES) then
 begin
  stsNotaE := '1';
  Close;
 end;
end;

procedure TformPerguntaNFe.btnAlterarClick(Sender: TObject);
begin
if (Application.MessageBox('Confirma "ALTERAÇÃO" de uma NF-e?','CONFIRMA?', MB_YESNO) = IDYES) then
 begin
  stsNotaE := '0';
  Close;                 
 end; 
end;

procedure TformPerguntaNFe.btnRetornarClick(Sender: TObject);
begin
stsNotaE := 'N';
Close;
end;

procedure TformPerguntaNFe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
// 'F4'
if (key = VK_F4) then 
 Begin
  key := 0;
 End;
end;

procedure TformPerguntaNFe.btnDevolucaoClick(Sender: TObject);
begin
stsNotaE := 'D';
Close;
end;

end.
