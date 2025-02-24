unit ECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Mask, StdCtrls, Buttons;

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
  TformECF = class(TForm)
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    Tempo: TMaskEdit;
    Barra: TStatusBar;
    Edpagamento: TComboBox;
    LabelPorta: TLabel;
    GroupBox1: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    EdHoraz: TMaskEdit;
    EdDataZ: TMaskEdit;
    CB_HVerao: TCheckBox;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    btnRetornar: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        procedure CapturaStatus;
        function MensagemError(CodError:string):String;
        Function MandaComando:Boolean;
        function ObtemResposta:Boolean;
  end;

var
  formECF: TformECF;
  Comando  : array[0..512] of Char;  // Buffer de transmissao
  Resposta :array[0..1200] of Char;  // Buffer de recepcao
  Conteudo: RespostaECF;        // Retorno dos comandos (exceto status)
  Status: StatusECF;            // Retorno dos comandos de Status
  LeituraOnLine:Online;         // Retorno da captura de texto online
  retorno:longint;              // Retorno das funcoes ECFWriteSerial e ECFReadSerial
  pagamento:Modal;              // legendas dos meios de pagamento
  StatusDocumento:TotalVenda;   // Totais do cupom fiscal
  StatusModelo:Tipo_I1;         // Dados do modelo de ECF + versão etc
  StatusMFD:Tipo_S1;            // Dados da MFD: serie, capacidade etc
  aliquota_icms, ALiquota_Iss:aicms; // Aliquotas de icms
  Header:Base;
  capacidadeb,consumob, consumop: real; // variaveis para apurar o % de consumo da MFD
{
  Function ECFOpenSerial(Numero,Velocidade,Timeout,log, mostra:Integer; mensagem:string): longint; Stdcall; External 'SerialMFD.dll';
  Function ECFWriteSerial(Comando:Pchar;Tamanho:Longint;mensagem:String):longint; Stdcall;External 'SerialMFD.dll';
  Function ECFReadSerial(Status:Pchar;Tamanho:longint;mensagem:String):longint; Stdcall;External 'SerialMFD.dll';
  procedure ECFCloseSerial; Stdcall;External 'SerialMFD.dll';
}
implementation
 uses aviso, TextoOnline;

{$R *.dfm}
function TformECF.MandaComando:Boolean;
begin
{
        retorno:= -3;
        while retorno = -3 do
        begin
                retorno := ECFWriteSerial(Comando,Strlen(Comando),'serial');
                if retorno = -3 then ShowMessage('Aguarde ...');
        end;

        if retorno <> 0 then
        begin
                ShowMessage('Erro no envio do comando');
                Result:=False;
        end
        else Result:=ObtemResposta();
}
end;

function TformECF.ObtemResposta:Boolean;
var capturatexto:boolean;
begin
{
        Resposta:=#0; capturatexto:=false;
        CopyMemory(@Conteudo,@Resposta,94);
        CopyMemory(@Header,@Resposta,4);
        CopyMemory(@Status,@Resposta,515);
        while true do
        begin
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
                                if capturatexto then begin
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
        end;
        FormAviso.Close;
        FormAviso.Refresh;

        ProgressBar1.visible:=false;
        if Header.Tipo='+' then Result := True
        else  begin
                showMessage('Erro: '+ Conteudo.Mensagem);
                ObtemResposta := False;
        end;

  }
end;

function TformECF.MensagemError(CodError:string):String;
var cod:integer;
begin
{
        cod := StrToInt(CodError);

        case Cod of
        00: MensagemError:=CodError+'-'+'Comando efetuado com sucesso!';
        02: MensagemError:=CodError+'-'+'Não há documento para cancelar.';
        04: MensagemError:=CodError+'-'+'Pagamento não finalizado.';
        06: MensagemError:=CodError+'-'+'Indicado Item inválido.';
        07: MensagemError:=CodError+'-'+'Item já cancelado.';
        08: MensagemError:=CodError+'-'+'Apurado total igual a zero.';
        15: MensagemError:=CodError+'-'+'Cancelamento de acréscimo no subtotal';
        21: MensagemError:=CodError+'-'+'Alíquota não programada.';
        23: MensagemError:=CodError+'-'+'Erro de Sintaxe!';
        31: MensagemError:=CodError+'-'+'Faixa inválida!';
        42: MensagemError:=CodError+'-'+'Excede o valor do item.';
        51: MensagemError:=CodError+'-'+'Não foi possivel acumulação em um dos totalizadores';
        53: MensagemError:=CodError+'-'+'Impossibilita o cancelamento.';
        56: MensagemError:=CodError+'-'+'Iniciando Intervenção Técnica.';
        57: MensagemError:=CodError+'-'+'Encerrando Intervenção Técnica.';
        58: MensagemError:=CodError+'-'+'Comando ou operação inválida!';
        59: MensagemError:=CodError+'-'+'Dia encerrado!';
        60: MensagemError:=CodError+'-'+'É necessário emitir Redução Z!';
        61: MensagemError:=CodError+'-'+'O ECF está em Modo Intervenção Técnica!';
        124: MensagemError:=CodError+'-'+'Tampa Aberta!';
        125: MensagemError:=CodError+'-'+'Sem papel!';
        126: MensagemError:=CodError+'-'+'Avançando papel!';
        127: MensagemError:=CodError+'-'+'Substituir bobina!';
        134: MensagemError:=CodError+'-'+'Transmissão via porta serial abortada.';
        216: MensagemError:=CodError+'-'+'Programar o relógio.';
        end;
}
end;

procedure TformECF.CapturaStatus;
var i:integer; // variaveis para loop

begin
{
        Barra.Panels[2].Text:='Capturando informações do modelo';
        StrPCopy(Comando,'*34|I1');
        if not MandaComando then exit;
       { memo1.Lines.Add('Marca: '+StatusModelo.marca);
        memo1.Lines.Add('Modelo: '+StatusModelo.modelo);
        memo1.Lines.Add('Tipo: '+StatusModelo.tipo);
        memo1.Lines.Add('No. de Série: '+StatusModelo.Serie);
        memo1.Lines.Add('Firmware: '+StatusModelo.firmware);
        memo1.Lines.Add('Protocolo: '+StatusModelo.protocolo);

        memo1.Lines.Add(' ');        }
 {
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

        for i:=1 to 20 do EdPagamento.Items.Add(FormatFloat('00',i)+'-'+Pagamento[i-1]); // captura os meios de pagamento


        // Obtem as alíquotas programadas para ICMS
        Barra.Panels[2].Text:='Capturando as alíquotas de ICMS';
        StrPCopy(Comando,'*34|D4');
        if not MandaComando then exit;
        try
                for i:=1 to 15 do
                begin
                    //    EdTaxa2.Items.Add('T'+FormatFloat('00.00',StrtoFloat(aliquota_ICMS[i-1])/100)+'%'); // captura os meios de pagamento
                end
        except
        end;

        // Obtem as alíquotas programadas para ISS
        StrPCopy(Comando,'*34|E4');
        if not MandaComando then exit;
        try
                for i:=1 to 15 do
                begin
                     //   EdTaxa2.Items.Add('S'+FormatFloat('00.00',StrtoFloat(aliquota_ISS[i-1])/100)+'%'); // captura os meios de pagamento
                end
        except
        end;
}
end;

procedure TformECF.SpeedButton2Click(Sender: TObject);
var hverao:char;
begin
{
  if CB_HVerao.Checked then hverao:='v'
  else hverao:=#0;
   Barra.Panels[2].Text:='Redução Z';
   StrPCopy(Comando,'*16|'+Eddataz.text+'|'+EdHoraz.Text+hverao);
   MandaComando;
}
end;

procedure TformECF.FormShow(Sender: TObject);
var    velocidade,tt, numporta: Integer;
begin
{
 EdDataZ.Text:=FormatDateTime('dd/mm/yyyy',Now);
 edHoraZ.Text:= FormatDateTime('hh:mm:ss',Now);
numporta   := 1;                    
Velocidade := 9600;
ECFCloseSerial;
TT := 10;
{
 if ECFOpenSerial(numporta,velocidade,TT,1,1,'serial') <> 0 then
  begin
   ShowMEssage('Erro na Abertura da Porta!');
   LabelPorta.Caption:=' ';
  end
 else
  begin
   CapturaStatus;
  end;
}

end;

procedure TformECF.SpeedButton1Click(Sender: TObject);
begin
{
  Barra.Panels[2].Text:='Leitura X';
  StrPCopy(Comando,'*15');
  MandaComando;
}
end;

procedure TformECF.btnRetornarClick(Sender: TObject);
begin
Close;
end;

end.
