unit SituacaoRefFab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TformSituacaoRefFab = class(TForm)
    rdbAtivo     : TRadioButton;
    rdbInativo   : TRadioButton;
    rdbBloqueado : TRadioButton;
    rdbCancelado : TRadioButton;
    ckbTodos     : TCheckBox;
    Label1       : TLabel;
    btnOK        : TBitBtn;
    btnCancela   : TBitBtn;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSituacaoRefFab: TformSituacaoRefFab;

implementation

uses ModuloDados, RelClientes, SituacaoCodCli;

{$R *.DFM}

procedure TformSituacaoRefFab.btnOKClick(Sender: TObject);
begin
 if rdbAtivo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndRamoAtividade';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE RAMO DE ATIVIDADE';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('A')+')';
     dmBaseDados.tblClientes.Filtered  := True;
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
     dmBaseDados.tblClientes.IndexName := 'IndRamoAtividade';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE RAMO DE ATIVIDADE';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('I')+')';
     dmBaseDados.tblClientes.Filtered  := True;
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
     dmBaseDados.tblClientes.IndexName := 'IndRamoAtividade';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE RAMO DE ATIVIDADE';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('B')+')';
     dmBaseDados.tblClientes.Filtered  := True;
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
     dmBaseDados.tblClientes.IndexName := 'IndRamoAtividade';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE RAMO DE ATIVIDADE';
     dmBaseDados.tblClientes.Filter    := '('+'Situacao ='+QuotedStr('C')+')';
     dmBaseDados.tblClientes.Filtered  := True;
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
     dmBaseDados.tblClientes.IndexName := 'IndRamoAtividade';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE RAMO DE ATIVIDADE';
     formRelClientes.rptClientes.Preview;
     dmBaseDados.tblClientes.IndexName := '';
     dmBaseDados.tblClientes.Close;
  end;
end;

end.
