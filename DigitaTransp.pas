unit DigitaTransp;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, DBCtrls, StdCtrls, TIGradient, db, TISButton;

type
  TformDigitaTransp = class(TForm)
    TIGradient1: TTIGradient;
    lblTransportadora: TLabel;
    lblPlaca: TLabel;
    lblNomeTrans: TLabel;
    lblCNPJ: TLabel;
    lblIE: TLabel;
    lblEnd: TLabel;
    lblUF: TLabel;
    lblCidade: TLabel;
    lblPlacaUF: TLabel;
    edtPlaca: TEdit;
    edtNomeTrans: TEdit;
    edtCNPJTrans: TEdit;
    edtInscTrans: TEdit;
    edtEndTrans: TEdit;
    edtEstadoTrans: TEdit;
    edtCidadeTrans: TEdit;
    edtPlacaUF: TEdit;
    cmbTransportadora: TDBLookupComboBox;
    btnOK: TTISButton;
    procedure cmbTransportadoraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formDigitaTransp: TformDigitaTransp;

implementation

uses ModuloDados;


{$R *.dfm}


procedure TformDigitaTransp.FormShow(Sender: TObject);
begin
dmBaseDados.tblTransportadora.Open;
edtNomeTrans.Clear;
edtCNPJTrans.Clear;
edtInscTrans.Clear;
edtEndTrans.Clear;
edtCidadeTrans.Clear;
edtEstadoTrans.Clear;
edtPlaca.Clear;
edtPlacaUF.Clear;
end;

procedure TformDigitaTransp.cmbTransportadoraClick(Sender: TObject);
begin
dmBaseDados.tblTransportadora.First;
if (dmBaseDados.tblTransportadora.Locate('NomeFantasia',cmbTransportadora.Text,[loCaseInsensitive]) = TRUE) then
 begin
  edtNomeTrans.Text   := dmBaseDados.tblTransportadoraRazaoSocial.AsString;
  edtCNPJTrans.Text   := dmBaseDados.tblTransportadoraCNPJ.AsString;
  edtInscTrans.Text   := dmBaseDados.tblTransportadoraInscricao.AsString;
  edtEndTrans.Text    := dmBaseDados.tblTransportadoraEndereco.AsString+', '+ dmBaseDados.tblTransportadoraNumero.AsString;
  edtCidadeTrans.Text := dmBaseDados.tblTransportadoraCidade.AsString;
  edtEstadoTrans.Text := dmBaseDados.tblTransportadoraEstado.AsString;
 end;
end;

procedure TformDigitaTransp.btnOKClick(Sender: TObject);
begin
Close;
end;

end.
