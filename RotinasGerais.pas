unit RotinasGerais;

interface

uses Forms, Windows, SysUtils, db;

// Declaração dos procedimentos
procedure InicioTabela;
procedure FimTabela;
procedure Mensagem(strTexto: string);

// Declaração das funções
function Excluir: integer;
function Confirma(strTexto: string): integer;
function MostraData(dtData: TDateTime): string;
Function LRPad(Str : String; Size : integer; Pad : char; LorR : char):string;
function ZeraAutoInc(Tabela: TFileName; Inicio: Longint): Boolean;
function BuscarETroca(Texto, Buscar, Trocar : string) : string;
function Arredondar(Valor: Double; Dec: Integer): Double;
function AlteraLinhaTxt(Txt: AnsiString; Linha: Integer; NovoTexto: string): Boolean;
function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
function PedeSenha(strSenha : String): Boolean;


implementation

uses Classes, SenhaDiversos;


// Rotina para apresentar uma caixa de mensagem.
procedure Mensagem(strTexto: string);
begin
Application.MessageBox(pChar(strTexto),'Mensagem',mb_ok + mb_IconInformation);
end;

// Rotina para apresentar mensagem de início dos registros.
procedure InicioTabela;
begin
Mensagem('Ínício dos registros')
end;

// Rotina para apresentar mensagem de fim dos registros.
procedure FimTabela;
begin
Mensagem('Fim dos registros')
end;

// Função para pedir confirmação da exclusão de um registro.
function Excluir: integer;
begin
   Result := Application.MessageBox('Deseja excluir esse registro ?','Exclusão',mb_YesNo+mb_DefButton2+mb_IconQuestion);
   end;

   // Função para pedir confirmação de uma operação.
   function Confirma(strTexto: string): integer;
   begin
      result :=
   Application.MessageBox(PChar(strTexto),'Confirmação',mb_YesNo+mb_DefButton2+mb_IconQuestion);
   end;

   // Função para apresentação de uma data no formato 'Dia da semana - Dia do mês/Mês/Ano'.
   function MostraData(dtData: TDateTime) : string;
   var
      intDiaSemana: integer;
      strDiaSemana: string;
   begin
      intdiaSemana := DayOfweek(dtData);
      case intDiaSemana of
          1: strDiaSemana := 'Domingo - ';
          2: strDiaSemana := 'Segunda feira - ';
          3: strDiaSemana := 'Terça feira - ';
          4: strDiaSemana := 'Quarta feira - ';
          5: strDiaSemana := 'Quinta feira - ';
          6: strDiaSemana := 'Sexta feira - ';
          7: strDiaSemana := 'Sábado - ';
       end;
       Result := strDiaSemana+DateTostr(dtData);
   end;


function ZeraAutoInc(Tabela: TFileName; Inicio: Longint): Boolean;
begin
with TFileStream.Create(Tabela, fmOpenReadWrite) do
 Result := (Seek($49, soFromBeginning) = $49) and (Write(Inicio, 4) = 4);
end;

Function LRPad(Str : String; Size : integer; Pad : char; LorR : char):string;
var
i, cont : integer;
s : string;
begin
cont := Length(Str);
s := '';
if upCase(LorR) = 'L' then
begin
for i:=1 to Size - cont do
s := s + Pad;
s := s + Str;
end else begin
for i:=1 to Size - cont do
s := s + Pad;
s := Str + s;
end;
LRPad := copy(s,1,size);
end;

function BuscarETroca(Texto, Buscar, Trocar : string) : string;
var n : integer;
begin
for n := 1 to length(Texto) do begin if Copy(Texto,n,1) = Buscar then begin
      Delete(Texto,n,1);
      Insert(Trocar, Texto,n);
      end; end;
Result := Texto;
//Showmessage(Texto);
end;

function Arredondar(Valor: Double; Dec: Integer): Double;
var valor1, Numero1, Numero2, Numero3: Double;
begin
Valor1:=Exp(Ln(10) * (Dec + 1));
Numero1:=Int(Valor * Valor1);
Numero2:=(Numero1 / 10);
Numero3:=Round(Numero2);
Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

function AlteraLinhaTxt(Txt: AnsiString; Linha: Integer; NovoTexto: string): Boolean;
var Arquivo : TStrings;
begin
        Result := false;
        Arquivo := TStringList.Create;
        try
                Arquivo.LoadFromFile(Txt);
                if (Linha > Arquivo.Count+1) then
                        Exit;
                Arquivo[Linha] := NovoTexto;
                Arquivo.SaveToFile(Txt);
                Result := true;
        except
        end;
        Arquivo.Free;
end;

function UltimoDiaMes(Mdt: TDateTime) : TDateTime;
//retorna o ultimo dia o mes, de uma data fornecida
var ano, mes, dia : word;
    mDtTemp : TDateTime;
begin
Decodedate(mDt, ano, mes, dia);
mDtTemp := (mDt - dia) + 33;
Decodedate(mDtTemp, ano, mes, dia);
Result := mDtTemp - dia;
end;

function PedeSenha(strSenha : String): Boolean;
begin
 SENHA := strSenha;
 formSenhaDiversos.ShowModal;

 Result := stsEst;
end;

end.
