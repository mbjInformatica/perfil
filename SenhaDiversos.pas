unit SenhaDiversos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TIGradientCaption, StdCtrls, TIGradient, TISButton;

type
  TformSenhaDiversos = class(TForm)
    btnOK: TTISButton;
    TISButton1: TTISButton;
    TIGradient1: TTIGradient;
    edtSenha: TEdit;
    TIGradientCaption2: TTIGradientCaption;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formSenhaDiversos : TformSenhaDiversos;
    strCont  : Integer;
    stsEst : Boolean;
    SENHA : String;

implementation

uses ModuloDados;

{$R *.dfm}

procedure TformSenhaDiversos.btnOKClick(Sender: TObject);
begin
if (edtSenha.Text = SENHA) then
  Begin
   stsEst := True;
   Close;
  End
else
  Begin
   Application.MessageBox('Senha Incorreta! Redigite','Senhas',MB_OK);
   stsEst  := False;
   strCont := strCont + 1;
   edtSenha.Clear;
   edtSenha.SetFocus;
   if (strCont = 3) then
    begin
     Close;
    end;
  End;
end;

procedure TformSenhaDiversos.FormShow(Sender: TObject);
begin
stsEst  := False;
strCont := 0;
edtSenha.Clear;
edtSenha.SetFocus;
end;

procedure TformSenhaDiversos.TISButton1Click(Sender: TObject);
begin
Close;
end;

procedure TformSenhaDiversos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (Key = VK_F4) then Key := 0;
end;

end.




