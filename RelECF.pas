unit RelECF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, QRExport;

type
  TFormRelECF = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    procedure QuickRep1AfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRelECF: TFormRelECF;

implementation
uses ModuloDados ;
{$R *.dfm}

procedure TFormRelECF.QuickRep1AfterPreview(Sender: TObject);
var pedido: string;
begin
 pedido := dmBaseDados.tblECFPedido.AsString;
 QuickRep1.ExportToFilter(TQRAsciiExportFilter.Create('C:\00000001.ORC'));
 QuickRep1.ExportToFilter(TQRAsciiExportFilter.Create('C:\00000001.ORC'));

end;

end.
