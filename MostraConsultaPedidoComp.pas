unit MostraConsultaPedidoComp;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics,
     Controls, Forms, Dialogs, Grids, DBGrids, TIGradient,
     TISButton, TIGradientCaption, StdCtrls, db;

type
  TformMostraConsultaPedidoComp = class(TForm)
    dbgPedidos: TDBGrid;
    TIGradient1: TTIGradient;
    btnOk: TTISButton;
    TIGradientCaption1: TTIGradientCaption;
    TIGradientCaption5: TTIGradientCaption;
    TIGradientCaption2: TTIGradientCaption;
    Label3: TLabel;
    TIGradientCaption3: TTIGradientCaption;
    Label2: TLabel;
    TISButton2: TTISButton;
    procedure btnOkClick(Sender: TObject);
    procedure dbgPedidosDblClick(Sender: TObject);
    procedure dbgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TISButton2Click(Sender: TObject);
    procedure dbgPedidosCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formMostraConsultaPedidoComp: TformMostraConsultaPedidoComp;

implementation

uses ModuloDados, {MostraPedidoPorConsultaComp, SenhaVendedor,} VarUtils;


{$R *.dfm}


procedure TformMostraConsultaPedidoComp.btnOkClick(Sender: TObject);
begin
Close;
end;

procedure TformMostraConsultaPedidoComp.dbgPedidosDblClick(Sender: TObject);
begin
//formMostraPedidoPorConsultaComp.ShowModal;
end;

procedure TformMostraConsultaPedidoComp.dbgPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if( (dmBaseDados.tblLogMensalUnidadeMedida.AsString = '3') )then
 begin
  dbgPedidos.Canvas.Brush.Color    := $00BAFCBD; // Verde
  if (Column.Field.FieldName <> 'CodigoMovimento') then
   begin
    dbgPedidos.Canvas.Font.Color   := clBlack;
   end;
  dbgPedidos.Columns[0].Font.Color := clRed;
  dbgPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end
else
 begin
  dbgPedidos.Canvas.Brush.Color    := clYellow;
  if (Column.Field.FieldName <> 'CodigoMovimento') then
   begin
    dbgPedidos.Canvas.Font.Color   := clBlack;
   end;
  dbgPedidos.Columns[0].Font.Color := clRed;
  dbgPedidos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
 end;
end;

procedure TformMostraConsultaPedidoComp.TISButton2Click(Sender: TObject);
var strPedido, strProduto : String;
    strQtde : Double;
    PortaLPT : TextFile;
begin

   if (Application.MessageBox('Confirma impressão dos pedidos selecionados??','A T E N Ç Ã O!',MB_YESNO) = IDYES) then
     Begin
      dmBaseDados.tblLogMensal.Open;
      dmBaseDados.tblLogMensal.Filter   := '('+'CodigoMovimento ='+ QuotedStr('X')+')';
      dmBaseDados.tblLogMensal.Filtered := True;
      dmBaseDados.tblPedidos.Open;
      while (not dmBaseDados.tblLogMensal.Eof) do
        BEGIN
         strPedido := dmBaseDados.tblLogMensalDocumento.AsString;
         dmBaseDados.tblPedidos.First;
         if (dmBaseDados.tblPedidos.Locate('NPedido',strPedido,[loCaseInsensitive]) = TRUE) then
          Begin
           //****IMPRESSÃO DIRETA PARA PORTA LPT1****
           //AssignFile(PortaLPT, 'C:\'+strPedido+'.txt');
           AssignFile(PortaLPT, 'LPT2:');
           Rewrite(PortaLPT);
           try
            Writeln(PortaLPT, '================================================');
            Writeln(PortaLPT, #14+'        AUTO PECAS PERFIL                   ');
            Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco      ');
            Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568      ');
            Writeln(PortaLPT, '================================================');
            Writeln(PortaLPT, ' N. Orcamento : ' +strPedido);
            Writeln(PortaLPT, '  '+ DateToStr(Date));
            Writeln(PortaLPT, ' Vendedor : '+dmBaseDados.tblPedidosVendedor.AsString);
            Writeln(PortaLPT, ' Cliente  : '+dmBaseDados.tblLogMensalDescricao.AsString);
            Writeln(PortaLPT, '================================================');
            Writeln(PortaLPT, 'Codigo \ Descricao');
            Writeln(PortaLPT, '                      Qtde     V.Unit.   V.Total');
            Writeln(PortaLPT, '================================================');
            finally
           while( (dmBaseDados.tblPedidosNPedido.AsString = strPedido)and(not dmBaseDados.tblPedidos.Eof) )do
             Begin
              writeln(PortaLPT, dmBaseDados.tblPedidosProduto.AsString+ '   '+ dmBaseDados.tblPedidosDescricao.AsString);
              writeln(PortaLPT, '                   '+dmBaseDados.tblPedidosQuantidade.AsString + '    X    '
              +(FormatCurr('###,##0.00',dmBaseDados.tblPedidosUnitario.AsCurrency))+ '    '
              +(FormatCurr('###,##0.00',dmBaseDados.tblPedidosTotal.AsCurrency)));
              dmBaseDados.tblPedidos.Next;
              //****FIM DA IMPRESSÃO****
             End; //end do while Pedidos
           Writeln(PortaLPT, '================================================');
           //Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
           Writeln(PortaLPT, '             TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',dmBaseDados.tblLogMensalValorLancamento.AsFloat)));
           Writeln(PortaLPT, '             VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',dmBaseDados.tblLogMensalValorLancamento.AsFloat)));
           Writeln(PortaLPT, '================================================');
           Writeln(PortaLPT, '*** Agradecemos a Preferencia. Volte Sempre! ***');
           Writeln(PortaLPT, '================================================');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           Writeln(PortaLPT, '');
           CloseFile(PortaLPT);
           end;
          End;// end do "Locate"
         dmBaseDados.tblLogMensal.Next;
        END; //end do while LogMensal
      dmBaseDados.tblLogMensal.Filter   := '';
      dmBaseDados.tblLogMensal.Filtered := False;
      dmBaseDados.tblPedidos.Close;
      dmBaseDados.tblFuncionarios.Close;
      Close;
     End;

end;

procedure TformMostraConsultaPedidoComp.dbgPedidosCellClick(Column: TColumn);
begin
if (dbgPedidos.SelectedField = dmBaseDados.tblLogMensalCodigoMovimento) then
  Begin
   if (dmBaseDados.tblLogMensalCodigoMovimento.AsString = '') then
    begin
     dmBaseDados.tblLogMensal.Edit;
     dmBaseDados.tblLogMensalCodigoMovimento.AsString := 'X';
     dmBaseDados.tblLogMensal.Post;
     dbgPedidos.SelectedField := dmBaseDados.tblLogMensalCodigoProduto;
    end                                                                  
   else
    begin
     dmBaseDados.tblLogMensal.Edit;
     dmBaseDados.tblLogMensalCodigoMovimento.AsString := '';
     dmBaseDados.tblLogMensal.Post;
     dbgPedidos.SelectedField := dmBaseDados.tblLogMensalCodigoProduto;
    end;
  End;
end;

end.
