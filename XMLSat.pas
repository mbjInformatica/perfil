unit XMLSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, db, TISButton, ShellAPI, ComCtrls, StdCtrls, TIGradient,
  TIGradientCaption;

type
  TformXMLSat = class(TForm)
    btnGerar: TTISButton;
    Label1: TLabel;
    Label2: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    TIGradient1: TTIGradient;
    btnImprimir: TTISButton;
    TIGradientCaption1: TTIGradientCaption;
    procedure FormShow(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formXMLSat: TformXMLSat;

implementation

uses ModuloDados;


{$R *.dfm}


procedure TformXMLSat.FormShow(Sender: TObject);
begin
Data1.Date := Date;
Data2.Date := Date;
Data1.SetFocus;
end;

procedure TformXMLSat.btnGerarClick(Sender: TObject);
var strPasta, strData1, strData2,
    Origem, Destino, strNomeArq,
    Temp, LinhadeComando, Arq, Dest : String;
begin                                               
if (Application.MessageBox('ATENÇÃO! Certifique-se do período selecionado!','ATENÇÃO!',MB_OKCANCEL) = IDCANCEL) then
 begin
  Abort;
 end;                                    
dmBaseDados.tblCupomFiscal.Open;
dmBaseDados.tblCupomFiscal.Filter   := '('+'Data >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'Data <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblCupomFiscal.Filtered := True;
SHORTDATEFORMAT := 'dd-mm-yyyy';
strData1 := DateToStr(Data1.Date);
strData2 := DateToStr(Data2.Date);
strPasta := strData1 +'a'+ strData2;
SHORTDATEFORMAT := 'dd/mm/yyyy';
if (not DirectoryExists('F:\NFCe\Contabilidade\' + strPasta)) then
 begin
  ForceDirectories('F:\NFCe\Contabilidade\' + strPasta);
 end;
dmBaseDados.tblCupomFiscal.First;
while (not dmBaseDados.tblCupomFiscal.Eof) do
  Begin
   Origem     := dmBaseDados.tblCupomFiscalCaminhoXML.AsString;
   strNomeArq := Copy(Origem,20,56);
   Destino    := 'F:\NFCe\Contabilidade\' + strPasta +'\' + strNomeArq;
   CopyFile(PChar(Origem), PChar(Destino), False);
   dmBaseDados.tblCupomFiscal.Next;                  
  End;
ShowMessage('Arquivos copiados com sucesso para pasta: F:\NFe\Contabilidade\' + strPasta );
if (Application.MessageBox('Deseja compactar a pasta gerada?','ATENÇÃO!',MB_YESNO) = IDYES) then
 begin
  Temp           := ChangeFileExt('F:\NFCe\Contabilidade\' + strPasta,'.rar');
  LinhadeComando := 'C:\Arquivos de programas\WinRAR\WINRAR.EXE a "'  +Temp  +'" "'  +'F:\NFCe\Contabilidade\'  + strPasta  +'"';
  Try
   WinExec(Pchar(LinhadeComando),1);
  Except
  End;
  {Arq  := 'F:\NFe\Contabilidade\' + strPasta; //Coloque o arquivo que deseja
  Dest := 'F:\NFe\Contabilidade\';
  Temp := strPasta+'.rar';  //Isto será o nome do arquivo, você pode colocar também um edit
  SaveDialog1.Filename   := Temp;
  SaveDialog1.InitialDir := Dest;
  Temp := SaveDialog1.FileName;
  ShellExecute(0,nil,'Winrar.exe',  PChar('a -ep -ibck "' +Temp+'"'+Arq), nil, sw_show);
  Exit; }
 end;
dmBaseDados.tblCupomFiscal.Filter   := '';
dmBaseDados.tblCupomFiscal.Filtered := False;
dmBaseDados.tblCupomFiscal.Close;
Close;
end;

procedure TformXMLSat.btnImprimirClick(Sender: TObject);
begin
Close;
end;

end.
