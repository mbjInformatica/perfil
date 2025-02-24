unit senhavenda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  Tfrmsenhavenda = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtsenhavenda: TEdit;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsenhavenda: Tfrmsenhavenda;

implementation

uses modulodados, Consulta, Venda;

{$R *.DFM}

procedure Tfrmsenhavenda.btnOKClick(Sender: TObject);
begin
//dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
   if edtsenhavenda.Text = '2929' Then
                begin
                        AcessStatus:=1;
                        dmBaseDados.tblLogMensal.Append;
                        dmBaseDados.tblLogMensalDescricao.AsString := formconsulta.dbecodcli.text;
                        dmBaseDados.tblLogMensal.Post;

                end
        else
                begin
                        Application.MessageBox('Senha Incorreta,Redigite',
                        'Senhas',MB_OK);
                        AcessStatus:=0;
                        edtsenhavenda.SetFocus;
                end;
end;

procedure Tfrmsenhavenda.FormShow(Sender: TObject);
begin
edtsenhavenda.Text := '';
end;

procedure Tfrmsenhavenda.btnCancelaClick(Sender: TObject);
begin
NA := 3;

end;

procedure Tfrmsenhavenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
dmBaseDados.tblLogMensal.Close;
end;

end.
