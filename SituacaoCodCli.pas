unit SituacaoCodCli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformSituacaoCodCli = class(TForm)
    rdbAtivo     : TRadioButton;
    rdbInativo   : TRadioButton;
    rdbBloqueado : TRadioButton;
    rdbCancelado : TRadioButton;
    ckbTodos     : TCheckBox;
    Label1       : TLabel;
    btnOK        : TBitBtn;
    btnCancela   : TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSituacaoCodCli: TformSituacaoCodCli;

implementation

uses ModuloDados, RelClientes;

{$R *.DFM}

procedure TformSituacaoCodCli.FormShow(Sender: TObject);
begin
  rdbAtivo.Checked     := False;
  rdbInativo.Checked   := False;
  rdbBloqueado.Checked := False;
  rdbCancelado.Checked := False;
  ckbTodos.Checked     := False;
end;

procedure TformSituacaoCodCli.btnOKClick(Sender: TObject);
begin
 if rdbAtivo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCodCli';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('A')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
     formRelClientes.rptClientes.Preview;
     formSituacaoCodCli.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbInativo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCodCli';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('I')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
     formRelClientes.rptClientes.Preview;
     formSituacaoCodCli.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbBloqueado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCodCli';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('B')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
     formRelClientes.rptClientes.Preview;
     formSituacaoCodCli.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbCancelado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCodCli';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('C')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
     formRelClientes.rptClientes.Preview;
     formSituacaoCodCli.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if ckbTodos.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCodCli';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE CÓDIGO';
     formRelClientes.rptClientes.Preview;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Close;
  end;
end;

end.
