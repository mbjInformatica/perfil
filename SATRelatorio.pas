unit SATRelatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TISProgressBar, TISButton, TIGradientCaption,
  ComCtrls, StdCtrls, TIGradient;

type
  TformSATRelatorio = class(TForm)
    TIGradient1: TTIGradient;
    lblDtI: TLabel;
    lblDtF: TLabel;
    Data1: TDateTimePicker;
    Data2: TDateTimePicker;
    TIGradientCaption1: TTIGradientCaption;
    btnOK: TTISButton;
    btnImprimir: TTISButton;
    TISProgressBar1: TTISProgressBar;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formSATRelatorio: TformSATRelatorio;
                                                 
implementation
                                                            
uses ModuloDados, RelSAT;         


{$R *.dfm}


procedure TformSATRelatorio.FormShow(Sender: TObject);
begin
Data1.DateTime := Date;
Data2.DateTime := Date;
Data1.SetFocus;
end;

procedure TformSATRelatorio.btnOKClick(Sender: TObject);
begin                                   
dmBaseDados.tblCupomFiscal.Open;
dmBaseDados.tblCupomFiscal.Filter   := '('+'Data >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'Data <='+QuotedStr(DateToStr(Data2.Date))+')';
dmBaseDados.tblCupomFiscal.Filtered := True;
formRelSAT.lblInicio.Caption := 'Período de '+(DateToStr(Data1.Date))+ '  a  '+(DateToStr(Data2.Date));
formRelSAT.qrpSAT.Preview;
dmBaseDados.tblCupomFiscal.Filter   := '';
dmBaseDados.tblCupomFiscal.Filtered := False;
dmBaseDados.tblCupomFiscal.Close;
Close;
end;

procedure TformSATRelatorio.btnImprimirClick(Sender: TObject);
begin
Close;
end;

end.
