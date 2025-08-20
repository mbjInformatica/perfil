unit RotinasNFCe;

interface

uses Forms, windows, SysUtils, db;

// Declaração dos procedimentos
procedure EmitirCupom(fltDesconto: Double; fltRecebido: Double; strFormaPagamento: String; strCpfCnpj, strNome, strLgr, strNro, strCpl, strBairro, strMun, strUF: String);
procedure CancelarCupom;
procedure ReimprimirCupom;
                                   
// Declaração das funções
//function PedeSenha(strSenha : String): Boolean;

implementation

uses NFCe;



procedure EmitirCupom(fltDesconto: Double; fltRecebido: Double; strFormaPagamento: String; strCpfCnpj, strNome, strLgr, strNro, strCpl, strBairro, strMun, strUF: String);
begin
Desconto  := fltDesconto;
Recebido  := fltRecebido;
FormaPgto := strFormaPagamento;
CpfCnpj   := strCpfCnpj;
xNome     := strNome;
xLgr      := strLgr;
nro       := strNro;
xCpl      := strCpl;
xBairro   := strBairro;
xMun      := strMun;
UF        := strUF;
strBotao  := 'VENDA';
FormNfceAcbr.ShowModal;
strBotao  := '';
end;

procedure CancelarCupom;
begin
strBotao := 'CANCELAR';
FormNfceAcbr.ShowModal;
strBotao := '';
end;

procedure ReimprimirCupom;
begin
strBotao := 'REIMPRIMIR';
FormNfceAcbr.ShowModal;
strBotao := '';
end;

end.
