unit MargemRelacionadasMinima;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TfrmMargemRelacionadasMinima = class(TForm)
    lblDtI: TLabel;
    lblDtF: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
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
  frmMargemRelacionadasMinima: TfrmMargemRelacionadasMinima;

implementation

uses ModuloDados;

{$R *.DFM}

procedure TfrmMargemRelacionadasMinima.btnOKClick(Sender: TObject);
begin
{ dmBaseDados.tblContasReceber.Open;
 dmBaseDados.tblPedidos.Open;
 dmBaseDados.tblPedidos.IndexName := 'IndNroPedido';
 dmBaseDados.tblPedidos.Filter    := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('2')+')';
 dmBaseDados.tblPedidos.Filtered  := True;
 dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento';
 dmBaseDados.tblContasReceber.First;
   while (not dmBaseDados.tblPedidos.Eof) do
    begin
     dmBaseDados.tblContasReceber.FindKey([dmBaseDados.tblPedidosNPedido.AsString]);
      if dmBaseDados.tblContasReceberDataBaixa.AsDateTime = dmBaseDados.tblContasReceberDtBranco.AsDateTime then
        begin
          dmBaseDados.tblContasReceber.Edit;
          dmBaseDados.tblContasReceberDataBaixa.AsDateTime := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
          dmBaseDados.tblContasReceber.Post
        end;
     dmBaseDados.tblPedidos.Next;
    end;
 dmBaseDados.tblContasReceber.Close;
 dmBaseDados.tblPedidos.Close;
 dmBaseDados.tblContasReceber.IndexName := '' ;
 dmBaseDados.tblPedidos.IndexName   := '';}


dmBaseDados.tblContasReceber.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblContasReceber.First;
dmBaseDados.tblContasReceber.IndexName := 'IndNumeroDocumento' ;
dmBaseDados.tblPedidos.IndexName       := 'IndNroPedido';
   while (not dmBaseDados.tblContasReceber.Eof) do
    begin
     dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblContasReceberNumeroDocumento.AsString]);
      if (dmBaseDados.tblPedidosStatus.AsString = '2') then
        begin
          dmBaseDados.tblContasReceber.Edit;
          dmBaseDados.tblContasReceberDataBaixa.AsDateTime := dmBaseDados.tblPedidosDataEmissao.AsDateTime;
          dmBaseDados.tblContasReceber.Post;
        end;
     dmBaseDados.tblContasReceber.Next;
    end;
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblContasReceber.IndexName := '' ;
dmBaseDados.tblPedidos.IndexName   := '';


end;

procedure TfrmMargemRelacionadasMinima.FormShow(Sender: TObject);
begin
Data1.DateTime := Date;
Data2.DateTime := Date;
end;

end.
