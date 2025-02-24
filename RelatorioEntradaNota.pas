unit RelatorioEntradaNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls;

type
  TformRelEntradaNota = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qlblFornecedor: TQRLabel;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    sysPagina: TQRSysData;
    QRLabel8: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRelEntradaNota: TformRelEntradaNota;

implementation
  uses ModuloDados, DB;
{$R *.dfm}

procedure TformRelEntradaNota.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var    Fornecedor : String;
begin
    dmBaseDados.tblFornecedores.Locate('CodigoFornecedor',dmBaseDados.tblNotaFiscalCodigoFornecedor.AsString,[]);
    Fornecedor := dmBaseDados.tblFornecedoresNomeFantasia.AsString;
    qlblFornecedor.Caption := Fornecedor;
end;

end.
