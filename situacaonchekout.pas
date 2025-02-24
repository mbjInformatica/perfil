unit situacaonchekout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  Tformsituacaonchekout = class(TForm)
    Label1: TLabel;
    rdbAtivo: TRadioButton;
    rdbInativo: TRadioButton;
    rdbBloqueado: TRadioButton;
    rdbCancelado: TRadioButton;
    ckbTodos: TCheckBox;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    lblnchekout: TLabel;
    edtinicial: TEdit;
    edtfinal: TEdit;
    lblinicial: TLabel;
    lblfinal: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formsituacaonchekout: Tformsituacaonchekout;

implementation
uses modulodados, RelClientes, relcliente2;

{$R *.DFM}

procedure Tformsituacaonchekout.btnOKClick(Sender: TObject);
var strcodforn : string;
begin

 dmBaseDados.tblLogMensal.Open;
 dmBaseDados.tblPedidos.open;
//Cliente ativo...
 if rdbAtivo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'NChekout >='+QuotedStr(edtinicial.Text)+')and('+'NChekout <='+QuotedStr(edtfinal.Text)+')and('+'Situacao ='+QuotedStr('A')+')';
     dmBaseDados.tblClientes.Filtered  := True;
  { if (ckbfornecedor.Checked = true) then
     begin
       while (not dmBaseDados.tblClientes.Eof) do
          begin
            dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblClientesCodigoCliente.asinteger]);
                 while dmBaseDados.tblPedidosCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString do
                     begin
                       if (copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtfornecedor.Text)then
                          begin
                             dmBaseDados.tblLogMensal.Insert;
                             dmBaseDados.tblLogMensalDescricao.AsString:= dmBaseDados.tblClientesNomeCliente.AsString+' - '+IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
                             dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblClientesSituacao.AsString;
                             dmBaseDados.tblLogMensalQuantidade.AsString:= dmBaseDados.tblClientesNChekout.AsString;
                             dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosCodigoVendedor.AsString;
                             dmBaseDados.tblClientes.Next;
                             dmBaseDados.tblLogMensal.Post;
                             formrelclientes2.qrlTitulo.Caption := 'ORDEM DE NOME';
                             formrelclientes2.qrlForn.Caption := edtfornecedor.Text;
                          end
                       else
                          begin
                              dmBaseDados.tblPedidos.Next;
                          end;
                     end;
                dmBaseDados.tblClientes.Next;
          end;
        formrelclientes2.qrpcli.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblPedidos.close;
        dmBaseDados.tblLogMensal.close;
     end
   else
     begin }
        formRelClientes.rptClientes.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblLogMensal.Close;
        dmBaseDados.tblPedidos.close;
    // end;
  end;
//Cliente Inativo...
 if rdbInativo.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'NChekout >='+QuotedStr(edtinicial.Text)+')and('+'NChekout <='+QuotedStr(edtfinal.Text)+')and('+'Situacao ='+QuotedStr('I')+')';
     dmBaseDados.tblClientes.Filtered  := True;
  { if (ckbfornecedor.Checked = true) then
     begin
       while (not dmBaseDados.tblClientes.Eof) do
          begin
            dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblClientesCodigoCliente.asinteger]);
                 while dmBaseDados.tblPedidosCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString do
                     begin
                       if (copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtfornecedor.Text)then
                          begin
                             dmBaseDados.tblLogMensal.Insert;
                             dmBaseDados.tblLogMensalDescricao.AsString:= dmBaseDados.tblClientesNomeCliente.AsString+' - '+IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
                             dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblClientesSituacao.AsString;
                             dmBaseDados.tblLogMensalQuantidade.AsString:= dmBaseDados.tblClientesNChekout.AsString;
                             dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosCodigoVendedor.AsString;
                             dmBaseDados.tblClientes.Next;
                             dmBaseDados.tblLogMensal.Post;
                             formrelclientes2.qrlTitulo.Caption := 'ORDEM DE NOME';
                             formrelclientes2.qrlForn.Caption := edtfornecedor.Text;
                          end
                       else
                          begin
                              dmBaseDados.tblPedidos.Next;
                          end;
                     end;
                dmBaseDados.tblClientes.Next;
          end;
        formrelclientes2.qrpcli.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblPedidos.close;
        dmBaseDados.tblLogMensal.close;
     end
   else
     begin }
       formRelClientes.rptClientes.Preview;
       formsituacaonchekout.Close;
       dmBaseDados.tblClientes.IndexName := '';
       dmBaseDados.tblClientes.Filter    := '';
       dmBaseDados.tblClientes.Filtered  := False;
       dmBaseDados.tblClientes.Close;
       dmBaseDados.tblLogMensal.Close;
       dmBaseDados.tblPedidos.close;
    // end;
  end;
//Cliente bloqueado...
 if rdbBloqueado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'NChekout >='+QuotedStr(edtinicial.Text)+')and('+'NChekout <='+QuotedStr(edtfinal.Text)+')and('+'Situacao ='+QuotedStr('B')+')';
     dmBaseDados.tblClientes.Filtered  := True;
  { if (ckbfornecedor.Checked = true) then
     begin
       while (not dmBaseDados.tblClientes.Eof) do
          begin
            dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblClientesCodigoCliente.asinteger]);
                 while dmBaseDados.tblPedidosCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString do
                     begin
                       if (copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtfornecedor.Text)then
                          begin
                             dmBaseDados.tblLogMensal.Insert;
                             dmBaseDados.tblLogMensalDescricao.AsString:= dmBaseDados.tblClientesNomeCliente.AsString+' - '+IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
                             dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblClientesSituacao.AsString;
                             dmBaseDados.tblLogMensalQuantidade.AsString:= dmBaseDados.tblClientesNChekout.AsString;
                             dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosCodigoVendedor.AsString;
                             dmBaseDados.tblClientes.Next;
                             dmBaseDados.tblLogMensal.Post;
                             formrelclientes2.qrlTitulo.Caption := 'ORDEM DE NOME';
                             formrelclientes2.qrlForn.Caption := edtfornecedor.Text;
                          end
                       else
                          begin
                              dmBaseDados.tblPedidos.Next;
                          end;
                     end;
                dmBaseDados.tblClientes.Next;
          end;
        formrelclientes2.qrpcli.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblPedidos.close;
        dmBaseDados.tblLogMensal.close;
     end
   else
     begin }
       formRelClientes.rptClientes.Preview;
       formsituacaonchekout.Close;
       dmBaseDados.tblClientes.IndexName := '';
       dmBaseDados.tblClientes.Filter    := '';
       dmBaseDados.tblClientes.Filtered  := False;
       dmBaseDados.tblClientes.Close;
       dmBaseDados.tblLogMensal.Close;
       dmBaseDados.tblPedidos.close;
   //  end;
  end;
//Cliente cancelado...
 if rdbCancelado.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
     dmBaseDados.tblClientes.Filter    := '('+'NChekout >='+QuotedStr(edtinicial.Text)+')and('+'NChekout <='+QuotedStr(edtfinal.Text)+')and('+'Situacao ='+QuotedStr('C')+')';
     dmBaseDados.tblClientes.Filtered  := True;
 {  if (ckbfornecedor.Checked = true) then
     begin
       while (not dmBaseDados.tblClientes.Eof) do
          begin
            dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblClientesCodigoCliente.asinteger]);
                 while dmBaseDados.tblPedidosCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString do
                     begin
                       if (copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtfornecedor.Text)then
                          begin
                             dmBaseDados.tblLogMensal.Insert;
                             dmBaseDados.tblLogMensalDescricao.AsString:= dmBaseDados.tblClientesNomeCliente.AsString+' - '+IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
                             dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblClientesSituacao.AsString;
                             dmBaseDados.tblLogMensalQuantidade.AsString:= dmBaseDados.tblClientesNChekout.AsString;
                             dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosCodigoVendedor.AsString;
                             dmBaseDados.tblClientes.Next;
                             dmBaseDados.tblLogMensal.Post;
                             formrelclientes2.qrlTitulo.Caption := 'ORDEM DE NOME';
                             formrelclientes2.qrlForn.Caption := edtfornecedor.Text;
                          end
                       else
                          begin
                              dmBaseDados.tblPedidos.Next;
                          end;
                     end;
                dmBaseDados.tblClientes.Next;
          end;
        formrelclientes2.qrpcli.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblPedidos.close;
        dmBaseDados.tblLogMensal.close;
     end
   else
     begin  }
       formRelClientes.rptClientes.Preview;
       formsituacaonchekout.Close;
       dmBaseDados.tblClientes.IndexName := '';
       dmBaseDados.tblClientes.Filter    := '';
       dmBaseDados.tblClientes.Filtered  := False;
       dmBaseDados.tblClientes.Close;
       dmBaseDados.tblLogMensal.Close;
       dmBaseDados.tblPedidos.close;
    // end;
  end;
//Todos os clientes...
 if ckbTodos.Checked = True then
  begin
     dmBaseDados.tblClientes.Open;
     dmBaseDados.tblClientes.IndexName := 'IndCliente';
     dmBaseDados.tblClientes.Filter    := '('+'NChekout >='+QuotedStr(edtinicial.Text)+')and('+'NChekout <='+QuotedStr(edtfinal.Text)+')';
     dmBaseDados.tblClientes.Filtered  := True;
     formRelClientes.lblOrdem.Caption  := 'ORDEM DE NOME';
  { if (ckbfornecedor.Checked = true) then
     begin
       while (not dmBaseDados.tblClientes.Eof) do
          begin
            dmBaseDados.tblPedidos.FindKey([dmBaseDados.tblClientesCodigoCliente.asinteger]);
                 while dmBaseDados.tblPedidosCodigoCliente.AsString = dmBaseDados.tblClientesCodigoCliente.AsString do
                     begin
                       if (copy(dmBaseDados.tblPedidosProduto.AsString,1,3) = edtfornecedor.Text)then
                          begin
                             dmBaseDados.tblLogMensal.Insert;
                             dmBaseDados.tblLogMensalDescricao.AsString:= dmBaseDados.tblClientesNomeCliente.AsString+' - '+IntToStr(dmBaseDados.tblClientesCodigoCliente.AsInteger);
                             dmBaseDados.tblLogMensalUnidadeMedida.AsString := dmBaseDados.tblClientesSituacao.AsString;
                             dmBaseDados.tblLogMensalQuantidade.AsString:= dmBaseDados.tblClientesNChekout.AsString;
                             dmBaseDados.tblLogMensalCodigoProduto.AsString := dmBaseDados.tblPedidosCodigoVendedor.AsString;
                             dmBaseDados.tblClientes.Next;
                             dmBaseDados.tblLogMensal.Post;
                             formrelclientes2.qrlTitulo.Caption := 'ORDEM DE NOME';
                             formrelclientes2.qrlForn.Caption := edtfornecedor.Text;
                          end
                       else
                          begin
                              dmBaseDados.tblPedidos.Next;
                          end;
                     end;
                dmBaseDados.tblClientes.Next;
          end;
        formrelclientes2.qrpcli.Preview;
        formsituacaonchekout.Close;
        dmBaseDados.tblClientes.IndexName := '';
        dmBaseDados.tblClientes.Filter    := '';
        dmBaseDados.tblClientes.Filtered  := False;
        dmBaseDados.tblClientes.Close;
        dmBaseDados.tblPedidos.close;
        dmBaseDados.tblLogMensal.close;
     end
   else
     begin   }
       formRelClientes.rptClientes.Preview;
       formsituacaonchekout.Close;
       dmBaseDados.tblClientes.IndexName := '';
       dmBaseDados.tblClientes.Filter    := '';
       dmBaseDados.tblClientes.Filtered  := False;
       dmBaseDados.tblClientes.Close;
       dmBaseDados.tblLogMensal.Close;
       dmBaseDados.tblPedidos.close;
   //  end;
  end;
end;

procedure Tformsituacaonchekout.FormShow(Sender: TObject);
begin
  dmBaseDados.tblPedidos.Open;
  dmBaseDados.tblLogMensal.EmptyTable;
  dmBaseDados.tblLogMensal.open;
  edtinicial.Text := '';
  edtfinal.Text := '';
  rdbAtivo.Checked     := False;
  rdbInativo.Checked   := False;
  rdbBloqueado.Checked := False;
  rdbCancelado.Checked := False;
  ckbTodos.Checked     := False;
 // ckbVenda.Checked     := false;
  //ckbfornecedor.Checked:= false;
 // edtfornecedor.Text   := '';
  //edtvendedor.Text     := '';
end;

procedure Tformsituacaonchekout.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmBaseDados.tblLogMensal.close;
end;

end.
