unit Contabilidade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, QuickRpt, Qrctrls, ExtCtrls, ComCtrls;

type
  TfrmContabilidade = class(TForm)
    Data1  : TDateTimePicker;
    lblDtI : TLabel;
    lblDtF : TLabel;
    Data2  : TDateTimePicker;
    btGera : TBitBtn;
    procedure btnConstruindoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btGeraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContabilidade: TfrmContabilidade;

implementation

uses ModuloDados, RelContabilidade;

{$R *.DFM}



procedure TfrmContabilidade.btnConstruindoClick(Sender: TObject);
begin
close;
end;

procedure TfrmContabilidade.BitBtn1Click(Sender: TObject);
begin

close;

end;

procedure TfrmContabilidade.btGeraClick(Sender: TObject);
begin

     dmBaseDados.tblANotaFiscal.Open;
     dmBaseDados.tblANotaFiscal.Filter   := '('+'DataEmissao >='+QuotedStr(DateToStr(Data1.Date))+')and('+ 'DataEmissao <='+QuotedStr(DateToStr(Data2.Date))+')';
     dmBaseDados.tblANotaFiscal.Filtered := True;
     SHORTDATEFORMAT := 'ddmm';
     frmRelContabilidade.qrpContabilidade.Preview;
     SHORTDATEFORMAT := 'dd/mm/yyyy';
     dmBaseDados.tblANotaFiscal.Filter   := '';
     dmBaseDados.tblANotaFiscal.Filtered := False;
     dmBaseDados.tblANotaFiscal.Close;
end;

procedure TfrmContabilidade.FormCreate(Sender: TObject);
begin
Screen.Cursor := CrHourGlass;
Data1.Date    := Date;
Data2.Date    := Date;
Screen.Cursor := CrDefault;
end;

end.
