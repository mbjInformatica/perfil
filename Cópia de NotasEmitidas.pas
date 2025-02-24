unit NotasEmitidas;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
     Forms, Dialogs, ComCtrls, StdCtrls, Buttons, TIGradientCaption,
     TISButton, ExtCtrls, TISProgressBar, TIGradient, TISComboBox;

type
  TformNotasEmitidas = class(TForm)
    btnOK: TTISButton;
    btnCancelar: TTISButton;
    TIGradient1: TTIGradient;
    pgrProcessamento: TTISProgressBar;
    Data1: TDateTimePicker;
    Label3: TLabel;
    Label2: TLabel;
    Data2: TDateTimePicker;
    TIGradientCaption1: TTIGradientCaption;
    cmbTipo: TTISComboBox;
    Label1: TLabel;
    Label4: TLabel;
    edtCliente: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var formNotasEmitidas : TformNotasEmitidas;

implementation

uses ModuloDados, RelNotasEmitidas, RotinasGerais,
     RelNFCanceladas, SeekClientes, DB;


{$R *.dfm}


procedure TformNotasEmitidas.FormShow(Sender: TObject);
begin
Data1.Date := Date;
Data2.Date := Date;
cmbTipo.ItemIndex := 0;
edtCliente.Text   := '0000';
end;

procedure TformNotasEmitidas.btnOKClick(Sender: TObject);
var strCodCli, strNPedido, strNatureza : String;
    strTotal, strVDesc, strPcDesc,
    fltCanceladas, fltValidas : Double;
begin
dmBaseDados.tblLogMensal.EmptyTable;
dmBaseDados.tblLogMensal.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblANotaFiscal.Open;
formRelNotasEmitidas.lblCanc.Enabled    := False;
formRelNotasEmitidas.lblTotCanc.Enabled := False;
formRelNotasEmitidas.lblDevl.Enabled    := False;
formRelNotasEmitidas.lblTotDevl.Enabled := False;
formRelNotasEmitidas.lblDeng.Enabled    := False;
formRelNotasEmitidas.lblTotDeng.Enabled := False;
formRelNotasEmitidas.lblVend.Enabled    := False;
formRelNotasEmitidas.lblTotVend.Enabled := False;
formRelNotasEmitidas.qrlCliente.Caption := 'Cliente';
if (cmbTipo.Text = 'TODAS') then
  Begin
   formRelNotasEmitidas.qrlTitulo.Caption  := 'RELATÓRIO DE NOTAS EMITIDAS / GERAL';
   formRelNotasEmitidas.lblCanc.Enabled    := True;
   formRelNotasEmitidas.lblTotCanc.Enabled := True;
   formRelNotasEmitidas.lblDevl.Enabled    := True;
   formRelNotasEmitidas.lblTotDevl.Enabled := True;
   formRelNotasEmitidas.lblVend.Enabled    := True;
   formRelNotasEmitidas.lblTotVend.Enabled := True;
   formRelNotasEmitidas.lblDeng.Enabled    := True;
   formRelNotasEmitidas.lblTotDeng.Enabled := True;
   dmBaseDados.tblANotaFiscal.Filter       := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
   dmBaseDados.tblANotaFiscal.Filtered     := True;
  End;
if (cmbTipo.Text = 'VENDAS') then
  Begin
   formRelNotasEmitidas.qrlTitulo.Caption  := 'RELATÓRIO DE NOTAS AUTORIZADAS';
   formRelNotasEmitidas.lblVend.Enabled    := True;
   formRelNotasEmitidas.lblTotVend.Enabled := True;
   dmBaseDados.tblANotaFiscal.Filter       := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Cancelada <>'+QuotedStr('S')+')';
   dmBaseDados.tblANotaFiscal.Filtered     := True;
  End;
if (cmbTipo.Text = 'CANCELADAS') then
  Begin                                        // DataCanc
   dmBaseDados.tblANotaFiscal.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Cancelada ='+QuotedStr('S')+')';
   dmBaseDados.tblANotaFiscal.Filtered := True;
  End;
if (cmbTipo.Text = 'DENEGADAS') then
  Begin
   formRelNotasEmitidas.qrlTitulo.Caption  := 'RELATÓRIO DE NOTAS DENEGADAS';
   formRelNotasEmitidas.lblDeng.Enabled    := True;
   formRelNotasEmitidas.lblTotDeng.Enabled := True;
   dmBaseDados.tblANotaFiscal.Filter       := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Status ='+QuotedStr('110')+')';
   dmBaseDados.tblANotaFiscal.Filtered     := True;
  End;
if (cmbTipo.Text = 'DEVOLUÇÃO/ENTRADAS') then
  Begin
   formRelNotasEmitidas.qrlTitulo.Caption  := 'RELATÓRIO DE NOTAS DEVOLUÇÃO/ENTRADAS';
   formRelNotasEmitidas.qrlCliente.Caption := 'Fornecedor';
   formRelNotasEmitidas.lblDevl.Enabled    := True;
   formRelNotasEmitidas.lblTotDevl.Enabled := True;
   dmBaseDados.tblANotaFiscal.Filter       := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')and('+ 'Cancelada <>'+QuotedStr('S')+')';
   dmBaseDados.tblANotaFiscal.Filtered     := True;
  End;
dmBaseDados.tblANotaFiscal.First;
fltCanceladas := 0;
fltValidas    := 0;
while (not dmBaseDados.tblANotaFiscal.Eof) do
  Begin
   strCodCli   := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
   strNatureza := dmBaseDados.tblANotaFiscalCFOP.AsString;
   strNatureza := BuscarETroca(strNatureza,'.','');
   if( (edtCliente.Text = '0000')or(edtCliente.Text = dmBaseDados.tblANotaFiscalCodigoCliente.AsString) )then
     begin
      dmBaseDados.tblLogMensal.Append;
      dmBaseDados.tblLogMensalDocumento.AsString        := dmBaseDados.tblANotaFiscalNrNF.AsString;
      dmBaseDados.tblLogMensalFamilia.AsString          := dmBaseDados.tblANotaFiscalPedido.AsString;
      dmBaseDados.tblLogMensalValorLancamento.AsFloat   := dmBaseDados.tblANotaFiscalValorTNF.AsFloat + dmBaseDados.tblANotaFiscalDespesasAC.AsFloat - dmBaseDados.tblANotaFiscalDesconto.AsFloat;
      dmBaseDados.tblLogMensalCodigoProduto.AsString    := dmBaseDados.tblANotaFiscalCodigoCliente.AsString;
      dmBaseDados.tblLogMensalDescricao.AsString        := dmBaseDados.tblANotaFiscalRazaoSocial.AsString;
      dmBaseDados.tblLogMensalObservacao.AsString       := dmBaseDados.tblANotaFiscalStatus.AsString +'-'+ dmBaseDados.tblANotaFiscalMensagem.AsString;
      dmBaseDados.tblLogMensalNCM.AsString              := strNatureza;
      dmBaseDados.tblLogMensalDataLancamento.AsDateTime := dmBaseDados.tblANotaFiscalDataEmissao.AsDateTime;
      //--
      if (cmbTipo.Text = 'CANCELADAS') then
       begin
        dmBaseDados.tblLogMensalFamilia.AsString      := dmBaseDados.tblANotaFiscalDataCanc.AsString + '   ' +dmBaseDados.tblANotaFiscalPedido.AsString;
        dmBaseDados.tblLogMensalObservacao.AsString   := dmBaseDados.tblANotaFiscalJustificativa.AsString;
       end;
      if (dmBaseDados.tblANotaFiscalCancelada.AsString = 'S') then   // Canceladas
       begin
        dmBaseDados.tblLogMensalValorCheque.AsFloat   := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
       end
      else if (Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) = 'D') then // Devolução/Entrada
       begin
        dmBaseDados.tblLogMensalValorCobranca.AsFloat := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
       end
      else if (dmBaseDados.tblANotaFiscalStatus.AsString = '110') then  // Denegadas
       begin
        dmBaseDados.tblLogMensalValorIPI.AsFloat      := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
       end
      else   // Vendas
       begin
        dmBaseDados.tblLogMensalValorDinheiro.AsFloat := dmBaseDados.tblLogMensalValorLancamento.AsFloat;
       end;
      dmBaseDados.tblLogMensal.Post;
      if( ((cmbTipo.Text = 'DEVOLUÇÃO/ENTRADAS')and(Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) <> 'D'))
       or ((cmbTipo.Text = 'VENDAS')and(Copy(dmBaseDados.tblLogMensalFamilia.AsString,1,1) = 'D'))
       or ((cmbTipo.Text = 'VENDAS')and(dmBaseDados.tblANotaFiscalStatus.AsString = '110')) )then
        begin
         dmBaseDados.tblLogMensal.Delete;
        end;
     end;
   dmBaseDados.tblANotaFiscal.Next;
  End;
if (cmbTipo.Text <> 'CANCELADAS') then
 begin
  formRelNotasEmitidas.qrpNotasEmitidas.Preview;
 end
else
 begin
  formRelNFCanceladas.qrpNotasCanceladas.Preview;
 end;
dmBaseDados.tblANotaFiscal.Filter   := '';
dmBaseDados.tblANotaFiscal.Filtered := False;
dmBaseDados.tblANotaFiscal.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblPedidos.Close;
end;

procedure TformNotasEmitidas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dmBaseDados.tblANotaFiscal.Close;
dmBaseDados.tblLogMensal.Close;
dmBaseDados.tblClientes.Close;
dmBaseDados.tblPedidos.Close;
end;

procedure TformNotasEmitidas.btnCancelarClick(Sender: TObject);
begin
Close;
end;

procedure TformNotasEmitidas.edtClienteClick(Sender: TObject);
begin
formSeekClientes.ShowModal;
edtCliente.Text := dmBaseDados.tblClientesCodigoCliente.AsString;
end;

end.
