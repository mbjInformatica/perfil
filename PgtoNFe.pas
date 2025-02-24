unit PgtoNFe;             

interface

uses Windows, Messages, SysUtils, Variants, Classes,
     Graphics, Controls, Forms, Dialogs, TISButton, TIGradientCaption,
  TIGradient, StdCtrls;

type
  TformPgtoNFe = class(TForm)
    cmbPgtoNFe: TComboBox;
    Label2: TLabel;
    TIGradient1: TTIGradient;
    TIGradientCaption1: TTIGradientCaption;
    btnOK: TTISButton;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formPgtoNFe: TformPgtoNFe;

implementation

uses NotaFiscal;


{$R *.dfm}


procedure TformPgtoNFe.btnOKClick(Sender: TObject);
var strConfirma : String;
begin
strConfirma := 'Confirma Forma de Pagamento:  "' +cmbPgtoNFe.Text+ '" ?';
if (Application.MessageBox(pChar(strConfirma),'ATENÇÃO!',MB_YESNO) = IDYES) then
  begin
   formaPgto := Copy(cmbPgtoNFe.Text,1,2);
   Close;
  end;
end;
                                                        
procedure TformPgtoNFe.FormShow(Sender: TObject);
begin
cmbPgtoNFe.ItemIndex := 0;
cmbPgtoNFe.SetFocus;
end;

procedure TformPgtoNFe.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (Key = VK_F4) then Key := 0;
end;

end.
