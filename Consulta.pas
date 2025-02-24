unit Consulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Mask, DBCtrls, db;

type
  TformConsulta = class(TForm)
    DBGrid1: TDBGrid;
    dbeCodCli: TDBEdit;
    dbeCliente: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnok: TButton;
    lblValorLimite: TLabel;
    lblValorSoma: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  formConsulta: TformConsulta;
  strTotal     : Double;
  AcessStatus,NA: Integer;
    count : Double;
implementation
uses ModuloDados, senhavenda, Venda;

{$R *.DFM}

procedure TformConsulta.FormShow(Sender: TObject);
 var strData : TDateTime;
     resultado : Double;
begin

 count := 0;
 dmBaseDados.tblClientes.Open;
// lblValorLimite.Caption := dmBaseDados.tblClientesLimiteCredito.AsString;
 lblValorLimite.Caption := FloatToStrF(dmBaseDados.tblClientesLimiteCredito.AsFloat,ffCurrency,10,2);
 dmBaseDados.tblContasReceber.Open;
 dmBaseDados.tblContasReceber.IndexName := 'indCNPJCPF';
 strData := Date;
 dmBaseDados.tblContasReceber.Filter   := '('+'DataVencimento < '+QuotedStr(DateToStr(strData))+')and('+'Status <>'+QuotedStr('1')+')';
 dmBaseDados.tblContasReceber.Filtered := True;
 dmBaseDados.tblContasReceber.First;
 while (not dmBaseDados.tblContasReceber.Eof) do
   begin
      count := dmBaseDados.tblContasReceberValorDocumento.AsFloat + count;
      dmBaseDados.tblContasReceber.next;
   end;
// lblValorSoma.Caption := FloatToStr(count);
 lblValorSoma.Caption := FloatToStrF(count,ffCurrency,10,2);

if count > dmBaseDados.tblClientesLimiteCredito.AsFloat then
  begin
   lblValorLimite.Font.Color := clRed;
   lblValorSoma.Font.Color := clRed;
  end
else
  begin
   lblValorLimite.Font.Color := clBlue;
   lblValorSoma.Font.Color := clBlue;

  end;
end;


procedure TformConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);

begin


 dmBaseDados.tblContasReceber.Filter   := '';
 dmBaseDados.tblContasReceber.Filtered := False;
 dmBaseDados.tblContasReceber.IndexName := '';
 dmBaseDados.tblContasReceber.Close;
end;

procedure TformConsulta.btnokClick(Sender: TObject);


begin
dmBaseDados.tblLogMensal.Open;
if dmBaseDados.tblLogMensal.Locate('Descricao',dbeCodCli.Text,[LOCASEINSENSITIVE])=true then
   begin
     formConsulta.close;
     dmBaseDados.tblLogMensal.close;
   end
  else
   begin
 //if  dmBaseDados.tblContasReceberNumeroDocumento.AsString <> dmBaseDados.tblContasReceberDtBranco.AsString  then
 if count > dmBaseDados.tblClientesLimiteCredito.AsFloat then
 begin
   AcessStatus:=0;
   NA:=0;
   while (NA<3)and(AcessStatus=0) do
     begin
      frmsenhavenda.ShowModal;
       NA:=NA+1;
     end;
   if AcessStatus=0  then
    begin
      close;
      formvendasbalcao.close;
    end;
   if AcessStatus=1 then
    begin
      close;
    end;
 end
 else
 begin
   close;
   dmBaseDados.tblLogMensal.close;
 end;
 end;
end;

end.
