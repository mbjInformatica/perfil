unit ConfigEmail;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, TISButton, StdCtrls, db, DBCtrls, Mask;
     
type
  TformConfigEmail = class(TForm)
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    btnGravar: TTISButton;
    btnSair: TTISButton;
    dbeServidorSMTP: TDBEdit;
    dbePorta: TDBEdit;
    dbeUsuario: TDBEdit;
    dbeSenha: TDBEdit;
    dbeMensagem: TDBMemo;
    cbEmailSSL: TDBCheckBox;
    TISButton1: TTISButton;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure TISButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formConfigEmail: TformConfigEmail;

implementation

uses ModuloDados, NotaFiscal;


{$R *.dfm}


procedure TformConfigEmail.FormShow(Sender: TObject);
begin
dmBaseDados.tblEmail.Open;
dbeServidorSMTP.ReadOnly := True;
dbePorta.ReadOnly        := True;
dbeUsuario.ReadOnly      := True;
dbeSenha.ReadOnly        := True;
dbeMensagem.ReadOnly     := True;
cbEmailSSL.ReadOnly      := True;
end;

procedure TformConfigEmail.btnGravarClick(Sender: TObject);
begin
if( (dmBaseDados.tblEmail.State = dsEdit)
 or (dmBaseDados.tblEmail.State = dsInsert) )then
  Begin
   dmBaseDados.tblEmail.Post;
  End; 
end;

procedure TformConfigEmail.btnSairClick(Sender: TObject);
begin
Close;
end;

procedure TformConfigEmail.TISButton1Click(Sender: TObject);
begin
dbeServidorSMTP.ReadOnly := False;
dbePorta.ReadOnly        := False;
dbeUsuario.ReadOnly      := False;
dbeSenha.ReadOnly        := False;
dbeMensagem.ReadOnly     := False;
cbEmailSSL.ReadOnly      := False;
end;

end.
