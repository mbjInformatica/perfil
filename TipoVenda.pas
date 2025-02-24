unit TipoVenda;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, TISButton, TIGradient, TIGradientCaption;

type
  TformTipoVenda = class(TForm)
    TIGradientCaption1: TTIGradientCaption;
    TIGradient1: TTIGradient;
    btnOrc: TTISButton;
    btnVenda: TTISButton;
    TISButton1: TTISButton;
    procedure btnOrcClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formTipoVenda: TformTipoVenda;

implementation

uses Venda;


{$R *.dfm}


procedure TformTipoVenda.btnOrcClick(Sender: TObject);
begin
if (Application.MessageBox('Confirma a opção "ORÇAMENTO"?','CONFIRMA?',MB_YESNO) = IDYES) then
 begin
  formVendasBalcao.ckbOrc.Checked := True;
  Close
 end;
end;

procedure TformTipoVenda.btnVendaClick(Sender: TObject);
begin
if (Application.MessageBox('Confirma a opção "VENDA"?','CONFIRMA?',MB_YESNO) = IDYES) then
 begin
  formVendasBalcao.ckbOrc.Checked := False;
  Close
 end;
end;

procedure TformTipoVenda.TISButton1Click(Sender: TObject);
begin
strVoltaTipoVenda := 'SIM';
Close;
end;

procedure TformTipoVenda.FormShow(Sender: TObject);
begin
strVoltaTipoVenda := '';
end;

end.
