unit Contadesconto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformContadesconto = class(TForm)
    edtdesconto: TEdit;
    lblDesconto: TLabel;
    lblperc: TLabel;
    btnOK: TBitBtn;
    btnCanleca: TBitBtn;
    procedure btnCanlecaClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formContadesconto: TformContadesconto;

implementation
uses modulodados;
{$R *.DFM}

procedure TformContadesconto.btnCanlecaClick(Sender: TObject);
begin
close;
end;

procedure TformContadesconto.btnOKClick(Sender: TObject);

begin
//dmBaseDados.tblContasReceber.open;
if edtdesconto.Text = '0' then
   begin
     dmBaseDados.tblContasReceber.edit;
     dmBaseDados.tblContasReceberDesconto.AsString := '';
     dmBaseDados.tblContasReceber.Post;
     close;
   end
else
   begin
     dmBaseDados.tblContasReceber.edit;
     dmBaseDados.tblContasReceberDesconto.AsString := edtdesconto.Text;
     dmBaseDados.tblContasReceber.Post;
     close;

   end;
end;

procedure TformContadesconto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
edtdesconto.Text := '0';
end;

end.
