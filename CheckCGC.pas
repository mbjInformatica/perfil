unit CheckCGC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons;

type
  TformCNPJCPF = class(TForm)
    Label1: TLabel;
    eCGC: TMaskEdit;
    Memo1: TMemo;
    btOK: TButton;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btSairClick(Sender: TObject);
    procedure eCGCExit(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
    procedure eCGCChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Function FormataCGC(Numero: String):String;
    Function Modulo11CGC(Numero: string):String;
    Function Modulo11CPF(Numero: string):String;
    Function ValidaCGC(Numero: string):Boolean;
    Function ValidaCPF(Numero: string):Boolean;
  public
    { Public declarations }
  end;

var
  formCNPJCPF: TformCNPJCPF;
  strCPF : String;
implementation
uses Venda;

{$R *.DFM}

Function TformCNPJCPF.FormataCGC(Numero: String):String;
begin
  if length(Numero)=11 then
   Result:=copy(numero,1,3)+'.'+copy(numero,4,3)+'.'+copy(numero,7,3)+'-'+copy(numero,10,2);
  if length(Numero)=14 then
   Result:=copy(Numero,1,2)+'.'+copy(numero,3,3)+'.'+copy(numero,6,3)+'/'+copy(numero,9,4)+'-'+copy(numero,13,2);
end;

Function TformCNPJCPF.Modulo11CGC(Numero: String):String;
var
aPeso: array[1..20] of integer;
aNum:  array[1..20] of integer;
Total,nX,nC,Dv: integer;
begin
  nC:=2;
  Total:=0;
  for nX:=length(Numero) downto 1 do
   begin
    aPeso[nX]:=nC;
    nC:=nC+1;
    if nC > 9 then nC:=2;
   end;
  for nX:=1 to length(Numero) do
   begin
    aNum[nX]:=strtoint(copy(Numero,nX,1));
    Total:=Total+(aNum[nX]*aPeso[nX]);
//  memo1.Lines.Add(inttostr(aNum[nX])+' Peso: '+inttostr(aPeso[nX]))
   end;
  Dv:=(11-(Total mod 11));
  if Dv > 9 then Dv:=0;
  Result:=inttostr(Dv)
end;

Function TformCNPJCPF.ValidaCGC(Numero: String):Boolean;
var
Dv1,Dv2: string;
begin
  strCPF := '';
  Memo1.Lines.Clear;
  Memo1.Lines.Add('CGC Digitado: '+formataCGC(Numero));
  Dv1:=Modulo11CGC(copy(Numero,1,12));
  Memo1.Lines.Add('1º Dígito Verificador: '+Dv1);
  Dv2:=Modulo11CGC(copy(Numero,1,12)+Dv1);
  Memo1.Lines.Add('2º Dígito Verificador: '+Dv2);
  Memo1.Lines.Add('***** RESULTADO *****');
  Memo1.Lines.Add(' ');
  if (Dv1<>copy(Numero,13,1)) or (Dv2<>copy(Numero,14,1)) then
    begin
     Memo1.Lines.Add('CGC INVÁLIDO ');
     Memo1.Lines.Add('CGC Correto: '+formataCGC(COPY(Numero,1,12)+Dv1+Dv2));
     Result:=True;
    end
  else
    begin
     Memo1.Lines.Add('CGC VÁLIDO ');
     Result:=False;
     if(Application.MessageBox('Deseja imprimir o CGC/CPF do consumidor?','Tem Certeza??',MB_YESNO)) = IDYES then
      begin
       strCPF := eCGC.Text;
       close;
      end
     else
      begin
       strCPF := '';
       close;
      end;
  end;
end;

Function TformCNPJCPF.Modulo11CPF(Numero: String):String;
var
aPeso: array[1..20] of integer;
aNum:  array[1..20] of integer;
Total,nX,nC,Dv: integer;
begin
  nC:=2;
  Total:=0;
  for nX:=length(Numero) downto 1 do
   begin
    aPeso[nX]:=nC;
    nC:=nC+1;
   end;
  for nX:=1 to length(Numero) do
   begin
    aNum[nX]:=strtoint(copy(Numero,nX,1));
    Total:=Total+(aNum[nX]*aPeso[nX]);
//  memo1.Lines.Add(inttostr(aNum[nX])+' Peso: '+inttostr(aPeso[nX]))
   end;
  Dv:=(11-(Total mod 11));
  if Dv > 9 then Dv:=0;
  Result:=inttostr(Dv);
end;

Function TformCNPJCPF.ValidaCPF(Numero: String):Boolean;
var
Dv1,Dv2: string;
begin
  strCPF := '';
  Memo1.Lines.Clear;
  Memo1.Lines.Add('CPF Digitado: '+FormataCGC(Numero));
  Dv1:=Modulo11CPF(copy(Numero,1,9));
  Memo1.Lines.Add('1º Dígito Verificador: '+Dv1);
  Dv2:=Modulo11CPF(copy(Numero,1,9)+Dv1);
  Memo1.Lines.Add('2º Dígito Verificador: '+Dv2);
  Memo1.Lines.Add('***** RESULTADO *****');
  Memo1.Lines.Add(' ');
  if (Dv1<>copy(Numero,10,1)) or (Dv2<>copy(Numero,11,1)) then
    begin
     Memo1.Lines.Add('CPF INVÁLIDO ');
     Memo1.Lines.Add('CPF Correto: '+FormataCGC(COPY(Numero,1,9)+Dv1+Dv2));
     Result:=True;
    end
  else
    begin
     Memo1.Lines.Add('***** CPF VÁLIDO ');
     Result:=False;
     if(Application.MessageBox('Deseja imprimir o CGC/CPF do consumidor?','Tem Certeza??',MB_YESNO)) = IDYES then
      begin
       strCPF := eCGC.Text;
       close;
      end
     else
      begin
       strCPF := '';
       close;
      end;
  end;
end;

procedure TformCNPJCPF.btOKClick(Sender: TObject);
begin
  if eCGC.Text = '' then
   begin
    strCPF := '';
    close;
   end;
   if length(eCGC.Text)=11 then
     ValidaCPF(trim(eCGC.text))
   else
     ValidaCGC(trim(eCGC.text));
   eCGC.SetFocus;
end;

procedure TformCNPJCPF.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
   begin
   key:=#0;
   SelectNext(ActiveControl,True,True);
  end;
end;

procedure TformCNPJCPF.btSairClick(Sender: TObject);
begin
  Close;
end;

procedure TformCNPJCPF.eCGCExit(Sender: TObject);
begin
  if eCGC.Text = '' then
   begin
    strCPF := '';
    close;
   end;
   case length(eCGC.text) of
   0:close;
   11:;
   14:;
   else
      Memo1.Lines.Clear;
      Memo1.Lines.Add('NÚMERO DIGITADO NÃO É VÁLIDO');
      Memo1.Lines.Add('O tamanho deve ser de 11 dígitos ou 14.');
      Memo1.Lines.Add('Digite um número válido para sair.');
      eCGC.SetFocus;
   end;
end;

procedure TformCNPJCPF.Memo1DblClick(Sender: TObject);
begin
  //Memo1.Lines.Clear;
 // Memo1.Lines.Add('Sobre o Programa:');
  //Memo1.Lines.Add('Autor: Cirilo J. Veloso');
 // Memo1.Lines.Add('Email: cjveloso@ig.com.br');
 // Memo1.Lines.Add('Revisao: Criado em Fev/2000');
end;

procedure TformCNPJCPF.eCGCChange(Sender: TObject);
begin
btok.Default := True;
end;

procedure TformCNPJCPF.SpeedButton1Click(Sender: TObject);
begin
eCGC.Text := '';
end;

procedure TformCNPJCPF.SpeedButton2Click(Sender: TObject);
begin
  if eCGC.Text = '' then
   begin
    strCPF := '';
    close;
   end;
   if length(eCGC.Text)=11 then
     ValidaCPF(trim(eCGC.text))
   else
     ValidaCGC(trim(eCGC.text));
   eCGC.SetFocus;
end;

procedure TformCNPJCPF.FormShow(Sender: TObject);
begin
eCGC.Text  := '';
Memo1.Text := '';
strCPF     := '';
eCGC.SetFocus;
end;

procedure TformCNPJCPF.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
