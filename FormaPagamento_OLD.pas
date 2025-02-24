unit FormaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, TISButton, TIGradientCaption, TIGradient;

type
  TformFormaPagamento = class(TForm)
    Edpagamento: TComboBox;
    cmbPgtoSAT: TComboBox;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    btnOK: TTISButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formFormaPagamento: TformFormaPagamento;

implementation

uses AlteraValor;


{$R *.dfm}


procedure TformFormaPagamento.btnOKClick(Sender: TObject);
begin
if (Application.MessageBox('Confirma Forma de Pagamento?','Atenção!',MB_YESNO)) = IDYES then
 begin
  //FormAlterarValor.Close;
  Close;
 end;
end;

end.
