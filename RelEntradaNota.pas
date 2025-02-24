unit RelEntradaNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TformEntradarel = class(TForm)
    lblDtI: TLabel;
    Data1: TDateTimePicker;
    lblDtF: TLabel;
    Data2: TDateTimePicker;
    btnOK: TBitBtn;
    btnCancela: TBitBtn;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEntradarel: TformEntradarel;

implementation
 uses ModuloDados , RelatorioEntradaNota;
{$R *.dfm}

procedure TformEntradarel.btnOKClick(Sender: TObject);
begin
         dmBaseDados.tblNotaFiscal.Filter     := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
         dmBaseDados.tblNotaFiscal.Filtered   := True;
         formRelEntradaNota.QuickRep1.Preview;
         
end;

procedure TformEntradarel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dmBaseDados.tblNotaFiscal.Filter:= '';
     dmBaseDados.tblNotaFiscal.Filtered := False;
     dmBaseDados.tblNotaFiscal.Close;
end;

end.
