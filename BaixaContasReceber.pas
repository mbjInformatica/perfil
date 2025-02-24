unit BaixaContasReceber;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls,
     TISProgressBar, TIGradientCaption, TIGradient, TISButton;

type
  TformBaixaContasReceber = class(TForm)
    btnOK: TTISButton;
    btnCancela: TTISButton;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    pgrProcessamento: TTISProgressBar;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formBaixaContasReceber: TformBaixaContasReceber;

implementation

uses ModuloDados, ContasReceber, DB;


{$R *.dfm}


procedure TformBaixaContasReceber.btnOKClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.First;
pgrProcessamento.Max := dmBaseDados.tblContasReceber.RecordCount;
if (Application.MessageBox('Confirma a baixa dos títulos em aberto?','Tem certeza?',MB_YESNO) = IDYES) then
  Begin
   while (not dmBaseDados.tblContasReceber.Eof) do
    begin
     dmBaseDados.tblContasReceber.Edit;
     dmBaseDados.tblContasReceberValorTotal.AsFloat       := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     dmBaseDados.tblContasReceberValorDinheiro.AsFloat    := dmBaseDados.tblContasReceberValorDocumento.AsFloat;
     dmBaseDados.tblContasReceberDataPagamento.AsDateTime := Date;
     dmBaseDados.tblContasReceberStatus.AsString          := '1';
     dmBaseDados.tblContasReceber.Post;
     pgrProcessamento.Position := pgrProcessamento.Position + 1;
    end;
  End;
dmBaseDados.tblContasReceber.Filter       := '';
dmBaseDados.tblContasReceber.Filtered     := False;
dmBaseDados.tblContasReceber.IndexName    := '';
dmBaseDados.tblContasReceber.MasterFields := 'CodigoCliente';
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblClientes.IndexName := '';
dmBaseDados.tblClientes.Close;
end;

procedure TformBaixaContasReceber.btnCancelaClick(Sender: TObject);
begin
dmBaseDados.tblContasReceber.Filter       := '';
dmBaseDados.tblContasReceber.Filtered     := False;
dmBaseDados.tblContasReceber.IndexName    := '';
dmBaseDados.tblContasReceber.MasterFields := 'CodigoCliente';
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblClientes.IndexName := '';
dmBaseDados.tblClientes.Close;
Close;
end;

procedure TformBaixaContasReceber.FormShow(Sender: TObject);
begin
pgrProcessamento.Position := 0;
btnCancela.SetFocus;
end;

end.
