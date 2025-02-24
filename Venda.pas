unit Venda;

interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, DB, ComCtrls, TISButton,
     TIGradient, ExtCtrls, TISImagePanel, TISGroupBox, TISRadioGroup;

  type
        RegProduto = record
        Codigo: string[13];
        Descricao: string[219];
        Preco: string[9];
        Taxa: string[3];
        UM: string[3];
    end;

  type
        Base = record
        Sequencial: char;
        Tarefa: array [0..1] of char;
        Tipo: char;
    end;

  type
        RespostaECF = record
        Sequencial: char;
        Tarefa: array [0..1] of char;
        Tipo: char;
        mensagem: array [0..3] of char;
        operacional: char;
        documento: char;
        sinalizadores: array [0..4] of char;
        adicional: array [0..79] of char;
    end;

  type
        StatusECF = record
        Sequencial: char;
        Tarefa: array [0..1] of char;
        Tipo: char;
        secao: array [0..3] of char;
        informacao: array [0..1188] of char;
    end;

  type
        OnLine = record
        Sequencial: char;
        Tarefa: array [0..1] of char;
        Tipo: char;
        controle: char;
        informacao: array [0..512] of char;
    end;
    Type Modal = array[0..19] of array [0..20] of char;
    Type aicms= array[0..15] of array [0..3] of char;

type
        TotalVenda = record
        Documento : Char;
        Status_venda: Char;
        COO : Array [0..5] of char;
        Itens_registrados : Array[0..3] of char;
        Venda_Bruta: Array[0..12] of char;
        Venda_Liquida: Array[0..12] of char;
        Total_a_pagar: Array[0..12] of char;
        Total_pago: Array[0..12] of char;
        Troco: Array[0..12] of char;
end;
type
        tipo_I1 = record
        marca : array[0..20] of char;
        modelo: array[0..20] of char;
        tipo  : array[0..7] of char;
        serie: array[0..21] of char;
        firmware: array[0..8] of char;
        protocolo:Char;
end;

type
        tipo_S1 = record
        versao: array[0..3] of char;
        serie: array[0..21] of char;
        dt_inicializacao: array[0..10] of char;
        hr_inicializacao: array[0..9] of char;
        status: array[0..2] of char;
        capacidade:array[0..4] of char;
        PonteiroA:array[0..8] of char;
        PonteiroB:array[0..8] of char;
        modelo:array[0..20] of char;
        serie_ecf:array[0..21] of char;
        CNPJ:array[0..20] of char;
        IE:array[0..20] of char;
        IM:array[0..20] of char;
        dt_instalacao:array[0..10] of char;
        hr_instalacao:array[0..9] of char;
end;

type
  TformVendasBalcao = class(TForm)
    lblRequisicao      : TLabel;
    fldRequisicao      : TDBText;
    lblDataEmissao     : TLabel;
    fldDataEmissao     : TDBText;
    lblCodigoProduto   : TLabel;
    fldCodigoProduto   : TDBEdit;
    lblQuantidade      : TLabel;
    fldQuantidade      : TDBEdit;
    lblValorVenda      : TLabel;
    grdProdutos        : TDBGrid;
    dblbCliente        : TDBLookupListBox;
    lblCondPgt         : TLabel;
    lblValorTotalVenda : TLabel;
    lblTPagto          : TLabel;
    cmbTPagamento      : TComboBox;
    dbeDataVencimento  : TDBEdit;
    DBLookupListBox1   : TDBLookupListBox;
    Label3             : TLabel;
    ckbDesconto        : TCheckBox;
    ckbOrc: TCheckBox;
    ProgressBar1: TProgressBar;
    Barra: TStatusBar;
    Memo1: TMemo;
    forma: TComboBox;
    Label9: TLabel;
    EdProduto: TMaskEdit;
    Button10: TButton;
    Button3: TButton;
    EdDescricao2: TMemo;
    SpeedButton1: TSpeedButton;
    EdQtde: TMaskEdit;
    EdPreco2: TMaskEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    EdTaxa2: TComboBox;
    EdRepete: TMaskEdit;
    Tempo: TMaskEdit;
    LabelPorta: TLabel;
    Label4: TLabel;
    fldLocalizacao: TDBText;
    rdbVia1: TTISRadioButton;
    rdbVia2: TTISRadioButton;
    rdbVia3: TTISRadioButton;
    Label5: TLabel;
    btnNovo: TTISButton;
    btnExcluir: TTISButton;
    btnReimpressao: TTISButton;
    btnFiscal: TTISButton;
    btnGrava: TTISButton;
    btnImprime: TTISButton;
    btnRetornar: TTISButton;
    btnCancelaCupom: TTISButton;
    btnProdutos: TTISButton;
    dblkVendedor: TComboBox;
    TIGradient1: TTIGradient;
    rdgTipoPedido: TTISRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoAntClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure fldCodigoProdutoExit(Sender: TObject);
    procedure fldQuantidadeExit(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
    procedure dbeDataVencimentoExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grdProdutosColExit(Sender: TObject);
    procedure grdProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure dblbClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeDataVencimentoKeyPress(Sender: TObject; var Key: Char);
    procedure cmbTPagamentoKeyPress(Sender: TObject; var Key: Char);
    procedure fldCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure dblkVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure fldQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btnReimpressaoClick(Sender: TObject);
    procedure btnFiscalClick(Sender: TObject);
    procedure btnCancelaCupomClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
  private
  { Private declarations }
  public
  { Public declarations }
   procedure CapturaStatus;
   function MensagemError(CodError:string):String;
   function MandaComando:Boolean;
   function ObtemResposta:Boolean;
  end;

var formVendasBalcao: TformVendasBalcao;
    fltEmpresa, fltRepresentante, fltVParcela, strAcrescimo,
    strTotTrib, strTribFed, strTribEst, strTribMun : Double;
    fltValorTotal, strDesconto, strVBruto, fltRecebido : Double;
    strReqSaida, strDigiteCliente, strCliente, strNPedido,
    strData, strVendedor, strVoltaTipoVenda, strMsgComp : String;
    intParcelas, intConfImp : Integer;
    strTotal, strQtde : Double;
    Comando  : array[0..512] of Char;    // Buffer de transmissao
    Resposta : array[0..1200] of Char;   // Buffer de recepcao
    Conteudo : RespostaECF;              // Retorno dos comandos (exceto status)
    Status : StatusECF;                  // Retorno dos comandos de Status
    LeituraOnLine : Online;              // Retorno da captura de texto online
    retorno : longint;                   // Retorno das funcoes ECFWriteSerial e ECFReadSerial
    pagamento : Modal;                   // Legendas dos meios de pagamento
    StatusDocumento : TotalVenda;        // Totais do cupom fiscal
    StatusModelo : Tipo_I1;              // Dados do modelo de ECF + versão etc
    StatusMFD : Tipo_S1;                 // Dados da MFD: serie, capacidade etc
    aliquota_icms, ALiquota_Iss : aicms; // Alíquotas de Icms
    Header : Base;
    capacidadeb,consumob, consumop : real; // variaveis para apurar o % de consumo da MFD

implementation

uses MenuPrincipal, RotinasGerais, ListaProduto, RelVendas,
     AlteraValor, SeekClientes, DigitacaoPedido, ModuloDados,
     SeekClientes2, RelECF, MaskUtils, Desconto, aviso, Unit1,
     TextoOnline, CheckCGC, FormaPagamento, TesteSat, TipoVenda, RotinasSAT;


{$R *.DFM}


function TformVendasBalcao.MandaComando:Boolean;
begin
{
retorno := -3;
while (retorno = -3) do
 begin
  retorno := ECFWriteSerial(Comando,Strlen(Comando),'serial');
  if (retorno = -3) then ShowMessage('Aguarde ...');
 end;
if (retorno <> 0) then
 begin
  ShowMessage('Erro no envio do comando');
  Result := False;
 end
else Result := ObtemResposta();
}
end;

function TformVendasBalcao.ObtemResposta:Boolean;
var capturatexto : Boolean;
begin
{
Resposta:=#0; capturatexto:=false;
CopyMemory(@Conteudo,@Resposta,94);
CopyMemory(@Header,@Resposta,4);
CopyMemory(@Status,@Resposta,515);
while true do
  Begin
   Resposta:=#0;
   CopyMemory(@LeituraOnLine,@Resposta,512);
   if not (copy(comando,2,2)='34') then FormAviso.Show;
   FormAviso.Refresh;
   retorno := ECFReadSerial(Resposta,1200,'serial');
   if retorno = -1 then ShowMessage('Falha na comunicação')
   else if retorno = -2 then ShowMessage('Excedido o tamanho da resposta')
   else if retorno = -3 then break //Protocolo ocupado
   else if retorno > 0 then
    begin
     CopyMemory(@Header,@Resposta,4);
     if ( Header.Tarefa='00' ) and ( Header.Tipo='!' ) then // resposta de alteração de status
      begin
       CopyMemory(@Conteudo,@Resposta,retorno);
       if Conteudo.Mensagem <> '0000' then showMessage(MensagemError(Conteudo.Mensagem))
       else FormAviso.Close;
       FormAviso.Refresh;
      end
     else if (( Header.Tarefa='44' ) OR (Header.Tarefa = '45') ) and ( Header.Tipo='!' ) then // resposta de alteração de status
      begin
       CopyMemory(@Conteudo,@Resposta,retorno);
       if (Conteudo.mensagem = '0228') then // inicio da transmissão do texto
        capturatexto:=true;
       if (Conteudo.mensagem = '0217') then // percentual de processmento
        begin
         ProgressBar1.visible:=true;
         ProgressBar1.position:=StrToInt(Copy(Conteudo.adicional,1,3));
         ProgressBar1.Refresh;
        end
      end
     else if (( Header.Tarefa='44' ) OR (Header.Tarefa = '45') ) and ( Header.Tipo='>' ) then // resposta de alteração de status
      begin
       if capturatexto then
        begin
         CopyMemory(@LeituraOnLine,@Resposta,retorno);
         FormTextoOnLine.Show;
         FormTextoOnLine.TextoOnLine.Text:= FormTextoOnLine.TextoOnLine.Text+LeituraOnLine.informacao;
         FormTextoOnLine.TextoOnLine.Refresh;
        end
      end
     else if ( Header.Tarefa='34') and ( Header.Tipo='+') then // Retorno de Status
      begin
       CopyMemory(@Conteudo,@Resposta,retorno);
       Barra.Panels[3].Text:=MensagemError(Conteudo.mensagem);
      end
     else if Header.Tarefa='34' then // Retorno de Status
      begin
       CopyMemory(@Status,@Resposta,retorno);
       if ( status.tipo='B')  and ( status.secao = '0004') then // legendas dos meios de pagamento
        CopyMemory(@Pagamento,@Status.Informacao,420)
       else if ( status.tipo='D')  and ( status.secao = '0004') then // aliquotas de ICMS
        CopyMemory(@Aliquota_ICMS,@Status.Informacao,60)
       else if ( status.tipo='E')  and ( status.secao = '0004') then // aliquotas de ISS
        CopyMemory(@Aliquota_ISS,@Status.Informacao,60)
       else if ( status.tipo='L')  and ( status.secao = '0001') then // totais do Cupom em Emissão
        CopyMemory(@StatusDocumento,@Status.Informacao,77)
       else if ( status.tipo='I')  and ( status.secao = '0001') then // totais do Cupom em Emissão
        CopyMemory(@StatusModelo,@Status.Informacao,77)
       else if ( status.tipo='S')  and ( status.secao = '0001') then // totais do Cupom em Emissão
        CopyMemory(@StatusMFD,@Status.Informacao,190);
      end
     else
      begin
       CopyMemory(@Conteudo,@Resposta,retorno);
       Barra.Panels[3].Text:=MensagemError(conteudo.mensagem);
      end;
    end;
   if (Header.Tarefa= Copy(comando,2,2)) and ((Header.Tipo='+') or (Header.Tipo='-') ) then
    Break
  End;
FormAviso.Close;
FormAviso.Refresh;
ProgressBar1.visible:=false;
if Header.Tipo='+' then Result := True
else
 begin
  ShowMessage('Erro: '+ Conteudo.Mensagem);
  ObtemResposta := False;
 end;
 }
end;

function TformVendasBalcao.MensagemError(CodError:string):String;
var cod : Integer;
begin
{
cod := StrToInt(CodError);
case Cod of
  00  : MensagemError:=CodError+'-'+'Comando efetuado com sucesso!';
  02  : MensagemError:=CodError+'-'+'Não há documento para cancelar.';
  04  : MensagemError:=CodError+'-'+'Pagamento não finalizado.';
  06  : MensagemError:=CodError+'-'+'Indicado Item inválido.';
  07  : MensagemError:=CodError+'-'+'Item já cancelado.';
  08  : MensagemError:=CodError+'-'+'Apurado total igual a zero.';
  15  : MensagemError:=CodError+'-'+'Cancelamento de acréscimo no subtotal';
  21  : MensagemError:=CodError+'-'+'Alíquota não programada.';
  23  : MensagemError:=CodError+'-'+'Erro de Sintaxe!';
  31  : MensagemError:=CodError+'-'+'Faixa inválida!';
  42  : MensagemError:=CodError+'-'+'Excede o valor do item.';
  51  : MensagemError:=CodError+'-'+'Não foi possivel acumulação em um dos totalizadores';
  53  : MensagemError:=CodError+'-'+'Impossibilita o cancelamento.';
  56  : MensagemError:=CodError+'-'+'Iniciando Intervenção Técnica.';
  57  : MensagemError:=CodError+'-'+'Encerrando Intervenção Técnica.';
  58  : MensagemError:=CodError+'-'+'Comando ou operação inválida!';
  59  : MensagemError:=CodError+'-'+'Dia encerrado!';
  60  : MensagemError:=CodError+'-'+'É necessário emitir Redução Z!';
  61  : MensagemError:=CodError+'-'+'O ECF está em Modo Intervenção Técnica!';
  124 : MensagemError:=CodError+'-'+'Tampa Aberta!';
  125 : MensagemError:=CodError+'-'+'Sem papel!';
  126 : MensagemError:=CodError+'-'+'Avançando papel!';
  127 : MensagemError:=CodError+'-'+'Substituir bobina!';
  134 : MensagemError:=CodError+'-'+'Transmissão via porta serial abortada.';
  216 : MensagemError:=CodError+'-'+'Programar o relógio.';
 end;
 }
end;

procedure TformVendasBalcao.CapturaStatus;
var i:integer; // variaveis para loop
begin
{
Barra.Panels[2].Text:='Capturando informações do modelo';
StrPCopy(Comando,'*34|I1');
if not MandaComando then exit;
{memo1.Lines.Add('Marca: '+StatusModelo.marca);
memo1.Lines.Add('Modelo: '+StatusModelo.modelo);
memo1.Lines.Add('Tipo: '+StatusModelo.tipo);
memo1.Lines.Add('No. de Série: '+StatusModelo.Serie);
memo1.Lines.Add('Firmware: '+StatusModelo.firmware);
memo1.Lines.Add('Protocolo: '+StatusModelo.protocolo);
memo1.Lines.Add(' ');        }      {
Barra.Panels[2].Text:='Capturando informações da MFD';
StrPCopy(Comando,'*34|S1');
if not MandaComando then exit;
{capacidadeb:=StrtoFloat(StatusMFD.Capacidade) * 1024 * 1024;
consumob:=StrToFloat(StatusMFD.PonteiroA)  + StrToFloat(StatusMFD.PonteiroB);
consumop:=(Consumob / Capacidadeb)*100;

memo1.Lines.Add('MFD: '+StatusMFD.serie);
memo1.Lines.Add('CNPJ: '+StatusMFD.CNPJ);
memo1.Lines.Add('I.E.: '+StatusMFD.IE);
memo1.Lines.Add('I.M.: '+StatusMFD.IM);
memo1.Lines.Add(' ');
memo1.Lines.Add('Capacidade: '+StatusMFD.capacidade+' MB');
memo1.Lines.Add('Consumo: '+floattostr(consumob)+' bytes ('+Formatfloat ('0.00',consumop)+' %)');  }
{
Barra.Panels[2].Text:='Capturando os meios de pagamento';
StrPCopy(Comando,'*34|B4');
if not MandaComando then exit;
for i:=1 to 20 do formFormaPagamento.EdPagamento.Items.Add(FormatFloat('00',i)+'-'+Pagamento[i-1]); // captura os meios de pagamento
// Obtem as alíquotas programadas para ICMS
Barra.Panels[2].Text:='Capturando as alíquotas de ICMS';
StrPCopy(Comando,'*34|D4');
if not MandaComando then exit;
 try
  for i:=1 to 15 do
   begin
    //EdTaxa2.Items.Add('T'+FormatFloat('00.00',StrtoFloat(aliquota_ICMS[i-1])/100)+'%'); // captura os meios de pagamento
   end
  except
 end;
// Obtem as alíquotas programadas para ISS
StrPCopy(Comando,'*34|E4');
if not MandaComando then exit;
 try
  for i:=1 to 15 do
   begin
    //EdTaxa2.Items.Add('S'+FormatFloat('00.00',StrtoFloat(aliquota_ISS[i-1])/100)+'%'); // captura os meios de pagamento
   end
  except
 end;
 }
end;

procedure TformVendasBalcao.FormShow(Sender: TObject);
var strAno, strRequisicao, strNomeO : String;
    intTamanho, intRequisicao,
    velocidade, tt, numporta : Integer;
    wrdDia, wrdMes, wrdAno : Word;
begin
rdbVia1.Checked := True;
strDesconto := 0;
strVBruto   := 0;
strTotTrib  := 0;
strTribFed  := 0;
strTribEst  := 0;
strTribMun  := 0;
ckbDesconto.Checked := False;
ckbOrc.Checked      := False;
rdgTipoPedido.ItemIndex := -1;
intParcelas := 1;
if (frmDigitacaoPedido.mskRequisicao.Text = ('        ')) then
 begin
  dmBasedados.tblSaida.EmptyTable;
 end
else
 begin
  intRequisicao := StrToInt(Copy(frmDigitacaoPedido.mskRequisicao.text,1,6));
 end;
dmBasedados.tblSaida.Open;
dmBaseDados.tblSaida.IndexName := 'IndOrdem';
dmBaseDados.tblProdutos.Open;
dmBasedados.tblRequisicoes.Open;
dmBaseDados.tblClientes.Open;
dmBaseDados.tblClientes.First;
if (strCliente <> '') then
 begin
  dmBaseDados.tblClientes.Locate('CodigoCliente',strCliente,[loCaseInsensitive]);
 end
else
 begin
  dmBaseDados.tblClientes.Locate('NomeCliente','CONSUMIDOR',[loCaseInsensitive]);
 end;
dmBaseDados.tblFornecedores.Open;
dmBaseDados.tblFuncionarios.Open;
dmBaseDados.tblFuncionarios.First;
dblkVendedor.Items.Clear;
dblkVendedor.Items.Append(Usuario);
if (strCodOper <> '') then
 begin
  dmBaseDados.tblFuncionarios.Locate('CodigoFuncionario',strCodOper,[loCaseInsensitive]);
  strNomeO := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
  dblkVendedor.Items.Append(strNomeO);
 end;
// Alimentando o combobox do Operador
dmBaseDados.tblFuncionarios.First;
strNomeO := '';
dblkVendedor.Items.Append(strNomeO);
while (not dmBaseDados.tblFuncionarios.Eof) do
 begin
  strNomeO := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
  dblkVendedor.Items.Append(strNomeO);
  dmBaseDados.tblFuncionarios.Next;
 end;
lblValorTotalVenda.Caption := '';
if (frmDigitacaoPedido.mskRequisicao.Text = ('        ')) then
  begin
   btnImprime.Enabled      := False;
   btnFiscal.Enabled       := False;
   btnCancelaCupom.Enabled := False;
   btnGrava.Enabled        := False;
   btnExcluir.Enabled      := False;
   btnNovo.Enabled         := True;
   btnReimpressao.Enabled  := False;
   dblkVendedor.Text       := '';
  end
else
  begin
   btnImprime.Enabled  := True;
   btnGrava.Enabled    := True;
   btnExcluir.Enabled  := True;
   btnNovo.Enabled     := True;
  end;
cmbTPagamento.ItemIndex := 0;
DecodeDate(Date,wrdAno,WrdMes,WrdDia);
strAno        := IntToStr(wrdAno);
intTamanho    := Length(strAno);
strAno        := copy('00'+strAno,intTamanho+1,2);
if (dmBaseDados.tblRequisicoes.RecordCount <> 0)and(frmDigitacaoPedido.mskRequisicao.Text = ('        ')) then
  Begin
   {Caso mskRequisicao=0, abrirá um novo pedido com o número seguinte ao último registro da tblRequisicoes}
   intRequisicao := 0;
   dmBaseDados.tblRequisicoes.Last;
   intRequisicao := StrToInt(Copy(dmBaseDados.tblRequisicoesNumeroRequisicao.AsString,1,6));
   Inc(intRequisicao);
   strRequisicao := IntToStr(intRequisicao);
   intTamanho    := Length(strRequisicao);
   strRequisicao := Copy('000000'+strRequisicao,intTamanho+1,6);
   strReqSaida   := strRequisicao+strAno;
   strRequisicao := strRequisicao+'/'+strAno;
   dmBaseDados.tblRequisicoes.Append;
   dmBaseDados.tblRequisicoesNumeroRequisicao.AsString := strRequisicao;
   dmBaseDados.tblRequisicoesDataEmissao.AsDateTime    := Date;
   dmBaseDados.tblRequisicoes.Post;
   dmBaseDados.tblRequisicoes.FlushBuffers;
   dmBaseDados.tblSaida.Append;
   dmBaseDados.tblSaidaNumeroRequisicao.AsString := strReqSaida;
   dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
   dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
   dmBaseDados.tblSaidaDataVencimento.AsDateTime := Date;
   dmBaseDados.tblSaida.Post;
   fldCodigoProduto.SetFocus;
   if (strAno <> Copy(dmBaseDados.tblRequisicoesNumeroRequisicao. AsString,8,2)) then
   intRequisicao := 0;
  End
else
  Begin
   {Caso mskRequisicao <> 0, mostrará o número digitado no campo 'intRequisicao' e seus itens; não somando '+1' no número digitado e não gravando-o na tblRequisicoes}
   intRequisicao := StrToInt(Copy(frmDigitacaoPedido.mskRequisicao.text,1,6));
   strRequisicao := IntToStr(intRequisicao);
   intTamanho    := Length(strRequisicao);
   strRequisicao := Copy('000000'+strRequisicao,intTamanho+1,6);
   strReqSaida   := strRequisicao+strAno;
   strRequisicao := strRequisicao+'/'+strAno;
   dmBaseDados.tblRequisicoes.Append;
   dmBaseDados.tblRequisicoesNumeroRequisicao.AsString := strRequisicao;
   dmBaseDados.tblRequisicoesDataEmissao.AsDateTime    := Date;
   dmBaseDados.tblSaida.Edit;
   dmBaseDados.tblSaidaNumeroRequisicao.AsString := strReqSaida;
   dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
   dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
   dmBaseDados.tblSaidaDataVencimento.AsDateTime := Date;
   dmBaseDados.tblSaida.Post;
   dblbCliente.SetFocus;
  End;
dblkVendedor.ItemIndex := 0;
end;

procedure TformVendasBalcao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Stts := '';
dmBaseDados.tblECF.Close;
dmBaseDados.tblSaida.Close;
dmBaseDados.tblProdutos.Close;
dmBaseDados.tblClientes.Close;
dmBaseDAdos.tblRelVendas.Close;
dmBaseDados.tblRequisicoes.Close;
dmBaseDados.tblFuncionarios.Close;
dmBaseDados.tblFornecedores.Close;
dmBaseDados.tblContasReceber.Close;
end;

procedure TformVendasBalcao.btnNovoAntClick(Sender: TObject);
var DataVen : TDateTime;
begin
DataVen := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
dmBaseDados.tblSaida.Append;
dmBaseDados.tblSaidaNumeroRequisicao.AsString := strReqSaida;
dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
dmBaseDados.tblSaidaDataVencimento.AsDateTime := DataVen;
dmBaseDados.tblSaida.Post;
fldCodigoProduto.SetFocus;
btnExcluir.Enabled := True;
end;

procedure TformVendasBalcao.btnExcluirClick(Sender: TObject);
var fltValor : Double;
begin
if (Application.MessageBox('Deseja Excluir?','Confirma?',MB_YESNO) = IDYES) then
  Begin
   fltValor := 0;
   dmBaseDados.tblSaida.Delete;
   dmBaseDados.tblSaida.DisableControls;
   dmBaseDados.tblSaida.First;
   while (not dmBaseDados.tblSaida.Eof) do
    begin
     fltValor := fltValor + dmBaseDados.tblSaidaValorTotal.AsFloat;
     dmBaseDados.tblSaida.Next;
    end;
   dmBaseDados.tblSaida.EnableControls;
   lblValorTotalVenda.Caption := FloatToStr(fltValor);
  End;
end;

procedure TformVendasBalcao.btnCancelarClick(Sender: TObject);
begin
dmBaseDados.tblRequisicoes.Edit;
dmBaseDados.tblRequisicoesSituacao.AsString := 'C';
dmBaseDados.tblRequisicoes.Post;
Close;
end;

procedure TformVendasBalcao.btnRetornarClick(Sender: TObject);
begin
dmBaseDados.tblECF.Close;
dmBaseDAdos.tblRelVendas.Close;
dmBaseDados.tblContasReceber.Close;
dmBaseDados.tblSaida.IndexName := '';
intConfImp := 0;
Close;
end;

procedure TformVendasBalcao.btnGravaClick(Sender: TObject);
var strCodFamilia, strCodCategoria, strCodProduto,
    strMes, strAno, strVazio : String;
    TotalPedido, intQuantidade, fltValor : Double;
    intTamanho, intContador : Integer;
    wrdDia, wrdMes, wrdAno : Word;
    dtdDataVencimento : TDateTime;            
begin
if( (dblkVendedor.Text = '')or(dblkVendedor.Font.Color = clWhite) )then
 begin
  Application.MessageBox('ATENÇÃO, SELECIONE O OPERADOR!','A T E N Ç Ã O!',MB_ICONEXCLAMATION);
  Abort;
 end;
if (rdgTipoPedido.ItemIndex = -1) then
 begin
  Application.MessageBox('Informar se o pedido é de Balcão ou Entrega!','A T E N Ç Ã O!',MB_ICONEXCLAMATION);
  Abort;
 end;
//--
formTipoVenda.ShowModal;
if (strVoltaTipoVenda = 'SIM') then
 begin
  Abort;
 end;
//--
FormAlterarValor.GpDesconto.Visible     := False;         
FormAlterarValor.gpbOutrasDatas.Visible := True;                    
FormAlterarValor.edtCliente.Visible     := True;
FormAlterarValor.edtCliente.Text        := dmBaseDados.tblClientesNomeCliente.AsString;
if (ckbDesconto.Checked = True)  then
 begin
  FormDesconto.ShowModal;
  FormAlterarValor.gpbOutrasDatas.Visible := False;
  FormAlterarValor.GpDesconto.Visible     := True;
  FormAlterarValor.ShowModal;
 end
else
 begin
  FormAlterarValor.ShowModal;
 end;
TotalPedido := 0;
strTotTrib  := 0;
strTribFed  := 0;
strTribEst  := 0;
strTribMun  := 0;
dmBaseDados.tblHistorico.Open;
dmBaseDados.tblPedidos.Open;
dmBaseDados.tblIbpt.Open;
dmBaseDados.tblSaida.Edit;
if( (Stts = '1')or(SttsOrc = '1') )then
 Begin
  dmBaseDados.tblPedidos.First;
  dmBaseDados.tblPedidos.Locate('NPedido',NPedido,[loCaseInsensitive]);
  while( (dmBaseDados.tblPedidosNPedido.AsString = NPedido)and(not dmBaseDados.tblPedidos.Eof) )do
   begin
    dmBaseDados.tblPedidos.Delete;
   end;
 End;
dmBaseDados.tblFuncionarios.First;
dmBaseDados.tblFuncionarios.Locate('NomeFuncionario',dblkVendedor.Text,[loCaseInsensitive]);
if( (dmBaseDados.tblSaida.State = dsInsert)or(dmBaseDados.tblSaida.State = dsEdit) )then
  Begin
   dmBaseDados.tblSaidaValorTotal.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsFloat;
   dmBaseDados.tblSaida.Post;
   dmBaseDados.tblSaida.First;
   while (not dmbaseDados.tblSaida.Eof) do
     BEGIN
      strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
      strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
      strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
      intQuantidade   := dmBaseDados.tblSaidaQuantidade.AsFloat;
      DecodeDate(dmBaseDados.tblSaidaDataLancamento.AsDateTime,wrdAno,wrdMes,wrdDia);
      strMes          := IntToStr(wrdMes);
      intTamanho      := Length(strMes);
      strMes          := Copy('00'+strMes,intTamanho+1,2);
      strAno          := IntToStr(wrdAno);
      intTamanho      := Length(strAno);
      strAno          := Copy('0000'+strAno,intTamanho+1,4);
      dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]);
      if (ckbOrc.Checked = False) then
       begin
        if (Stts = '') then
         begin
          dmBaseDados.tblProdutos.Edit;
          dmBaseDados.tblProdutosEstoqueAtual.AsFloat := dmBaseDados.tblProdutosEstoqueAtual.AsFloat - intQuantidade;
          dmBaseDados.tblProdutos.Post;
          dmBaseDados.tblProdutos.FlushBuffers;
         end;
       end;
      fltValor := dmBaseDados.tblSaidaValorUnitario.AsFloat;
      dmBaseDados.tblPedidos.Append;
      if (cmbTPagamento.ItemIndex > 4) then
       begin
        dmBaseDados.tblPedidosCodigoFornecedor.AsString := dmBaseDados.tblFornecedoresCodigoFornecedor.AsString;
        dmBaseDados.tblPedidosStatus.AsString := '0';
       end
      else
       if (ckbOrc.Checked = False) then
        begin
         dmBaseDados.tblPedidosStatus.AsString := '1';
        end
       else
        begin
         dmBaseDados.tblPedidosStatus.AsString := '3';
        end;
      dmBaseDados.tblPedidosDesconto.AsFloat               := dmBaseDados.tblSaidaDesconto.AsFloat;
      dmBaseDados.tblPedidosCodigoCliente.AsFloat          := dmBaseDados.tblClientesCodigoCliente.AsFloat;
      dmBaseDados.tblPedidosPagamento.AsString             := cmbTPagamento.Text;
      dmBaseDados.tblPedidosDataEmissao.AsDateTime         := dmBaseDados.tblSaidaDataLancamento.AsDateTime;
      dmBaseDados.tblPedidosDataEmissaoOriginal.AsDateTime := dmBaseDados.tblSaidaDataLancamento.AsDateTime;
      dmBaseDados.tblPedidosVencimento.AsDateTime          := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
      dmBaseDados.tblPedidosCST.AsString                   := dmBaseDados.tblProdutosSituacaoTributaria.AsString;
      dmBaseDados.tblPedidosUnidade.AsString               := dmBaseDados.tblProdutosUnidadeMedida.AsString;
      dmBaseDados.tblPedidosICMS.AsFloat                   := dmBaseDados.tblProdutosIcms.AsFloat;
      dmBaseDados.tblPedidosComissao.AsFloat               := dmBaseDados.tblProdutosComissao.AsFloat-dmBaseDados.tblSaidaComissao.AsFloat;
      dmBaseDados.tblPedidosCusto.AsFloat                  := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat;
      dmBaseDados.tblPedidosCodigoVendedor.AsString        := FloatToStr(dmBaseDados.tblFuncionariosCodigoFuncionario.AsFloat);
      dmBaseDados.tblPedidosVendedor.AsString              := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
      dmBaseDados.tblPedidosProduto.AsString               := dmBaseDados.tblSaidaCodigoProduto.AsString;
      dmBaseDados.tblPedidosCodigoReferencia.AsString      := dmBaseDados.tblSaidaRefFabricante.AsString;
      dmBaseDados.tblPedidosNPedido.AsString               := strReqSaida;
      dmBaseDados.tblPedidosQuantidade.AsFloat             := dmBaseDados.tblSaidaQuantidade.AsFloat;
      //dmBaseDados.tblPedidosPeso.AsFloat                   := dmBaseDados.tblSaidaPeso.AsFloat;
      dmBaseDados.tblPedidosDescricao.AsString             := dmBaseDados.tblSaidaDescricaoProduto.AsString;
      dmBaseDados.tblPedidosUnitario.AsFloat               := dmBaseDados.tblSaidaValorUnitario.AsFloat;
      dmBaseDados.tblPedidosTotal.AsFloat                  := fltValor * intQuantidade;
      dmBaseDados.tblPedidosNCM.AsString  := dmBaseDados.tblProdutosNCM.AsString;
      //-- Calculo Lei da Transparência
        dmBaseDados.tblIbpt.First;
        if (dmBaseDados.tblProdutosNCM.AsString <> '') then
         begin
          dmBaseDados.tblIbpt.Locate('NCM',dmBaseDados.tblProdutosNCM.AsString,[loCaseInsensitive]);
         end;
        dmBaseDados.tblPedidosAliqTrib.AsFloat  := dmBaseDados.tblIbptALIQNAC.AsFloat;
        dmBaseDados.tblPedidosTribFed.AsFloat   := dmBaseDados.tblPedidosTotal.AsFloat * (dmBaseDados.tblIbptNACFEDERAL.AsFloat/100);
        if( (Copy(dmBaseDados.tblPedidosCST.AsString,1,1) = '1')or(Copy(dmBaseDados.tblPedidosCST.AsString,1,1) = '2') )then
         begin
          dmBaseDados.tblPedidosAliqTrib.AsFloat := dmBaseDados.tblIbptALIQIMP.AsFloat;
          dmBaseDados.tblPedidosTribFed.AsFloat  := dmBaseDados.tblPedidosTotal.AsFloat * (dmBaseDados.tblIbptIMPFEDERAL.AsFloat/100);
         end;
        dmBaseDados.tblPedidosVTributos.AsFloat := dmBaseDados.tblPedidosTotal.AsFloat * (dmBaseDados.tblPedidosAliqTrib.AsFloat/100);
        dmBaseDados.tblPedidosTribEst.AsFloat   := dmBaseDados.tblPedidosTotal.AsFloat * (dmBaseDados.tblIbptESTADUAL.AsFloat/100);
        dmBaseDados.tblPedidosTribMun.AsFloat   := dmBaseDados.tblPedidosTotal.AsFloat * (dmBaseDados.tblIbptMUNICIPAL.AsFloat/100);
        dmBaseDados.tblPedidosVTributos.AsFloat := Arredondar(dmBaseDados.tblPedidosVTributos.AsFloat,2);
        dmBaseDados.tblPedidosTribFed.AsFloat   := Arredondar(dmBaseDados.tblPedidosTribFed.AsFloat,2);
        dmBaseDados.tblPedidosTribEst.AsFloat   := Arredondar(dmBaseDados.tblPedidosTribEst.AsFloat,2);
        dmBaseDados.tblPedidosTribMun.AsFloat   := Arredondar(dmBaseDados.tblPedidosTribMun.AsFloat,2);
        //--
        strTotTrib := strTotTrib + dmBaseDados.tblPedidosVTributos.AsFloat;
        strTribFed := strTribFed + dmBaseDados.tblPedidosTribFed.AsFloat;
        strTribEst := strTribEst + dmBaseDados.tblPedidosTribEst.AsFloat;
        strTribMun := strTribMun + dmBaseDados.tblPedidosTribMun.AsFloat;
      //--
      dmBaseDados.tblSaida.Edit;
      dmBaseDados.tblSaidaPeso.AsFloat := dmBaseDados.tblPedidosVTributos.AsFloat;
      dmBaseDados.tblSaida.Post;
      if (rdgTipoPedido.ItemIndex = 0) then
       begin
        dmBaseDados.tblPedidosMotorista.AsString := 'B';
       end
      else
       begin
        dmBaseDados.tblPedidosMotorista.AsString := 'E';
       end;
      dmBaseDados.tblPedidosNomeCli.AsString := strDigiteCliente; 
      dmBaseDados.tblPedidos.Post;
      dmBaseDados.tblPedidos.FlushBuffers;
      if (ckbOrc.Checked = False) then
        Begin
         dmBaseDados.tblHistorico.Append;
         dmBaseDados.tblHistoricoCondPg.AsString           := dmBaseDados.tblSaidaCondPg.AsString;
         dmBaseDados.tblHistoricoDataLancamento.AsDateTime := dmBaseDados.tblSaidaDataLancamento.AsDateTime;
         dmBaseDados.tblHistoricoCodigoMovimento.AsString  := 'S';
         dmBaseDados.tblHistoricoCodigoCliente.AsFloat     := dmBaseDados.tblClientesCodigoCliente.AsFloat;
         dmBaseDados.tblHistoricoClienteFornecedor.AsString := dmBaseDados.tblClientesNomeCliente.AsString;
         dmBaseDados.tblHistoricoCodigoVendedor.AsFloat     := dmBaseDados.tblFuncionariosCodigoFuncionario.AsFloat;
         dmBaseDados.tblHistoricoNomeVendedor.AsString      := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
         dmBaseDados.tblHistoricoCodigoProduto.AsString     := dmBaseDados.tblSaidaCodigoProduto.AsString;
         dmBaseDados.tblHistoricoNumeroRequisicao.AsString  := strReqSaida;
         dmBaseDados.tblHistoricoQuantidade.AsFloat         := dmBaseDados.tblSaidaQuantidade.AsFloat;
         dmBaseDados.tblHistoricoOperador.AsString          := Usuario;
         dmBaseDados.tblHistoricoDataVencimento.AsDateTime  := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
         dmBaseDados.tblHistoricoStatus.AsString            := 'S';
         if (cmbTPagamento.ItemIndex = 6) then
          begin
           dmBaseDados.tblHistoricoValorCusto.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat;
          end
         else
          begin
           dmBaseDados.tblHistoricoValorCusto.AsFloat := dmBaseDados.tblProdutosValorUnitarioAtual.AsFloat * intQuantidade;
          end;
         dmBaseDados.tblHistoricoPeso.AsFloat         := dmBaseDados.tblProdutosPeso.AsFloat * intQuantidade;
         if (cmbTPagamento.ItemIndex > 4) then
          begin
           dmBaseDados.tblHistoricoValorLancamento.AsFloat := 0;
           if (cmbTPagamento.ItemIndex = 7) then
            begin
             dmBaseDados.tblHistoricoValorCusto.AsFloat := 0;
             dmBaseDados.tblHistoricoQuantidade.AsFloat := 0;
             dmBaseDados.tblHistoricoPeso.AsFloat       := 0;
            end;
          end
         else
          begin
           dmBaseDados.tblHistoricoValorLancamento.AsFloat := fltValor * intQuantidade;
          end;
         dmBaseDados.tblHistoricoMesAno.AsString := strMes+'/'+strAno;
         TotalPedido := TotalPedido + dmBaseDados.tblHistoricoValorLancamento.Asfloat;
         dmBaseDados.tblHistorico.Post;
        End;
      dmBaseDados.tblHistorico.FlushBuffers;
      dtdDataVencimento := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
      dmBaseDados.tblSaida.Next;
     END;
   if (rdgTipoPedido.ItemIndex = 1) then // Entrega
    Begin
     dmBaseDados.tblEntregas.Open;
     dmBaseDados.tblEntregas.Append;
     dmBaseDados.tblEntregasPedidos.AsString := strReqSaida;
     dmBaseDados.tblEntregasDestino.AsString := dmBaseDados.tblClientesNomeCliente.AsString;
     dmBaseDados.tblEntregasCodCli.AsInteger := dmBaseDados.tblClientesCodigoCliente.AsInteger;
     dmBaseDados.tblEntregasData.AsDateTime  := Date;
     dmBaseDados.tblEntregas.Post;
     dmBaseDados.tblEntregas.Close;
    End;
   if (ckbOrc.Checked = False) then
     Begin
      if (dmBaseDados.tblPedidosCodigoCliente.AsFloat <> 1) then
       Begin
        dmBaseDados.tblContasReceber.Open;
        intContador:=intParcelas;
        while( (cmbTPagamento.ItemIndex < 5)and(intContador > 0) )do
         begin
          Case intContador of
           4: dtdDataVencimento := StrToDate(FormAlterarValor.mskData4.Text);
           3: dtdDataVencimento := StrToDate(FormAlterarValor.mskData3.Text);
           2: dtdDataVencimento := StrToDate(FormAlterarValor.mskData2.Text);
           1: dtdDataVencimento := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
          end;
          dmBaseDados.tblContasReceber.Append;
          dmBaseDados.tblContasReceberDataVencimento.AsDateTime := dtdDataVencimento;
          dmBaseDados.tblContasReceberFormaPagamento.AsString   := cmbTPagamento.Text;
          dmBaseDados.tblContasReceberCodCli.AsFloat            := dmBaseDados.tblClientesCodigoCliente.AsFloat;
          dmBaseDados.tblContasReceberNumeroCIC.AsString        := dmBaseDados.tblClientesNumeroCIC.AsString;
          dmBaseDados.tblContasReceberNumeroDocumento.AsString  := dmBaseDados.tblSaidaNumeroRequisicao.AsString;
          dmBaseDados.tblContasReceberCliente.AsString          := dmBaseDados.tblClientesNomeCliente.AsString;
          dmBaseDados.tblContasReceberDataEmissao.AsDateTime    := dmBaseDados.tblRequisicoesDataEmissao.AsDateTime;
          dmBaseDados.tblContasReceberVendedor.AsString         := FloatToStr(dmBaseDados.tblFuncionariosCodigoFuncionario.AsFloat);
          dmBaseDados.tblContasReceberParcelas.AsString         := IntToStr(intContador)+'/'+IntToStr(intParcelas);
          dmBaseDados.tblContasReceberValorDocumento.AsFloat    := TotalPedido/intParcelas;
          dmBaseDados.tblContasReceberMotorista.AsString        := '000';
          dmBaseDados.tblContasReceber.Post;
          dmBaseDados.tblContasReceber.FlushBuffers;
          intContador := intContador - 1;
         end;
        fltVParcela := TotalPedido/intParcelas;
        dmBaseDados.tblContasReceber.Close;
       End;
     End;
  End;
dmBaseDados.tblHistorico.Close;
dmBaseDados.tblPedidos.Close;
dmBaseDados.tblIbpt.Close;
if (frmDigitacaoPedido.ckbNaoFiscal.Checked = True) then
 begin
  btnImprime.Enabled      := True;
  btnFiscal.Enabled       := False;
  btnNovo.Enabled         := False;
  btnExcluir.Enabled      := False;
  btnRetornar.Enabled     := True;
  btnGrava.Enabled        := False;
  btnCancelaCupom.Enabled := False;
 end
else
 begin
  btnImprime.Enabled      := True;
  btnFiscal.Enabled       := True;
  btnNovo.Enabled         := False;
  btnExcluir.Enabled      := False;
  btnRetornar.Enabled     := True;
  btnGrava.Enabled        := False;
  btnCancelaCupom.Enabled := True;
 end;
end;

procedure TformVendasBalcao.fldCodigoProdutoExit(Sender: TObject);
var strCodFamilia, strCodCategoria,
    strCodProduto, strProduto : String;
    strValor : Double;
begin
strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
strProduto      := dmBaseDados.tblSaidaCodigoProduto.AsString;
If (fldCodigoProduto.Text <> '') then
  BEGIN
   if( (dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria,strCodProduto]))
    or (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante',strProduto,[LOCASEINSENSITIVE])  = True)
    or (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante2',strProduto,[LOCASEINSENSITIVE]) = True)
    or (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante3',strProduto,[LOCASEINSENSITIVE]) = True)
    or (dmBaseDados.tblProdutos.Locate('ReferenciaFabricante4',strProduto,[LOCASEINSENSITIVE]) = True)
    or (dmBaseDados.tblProdutos.Locate('CodigoInterno',strProduto,[LOCASEINSENSITIVE]) = True)
    or (dmBaseDados.tblProdutos.Locate('CodigoBarra',strProduto,[LOCASEINSENSITIVE])   = True) ) then
     Begin
      dmBaseDados.tblSaida.Edit;
      if (dmBaseDados.tblSaidaValorUnitario.AsFloat = strValor) then
       begin
        dmBaseDados.tblSaidaValorUnitario.AsFloat:=dmBaseDados.tblProdutosValorVenda.AsFloat;
       end;
      dmBaseDados.tblSaidaDescricaoProduto.AsString  :=dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
      dmBaseDados.tblSaidaClienteFornecedor.AsString := dmBaseDados.tblClientesNomeCliente.AsString;
      if dmBaseDados.tblSaidaCodigoProduto.AsString = '9999999999-9' then
       begin
        dmBaseDados.tblSaidaCodigoProduto.AsString := dmBaseDados.tblProdutosDescricaoAbreviada.AsString;
       end;
      dmBaseDados.tblSaidaCodCliFor.AsFloat      := dmBaseDados.tblClientesCodigoCliente.AsFloat;
      dmBaseDados.tblSaidaCodVen.AsFloat         := dmBaseDados.tblFuncionariosCodigoFuncionario.AsFloat;
      dmBaseDados.tblSaidaVendedor.AsString      := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
      dmBaseDados.tblSaidaCodigoProduto.AsString := dmBaseDados.tblProdutosCodigo.AsString;
      dmBaseDados.tblSaidaRefFabricante.AsString := dmBaseDados.tblProdutosReferenciaFabricante.AsString;
      if dmBaseDados.tblSaidaRefFabricante.AsString = '9' then
       begin
        dmBaseDados.tblSaidaCodigoProduto.AsString := dmBaseDados.tblSaidaIDRegistro.AsString;
       end;
      dmBaseDados.tblSaidaQtdeCx.AsFloat          := dmBaseDados.tblProdutosICMS.AsFloat;
      dmBaseDados.tblSaidaUnidade.AsString        := dmBaseDados.tblProdutosUnidadeMedida.AsString;
      dmBaseDados.tblSaida.Post;
      fldQuantidade.SetFocus;
      {if (dmBaseDados.tblProdutosEstoqueAtual.AsFloat <= 0) then
        begin
         if (Application.MessageBox('ATENÇÃO!!!!!!ESTOQUE ZERADO!!!!','Excluir Item do Pedido??',MB_YESNO)) = IDYES then
          begin
           dmBaseDados.tblSaida.Delete;
           dbeDataVencimento.SetFocus;
           btnNovo.Enabled := true;
          end;
        end;}
     End
   else
     Begin
      if (dmBaseDados.tblSaidaRefFabricante.AsString <> '9') then
       begin
        Mensagem('Código do produto não encontrado !');
        fldCodigoProduto.SetFocus;
       end;
     End;
  END;
end;

procedure TformVendasBalcao.fldQuantidadeExit(Sender: TObject);
var strquantidade, strContador, fltDesconto,
    fltComissao, Dias : Double;
    DiasPagamento, PriD, SegD : TDateTime;
    Dia, Mes, Ano : Word;
begin
if (fldQuantidade.Text <> '') then
  Begin
   strquantidade := StrToFloat (fldQuantidade.Text);
   fltEmpresa       := 1;
   fltRepresentante := 1;
   dmBaseDados.tblSaida.Edit;
   if (ckbDesconto.Checked = True) then
    begin
     FormAlterarValor.gpbOutrasDatas.Visible := False;
     FormAlterarValor.GpDesconto.Visible     := True;
     FormAlterarValor.ckbComDesconto.Checked := True;
     FormAlterarValor.edtEmpresa.Text := '10';
    end;
   fltDesconto := dmBaseDados.tblSaidaValorUnitario.AsFloat;
   if (cmbTPagamento.ItemIndex = 6) then
    begin
     dmBaseDados.tblSaidaValorUnitario.AsFloat := 0;
     fltValorTotal := 0;
    end;
   dmBaseDados.tblSaidaValorUnitario.AsFloat := (dmBaseDados.tblSaidaValorUnitario.AsFloat * fltEmpresa) * fltRepresentante;//StrToFloat(FloatToStrF((dmBaseDados.tblSaidaValorUnitario.AsFloat*fltEmpresa)*fltRepresentante,ffNumber,12,2));
   dmBaseDados.tblSaidaValorUnitario.AsFloat := Arredondar(dmBaseDados.tblSaidaValorUnitario.AsFloat,2);
   dmBaseDados.tblSaidaValorTotal.AsFloat    := dmBasedados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsFloat;
   dmBaseDados.tblSaidaDesconto.AsFloat      := (fltDesconto-dmBaseDados.tblSaidaValorUnitario.AsFloat)*dmBaseDados.tblSaidaQuantidade.AsFloat;
   dmBaseDados.tblSaidaComissao.AsFloat      := StrToFloat(FormAlterarValor.edtRepresentante.Text);
   dmBaseDados.tblSaida.Post;
   dmBaseDados.tblSaida.DisableControls;
   dmBasedados.tblSaida.First;
   fltValorTotal := 0;
   strContador   := 0;
   while (not dmBaseDados.tblSaida.Eof) do
    begin
     fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
     strContador   := strContador+1;
     dmBaseDados.tblSaida.Next;
    end;
   dmBaseDados.tblSaida.EnableControls;
   lblValorTotalVenda.Caption := FloatToStrF(fltValorTotal,ffCurrency,12,2);
   btnGrava.Enabled    := True;
   btnRetornar.Enabled := True;
   btnNovo.Enabled     := True;
   if (dmBaseDados.tblSaidaCodigoProduto.AsString = '999') then
    begin
     grdProdutos.SetFocus;
    end;
  End;
end;

procedure TformVendasBalcao.btnImprimeClick(Sender: TObject);
var strValor, strCodFamilia, strCodCategoria,
    strCodProduto, strDescricao, strUnidade, strDsc,
    strFPgto, strCdDesc, strDc, strRDesc : String;
    PortaLPT : TextFile;
begin                                                  
intConfImp := 1;
dmBaseDados.tblRelVendas.EmptyTable;
dmBaseDados.tblRelVendas.Open;
dmBaseDados.tblContasReceber.Open;     
dmBaseDados.tblSaida.IndexName := 'IndOrdem';
dmBaseDados.tblSaida.DisableControls;
dmBaseDados.tblSaida.First;
strTotal := 0;
strQtde  := 0;
while (not dmBaseDados.tblSaida.Eof) do
  Begin
   strCodFamilia   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,1,3);
   strCodCategoria := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,4,3);
   strCodProduto   := Copy(dmBaseDados.tblSaidaCodigoProduto.AsString,7,6);
   dmBaseDados.tblProdutos.FindKey([strCodFamilia,strCodCategoria, strCodProduto]);
   strDescricao    := dmBaseDados.tblSaidaDescricaoProduto.AsString;
   strUnidade      := dmBasedados.tblProdutosUnidadeMedida.AsString;
   dmBasedados.tblRelVendas.Append;
   dmBaseDados.tblRelVendasCodigoProduto.AsString := dmBaseDados.tblSaidaCodigoProduto.AsString;
   dmBaseDados.tblRelVendasRefFabricante.AsString := dmBaseDados.tblSaidaRefFabricante.AsString;
   if (dmBaseDados.tblSaidaRefFabricante.AsString = '') then
    begin
     dmBaseDados.tblRelVendasRefFabricante.AsString := dmBaseDados.tblSaidaCodigoProduto.AsString;
    end;
   dmBaseDados.tblRelVendasDescricao.AsString     := strDescricao;
   dmBaseDados.tblRelVendasUnidade.AsString       := strUnidade;
   dmBaseDados.tblRelVendasQuantidade.AsFloat     := dmBaseDados.tblSaidaQuantidade.AsFloat;
   dmBaseDados.tblRelVendasValorUnitario.AsFloat  := dmBaseDados.tblSaidaValorUnitario.AsFloat;
   dmBaseDados.tblRelVendasValorTotal.AsFloat     := dmBaseDados.tblSaidaValorTotal.AsFloat;
   dmBaseDados.tblRelVendasVencimento.AsDateTime  := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
   dmBaseDados.tblRelVendas.Post;
   strTotal := strTotal + dmBaseDados.tblRelVendasValorTotal.AsFloat;
   strQtde  := strQtde  + dmBaseDados.tblRelVendasQuantidade.AsFloat;
   dmBaseDados.tblSaida.Next;
  End;
dmBaseDados.tblSaida.EnableControls;
dmBaseDados.tblFuncionarios.First;
dmBaseDados.tblFuncionarios.Locate('NomeFuncionario',dblkVendedor.Text,[loCaseInsensitive]);
strNPedido  := strReqSaida;
strVendedor := IntToStr(dmBaseDados.tblFuncionariosCodigoFuncionario.AsInteger) +' '+ dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
strData     := 'Data: '+(DateToStr(Date))+'  '+'Hora: '+TimeToStr(Time);
strFPgto    := cmbTPagamento.Text;
//*** IMPRESSÃO DIRETA PARA PORTA LPT *** 1ª Via //42 colunas
//--
   AssignFile(PortaLPT, 'LPT2:');
   Rewrite(PortaLPT);
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '            AUTO PECAS PERFIL      Via: 1 ');
   Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco');
   Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568');
   Writeln(PortaLPT, '==========================================');
   if (ckbOrc.Checked = True) then
    begin
     Writeln(PortaLPT, ' N. Orcamento : ' +strNPedido);
    end
   else
    begin
     Writeln(PortaLPT, ' N. Pedido : ' +strNPedido);
    end;
   Writeln(PortaLPT, '  '+ strData);
   Writeln(PortaLPT, ' Vendedor : '+strVendedor);
   Writeln(PortaLPT, ' Cliente  : '+strDigiteCliente);
   Writeln(PortaLPT, ' Pagamento : '+strFPgto);
   Writeln(PortaLPT, '------------------------------------------');
   if (rdgTipoPedido.ItemIndex = 0) then
    begin
     Writeln(PortaLPT, '               B A L C A O');
    end
   else
    begin
     Writeln(PortaLPT, '               E N T R E G A');
    end;
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, 'Codigo \ Descricao');
   Writeln(PortaLPT, '            Qtde     V.Unit.   V.Total');
   Writeln(PortaLPT, '==========================================');
   dmBaseDados.tblRelVendas.FIRST;
   while (not dmBaseDados.tblRelVendas.Eof) do
    begin
     Writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+' '+dmBaseDados.tblRelVendasDescricao.AsString);
     Writeln(PortaLPT, '             '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
     +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
     +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
     dmBaseDados.tblRelVendas.Next;
    end;
   //--
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
   Writeln(PortaLPT, '          TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',strTotal)));
   Writeln(PortaLPT, '          VALOR BRUTO   :  '+(FormatCurr('###,##0.00',strVBruto)));
   Writeln(PortaLPT, '          DESCONTO      :  '+(FormatCurr('###,##0.00',strDesconto)) );
   Writeln(PortaLPT, '          VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',strTotal)));
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, ' Agradecemos a Preferencia. Volte Sempre! ');
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT,#27#109+ '');
   CloseFile(PortaLPT);
//--
// *** IMPRESSÃO DIRETA PARA PORTA LPT1 *** 2ª Via
if( (rdbVia2.Checked = True)or(rdbVia3.Checked = True) )then
  Begin
   AssignFile(PortaLPT, 'LPT2:');
   Rewrite(PortaLPT);
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '            AUTO PECAS PERFIL      Via: 2 ');
   Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco');
   Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568');
   Writeln(PortaLPT, '==========================================');
   if (ckbOrc.Checked = True) then
    begin
     Writeln(PortaLPT, ' N. Orcamento : ' +strNPedido);
    end
   else
    begin
     Writeln(PortaLPT, ' N. Pedido : ' +strNPedido);
    end;
   Writeln(PortaLPT, '  '+ strData);
   Writeln(PortaLPT, ' Vendedor : '+strVendedor);
   Writeln(PortaLPT, ' Cliente  : '+strDigiteCliente);
   Writeln(PortaLPT, ' Pagamento : '+strFPgto);
   Writeln(PortaLPT, '------------------------------------------');
   if (rdgTipoPedido.ItemIndex = 0) then
    begin
     Writeln(PortaLPT, '               B A L C A O');
    end
   else
    begin
     Writeln(PortaLPT, '               E N T R E G A');
    end;
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, 'Codigo \ Descricao');
   Writeln(PortaLPT, '            Qtde     V.Unit.   V.Total');
   Writeln(PortaLPT, '==========================================');
   dmBaseDados.tblRelVendas.FIRST;
   while (not dmBaseDados.tblRelVendas.Eof) do
    begin
     Writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+' '+dmBaseDados.tblRelVendasDescricao.AsString);
     Writeln(PortaLPT, '             '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
     +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
     +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
     dmBaseDados.tblRelVendas.Next;
    end;
   //--
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
   Writeln(PortaLPT, '          TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',strTotal)));
   Writeln(PortaLPT, '          VALOR BRUTO   :  '+(FormatCurr('###,##0.00',strVBruto)));
   Writeln(PortaLPT, '          DESCONTO      :  '+(FormatCurr('###,##0.00',strDesconto)) );
   Writeln(PortaLPT, '          VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',strTotal)));
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, ' Agradecemos a Preferencia. Volte Sempre! ');
   Writeln(PortaLPT, '==========================================');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT, '');
   Writeln(PortaLPT,#27#109+ '');
   CloseFile(PortaLPT);
  End;
//--
// *** IMPRESSÃO DIRETA PARA PORTA LPT1 *** 3ª Via
if( (rdbVia3.Checked = True) )then
  Begin
    AssignFile(PortaLPT, 'LPT2:');
    Rewrite(PortaLPT);
    Writeln(PortaLPT, '==========================================');
    Writeln(PortaLPT, '            AUTO PECAS PERFIL      Via: 3 ');    
    Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco');
    Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568');
    Writeln(PortaLPT, '==========================================');
    if (ckbOrc.Checked = True) then
     begin
      Writeln(PortaLPT, ' N. Orcamento : ' +strNPedido);
     end
    else
     begin
      Writeln(PortaLPT, ' N. Pedido : ' +strNPedido);
     end;
    Writeln(PortaLPT, '  '+ strData);
    Writeln(PortaLPT, ' Vendedor : '+strVendedor);
    Writeln(PortaLPT, ' Cliente  : '+strDigiteCliente);
    Writeln(PortaLPT, ' Pagamento : '+strFPgto);
   Writeln(PortaLPT, '------------------------------------------');
   if (rdgTipoPedido.ItemIndex = 0) then
    begin
     Writeln(PortaLPT, '               B A L C A O');
    end
   else
    begin
     Writeln(PortaLPT, '               E N T R E G A');
    end;
    Writeln(PortaLPT, '==========================================');
    Writeln(PortaLPT, 'Codigo \ Descricao');
    Writeln(PortaLPT, '            Qtde      V.Unit.    V.Total');
    Writeln(PortaLPT, '==========================================');
    dmBaseDados.tblRelVendas.FIRST;
    while (not dmBaseDados.tblRelVendas.Eof) do
     begin
      Writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+' '+dmBaseDados.tblRelVendasDescricao.AsString);
      Writeln(PortaLPT, '             '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
      +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
      +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
      dmBaseDados.tblRelVendas.Next;
     end;
    //--
    Writeln(PortaLPT, '==========================================');
    Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
    Writeln(PortaLPT, '          TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',strTotal)));
    Writeln(PortaLPT, '          VALOR BRUTO   :  '+(FormatCurr('###,##0.00',strVBruto)));
    Writeln(PortaLPT, '          DESCONTO      :  '+(FormatCurr('###,##0.00',strDesconto)) );
    Writeln(PortaLPT, '          VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',strTotal)));
    Writeln(PortaLPT, '==========================================');
    Writeln(PortaLPT, ' Agradecemos a Preferencia. Volte Sempre! ');
    Writeln(PortaLPT, '==========================================');
    Writeln(PortaLPT, '');
    Writeln(PortaLPT, '');
    Writeln(PortaLPT, '');
    Writeln(PortaLPT, '');
    Writeln(PortaLPT,#27#109+ '');
    CloseFile(PortaLPT);
   End;
//--
btnImprime.Enabled     := False;
btnGrava.Enabled       := False;
btnNovo.Enabled        := False;
btnExcluir.Enabled     := False;
btnRetornar.Enabled    := True;
btnReimpressao.Enabled := True;
dmBaseDados.tblSaida.IndexName := '';
intConfImp := 0;
end;

procedure TformVendasBalcao.btnLocalizarClick(Sender: TObject);
begin
formSeekClientes2.ShowModal;
dblkVendedor.SetFocus;
end;

procedure TformVendasBalcao.dbeDataVencimentoExit(Sender: TObject);
var DiasPagamento, PriD, SegD : TDateTime;
    Dia, Mes, Ano : Word;
    Dias : Double;
begin
dmBaseDados.tblSaida.Edit;
PriD := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
SegD := Date + 1;
DecodeDate(SegD,Ano,Mes,Dia);
DecodeDate(PriD,Ano,Mes,Dia);
DiasPagamento := PriD-SegD;
Dias          := DiasPagamento;
if (Dias > 28) then
 Begin
  Mensagem('Acima de 28 Dias , Redigitar a Data de Vencimento');
  dbeDataVencimento.SetFocus;
 end;
dmBaseDados.tblSaida.Post;
end;

procedure TformVendasBalcao.btnNovoClick(Sender: TObject);
var DataVen : TDateTime;
begin
DataVen := dmBaseDados.tblSaidaDataVencimento.AsDateTime;
dmBaseDados.tblSaida.Append;
dmBaseDados.tblSaidaNumeroRequisicao.AsString := strReqSaida;
dmBaseDados.tblSaidaDataLancamento.AsDateTime := Date;
dmBaseDados.tblSaidaCodigoMovimento.AsString  := 'V';
dmBaseDados.tblSaidaDataVencimento.AsDateTime := DataVen;
dmBaseDados.tblSaida.Post;
fldCodigoProduto.SetFocus;
btnExcluir.Enabled  := True;
btnRetornar.Enabled := False;
end;

procedure TformVendasBalcao.grdProdutosColExit(Sender: TObject);
var strU, strQ : Double;
begin
if (dmBaseDados.tblSaidaCodigoProduto.AsString = '999') then
 begin
  grdProdutos.ReadOnly := False;
  grdProdutos.Columns[0].ReadOnly := False;
  grdProdutos.Columns[1].ReadOnly := False;
  grdProdutos.Columns[2].ReadOnly := False;
  grdProdutos.Columns[3].ReadOnly := False;
  grdProdutos.Columns[4].ReadOnly := False;
  grdProdutos.Columns[5].ReadOnly := False;
  btnGrava.Enabled := True;
 end
else
 begin
  grdProdutos.ReadOnly := False;
  grdProdutos.Columns[0].ReadOnly := False;
  grdProdutos.Columns[1].ReadOnly := False;
  grdProdutos.Columns[2].ReadOnly := False;
  grdProdutos.Columns[3].ReadOnly := False;
  grdProdutos.Columns[4].ReadOnly := False;
  grdProdutos.Columns[5].ReadOnly := False;
 end;
if( (dmBaseDados.tblSaidaQuantidade.AsFloat <> strQ)
and (dmBaseDados.tblSaidaValorUnitario.AsFloat <> strU) )then
 begin
  dmBaseDados.tblSaida.Edit;
  dmBaseDados.tblSaidaValorTotal.AsFloat := dmBaseDados.tblSaidaValorUnitario.AsFloat * dmBaseDados.tblSaidaQuantidade.AsFloat;
  dmBaseDados.tblSaidaNumeroRequisicao.AsString := strReqSaida;
  dmBaseDados.tblSaidaDataVencimento.AsDateTime := Date;
  dmBaseDados.tblSaida.Post;
 end;
fltValorTotal := 0;
dmBaseDados.tblSaida.First;
while (not dmBaseDados.tblSaida.Eof) do
 begin
  fltValorTotal := fltValorTotal + dmBaseDados.tblSaidaValorTotal.AsFloat;
  dmBaseDados.tblSaida.Next;
 end;
dmBaseDados.tblSaida.EnableControls;
lblValorTotalVenda.Caption := FloatToStrF(fltValorTotal,ffCurrency,12,2);
end;

procedure TformVendasBalcao.grdProdutosKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 grdProdutos.Perform(WM_KEYDOWN, VK_TAB, 0);
end;

procedure TformVendasBalcao.dblbClienteKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 dblkVendedor.SetFocus;
end;

procedure TformVendasBalcao.dbeDataVencimentoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 fldCodigoProduto.SetFocus;
end;

procedure TformVendasBalcao.cmbTPagamentoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 fldCodigoProduto.SetFocus;
end;

procedure TformVendasBalcao.fldCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
  Begin
   if (fldCodigoProduto.Text = '') then
    begin
     formListaProdutos.ShowModal;
     fldQuantidade.SetFocus;
    end
   else
    begin
     fldQuantidade.SetFocus;
    end;
  End;
end;

procedure TformVendasBalcao.dblkVendedorKeyPress(Sender: TObject;var Key: Char);
begin
if (Key = #13) then
 dbeDataVencimento.SetFocus;
end;

procedure TformVendasBalcao.fldQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 btnNovo.SetFocus;
end;

procedure TformVendasBalcao.btnReimpressaoClick(Sender: TObject);
var strValor, strCodFamilia, strCodCategoria,
    strCodProduto, strDescricao, strUnidade,
    strFPgto, strDsc, strCdDesc, strDc, strRDesc: String;
    PortaLPT : TextFile;
begin
strNPedido  := strReqSaida;
dmBaseDados.tblFuncionarios.First;
dmBaseDados.tblFuncionarios.Locate('NomeFuncionario',dblkVendedor.Text,[loCaseInsensitive]);
strVendedor := IntToStr(dmBaseDados.tblFuncionariosCodigoFuncionario.AsInteger) +' '+ dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
strData     := 'Data: '+(DateToStr(Date))+'  '+'Hora: '+TimeToStr(Time);
strFPgto    := cmbTPagamento.Text;
// *** IMPRESSÃO DIRETA PARA PORTA LPT1 ***
  AssignFile(PortaLPT, 'LPT2:');
  Rewrite(PortaLPT);
  Writeln(PortaLPT, '==========================================');
  Writeln(PortaLPT, '            AUTO PECAS PERFIL  Reimpressao');
  Writeln(PortaLPT, 'Av. Analice Sakatauskas, 580 - V.N. Osasco');
  Writeln(PortaLPT, 'PABX: 3681-4459  NEXTEL: 30*54567/30*54568');
  Writeln(PortaLPT, '==========================================');
  if (ckbOrc.Checked = True) then
   begin
    Writeln(PortaLPT, ' N. Orcamento : ' +strNPedido);
   end
  else
   begin
    Writeln(PortaLPT, ' N. Pedido : ' +strNPedido);
   end;
  Writeln(PortaLPT, '  '+ strData);
  Writeln(PortaLPT, ' Vendedor : '+strVendedor);
  Writeln(PortaLPT, ' Cliente  : '+strDigiteCliente);
  Writeln(PortaLPT, ' Pagamento : '+strFPgto);
  Writeln(PortaLPT, '==========================================');
  Writeln(PortaLPT, 'Codigo \ Descricao');
  Writeln(PortaLPT, '              Qtde     V.Unit.   V.Total');
  Writeln(PortaLPT, '==========================================');
  dmBaseDados.tblRelVendas.FIRST;
  while (not dmBaseDados.tblRelVendas.Eof) do
   begin
    Writeln(PortaLPT, dmBaseDados.tblRelVendasRefFabricante.AsString+' '+dmBaseDados.tblRelVendasDescricao.AsString);
    Writeln(PortaLPT, '             '+dmBaseDados.tblRelVendasQuantidade.AsString + '    X    '
    +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorUnitario.AsCurrency))+ '    '
    +(FormatCurr('###,##0.00',dmBaseDados.tblRelVendasValorTotal.AsCurrency)));
    dmBaseDados.tblRelVendas.Next;
   end;
  //--
  Writeln(PortaLPT, '==========================================');
  Writeln(PortaLPT, '  Total de Itens :  '+ FloatToStr(strQtde));
  Writeln(PortaLPT, '          TOTAL A PAGAR :  '+(FormatCurr('###,##0.00',strTotal)));
  Writeln(PortaLPT, '          VALOR BRUTO   :  '+(FormatCurr('###,##0.00',strVBruto)));
  Writeln(PortaLPT, '          DESCONTO      :  '+(FormatCurr('###,##0.00',strDesconto)) );
  Writeln(PortaLPT, '          VALOR LIQUIDO :  '+(FormatCurr('###,##0.00',strTotal)));
  Writeln(PortaLPT, '==========================================');
  Writeln(PortaLPT, ' Agradecemos a Preferencia. Volte Sempre! ');
  Writeln(PortaLPT, '==========================================');
  Writeln(PortaLPT, '');
  Writeln(PortaLPT,#27#109+ ''); // Guilhotina
  CloseFile(PortaLPT);
// *** FIM DA IMPRESSÃO ***}
end;

procedure TformVendasBalcao.btnFiscalClick(Sender: TObject);
var strPgtSat: String;
begin
{
formSAT.Showmodal;
formSwedaSAT.ShowModal;
}

formFormaPagamento.cmbPgtoSAT.Visible  := True;
formFormaPagamento.Edpagamento.Visible := False;
formFormaPagamento.cmbPgtoSAT.ItemIndex := -1;
formFormaPagamento.ShowModal;

strPgtSat := Copy(cmbTPagamento.Text,1,2);

formCNPJCPF.ShowModal;

EmitirCupom(strDesconto, fltRecebido, strPgtSat, strCPF, '', '', '', '', '', '', '');

end;

procedure TformVendasBalcao.btnCancelaCupomClick(Sender: TObject);
begin
Barra.Panels[2].Text:='Cancela Documento';
StrPCopy(Comando,'*08');
MandaComando;
end;

procedure TformVendasBalcao.btnProdutosClick(Sender: TObject);
begin
formListaProdutos.ShowModal;
dmBaseDados.tblSaida.Edit;
dmBaseDados.tblSaidaCodCliFor.AsFloat := dmBaseDados.tblClientesCodigoCliente.AsFloat;
dmBaseDados.tblSaidaCodVen.AsFloat    := dmBaseDados.tblFuncionariosCodigoFuncionario.AsFloat;
dmBaseDados.tblSaidaVendedor.AsString := dmBaseDados.tblFuncionariosNomeFuncionario.AsString;
dmBaseDados.tblSaidaClienteFornecedor.AsString := dmBaseDados.tblClientesNomeCliente.AsString;
dmBaseDados.tblSaida.Post;
fldQuantidade.SetFocus;
end;

end.


