unit SituacaoOrdemAlf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformSituacaoOrdemAlf = class(TForm)
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    rdbBloqueado: TRadioButton;
    rdbCancelado: TRadioButton;
    ckbTodos: TCheckBox;
    Label1: TLabel;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSituacaoOrdemAlf: TformSituacaoOrdemAlf;

implementation

uses ModuloDados, RelClientes, SituacaoRefFab;

{$R *.DFM}

procedure TformSituacaoOrdemAlf.btnOKClick(Sender: TObject);
begin
 if rdbAtivo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('A')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.rptClientes.Preview;
     formSituacaoRamAtv.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbInativo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('I')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.rptClientes.Preview;
     formSituacaoRamAtv.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbBloqueado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('B')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.rptClientes.Preview;
     formSituacaoRamAtv.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if rdbCancelado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('C')+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.rptClientes.Preview;
     formSituacaoRamAtv.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Filter    := '';
     dmBaseDados.tblClientes.Filtered  := False;
     dmBaseDados.tblClientes.Close;
  end;
 if ckbTodos.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     formRelClientes.rptClientes.Preview;
     formSituacaoRamAtv.Close;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Close;
  end;
end;

procedure TformSituacaoOrdemAlf.FormShow(Sender: TObject);
begin
  rdbAtivo.Checked     := False;
  rdbInativo.Checked   := False;
  rdbBloqueado.Checked := False;
  rdbCancelado.Checked := False;
  ckbTodos.Checked     := False;
end;

end.
